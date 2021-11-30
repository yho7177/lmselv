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
	var pageSizeinf = 3;
	var pageBlockSizeinquiry = 10;
	var ss = new Array();
	

	$(function() {
		getExamStatistics();
	});

	function getExamStatistics(currentPage) {
		currentPage = currentPage || 1;

		var param = {
			currentPage : currentPage,
			pageSize : pageSizeinf
		}

		var resultCallback = function(data) {
			examStatisticsList(data, currentPage);
		};

		callAjax("/statistics/getExamStatistics.do", "post", "text", false,
				param, resultCallback);
	}

	function examStatisticsList(data, currentPage) {
		$('#listInf').empty();
		$("#listInf").append(data);

		// 총 개수 추출
		var totalCntlistInf = $("#totcnt").val();
		var list = $("#selectedInfNo").val();
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntlistInf,
				pageSizeinf, pageBlockSizeinquiry, 'getExamStatistics',
				[ list ]);
		console.log("paginationHtml : " + paginationHtml);

		$("#listInfPagination").empty().append(paginationHtml);
	}

	function getStatistics(ci_no) {
		ss = [];
		let current = $("#chart_div_check").val();
		$("#chart_div_check").val(ci_no);
		let after = $("#chart_div_check").val();
		
		var param = {
			ci_no : ci_no
		}

		var resultCallback = function(data) {
			ss.push([ '시험일자', '과락자수' ]);
			
				if(data.result == "true") {
					for(var i = 0; i < data.list.length; i++) {
						var a = new Array();
						a.push(data.list[i].test_start);
						a.push(data.list[i].totscore);
						ss.push(a);
					}
				
				console.log(current, after);
				if(current != after) {
					google.charts.load('current', {
						'packages' : [ 'corechart' ]
					});
					google.charts.setOnLoadCallback(drawChart);	
				}
				
			} else {
				$("#chart_div").html("시험정보가 없습니다!");
			}

		};

		callAjax("/statistics/getExamChart.do", "post", "json", true,
				param, resultCallback);
		
		
	}
	
	function drawChart() {
		
		$("#chart_div").empty();

		var data = google.visualization.arrayToDataTable(ss);

		var options = {
			title : '과락자 통계',
			hAxis : {
				title : '시험일자',
				titleTextStyle : {
					color : '#333'
				}
			},
			vAxis : {
				minValue : 0
			}
		};

		var chart = new google.visualization.AreaChart(document
				.getElementById('chart_div'));
		
			chart.draw(data, options);	
		
		

	}
</script>

</head>
<body>
	<input type="hidden" id="currentPage" value="1">
	<input type="hidden" id="selectedInfNo" value="">
	<input type="hidden" id ="chart_div_check" />
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
							<span class="btn_nav bold">통계</span> <span class="btn_nav bold">과락
								인원 </span> <a href="/statistics/failedNum.do" class="btn_set refresh">새로고침</a>
						</p>

						<br>
						<div>
							<table class="col">
								<colgroup>
									<col width="12%">
									<col width="12%">
									<col width="12%">
									<col width="12%">
								</colgroup>
								<tr>
									<td>개설기간</td>
									<td><input type="date" /></td>
									<td><input type="date" /></td>
									<td><a href="#" class="btnType gray"><span>검색</span></a></td>
								</tr>
							</table>
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
								<tbody id="listInf">

								</tbody>
							</table>
						</div>
						<br />
						<br />
						<div id="listInfPagination"></div>
						<br />
						<br />
						<div>
							<div id="chart_div" style="width: 100%; height: 500px;"></div>
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