<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Job Korea</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script src="https://unpkg.com/axios@0.12.0/dist/axios.min.js"></script>
<script src="https://unpkg.com/lodash@4.13.1/lodash.min.js"></script>
<!-- D3 -->
<style>
//
click-able rows
	.clickable-rows {
	tbody tr td 
	{ cursor:pointer;
}

.el-table__expanded-cell {
	cursor: default;
	}
}
</style>
<script type="text/javascript">
	var pageSizeinf = 3;
	var pageBlockSizeinquiry = 10;
	var noticeareavar;
	var noticeeditvue;
	var vuevar;
	var vuebind;
	var vuecheck;
	var vueradio;
	var vueprop1;
	var vueprop2;
	var vueoption;
	var vuecompute;
	var watchExampleVM;
	
	$(document).ready(function(){
		init();
		fListInf();
		fRegisterButtonClickEvent();
	});
	
	function init(){
		
		Vue.component("my-component",{
			template:"<div>전역 컴포넌트</div>"
		});
		
		noticeareavar = new Vue({
			el: "#divNoticeList",
			components:{
				"bootstrap-table": BootstrapTable
			},
			data:{
				listitem:[]
			},
			methods:{
				detailview:function(no){
					alert(no);
					fNoticeModal(no);
				}
			}
		});
		
		noticeeditvue = new Vue({
			el: "#notice",
			data:{
				loginId:"",
				noticeTitle:"",
				noticeContent:"",
				loginIdread:"",
				noticeTitleread:"",
				noticeContentread:""
			}
		});
	}
		function fRegisterButtonClickEvent(){
			$("a[name=btn]").click(function(e){
				e.preventDefault();
				
				var btnId = $(this).attr("id");
				switch (btnId){
					case "btnClose" :
						gfCloseModal();
					break;
				}
			});
		}
		
		function fListInf(currentPage){
			
			currentPage = currentPage || 1;
			
			var param = {
					currentPage : currentPage,
					pageSize : pageSizeinf
			} 
			
			var resultCallback = function(data){
				fListInfResult(data, currentPage);
			};
			callAjax("/inf/listinfvue.do", "post", "json", true, param, resultCallback);
		}
		
		function fListInfResult(data, currentPage){
			
			noticeareavar.listitem = data.notice;
			
			var totalCntlistInf = data.noticeCnt;
			var list = $("#selectedInfNo").val();
			var paginationHtml = getPaginationHtml(currentPage, totalCntlistInf, pageSizeinf, pageBlockSizeinquiry, 'fListInf', [list]);
			$("#listInfPagenation").empty().append(paginationHtml);
		}
		
		function fNoticeModal(noticeNo){
			
			var param = { noticeNo : noticeNo};
			var resultCallback2 = function(data){
				fdetailResult(data);
			};
			callAjax("/system/detailNotice.do", "post", "json", true, param. resultCallback2);
			
		}
		
		function fdetailResult(data){
			if(data.resultMsg == "SUCCESS"){
				gfModalPop("#notice");
				frealPopModal(data.result);
			}else {
				alert(data.resultMsg);
			}
		}
		
		function frealPopModal(data){
			
			noticeeditvue.loginId = object.loginId;
			noticeeditvue.noticeTitle = object.noticeTitle;
			noticeeditvue.noticeContent = object.noticeContent;
			noticeeditvue.loginIdread = "readonly";
			noticeeditvue.noticeTitleread = "readonly";
			noticeeditvue.noticeContentread = "readonly";
			
			$("#noticeNo").val(oject.noticeNo);
			
		}
		
		function fn_valuedis(param){
			
			if(param == "inputnum"){
				alert("inputnum : " + vuevar.inputnum);
			}else{
				alert("inputtext : " + vuevar.inputtext);
			}
			
		}
	
	
</script>


</head>
<body>

