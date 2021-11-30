<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<c:if test="${totalCntSurvey eq 0 }">
		<tr>
			<td colspan="5">데이터가 존재하지 않습니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${totalCntSurvey > 0 }">
		<c:set var="nRow" value="${pageSize*(currentPageSurvey-1)}" />
		<c:forEach items="${listSurveyModel}" var="list">
			<tr>
				<td>${list.ci_name}</td>
				<td>${list.t_name}</td>
				<td><fmt:formatDate  value="${list.ci_start}" pattern="yyyy-MM-dd"/></td>
				<td><fmt:formatDate  value="${list.ci_end}" pattern="yyyy-MM-dd"/></td>
				<td>
					<c:if test="${usertype == 'C' }">
						<c:if test="${list.svy_YN == null or list.svy_YN == '' }">
							<a class="btnType3 color1" href="javascript:fSurveyQList(${list.ci_no});"><span>설문</span></a>
						</c:if>
						<c:if test="${list.svy_YN == 'Y' }">
							<a class="btnType3 blue" href=""><span>완료</span></a>
						</c:if>
					</c:if>
					<c:if test="${usertype == 'A' or usertype == 'D'}">
						<a class="btnType3 color1" href="javascript:fListSurveyUser(1, '${list.ci_no}', '${list.ci_name}');"><span>조회</span></a>
					</c:if>
				</td>
			</tr>
		<c:set var="nRow" value="${nRow + 1}" />
		</c:forEach>
	</c:if>
	
	<input type="hidden" id="totalCntSurvey" name="totalCntSurvey" value ="${totalCntSurvey}"/>
