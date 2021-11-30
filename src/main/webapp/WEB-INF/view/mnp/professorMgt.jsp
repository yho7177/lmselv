<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>강사관리</title>
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<jsp:include page="/WEB-INF/view/login/sign.jsp"></jsp:include>

<script type="text/javascript">

// 그룹코드 페이징 설정
var pageSizeComnGrpCod = 5;
var pageBlockSizeComnGrpCod = 5;


/** OnLoad event */ 
$(function() {
	
	//모든 datepicker에 대한 공통 옵션 설정
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "focus" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,showButtonPanel: false
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
    });

    //input을 datepicker로 선언
    $("#joinDate").datepicker();                    
    $("#endDate").datepicker();
    
    //From의 초기값을 오늘 날짜로 설정
    $('#joinDate').datepicker('setDate', '-1M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    //To의 초기값을 내일로 설정
    $('#endDate').datepicker('setDate', '-1today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

	mnpList_search();
	// 로딩 시 목록 조회.
	
	// 버튼 이벤트 등록
	fRegisterButtonClickEvent();
	
    $("#allCheck").click(function(){
        //만약 전체 선택 체크박스가 체크된상태일경우
        if($("#allCheck").prop("checked")) {
            $("input[type=checkbox]").prop("checked",true);
            //input type이 체크박스인것은 모두 체크함
        } else {
            $("input[type=checkbox]").prop("checked",false);
            //input type이 체크박스인것은 모두 체크 해제함
        }
  });
});

	/* 버튼 이벤트 등록 */
	function fRegisterButtonClickEvent() {
		
		$('a[name=btn]').click(function(e) {
			e.preventDefault();
			
			var btnId = $(this).attr('id');
			
			console.log("버튼 이벤트 : " + btnId);

			switch (btnId) {
			case 'btndeleteuser':
				checkValue();
				break;
			case 'btnSearchMnpList':
				mnpList_search();
				break;
			}
		});
	}

	/* 검색기능 */
	function mnpList_search(currentPage) {

		var sname = $('#sname');
		var joinDate = $('#joinDate');
		var endDate = $('#endDate');

		currentPage = currentPage || 1;
		
 		var param = {
			sname : sname.val(),
			joinDate : joinDate.val(),
			endDate : endDate.val(),
			currentPage : currentPage,
			pageSize : pageSizeComnGrpCod
		}

		var resultCallback = function(data) {
			flistGrpCodResult(data, currentPage);
		};

		callAjax("/mnp/listProfessorMgt.do", "post", "text", true, param,
				resultCallback);
	}
	

	/* 그룹코드 조회 콜백 함수 */
	function flistGrpCodResult(data, currentPage) {
		
		$("#allCheck").prop("checked", false);
		
		// 기존 목록 삭제
 		$('#mnpList').empty();

		// 신규 목록 생성
		$("#mnpList").append(data);
		
		var listCount = $("#listCount").val();

		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, listCount, pageSizeComnGrpCod, pageBlockSizeComnGrpCod, 'mnpList_search');
		//var paginationHtml = getPaginationHtml(currentPage, totalCntComnGrpCod, pageSizeComnGrpCod, pageBlockSizeComnGrpCod, 'fListComnGrpCod');
		console.log("paginationHtml : " + paginationHtml);

		$("#mnpListPagination").empty().append( paginationHtml );
		
		$("#currentPageComnGrpCod").val(currentPage);
	}

	/* 체크박스 선택 값 */
	function checkValue() {
	    var select_obj = '';
	    
	    $('input[name="check"]:checked').each(function (index) {
	        if (index != 0) {
	            select_obj += ', ';
	        }
	        select_obj += $(this).val();
	    });
	    console.log("select_obj: " + select_obj);

			var param = {
					select_obj : select_obj
				}

		var resultCallback = function(data) {
				deleteResult(data);
			};
			if(select_obj != "") {
				callAjax("/mnp/deleteListProfessorMgt.do", "post", "text", true, param,
						resultCallback);	
			}
		}
		

	/* 삭제 결과 콜백 */
		function deleteResult(data, currentPage) {
		console.log("date: " + data);
		
		
		mnpList_search(currentPage);

			if (data.result == "SUCCESS") {
				alert("삭제완료");
				//swal(data.resultMsg);
			}
			else {
				swal(data.resultMsg);
			}
		}	

	/* 회원가입 모달 실행 */
		function signModal() {
			$("#action").val("I");
			// 모달 팝업
			gfModalPop("#signModal");
			
			instaffRegister();
		}
		
</script>

</head>
<body>

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
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
								class="btn_nav bold">인원관리</span> <span class="btn_nav bold">강사관리
								</span> <a href="../mnp/professorMgt.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle"></p>
						
						<table>
							<tr id="search">
								<th scope="row">&emsp;&emsp;가입일자:<span class="font_red"></span></th>
								<td width="100px"><input type="text"  class="inputTxt p100" name="joinDate" id="joinDate" data-date-format='yyyy-mm-dd' /></td>
								<td>	&emsp;~	&emsp;</td>
 								<td width="100px"><input type="text"  class="inputTxt p100" name="endDate" id="endDate" data-date-format='yyyy-mm-dd'  /></td>
							
								<th scope="row" >&emsp;강사명:<span class="font_red"></span></th>
								<td><input type="text" style="width: 100px; height: 28px;" id="sname" name="sname" required></td>
								<td>
								        &emsp;&emsp;<a href="" class="btnType blue" id="btnSearchMnpList" name="btn" ><span>검색</span></a>
								       <a href=""   class="btnType blue" id="btndeleteuser" name="btn"><span>삭제</span></a>
						  			  <a href="javascript:signModal();" id="RegisterBtn"	name="modal" class="btnType blue"><span>신규등록</span></a>
								 </td>       
								                 
							</tr>
						</table>
						
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="6%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="20%">
									<col width="15%">
									<col width="10%">
								</colgroup>
	
								<thead>
									<tr>
										<th><input type="checkbox" name="allCheck" id="allCheck" /></th>
										<th scope="col">강사명</th>
										<th scope="col">회원번호</th>
										<th scope="col">비밀번호</th>
										<th scope="col">휴대전화</th>
										<th scope="col">가입일자</th>
										<th scope="col">수정</th>
									</tr>
								</thead>
								<tbody id="mnpList"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="mnpListPagination"> </div>


						<table style="margin-top: 10px" width="100%" cellpadding="5"
							cellspacing="0" border="1" align="left"
							style="collapse; border: 1px #50bcdf;">
							<tr style="border: 0px; border-color: blue">
								<td width="80" height="25" style="font-size: 120%;">&nbsp;&nbsp;</td>
								<td width="50" height="25"
									style="font-size: 100%; text-align: left; padding-right: 25px;">
							</tr>
						</table>
						<a href="/mnp/excel.do" id="RegisterBtn"	name="modal" class="btnType blue"><span>엑셀</span></a>

						<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
</div>
	


</body>
</html>