<form id="myForm" action="" method="">
	<input type="hidden" id="currentPage" value="1">
	<input type="hidden" id="selectInfNo" value="">
	
	<div id="mask"></div>
	<div id="wrap_area">
		<h2 class="hidden">컨텐츠영역</h2>
		<div id="container">
			<Ul>
				<li class="lnb">
					<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>
				</li>
				<li class="contents">
					<h3 class="hidden">contens 영역</h3>
					<div class="content" style="margin-bottom: 20px;">
						<p class="Location">
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
							<span class="btn_nav bold">메인</span>
							<a href="../dashboard/dashboard.do" class="btn_set refresh">새로고침</a>
						</p>
						<div>
							<p class="conTile" style="margin-bottom: 1%;">
								<span>VueJS 개요</span>
								<span class="fr">관련 자료</span>
							</p>
							<div>
								<table>
									<tbody>
									
										<tr>
											<td><b><h6>시작</h6></b></td>
										</tr>
										<td>
											&nbsp&nbsp&nbsp&nbsp&nbsp
											<a href="https://brunch.co.kr/@clay1987/138" target="_blank">OverView</a>
										</td>
										
										<tr>
											<td><b><h6>VueJS 설치</h6></b></td>
											<td>
												&nbsp&nbsp&nbsp&nbsp&nbsp
												<a href="https://brunch.co.kr/@clay1987/138" target="_blank">OverView</a>
											</td>
										</tr>
										
										<tr>
											<td>VueJS Life Cycle</td>
											<td>
												&nbsp&nbsp&nbsp&nbsp&nbsp
												<a href="https://wormwlrm.github.io/2018/12/29/Understanding-Vue-Lifecycle-hooks.html"target="_blank">Life Cycle</a>
											</td>
										</tr>
										
										<tr>
											<td>공식 사이트</td>
											<td>
												&nbsp&nbsp&nbsp&nbsp&nbsp
												<a href="https://kr.vuejs.org/" target="_blank">공식 한국 VusJS</a>
												&nbsp&nbsp&nbsp&nbsp&nbsp
												<a href="https://vuejsexamples.com/" target="_blank">VusJS Example</a> 
												&nbsp&nbsp&nbsp&nbsp&nbsp
												<a href="https://cli.vuejs.org/" target="_blank">VusJS 개발도구 VueCli</a>
											</td>
										</tr>
										
										<tr>
											<td>Vue School</td>
											<td>
												&nbsp&nbsp&nbsp&nbsp&nbsp
												<a href="https://v3.ko.vuejs.org/api/instance-properties.html#el" target="_blank"> 인스턴스</a>
											</td>
										</tr>
										
										<tr>
											https://v3.ko.vuejs.org/api/instance-properties.html#el
										</tr>
										
										<tr>
											<td>VueJS 개인 블로그</td>
											<td>
												&nbsp&nbsp&nbsp&nbsp&nbsp
												<a href="https://codelabs-vue.web.app/" target="_blank">개인 블로그</a>
											</td>
										</tr>
										
										<tr>
											<td>자바스크립트</td>
											<td>
												&nbsp&nbsp&nbsp&nbsp&nbsp
												<a href="https://joshua1988.github.io/web-development/translation/essential-es6-features-for-vuejs/"target="_blank">EL6</a>
											</td>
										</tr>
										
										<tr>
											<td>테스트 사이트</td>
											<td>
												&nbsp&nbsp&nbsp&nbsp&nbsp
												<a href="https://jsfiddle.net/boilerplate/vue" target="_blank">jsfiddle</a>
											</td>
										</tr>
										
										<tr>
											<td>참조 사이트</td>
											<td>
												&nbsp&nbsp&nbsp&nbsp&nbsp
												<a href="https://medium.com/@hozacho/%EB%A7%A8%EB%95%85%EC%97%90-vuejs-8a50055b7551"target="_blank">Hoza Cho</a>
												&nbsp&nbsp&nbsp&nbsp&nbsp
												<a href="https://vuejsexamples.net/vue-table/" target="_blank">VueJS Table</a>
											</td>
										</tr>
										
										<tr>
											<td colspan="2">
												** VueJS Life Cycle 종류 별로 스크립트의 option으로 사용가능(beforeCreate, Create등)
											</td>
										</tr>
										
									</tbody>
								</table>
							</div>
						</div>
						<br><br>
						<p class="conTile" style="margin-bottom: 1%;">
							<span>공지사항(v-for, v-if)</span>
							<span class="fr">
								<a href="https://vuejsexamples.net/vue-table/" target="_blank">변경된 bootstrap-table</a>
							</span>
						</p>
						<table width="100%" class="col" border="0">
							<colgroup>
								<col width="100%">
							</colgroup>
							<tbody>
								<tr>
									<td style="text-align: left">
										1. 테이블 컴포넌트 사용 예<br>
										2. v-for, v-if 설명 
										&nbsp&nbsp&nbsp&nbsp&nbsp
										<a href="https://vuejsexamples.com/" target="_blank">VusJS Example</a>
										<br>
										3. Controller와 연동 설명
									</td>
								</tr>
							</tbody>
						</table>
						<div id="divNoticeList">
							<div id="bootstrap-table">
								<div class="fixed-table-toolbar">
									<div class="bs-bars pull-left"></div>
									<div class="columns columns-right btn-group pull-right"></div>
								</div>
								<div class="fixed-table-container" style="padding-bottom: 0px;">
									<div class="fixed-table-body">
										<table class="col">
											<caption>caption</caption>
											<colgroup>
												<col width="5%">
												<col width="70%">
												<col width="10%">
												<col width="5%">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">번호</th>
													<th scope="col">제목</th>
													<th scope="col">작성일</th>
													<th scope="col">작성자</th>
												</tr>
											</thead>
											<tbody id="listInf" v-for="(item,index) in listitem" v-if="listitem.length">
												<tr @click="detailview(item.noticeNo)">
													<td>{{ item.noteceNo }}</td>
													<td>{{ item.noticeTitle }}</td>
													<td>{{ item.noticeRegdate }}</td>
													<td>{{ item.loginId }}</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div>
										<div>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="paging_area"  id="listInfPagination"> </div>
						<div id="notice" class="layerPop layerType2" style="width: 600px;">
							<input type="hidden" id="noticeNo" name="noticeNo" value="${noticeNo}">
							<dl>
								<dt>
									<strong>공지사항</strong>
								</dt>
								<dd class="content">
									<table class="row">
										<caption>caption</caption>
										<tbody>
										
											<tr>
												<th scopr="row">작성자<span class="font-red">*</span></th>
												<td>
													<input type="text" class="inputTxt p100" name="loginId" id="loginId" v-model="loginId" v-bind:readonly="loginIdread">
												</td>
											</tr>
											
											<tr>
												<th scope="row">제목<span class="font-red">*</span></th>
												<td colspan="3">
													<input type="text" class="inputTxt p100" id="noticeTitle" name="noticeTile" v-model="noticeTitle" v-bind:readonly="noticeTitle">
												</td>
											</tr>
											
											<tr>
												<th scope="row">내용</th>
												<td colspan="3">
													<textarea class="inputTxt p100" id="noticeContent" name="noticeContent" v-model="noticeContent" v-bind:readonly="noticeContent"></textarea>
												</td>
											</tr>
											
										</tbody>
									</table>
									<div class="btn_areaC mt30">
										<a href="" class="btnType gray" id="btnClose" name="btn"><span>닫기</span></a>
									</div>
								</dd>
							</dl>
						</div>
					</div>
				</li>
			</Ul>
		</div>
	</div>
	
</form>

</body>
</html>