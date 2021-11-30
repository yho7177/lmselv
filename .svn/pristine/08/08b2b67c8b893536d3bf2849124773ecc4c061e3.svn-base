<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="row" style="border : 1px solid gray">
			<caption>caption</caption>
			<colgroup>
				<col width="120px">
				<col width="120px">
				<col width="120px">
				<col width="120px">
			</colgroup>
			<tr style="border : 1px solid gray">
				<th scope="row" style="border : 1px solid gray">점수</th>
				<th colspan="2" style="border : 1px solid gray; font-size: 18px;">${totalResult }</th>
				<th scope="row" style="border : 1px solid gray">상태</th>
				<th colspan="1" style="border : 1px solid gray; font-size: 18px;">
					<c:if test="${status == 'y' }">
						통과
					</c:if>
					<c:if test="${status == 'n' }">
						과락
					</c:if>
				</th>
				<th scope="row" style="border : 1px solid gray">비고</th>
				<th style="border : 1px solid gray">빨간색 글자 : 정답</th>
			</tr>
			<c:forEach var="i" items="${lst }">
				<tr style="border : 1px solid gray">
					<th scope="row" style="border : 1px solid gray">문제${i.q_no }</th>
					<td style="border : 1px solid gray"><input type ="text" value="${i.t_que }" readonly /></td>
					<td style="border : 1px solid gray;" colspan="5">
						<c:if test="${i.tj_ans == 1 }">
							<input type="radio" id="radio_1" name="choose_${i.q_no }_${i.test_no}" style="margin-left: 20px; margin-right: 20px;" value="1" checked />
						</c:if>
						<c:if test="${i.tj_ans != 1 }">
							<input type="radio" id="radio_1" name="choose_${i.q_no }_${i.test_no}" style="margin-left: 20px; margin-right: 20px;" value="1" />
						</c:if>
						<c:if test="${i.t_ans == 1 }">
							<span class="select" style="color: red;">${i.t_ex1 }</span>
						</c:if>
						<c:if test="${i.t_ans != 1 }">
							<span class="select">${i.t_ex1 }</span>
						</c:if>
						
						<c:if test="${i.tj_ans == 2 }">
							<input type="radio" id="radio_2" name="choose_${i.q_no }_${i.test_no}" style="margin-left: 20px; margin-right: 20px;" value="2" checked />
						</c:if>
						<c:if test="${i.tj_ans != 2 }">
							<input type="radio" id="radio_2" name="choose_${i.q_no }_${i.test_no}" style="margin-left: 20px; margin-right: 20px;" value="2" />
						</c:if>
						<c:if test="${i.t_ans == 2 }">
							<span class="select" style="color: red;">${i.t_ex2 }</span>
						</c:if>
						<c:if test="${i.t_ans != 2 }">
							<span class="select">${i.t_ex2 }</span>
						</c:if>
						
						<c:if test="${i.tj_ans == 3 }">
							<input type="radio" id="radio_3" name="choose_${i.q_no }_${i.test_no}" style="margin-left: 20px; margin-right: 20px;" value="3" checked />
						</c:if>
						<c:if test="${i.tj_ans != 3 }">
							<input type="radio" id="radio_3" name="choose_${i.q_no }_${i.test_no}" style="margin-left: 20px; margin-right: 20px;" value="3" />
						</c:if>
						<c:if test="${i.t_ans == 3 }">
							<span class="select" style="color: red;">${i.t_ex3 }</span>
						</c:if>
						<c:if test="${i.t_ans != 3 }">
							<span class="select">${i.t_ex3 }</span>
						</c:if>
						
						<c:if test="${i.tj_ans == 4 }">
							<input type="radio" id="radio_4" name="choose_${i.q_no }_${i.test_no}" style="margin-left: 20px; margin-right: 20px;" value="4" checked />
						</c:if>
						<c:if test="${i.tj_ans != 4 }">
							<input type="radio" id="radio_4" name="choose_${i.q_no }_${i.test_no}" style="margin-left: 20px; margin-right: 20px;" value="4" />
						</c:if>
						<c:if test="${i.t_ans == 4 }">
							<span class="select" style="color: red;">${i.t_ex4 }</span>
						</c:if>
						<c:if test="${i.t_ans != 4 }">
							<span class="select">${i.t_ex4 }</span>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>