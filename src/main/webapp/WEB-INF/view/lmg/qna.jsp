<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<style>

</style>
<meta charset=UTF-8>
<meta http-equiv="X-UA_Compatible" content="chrome"/>
<title>QnA</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript">
		//Qna 출력될 페이지 사이즈
		var pageSizeQnaCod = 5;
		var pageBlockSizeQnaCod = 5;
		
		//문서로드후 첫번째로 실행되게하는 함수
		$(function(){
			
			//qna 코드조회
			fListQnaCod();
			
			//bttn 클릭 이벤트
			fRegisterButtonClickEvent();
		});
		
		function fRegisterButtonClickEvent(){
			$('a[name=btn]').click(function(e){
				e.preventDefault();
				
				var btnId = $(this).attr('id'); //클릭된 속성에 id를 변수에 저장
				
				switch (btnId){
					case 'btnSaveGrpCod': //name값으로 호출 받아서 아래 함수 실행
						 fSaveGrpCod();
						break;
					case 'btnCloseCod':
						gfCloseModal();
						break;
					case 'btnUpdateQnaCod':
						fSaveGrpCod();
						break;
					case 'btnSearchQna':
						fSearchQna();
						break;
					case '':
					
						break;
					
					
				}
				
			});
		}
		
		function fSearchQna(currentPage){
			currentPage = currentPage || 1;
			
			var sname = $('#sname').val();
			var searchKey = document.getElementById("searchKey");
			var oname = searchKey.options[searchKey.selectedIndex].value;

			
			console.log("currentPage : " + currentPage);
			
			var param = {

					sname : sname
				,	oname : oname
				,	currentPage : currentPage
				,	pageSize : pageSizeQnaCod
			};
			
			var resultCallback = function(data){
				flistQnaCodResult(data, currentPage);
			};
			//Ajax실행 방식
			//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
			callAjax("/lmg/listQnaCod.do", "post", "text", true, param, resultCallback);
		}
		
		function fSaveGrpCod(){
			
			if(!fValidateGrpCod()){ //저장할 데이터가 올바르게 들어왔는지 체크
				return;
			}
			
			var resultCallback = function(data){
				fSaveQnaCodResult(data);
			};
//			                      url,         method를 "post"로 정의, dataType, async,         param,              callback함수
			callAjax("/lmg/saveQnaCttCod.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
		}
		
		
		
		function fSaveQnaCodResult(data){
			
			var currentPage = "1";
			if($("#action").val() !="I"){
				currentPage = $("#currentPageQnaCod").val();
			}
			
			if(data.result == "SUCCESS"){
				
				// 응답 메시지 출력
				swal(data.resultMsg);
				
				// 모달 닫기
				gfCloseModal();
				
				// 목록 조회
				fListQnaCod(currentPage);

			}else{
				// 오류 응답 메시지 출력
				swal(data.resultMsg);
				
			}
			//목록 조회
			fQnaFormCod();
		}
		
		
		
		function fValidateGrpCod(){ //저장할 데이터가 올바르게 들어왔는지 체크 후 리턴
			
			var chk = checkNotEmpty(
					[
							 	["qna_title","제목을 입력해 주세요"]
							,	["qna_content","내용을 입력해 주세요"]
							,	["login_ID","아이디를 입력해주세요"]
					 ]
					);
			
		if(!chk){
				return;
			}
			return true;
		}
		
		//입력창 팝업 새글을 쓰거나 조회해서  수정하거나
		function fPopModalQnaCod(qna_no) {
			alert("modal");
			// 새글작성 저장
			if (qna_no == null || qna_no=="") {
				//swal("여기도 찍어봅세  ");
				// Tranjection type 설정
				$("#action").val("I");
				
				// 새글 폼 초기화
				fQnaFormCod();
				
				// 모달 팝업
				gfModalPop("#layer1");

			
			} else {
				alert("2222222222222");
				// Tranjection type 설정
				$("#action").val("U");
				
				// 질의응답 단건 조회
				fSelectQnaCod(qna_no);
				console.log("asssss::::"+qna_no)
			}
		}
		
		// 질의응답 단건 조회
		function fSelectQnaCod(currentPage,  qna_no){
			console.log("qna_no::  "+qna_no);
			currentPage = currentPage || 1;
			
			$("#qna_no").val(qna_no);
			
			
			var param = {
					currentPage : currentPage
				,	qna_no : qna_no
			
			};
			
			
			var resultCallback = function(data){
				console.log("tttt: " + data);
				fSelectQnaCodResult(data);
			};
			
			callAjax("/lmg/selectQnaCttCod.do", "post", "json", true, param, resultCallback);
		}
			
		//질의 응답 단건 콜백함수
		function fSelectQnaCodResult(data){
			console.log("no: " + JSON.stringify(data));
			if(data.result == "SUCCESS"){
				
				//입력팝업창
				gfModalPop("#layer1");
				
				//수정
				fInitQnaFormCod(data.qnaCttModel);
				
				$("#action").val("U");
				
				
				}else{
				
					swal(data.resultMsg);
				}
		}
		
		function fInitQnaFormCod(object){
			console.log("dsasa"+ JSON.stringify(object));
				$("#qna_no").val("");
			
			if( object == "" || object == null || object == undefined) {
				
				$("#qna_title").focus();
				$("#qna_content").val("");
				$("#loginID").val("");
				$("#btnSaveGrpCod").val();
				
			}else {
					console.log("zzzzz: " +  object);
					$("#qna_title").val(object.qna_title);
					$("#qna_content").val(object.qna_content);
					$("#loginID").val(object.loginID);
					$("#qna_no").val(object.qna_no);
					//수정 저장 버튼
					$("#btnSaveGrpCod").val();
					
			
			}
			
}
		
		
		//질의 응답화면 띄우기 입력시 빈값 조회시 데이터 넣어주기
		function	fQnaFormCod(object){
				$("#qna_title").val("");
				
				if( object == "" || object == null || object == undefined) {
					
					$("#qna_content").val("");
					$("#loginID").val("");
					$("#qna_no").val("");
					
			}else{
				console.log("zzzzz: " +  JSON.stringify(object));
				$("#qna_title").val(object.qna_title);
				$("#qna_content").val(object.qna_content);
				$("#loginID").val(object.loginID);
				
				$("#qna_no").val(object.qna_no);
				
				
		   }
		}
		
		//작성된 질의응답 보기
		function fListQnaDtlCod(currentPage, qna_title, loginID){
			
			currentPage = currentPage || 1;
			
			
			
		}
		
		
		
	//qna화면 접속시 초기조회 화면	
	function fListQnaCod(currentPage){
		
		currentPage = currentPage || 1;
		
		
		
		console.log("currentPage : "+ currentPage);
		
		
		//틀잡아 놓은 테이블 비율과 타이틀
		var param = {
					
					currentPage : 	currentPage
				,	pageSize : pageSizeQnaCod
				
		}
		
		var resultCallback = function(data){
			flistQnaCodResult(data, currentPage);
		};
		//Ajax실행 방식
		//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
		callAjax("/lmg/listQnaCod.do","post","text",true,param, resultCallback);
	}
	
	
	
	//qna접속시 출력된는 과정
	function flistQnaCodResult(data, currentPage){ //  
		
		console.log(data);
		
		$('#listQnaCod').empty();
		
		$('#listQnaCod').append(data);
		
		//전체 순번 갯수
		var totalCntQnaCod = $("#totalCntQnaCod").val();
		
		//전체 순번 갯수를  토대로 페이지 내비게이션
		var paginationHtml = getPaginationHtml(currentPage, totalCntQnaCod, pageSizeQnaCod, pageBlockSizeQnaCod, 'fListQnaCod');
		console.log("paginationHtml: "+paginationHtml);
		
		$('#qnaCodPagination').empty().append(paginationHtml);
		
		$('#currentPageQnaCod').val(currentPage);
		
	}
	
</script>
</head>
<body>
<form id="myForm" action="" method="">
		<input type="hidden" id="currentPageQnaCod" value="1">
		<input type="hidden" id="currentPageComnDtlCod" value="1">
		<input type="hidden" id="tmpGrpCod" value="">
		<input type="hidden" id="tmpGrpCodNm" value="">
		<input type="hidden" name="action" id="action" value="">
		<div id="mask"></div>
		
		<div id="wrap_area">
			
			<h2 class="hidden">head</h2>
			<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
			
			<h2 class="hidden">컨텐츠</h2>
			<div id="container">
				<ul>
						<li class="lnb">
								<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>
						</li>
						<li class="contents">
							<h3 class="hidden">head</h3>
							<div class="content">
								<p class="Location">
									<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> 
									<span class="btn_nav bold">학습지원</span>
									<span class="btn_nav bold">학습자료</span>
									<a href="../lsp/document.do" class="btn_set refresh">새로고침</a>
								</p>
									<div>
										<select id="searchKey" name="searchKey" style="width:100px">
												<option value="">선택하세요</option>
												<option value="loginID">작성자</option>
												<option value="qna_title">제목</option>
												<!-- <option value="qna_no">순번</option> -->
										</select>
										<input type="text" style="width:150px; height:30px; font-size:18px" id="sname" name="sname">
										<!-- <input type="submit" value="검색" style="width:80px; height:30px; font-size:20px"> -->
										<a href="" class="btnType blue" id="btnSearchQna" name="btn"><span>검색</span></a>
									</div>
									<br>
									
									<div class="documentList">
											<table  class="col">
													<caption>caption</caption>
													<colgroup>
															<col width="10%">
															<col width="40%">
															<col width="30%">
															<col width="20%">
													</colgroup>
													
													<thead>
														<tr>
															<th scope="col">순번</th>
															<th scope="col">제목</th>
															<th scope="col">작성일</th>
															<th scope="col">작성자</th>
														</tr>
													</thead>
													<tbody id="listQnaCod"></tbody>
											</table>
										</div>
										<div class="paging_area" id="qnaCodPagination"></div>											
										
										<p class="conTitle"> <!--가로한줄 일정사이즈 여백 mt50는 여백사이즈 -->
											<span>질문 해주세요. 한참있다가........나중에 답변 드림</span> 
											<span class="fr"> 
											<a href="javascript:fPopModalQnaCod();" class="btnType blue" name="modal"><span>새글쓰기</span></a>
											</span>
											<!--클래스fr a tag를 오른쪽으로 붙인다.  -->
										</p>	
											
							</div>
							
							<h3 class="hidden">footer</h3>
								<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
						</li>		
				</ul>
			</div>
		</div>
		
		<div id="layer1" class="layerPop layerType2" style="width: 900px">
				<dl>
					<dt>
						<strong>질문하기</strong><!--창 제목  -->
					</dt>
					<dd class="content">
						<table class="row">
							<caption>caption</caption>
							<colgroup>
								<col width="120px">
								<col width="*">
								<col width="120px">
								<col width="*">
							</colgroup>
								
								<tbody>
								
									<tr class="hidden">
										<th scope="row">번호<span class="font_red">*</span></th>
										<td><input type="text" class="inputTxt p100" name="qna_no" id="qna_no" value="${qna_no }"/></td>
									</tr>  
									<tr>
										<th scope="row">제목<span class="font_red">*</span></th>
										<td><input type="text" class="inputTxt p100" name="qna_title" id="qna_title"/></td>
									</tr>
									<tr>
										<th scope="row">내용<span class="font_red">*</span></th>
										<td><textarea  class="" name="qna_content" id="qna_content" style="width: 600px; height: 300px; font-size: 20px;"></textarea></td>
									</tr>
									<tr>
										<th scope="row">작성자<span class="font_red">*</span></th>
										<td><input type="text" class="inputTxt p100" name="loginID" id="loginID"></td>
									</tr>
									
								</tbody>
						</table>
						<div class="btn_areaC mt30">
								<a href="" class="btnType blue" id="btnSaveGrpCod" name="btn"><span>저장</span></a>
								<a href="" class="btnType blue" id="btnUpdateQnaCod" name="btn"><span>수정 완료</span></a>
								<a href="" class="btnType gray" id="btnCloseCod" name="btn"><span>취소</span></a>
						</div>
					</dd>
				</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>
</form>
</body>
</html>