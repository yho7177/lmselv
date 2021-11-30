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
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->

<script type="text/javascript">
	$(function() {
		// 구글 차트
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
		// 기간 검색 결과 유지
		$("#searchStart").val("${param.searchStart}");
		$("#searchEnd").val("${param.searchEnd}");
		
		// 검색 시작시간 저장
		$("#searchStart").change(function() {
			var start = $(this).val();
			$("#searchStartVal").val(start);
		});
		
		// 검색 끝시간 저장
		$("#searchEnd").change(function() {
			var end = $(this).val();
			$("#searchEndVal").val(end);
		})
	});
	
	
	// 구글 차트
	 function drawChart() {
		 	var arr = new Array();
		 	arr.push(['Month', '수강인원수']);
		 	<c:forEach items="${date}" var = "i" varStatus="status">
		 	var tmpAr = new Array();
    		tmpAr.push("${i.date}");
    		tmpAr.push(parseInt("${i.num}"));
    		arr.push(tmpAr);
        	</c:forEach>
        	console.log(arr);
	        var data = google.visualization.arrayToDataTable(arr);
			
	        var options = {
	          title: '월별 수강 인원수 변화',
	          curveType: 'function',
	          legend: { position: 'bottom' }
	        };

	        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

	        chart.draw(data, options);
	      }
	 
	// 기간 검색 submit
	 function scFmSubmit() {
		 document.getElementById("scFm").submit();
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
							<span class="btn_nav bold">통계</span> <span class="btn_nav bold">수강인원 </span> <a href="/statistics/studentNum.do" class="btn_set refresh">새로고침</a>
						</p>
	
						<br>
						<div>
							<form action="/statistics/studentNum.do" method="get" id="scFm">
							<table class="col">
								<colgroup>
									<col width="12%">
									<col width="12%">
									<col width="12%">
									<col width="12%">
								</colgroup>
								<tr>
									<td>개설기간</td>
									<td><input type="month" id="searchStart" /></td>
									<td><input type="month" id="searchEnd" /></td>
									<td><a href="javascript:scFmSubmit();" class="btnType gray"><span>검색</span></a></td>
								</tr>
							</table>
								<input type="hidden" name="pageNo" value="1"/>
								<input type="hidden" id="searchStartVal" name="searchStart" value="${param.searchStart }" />
								<input type="hidden" id="searchEndVal" name="searchEnd" value="${param.searchEnd }" />
							</form>
						</div>
						<br />
						<br />
						<div>
							<table class="col">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">과정명</th>
										<th scope="col">기간</th>
										<th scope="col">대상자수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="i" items="${lst }" varStatus="status">
										<tr>
											<td>${i.ci_name }</td>
											<td>${i.ci_start } ~ ${i.ci_end }</td>
											<td>${cnt[status.index] }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<br />
						<br />
						<div class="paging_area" style="display: inline;">
							<div class="paging">
								<a class="first"
									href="/statistics/studentNum.do?pageNo=1&searchStart=${param.searchStart }&searchEnd=${param.searchEnd}"></a>
								<c:if test="${param.pageNo != 1 }">
									<a class="pre"
										href="/statistics/studentNum.do?pageNo=${param.pageNo - 1 }&searchStart=${param.searchStart }&searchEnd=${param.searchEnd}">
									</a>
								</c:if>
								<c:forEach var="i" begin="${pi.startPageNoOfBlock }"
									end="${pi.endPageNoOfBlock }">
									<c:if test="${param.pageNo == i }">
										<a
										href="/statistics/studentNum.do?pageNo=${i }&searchStart=${param.searchStart }&searchEnd=${param.searchEnd}" class="page-item active"><strong>${i }</strong></a>
									</c:if>
									<c:if test="${param.pageNo != i }">
										<a
										href="/statistics/studentNum.do?pageNo=${i }&searchStart=${param.searchStart }&searchEnd=${param.searchEnd}" class="page-item active">${i }</a>
									</c:if>
									
								</c:forEach>
								<c:if
									test="${param.pageNo != pi.totalPage}">
									<a class="next"
										href="/statistics/studentNum.do?pageNo=${param.pageNo + 1 }&searchStart=${param.searchStart }&searchEnd=${param.searchEnd}">
									</a>
								</c:if>
								<a class="last"
									href="/statistics/studentNum.do?pageNo=${pi.totalPage }&searchStart=${param.searchStart }&searchEnd=${param.searchEnd}"></a>
							</div>
						</div>
						<br />
						<br />
						<div>
							<div id="curve_chart" style="width: 100%; height: 500px;"></div>
						</div>
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3> <jsp:include
						page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>