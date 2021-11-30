<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


				
		<!-- 갯수가 0인 경우  -->
		<c:if test="${resuMgtCnt eq 0 }">
			<tr>
				<td colspan="6">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		

		<!-- 갯수가 있는 경우  -->
		<c:if test="${resuMgtCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
			<c:forEach items="${resuMgt}" var="list">
				<tr>
						<td>${list.ci_no}</td>
						<td><a href="javascript:fListResuMgtDtl(1, '${list.ci_no}')"><strong>${list.ci_name}</strong></a></td>
						<td>${list.name}</td>
						<td>${list.people}</td>
						<td>${list.ci_start} ~ ${list.ci_end}</td>
           	<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
				</tr>
				 <c:set var="nRow" value="${nRow + 1}" /> 
			</c:forEach>
		</c:if>
		
		<!-- 이거 중간에 있으면 table 안먹힘  -->

        <input type="hidden" id="resuMgtCnt" name="resuMgtCnt" value="${resuMgtCnt}"/>
        