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

          <p class="conTitle">
            <span>자유게시판</span> <span class="fr"></span>

            <%--<-------->--%>
                <br/>
          <h1 class="text-center">Board Write</h1>
          <br/>
          <br/>
          <div class="container">
            <form id="form_test" action="insertTest.do" method="post"
                  encType="multiplart/form-data">
              <table class="table table-bordered" style="width: 450px;">
                <tbody>
                <tr>
                  <th>제목</th>
                  <td><input type="text" placeholder="제목을 입력하세요."
                             name="testTitle" class="form-control" /></td>
                </tr>
                <tr>
                  <th>내용ss</th>
                  <td><textarea placeholder="내용을 입력하세요 ." name="testContent"
                                class="form-control" ></textarea></td>
                </tr>
                <tr>
                  <td colspan="2">
                    <button id="btn_register" type="button" class="btn_register">등록</button>
                    <button id="btn_previous" type="button" class="btn_previous">이전</button>
                </tr>

                </tbody>
              </table>
            </form>
          </div>

						<br>
						
						

					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3> <jsp:include
						page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>