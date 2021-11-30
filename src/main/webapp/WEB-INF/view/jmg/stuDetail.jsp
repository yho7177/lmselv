<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<dl>
            <dt>
               <strong>학생 정보</strong>
            </dt>
            <dd class="content">
               <table class="row" id="adv_info">
                  <caption>caption</caption>
                  <colgroup>
                     <col width="120px">
                     <col width="*">
                     <col width="120px">
                     <col width="*">
                  </colgroup>
                  <tbody>
                     <tr>
                        <th scope="row">등 급</th>
                        <td>${Std_Detail.grade}</td>
                        <th scope="row">이 름</th>
                        <td>${Std_Detail.name}</td>
                     </tr>                  
                     <tr>
                        <th scope="row">ID</th>
                        <td>${Std_Detail.loginID}</td>
                        <th scope="row">성별</th>
                        <td>
							<c:if test="${Std_Detail.gender eq 'M'}">
								남자
							</c:if>
							<c:if test="${Std_Detail.gender eq 'W'}">
								여자
							</c:if>
						</td>
                     </tr>
                     <tr class="tr_info">
                        <th scope="row">연락처</th>
                        <td>${Std_Detail.tel}</td>
                        <th scope="row">생일</th>
                        <td>${Std_Detail.birthday}</td>
                     </tr>
                     <tr>
                        <th scope="row" colspan="1">메일</th>
                        <td colspan="3">${Std_Detail.email}@${Std_Detail.email_detail}</td>
                     </tr>
                  </tbody>
               </table>
				<div class="btn_areaC mt30">
					<a href="javascript:popupclose()" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
				</div>
               
            </dd>
         </dl>
         <a href="" class="closePop"><span class="hidden">닫기</span></a>

