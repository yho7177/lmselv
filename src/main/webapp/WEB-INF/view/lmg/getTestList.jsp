<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<input type="hidden" id="l_no" />
</div>
<div style="float: right;">
	<a href="javascript:testAdd();"class="btnType blue" ><span>시험 등록</span></a>
</div><br /><br />
<div>
<table class="col">
	<caption>caption</caption>
	<colgroup>
		<col width="15%">
		<col width="20%">
		<col width="18%">
		<col width="23%">
	</colgroup>

	<thead>
		<tr>
			<th scope="col">과정명</th>
			<th scope="col">시험명</th>
			<th scope="col">기간</th>
			<th></th>
		</tr>
	</thead>
	<c:if test="${result == 0 }">
		<tr>
			<td colspan="4">등록된 시험이 없습니다!</td>
		</tr>
	</c:if>
	<c:forEach var="i" items="${testLst }">
		<tr>
			<td id="test_${i.test_no }" onclick="testInputModal(${i.test_no});">${i.ci_name }</td>
			<td>${i.test_name }</td>
			<td>${i.test_start }~ ${i.test_end }</td>
			<td><a href="javascript:testUpdate(${i.test_no });"class="btnType blue" ><span>수정</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:testDeleteModal(${i.test_no });"class="btnType blue" ><span>삭제</span></a></td>
		</tr>
	</c:forEach>

</table>
</div>
<c:if test="${result > 0 }">
<div class="paging_area" style="display: inline;">
	<div class="paging">

		<a class="first" href="javascript:testPaging(1)"></a>

		<c:forEach var="i" begin="${testPi.startPageNoOfBlock }"
			end="${testPi.endPageNoOfBlock }">
			<c:if test="${i == 1 }">
				<a href="javascript:testPaging(${i})"><strong>${i }</strong></a>
			</c:if>
			<c:if test="${i != 1 }">
				<a href="javascript:testPaging(${i})">${i }</a>
			</c:if>
			
		</c:forEach>

		<a class="last" href="javascript:testPaging(${testPi.totalPage})"></a>
	</div>
</div>
</c:if>