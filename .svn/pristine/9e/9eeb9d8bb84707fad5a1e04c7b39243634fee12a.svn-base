<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${countListComnGrpCod eq 0 }">
	<tr>
		<td colspan="9">데이터가 존재하지 않습니다.</td>
	</tr>
</c:if>

<c:if test="${countListComnGrpCod > 0 }">
	<c:set var="nRow" value="${pageSize*(currentPageComnGrpCod-1)}" />
	<c:forEach items="${listModel}" var="list">
		<tr>
			<td>${list.ci_no}</td>
			<td>${list.ci_type }</td>
			<td><a href="javascript:fPopModalLmg('${list.ci_no}')">${list.ci_name}</a></td>
			<td>${list.loginID}</td>
			<td>${list.ci_start}</td>
			<td>${list.ci_end}</td>
			<td>111</td>
			<td>${list.ci_limit}</td>
		</tr>
		<c:set var="nRow" value="${nRow + 1}" />
	</c:forEach>
</c:if>

<input type="hidden" id="countListComnGrpCod" name="countListComnGrpCod" value="${countListComnGrpCod}"/>