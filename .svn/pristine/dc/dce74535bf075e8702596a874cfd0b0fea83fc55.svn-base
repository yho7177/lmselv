package kr.happyjob.study.login.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.login.model.LgnInfoModel;
import kr.happyjob.study.login.model.UserInfo;
import kr.happyjob.study.login.model.UsrMnuAtrtModel;
import kr.happyjob.study.login.model.UsrMnuChildAtrtModel;


public interface LoginDao {
	
	/** 사용자 로그인 체크*/
	public String checkLogin(Map<String, Object> paramMap);
	
	/** 사용자 로그인 */
	public LgnInfoModel selectLogin(Map<String, Object> paramMap);
	
	/**  사용자 메뉴 권한 */
	public List<UsrMnuAtrtModel> listUsrMnuAtrt(Map<String, Object> paramMap);
	
	/**  사용자 자식 메뉴 권한 */
	public List<UsrMnuChildAtrtModel> listUsrChildMnuAtrt(Map<String, Object> paramMap);
	
	/** 사용자 ID 찾기 */
	public LgnInfoModel selectFindId(Map<String, Object> paramMap);

	/** 사용자 PW 찾기 */
	public LgnInfoModel selectFindPw(Map<String, Object> paramMap);
	
	/** 사용자 PW 찾기 ID 체크*/
	public LgnInfoModel registerIdCheck(Map<String, Object> paraMap);

	/** 사용자 회원가입 + 프로필*/
	public int registerUserProfile(Map<String, Object> paramMap);
	
	/** 사용자 업데이트*/
	public int registerUserUpdate(Map<String, Object> paramMap);
	
	/** 사용자 단 건 조회*/
	public UserInfo selectUser(String loginID);
	
	/** 사용자스킬*/
	public int registerUser_skill(Map<String, Object> paramMap);
	
	/**loginID 중복체크*/
	public int check_loginID(LgnInfoModel model);
	
	/**이메일 중복체크*/
	public int check_email(LgnInfoModel model);
	
	/**이력서 파일 업로드 */
	public static void insertResume(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		
	}
	
	public static String getDirectory() {
		// TODO Auto-generated method stub
		return null;
	} 
	
	/** 엑셀 INSERT */
	public void insertExcelMap(Map<String, Object> userList);
	
	
	
/*	*//**select박스 은행 목록*//*
	public List<LgnInfoModel> selectBankList();*/
	
}
