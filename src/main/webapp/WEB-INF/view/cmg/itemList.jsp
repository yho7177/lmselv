<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${itemListCount eq 0 }">
	<tr>
		<td colspan="9">데이터가 존재하지 않습니다.</td>
	</tr>
</c:if>

<c:if test="${itemListCount > 0 }">
	<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
	<c:forEach items="${itemListDtl}" var="list">
		<tr>
			<td>${list.r_no}</td>
			<td>${list.i_no}</td>
			<td>${list.i_name}</td>
			<td>${list.i_cnt}</td>
			<td>${list.i_content}</td>
			<td>
				<a class="btnType3 color1" href="javascript:fPopModalItemList('${list.r_no}','${list.i_no}');"><span>수정</span>
			</a>
			</td>
		</tr>
		<c:set var="nRow" value="${nRow + 1}" />
	</c:forEach>
</c:if>

<input type="hidden" id="itemListCount" name="itemListCount" value="${itemListCount}"/>