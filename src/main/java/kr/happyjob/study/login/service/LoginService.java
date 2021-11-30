package kr.happyjob.study.login.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.login.model.LgnInfoModel;
import kr.happyjob.study.login.model.UserInfo;
import kr.happyjob.study.login.model.UsrMnuAtrtModel;
import kr.happyjob.study.login.model.UsrMnuChildAtrtModel;



public interface LoginService {
	
	/** 사용자 로그인 체크*/
	public String checkLogin(Map<String, Object> paramMap) throws Exception;
	
	/** 사용자 로그인 */
	public LgnInfoModel loginProc(Map<String, Object> paramMap) throws Exception;
	
	/** 사용자 메뉴 권한 */
	public List<UsrMnuAtrtModel> listUsrMnuAtrt(Map<String, Object> paramMap) throws Exception;
	
	/**  사용자 자식 메뉴 권한 */
	public List<UsrMnuChildAtrtModel> listUsrChildMnuAtrt(Map<String, Object> paramMap) throws Exception;
	
	/** 사용자 회원가입 + 프로필*/
	public int registerUserProfile(Map<String, Object> paramMap, MultipartHttpServletRequest mRequest) throws Exception;
	
	/** 사용자 업데이트*/
	public void registerUserUpdate(Map<String, Object> paramMap) throws Exception;
	
	/** 사용자 단 건 조회*/
	public UserInfo selectUser(String loginID) throws Exception;
	
	/*loginID 중복체크*/
	public int check_loginID(LgnInfoModel model) throws Exception;
	
	/*이메일 중복체크*/
	public int check_email(LgnInfoModel model) throws Exception;
	
	/** 사용자 ID 찾기 */
	public LgnInfoModel selectFindId(Map<String, Object> paramMap) throws Exception;

	/** 사용자 PW 찾기 */
	public LgnInfoModel selectFindPw(Map<String, Object> paramMap) throws Exception;
	
	/** 사용자 PW 찾기 ID 체크*/
	public LgnInfoModel registerIdCheck(Map<String, Object> paraMap) throws Exception;
	
	/* 이력서 파일 업로드 */
	void insertFile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;
	
	void insertResume(Map<String, Object> paramMap);
	
	/** 엑셀 INSERT */
	public void insertExcelMap(List<Map<String,Object>> userList) throws Exception;


	
/*	*//** select 박스 은행 목록*//*
	List<LgnInfoModel> selectBankList();*/

}
