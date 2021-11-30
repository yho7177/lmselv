package kr.happyjob.study.login.service;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.common.comnUtils.FileUtilCho;
import kr.happyjob.study.common.comnUtils.Thumbnail;
/*import kr.happyjob.study.common.comnUtils.AESCryptoHelper;
import kr.happyjob.study.common.comnUtils.ComnUtil;*/
import kr.happyjob.study.login.dao.LoginDao;
import kr.happyjob.study.login.model.LgnInfoModel;
import kr.happyjob.study.login.model.UserInfo;
import kr.happyjob.study.login.model.UsrMnuAtrtModel;
import kr.happyjob.study.login.model.UsrMnuChildAtrtModel;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	@Value("${fileUpload.profile}")
	private String profile;	
	
	@Autowired
	ServletContext servletContext;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired
	private LoginDao loginDao;
	
	/** 사용자 로그인 체크*/
	public String checkLogin(Map<String, Object> paramMap) throws Exception {
		return loginDao.checkLogin(paramMap);
	}
	
	/** 사용자 로그인 */
	public LgnInfoModel loginProc(Map<String, Object> paramMap) throws Exception {
		String password = paramMap.get("pwd").toString();
		
		//logger.info(" login before password : " + password);
		//AES 방식 암호화
		//password = AESCryptoHelper.encode( ComnUtil.AES_KEY, password);
		
		//logger.info(" login after password : " + password);
		paramMap.put("pwd", password);
		paramMap.put("profile", profile);
		
		return loginDao.selectLogin(paramMap);
	}
	
	
	/**  사용자 메뉴 권한 */
	public List<UsrMnuAtrtModel> listUsrMnuAtrt(Map<String, Object> paramMap) throws Exception {	
		return loginDao.listUsrMnuAtrt(paramMap);
	}
	

	/**  사용자 자식 메뉴 권한 */
	public List<UsrMnuChildAtrtModel> listUsrChildMnuAtrt(Map<String, Object> paramMap) throws Exception{
		return loginDao.listUsrChildMnuAtrt(paramMap);

	}
	
	/**사용자 단 건 조회*/
	@Override
	public UserInfo selectUser(String loginID) throws Exception {
		
		UserInfo vo = loginDao.selectUser(loginID);
		 
		if(vo.getTel() != null && vo.getTel() != "") {
			String str[] = vo.getTel().split("-");
			
			char telChar[] = vo.getTel().toCharArray();
			int cnt = 0;
			
			for(char s : telChar) {
				if(s == '-')
					cnt++;
			}
			
			System.out.println(cnt);
	
		/* 전화번호 -가 2개 있을때(000-0000-0000) 형식 일 때만 적용 */
		if( vo.getTel() != null  && vo.getTel() != "" && cnt == 2) {
				vo.setTel1(str[0]);
				vo.setTel2(str[1]);
				vo.setTel3(str[2]);
			}
		}
		
		return vo;
	}
	
	/**loginID 중복체크*/
	@Override
	public int check_loginID(LgnInfoModel model) throws Exception {
		int result = loginDao.check_loginID(model);
		return result;
	}
	
	@Override
	public int check_email(LgnInfoModel model) throws Exception {
		int result = loginDao.check_email(model);
		return result;
	}

	/** 사용자 ID 찾기 */
	public LgnInfoModel selectFindId(Map<String, Object> paramMap) throws Exception{
		System.out.println(loginDao.selectFindId(paramMap));
		return loginDao.selectFindId(paramMap);
	}

	/** 사용자 PW 찾기 */
	public LgnInfoModel selectFindPw(Map<String, Object> paramMap) throws Exception{
/*		String password = paramMap.get("pwd").toString();
		//AES 방식 암호화
		password = AESCryptoHelper.encode( ComnUtil.AES_KEY, password);
		paramMap.put("pwd", password);*/
		return loginDao.selectFindPw(paramMap);
	}
	/** 사용자 PW 찾기 ID 체크*/
	@Override
	public LgnInfoModel registerIdCheck(Map<String, Object> paramMap) throws Exception {
	
		return loginDao.registerIdCheck(paramMap);
	}

