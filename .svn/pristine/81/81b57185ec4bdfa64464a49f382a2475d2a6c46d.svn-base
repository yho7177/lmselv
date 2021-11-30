<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<h3>응시자</h3>
<table class="col">
	<thead>
		<tr>
			<th scope="col">학생 아이디</th>
			<th scope="col">점수</th>
			<th scope="col">상태</th>
		</tr>
	</thead>
	<c:if test="${fn:length(takers) == 0 }">
		<tr>
			<td colspan="3">응시자가 없습니다</td>
		</tr>
	</c:if>
	<c:if test="${fn:length(takers) > 0 }">
	<c:forEach var="i" items="${takers }" varStatus="sta">
		<input type="hidden" id="login_${sta.index }" value="${i.loginID }" />
		<tr >
			<td onclick="getTestDetail(${i.ci_no}, ${i.test_no}, ${sta.index })">${i.loginID }</td>
			
			<td>${i.tj_score }</td>
			<td>${status[sta.index] }</td>
		</tr>
	</c:forEach>
	</c:if>
</table><br /><br />

<h3>미응시자</h3>
<table class="col">
	<thead>
		<tr>
			<th scope="col">학생 아이디</th>
			<th scope="col">점수</th>
			<th scope="col">상태</th>
		</tr>
	</thead>
	<c:if test="${fn:length(nonTakers) == 0 }">
		<tr>
			<td colspan="3">미응시자가 없습니다</td>
		</tr>
	</c:if>
	<c:if test="${fn:length(nonTakers) > 0 }">
	<c:forEach var="i" items="${nonTakers }">
		<tr >
			<td>${i }</td>
			<td>-</td>
			<td>미응시</td>
		</tr>
	</c:forEach>
	</c:if>
</table>
<br />
<br />