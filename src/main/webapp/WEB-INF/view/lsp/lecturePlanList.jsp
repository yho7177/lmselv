<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.userType ne 'A' and 'D'}">
	<c:redirect url="/dashboard/dashboard.do" />
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Job Korea :: 공통 코드 관리</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->
<script type="text/javascript" charset="utf-8"
	src="${CTX_PATH}/js/bootstrap-datepicker.js"></script>
<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger {
	cursor: pointer;
}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker {
	cursor: pointer;
}

.ui-datepicker-trigger {
	visibility: hidden;
}
</style>

<script type="text/javascript">
	// 그룹코드 페이징 설정
	var pageSizeComnGrpCod = 5;
	var pageBlockSizeComnGrpCod = 5;
	
	/** OnLoad event -> html의 화면은 뿌려주고 난 다음 그순간에 실행되는 것 */ 
	$(function() {

		//모든 datepicker에 대한 공통 옵션 설정
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        });

        //input을 datepicker로 선언
        $("#ci_start").datepicker();                    
        $("#ci_end").datepicker();
        
        //From의 초기값을 오늘 날짜로 설정
        $('#ci_start').datepicker('setDate', '-1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        //To의 초기값을 내일로 설정
        $('#ci_end').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        
		
		// 강의 조회
		fListLmg();
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
		
		$('a[name=btn]').click(function(e) {
			fListLmg();
		});
	});
	

	/** 버튼 이벤트 등록 */
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSaveGrpCod' :
					fSaveLmg();
					break;
				case 'btnDeleteGrpCod' :
					fDeleteLmg();
					break;
				case 'btnSearchGrpcod':
					fListLmg();
					break;
				case 'btnCloseGrpCod' :
				case 'btnCloseDtlCod' :
					gfCloseModal();
					break;
			}
		});
	}
	
	
	/** 강의 폼 초기화 */
	function fInitLmg(object) {
		$("#ci_no").focus();
		if( object == "" || object == null || object == undefined) {
			$("#ci_no").val("");
			$("#loginID").val("");
			$("#r_no").val("");
			$("#ci_type").val("");
			$("#ci_name").val("");
			$("#ci_content").val("");
			$("#ci_start").val("");
			$("#ci_end").val("");
			$("#ci_goal").val("");
			$("#ci_attend").val("");
			$("#ci_plan").val("");
			$("#ci_limit").val("");
			$("#loginId").attr("readonly", true);
			$("#ci_no").attr("readonly", false);
			$("#ci_no").css("background", "#FFFFFF");
			$("#ci_no").focus();
			$("#btnDeleteGrpCod").hide();
			
		} else {
			
			$("#ci_no").val(object.ci_no);
			$("#loginID").val(object.loginID);
			$("#r_no").val(object.r_no);
			$("#ci_type").val(object.ci_type);
			$("#ci_name").val(object.ci_name);
			$("#ci_content").val(object.ci_content);
			$("#ci_start").val(object.ci_start);
			$("#ci_end").val(object.ci_end);
			$("#ci_goal").val(object.ci_goal);
			$("#ci_attend").val(object.ci_attend);
			$("#ci_plan").val(object.ci_plan);
			$("#ci_limit").val(object.ci_limit);
			$("#loginID").attr("readonly", true);
			$("#ci_no").attr("readonly", true);
			$("#ci_no").css("background", "#F5F5F5");
			$("#ci_no").focus();
			$("#btnDeleteGrpCod").hide();
			
			if(object.tmp_fld_01>0){
				$("#btnDeleteGrpCod").hide();
			}else{
				$("#btnDeleteGrpCod").show();	
			}
		}
	}
	
	
	
	/** 강의 저장 validation */
	function fValidateLmg() {

		var chk = checkNotEmpty(
				[
						[ "ci_no", "강의 번호를 입력해 주세요." ]
					,	[ "ci_name", "강의 명을 입력해 주세요" ]
					,	[ "ci_content", "강의 설명을 입력해 주세요." ]
				]
		);

		if (!chk) {
			return;
		}

		return true;  //alert을 한번도 안띄웠을경우에 true로 넘어옴
	}
	
	
	
	/** 강의 모달 실행 */
	function fPopModalLmg(ci_no) {
		
		// 신규 저장
		if (ci_no == null || ci_no=="") {
			//swal("여기도 찍어봅세  ");
			// Tranjection type 설정
			$("#action").val("I");
			
			// 강의 폼 초기화
			fInitLmg();
			
			// 모달 팝업
			gfModalPop("#layer1");

		// 수정 저장
		} else {
			// Tranjection type 설정
			$("#action").val("U");
			
			// 강의 단건 조회
			fSelectLmg(ci_no);
		}
	}
	
	
	/** 강의계획서 및 조회 */
	function fListLmg(currentPage) {
		
		currentPage = currentPage || 1; //처음에는 undefinde의 값을 가지고있음 . 하지만 값을 넣는 순간 그 값을 가진다.
		
		var sname = $('#sname');
		// var sname = $('#searchKey').val(); 옛날 방식
        var searchKey = document.getElementById("searchKey");
		var oname = searchKey.options[searchKey.selectedIndex].value;
		var title = $("#title").val();
		var from_date = $("#from_date").val();
		var to_date = $("#to_date").val();
// 		alert("searchKey >>>" + searchKey + "\noname >>>" + oname + "\nfrom_date >>>" + from_date + "\nto_date >>>" + to_date + "\nsname >>>" + sname.val());
		
		
		console.log("currentPage : " + currentPage);
		
		var param = {	
					sname : sname.val()
				,	oname : oname
				,   title : title
				,	currentPage : currentPage
				,	pageSize : pageSizeComnGrpCod
				,   from_date : from_date
				,   to_date : to_date
		}
		
		var resultCallback = function(data) {
			flistLmgResult(data, currentPage);
		};
		//Ajax실행 방식 (사용자 정의함수)
		//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
		callAjax("/lsp/lecturePlanData.do", "post", "text", true, param, resultCallback); 
	}
	
	
	
	/** 강의  조회 콜백 함수 */
	function flistLmgResult(data, currentPage) {
		// 기존 목록 삭제
		$('#listLmg').empty();
		
		// 신규 목록 생성
		$("#listLmg").append(data);
		
		// 총 개수 추출
		var countListComnGrpCod = $("#countListComnGrpCod").val();
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, countListComnGrpCod, pageSizeComnGrpCod, pageBlockSizeComnGrpCod, 'fListLmg');
		console.log("paginationHtml : " + paginationHtml);
		//swal(paginationHtml);
		$("#countListLmg").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageComnGrpCod").val(currentPage);
	}

	
	/** 강의  단건 조회 */
	function fSelectLmg(ci_no) {
		
		var param = { ci_no : ci_no };
		
		var resultCallback = function(data) {
			fSelectLmgResult(data);
		};
		
		callAjax("/lmg/selectLmg.do", "post", "json", true, param, resultCallback);
	}
	
	
	/** 강의  단건 조회 콜백 함수*/
	function fSelectLmgResult(data) {

		console.log("fSelectrpCodResult"+JSON.stringify(data)) //나중에 삭제해야할 부분
		
		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#layer1");
			
			// 강의  폼 데이터 설정
			fInitLmg(data.lmgListModel);
			
		} else {
			swal(data.resultMsg); // swal(sweetAlert의 줄임말로 alert창을 깔끔하게 띄워주는것)
		}	
	}
	
	
	/** 강의  저장 */
	function fSaveLmg() {

		// vaildation 체크
		if ( ! fValidateLmg() ) {
			return;
		}
		
		var resultCallback = function(data) {
			fSaveLmgResult(data);
		};
		
		callAjax("/lmg/saveLmg.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	}
	
	
	/** 강의  저장 콜백 함수 */
	function fSaveLmgResult(data) {
		
		// 목록 조회 페이지 번호
		var currentPage = "1";
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageComnGrpCod").val();
		}
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			swal(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 목록 조회
			fListLmg(currentPage);
			
		} else {
			// 오류 응답 메시지 출력
			swal(data.resultMsg);
		}
		
		// 입력폼 초기화
		fInitLmg();
	}

	
	/** 강의  삭제 */
	function fDeleteLmg() {
		
		swal("정말 삭제하겠습니까? \n삭제시 복구불가합니다.", {
			  buttons:{
				  yes : "예",
				  no : "아니오"
			  }
			}).then((value) => {  /* 이건 이클립스가 게을러서 뜨는 에러!  */
				switch(value){
				case "yes":
					
					var resultCallback = function(data) {
					fDeleteLmgResult(data);
					};
				
					callAjax("/lmg/deleteLmg.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
				
					break;
				case "no": 
					break;
				}
			});
		
		
	}
	
	
	/** 강의  삭제 콜백 함수 */
	function fDeleteLmgResult(data) {
		
		var currentPage = $("#currentPageComnGrpCod").val();
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			swal(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 강의  목록 조회
			fListLmg(currentPage);
			
		} else {
			swal(data.resultMsg);
		}	
	}
	
</script>

</head>
<body>
	<form id="myForm" action="" method="">
		<input type="hidden" id="currentPageComnGrpCod" value="1">
		<!-- 현재 보고있는 페이지를 백업하기위해 -->
		<input type="hidden" id="currentPageComnDtlCod" value="1"> <input
			type="hidden" id="tmpGrpCod" value=""> <input type="hidden"
			id="tmpGrpCodNm" value="">
		<!-- name이없어서 값을 안남겨준다. Serialize(name기준으로움직인다)때문이다. jquery는 id로 움직인다. -->
		<input type="hidden" name="action" id="action" value=""> <input
			type="hidden" name="usertype" id="usertype" value="${userType}">

		<!-- 모달 배경 -->
		<div id="mask"></div>

		<div id="wrap_area">

			<h2 class="hidden">header 영역</h2>
			<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

			<h2 class="hidden">컨텐츠 영역</h2>
			<div id="container">
				<ul>
					<li class="lnb">
						<!-- lnb 영역 --> <jsp:include
							page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
					</li>
					<li class="contents">
						<!-- contents -->
						<h3 class="hidden">contents 영역</h3> <!-- content -->
						<div class="content">

							<p class="Location">
								<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
								<span class="btn_nav bold">학습지원</span> <span
									class="btn_nav bold">강의계획서 및 공지</span> <a
									href="../lmg/lectureMgt.do" class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle">
								<span>강의계획서 및 공지</span> <span class="fr"> <c:set
										var="nullNum" value=""></c:set> <a class="btnType blue"
									href="javascript:fPopModalLmg();" name="modal"><span>계획서
											등록</span></a>
								</span>
							</p>
							<table width="100%" cellpadding="5" cellspacing="0" border="1"
								align="left"
								style="border-collapse: collapse; border: 1px #50bcdf;">
								<tr style="border: 0px; border-color: blue">
									<td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>

									<td width="50" height="25" style="font-size: 100%"><select
										id="searchKey" name="searchKey"
										style="width: 50px; font-size: 1em;" v-model="searchKey">
											<option value="ci_name">제목</option>
									</select></td>
									<td width="50" height="25" style="font-size: 100%"><input
										type="text" style="width: 120px" id="title" name="title">
									</td>
									<td width="50" height="25" style="font-size: 100%">작성일</td>
									<td width="50" height="25" style="font-size: 100%"><input
										type="date" style="width: 120px" id="from_date"
										name="from_date"></td>
									<td width="50" height="25" style="font-size: 100%"><input
										type="date" style="width: 120px" id="to_date" name="to_date">
									</td>
									<td width="110" height="60" style="font-size: 120%"><a
										href="" class="btnType blue" id="searchBtn" name="btn"> <span>검
												색</span>
									</a></td>
									<!-- <input type="button" value="검  색  " id="searchBtn" name="btn" class="test_btn1" 
                              style="border-collapse: collapse; border: 0px gray solid; background-color: #50bcdf; width: 70px; color: white"/> -->
								</tr>
							</table>

							<div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="15%">
										<col width="15%">
										<col width="20%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>

									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">분류</th>
											<th scope="col">제목</th>
											<th scope="col">강사명</th>
											<th scope="col">강의시작일</th>
											<th scope="col">강의종료일</th>
											<th scope="col">신청인원</th>
											<th scope="col">정원</th>
										</tr>
									</thead>
									<tbody id="listLmg"></tbody>
								</table>
							</div>
							<div class="paging_area" id="countListLmg"></div>
						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>

		<!-- 모달팝업 -->
		<div id="layer1" class="layerPop layerType2" style="width: 600px;">
			<dl>
				<dt>
					<strong>강 의 계 획 서</strong>
				</dt>
				<dd class="content">
					<!-- s : 여기에 내용입력 -->
					<table class="row">
						<caption>caption</caption>
						<colgroup>
							<col width="120px">
							<col width="*">
							<col width="120px">
							<col width="*">
							<col width="120px">
							<col width="*">
							<col width="*">
							<col width="*">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">과정명</th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									id="ci_name" name="ci_name" /></td>

								<th scope="row">분류</th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									id="ci_type" name="ci_type" /></td>

							</tr>
							<tr>
								<th scope="row">강사ID</th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									id="loginId" name="loginId" value="${loginId}" /></td>

								<th scope="row">연락처</th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									id="tel" name="tel" value="${tel}" /></td>
							</tr>
							<tr>

								<th scope="row">이메일</th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									id="email" name="email" value="${tel}" /></td>

								<th scope="row">강의실</th>
								<td colspan="3"><select id="r_no" name="r_no">
										<c:forEach items="${listModel}" var="list">
											<option value="${list.r_no}">${list.r_no}</option>
										</c:forEach>

								</select></td>
							</tr>
							<tr>
								<th scope="row">정원</th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									id="ci_limit" name="ci_limit" /></td>
							</tr>
							<tr>
								<th scope="row">수업목표</th>
								<td colspan="6"><textarea type="text" class="inputTxt p100"
										id="ci_goal" name="ci_goal"></textarea></td>
							</tr>
							<tr>
								<th scope="row">출석</th>
								<td colspan="6"><textarea type="text" class="inputTxt p100"
										id="ci_attend" name="ci_attend"></textarea></td>
							</tr>
							<tr>
								<th scope="row">강의계획</th>
								<td colspan="6"><textarea type="text" class="inputTxt p100"
										id="ci_plan" name="ci_plan"></textarea></td>
							</tr>
						</tbody>
					</table>

					<!-- e : 여기에 내용입력 -->

					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSaveGrpCod" name="btn"><span>저장</span></a>
						<a href="" class="btnType gray" id="btnCloseGrpCod" name="btn"><span>취소</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>

		<!--// 모달팝업 -->
	</form>
</body>
</html>