/*	*//** select박스 은행 목록*//*
	@Override
	public List<LgnInfoModel> selectBankList() {
		List<LgnInfoModel> list = loginDao.selectBankList();
		return list;
	}*/

	/* 이력서파일 업로드 */
	

	
	@Override
	public void insertFile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;

	
		// D:\\FileRepository\\ 밑에 F200330 이런식으로 폴더생성하기위해 가져옴.
		// properties에서 가져오는방법
		String dirPath = LoginDao.getDirectory(); 
		paramMap.put("dirPath", dirPath);
		
		// 파일 저장
		String itemFilePath = dirPath+ File.separator; // 업로드 실제 경로 조립 (무나열생성)
		FileUtilCho fileUtil = new FileUtilCho(multipartHttpServletRequest, "D:\\FileRepository", itemFilePath);
		
		// X:\\FileRepository\dirPath\....
		
		Map<String, Object> fileInfo = fileUtil.uploadFiles(); // 실제 럽로드 처리
		
		// 데이터 저장
		try {
				
				paramMap.put("fileInfo", fileInfo);
				LoginDao.insertResume(paramMap);
				//cmntBbsDao.saveCmntBbsAtmtFil(paramMap);
			
		} catch(Exception e) {
			// 파일 삭제
			fileUtil.deleteFiles(fileInfo);
			throw e;
		}
	}
	
	@Override
	public void insertResume(Map<String, Object> paramMap) {
		LoginDao.insertResume(paramMap);
		
	}

	@Override
	public void insertExcelMap(List<Map<String,Object>> userList) throws Exception {
		
		Iterator<Map<String, Object>> iter = userList.iterator();
		
		// 리스트 내의 맵 객체(row 1줄) 하나씩 inesert를 수행함.
		while(iter.hasNext()) {
				loginDao.insertExcelMap(iter.next());
		}	
	}

	// 회원 정보 수정
	@Override
	public void registerUserUpdate(Map<String, Object> paramMap) throws Exception {
		
		// 전화번호 필드 3개를 하나로 합쳐줌
		   String tel1 = (String) paramMap.get("user_tel1");
		   String tel2 = (String) paramMap.get("user_tel2");
		   String tel3 = (String) paramMap.get("user_tel3");
		   
		   String tel = tel1 + "-" + tel2 + "-" + tel3;
		   paramMap.put("tel", tel);
		   
		   // 주소 + 상세주소를 하나로 합쳐줌
		   String addr1 =  (String) paramMap.get("user_address");
		   String addr2 =  (String) paramMap.get("loginaddr1");
		   
		   paramMap.put("residence", addr1+ " " + addr2);
		   
		   // 프로필이 없으면 nopic.png로 저장.
		  if( paramMap.get("profile") == null )
			  	paramMap.put("profile", "nopic.png");
		   
		   // 가입창에서 tname으로 넘겨서 name으로 다시 변경해줌.
		   paramMap.put("name", (String) paramMap.get("tname"));
		   		
		loginDao.registerUserUpdate(paramMap);
	}

	/* 회원 가입 + 프로필 */
	@Override
	public int registerUserProfile(Map<String, Object> paramMap, MultipartHttpServletRequest mRequest) throws Exception {
		
		String uploadDir = servletContext.getRealPath("X://FileRepository/profile/");
		String s_uploadDir = servletContext.getRealPath("X://FileRepository/profile");
		
		   String tel1 = (String) paramMap.get("user_tel1");
		   String tel2 = (String) paramMap.get("user_tel2");
		   String tel3 = (String) paramMap.get("user_tel3");
		   
		   String addr1 =  (String) paramMap.get("user_address");
		   String addr2 =  (String) paramMap.get("loginaddr1");
		   
		   // 주소를 하나로 합쳐줌.
		   paramMap.put("residence", addr1+ " " + addr2);
		   
			String itemFilePath = profile + File.separator;
			FileUtilCho fileUtil = new FileUtilCho(mRequest, rootPath, itemFilePath);
			Map<String, Object> fileInfo = fileUtil.uploadFiles(); // 실제 럽로드 처리
			
			if( fileInfo.get("file_nm") != null ) {
				String file_addr =  (String) fileInfo.get("file_nm");
				fileInfo.put("prifile",file_addr);
			
				paramMap.put("profile", file_addr);
			}
			// paramMap.put("fileInfo", fileInfo); 파일 정보 안씀.
			
			   // 프로필이 없으면 nopic.png로 저장.
			  if( paramMap.get("profile") == null )
				  	paramMap.put("profile", "nopic.png");
		   
		   
		   // 가입창에서 tname으로 넘겨서 name으로 다시 변경해줌.
		   paramMap.put("name", (String) paramMap.get("tname"));
		   
		   String tel = tel1 + "-" + tel2 + "-" + tel3;
		   paramMap.put("tel", tel);
		   
		int ret = loginDao.registerUserProfile(paramMap);
		
		return ret;
	}


}
