<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${listCount eq 0 }">
	<tr>
		<td colspan="9">데이터가 존재하지 않습니다.</td>
	</tr>
</c:if>
<c:if test="${listCount > 0 }">
	<c:forEach items="${mnpList}" var="list">
		<tr>
			<td><input type="checkbox" class="delete_check" id="check" name="check" value="${list.loginID}"></td>
			<td>${list.name}</td>
			<td>${list.loginID}</td>
			<td>${list.password}</td>
			<td>${list.tel}</td>
			<td><fmt:formatDate value="${list.reg_date}" pattern="yyyy-MM-dd HH:mm" /></td>

			<td><a class="btnType3 color1"
				href="javascript:updateUserModal('${list.loginID}');"><span>수정</span></a>
			</td>
		</tr>
	</c:forEach>
</c:if>

<input type="hidden" id="listCount" name="listCount" value="${listCount}" />

<script>
/* 수정모달 실행 */
function updateUserModal(loginID) {
	console.log("회원정보 수정: " + loginID);

	$("#action").val("U");
	
	selectUser(loginID);
	// 모달 팝업
	gfModalPop("#signModal");
}
</script>

