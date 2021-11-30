<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.userType ne 'A'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>취업 정보 관리</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->

<script type="text/javascript">

	// 과정 목록 페이징 설정
	var pageSizeResuMgt = 5;
	var pageBlockSizeResuMgt = 5;
	
	// 학생 목록 페이징 설정
	var pageSizeResuMgtDtl = 5;
	var pageBlockSizeComnDtlCod = 5;
	
	
	/** OnLoad event */ 
	$(function() {
	
		// 과정목록 조회
		fListResuMgt();
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
	});

	/** 버튼 이벤트 등록 */
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'searchEnter':
					fListResuMgt();
					break;
			}
		});
	}

	/* 과정목록 조회 */
	function fListResuMgt(currentPage) {
	
		currentPage = currentPage || 1;
		
		searchWord = $('#searchWord').val();
		
		console.log("currentPage : " + currentPage);
		
		var param = {				
					searchWord : searchWord
				,	currentPage : currentPage
				,	pageSize : pageSizeResuMgt
		}
		
		var resultCallback = function(data) {
			fListResuMgtResult(data, currentPage);
		};
		
		//Ajax실행 방식
		//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
		callAjax("/jmg/resumeMgtList.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 과정목록 조회 콜백 함수 */
	function fListResuMgtResult(data, currentPage) {
		debugger;
		//swal(data);
		console.log(data);
		
		// 기존 목록 삭제
		$('#resumeMgtList').empty();
		
		// 신규 목록 생성
		$("#resumeMgtList").append(data);
		
		// 총 개수 추출
		
		var resuMgtCnt = $("#resuMgtCnt").val();
		
		//swal(totalCntComnGrpCod);
		
		// 페이지 네비게이션 생성
		
		var paginationHtml = getPaginationHtml(currentPage, resuMgtCnt, pageSizeResuMgt, pageBlockSizeResuMgt, 'fListResuMgt');
		console.log("paginationHtml : " + paginationHtml);
		//swal(paginationHtml);
		$("#resuMgtPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageResuMgt").val(currentPage);
	}

	/** 학생 목록 조회 */
	function fListResuMgtDtl(currentPage, classNo) {
		debugger;
		currentPage = currentPage || 1;
		
		// 그룹코드 정보 설정
		$("#tmpResuMgt").val(classNo);
		
		var param = {
					classNo : classNo
				,	currentPage : currentPage
				,	pageSize : pageSizeResuMgtDtl
				
		}
		
		var resultCallback = function(data) {
			flistDtlCodResult(data, currentPage);
		};
		
		callAjax("/jmg/listResuMgtDtl.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 학생 목록 조회 콜백 함수 */
	function flistDtlCodResult(data, currentPage) {
		debugger;
		console.log("flistDtlCodResult : " + data);
		
		
		// 기존 목록 삭제
		$('#resumeMgtDtlList').empty(); 
			
		$("#resumeMgtDtlList").append(data);
		
		// 총 개수 추출
		var totalCntResuMgtDtl = $("#totalCntResuMgtDtl").val();
			
		// 페이지 네비게이션 생성
		var grp_cod = $("#tmpResuMgt").val();
		var paginationHtml = getPaginationHtml(currentPage, totalCntResuMgtDtl, pageSizeResuMgtDtl, pageBlockSizeComnDtlCod, 'fListResuMgtDtl', [grp_cod]);
		$("#comnDtlCodPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageComnDtlCod").val(currentPage);
	}
	
	/** 학생 목록 단건 조회 */
	function std_Detail( loginID ) {
	    var param = {
	    		loginID : loginID
	 	    }
	    var resultCallback = function(data) {
			$('#layer1').empty().append(data);
			gfModalPop("#layer1");
	    };
	    callAjax("/jmg/selectResuMgtDtl.do", "post", "text", true, param, resultCallback);
	}
	function popupclose() {		
		gfCloseModal();
	}
	/** 이력서 조회 */
	function fSelectResuMgtDtl(loginID) {
		debugger;
		var param = {
				loginID : loginID
		};
		
		var resultCallback = function(data) {
			fSelectDtlResuResult(data);
		};
		
		callAjax("/jmg/resumeInfo.do", "post", "json", true, param, resultCallback);
	}
	
	/** 이력서 조회 콜백 함수*/
	function fSelectDtlResuResult(data) {
		debugger;
		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#signModal");
			
			// 그룹코드 폼 데이터 설정
			RegisterVal(data.resuMgtDtlModel);
			
		} else {
			swal(data.resultMsg);
		}	
	}
	/* 이력서 validation */
	function RegisterVal(object) {
		  
		$('#registerName').val(object.name);
		$('#birthday').val(object.birthday);
	 	$('#user_type').val(object.user_type);
		$('#email').val(object.email);
		$('#email_detail').val(object.email_detail);
		$('#gender').val(object.gender);
		$('#loginaddr').val(object.residence);
		$('#tel1').val(object.tel);
		$('#user_hope_work').val(object.user_hope_work);
		$('#careeryear').val(object.careeryear);
		$('#careermonth').val(object.careermonth);
		$('#hopesalary').val(object.hopesalary);
		$('#salary_nego').val(object.salary_nego);
		$("#profile").attr("src","/filepath/profile/"+object.profile);
		$('#grade').val(object.grade);
		$('#career_content').val(object.career_content);
		$('#etc').val(object.etc);
			
		$('#title').val()
		$('#add_technic').val()
		$('#hopework').val()
		$('#hopework2').val()
		$('#hopework3').val()

		
	    var s = object.add_technic;
        var t = [];
        
        // 체크박스 초기화
        $('.add_technic').each(function(index) {
           console.log("index: " + index);
           $(this).prop("checked",false);
        });

        // 기술이 널이 아닌 것만 배열로 분리.
  		if (s != null) {
           for (var i = 0; i < s.split(',').length; i++) {
              t[i] = s.split(',')[i].trim();
           }
        }

        // 조회한 기술명을 체크상태로 변경.
        $('.add_technic').each(function(index) {

           for (var i = 0; i < t.length; i++) {
              if ($(this).val() == t[i]) {
                 $(this).prop("checked", true);
              }
           }
        });

     }
	function fcancleModal(){
		gfCloseModal();
		}
	
</script>

</head>
<body>

<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageResuMgt" value="1">
	<input type="hidden" id="currentPageComnDtlCod" value="1">
	<input type="hidden" id="tmpResuMgt" value="">
	<input type="hidden" id="tmpGrpCodNm" value="">
	<input type="hidden" name="action" id="action" value="">

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
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
								class="btn_nav bold">취업관리</span> <span class="btn_nav bold">이력서 관리</span>
						</p>

	                   <div class="divComGrpCodList">
					  <p class="conTitle">               
						<span>이력서 관리</span>
 						<span class="fr"> 
 							 <span><b>강 의 명</b>&nbsp&nbsp </span> 
 							 <input type="text" id="searchWord" name="searchWord" placeholder="" style="height: 28px;">
 						 	 <a class="btnType blue" href="" name="btn" id="searchEnter">
 								 <span>검색</span>
 							 </a>
 						</span>
					  </p>                     
                        <table class="col">
                           <thead>
                              <tr>
                                 <th scope="col" colspan="5">강의 목록</th>
                              </tr>
                           </thead>
                           <caption>caption</caption>
                           <colgroup>
                              <col width="5%">
                              <col width="15%">
                              <col width="8%">
                              <col width="8%">
                              <col width="14%">
                           </colgroup>
                           <thead>
                              <tr>
                                 <th scope="col">강의 번호</th>
                                 <th scope="col">강의명</th>
                                 <th scope="col">담당 교수</th>
                                 <th scope="col">수강 인원</th>
                                 <th scope="col">개강일  / 종강일</th>
                              </tr>
                           </thead>
                           <tbody id="resumeMgtList"></tbody>
                        </table>
                     </div>
                     <div class="paging_area" id="resuMgtPagination"></div>
                     <br><br><br>
 
					<!-- 학생 목록  -->
                     <div class="divComGrpCodList">                   
                        <table class="col">
                           <caption>caption</caption>
                           <colgroup>
                              <col width="5%">
                              <col width="8%">
                              <col width="10%">
                              <col width="14%">
                              <col width="8%">
                              <col width="10%">
                              <col width="14%">
                           </colgroup>
                           <thead>
                              <tr>
                                 <th scope="col" colspan="12">수강 학생 목록</th>                       
                              </tr>
                              <tr>
                                 <th scope="col"><input type="checkbox" id="checkall" checked /></th>
                                 <th scope="col">학생 이름</th>
                                 <th scope="col">학생 아이디</th>
                                 <th scope="col">학생 전화번호</th>
                                 <th scope="col">이메일</th>
                                 <th scope="col">취업 여부</th>
                                 <th scope="col">이력서</th>
                              </tr>
                           </thead>
                           <tbody id="resumeMgtDtlList">
                           		<tr>
						   			<td colspan="12">강의명을 선택해 주세요.</td>
						   		</tr>
                           </tbody>
                        </table>
                        <div class="paging_area"  id="comnDtlCodPagination"> </div>
                     </div>
                                                                                   
                  </div> <!--// content -->
					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
	<!-- 모달팝업 -->
	<div id="signModal" class="layerPosition layerPop layerType2" style="width: 700px;">
		<form id="RegisterForm" action="" method="post">
		<input type="hidden" id="add_technic" name="add_technic" /> 
	<table class="row" >
	<tr>

		<td style="width: 700px;">

	      <input type="hidden" name="action" id="action" value="">
	      <input type="hidden" name="ckIdcheckreg" id="ckIdcheckreg" value="0"/>
	      <input type="hidden" name="ckEmailcheckreg" id="ckEmailcheckreg" value="0"/>	
		<dl>
			<dt>
					<br>
					<br>
					<strong style="font-size:120%">&nbsp;&nbsp;&nbsp;&nbsp;이력서</strong>
					<br>
			</dt>
			<dd class="content">
				<div class="btn_areaC">
					<br>
					<br>
				</div>
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
						<col width="*">
						<col width="120px">
						<col width="*">
						<col width="120px">					
					</colgroup>
							<tr>
								<td><img id ="profile" src="/filepath/profile/${sessionScope.profile}" class="LoginImg" alt="사진" margin = "50px" width="50px" padding = "100px" height="80px"/></td>
							</tr>
							<tr>
								<th scope="row" id="registerName_th">이름 <span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100" name="name"
									id="registerName" /></td>
							
								<th scope="row" id="rggender_th">성별</th>
								<td id="rggender_td">
								<select name="gender" id="gender" style="width: 128px; height: 28px;">
										<option value="" selected="selected">선택</option>
										<option value="M">남자</option>
										<option value="W">여자</option>
								</select></td>
							</tr>

							<tr id="birthday1">
							    <th scope="row">생년월일 <span class="font_red"></span></th>
							    <td><input type="date" class="inputTxt p100" name="birthday" id="birthday" style="font-size: 15px" />
							    <th scope="row" id="registerName_th">타입 <span class="font_red">*</span></th>
							    <td>
							        <select id= user_type name="user_type">
							            <option value="D">강사</option>
							            <option value="C">학생</option>
							        </select>
							    </td>
							</tr>
							
							<tr>
							    <th scope="row">이메일<span class="font_red">*</span></th>
							    <td>
							    	<input type="text" class="inputTxt p100" name="email" id="email" />
							    </td>
							    <td>
							    </td>
							</tr>
							<tr>
								<th scope="row">주소<span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="user_address" id="loginaddr" /></td>
							</tr>			
							<tr>

								<th scope="row">전화번호<span class="font_red">*</span></th>
								<td colspan="3">
								<input class="inputTxt" style="width: 180px" maxlength="3" type="text" id="tel1"
									name="user_tel1"> 
							</tr>

							
							<tr>
								<th scope="row">선호직무분야<span class="font_red">*</span></th>
								<td colspan="3"><select name="user_hope_work" id="user_hope_work"
									style="width: 400px; height: 28px;">
										<option value="" selected="selected">선택</option>
										<option>웹프로그래머</option>
										<option>응용프로그래머</option>
										<option>시스템프로그래머</option>
										<option>DBA·데이터베이스</option>
										<option>네트워크·서버·보안</option>
										<option>HTML·퍼블리싱·UI개발</option>
										<option>ERP·시스템분석</option>
										<option>빅데이터·AI(인공지능)</option>
										<option>소프트웨어·하드웨어</option>
								</select></td>
							</tr>
							
							<tr>
								<th scope="row">경력기간<span class="font_red">*</span></th>
								<td>
								<select id="careeryear" name="careeryear" >
								  <option value="">선택</option>
								  <option>1년미만</option>
								  <option>1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								  <option>6</option>
								  <option>7</option>
								  <option>8</option>
								  <option>9</option>
								  <option>10</option>
								  <option>11</option>
								  <option>12</option>
								  <option>13</option>
								  <option>14</option>
								  <option>15</option>
								  <option>16</option>
								  <option>17</option>
								  <option>18</option>
								  <option>19</option>
								  <option>20이상</option>
								</select>
								<span>년</span>
							</td>
							<th scope="row"></th>
								<td>
								<select name="careermonth" id="careermonth">
								  <option value="">선택</option>
								  <option value="1">1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								  <option>6</option>
								  <option>7</option>
								  <option>8</option>
								  <option>9</option>
								  <option>10</option>
								  <option>11</option>
								  <option>12</option>
								</select>
								<span>월</span>
							</td>
							</tr>
							
							<tr class="row">
							<th scope="row" scope="row">희망연봉<span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100"
									name="hopesalary" id="hopesalary" />만원</td>
							
								<th scope="row">협의가능여부</th>
								<td id="consult_yn"><select name="consult_yn"
									id="salary_nego" style="width: 128px; height: 28px;">
										<option value="Y">가능</option>
										<option value="N">불가능</option>
								</select></td>
							</tr>
							<tr>
								<th scope="row">Language<span class="font_red">*</span></th>
									<td colspan="3">
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="JAVA">JAVA</label>&nbsp;&nbsp;
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="C">C</label>&nbsp;&nbsp;
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="C++">C++</label>&nbsp;&nbsp;
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="C#">C#</label>&nbsp;&nbsp;
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="JSP">JSP</label>&nbsp;&nbsp;
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="PHP">PHP</label>&nbsp;&nbsp;
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="ASP">ASP</label>&nbsp;&nbsp;
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="Node.JS">Node.JS</label>&nbsp;&nbsp;
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="VUE">React</label>&nbsp;&nbsp;
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="VUE">VUE</label>&nbsp;&nbsp;
                                   </td>

						</tr>
						<tr>
								<th scope="row">DB<span class="font_red">*</span></th>
								<td colspan="3">
								        <label><input type="checkbox" class ="add_technic" name="add_technic" value="Oracle">Oracle</label>&nbsp;&nbsp;
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="MySQL">MySQL</label>&nbsp;&nbsp;
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="MariaDB">MariaDB</label>&nbsp;&nbsp;
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="PostgreSQL">PostgreSQL</label>&nbsp;&nbsp;
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="MongoDB">MongoDB</label>&nbsp;&nbsp;
										<label><input type="checkbox" class ="add_technic" name="add_technic" value="SQL Server">SQL Server</label>&nbsp;&nbsp;
                                </td>
						</tr>
					
					<!-- 등급 -->
						<tr>
							<th scope="row">등급<span class="font_red">*</span></th>			
								<td>			
									<select id="grade" name="grade">
										<option value="A">초급</option>
							            <option value="B">중급</option>
							            <option value="C">고급</option>
									</select>
								</td>
						</tr>					
				
					<!-- 희망 근무지 -->				
				
				
						<tr>
							<th scope="row">경력내용<span class="font_red">*</span></th>
								<td colspan="3">
									<textarea class="inputTxt p100" name="career_content" id="career_content" placeholder="경력사항을 입력하세요." /></textarea>
								</td>
						</tr>						
				
						<tr>
							<th scope="row">특이사항<span class="font_red">*</span></th>
								<td colspan="3">
									<textarea class="inputTxt p100" name="etc" id="etc" placeholder="특이사항을 입력하세요." /></textarea>
								</td>
						</tr>			
				</tbody>
			
				</table>
		</dd>
			</dl>
				</td>		
					</tr>
				</table>
					
				<div class="btn_areaC mt30">
					 <a 
						href="javascript:fcancleModal()" class="btnType gray" id="btnCloseLsmCod"><span>취소</span></a>
				</div>

		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</form>	
	</div>

      <div id="layer1" class="layerPop layerType2" style="width: 600px;"></div>
   

			
	
      

</form>
</body>
</html>