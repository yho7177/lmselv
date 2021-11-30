<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>LMS :: 과제</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>



<script type="text/javascript">
	
	/* 자료 목록 페이징 설정 */
	var pageSizeMtrMain = 5;
	var pageBlockSizeMtrMain = 5;
	
	/* 자료다운 목록 페이징 설정 */
	var pageSizeMtrSub = 5;
	var pageBlockSizeMtrSub = 5;
	
	/* onload 이벤트 */
	$(function() {
		
		var usertype = $("#usertype").val();
		
		// 학생 : C, 강사 : D.
		if(usertype == "D"){
			
			$('#ci_name').attr("readonly", true);
//			$('#ci_content').attr("readonly", true);
			
			$('#btnInsertTeach').show();
			$('#btnInsertStudt').show();
			
			$('#btnSaveTeach').show();
			$('#btnDeleteTeach').show();
			
			$('#btnSaveStudt').hide();
			$('#btnDeleteStudt').hide();
		} else {
			$('#ci_name').not(":selected").attr("disabled", "disabled");
			$('#name').attr("readonly", true);
			$('#li_name').attr("readonly", true);
			$('#ci_content').attr("readonly", true);
			
			$('#btnInsertTeach').hide();
			$('#btnInsertStudt').show();
			
			$('#btnSaveTeach').hide();
			$('#btnDeleteTeach').hide();
			
			$('#btnSaveStudt').show();
			$('#btnDeleteStudt').show();
		}
		// 학습자료 초기 조회
		fListMtrMain();
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
	});
	
	// 버튼 이벤트
	function fRegisterButtonClickEvent() {
		$('a[name = btn]').click(function(e) {
			e.preventDefault();
			
			var btnId = $(this).attr('id');
			switch (btnId){
			
				// 강사, 학생이 자료 검색버튼
				case 'btnSearchTeach' :
					fListMtrMain();
					break;
				
				// 강사, 학생이 자료 업로드 검색버튼
				case 'btnSearchStudt' :
					fListMtrSubt();
					break;
				
					
				case 'btnCloseTchCod' :
					gfCloseModal();
					break;
				
				case 'btnSaveTeach' :
					fSaveMtrTch();
					break;
					
				case 'btnDeleteTeach' :
					fDeleteMtrTch();
					break;
					
				case 'btnSaveStudt' :
					fSaveHwSub();
					break;
					
				case 'btnDeleteStudt' :
					fDeleteHwSub();
					break;
			}
		});
	}
	
	// 자료목록 폼 초기화
	function fMtrMainForm(object) {
		$("#ci_name").focus();
		var usertype = $("#usertype").val();
		
		if( object == "" || object == null || object == undefined) {
			$('#name').val("");
			$('#ci_no').val("");
			$('#ci_name').val("");
			$('#ci_content').val("");
			
			$('#ci_no').removeAttr("disabled"); //버튼 비활성화 속성을 제거
			$('#ci_no').css("background", "#FFFFFF");
			$('#name').css("background", "#FFFFFF");
			
			$('#t_name').hide(); //t_name 체크하자
			$('#btnDeleteTeach').hide();
			
		}else {
			$('#ci_no').val(object.ci_no);
			$('#ci_name').val(object.ci_name);
			$('#name').val(object.name);
			$('#ci_date').val(object.ci_date);
			$('#ci_content').val(object.ci_content);
			  
			$('#ci_no').not(":selected").attr("disabled", "disabled");
			$('#ci_no').css("background", "#F5F5F5");
			$('#name').attr("readonly", true);
			$('#name').css("background", "#F5F5F5");
			
			$('#t_name').show();  //t_name체크
			if(usertype == 'C'){		// 학생일 떄 삭제버튼 숨기기
	            $("#btnDeleteTeach").hide();
	         } else {
	            $("#btnDeleteTeach").show();
	         }

		}
	}
	
	// 자료 올리기 폼 초기화
	function fMtrStudtForm(object) {

		var filehtml = "";
		var file = "";
		var ID = $("#loginID1").val();
		console.log("ID : " + ID);
		
		var hwNo = $("#tmpMtrMain").val();
		var hwNm = $("#tmpMtrMainNm").val();
		var ciNm = $("#tmpCiNm").val();
		var ciNo = $("#tmpCiNo").val();
		
		if( object == "" || object == null || object == undefined) {
			
			$('#hw_no_1').val(hwNo);
			$('#hw_name_1').val(hwNm);
			$('#ci_name_1').val(ciNm);
			$('#ci_no').val(ciNo);
			$('#hws_no').val("");
			$('#hws_name').val("");
			$('#hws_content').val("");
			$('#filedown').empty();
			$('#fileno').empty();
			
			
			
			$('#hw_name_1').attr("readonly", true);
			$('#hw_name_1').css("background", "#F5F5F5");
			$('#ci_name_1').attr("readonly", true);
			$('#ci_name_1').css("background", "#F5F5F5");
			
			$('#st_name').hide();
			$('#btnDeleteStudt').hide();
		}else {
			$('#hws_no').val(object.hws_no);
			$('#hw_no_1').val(object.hw_no);
			$('#ci_no').val(object.ci_no);
			$('#loginID').val(object.loginID);
			$('#s_name').val(object.name);
			$('#ci_name_1').val(object.ci_name);
			$('#hw_name_1').val(object.hw_name);
			$('#hws_name').val(object.hws_name);
			$('#hws_content').val(object.hws_content);
			
			if( object.file_no == "" || object.file_no == null || object.file_no == undefined) {
				$('#filedown').empty();
				$('#fileno').empty();
			}	else {
				
				
				filehtml = "<a href=\"javascript:downloadHwFile('" + object.hws_no + "')\" >" +  object.file_name + "</a>";
				console.log("filehtml + " + filehtml);
				file = "<input type='text' id='file_no' name='file_no' value='" + object.file_no + "'>";
				
				$('#filedown').empty().append(filehtml);
				$('#fileno').empty().append(file);
			}
			
			console.log("file_name : " + object.file_name);
			
			$('#file_no').siblings('.upload-name').val(object.file_name); 
			
			
			$('#s_name').attr("readonly", true);
			$('#s_name').css("background", "#F5F5F5");
			$('#ci_name_1').attr("readonly", true);
			$('#ci_name_1').css("background", "#F5F5F5");
			$('#hw_name_1').attr("readonly", true);
			$('#hw_name_1').css("background", "#F5F5F5");
			
			$('#st_name').show();
			
			// 강사일 떄 삭제버튼 숨기기
			if(usertype == 'D'){	
	            $("#btnDeleteStudt").hide();
	         } else {
	 			$("#btnDeleteStudt").show();
	         }
			/* 로그인 아이디가 같은 제출만 수정 삭제 가능 숨기기
 			if(ID == $('#loginID').val(object.loginID)) {	
 				$('#btnSaveHwSub').show();
 				$("#btnDeleteHwSub").show();
 			} else {
 				$('#btnSaveHwSub').hide();
 			} */
		}
	}
	
	// 자료 목록 조회
	function fListMtrMain(currentPage){
		currentPage = currentPage || 1;
		
		var sname = $('#sname').val();
		var searchKey = document.getElementById("searchKey");
		var oname = searchKey.options[searchKey.selectedIndex].value;
		var ci_name = $('#ci_name').val();
		
		console.log("currentPage : " + currentPage);
		
		var param = {
				ci_name : ci_name
			,	sname : sname
			,	oname : oname
			,	currentPage : currentPage
			,	pageSize : pageSizeMtrMain
		};
		
		var resultCallback = function(data){
			flistMtrMainResult(data, currentPage); 
		};
		//Ajax실행 방식  
		//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
		callAjax("/lsp/documentTeachList.do", "post", "text", true, param, resultCallback);
	}
	  
	// 자료 목록 조회 콜백 함수
	function flistMtrMainResult(data, currentPage){
		
		//swal(data);
		console.log(data);
		
		// 학생 로그인
		if(data.usertype == "C") {

			// 기존 목록 삭제
			$('#listMtrTeachDoc').empty();
			
			// 신규 목록 생성
			$("#listMtrTeachDoc").append(data.listMtrTeachModel2);
			
			// 총 개수 추출
			var totalCntTeach = $("#totalCntTeach").val();
			//swal(totalCntComnGrpCod);
			
		// 강사 로그인
		} else {

			// 기존 목록 삭제
			$('#listMtrTeachDoc').empty();
			
			// 신규 목록 생성
			$("#listMtrTeachDoc").append(data.listHwMgtModel1);
			
			// 총 개수 추출
			var totalCntTeach = $("#totalCntTeach").val();
			//swal(totalCntComnGrpCod);
		}
		// 기존 목록 삭제
		$('#listMtrTeachDoc').empty();
		
		// 신규 목록 생성
		$("#listMtrTeachDoc").append(data);
		
		// 총 개수 추출
		var totalCntTeach = $("#totalCntTeach").val();
		//swal(totalCntComnGrpCod);
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntTeach, pageSizeMtrMain, pageBlockSizeMtrMain, 'fListMtrMain');
		console.log("paginationHtml : " + paginationHtml);
		//swal(paginationHtml);
		$("#listTeachMainPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageTeachMain").val(currentPage);
		
	}
	
	// 과제목록 모달 실행
	function fMtrMainPopModal(ci_no) {
		// 신규등록
		if (ci_no == null || ci_no == "") {
			$("#action").val("I");
			console.log($("#action").val());
			// 과제목록 폼 초기화
			fMtrMainForm();
			
			// 모달 팝업
			gfModalPop("#layer1");
			
		// 과제 정보 수정
		} else {
			$("#action").val("U");
			console.log($("#action").val());
			
			fSelectMtrTeach(ci_no);
		}
	}
	
	// 과제 목록 단건 조회
	function fSelectMtrTeach(ci_no) {
		
	var param = { 
			ci_no : ci_no 
			};
		
		var resultCallback = function(data) {
			fSelectMtrTeachResult(data);
		};
		
		callAjax("/lsp/selectMtrTeach.do", "post", "json", true, param, resultCallback);
	}
	
	function fSelectMtrTeachResult(data) {
		
		console.log("fSelectMtrTeachResult : " + JSON.stringify(data));
		
		
		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#layer1");
			
			// 과제목록 폼 데이터 설정
			
			//  학생 로그인
			if(data.usertype == "C") {
				
				fMtrMainForm(data.learnMtrTeachModel2);
			
			// 강사 로그인
			} else {
				
				fMtrMainForm(data.learnMtrTeachModel);
				
			}
			
		} else {
			swal(data.resultMsg);
		}	
	}
	
	function fValidateMtrTeach(){
		
		var chk = checkNotEmpty(
				[
						["ci_name", "강의를 선택해주세요."]
					,	[ "name", "제목을 입력해 주세요." ]
					,	[ "ci_content", "내용을 입력해 주세요." ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	
	
	
	function fValidateHwSub() {
		var chk = checkNotEmpty(
				[
						[ "ci_name", "제목을 입력해 주세요." ]
					,	[ "ci_content", "내용을 입력해 주세요." ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	// 과제 목록 저장
	function fSaveMtrTch() {
		// vaildation 체크
		if ( ! fValidateMtrTeach() ) {
			return;
		}
		
		var resultCallback = function(data) {
			fSaveMtrTchResult(data);
		};
		
		callAjax("/lsp/saveMtrTch.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	}
	
	// 과제 목록 저장 콜백 함수
	function fSaveMtrTchResult(data) {
		// 목록 조회 페이지 번호
		var currentPage = "1";
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageTeachMain").val();
		}
		if (data.result == "SUCCESS") {	
			// 응답 메시지 출력
			swal(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 목록 조회
			fListMtrMain(currentPage);
			
		} else {
			// 오류 응답 메시지 출력
			swal(data.resultMsg);
		}
		// 입력폼 초기화
		fMtrMainForm();
	}
	
	// 과제 목록 삭제
	function fDeleteMtrTch() {
		swal("정말 삭제하겠습니까? \n삭제시 복구불가합니다.", {
			  buttons:{
				  yes : "예",
				  no : "아니오"
			  }
			}).then((value) => {  /* 이건 이클립스가 게을러서 뜨는 에러!  */
				switch(value){
				case "yes":
					
					var resultCallback = function(data) {
					fDeleteMtrTchResult(data);
					};
					
					callAjax("/lsp/deleteMtrTch.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
					
					break;
				case "no": 
					break;
				}
			});
	}
	
	// 과제 목록 삭제 콜백 함수
	function fDeleteMtrTchResult(data) {
		var currentPage = $("#currentPageTeachMain").val();
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			swal(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 자료 목록 조회
			fListMtrMain(currentPage);
			
		} else {
			swal(data.resultMsg);
		}	
	}
	
	// 자료 목록 조회
	function fListMtrSubt(currentPage, ci_no, ci_content, ci_name, ci_date) {
		
		currentPage = currentPage || 1;
		
		// 과제목록 정보 설정
		$("#tmpMtrMain").val(ci_content);
		$("#tmpMtrMainNm").val(ci_date);
		$("#tmpCiNm").val(ci_name);
		$("#tmpCiNo").val(ci_no);
		
		var sname = $('#sname1').val();
		var searchKey = document.getElementById("searchKey1");
		var oname = searchKey.options[searchKey.selectedIndex].value;
		
		var param = {
				ci_content : ci_content
			,	ci_date : ci_date
			,	ci_name : ci_name
			,	ci_no : ci_no
			,	sname : sname
			,	oname : oname
			,	currentPage : currentPage
			,	pageSize : pageSizeMtrSub
		}
		
		var resultCallback = function(data) {
			flistMtrSubtResult(data, currentPage);
		};
		
		callAjax("/lsp/listMtrStudt.do", "post", "text", true, param, resultCallback);
	}
	
	// 과제 제출 조회 콜백 함수
	function flistMtrSubtResult(data, currentPage){
		
		//swal(data);
		console.log(data);
		
		// 기존 목록 삭제
		$('#listMtrStudt').empty();
		
		// 신규 목록 생성
		$("#listMtrStudt").append(data);
		
		// 총 개수 추출
		var totalCntMrtSub = $("#totalCntMrtSub").val();
		//swal(totalCntComnGrpCod);
		
		// 페이지 네비게이션 생성
		var hw_no = $("#tmpMtrMain").val();
		var hw_name = $("#tmpMtrMainNm").val();
		var ci_name = $("#tmpCiNm").val();
		var ci_no = $("#tmpCiNo").val();

		var paginationHtml = getPaginationHtml(currentPage, totalCntMrtSub, pageSizeMrtSub, pageBlockSizeMrtSub, 'fListMtrSubt', [ci_no]);
		console.log("paginationHtml : " + paginationHtml);
		//swal(paginationHtml);
		$("#listHwSubPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageMrtSub").val(currentPage);
		
	}
	
	// 과제 제출 단건 조회
	function selectMtrStudt(hw_no, hws_no) {
		
	var param = { 
				hw_no : hw_no
			,	hws_no : hws_no 
			};
		
		var resultCallback = function(data) {
			fselectMtrStudtResult(data);
		};
		
		callAjax("/lsp/selectMtrStudt.do", "post", "json", true, param, resultCallback);
	}
	
	// 과제 제출 단건 조회 콜백 함수
	function fselectMtrStudtResult(data) {
		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#layer2");
			
			// 과제제출 폼 데이터 설정
			fMtrStudtForm(data.learnMtrStudtModel);
			
		} else {
			swal(data.resultMsg);
		}	
	}
	
	/* 자료 제출 팝업 실행 */
	function fMtrStudtPopModal(ci_no){
		
		// 신규 저장
		if (ci_no == null || ci_no=="") {
		
			if ($("#tmpMtrMain").val() == "") {
				swal("과제를 선택해 주세요.");
				return;
			}
			
			// Tranjection type 설정
			$("#action").val("I");
			
			// 과제제출 폼 초기화
			fMtrStudtForm();
			
			// 모달 팝업
			gfModalPop("#layer2");

		// 수정 저장
		} else {
			
			// Tranjection type 설정
			$("#action").val("U");
			
			// 과제제출 단건 조회
			fselectMtrStudt(ci_no);
		}
	}
	
	// 과제 제출 저장	
	function fSaveMtrStudt(){
	
		// vaildation 체크
		if ( ! fValidateMtrStudt() ) {
			return;
		}
		
		var frm = document.getElementById("myForm");
		frm.enctype = 'multipart/form-data';
		var fileData = new FormData(frm);
		
	
		var resultCallback = function(data) {
		
			fSaveMtrStudtResult(data);
		};
		            
		callAjaxFileUploadSetFormData("/lsp/saveMtrStudt.do", "post", "json",true, fileData, resultCallback);
	     
	}
	
	// 과제 제출 저장 콜백 함수
	function fSaveMtrStudtResult(data) {
		
		// 목록 조회 페이지 번호
		var currentPage = "1";
		
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageHwSub").val();
		}
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			swal(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 목록 조회
			var hw_no = $("#tmpMtrMain").val();
			var hw_name = $("#tmpMtrMainNm").val();
			var ci_name = $("#tmpCiNm").val();
			var ci_no = $("#tmpCiNo").val();

			fListMtrSubt(currentPage, learn_no, learn_name, ci_name, ci_no);
			
		} else {
			// 오류 응답 메시지 출력
			swal(data.resultMsg);
		}
		
		// 입력폼 초기화
		fMtrStudtForm();
			
	}
	
	// 파일다운로드
	function downloadHwFile(hws_no) {
	   
		var params = "";
		params += "<input type='hidden' name='hws_no' value='"+ hws_no +"' />";
	
		jQuery("<form action='/lmg/downloadHwFile.do' method='post'>"+params+"</form>").appendTo('body').submit().remove();
	}

	
	// 과제 제출 삭제
	function fDeleteMtrStudt() {
		swal("정말 삭제하겠습니까? \n삭제시 복구불가합니다.", {
			  buttons:{
				  yes : "예",
				  no : "아니오"
			  }
			}).then((value) => {  /* 이건 이클립스가 게을러서 뜨는 에러!  */
				switch(value){
				case "yes":
					
					var frm = document.getElementById("myForm");
					frm.enctype = 'multipart/form-data';
					var fileData = new FormData(frm);
					
					var resultCallback = function(data) {
					fDeleteMtrStudtResult(data);
					};
					
					callAjaxFileUploadSetFormData("/lsp/deleteMtrStudt.do", "post", "json", true, fileData, resultCallback);
					
					break;
				case "no": 
					break;
				}
			});
	}
	
	// 과제 목록 삭제 콜백 함수
	function fDeleteMtrStudtResult(data) {
		var currentPage = $("#currentPageMrtSub").val();
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			swal(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 과제 목록 조회
			var hw_no = $("#tmpMtrMain").val();
			var hw_name = $("#tmpMtrMainNm").val();
			var ci_name = $("#tmpCiNm").val();
			var ci_no = $("#tmpCiNo").val();
			
			fListMtrSubt(currentPage, learn_no, learn_name, ci_name, ci_no);
			
		} else {
			swal(data.resultMsg);
		}	
	}
	
</script>

</head>
<body>
<form id="myForm"  method="">
<input type="hidden" id="currentPageTeachMain" value="1">
<input type="hidden" id="currentPageMrtSub" value="1">
<input type="hidden" id="tmpMtrMain" value="">
<input type="hidden" id="tmpMtrMainNm" value="">
<input type="hidden" id="tmpCiNm" value="">
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
							<span	class="btn_nav bold">학습관리 / 학습자료</span>  
							<a href="../lsp/documentMgt.do" class="btn_set refresh">새로고침</a> 
						</p>
						 
					<!-- 과제목록 검색창 -->
						<table width="100%" cellpadding="5" cellspacing="0" border="1" align="left" style="border-collapse: collapse; border: 10px #50bcdf; ">
							<tr style="border: 0px; border-color: blue">
								<td width="80" height="25" style="font-size: 120%;">&nbsp;&nbsp;</td>
								<td width="50" height="25" style="font-size: 100%; text-align:left; padding-right:25px;">
									<select id="searchKey" name="searchKey" style="width: 150px;" v-model="searchKey">
										<option value="ci_name" >강의명</option>
										<option value="name" >강사명</option>
									</select> 
								<input type="text" style="width: 300px; height: 25px;" id="sname" name="sname">
								<a href="" class="btnType blue" id="btnSearchTeach" name="btn"><span>검  색</span></a>
								</td>    
							</tr>
						</table>
						
					<!-- 과제목록 조회 -->
						<p class="conTitle mt50">
							<span>학습자료 목록</span>
							<span class="fr">
								<!-- 강사 과제등록 -->
								<a class="btnType blue"  href="javascript:fMtrMainPopModal()" name="modal" id="btnInsertTeach"><span class="hidden">과제등록</span></a>
							</span>
						</p>
						
					<!-- 과제목록 불러오기 -->
						<div class="divListHomework">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="20%">
									<col width="15%">
									<col width="40%">
									<col width="15%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">강의명</th>
										<th scope="col">강사명</th>
										<th scope="col">제목</th>
										<th scope="col">작성일</th>
										<th scope="col">비고</th>
									</tr>
								</thead>
								<tbody id="listMtrTeachDoc">
									<tr>
										<td colspan="5">과제를 작성해주세요</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="paging_area"  id="listTeachMainPagination"> </div>
						
					<!-- 과제제출 검색창 -->
						<table style="margin-top: 10px" width="100%" cellpadding="5" cellspacing="0" border="1" align="left" style="collapse; border: 1px #50bcdf;">
							<tr style="border: 0px; border-color: blue">
								<td width="80" height="25" style="font-size: 120%;">&nbsp;&nbsp;</td>
								<td width="50" height="25" style="font-size: 100%; text-align:left; padding-right:25px;">
									<select id="searchKey1" name="searchKey1" style="width: 150px;" v-model="searchKey1">
										<option value="ci_name" >강의명</option>
										<option value="name" >학생명</option>
									</select> 
								<input type="text" style="width: 300px; height: 25px;" id="sname1" name="sname1">                    
								<a href="" class="btnType blue" id="btnSearchStudt" name="btn"><span>검  색</span></a>
								</td>    
							</tr>
	                     </table> 
						 
					<!-- 과제제출 조회 -->
						<p class="conTitle mt50">
							<span>자료 올리기</span>
							<span class="fr">
								<!-- 학생 과제제출 -->
								<a class="btnType blue"  href="javascript:fMtrStudtPopModal()" name="modal" id="btnInsertStudt"><span>자료 등록</span></a>
							</span>
						</p>
						
					<!-- 과제제출목록 불러오기 -->
						<div class="divListHomework">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">강의명</th>
										<th scope="col">제목</th>
										<th scope="col">학생명</th>
										<th scope="col">파일</th>
										<th scope="col">제출일</th>
									</tr>
								</thead>
								<tbody id="listHomeworkSub">
									<!-- 리스트jsp -->
									<tr>
										<td colspan="5">자료를 선택해주세요</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="paging_area"  id="listHwSubPagination"> </div>
					</div>
					
					<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 자료 목록 팝업 -->
	<div id="layer1" class="layerPop layerType2" style="width: 600px; ">
	
		<dl>
			<dt>
				<strong>학습자료 상세정보</strong>
			</dt>
			<dd class="content">
				<table class="row2">
					<tr class="hidden">
						<th>학습번호</th>
						<td><input type="text" class="inputTxt p100" name="ci_no" id="ci_no" /></td>
					</tr>
					<tr>
						<%-- <th style="width: 100px; height: 37px; ">강의</th>
						<td>
							<select  name="ci_no" id="ci_no" >
								<c:forEach items="${listMtrTeachModel}" var="list">
									<option value="${list.ci_no }">${list.ci_name }</option>
								</c:forEach>
							</select>
						</td> --%>
					</tr>
					<tr id="t_name">
						<th style="width: 100px; height: 37px; ">강사명</th>
						<td>
							<input type="text"class="inputTxt p100"   name="name" id="name" value="${name}">
						</td>
					</tr>
					<tr>
						<th style="width: 100px; height: 37px; ">제목</th>
						<td><input type="text" class="inputTxt p100" name="ci_name" id="ci_name" /></td>
					</tr>
					<tr>
						<th style="width: 100px; height: 37px; ">내용</th>
						<td>
							<textarea rows="7" cols="80" style="resize: none;" class="inputTxt textareas" name="ci_content" id="ci_content"></textarea>
						</td>
					</tr>
				</table>
				
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveTeach" name="btn"><span>저장</span></a>
					<a href="" class="btnType blue" id="btnDeleteTeach" name="btn"><span>삭제</span></a>
					<a href=""	class="btnType gray"  id="btnCloseTchCod" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	
	
	<!-- 자료 올리고  제출 팝업 -->
	<div id="layer2" class="layerPop layerType2" style="width: 600px; ">
	
		<dl>
			<dt>
				<strong>자료 제출 상세정보</strong>
			</dt>
			<dd class="content">
				<table class="row2">
					<tr class="hidden">
						<th>과제제출번호</th>
						<td><input type="text" class="inputTxt p100" name="hws_no" id="hws_no" /></td>
					</tr>
					<tr class="hidden">
						<th>과제번호</th>
						<td><input type="text" class="inputTxt p100" name="hw_no_1" id="hw_no_1" value="${hw_no}"/></td>
					</tr>
					<tr class="hidden">
						<th>강의번호</th>
						<td><input type="text" class="inputTxt p100" name="ci_no" id="ci_no" value="${ci_no}"/></td>
					</tr>
					<tr class="hidden">
						<th>아이디</th>
						<td>
							<input type="text"class="inputTxt p100" name="loginID" id="loginID" value="${loginID}">
						</td>
					</tr>
					<tr id="st_name">
						<th style="width: 100px; height: 37px; ">학생명</th>
						<td>
							<input type="text"class="inputTxt p100" name="s_name" id="s_name" value="${s_name}">
						</td>
					</tr>
					<tr>
						<th style="width: 100px; height: 37px; ">강의</th>
						<td>
							<input type="text"class="inputTxt p100"   name="ci_name_1" id="ci_name_1" value="${ci_name}">
						</td>
					</tr>
					<tr>
						<th style="width: 100px; height: 37px; ">과제 제목</th>
						<td><input type="text" class="inputTxt p100" name="hw_name_1" id="hw_name_1" value="${hw_name }" /></td>
					</tr>
					<tr>
						<th style="width: 100px; height: 37px; ">제목</th>
						<td><input type="text" class="inputTxt p100" name="hws_name" id="hws_name" /></td>
					</tr>
					<tr>
						<th style="width: 100px; height: 37px; ">내용</th>
						<td>
							<textarea rows="7" cols="80" style="resize: none;" class="inputTxt textareas" name="hws_content" id="hws_content"></textarea>
						</td>
					</tr>
					<tr>
						<th style="width: 100px; height: 37px; ">첨부파일</th>
						<td>
							<c:if test="${usertype == 'C' }">
								<div id="fileno" class="hidden"></div>
								<input type="file" class="inputTxt p100" name="file_no" id="file_no"/>
								<div id="filedown"></div>
							</c:if>
							<c:if test="${usertype == 'D' }">
								<div id="filedown"></div>
							</c:if>
							<!-- <input type="file" name="file_name" id="file_name" > -->
						</td>
					</tr>
				</table>
				
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveStudt" name="btn"><span>저장</span></a>
					<a href="" class="btnType blue" id="btnDeleteStudt" name="btn"><span>삭제</span></a>
					<a href=""	class="btnType gray"  id="btnCloseTchCod" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
</form>


</body>
</html>