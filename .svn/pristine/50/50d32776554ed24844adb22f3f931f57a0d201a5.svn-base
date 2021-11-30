<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:if test="${totalCntResuMgtDtl eq 0 }">
		<tr>
			<td colspan="7">데이터가 존재하지 않습니다.</td>
		</tr>
	</c:if>
	<c:if test="${totalCntResuMgtDtl > 0 }">
		<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
		<c:forEach items="${listResuMgtDtl}" var="list">
			<tr>
				<td><input type="checkbox" id="checkall" checked/></td>
				<td><a href="javascript:std_Detail('${list.loginID}')"><strong>${list.name}</strong></a></td>
				<td>${list.loginID}</td>
				<td>${list.tel}</td>
				<td>${list.email}@${list.email_detail}</td>
				<td>
					<c:if test="${list.job_yn eq 'Y'}">
						취업
					</c:if>
					<c:if test="${list.job_yn eq 'N'}">
						미취업
					</c:if>
				</td>
				<td>
					<a href="javascript:fSelectResuMgtDtl('${list.loginID}')"><strong>열람</strong></a>
				</td>
			</tr>
			<c:set var="nRow" value="${nRow + 1}" />
		</c:forEach>
	</c:if>
	
	<input type="hidden" id="totalCntResuMgtDtl" name="totalCntResuMgtDtl" value="${totalCntResuMgtDtl}"/>