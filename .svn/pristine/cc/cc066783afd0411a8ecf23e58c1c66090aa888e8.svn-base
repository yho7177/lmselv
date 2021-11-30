<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="col">
<thead>
										<tr>
										    <th scope="col">문제번호</th>
											<th scope="col">문제</th>
											<th scope="col">정답</th>
											<th scope="col">보기1</th>
											<th scope="col">보기2</th>
											<th scope="col">보기3</th>
											<th scope="col">보기4</th>
											<th scope="col">점수</th>
										</tr>
									</thead>
									
<c:forEach var="i" items="${lst }">
	<input type="hidden" id="problem_${i.test_no }" />
	<tr onclick="problemDetail(${i.test_no}, ${i.q_no })">
	<td>${i.q_no }</td>
	<td>${i.t_que }</td>
	<td>${i.t_ans }</td>
	<td>${i.t_ex1 }</td>
	<td>${i.t_ex2 }</td>
	<td>${i.t_ex3 }</td>
	<td>${i.t_ex4 }</td>
	<td>${i.t_score }</td>
	</tr>
</c:forEach>
	</table><br /><br />