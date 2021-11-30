<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>SamplePage1</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->

<script type="text/javascript">

	
    $(document).ready(function() {
    	$("#testUpdateId").hide();
    	// 무엇을 검색했는지 남겨놓기 위함
    	$("#searchWord").val("${param.searchWord}");
    	
    	// 과정명 클릭했을때 시험 정보 가져오기
    	$(".lectureName").click(function() {
    			
    			
    			let l_no = $(this).attr("id");
    			l_no = l_no.split("_")[1];
    			$("#lectureNo").val(l_no);
    			getLectureExams();    	
    	});
	});
    // 시험 정보 수정
   	function updateTestInfo() {
   		let test_no = $("#test_no").val();
   		let ci_no = $("#lectureNo").val();
   		let test_name = $("#test_name").val();
   		let test_start = $("#test_start").val();
   		let test_end = $("#test_end").val();
   		
   		let param = {
				test_no : test_no,
				ci_no : ci_no,
				test_name : test_name,
				test_start : test_start,
				test_end : test_end
		};
    	
		var resultCallback = function(data) {
			console.log(data);
			cancelModal(); 
			gfCloseModal();
			getLectureExams();
		};
		
		callAjax("/lmg/updateTestInfo", "post", "text", false, param, resultCallback);
   	}
    
    // 시험 정보 수정 사전 작업
    function testUpdate(test_no) {
    	$("#testUpdateId").show();
    	$("#addTestFirId").hide();
    	$("#test_no").val(test_no);
    	
    	let param = {
				test_no : test_no
		};
    	
		var resultCallback = function(data) {
			console.log(data);
			$("#test_name").val(data.name);
			$("#test_start").val(data.start);
			$("#test_end").val(data.end);
			gfModalPop("#layer2");
		};
		
		callAjax("/lmg/testUpdate", "post", "json", false, param, resultCallback);
    }
    
    function getLectureExams() {
    	// 강의번호 가져오기
		let l_no = $("#lectureNo").val();
		let param = {
				l_no : l_no
		}
		var resultCallback = function(data) {
			getTestList(data);
		};
		
		callAjax("/lmg/getTestList", "post", "text", false, param, resultCallback);
    }
    
    // 시험 정보 삭제 모달
    function testDeleteModal(test_no) {
    	$("#DelLayerTest_no").val(test_no);
    	gfModalPop("#testDelLayer");
    }
    
    // 시험 정보 페이징
    function testPaging(pageNo) {
    	console.log(pageNo)
    	var l_no = $("#lectureNo").val();
		let param = {
				l_no : l_no,
				pageNo : pageNo
		}
		
    	var resultCallback = function(data) {
			getTestList(data);
			console.log("찍히냐?")
		};
		
    	callAjax("/lmg/getTestList", "post", "text", false, param, resultCallback);
    }
    
    // 강의에 대한 시험등록 초기 절차(시험에 대한 개략적 정보) submit
    function addTestFir() {
    	let no = $("#lectureNo").val();
    	let name = $("#test_name").val();
    	let start = $("#test_start").val();
    	let end = $("#test_end").val();
    	
    	let result = addTestFirCheck(name, start, end);
    	let param = {
    			ci_no : no,
    			test_name : name,
    			test_start : start,
    			test_end : end
    	}
    	
    	var resultCallback = function(data) {
			console.log(data);
		};
		
		if(result) {
			// 시험정보 등록 ajax
			callAjax("/lmg/addTestFir", "post", "text", false, param, resultCallback);
			gfCloseModal();
			
			getLectureExams();
		}
		
    }
    
    // 강의에 대한 시험등록 초기 절차(시험에 대한 개략적 정보) submit 유효성 검사
    function addTestFirCheck(name, start, end) {
    		let nameCheck = false;
    		let startCheck = false;
    		let endCheck = false;
    		
    		if(name.length > 0) {
    			nameCheck = true;
    			$("#nameError").html("");
    		} else {
    			$("#nameError").html("시험명을 입력해주세요!");
    		}
    		
    		if(start.length > 0) {
    			startCheck = true;
    			$("#startError").html("");
    		} else {
    			$("#startError").html("시작일을 입력해주세요!");
    		}
    		
    		if(end.length > 0) {
    			endCheck = true;
    			$("#endError").html("");
    		} else {
    			$("#endError").html("마감일을 입력해주세요!");
    		}
    		
    		return nameCheck && startCheck && endCheck ? true : false;
    }
    
    // 모달 닫기
    function cancelModal() {
    	
		$("#q_no").val(null); // 문제번호
		$("#t_que").val(null); // 문제
		$("#t_ans").val(null); // 정답
		$("#t_ex1").val(null); // 보기1
		$("#t_ex2").val(null); // 보기2
		$("#t_ex3").val(null); // 보기3
		$("#t_ex4").val(null); // 보기4
		$("#test_name").val(null);
		$("#test_start").val(null);
		$("#test_end").val(null);
		$("#hideBtn").empty();
		$("#infoMessage").html("");
    	gfCloseModal();
    }
	// 강의에 대한 시험등록 초기 절차(시험에 대한 개략적 정보)
    function testAdd() {
    	$("#testUpdateId").hide();
		$("#addTestFirId").show();
    	gfModalPop("#layer2");
    }
 // 강의에 대한 시험 문제 리스트  출력
    function testInputModal(test_no) {
	 	$("#test_no").val(test_no);
    	gfModalPop("#layer1");
    	
    	var param = {test_no: test_no};
    	
    	var resultCallback = function(data){
    		$("#problemList").empty().append(data);
    	}
    	
    	callAjax("/lmg/getProblemList", "post", "text", false, param, resultCallback);
    }
    
	function getTestList(data) {
		$("#testList").empty().append(data);
	}
	
	// 문제별로 등록 - ajax 써야겠당..
	function problemAdd() {
		let test_no = $("#test_no").val();
		let ci_no = $("#lectureNo").val();
		let q_no =  $("#q_no").val(); // 문제번호
		let t_que = $("#t_que").val(); // 문제
		let t_ans = $("#t_ans").val(); // 정답
		let t_ex1 = $("#t_ex1").val(); // 보기1
		let t_ex2 = $("#t_ex2").val(); // 보기2
		let t_ex3 = $("#t_ex3").val(); // 보기3
		let t_ex4 = $("#t_ex4").val(); // 보기4
		
		let check = problemAddCheck(q_no, t_que, t_ans, t_ex1, t_ex2, t_ex3, t_ex4);
		let param = {
				test_no : test_no,
				ci_no : ci_no,
				q_no : q_no,
				t_que : t_que,
				t_ans : t_ans,
				t_ex1 : t_ex1,
				t_ex2 : t_ex2,
				t_ex3 : t_ex3,
				t_ex4 : t_ex4
		}
		
		var resultCallback = function(data) {
			
			var message = (data == "success") ? "등록완료!" : "등록 오류!";
			$("#infoMessage").html(message);
			testInputModal(test_no);
		};
		
		if(check) {
			callAjax("/lmg/problemAdd", "post", "text", false, param, resultCallback);	
		}
    	
	}
	
	function  problemAddCheck(q_no, t_que, t_ans, t_ex1, t_ex2, t_ex3, t_ex4) {
		let q_noCheck = false;
		let t_queCheck = false;
		let t_ansCheck = false;
		let t_ex1Check = false;
		let t_ex2Check = false;
		let t_ex3Check = false;
		let t_ex4Check = false;
		
		if(q_no == "") {
			$("#q_noError").html("문제번호를 입력해주세요!");
		} else if(q_no < 1 || q_no > 5) {
			$("#q_noError").html("번호는 1 ~ 5까지 입력가능합니다!");
		} else if (q_no > 0 && q_no <6) {
			q_noCheck = true;
			$("#q_noError").html("");
		}
		
		if(t_que.length > 0) {
			t_queCheck = true;
			$("#t_queError").html("");
		} else if (t_que.length < 1) {
			$("#t_queError").html("문제를 입력해주세요!");
		}
		
		if(t_ans == "") {
			$("#t_ansError").html("정답을 입력해주세요!");
		} else if(t_ans < 1 || t_ans > 4) {
			$("#t_ansError").html("정답은 1 ~ 4까지 입력가능합니다!");
		} else if (t_ans > 0 && t_ans < 5) {
			t_ansCheck = true;
			$("#t_ansError").html("");
		}
		
		if(t_ex1.length > 0) {
			t_ex1Check = true;
			$("#t_ex1Error").html("");
		} else if (t_ex1.length < 1) {
			$("#t_ex1Error").html("보기를 입력해주세요!");
		}
		if(t_ex2.length > 0) {
			t_ex2Check = true;
			$("#t_ex2Error").html("");
		} else if (t_ex2.length < 1) {
			$("#t_ex2Error").html("보기를 입력해주세요!");
		}
		if(t_ex3.length > 0) {
			t_ex3Check = true;
			$("#t_ex3Error").html("");
		} else if (t_ex3.length < 1) {
			$("#t_ex3Error").html("보기를 입력해주세요!");
		}
		if(t_ex4.length > 0) {
			t_ex4Check = true;
			$("#t_ex4Error").html("");
		} else if (t_ex4.length < 1) {
			$("#t_ex4Error").html("보기를 입력해주세요!");
		}
		
		return q_noCheck && t_queCheck && t_ansCheck && t_ex1Check && t_ex2Check && t_ex3Check && t_ex4Check ? true : false;
	}
	
	// 시험문제 등록 모달에서 문제 클릭했을떄 수정하기 위한 데이터 가져오기 ajax
	function problemDetail(test_no, q_no) {
		var param = {test_no : test_no, q_no : q_no};
		
		var resultCallback = function(data) {
			console.log(data);
			$("#q_no").val(data.q_no);
			$("#t_ans").val(data.t_ans);
			$("#t_que").val(data.t_que);
			$("#t_ex1").val(data.t_ex1);
			$("#t_ex2").val(data.t_ex2);
			$("#t_ex3").val(data.t_ex3);
			$("#t_ex4").val(data.t_ex4);
			$("#hideBtn").html('<a href="javascript:updateProblem(' + data.q_no + ',' + data.test_no + ')" class="btnType blue"><span>문제 수정</span></a><a href="javascript:deleteProblem(' + data.q_no + ',' + data.test_no + ');" class="btnType blue"><span>문제 삭제</span></a>');
		};
		
		callAjax("/lmg/problemDetail", "post", "json", false, param, resultCallback);
	}
	
	// 문제 하나를 삭제하는 ajax
	function deleteProblem(q_no, test_no) {
		var param = {q_no : q_no, test_no : test_no};
		var resultCallback = function(data) {
			let message = (data == "success") ? "삭제 완료!" : "삭제 오류!";
			$("#infoMessage").html(message);
			testInputModal(test_no);
		};
		
		callAjax("/lmg/deleteProblem", "post", "text", false, param, resultCallback);
	}
	// 문제 하나를 수정하는 ajax
	function updateProblem(q_no_org, test_no) {
		
		let q_no =  $("#q_no").val(); // 문제번호
		let t_que = $("#t_que").val(); // 문제
		let t_ans = $("#t_ans").val(); // 정답
		let t_ex1 = $("#t_ex1").val(); // 보기1
		let t_ex2 = $("#t_ex2").val(); // 보기2
		let t_ex3 = $("#t_ex3").val(); // 보기3
		let t_ex4 = $("#t_ex4").val(); // 보기4
		
		var param = {
							q_no_org : q_no_org,
							test_no : test_no,
							q_no : q_no,
							t_que : t_que,
							t_ans : t_ans,
							t_ex1 : t_ex1,
							t_ex2 : t_ex2,
							t_ex3 : t_ex3,
							t_ex4 : t_ex4
							
						};
		var resultCallback = function(data) {
			let message = (data == "success") ? "수정 완료!" : "수정 오류!";
			$("#infoMessage").html(message);
			testInputModal(test_no);
		};
		
		callAjax("/lmg/updateProblem", "post", "text", false, param, resultCallback);
	}
