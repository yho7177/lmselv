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
		
		function deleteBoard() {
			location.href = "/board/deleteBoard.do?b_no=${b.b_no}";
		}
    </script>

</head>
<body>
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
                    <%--수정위치--%>
                    <
                        <%--수정위치--%>
                    <p class="Location">
                        <a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
                        <span class="btn_nav bold">학습관리</span> <span class="btn_nav bold">시험
								대상자 관리 </span> <a href="/lmg/exsubjectMgt.do" class="btn_set refresh">새로고침</a>
                    </p>

                    <p class="conTitle">
                        <span>자유게시판</span> <span class="fr"></span>

                        <%--<-------->--%>
                        <br/>
                    <h1>Board Write</h1>
                    <br/>
                    <br/>
                   
                    <div class="container">
                    <form action="/board/modifyBoard.do" method="post">
                    	<div>게시번호 : <input type="text" name="b_no" value="${b.b_no }" readonly /></div>
                        <div>작성자 : <input type="text" name="loginID" value="${b.loginID }" readonly /></div>
                        <div>제목 : <input type="text" name="b_title" value="${b.b_title }"  /></div>
                        <div>내용 : <input type="text" name="b_content" value="${b.b_content }"  /></div>
                    
					<div>
						<input type="submit" value="수정" />
						<input type="button" onclick="deleteBoard()" value="삭제" />
					</div>
					</form>
					</div>
                    <br>


                </div> <!--// content -->

                <h3 class="hidden">풋터 영역</h3>
                <jsp:include
                        page="/WEB-INF/view/common/footer.jsp"></jsp:include>
            </li>
        </ul>
    </div>
</div>
</body>

<%--<수정테크>--%>
<script type="text/javascript">
    $(document).on('click', '#btn_modify', function(e) {
        if (confirm("정말 수정하시겠습니까 ?") == true) {
            $("#viewForm").submit();
        } else {
            return;
        }
    });
    $(document).on('click', '#btn_delete', function(e) {

        var testId = ${vo.testId};

        if (confirm("정말 삭제하시겠습니까 ?") == true) {
            $("#viewForm").attr("action", "deleteTest.do?testId="+testId);
            $("#viewForm").submit();
        } else {
            return;
        }
    });

    //이전 클릭 시 testList로 이동
    $("#btn_previous").click(function previous() {
        $(location).attr('href', 'testList.do');

    });
</script>
<%--</수정테크>--%>

</html>