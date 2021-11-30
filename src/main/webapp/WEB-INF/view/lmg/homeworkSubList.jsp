<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${totalCntHwSub eq 0 }">
	<tr>
		<td colspan="10">과제가 존재하지 않습니다.</td>
	</tr>
</c:if>

<c:if test="${totalCntHwSub > 0 }">
<c:set var="nRow" value="${pageSize*(currentPageHwSub-1)}" />
<c:forEach items="${listHwSubModel}" var="list">
	<tr>
		<td>${list.ci_name}</td>
		<td>
			<a href="javascript:fHwSubPopModal('${ list.hw_no}', '${list.hws_no}');"><span>${list.hws_name}</span></a>
		</td>
		<td>${list.name}</td>
		<td>
			<a href="javascript:downloadHwFile('${list.hws_no }')"><span>${list.file_name}</span></a>
		</td>
		<td><fmt:formatDate  value="${list.hws_date}" pattern="yyyy-MM-dd"/></td>
	</tr>
<c:set var="nRow" value="${nRow + 1}" />
</c:forEach>
</c:if>

<input type="hidden" id="totalCntHwSub" name="totalCntHwSub" value ="${totalCntHwSub}"/>
