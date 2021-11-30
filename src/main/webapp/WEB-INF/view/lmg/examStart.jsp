<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="submitExam" method="post" action="/lmg/submitExam">
	<input type="hidden" name="loginId" value="${loginId }" />
	<table class="col">
		<caption>caption</caption>
		<colgroup>
			<col width="5%">
			<col width="30%">
		</colgroup>

		<c:if test="${size == 0 }">
			<tr>
				<td colspan="2">
					시험 문제가 없습니다!          
				</td>
			</tr>
		</c:if>
		<c:if test="${size > 0 }">
			<c:forEach var="i" items="${lst }">
				<tr>
					<td>문제 ${i.q_no }</td>
					<td>${i.t_que}</td>
				</tr>
				<tr>
					<td colspan="2"><input type="hidden" name="test_no"
						value="${i.test_no }" /> <input type="hidden" name="ci_no"
						value="${i.ci_no }" /> <input type="hidden"
						name="q_no_${i.q_no }" value="${i.q_no }" /> <input type="radio"
						name="answer_${i.q_no }" value="1"
						style="margin-right: 20px; margin-left: 20px" />${i.t_ex1} <input
						type="radio" name="answer_${i.q_no }" value="2"
						style="margin-right: 20px; margin-left: 20px" />${i.t_ex2} <input
						type="radio" name="answer_${i.q_no }" value="3"
						style="margin-right: 20px; margin-left: 20px" />${i.t_ex3} <input
						type="radio" name="answer_${i.q_no }" value="4"
						style="margin-right: 20px; margin-left: 20px" />${i.t_ex4}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<br />
	<br />
	<c:if test="${size > 0 }">
		<a href="javascript:submitExam();" class="btnType gray"><span>제출</span></a>
	</c:if>
</form>

