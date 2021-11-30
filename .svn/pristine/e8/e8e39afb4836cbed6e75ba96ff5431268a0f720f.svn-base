<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>강의실관리</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
	// 페이징 설정 
	var pageSize = 5; // 화면에 뿌릴 데이터 수 
	var pageBlock = 5; // 블럭으로 잡히는 페이징처리 수

	// 장비 페이징 설정
	var pageSizeComnDtlCod = 5;
	var pageBlockSizeComnDtlCod = 10;

	/* onload 이벤트  */
	$(function() {
		// 강의실 리스트 뿌리기 함수 
		selectCommodityList();

		// 버튼 이벤트 등록 (저장, 수정, 삭제, 모달창 닫기)
		fButtonClickEvent();

	});
	/* 버튼 이벤트 등록 - 저장, 수정, 삭제  */
	function fButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault(); // ?? 

			var btnId = $(this).attr('id');

			//alert("btnId : " + btnId);

			switch (btnId) {
			case 'btnSaveCommodity':
				fSaveCommodity(); // save 안에 저장,수정
				//alert("저장버튼 클릭!!!이벤트!!");
				break;
			case 'btnDeleteCommodity':
				fDeleteCommodity(); // 만들자 
				//alert("삭제버튼 클릭!!!이벤트!!");		
				break;
			case 'btnClose':
				gfCloseModal(); // 모달닫기 
				break;
			case 'btnUpdateCommodity':
				fUpdateCommodity(); // 수정하기
				break;
			case 'searchBtn':
				selectCommodityList(); // 검색하기
				break;
			case 'itemSaveBtn':
				fItemSave();
				break;
			case 'itemDeleteBtn':
				fItemDelete();
				break;
			case 'closeBtn':
				gfCloseModal();
				break;
			}
		});
	}

	/* 강의실 리스트 data를 콜백함수를 통해 뿌려봅시당   */
	function commodityListResult(data, currentPage) {

		console.log(data);

		// 일단 기존 목록을 삭제합니다. (변경시 재부팅 용)
		$('#commodityList').empty();

		$('#commodityList').append(data);

		// 리스트의 총 개수를 추출합니다. 
		var totalCnt = $("#totcnt").val(); // qnaRealList() 에서보낸값 

		// * 페이지 네비게이션 생성 (만들어져있는 함수를 사용한다 -common.js)
		// function getPaginationHtml(currentPage, totalCount, pageRow, blockPage, pageFunc, exParams)
		// 파라미터를 참조합시다. 
		var list = $("#tmpList").val();
		//var listnum = $("#tmpListNum").val();
		var pagingnavi = getPaginationHtml(currentPage, totalCnt, pageSize, pageBlock, 'selectCommodityList', [ list ]);

		console.log("pagingnavi : " + pagingnavi);
		// 비운다음에 다시 append 
		$("#pagingnavi").empty().append(pagingnavi); // 위에꺼를 첨부합니다. 

		// 현재 페이지 설정 
		$("#currentPage").val(currentPage);

	}

	/*강의실 상세 조회*/
	function fdetailModal(rNo) {
		// 		 alert(" 상세 조회  ");

		var param = {
			rNo : rNo
		};
		var resultCallback2 = function(data) {
			fdetailResult(data);
		};

		callAjax("/cmg/detailCommodityNo.do", "post", "json", true, param, resultCallback2);
		// 		 alert(" 상세 조회  22");
	}

	/*  강의실 상세 조회 -> 콜백함수   */
	function fdetailResult(data) {

		// 		 alert("상세 조회  33");
		if (data.resultMsg == "SUCCESS") {
			//모달 띄우기 
			gfModalPop("#commodity");

			// 모달에 정보 넣기 
			frealPopModal(data.result);

		} else {
			alert(data.resultMsg);
		}
	}

	//검색  
	function selectCommodityList(currentPage) {

		currentPage = currentPage || 1;

		var srName = $('#srName').val();

		// 	         alert("srName : " + srName);

		var param = {
			srName : srName,
			currentPage : currentPage,
			pageSize : pageSize
		}

		var resultCallback = function(data) {
			commodityListResult(data, currentPage);
		};

		callAjax("/cmg/commodityList.do", "post", "text", true, param, resultCallback);
	}

	/* 강의실 모달창(팝업) 실행  */
	function fCommodityModal(rNo) {

		// 신규저장 하기 버튼 클릭시 (값이 null)
		if (rNo == null || rNo == "") {
			// Tranjection type 설정
			//alert("넘을 찍어보자!!!!!!" + commodityNo);

			$("#action").val("I"); // insert 
			frealPopModal(); // 공지사항 초기화 

			//모달 팝업 모양 오픈! (빈거) _ 있는 함수 쓰는거임. 
			gfModalPop("#commodity");

		} else {
			// Tranjection type 설정
			$("#action").val("U"); // update
			fdetailModal(rNo); //번호로 -> 공지사항 상세 조회 팝업 띄우기
		}

	}

	/* 팝업 _ 초기화 페이지(신규) 혹은 내용뿌리기  */
	function frealPopModal(object) {
		if (object == "" || object == null || object == undefined) {
			var writer = $("#swriter").val();
			//var Now = new Date();
			// 			 $("#loginId").val(writer);
			// 			 $("#loginId").attr("readonly", true);

			$("#rNo").val("");
			$("#rName").val("");
			$("#rSize").val("");
			$("#rSit").val("");
			$("#rContent").val("");

			$("#btnDeleteCommodity").hide(); // 삭제버튼 숨기기
			$("#btnUpdateCommodity").hide();
			$("#btnSaveCommodity").show();

		} else {

			console.log("1111111111111 : " + JSON.stringify(object));
			//alert("숫자찍어보세 : " + object.wno);// 페이징 처리가 제대로 안되서 
			// 			 $("#rNo").val(object.rNo);
			$("#rName").val(object.rName);
			$("#rSize").val(object.rSize);
			$("#rSit").val(object.rSit);
			$("#rContent").val(object.rContent);

			//////object.noticeNo

			$("#rNo").val(object.rNo); // 중요한 num 값도 숨겨서 받아온다. 

			$("#btnDeleteCommodity").show(); // 삭제버튼 보이기 
			$("#btnSaveCommodity").hide();
			$("#btnUpdateCommodity").css("display", "");
			//if문써서 로그인 아이디 == 작성자 아이디 일치시  --- 추가하기 
			//$("#grp_cod").attr("readonly", false);  // false, true(읽기만)로 수정

		}
	}

	/* 팝업내 수정, 저장 validation */
	function fValidatePopup() {
		var chk = checkNotEmpty([ [ "rContent", "내용을 입력해주세요!" ] ]);

		if (!chk) {
			return;
		}
		return true;
	}

	/* 강의실 등록(저장) */
	function fSaveCommodity() {

		//alert("저장 함수 타는지!!!!!?? ");
		// validation 체크 
		if (!(fValidatePopup())) {
			return;
		}

		var resultCallback3 = function(data) {
			fSaveCommodityResult(data);
		};

		$("#action").val("I"); // insert

		callAjax("/cmg/commoditySave.do", "post", "json", true, $("#myCommodity").serialize(), resultCallback3);
		// $("#myNotice").serialize() => 직렬화해서 name 값들을 그냥 넘김.
	}

	/* 저장 ,수정, 삭제 콜백 함수 처리  */
	function fSaveCommodityResult(data) {
		var currentPage = currentPage || 1;

		if ($("#action").val() != "I") {
			currentPage = $("#currentPage").val();
		}

		if (data.resultMsg == "SUCCESS") {
			//alert(data.resultMsg);	// 받은 메세지 출력 
			alert("저장 되었습니다.");
		} else if (data.resultMsg == "UPDATED") {
			alert("수정 되었습니다.");
		} else if (data.resultMsg == "DELETED") {
			alert("삭제 되었습니다.");
		} else {
			alert(data.resultMsg); //실패시 이거 탄다. 
			alert("실패 했습니다.");
		}

		gfCloseModal(); // 모달 닫기
		selectCommodityList(currentPage); // 목록조회 함수 다시 출력 
		frealPopModal();// 입력폼 초기화
	}

	/* 공지사항 등록(수정) */
	function fUpdateCommodity() {

		//alert("수정  함수 타는지!!!!!?? ");
		// validation 체크 
		if (!(fValidatePopup())) {
			return;
		}

		var resultCallback3 = function(data) {
			fSaveCommodityResult(data);
		};

		$("#action").val("U"); // update

		callAjax("/cmg/commoditySave.do", "post", "json", true, $("#myCommodity").serialize(), resultCallback3);
		// $("#myQna").serialize() => 직렬화해서 name 값들을 그냥 넘김.
	}

	/* 강의실 게시판 1건 삭제 */
	function fDeleteCommodity() {
		var con = confirm("정말 삭제하겠습니까? \n 삭제시 복구불가합니다.");
		if (con) {
			var resultCallback3 = function(data) {
				fSaveCommodityResult(data);
			}
			$("#action").val("D"); // delete
			callAjax("/cmg/commodityDelete.do", "post", "json", true, $("#myCommodity").serialize(), resultCallback3);
			// num만 넘겨도되지만 
		} else {
			gfCloseModal(); // 모달 닫기
			selectCommodityList(currentPage); // 목록조회 함수 다시 출력 
			frealPopModal();// 입력폼 초기화
		}
	}

	/** 장비 정보 초기화 */
	function fItemList(object) {

		var r_no = $("#r_no").val();

		if (object == "" || object == null || object == undefined) {

			$("#r_no").val(r_no);
			$("#i_no").val("");
			$("#i_name").val("");
			$("#i_cnt").val("");
			$("#i_content").val("");
			$("#r_no").attr("readonly", true);
			$("#r_no").css("background", "#F5F5F5");
			$("#i_no").attr("readonly", false);
			$("#i_no").css("background", "#FFFFFF");
			$("#btnDeleteDtlCod").hide();
			$("#dtl_cod").focus();

		} else {

			$("#r_no").val(object.r_no);
			$("#i_no").val(object.i_no);
			$("#i_name").val(object.i_name);
			$("#i_cnt").val(object.i_cnt);
			$("#i_content").val(object.i_content);
			$("#r_no").attr("readonly", true);
			$("#r_no").css("background", "#F5F5F5");
			$("#i_no").attr("readonly", true);
			$("#i_no").css("background", "#FFFFFF");
			$("#btnDeleteDtlCod").show();
			$("#dtl_cod_nm").focus();

		}
	}

	// 장비저장 Val
	function fItemVal() {

		var chk = checkNotEmpty([ 
		        [ "r_no", "강의실 번호를 선택해주세요." ],
				[ "i_no", "장비 번호를 입력 해주세요." ], 
				[ "i_cnt", "장비 갯수를 입력 해주세요." ],
				[ "r_name", "장비명을 입력 해주세요." ],
				[ "r_content", "부가 설명을 입력 해주세요."] 
		                          ]);

		if (!chk) {
			return;
		}
		return true;
	}

	// 장비 저장
	function fItemSave() {

		if ( ! fItemVal() ) {
			return;
		}

		var resultCallback = function(data) {
			fItemSaveResult(data);
		};
		
		callAjax("/cmg/itemSave.do", "post", "json", true, $("#myCommodity").serialize(), resultCallback);
	}

	// 장비 저장 콜백
	function fItemSaveResult(data) {

		var currentPage = "1";
		if ($("#action").val() != "I") {
			currentPage = $("#currentPage").val();
		}

		if (data.result == "SUCCESS") {

			swal(data.resultMsg);
			
			gfCloseModal();
			
			var r_no = $("#r_no").val();
			
			fCallItemList(currentPage, r_no);
		} else {
			swal(data.resultMsg);
		}

		fItemList();
	}

	// 장비 삭제
	function fItemDelete() {
		
		var param = {
				r_no : $("#r_no").val(),
				i_no : $("#i_no").val()
		}

		var resultCallback = function(data) {
			fItemDeleteResult(data);
		};
		callAjax("/cmg/itemDelete.do", "post", "json", true, param, resultCallback);
	}

	// 장비 삭제 콜백
	function fItemDeleteResult(data) {

		var currentPage = $("#currentPage").val();

		if (data.result == "SUCCESS") {

			swal(data.resultMsg);
			
			gfCloseModal();

			var r_no = $("#r_no").val();
			
			fCallItemList(currentPage, r_no);
			
		} else {
			swal(data.resultMsg);
		}
	}

	//장비 모달
	function fPopModalItemList(r_no, i_no) {

		if (i_no == null || i_no == "") {

			if ($("#r_no").val() == "") {
				swal("강의실 번호를 선택해주세요.");
				return;
			}

			$("#action").val("I");
			fItemList();
			gfModalPop("#layer2");
		} else {
			$("#action").val("U");
			fOneItemList(r_no, i_no);
		}
	}

	// 장비 목록 조회
	function fCallItemList(currentPage, r_no) {

		currentPage = currentPage || 1;

		$("#r_no").val(r_no);

		var param = {
			r_no : r_no,
			currentPage : currentPage,
			pageSize : pageSizeComnDtlCod
		}

		var resultCallBack = function(data) {
			fCallItemListResult(data, currentPage);
		};
		callAjax("/cmg/itemList.do", "post", "text", true, param, resultCallBack);
	}

	//장비 목록 조회 콜백
	function fCallItemListResult(data, currentPage) {

		$("#itemListDtl").empty();
		$("#itemListDtl").append(data);

		var itemListCount = $("#itemListCount").val();

		var r_no = $("#r_no").val();
		var paginationHtml = getPaginationHtml(currentPage, itemListCount, pageSizeComnDtlCod, pageBlockSizeComnDtlCod, 'fCallItemList', [ r_no ]);
		$("#itemListPage").empty().append(paginationHtml);

		// 현재 페이지 설정
		$("#currentPage").val(currentPage);

	}

	// 장비 단건 조회
	function fOneItemList(r_no, i_no) {

		var param = {
			r_no : r_no,
			i_no : i_no
		};
		var resultCallBack = function(data) {
			fOneItemListResult(data);
		};
		callAjax("/cmg/selectItem.do", "post", "json", true, param, resultCallBack);
	}

	// 장비 단건 조회 콜백
	function fOneItemListResult(data) {

		if (data.result == "SUCCESS") {

			gfModalPop("#layer2");
			fItemList(data.itemListDtl);
		} else {
			swal(data.resultMsg);
		}
	}
