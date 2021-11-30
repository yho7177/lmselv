<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- 갯수가 0인 경우  -->
      <c:if test="${totalCntQnaCod eq 0 }">
         <tr>
            <td colspan="6">데이터가 존재하지 않습니다.</td>
         </tr>
      </c:if>
      

      <!-- 갯수가 있는 경우  -->
      <c:if test="${totalCntQnaCod > 0 }">
         <c:set var="nRow" value="${pageSize*(currentPage-1)}" />  
         <c:forEach items="${listQnaCodModel}" var="list">
            <tr>
                   <td>${list.qna_no}</td>
                  <td><a href="javascript:fSelectQnaCod(1,'${list.qna_no}')">${list.qna_title}</a></td>
                  <td><fmt:formatDate value="${list.qna_date}" pattern="yyyy-MM-dd-hh-mm"/></td>
                  <td>${list.loginID}</td>
              <!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
            </tr>
             <c:set var="nRow" value="${nRow + 1}" /> 
         </c:forEach>
      </c:if>
		<input type="hidden" id="totalCntQnaCod" name="totalCntQnaCod" value ="${totalCntQnaCod}"/>