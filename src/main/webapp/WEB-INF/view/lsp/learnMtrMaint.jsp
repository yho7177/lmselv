<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${totalCntTeach eq 0 }">
	<tr>
		<td colspan="10">과제가 존재하지 않습니다.</td>
	</tr>
</c:if>

<c:if test="${totalCntTeach > 0 }">
<c:set var="nRow" value="${pageSize*(currentPageTeachMain-1)}" />
<c:forEach items="${listMtrTeachModel}" var="list">
	<tr>
		<td>${list.ci_name}</td>
		<td>
			${list.name}
		</td>
		<td>
			<a href="javascript:fListMtrSubt(1, '${ list.ci_content}', '${ list.ci_date}', '${list.ci_name}', '${list.ci_no}');"><span>${list.ci_name}</span></a>
		</td>
		<td><fmt:formatDate  value="${list.ci_date}" pattern="yyyy-MM-dd-hh-mm"/></td>
		<td>
			<c:if test="${usertype == 'C' }">
				<a class="btnType3 color1" href="javascript:fMtrMainPopModal('${ list.ci_no}');"><span>조회</span></a>
			</c:if>
			<c:if test="${usertype == 'D' }">
				<a class="btnType3 color1" href="javascript:fMtrMainPopModal('${ list.ci_no}');"><span>수정</span></a>
			</c:if>
		</td>
	</tr>
<c:set var="nRow" value="${nRow + 1}" />
</c:forEach>
</c:if>

<input type="hidden" id="totalCntTeach" name="totalCntTeach" value ="${totalCntTeach}"/>
