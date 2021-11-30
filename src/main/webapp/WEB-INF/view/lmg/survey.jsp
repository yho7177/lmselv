<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>LMS :: 설문</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
	/* 강의목록 페이징 설정 */
	var pageSizeSurvey = 5;
	var pageBlockSizeSurvey = 5;
	
	/* 학생목록 페이징 설정 */
	var pageSizeSurveyUser = 5;
	var pageBlockSizeSurveyUser = 5;
	
	var usertype = "";
	
	/* 설문 질문 갯수 */
	var pageSizeSurveyQList = 9;
	/* onload 이벤트 */
	$(function() {
		
		usertype = $("#usertype").val();
		
		// 관리가 : A, 학생 : C, 강사 : D
		if(usertype == "A"){
			
			$('#btnSaveSvy').hide();
			$('#btnSubmitSvy').hide();
			
		} else if(usertype == "D"){
			
			$('#btnSaveSvy').hide();
			$('#btnSubmitSvy').hide();
			
		} else {
			
			$('#btnSaveSvy').hide();
			$('#btnSubmitSvy').show();
		}
		
		// 학생 수강 목록 조회
		fListLmg();
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
	});
	
	// 버튼 이벤트
	function fRegisterButtonClickEvent() {
		$('a[name = btn]').click(function(e) {
			e.preventDefault();
			
			var btnId = $(this).attr('id');
			switch (btnId){
			
			case 'btnSaveSvy' :
				fSaveSvy();
				break;
			
			case 'btnSubmitSvy' :
				fSvySubmit();
				break;
				
			case 'btnClose' :
				gfCloseModal();
				break;

			}
		});
	}
	
	// 설문지 폼 초기화
	function fSvyForm(object,cnt){
		
		var rcnt = 1;
		var qnum = "";
		var aval = "";
		
		if( object == "" || object == null || object == undefined) {
			$('#svy_ex1').val("");
			$('#svy_ex2').val("");
			$('#svy_ex3').val("");
			$('#svy_ex4').val("");
			$('#svy_ex5').val("");
		}else {
			
			//alert(object.svy_ex1);
			
			
			$.each(object, function(key, value) {
				qnum = value.svy_no;
				aval = value.rs_select;
				
				$("input:radio[name=answer" + qnum + "]:input[value='"+ aval+"']").attr("checked", true);
			});
		}
	}
	// 수강 목록 조회
	function fListLmg(currentPage){
		
		currentPage = currentPage || 1;
		
		
		console.log("currentPage : " + currentPage);
		
		var param = {
				currentPage : currentPage
			,	pageSize : pageSizeSurvey
		}
		
		var resultCallback = function(data){
			fListSurveyResult(data, currentPage);
		};
		//Ajax실행 방식
		//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
		callAjax("/lmg/surveyList.do", "post", "text", true, param, resultCallback);
	}
	
	// 수강 목록 조회 콜백 함수
	function fListSurveyResult(data, currentPage) {
		//swal(data);
		console.log(data);
		
		// 기존 목록 삭제
		$('#listLmgSurvey').empty();
		
		// 신규 목록 생성
		$("#listLmgSurvey").append(data);
		
		// 총 개수 추출
		var totalCntSurvey = $("#totalCntSurvey").val();
		//swal(totalCntComnGrpCod);
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntSurvey, pageSizeSurvey, pageBlockSizeSurvey, 'fListLmg');
		console.log("paginationHtml : " + paginationHtml);
		//swal(paginationHtml);
		$("#listSurveyPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageSurvey").val(currentPage);
	}
	
	// 학생 목록 조회
	function fListSurveyUser(currentPage, ci_no, ci_name) {
		
		currentPage = currentPage || 1;
		
		// 학생 목록 정보 설정
		$("tmpCiNo").val(ci_no);
		$("tmpCiNm").val(ci_name);
		
		var param = {
				ci_no : ci_no
			,	ci_name : ci_name
			,	currentPage : currentPage
			,	pageSize : pageSizeSurveyUser
		}
		
		var resultCallback = function(data) {
			flistSurveyUserResult(data, currentPage);
		};
		
		callAjax("/lmg/surveyUserList.do", "post", "text", true, param, resultCallback);
		
	}
	
	// 학생 목록 조회 콜백 함수
	function flistSurveyUserResult(data, currentPage){
		
		//swal(data);
		console.log(data);
		
		// 기존 목록 삭제
		$('#listUserSurvey').empty();
		
		// 신규 목록 생성
		$("#listUserSurvey").append(data);
		
		// 총 개수 추출
		var totalCntSurveyUser = $("#totalCntSurveyUser").val();
		
		var ci_no = $("#tmpCiNo").val();
		var ci_name = $("tmpCiNm").val();
		
		var paginationHtml = getPaginationHtml(currentPage, totalCntSurveyUser, pageSizeSurveyUser, pageBlockSizeSurveyUser, 'fListSurveyUser', [ci_no]);
		console.log("paginationHtml : " + paginationHtml);
		//swal(paginationHtml);
		$("#listSurveyUserPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageSurveyUser").val(currentPage);
	}
	
	// 설문지 모달 팝업
	function fSurveyQList(ci_no, loginID, svy_YN) {

		$("#ciNo").val(ci_no);

			var param = {
				ci_no : ci_no
			};
			var resultCallback = function(data) {
				fSurveyQListResult(data, loginID, svy_YN);
			};
		callAjax("/lmg/surveyQList.do", "post", "text", true, param, resultCallback);
	}
	
	// 설문지 내용 callAjax
	function fSurveyQListResult(data, loginID, svy_YN) {
		
		console.log("radio html : " + data);
		
		var ci_no = $("#ciNo").val();
		$('#surveyQue').empty().append(data);
		gfModalPop("#layer"); 
		
		if(svy_YN == 'Y') {
			fSurveyAList(ci_no,loginID);			
		}
	}
	
	// 설문지 데이터 불러오기
	function fSurveyAList(ci_no,loginID){
		$("#ciNo").val(ci_no);

		var param = {
			ci_no : ci_no,
			loginID : loginID
		};
		var resultCallback = function(data) {
			fSurveyAListResult(data);
		};
	callAjax("/lmg/surveyAList.do", "post", "json", true, param, resultCallback);
	}
	
	function fSurveyAListResult(data){
		
		console.log("fSurveyAListResult : " + JSON.stringify(data));
		var ci_no = $("#ciNo").val();

		fSvyForm(data.suveryAListModel, data.suverycnt);
		
	}

	//라디오버튼 null값 체크
	function fcheckvalue(){
	  
	    var returnval = true;
	    var radioval;    
	    
	    var answer = $(":radio:nth-child(odd)");
	    var chckcnt = 0;
	    
	    for(var i = 0 ; i < answer.length ; i++){
	    	var $this = $(answer[i]);
	    	
	    	//console.log(i + " : " + $this.is(":checked"));
	    	
	        if(!$this.is(":checked")) { //선택되어있지 않다면
	        	// returnval = false;
	        } else {
	        	chckcnt++;        	
	        }
	    }
	    
	    if(chckcnt == 9) {
	    	returnval = true;    	
	    } else {
	    	returnval = false;  
	    }
	    //console.log(" returnval : " + returnval);
	    
	    return returnval;
	}
	
	// 설문지 제출
	function fSvySubmit() {
		if(fcheckvalue()){
			if(confirm("정말 제출하시겠습니까?")){
				var resultCallback = function(data) {
					submitSvyResult(data);
				};
			} else {
				return;
			}
		} else {
			alert("모든 항목에 답을 입력해주세요");
			return;		
		}
		
		callAjax("/lmg/surveyInsert.do", "post", "json", true, $("#sureyform").serialize(), resultCallback);
	}
	
	//설문조사 제출완료
	function submitSvyResult(data){
		if(data.result=="SUCCESS"){
			gfCloseModal();
			location.reload();
		}else{
			alert("설문조사 에러");
			}
	}
