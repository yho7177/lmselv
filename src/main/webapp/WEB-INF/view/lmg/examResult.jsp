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
	$(document).ready(
			function() {
				// 진행중 시험, 완료된 시험등 무엇을 검색햇는지?!
				if("${param.searchType}" != '') {
					$("#searchType").val("${param.searchType}").prop("selected","selected");
				}
				
				// 무엇을 검색했는지 남겨놓기 위함
				$("#searchWord").val("${param.searchWord}");
					
			});
	
	function getTestDetail(ci_no, test_no) {
		let loginId = $(this).html();
		console.log(loginId, ci_no, test_no);
    	var param = {
				ci_no : ci_no, test_no : test_no, loginId : loginId
		}
		
		var resultCallback = function(data) {
    		
    		gfModalPop("#stuTestInfoLayer");
			$("#examInsert").empty().append(data);
		};

		callAjax("/lmg/inquireExam", "post", "text", false, param,
				resultCallback);
	}
	
	// 시험 응시 미응시 조회
	function testInfo(ci_no, test_no) {
		var param = {
				ci_no : ci_no, test_no : test_no
		}
		
		var resultCallback = function(data) {
			console.log(data);
			$("#output").empty().append(data);
		};

		callAjax("/lmg/testInfoSelect", "post", "text", false, param,
				resultCallback);
	}
</script>

</head>
<body>
	<input type="hidden" id="lectureNo" />
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
							<span class="btn_nav bold">학습관리</span> <span class="btn_nav bold">시험
								대상자 관리 </span> <a href="/lmg/exsubjectMgt.do" class="btn_set refresh">새로고침</a>
						</p>

						<br>


						<div>
						
						
							<form
								action="${pageContext.request.contextPath }/lmg/examResult.do"
								method="get" id="frm">
								<table>
									<tr>
										<td width="30" height="25" style="font-size: 100%">
											<select id = "searchType" name="searchType" >
												<option value="ing" selected>진행중인 시험</option>
												<option value="after">지난 시험</option>
												<option value="complete">완료된 시험</option>
											</select>
										</td>
										<td width="30" height="25" style="font-size: 100%"></td>
										<td width="100" height="25"
											style="font-size: 150%; font-weight: bold;">과정명</td>
										<td width="300" height="25" style="font-size: 100%"><input
											class="inputTxt p100" type="text" id="searchWord"
											name="searchWord" /></td>
										<td width="100" height="25" style="font-size: 100%">
											<!-- <input type="submit" class="btnType blue" value="검색" /> -->
											<input type="hidden" name="pageNo" value="${param.pageNo }" />
											<a href="#" onclick="document.getElementById('frm').submit();" class="btnType blue" ><span>검색</span></a>
										</td>
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
										<th scope="col">시험명</th>
										<th scope="col">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="i" items="${lst }" varStatus="status">
										<tr onclick="testInfo(${i.ci_no}, ${i.test_no })">
											<td>${i.ci_name }</td>
											<td>${i.test_name }</td>
											<td>
											<c:choose>
												<c:when test="${i.test_status == 'ing' }">
													진행중인 시험
												</c:when>
												<c:when test="${i.test_status == 'after' }">
													지난 시험
												</c:when>
												<c:when test="${i.test_status == 'complete' }">
													완료된 시험
												</c:when>
											</c:choose>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="paging_area" style="display: inline;">
							<div class="paging">
								<a class="first"
									href="/lmg/exsubjectMgt.do?pageNo=1&searchWord=${param.searchWord}&searchType=${param.searchType }"></a>
								<c:if test="${param.pageNo != 1 }">
									<a class="pre"
										href="/lmg/exsubjectMgt.do?pageNo=${param.pageNo - 1 }&searchWord=${param.searchWord}&searchType=${param.searchType } ">
									</a>
								</c:if>
								<c:forEach var="i" begin="${pi.startPageNoOfBlock }"
									end="${pi.endPageNoOfBlock }">
									<c:if test="${param.pageNo == i }">
										<a
										href="/lmg/exsubjectMgt.do?pageNo=${i }&searchType=${param.searchType }&searchWord=${param.searchWord}" class="page-item active"><strong>${i }</strong></a>
									</c:if>
									<c:if test="${param.pageNo != i }">
										<a
										href="/lmg/exsubjectMgt.do?pageNo=${i }&searchType=${param.searchType }&searchWord=${param.searchWord}" class="page-item active">${i }</a>
									</c:if>
									
								</c:forEach>
								<c:if
									test="${param.pageNo != pi.totalPage}">
									<a class="next"
										href="/lmg/exsubjectMgt.do?pageNo=${param.pageNo + 1 }&searchWord=${param.searchWord}&searchType=${param.searchType }">
									</a>
								</c:if>
								<a class="last"
									href="/lmg/exsubjectMgt.do?pageNo=${pi.totalPage }&searchWord=${param.searchWord}&searchType=${param.searchType }"></a>

							</div>
						</div><br/><br/>
						<div id="output">
						
						</div>
						
						
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3> <jsp:include
						page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
	
	<div id="stuTestInfoLayer" class="layerPosition layerPop layerType2"
		style="width: 1000px;">
			<div style="padding: 20px; margin: 20px;">
			<div id="examInsert">
						
						</div>
						<div align="center">
							<a href="javascript:gfCloseModal();" class="btnType gray"><span>닫기</span></a>
						</div>
			</div>
						
	</div>
</body>
</html>