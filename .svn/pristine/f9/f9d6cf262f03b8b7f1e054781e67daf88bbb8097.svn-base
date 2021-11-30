<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>SamplePage1</title>
    <!-- sweet alert import -->
    <script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
    <jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
    <!-- sweet swal import -->

    <script type="text/javascript">


        /*
                // 그룹코드 페이징 설정
                var pageSizeComnGrpCod = 5;
                var pageBlockSizeComnGrpCod = 5;

                /** 강의  조회 */
        function fListLmg(currentPage) {

            currentPage = currentPage || 1; //처음에는 undefinde의 값을 가지고있음 . 하지만 값을 넣는 순간 그 값을 가진다.

            var sname = $('#sname');
            // var sname = $('#searchKey').val(); 옛날 방식
            var searchKey = document.getElementById("searchKey");
            var oname = searchKey.options[searchKey.selectedIndex].value;


            console.log("currentPage : " + currentPage);

            var param = {
                sname: sname.val()
                , oname: oname
                , currentPage: currentPage
                , pageSize: pageSizeComnGrpCod
            }

            var resultCallback = function (data) {
                flistLmgResult(data, currentPage);
            };
            //Ajax실행 방식 (사용자 정의함수)
            //callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
            callAjax("/board/boardlist.do", "post", "text", true, param, resultCallback);
        }

        /** OnLoad event -> html의 화면은 뿌려주고 난 다음 그순간에 실행되는 것 */
        $(function () {

            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                , showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                , showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
                , changeYear: true //콤보박스에서 년 선택 가능
                , changeMonth: true //콤보박스에서 월 선택 가능
                , showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
                , buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                , buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                , buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트
                , yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                , monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
                , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
                , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
                , dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
            });

            //input을 datepicker로 선언
            $("#ci_start").datepicker();
            $("#ci_end").datepicker();

            //From의 초기값을 오늘 날짜로 설정
            $('#ci_start').datepicker('setDate', '-1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            //To의 초기값을 내일로 설정
            $('#ci_end').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)


            // 강의 조회
            fListLmg();

            // 버튼 이벤트 등록
            fRegisterButtonClickEvent();
        });


        // 기존 목록 삭제
        $('#listLmg').empty();

        // 신규 목록 생성
        $("#listLmg").append(data);

        // 총 개수 추출

        var countListComnGrpCod = $("#countListComnGrpCod").val();


        //swal(totalCntComnGrpCod);

        // 페이지 네비게이션 생성

        var paginationHtml = getPaginationHtml(currentPage, countListComnGrpCod, pageSizeComnGrpCod, pageBlockSizeComnGrpCod, 'fListLmg');
        console.log("paginationHtml : " + paginationHtml);
        //swal(paginationHtml);
        $("#countListLmg").empty().append(paginationHtml);

        // 현재 페이지 설정
        $("#currentPageComnGrpCod").val(currentPage);


    </script>

</head>
<body>

<form id="myForm" action="" method="">
    <input type="hidden" id="currentPageComnGrpCod" value="1">
    <!-- 현재 보고있는 페이지를 백업하기위해 -->
    <input type="hidden" id="currentPageComnDtlCod" value="1">
    <input type="hidden" id="tmpGrpCod" value="">
    <input type="hidden" id="tmpGrpCodNm" value="">


    <input type="hidden" id="lectureNo"/>
    <!-- 모달 배경 -->
    <div id="mask"></div>

    <div id="wrap_area">

        <h2 class="hidden">header 영역</h2>
        <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

        <h2 class="hidden">컨텐츠 영역</h2>
        <div id="container">
            <ul>
                <li class="lnb">
                    <!-- lnb 영역 -->
                    <jsp:include
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

                        <p class="conTitle">
                            <span>자유게시판</span> <span class="fr">
							</span>
                        </p>

                        <br/>
                        <div>
                            <table class="col">
                                <caption>caption</caption>
                                <colgroup>
                                    <col width="12%">
                                    <col width="30%">
                                    <col width="23%">
                                    <col width="23%">
                                </colgroup>

                                <thead>
                                <caption>
                                    <div>일반게시판 목록</div>
                                    <div>Toltal : ${total }</div>
                                </caption>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>작성자</th>
                                    <%--<th>등록일자</th>--%>
                                </tr>
                                </thead>
                                <tbody>

                                <c:set var="cnt" value="${rowNumber }"/>
                                <c:forEach items="${list }" var="result">
                                    <tr>
                                        <td>${result.b_no}</td>
                                        <td><a href="boardDetail.do?b_no=${result.b_no}">${result.b_title}</a></td>
                                        <td>${result.b_content}</td>
                                        <td>${result.loginID}</td>
                                            <%-- <td>${result.b_content}</td>--%>
                                            <%-- <td>${result.testDate}</td>--%>
                                    </tr>
                                    <c:set var="cnt" value="${cnt+1 }"/>
                                </c:forEach>


                                </tbody>
                            </table>
                        </div>

						<table>
						<tr>
                        
                            <c:forEach var="i" begin="1" end="${totalPage }">
								<td>
                                	<div align="left" class="paging"><a href="boardlist.do?viewPage=${i }">${i }</a>
                                	</div>
								</td>

                            </c:forEach></tr></table>
                        
                       
                        <a class="btnType blue" href="boardRegister.do"><span>글쓰기</span></a>


                        <%--<c:forEach var="result" items="${resultList}">
                        </c:forEach>--%>

                        <%--</a>
                        <div class="paging_area" id="comnGrpCodPagination">
                            <div class="paging_area" id="fListComnGrpCod">

                            <div class="paging"><a class="first" href="javascript:fListComnGrpCod(1)">
                                <span class="hidden">맨앞</span></a><a class="pre" href="javascript:fListComnGrpCod(1)">
                                <span class="hidden">이전</span></a><strong>1</strong> <a href="javascript:fListComnGrpCod(2)">2</a>
                                <a href="javascript:fListComnGrpCod(3)">3</a>
                                <a href="javascript:fListComnGrpCod(4)">4</a>
                                <a class="next" href="javascript:fListComnGrpCod(4)">
                                    <span class="hidden">다음</span></a><a class="last" href="javascript:fListComnGrpCod(4)">
                                    <span class="hidden">맨뒤</span></a></div></div>&ndash;%&gt;--%>


                        <%--	<div class="paging"><a class="first" href="javascript:fListComnGrpCod(1)">
                            <span class="hidden">맨앞</span></a><a class="pre" href="javascript:fListComnGrpCod(1)">
                            <span class="hidden">이전</span></a><strong>1</strong> <a href="javascript:fListComnGrpCod(2)">2</a>
                            <a href="javascript:fListComnGrpCod(3)">3</a>
                            <a href="javascript:fListComnGrpCod(4)">4</a>
                        <a class="next" href="javascript:fListComnGrpCod(4)">
                            <span class="hidden">다음</span></a><a class="last" href="javascript:fListComnGrpCod(4)">
                                <span class="hidden">맨뒤</span></a></div></div>&ndash;%&gt;




                    <%----%>


                    </div> <!--// content -->

                    <h3 class="hidden">풋터 영역</h3>
                    <jsp:include
                            page="/WEB-INF/view/common/footer.jsp"></jsp:include>
                </li>
            </ul>
        </div>
    </div>
    </form>
</body>

</html>