</script>

</head>
<body>
<form id="myForm"  method="">
<input type="hidden" id="c" value="1">
<input type="hidden" id="currentPageSurveyUser" value="1">
<input type="hidden" id="tmpCiNo" value="">
<input type="hidden" name="action" id="action" value="">
<input type="hidden" id="usertype" value="${usertype}">
<input type="hidden" id="loginID1" value="${loginID}">

<!-- 모달 배경 -->
<div id="mask"></div>

<div id="wrap_area">

<h2 class="hidden">header 영역</h2>
	<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
	<!--  컨텐츠 영역 -->
	<div id="container">
		<ul>
			<li class="lnb">
				 <jsp:include 	page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>
			</li>
			<li class="contents">
				<!-- contents -->
				<div class="content">
					<p class="Location">
						<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> 
						<span	class="btn_nav bold">학습관리 / 설문</span>  
						<a href="../lmg/survey.do" class="btn_set refresh">새로고침</a> 
					</p>
					
					<p class="conTitle mt50">
						<span>설문조사</span>
					</p>
					
				<!-- 설문목록 불러오기 -->
					<div class="divListSurvey">
						<table class="col">
							<caption>caption</caption>
							<colgroup>
								<col width="35%">
								<col width="15%">
								<col width="20%">
								<col width="20%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">강의명</th>
									<th scope="col">강사명</th>
									<th scope="col">강의시작</th>
									<th scope="col">강의종료</th>
									<th scope="col">조회</th>
								</tr>
							</thead>
							<tbody id="listLmgSurvey">
								<tr>
									<td colspan="5">수강중인 강의가 없습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="paging_area"  id="listSurveyPagination"> </div>
				<c:if test="${usertype == 'A' or usertype == 'D'}">
					<!-- 수강중인 학생 조회 -->
					<p class="conTitle mt50">
						<span>수강생 설문조사</span>
					</p>
					<!-- 수강중인 학생 불러오기 -->
					<div class="divListUserSurvey">
						<table class="col">
							<caption>caption</caption>
							<colgroup>
								<col width="35%">
								<col width="15%">
								<col width="20%">
								<col width="20%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">강의명</th>
									<th scope="col">학생명</th>
									<th scope="col">강의시작일</th>
									<th scope="col">강의종료일</th>
									<th scope="col">설문결과</th>
								</tr>
							</thead>
							<tbody id="listUserSurvey">
								<!-- 리스트jsp -->
								<tr>
									<td colspan="5">강의를 선택해주세요</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="paging_area"  id="listSurveyUserPagination"> </div>
				</c:if>
					<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</div>
			</li>
		</ul>
	</div>
</div>

</form>

<!-- 모달팝업시작 -->
<form id="sureyform">
<input type="hidden" id="ciNo" name="ciNo" value=""/>
<div id="layer" class="layerPop layerType2" style="width: 800px; ">
	<dl>
		<dt>
			<strong>설문지</strong>
		</dt>
		<dd class="content" >
			<!-- s : 여기에 내용입력 -->
			<div class="sidescroll" style="height:700px; overflow: auto !important;">
				<table class="row" id="surveyQue">
					<caption>caption</caption>
					<tbody><!-- for문 --></tbody>
				</table>
			</div>
			<div class="btn_areaC mt30">
				<a href="javascript:fSaveSvy()" class="btnType blue" id="btnSaveSvy" name="btn"><span>저장</span></a>
				<a href="javascript:fSvySubmit()" class="btnType blue" id="btnSubmitSvy" name="btn"><span>제출</span></a> 
				<a href="" class="btnType gray" id="btnClose" name="btn"><span>닫기</span></a>
			</div>
		</dd>
	</dl>
</div>
</form>
</body>
</html>