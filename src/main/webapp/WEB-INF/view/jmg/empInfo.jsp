<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title> 취업정보  </title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
	
	var pageSize = 5;
	var pageBlock = 5;
	
	$(function() {
		
		selectEmpInfoList();
		
		fButtonClickEvent();
		
		fListEmpAdd();
	});
	function fButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();
			
			var btnId = $(this).attr('id');
			
			switch(btnId) {
			
			case 'searchBtn1' : fListEmpAdd();  // 취업 정보 등록 검색하기
			
			break;
			
			case 'searchBtn' : selectEmpInfoList();  // 취업 정보 등록\\ 검색하기
			
			break;
			
			case 'btnSaveEmp' : fSaveEmp();
			
			break;
			
			case 'btnCloseCourse' : gfCloseModal();
			
			break;
			}
		});
	}
	function selectEmpInfoList(currentPage) {
		
		currentPage = currentPage || 1;
		
		searchKey = $('#searchKey').val();
		searchWord = $('#searchWord').val();
		from_date = $('#from_date').val();
		to_date = $('#to_date').val();
		
		var param = {
				searchKey : searchKey,
				searchWord : searchWord,
				currentPage : currentPage,
				pageSize : pageSize,
				from_date : from_date,
				to_date : to_date
		}
		
		var resultCallback = function(data) {
			empInfoListResult(data, currentPage);
		}
		callAjax("/jmg/careerInfoList.do","post","text", true, param, resultCallback);
	}
	
	// 검색기능
	function board_search(currentPage) {
        
        var sname = $('#sname');
        var searchKey = document.getElementById("searchKey");
		var oname = searchKey.options[searchKey.selectedIndex].value;
		
		currentPage = currentPage || 1;
		
		console.log("currentPage : " + currentPage);     
		
        var param = {
        		  sname : sname.val()
        	  ,	  oname : oname
              ,   currentPage : currentPage
              ,   pageSize : pageSizeComnGrpCod
        }
        var resultCallback = function(data) {
        	flistGrpCodResult(data, currentPage); 
        };
        
        callAjax("/system/careerInfoList.do", "post", "text", true, param, resultCallback);
        
  } 
	function empInfoListResult(data, currentPage) {
		
		console.log(data);
		
		$('#empInfoList').empty();
		
		$('#empInfoList').append(data);
		
		var totalCnt = $('#totcnt').val();
		
	     var list = $("#tmpList").val();
	     var pagingnavi = getPaginationHtml(currentPage, totalCnt, pageSize, pageBlock, 'selectEmpInfoList',[list]);
		 
	     console.log("pagingnavi : " + pagingnavi);
	     $("#pagingnavi").empty().append(pagingnavi); 
		 
	     $("#currentPage").val(currentPage);
		 
	 }
	function popupclose() {		
		gfCloseModal();
	}
	/** 삭제 */
	function fDeleteEmpInfo(jobno) {
		debugger;
		swal("해당 취업 정보를 삭제 하겠습니까? \n삭제 시 복구 불가합니다.", {
			  buttons:{
				  yes : "예",
				  no : "아니오"
			  }
			}).then((value) => {  /* 이건 이클립스가 게을러서 뜨는 에러!  */
				switch(value){
				case "yes":
					
					var param = {
						job_no : jobno
				    };
					
					var resultCallback = function(data) {
					    fDeleteGrpCodResult(data);
					};
				
					callAjax("/jmg/deleteEmpInfo.do", "post", "json", true, param, resultCallback);
				
					break;
				case "no": 
					break;
				}
			});
		
		
	}
	
	
	/** 삭제 콜백 함수 */
	function fDeleteGrpCodResult(data) {
		debugger;
		//var currentPage = $("#currentPageComnGrpCod").val();
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			swal(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 그룹코드 목록 조회
			selectEmpInfoList();
			
		} else {
			swal(data.resultMsg);
		}	
	}
	
	/** 취업정보 폼 초기화 */
	function fInitFormDtlCod(object) {

		$("#nameInfo").val(object.name);
		$("#telInfo").val(object.tel);
		$("#job_hiredateInfo").val(object.job_hiredate);
		$("#job_retireInfo").val(object.job_retire);
		$("#job_nameInfo").val(object.job_name);
		$("#job_ynInfo").val(object.job_yn);
		
		$("#nameInfo").attr("readonly", true);
		$("#nameInfo").css("background", "#F5F5F5");
		$("#loginID1").val(object.loginID);
		$("#action").val("U");

	}
	/** 취업등록 폼 초기화 */
	function fRegAdd(object) {
		
		if( object == "" || object == null || object == undefined) {
			$("#name").val("");
			$("#tel").val("");
			$("#job_hiredate").val("");
			$("#job_retire").val("");
			$("#job_name").val("");
			
			
			} else {
			$("#name").val(object.name);
			$("#tel").val(object.tel);
			$("#job_hiredate").val("");
			$("#job_retire").val("");
			$("#job_name").val("");
			$("#name").css("background", "#F5F5F5");
			$("#tel").css("background", "#F5F5F5");
			$("#loginID").val(object.loginID);
			$("#action").val("I");
			}
	}

	/** 취업정보등록 목록 조회 */
	function fListEmpAdd(currentPage) {
		
		currentPage = currentPage || 1;
		
		searchKey2 = $('#searchKey2').val();
		searchWord2 = $('#searchWord2').val();
		
		var param = {
				searchKey2 : searchKey2,
				searchWord2 : searchWord2,
				currentPage : currentPage,
				pageSize : pageSize,
		}
	
		var resultCallback = function(data) {
			fListEmpAddResult(data, currentPage);
		};
		
		callAjax("/jmg/fListEmpAdd.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 취업정보등록 조회 콜백 함수 */
	function fListEmpAddResult(data, currentPage) {
		console.log(data);
		
		$('#liststudent').empty();
		
		$('#liststudent').append(data);
		
		var totalCnt = $('#totcnt2').val();
		
	     var list = $("#tmpList").val();
	     var pagingnavi = getPaginationHtml(currentPage, totalCnt, pageSize, pageBlock, 'fListEmpAdd',[list]);
		 
	     console.log("pagingnavi : " + pagingnavi);
	     $("#pagingnavi1").empty().append(pagingnavi); 
		 
	     $("#currentPage").val(currentPage);
		 
	 }
	
	/** 취업 정보 단건 조회 */
	function fSelectEmpInfo(job_no) {

		$("#temp_job_no").val(job_no);
		
		var param = {
					job_no : job_no
		};
		
		var resultCallback = function(data) {
			fSelectEmpInfoResult(data);
		};
		
		callAjax("/jmg/selectEmpInfo.do", "post", "json", true, param, resultCallback);
	}
	/** 취업 정보 단건 조회 콜백 함수*/
	function fSelectEmpInfoResult(data) {

		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#layer2");
			
			// 그룹코드 폼 데이터 설정
			fInitFormDtlCod(data.empInfoModel);
			
		} else {
			swal(data.resultMsg);
		}	
	}
	/** 취업 정보 등록 */
	function fRegistration(loginID) {
		var param = {
				loginID : loginID
		};
		
		var resultCallback = function(data) {
			fRegistrationResult(data);
		};
		
		callAjax("/jmg/fRegist.do", "post", "json", true, param, resultCallback);
	}
	/** 취업 정보 등록 콜백 함수*/
	function fRegistrationResult(data) {
		debugger;
		if (data.result == "SUCCESS") {
			
			$("#action").val("I");
			// 모달 팝업
			gfModalPop("#in_emp_form");
			
			// 그룹코드 폼 데이터 설정
			fRegAdd(data.empInfoModel);
			
		} else {
			swal(data.resultMsg);
		}	
	}
	
	function fValidatePopup() {
		var chk = checkNotEmpty([ [ "rContent", "내용을 입력해주세요!" ] ]);

		if (!chk) {
			return;
		}
		return true;
	}
	/** 취업 정리 관리 등록 */
	function fSaveEmp() {
	
		var resultCallback = function(data) {
			fSaveEmpResult(data);
		};
		
		
		callAjax("/jmg/saveEmpList.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	}
	
	function fSaveEmpResult(data) {
		debugger;
		var currentPage = currentPage || 1;
		
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageComnDtlCod").val();
		}
		
		if (data.result == "SUCCESS") {
			
			alert("저장 되었습니다.");
			
			gfCloseModal();
			// 응답 메시지 출력
			
			selectEmpInfoList(currentPage);
			// 입력폼 초기화
			fRegAdd();			
			

			
		} else {
			// 오류 응답 메시지 출력
			alert(data.resultMsg);
		}
		
	}	
</script>


</head>
<body>
	<!-- ///////////////////// html 페이지  ///////////////////////////// -->

<form id="myForm" action="" method="">
	
	<input type="hidden" id="currentPage" value="1">  <!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
	<input type="hidden" id="currentPageComnDtlCod" value="1">
	<input type="hidden" id="tmpList" value=""> <!-- ★ 이거뭐임??? -->
	<input type="hidden" id="tmpListNum" value=""> <!-- 스크립트에서 값을 설정해서 넘길거임 / 임시 리스트 넘버 -->
	<input type="hidden" name="action" id="action" value=""> 
	<input type="hidden" id="swriter" value="${loginId}"> <!-- 작성자 session에서 java에서 넘어온값 -->
	
	

	<div id="wrap_area">

		<h2 class="hidden">header 영역</h2>
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> 
					<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					<div class="content">

						<p class="Location">
							<a href="#" class="btn_set home">메인으로</a> 
							<a href="#" class="btn_nav bold">취업 관리</a> 
								<span class="btn_nav bold">취업 정보</span> 
								<a href="#" class="btn_set refresh">새로고침</a>
						</p>

							<p class="conTitle" id="searcharea">
							<span>취업 정보</span> 
							 <span class="fr"> 
								<select id="searchKey" name="searchKey" style="width: 80px;">
								    <option value="all" id="option1" selected="selected">전체</option>
									<option value="sName" id="option1">학생명</option>
									<option value="comName" id="option2">회사명</option>
								</select> 
								<input type="text" id="searchWord" name="searchWord" placeholder="" style="height: 28px;">
								<a href="" class="btnType blue" id="searchBtn" name="btn"><span>검  색</span></a></td> 			 
							</span>
						</p>	  
						
						
							<div class="div_emp_list" id="div_emp_list">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="5%">
									<col width="10%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="10%">
									<col width="10%">
									<col width="20%">
								</colgroup>
								
								<thead>
									<tr>
									    <th scope="col">구분</th>
										<th scope="col">학생명</th>
										<th scope="col">연락처</th>
										<th scope="col">입사일</th>
										<th scope="col">퇴사일</th>
										<th scope="col">회사명</th>
										<th scope="col">재직여부</th>
										<th scope="col">수정/삭제</th>
									</tr>
								</thead>
								<tbody id="empInfoList"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingnavi">
							</div>
											
						</div>
							<p class="conTitle" id="searcharea2" style = "margin-top:3%" >
							<span>취업 정보 등록</span> 
							 <span class="fr"> 
								<select id="searchKey2" name="searchKey2" style="width: 80px;" v-model="searchKey2">
								    <option value="all" id="option1" selected="selected">전체</option>
									<option value="s_nm" id="option1">학생명</option>
									<option value="lec_nm" id="option2">강의명</option>
								</select> 
								<input type="text" id="searchWord2" name="searchWord2" 
									placeholder="" style="height: 28px;"> 
									<a href="" class="btnType blue" id="searchBtn1" name="btn"><span>검  색</span></a></td> 				
							</span>
							</p>	
							<div class="div_std_list" id="div_std_list">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="10%">
									<col width="15%">
									<col width="30%">
									<col width="15%">
									<col width="15%">
									<col width="20%">
								</colgroup>
								<thead>
									<tr>
									    <th scope="col">아이디</th>
										<th scope="col">학생명</th>
										<th scope="col">연락처</th>
										<th scope="col">강의명</th>
										<th scope="col">가입일자</th>
										<th scope="col">등록</th>
									</tr>
								</thead>
								<tbody id="liststudent"></tbody>
							</table>
						</div><!-- div_std_list -->
						
						<div class="paging_area"  id="pagingnavi1"> </div>

		
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
	<div id="in_emp_form" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>취업 등록</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="*">
						<col width="*">
						<col width="100px">
						<col width="*">
						<col width="*">
					</colgroup>

					<tbody>
						<tr>
						<th scope="row">학생명</th>
						<td id ="name_2"><input type="text" class="inputTxt p100" v-model="name" name="name" id="name" readonly />
								<input type="hidden" class="inputTxt p100" name="loginID" id="loginID" />
								<input type="hidden" class="inputTxt p100" name="wp_state" id="wp_state" /></td>
						</tr>
						<tr>
							<th scope="row">회사명 <span class="font_red">*</span></th>
							<td id = "comp_name_2">
						
								<input type="text" class="inputTxt p100" name="job_name" id="job_name"/>
							<!-- 여기 -->
						<!-- 	<input type="text" class="inputTxt p100" v-model=comp_etc name="comp_etc" id="comp_etc" /> -->
							
				
						</td>
						</tr>
							<input type="hidden" id="regID" value="">
						<tr>  
							<th scope="row">연락처<span class="font_red">*</span></th>
							<td id = "tel_2">
								 <input type="text" class="inputTxt p100"  v-model="tel" name="tel" id="tel" readonly/>
							</td>				
						</tr>
						<tr>
							<th scope="row">입사일<span class="font_red">*</span></th>
							<td  id = "employ_day_2">
								 <input type="date" class="inputTxt p100" data-date-format='yyyy-mm-dd' name="job_hiredate" id="job_hiredate" />
							</td>
							</tr>
							<tr>
							<th scope="row">퇴사일<span class="font_red">*</span></th>
							<td id ="resign_day_2">
							     <input type="date" class="inputTxt p100" data-date-format='yyyy-mm-dd' name="job_retire" id="job_retire" />
							</td>					
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveEmp" name="btn"><span>저장</span></a> 
					<a href="javascript:gfCloseModal()" class="btnType gray"  id="btnCloseCourse" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop" id="btnCloseEmp" name="btn"><span class="hidden">닫기</span></a>
	</div>
	<div id="layer2" class="layerPop layerType2" style="width: 600px;">
	    <input type="hidden" id="temp_job_no" name="temp_job_no" value="">
		<dl>
			<dt>
				<strong>취업 정보</strong>
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
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">학생명 <span class="font_red"></span></th>
							<td><input type="text" class="inputTxt p100" id="nameInfo" name="nameInfo" /></td>
							<input type="text" class="inputTxt p100" name="loginID1" id="loginID1" value= "${loginID1}"/>
							<th scope="row">연락처 <span class="font_red"></span></th>
							<td><input type="text" class="inputTxt p100" id="telInfo" name="telInfo" /></td>
						</tr>
						<tr>
							<th scope="row">입사일 <span class="font_red"></span></th>
							<td><input type="date" data-date-format='yyyy-mm-dd' class="inputTxt p100" id="job_hiredateInfo" name="job_hiredateInfo" /></td>
							<th scope="row">퇴사일 <span class="font_red"></span></th>
							<td><input type="date" data-date-format='yyyy-mm-dd' class="inputTxt p100" id="job_retireInfo" name="job_retireInfo" /></td>
						</tr>
						<tr>
							<th scope="row">업체명</th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								id="job_nameInfo" name="job_nameInfo" /></td>
						</tr>
						<tr>
							<th scope="row">재직 여부</th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								id="job_ynInfo" name="job_ynInfo" /></td>
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveEmp" name="btn"><span>저장</span></a>
					<a href="" class="btnType gray" id="btnCloseCourse" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	<!--// 모달팝업 -->
</form>
</body>
</html>
