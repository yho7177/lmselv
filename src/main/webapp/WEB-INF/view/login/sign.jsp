<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${CTX_PATH}/js/popFindZipCode.js"></script>
<!-- 창을 중앙으로 유지되게 함 login_pub.js -->
<script type="text/javascript" charset="utf-8" src="${CTX_PATH}/js/login_pub.js"></script>


<script>

/** OnLoad event */ 
$(function() {
	
	/* 공통코드 select 박스에 내용 삽입 */
	comcombo("MAILCD", "email_detail", "all"); 
	comcombo("GRADE", "grade", "all"); 
	comcombo("WORK_AREA", "hopework", "all"); 
	comcombo("WORK_AREA", "hopework2", "all"); 
	comcombo("WORK_AREA", "hopework3", "all"); 
});

// 하이픈 짤라내기.
	function telCheck(obj) {
		console.log("telCheck");
		
 		if( obj.value.length > 3 )
			obj.value = obj.value.substr(0, 3);
	}

	/* 모달창 취소 버튼 */
	function fcancleModal() {

		gfCloseModal();
	}

	/* 회원 수정 데이터 출력 */
	function selectUser(loginID) {

		param = {
			loginID : loginID
		}

		var resultUserCallback = function(data) {

			InitUserFormUpdate(data);
		}

		callAjax("/selectUser.do", "post", "json", true, param,
				resultUserCallback);
	}

	/* 회원 수정 콜백 */
	function InitUserFormUpdate(data) {

		if (data.result == "SUCCESS") {
			instaffRegister(data.list);

		} else {
			alert(data.resultMsg);
			return false;
		}
	}

	/* 회원가입 폼 초기화 + 수정 폼 초기화 */
	function instaffRegister(object) {

		console.log("현재 주소정보: " + location.href);

		console.log("콜백" + JSON.stringify(object));

		if (object == "" || object == null || object == undefined) {
			// 체크박스 쪽 제이쿼리로 초기화해줘야 함.
			$("#registerId").val("");
			$("#registerPwd").val("");
			$("#registerPwdOk").val("");
			$("#tname").val("");
			$("#user_type").val("");
			$("#email").val("");
			$("#email_detail").val("");
			$("#zip_code").val("");
			$("#loginaddr").val("");
			$("#loginaddr1").val("");
			$("#gender").val("");
			$("#birthday").val("");
			$("#residence").val("");
			$('#tel1').val("");
			$('#tel2').val("");
			$('#tel3').val("");
			$("#hopesalary").val(0);
			$("#careeryear").val(0);
			$("#careermonth").val(0);
			$("#title").val("");
			$("#profile").attr("src", "/filepath/profile/nopic.png");

			// 모든 체크박스 초기화
			$('input[type="checkbox"]').each(function(index) {
				$(this).prop("checked", false);
			});

			$("#grade").val("");
			$("#hopework").val("");
			$("#hopework2").val("");
			$("#hopework3").val("");
			$("#career_content").val("");
			$("#etc").val("");
			$("#user_hope_work").val("");
		} else {
			console.log("현재 주소정보: " + location.href);

			$("#registerId").val(object.loginID);
			$("#registerPwd").val(object.password);
			$("#registerPwdOk").val(object.password);
			$("#tname").val(object.name);
			$("#user_type").val(object.user_type);
			$("#email").val(object.email);
			$("#email_detail").val(object.email_detail);
			$("#zip_code").val(object.zip_code);
			$("#loginaddr").val(object.residence);
			$("#gender").val(object.gender);
			$("#birthday").val(object.birthday);
			$('#tel1').val(object.tel1);
			$('#tel2').val(object.tel2);
			$('#tel3').val(object.tel3);
			$("#hopesalary").val(object.hopesalary);
			$("#careeryear").val(object.careeryear);
			$("#careermonth").val(object.careermonth);
			$("#title").val(object.title);
			$("#add_technic").val(object.add_technic);
			$("#grade").val(object.grade);
			$("#hopework").val(object.hopework);
			$("#hopework2").val(object.hopework2);
			$("#hopework3").val(object.hopework3);
			$("#career_content").val(object.career_content);
			$("#etc").val(object.etc);
			$("#user_hope_work").val(object.user_hope_work);
			var pic = object.profile;
			$("#profile").attr("src", "/filepath/profile/" + object.profile);

			console.log("json: " + object.add_technic);

			// 문자열을 배열로 바꾸기 위한 변수
			var s = object.add_technic;
			var t = [];
			// 체크박스 초기화
			$(".add_technic").each(function(index) {
				$(this).prop("checked", false);
			});

			// 기술이 널이 아닌 것만 배열로 분리.
			if (s != null) {
				for (var i = 0; i < s.split(',').length; i++) {
					t[i] = s.split(',')[i].trim();
				}
			}

			// 조회한 기술명을 체크상태로 변경.
			$(".add_technic").each(function(index) {

				for (var i = 0; i < t.length; i++) {
					if ($(this).val() == t[i]) {
						$(this).prop("checked", true);
					}
				}
			});

		}

	}

	/* 회원가입 validation */
	function RegisterVal() {

		console.log("validationvalidation");

		var rgid = $('#registerId').val();
		var rgpwd = $('#registerPwd').val();
		var rgpwdok = $('#registerPwdOk').val();
		var rgname = $('#tname').val();
		var user_type = $('#user_type').val();
		var email = $('#email').val();
		var email_detail = $('#email_detail').val();
		var dtadr = $('#zip_code').val();
		var lgadr = $('#loginaddr').val();
		var lgadr1 = $('#loginaddr1').val();
		var tel1 = $('#tel1').val();
		var tel2 = $('#tel2').val();
		var tel3 = $('#tel3').val();

		if (rgid.length < 1) {
			swal("아이디를 입력하세요.").then(function() {
				$('#registerId').focus();
			});
			return false;
		}

		if (rgpwd.length < 1) {
			swal("비밀번호를 입력하세요.").then(function() {
				$('#registerPwd').focus();
			});
			return false;
		}

		if (rgpwdok.length < 1) {
			swal("비밀번호 확인을 입력하세요.").then(function() {
				$('#registerPwdOk').focus();
			});
			return false;
		}

		if (rgpwd != rgpwdok) {
			swal("비밀번호가 맞지 않습니다.").then(function() {
				$('#registerPwd').focus();
			});
			return false;
		}

		if (rgname.length < 1) {
			swal("이름을 입력하세요.").then(function() {
				$('#registerName').focus();
			});
			return false;
		}

		if (user_type == "선택") {
			swal("타입을 입력해주세요.").then(function() {
				$("#user_type").focus();
			});
			return false;
		}

		if (email.length < 1) {
			swal("이메일을 입력하세요.").then(function() {
				$('#email').focus();
			});
			return false;
		}

		if (email_detail.length < 1) {
			swal("이메일을 입력하세요.").then(function() {
				$('#email_detail').focus();
			});
			return false;
		}

		if (dtadr.length < 1) {
			swal("우편번호를 입력하세요.").then(function() {
				$('#detailaddr').focus();
			});
			return false;
		}

		if (lgadr.length < 1) {
			swal("주소를 입력하세요.").then(function() {
				$('#loginaddr').focus();
			});
			return false;
		}

		if (lgadr1.length < 1) {
			alert("상세주소를 입력하세요.");
			$('#loginaddr1').focus();
			return false;
		}

		if (tel1.length < 1) {
			swal("전화번호를 입력하세요.").then(function() {
				$('#tel1').focus();
			});
			return false;
		}

		if (tel2.length < 1) {
			swal("전화번호를 입력하세요.").then(function() {
				$('#tel2').focus();
			});
			return false;
		}

		if (tel3.length < 1) {
			swal("전화번호를 입력하세요.").then(function() {
				$('#tel3').focus();
			});
			return false;
		}

		return true;
	}

	function signCheckValue() {
		var select_obj = '';

		$('input[name="add_technic"]:checked').each(function(index) {
			if (index != 0) {
				select_obj += ', ';
			}

			select_obj += $(this).val();

			console.log("select_obj: " + select_obj);
		});

		$("#add_technic").val(select_obj);

		console.log(" final checkValue : " + select_obj);

	}

	/* 회원가입  완료*/
	function CompleteRegister() {

		signCheckValue();

		/*전화번호 정규식*/
		var tel1Rules = /^\d{2,3}$/; // 정수 2,3자리 입력
		var tel2Rules = /^\d{3,4}$/; // 정수 3,4자리 입력
		var tel3Rules = /^\d{4}$/; // 정수 4자리 입력

		var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();

		/* validation 체크 */
		if (!RegisterVal()) {
			return;
		}

		var frm = document.getElementById("RegisterForm");
		frm.enctype = 'multipart/form-data';
		var fileData = new FormData(frm);

		console.dir("file: " + fileData);

		/*패스워드 정규식*/
		// 8~15자리 입력, 정수, 영문, 특문 각각 1나 이상씩 포함, 모든 숫자가능, 모든 영문자 가능, !@#$%^&+= 특문만 가능
		var passwordRules = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var password = $("#registerPwd").val();
		/*이메일 정규식*/
		var emailRules = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		//var emailRules = "";
		var email = $("#email").val();

		loginIdCheckComplete();
		//emailCheck();

		if (RegisterForm.ckIdcheckreg.value == "0" && param.action == 'I') {
			swal("아이디 중복확인을 진행해주세요.").then(function() {
				$("#registerId").focus();
			});
		} else if (!passwordRules.test($("#registerPwd").val())) {
			swal('비밀 번호는 숫자,영문자,특수문자 조합으로 8~15자리를 사용해야 합니다.').then(function() {
				$("#registerPwd").focus();
			});
			return false;

		} else if (!tel1Rules.test($("#tel1").val())) {
			swal("전화번호를 확인해주세요.").then(function() {
				$("#tel1").focus();
			});
		} else if (!tel2Rules.test($("#tel2").val())) {
			swal("전화번호를 확인해주세요.").then(function() {
				$("#tel2").focus();
			});
		} else if (!tel3Rules.test($("#tel3").val())) {
			swal("전화번호를 확인해주세요.").then(function() {
				$("#tel3").focus();
			});
		} else {

			var resultCallback = function(data) {
				fSaveRegister(data);
			}

			callAjaxFileUpload("/registerProfile.do", "post", "json", true,
					fileData, resultCallback);
		}
	}

	/* 회원 가입 저장 콜백함수 */
	function fSaveRegister(data) {

		if (data.result == "SUCCESS") {
			alert(data.resultMsg);
			gfCloseModal();
			if (loginID_test != null || loginID_test != ""
					|| loginID_test != undefined) {
				if (location.href.toString() == "http://localhost/mnp/professorMgt.do")
					location.href = "/mnp/professorMgt.do";
				else if (location.href.toString() == "http://localhost/mnp/studentMgt.do") {
					location.href = "/mnp/studentMgt.do";
				} else if (location.href.toString() == "http://localhost/login.do") {
					location.href = "/";
				}
			} else {
				location.href = "#"
			}
		} else {
			alert(data.resultMsg);
			return false;
		}
	}

	/* 우편번호 api */
	function execDaumPostcode(q) {
		console.log("qqq: " + q);
		new daum.Postcode({
			oncomplete : function(data) {
				console.log("data: " + JSON.stringify(data));
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zip_code').value = data.zonecode;
				document.getElementById("loginaddr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("loginaddr1").focus();
			}
		}).open({
			q : q
		});
	}

	/* loginID 중복체크 */
	function loginIdCheck() {

		var data = {
			"loginID" : $("#registerId").val()
		};

		// 영어나 숫자로만 6~20자리까지 입력가능.
		var idRules = /^[a-z0-9]{6,20}$/g;
		var id = $("#registerId").val();

		/*callAjax시 로그인 여부 확인 하므로 ajax 함수 직접 작성*/
		$.ajax({
			url : '/check_loginID.do',
			type : 'post',
			data : data,
			dataType : 'text',
			async : true,
			success : function(data) {
				if ($("#registerId").val() == "") {
					console.log("입력 아이디 없음");
					swal("아이디를 입력해주세요.").then(function() {
						$("#registerId").focus();
					});
					$("#ckIdcheckreg").val("0");
				} else if (data == 1) {
					console.log("아이디 있음");
					swal("중복된 아이디가 존재합니다.").then(function() {
						$("#registerId").focus();
					});
					console.log(data);
					$("#ckIdcheckreg").val("0");
				} else if (!idRules.test($("#registerId").val())) {
					swal('아이디는 숫자,영문자 조합으로 6~20자리를 사용해야 합니다.').then(function() {
						$("#registerId").focus();
					});
					$("#ckIdcheckreg").val("0");
					return false;
				} else if (data == 0) {
					console.log("아이디 없음");
					swal("사용할 수 있는 아이디 입니다.");
					$("#ckIdcheckreg").val("1");
				}
			}
		});
	}

	/*회원가입 버튼 아이디 중복 체크*/
	function loginIdCheckComplete() {
		console.log("아이디 중복 체크중");

		var data = {
			"loginID" : $("#registerId").val()
		}

		// 영어나 숫자로만 6~20자리까지 입력가능.
		var idRules = /^[a-z0-9]{6,20}$/g;
		var id = $("#registerId").val();

		/*callAjax시 로그인 여부 확인 하므로 ajax 함수 직접 작성*/
		$.ajax({
			url : '/check_loginID.do',
			type : 'post',
			data : data,
			dataType : 'text',
			async : false,
			success : function(data) {
				if (data == 1) {
					$("#ckIdcheckreg").val("0");
					console.log("아이디 있음");
					return false;
				} else if (!idRules.test($("#registerId").val())) {
					$("#ckIdcheckreg").val("0");
					return false;
				}
			}
		});
	}

	/*이메일 중복 체크*/
	function emailCheck() {
		var data = {
			"email" : $("#email").val()
		};

		console.log(JSON.stringify(data));

		$.ajax({
			url : '/check_email.do',
			type : 'post',
			data : data,
			dataType : 'text',
			async : false,
			success : function(data) {
				if (data == 1) {
					$("#ckEmailcheckreg").val("0");
					console.log("이메일 있음");
					console.log(data);
					return false;
				} else {
					$("#ckEmailcheckreg").val("1");
					console.log(data);
					console.log("이메일 없음");
				}

			}
		});
	}

	function PreviewImage(obj) {
		
		// 미리보기 지원
		var preview = new FileReader();
		preview.onload = function(e) {
			document.getElementById("profile").src = e.target.result;
		};
		preview.readAsDataURL(document.getElementById("file_nm").files[0]);
		
		// 이미지만 선택하고 파일은 안되게하나, 안먹힘. 
		var file_kind = obj.value.lastIndexOf('.');
		var file_name = obj.value.substring(file_kind + 1, obj.length);
		var file_type = file_name.toLowerCase();

		var check_file_type = new Array();

		check_file_type = [ 'jpg', 'jpeg', 'png' ];

		if (check_file_type.indexOf(file_type) == -1) {
			alert('이미지 파일만 선택할 수 있습니다.');
			var parent_Obj = obj.parentNode;

			var node = parent_Obj.replaceChild(obj.cloneNode(true), obj);
			
			return false;
		}
	}
</script>


<!-- 모달팝업 -->
	<div id="signModal" class="layerPosition layerPop layerType2" style="width: 1400px;">
		<form id="RegisterForm" action="" method="post">
		<input type="hidden" id="add_technic" name="add_technic" /> 
		<input type="hidden" id="loginID_test" name="loginID_test" value="${session.Scope.loginID}" /> 
		 
	<table class="row">
	<tr>

		<td style="width: 700px;">

	      <input type="hidden" name="action" id="action" value="">
	      <input type="hidden" name="ckIdcheckreg" id="ckIdcheckreg" value="0"/>
	      <input type="hidden" name="ckEmailcheckreg" id="ckEmailcheckreg" value="0"/>	
		<dl>
			<dt>
					<br>
					<br>
					<strong style="font-size:120%">&nbsp;&nbsp;&nbsp;&nbsp;회원가입</strong>
					<br>
			</dt>
			<dd class="content">
				<div class="btn_areaC">
					<br>
					<br>
				</div>
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
						<col width="*">
						<col width="120px">
						<col width="*">
						<col width="120px">					
					</colgroup>
					
							<tr>
								<th scope="row">아이디<span class="font_red">*</span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
									name="loginID" placeholder="숫자, 영문자 조합으로 6~20자리 "
									id="registerId" /></td>
								<td><input type="button" value="중복확인"
									onclick="loginIdCheck()" style="width: 130px; height: 20px;" /></td>
							</tr>
							<tr>
								<th scope="row">비밀번호 <span class="font_red">*</span></th>
								<td colspan="3"><input type="password"
									placeholder="숫자, 영문자, 특수문자 조합으로 8~15자리 " class="inputTxt p100"
									name="password" id="registerPwd" /></td>
							</tr>

							<tr>
								<th scope="row" style="padding: 0 0">비밀번호 확인<span
									class="font_red">*</span></th>
								<td colspan="3"><input type="password"
									class="inputTxt p100" name="password1" id="registerPwdOk" /></td>
							</tr>
							
							<tr>
								<th scope="row" id="registerName_th">이름 <span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100" name="tname"
									id="tname" /></td>
							
								<th scope="row" id="rggender_th">성별 <span class="font_red">*</span></th>
								<td id="rggender_td">
								<select name="gender" id="gender" style="width: 128px; height: 28px;">
										<option value="" selected="selected">선택</option>
										<option value="M">남자</option>
										<option value="W">여자</option>
								</select></td>
							</tr>

							<tr id="birthday1">
							    <th scope="row">생년월일 <span class="font_red">*</span></th>
							    <td><input type="date" class="inputTxt p100" name="birthday" id="birthday" style="font-size: 15px" />
							    
							    <th scope="row" id="registerName_th">타입 <span class="font_red">*</span></th>
							    <td>
							        <select name="user_type">
							            <option value="D">강사</option>
							            <option value="C">학생</option>
							        </select>
							    </td>
							</tr>
							
							<tr>
							    <th scope="row">이메일<span class="font_red">*</span></th>
							    <td>
							    	<input type="text" class="inputTxt p100" name="email" id="email" />
							    </td>
							    <td>
							    </td>
							    <td>
							    	<select id="email_detail" name="email_detail"></select></td>   
							</tr>
							
							<tr>
								<th scope="row">우편번호<span class="font_red">*</span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
									name="zip_code" id="zip_code" /></td>

								<td><input type="button" value="우편번호 찾기"
									onclick="execDaumPostcode()"
									style="width: 130px; height: 20px;" /></td>
							</tr>
							<tr>
								<th scope="row">주소<span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="user_address" id="loginaddr" /></td>
							</tr>
							<tr>
								<th scope="row">상세주소</th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="loginaddr1" id=loginaddr1 /></td>
							</tr>
							<tr>

								<th scope="row">전화번호<span class="font_red">*</span></th>
								<td colspan="3">
								<input class="inputTxt" style="width: 118px" maxlength="3" type="tel" id="tel1"
									name="user_tel1" onkeyup="telCheck(this);"> - <input class="inputTxt"
									style="width: 118px" maxlength="4" type="tel" id="tel2"
									name="user_tel2"> - <input class="inputTxt"
									style="width: 118px" maxlength="4" type="tel" id="tel3"
									name="user_tel3"></td>
							</tr>

							<tr>
								<th scope="row">선호직무분야</th>
								<td colspan="3"><select name="user_hope_work" id="user_hope_work"
									style="width: 400px; height: 28px;">
										<option value="" selected="selected">선택</option>
										<option>웹프로그래머</option>
										<option>응용프로그래머</option>
										<option>시스템프로그래머</option>
										<option>DBA·데이터베이스</option>
										<option>네트워크·서버·보안</option>
										<option>HTML·퍼블리싱·UI개발</option>
										<option>ERP·시스템분석</option>
										<option>빅데이터·AI(인공지능)</option>
										<option>소프트웨어·하드웨어</option>
								</select></td>
							</tr>
							
							
							<tr class="row">
							<th scope="row" scope="row">희망연봉</th>
								<td><input type="number" class="inputTxt p100"
									name="hopesalary" id="hopesalary" />만원</td>
							
								<th scope="row">협의가능여부</th>
								<td id="salary_nego"><select name=salary_nego
									id="salary_nego" style="width: 128px; height: 28px;">
										<option value="" selected="selected">선택</option>
										<option value="Y">가능</option>
										<option value="N">불가능</option>
								</select></td>
							</tr>
				
			
				</table>
		</dd>
			</dl>
				</td>
				
	
				<!-- 경력정보 ---------------------------------------------------------------------->
				<td style="width: 700px;">
				<dl>
				<dd>
				<div>
					<br>
					<br>
					<strong style="font-size:120%">&nbsp;&nbsp;&nbsp;&nbsp;경력정보</strong>
					<br>
					<br>
				</div>
				
					<!-- 추가기술 -->
					<table class="row" id="describe1">
					<tr>
						<td><img src="#" class="LoginImg" id="profile" alt="사진" width="80px" height="100px"  /></td>
					</tr>
					
					<tr>
						<th scope="row">프로필</th>
						<td  colspan="2"><input type="file" class="inputTxt p100" name="btn" id="file_nm" onchange="PreviewImage(this);" accept='image/jpeg,image/gif,image/png'/></td>
					</tr>
					
					<tr>
						<th scope="row">제목</th>
							<td colspan=3>
								<input type="text" class="inputTxt p100" name="title" id="title" />
							</td>
					</tr>
					
							<tr>
								<th scope="row">경력년수</th>
								<td>
								<select id="careeryear" name="careeryear" >
								  <option value="">선택</option>
								  <option>0</option>
								  <option>1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								  <option>6</option>
								  <option>7</option>
								  <option>8</option>
								  <option>9</option>
								  <option>10</option>
								  <option>11</option>
								  <option>12</option>
								  <option>13</option>
								  <option>14</option>
								  <option>15</option>
								  <option>16</option>
								  <option>17</option>
								  <option>18</option>
								  <option>19</option>
								  <option>20</option>
								</select>
								<span>년</span>
							</td>
								
								<td>
								<select name="careermonth" id="careermonth">
								  <option value="">선택</option>
								  <option value="1">1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								  <option>6</option>
								  <option>7</option>
								  <option>8</option>
								  <option>9</option>
								  <option>10</option>
								  <option>11</option>
								  <option>12</option>
								</select>
								<span>월</span>
							</td>
							</tr>
					
					<!-- 체크리스트 -->
 						<tr>
								<th scope="row">Language</th>
									<td colspan="3">
										<label><input type="checkbox" class="add_technic" name="add_technic" value="JAVA">JAVA</label>&nbsp;&nbsp;
										<label><input type="checkbox" class="add_technic" name="add_technic" value="C">C</label>&nbsp;&nbsp;
										<label><input type="checkbox" class="add_technic" name="add_technic" value="C++">C++</label>&nbsp;&nbsp;
										<label><input type="checkbox" class="add_technic" name="add_technic" value="C#">C#</label>&nbsp;&nbsp;
										<label><input type="checkbox" class="add_technic" name="add_technic" value="JSP">JSP</label>&nbsp;&nbsp;
										<label><input type="checkbox" class="add_technic" name="add_technic" value="PHP">PHP</label>&nbsp;&nbsp;
										<label><input type="checkbox" class="add_technic" name="add_technic" value="ASP">ASP</label>&nbsp;&nbsp;
										<label><input type="checkbox" class="add_technic" name="add_technic" value="Node.JS">Node.JS</label>&nbsp;&nbsp;
										<label><input type="checkbox" class="add_technic" name="add_technic" value="VUE">React</label>&nbsp;&nbsp;
										<label><input type="checkbox" class="add_technic" name="add_technic" value="VUE">VUE</label>&nbsp;&nbsp;
                                   </td>

						</tr>
						<tr>
								<th scope="row">DB</th>
								<td colspan="3">
								        <label><input type="checkbox" class="add_technic" name="add_technic" value="Oracle">Oracle</label>&nbsp;&nbsp;
										<label><input type="checkbox" class="add_technic" name="add_technic" value="MySQL">MySQL</label>&nbsp;&nbsp;
										<label><input type="checkbox" class="add_technic" name="add_technic" value="MariaDB">MariaDB</label>&nbsp;&nbsp;
										<label><input type="checkbox" class="add_technic" name="add_technic" value="PostgreSQL">PostgreSQL</label>&nbsp;&nbsp;
										<label><input type="checkbox" class="add_technic" name="add_technic" value="MongoDB">MongoDB</label>&nbsp;&nbsp;
										<label><input type="checkbox" class="add_technic" name="add_technic" value="SQL Server">SQL Server</label>&nbsp;&nbsp;
                                </td>
						</tr>
					
					<!-- 등급 -->
						<tr>
							<th scope="row">등급</th>			
								<td>			
									<select id="grade" name="grade">
									</select>
								</td>
						</tr>					
				
					<!-- 희망 근무지 -->				
						<tr>
							<th scope="row">희망근무지역</th>								
								<td>
									<span>1순위</span>					
									<select style="width:100px; height:25px;" id="hopework" name="hopework">
									</select>
								</td>
								
								<td>
									<span>2순위</span>			
									<select style="width:100px; height:25px;" id="hopework2" name="hopework2">
									</select>
								</td>
								
								<td>
									<span>3순위</span>		
									<select style="width:100px; height:25px;" id="hopework3" name="hopework3">
									</select>
								</td>
						</tr>					
				
						<tr>
							<th scope="row">경력내용</th>
								<td colspan="3">
									<textarea class="inputTxt p100" name="career_content" id="career_content" placeholder="경력사항을 입력하세요." /></textarea>
								</td>
						</tr>						
				
						<tr>
							<th scope="row">특이사항</th>
								<td colspan="3">
									<textarea class="inputTxt p100" name="etc" id="etc" placeholder="특이사항을 입력하세요." /></textarea>
								</td>
						</tr>		
									
				</table>
					</dd>
					</dl>
					</td>
					
					</tr>

				</table>
					
				<div class="btn_areaC mt30">
					<a href="javascript:CompleteRegister();" class="btnType blue"
						id="RegisterCom"> <span>저장</span></a> <a 
						href="javascript:fcancleModal()" class="btnType gray" id="btnCloseLsmCod"><span>취소</span></a>
				</div>

		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</form>	
	</div>