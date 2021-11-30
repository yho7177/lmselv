<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${totalCount eq 0 }">
	<tr>
		<td colspan="9">데이터가 존재하지 않습니다.</td>
	</tr>
</c:if>

<tbody id="surveyQue">
	<c:if test="${totalCount > 0 }">
		<%-- 	<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> --%>
		<c:forEach items="${surveyModel}" var="list">
			<tr class="hidden">
				<th>강의번호</th>
				<td>${list.ci_no}</td>
			</tr>
			<tr id="svylistdata">
				<th scope="row">Q${list.svy_no}. ${list.svy_que}</th>
				<td colspan="6">
					<!-- 문제 보기 영역 for하나더...--> 
					<input type="radio" name="answer${list.svy_no}" id="answer" value="1"> ${list.svy_ex1} <br>
				<input type="radio" name="answer${list.svy_no}" id="answer" value="2"> ${list.svy_ex2} <br>
				<input type="radio" name="answer${list.svy_no}" id="answer" value="3"> ${list.svy_ex3} 
				<c:if test="${list.svy_ex4 ne null}">
						<br>
						<input type="radio" name="answer${list.svy_no}" id="answer" value="4">${list.svy_ex4} 
				</c:if> 
				<c:if test="${list.svy_ex5 ne null}">
						<br>
						<input type="radio" name="answer${list.svy_no}" id="answer" value="5">${list.svy_ex5}
				</c:if>
				</td>
			</tr>
			<%-- <c:set var="nRow" value="${nRow + 1}" /> --%>
		</c:forEach>
		<c:forEach items="${suveryAListModel}" var="list">
			<tr class="hidden">
				<th>강의번호</th>
				<td>${list.ci_no}</td>
			</tr>
			<tr id="svylistdata">
				<th scope="row">Q${list.svy_no}. ${list.svy_que}</th>
				<td colspan="6">
					<!-- 문제 보기 영역 for하나더...--> 
					<input type="radio" name="answer${list.svy_no}" id="answer" value="1"> ${list.svy_ex1} <br>
				<input type="radio" name="answer${list.svy_no}" id="answer" value="2"> ${list.svy_ex2} <br>
				<input type="radio" name="answer${list.svy_no}" id="answer" value="3"> ${list.svy_ex3} 
				<c:if test="${list.svy_ex4 ne null}">
						<br>
						<input type="radio" name="answer${list.svy_no}" id="answer" value="4">${list.svy_ex4} 
				</c:if> 
				<c:if test="${list.svy_ex5 ne null}">
						<br>
						<input type="radio" name="answer${list.svy_no}" id="answer" value="5">${list.svy_ex5}
				</c:if>
				</td>
			</tr>
		</c:forEach>
	</c:if>
</tbody>
<input type="hidden" id="surveycnt" name="surveycnt" value="${surveycnt}"/>