</script>

</head>
<body>
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
							<span class="btn_nav bold">학습관리</span> <span class="btn_nav bold">시험문제관리
							</span> <a href="/lmg/examMgt.do" class="btn_set refresh">새로고침</a>
						</p>

						<br>


						<div>
							<form action="${pageContext.request.contextPath }/lmg/examMgt.do"
								method="get" id="examMgtFrm">
								<table>
									<tr>
										<td width="30" height="25" style="font-size: 100%"></td>
										<td width="100" height="25"
											style="font-size: 150%; font-weight: bold;">과정명</td>
										<td width="300" height="25" style="font-size: 100%"><input
											class="inputTxt p100" type="text" id="searchWord"
											name="searchWord" /></td>
										<td width="100" height="25" style="font-size: 100%"><a
											href="#"
											onclick="document.getElementById('examMgtFrm').submit()"
											class="btnType blue"><span>검색</span></a></td>
									</tr>
								</table>
							</form>
						</div>

						<br />
						<div>
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="30%">
									<col width="12%">
									<col width="23%">

								</colgroup>

								<thead>
									<tr>
										<th scope="col">과정명</th>
										<th scope="col">강사 아이디</th>
										<th scope="col">기간</th>

									</tr>
								</thead>
								<tbody>
									<c:if test="${result != null }">
										<tr>
											<td colspan="3">${result }</td>
										</tr>
									</c:if>
									<c:forEach var="i" items="${lecture }">
										<tr>
											<td class="lectureName" id="lecture_${i.ci_no }">${i.ci_name }</td>
											<td>${i.loginID }</td>
											<td>${i.ci_start }~${i.ci_end }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="paging_area" style="display: inline;">
							<div class="paging">
								<a class="first"
									href="/lmg/examMgt.do?pageNo=1&searchWord=${param.searchWord}"></a>
								<c:if test="${param.pageNo != 1 }">
									<a class="pre"
										href="/lmg/examMgt.do?pageNo=${param.pageNo - 1 }&searchWord=${param.searchWord}">
									</a>
								</c:if>
								<c:forEach var="i" begin="${pi.startPageNoOfBlock }"
									end="${pi.endPageNoOfBlock }" >
									<c:if test="${(param.pageNo - 1) == (i - 1) }">
										<a
										href="/lmg/examMgt.do?pageNo=${i }&searchWord=${param.searchWord}"><strong>${i }</strong></a>
									</c:if>
									<c:if test="${(param.pageNo - 1) != (i - 1) }">
										<a
										href="/lmg/examMgt.do?pageNo=${i }&searchWord=${param.searchWord}">${i }</a>
									</c:if>
								</c:forEach>
								<c:if
									test="${param.pageNo != pi.totalPage or param.pageNo != null}">
									<a class="next"
										href="/lmg/examMgt.do?pageNo=${param.pageNo + 1 }&searchWord=${param.searchWord}">
									</a>
								</c:if>
								<a class="last"
									href="/lmg/examMgt.do?pageNo=${pi.totalPage}&searchWord=${param.searchWord}"></a>

							</div>
						</div>

						<br /> <br />

						<div id="testList"></div>
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3> <jsp:include
						page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!--// 모달팝업 -->
	<div id="layer1" class="layerPosition layerPop layerType2"
		style="width: 1150px;">
		<input type="hidden" id="test_no" name="test_no" /> <br> <br>
		<strong style="font-size: 120%">&nbsp;&nbsp;&nbsp;&nbsp;시험 문제
			등록</strong> <br> <br>
		<table class="row">
			<colgroup>
				<col width="80px">
				<col width="*">
				<col width="80px">
				<col width="*">
				<col width="80px">
				<col width="*">
				<col width="80px">
			</colgroup>
			<tr>
				<th scope="row">문제번호</th>
				<td scope="row"><input type="number" min="1" max="5" id="q_no"
					name="q_no" /></td>
				<th scope="row">문제</th>
				<td scope="row"><input type="text" id="t_que" name="t_que" /></td>
				<th scope="row">정답</th>
				<td scope="row"><input type="number" min="1" max="4" id="t_ans"
					name="t_ans" /></td>
			</tr>
			<tr>
				<th scope="row" id="q_noError" colspan="2"></th>
				<th scope="row" id="t_queError" colspan="2"></th>
				<th scope="row" id="t_ansError" colspan="2"></th>
			</tr>
			<tr>
				<th scope="row">보기1</th>
				<td scope="row"><input type="text" id="t_ex1" name="t_ex1" /></td>
				<th scope="row">보기2</th>
				<td scope="row"><input type="text" id="t_ex2" name="t_ex2" /></td>
				<th scope="row">보기3</th>
				<td scope="row"><input type="text" id="t_ex3" name="t_ex3" /></td>
				<th scope="row">보기4</th>
				<td scope="row"><input type="text" id="t_ex4" name="t_ex4" /></td>
			</tr>
			<tr>
				<th scope="row" id="t_ex1Error" colspan="2"></th>
				<th scope="row" id="t_ex2Error" colspan="2"></th>
				<th scope="row" id="t_ex3Error" colspan="2"></th>
				<th scope="row" id="t_ex4Error" colspan="2"></th>
			</tr>
			<tr>
				<td><a href="javascript:problemAdd()" class="btnType blue"><span>문제
							등록</span></a></td>

				<!-- 문제 클릭 했을떄 나오게끔 -->

				<td id="hideBtn"></td>
				<td><a href="javascript:cancelModal();" class="btnType gray"><span>닫기</span></a></td>
			</tr>
		</table>
		<br /> <br />
		<div>
			정보 : <span id="infoMessage"></span>
		</div>
		<br /> <br />
		<div id="problemList"></div>
	</div>

	<div id="layer2" class="layerPosition layerPop layerType2"
		style="width: 600px;">
		<br> <br> <strong style="font-size: 120%">&nbsp;&nbsp;&nbsp;&nbsp;시험등록</strong>
		<br> <br>

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
				<th scope="row">시험명<span class="font_red">*</span></th>
				<td colspan="2"><input type="text" id="test_name" /></td>
				<td id="nameError"></td>
				<td><input type="hidden" id="lectureNo" /></td>
			</tr>
			<tr>
				<th scope="row">시험 시작일 <span class="font_red">*</span></th>
				<td colspan="2"><input type="date" id="test_start" /></td>
				<td id="startError"></td>
			</tr>
			<tr>
				<th scope="row">시험 마감일 <span class="font_red">*</span></th>
				<td colspan="2"><input type="date" id="test_end" /></td>
				<td id="endError"></td>
			</tr>
		</table>


		<div class="btn_areaC mt30">
			<a id="addTestFirId" href="javascript:addTestFir();" class="btnType blue"> <span>시험 등록</span></a>
			<a id="testUpdateId" href="javascript:updateTestInfo();" class="btnType blue"> <span>시험 수정</span></a>
			<a href="javascript:cancelModal();" class="btnType gray"><span>취소</span></a>
		</div>
	</div>
	
	<div id="testDelLayer" class="layerPosition layerPop layerType2"
		style="width: 600px;">
			<h1 style="text-align: center">정말로 삭제하시겠습니까?</h1><br /><br />
			<form action="/lmg/testInfoDel.do" method="get" id="testInfoDelFrm">
				<input type="hidden" id="DelLayerTest_no" name="test_no" />
				<a href="javascript:document.getElementById('testInfoDelFrm').submit();" class="btnType gray"><span>예</span></a>
				<a href="javascript:cancelModal();" class="btnType gray"><span>아니오</span></a>
			</form>
	</div>


</body>
</html>