</script>


</head>
<body>
	<!-- ///////////////////// html 페이지  ///////////////////////////// -->

	<form id="myCommodity" action="" method="">

		<input type="hidden" id="currentPage" value="1"><!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
		<input type="hidden" id="tmpList" value=""><!-- ★ 이거뭐임??? -->
		<input type="hidden" id="tmpListNum" value=""><!-- 스크립트에서 값을 설정해서 넘길거임 / 임시 리스트 넘버 -->
		<input type="hidden" name="action" id="action" value=""> 
		<input type="hidden" id="swriter" value="${loginId}"><!-- 작성자 session에서 java에서 넘어온값 -->

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
								<a href="#" class="btn_nav bold">물품 관리</a> 
								<span class="btn_nav bold">강의실 관리</span> 
								<a href="../lmg/lectureMgt.do" class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle">
								<span>강의실관리</span> 
								<span class="fr"> 
									<select id="searchKey" name="searchKey" style="width: 150px;" v-model="searchKey">
										<option value="ci_no">강의번호</option>
										<option value="ci_name">강의실명</option>
									</select> 
									<input type="text" style="width: 300px; height: 25px;" id="srName" name="srName"> 
									<a href="" class="btnType blue" id="searchBtn" name="btn">
										<span>검 색</span>
									</a>
									<c:set var="nullNum" value=""></c:set> 
									<a class="btnType blue" href="javascript:fCommodityModal(${nullNum});" name="modal">
									<span>신규등록</span>
								</a>
								</span>
							</p>


							<div class="divCommodityList">
								<table class="col">
									<caption>caption</caption>

									<colgroup>
										<col width="10%">
										<col width="20%">
										<col width="10%">
										<col width="10%">
										<col width="50%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">강의실 번호</th>
											<th scope="col">강의실 명</th>
											<th scope="col">크기</th>
											<th scope="col">자리수</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody id="commodityList"></tbody>
								</table>

								<!-- 페이징 처리  -->
								<div class="paging_area" id="pagingnavi"></div>

							</div>
							<p class="conTitle mt50">
								<span>장비관리</span> 
								<span class="fr"> 
									<a class="btnType blue" href="javascript:fPopModalItemList();" name="modal"><span>신규등록</span></a>
								</span>
							</p>

							<div class="divComDtlCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="6%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>

									<thead>
										<tr>
											<th scope="col">강의실번호</th>
											<th scope="col">장비번호</th>
											<th scope="col">장비명</th>
											<th scope="col">갯수</th>
											<th scope="col">비고</th>
											<th scope="col">수정</th>
										</tr>
									</thead>
									<tbody id="itemListDtl">
										<tr>
											<td colspan="12">강의실번호를 선택해 주세요.</td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="paging_area" id="itemListPage"></div>
						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> 
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>


		<!-- 모달팝업 -->
		<div id="commodity" class="layerPop layerType2" style="width: 600px;">

			<dl>
				<dt>
					<strong>강의실 관리</strong>
				</dt>
				<dd class="content">
					<!-- 				s : 여기에 내용입력 -->
					<table class="row">
						<caption>caption</caption>

						<tbody>
							<tr>
								<th scope="row">강의실번호 <span class="font_red">*</span></th>
								<td>
									<input type="text" class="inputTxt p100" name="rNo" id="rNo"/>
								</td>
								<th scope="row">강의실명<span class="font_red">*</span></th>
								<td>
									<input type="text" class="inputTxt p100" name="rName" id="rName"/>
								</td>
							</tr>
							<tr>
								<th scope="row">크기 <span class="font_red">*</span></th>
								<td>
									<input type="text" class="inputTxt p100" name="rSize" id="rSize"/>
								</td>
								<th scope="row">자리수<span class="font_red">*</span></th>
								<td>
									<input type="text" class="inputTxt p100" name="rSit" id="rSit"/>
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td colspan="3">
									<textarea class="inputTxt p100" name="rContent" id="rContent"></textarea>
								</td>
							</tr>

						</tbody>
					</table>

					<!-- e : 여기에 내용입력 -->

					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSaveCommodity" name="btn"><span>저장</span></a>
						<a href="" class="btnType blue" id="btnUpdateCommodity" name="btn" style="display: none"><span>수정</span></a> 
						<a href="" class="btnType blue" id="btnDeleteCommodity" name="btn"><span>삭제</span></a> 
						<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
					</div>
				</dd>

			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>
		<div id="layer2" class="layerPop layerType2" style="width: 600px;">
			<dl>
				<dt>
					<strong>장비관리</strong>
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
							<col width="*">
						</colgroup>

						<tbody>
							<tr>
								<th scope="row">강의실 번호 <span class="font_red">*</span></th>
								<td>
									<input type="text" class="inputTxt p100" id="r_no" name="r_no"/>
								</td>
								<th scope="row">장비번호 <span class="font_red">*</span></th>
								<td>
									<input type="text" class="inputTxt p100" id="i_no" name="i_no"/>
								</td>
							</tr>
							<tr>
								<th scope="row">장비명 <span class="font_red">*</span></th>
								<td>
									<input type="text" class="inputTxt p100" id="i_name" name="i_name"/>
								</td>
								<th scope="row">갯수 <span class="font_red">*</span></th>
								<td>
									<input type="text" class="inputTxt p100" id="i_cnt" name="i_cnt"/>
								</td>
							</tr>

							<tr>
								<th scope="row">비고</th>
								<td colspan="3">
									<textarea type="text" class="inputTxt p100" id="i_content" name="i_content"></textarea>
								</td>
							</tr>
						</tbody>
					</table>

					<!-- e : 여기에 내용입력 -->

					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="itemSaveBtn" name="btn"><span>저장</span></a>
						<a href="" class="btnType blue" id="itemDeleteBtn" name="btn"><span>삭제</span></a>
						<a href="" class="btnType gray" id="closeBtn" name="btn"><span>취소</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>


	</form>

</body>
</html>
