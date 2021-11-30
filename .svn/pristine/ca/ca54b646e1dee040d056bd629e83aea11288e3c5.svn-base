<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			
		<!-- 갯수가 0인 경우  -->
		<c:if test="${empInfoAddCnt eq 0 }">
			<tr>
				<td colspan="6">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		
		<!-- 갯수가 있는 경우  -->
		<c:if test="${empInfoAddCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
			<c:forEach items="${empInfoAddList}" var="list">
				<tr>
					    <td>${list.loginID}</td>
						<td>${list.name}</td>
						<td>${list.tel}</td>
						<td>${list.ci_name}</td>
						<td>${list.reg_date}</td>
						<td align="center">
						    <table align="center" border=0>
						       <tr>
						          <p style="display: inline-block" class="btnType3 color1" ><a class="btnType3 color1" href="javascript:fRegistration('${list.loginID}')"><span id="searchEnter">등록</span></a></p>
						       </tr>
						    </table>
						</td>
           	<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
				</tr>
				 <c:set var="nRow" value="${nRow + 1}" /> 
			</c:forEach>
		</c:if>
		
		<!-- 이거 중간에 있으면 table 안먹힘  -->

        <input type="hidden" id="totcnt2" name="totcnt" value="${empInfoAddCnt}"/>











