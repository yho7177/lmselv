<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


				
		<!-- 갯수가 0인 경우  -->
		<c:if test="${empInfoCnt eq 0 }">
			<tr>
				<td colspan="6">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		

		<!-- 갯수가 있는 경우  -->
		<c:if test="${empInfoCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
			<c:forEach items="${empInfo}" var="list">
				<tr>
					    
					    <td>${list.job_no}</td>
						<td>${list.name}</td>
						<td>${list.tel}</td>
						<td>${list.job_hiredate}</td>
						<td>${list.job_retire}</td>
						<td>${list.job_name}</td>
						<td>
							<c:if test="${list.job_yn eq 'Y'}">
								재직중
							</c:if>
							<c:if test="${list.job_yn eq 'N'}">
								퇴사
							</c:if>
						</td>
						<td align="center">
						    <table align="center" border=0>
						       <tr>
						          <p style="display: inline-block" class="btnType3 color1" ><a class="btnType3 color1" href="javascript:fSelectEmpInfo('${list.job_no}')"><span id="searchEnter">수정</span></a></p>
						          <p style="display: inline-block; margin-left:5px;" class="btnType3 color1" "><a class="btnType3 color1" href="javascript:fDeleteEmpInfo('${list.job_no}')"><span id="searchEnter">삭제</span></a></p>
						       </tr>
						    </table>
						</td>
           	<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
				</tr>
				 <c:set var="nRow" value="${nRow + 1}" /> 
			</c:forEach>
		</c:if>
		
		<!-- 이거 중간에 있으면 table 안먹힘  -->

        <input type="hidden" id="totcnt" name="totcnt" value="${empInfoCnt}"/>











