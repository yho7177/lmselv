package kr.happyjob.study.lsp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.lmg.model.LmgListModel;
import kr.happyjob.study.lmg.service.LmgService;
import kr.happyjob.study.lsp.model.lectureNewModel;
import kr.happyjob.study.lsp.service.lectureNewService;

@Controller
@RequestMapping("/lsp/")
public class lectureController {

	@Autowired
	LmgService lmgService;
	
	@Autowired
	lectureNewService lectureService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	/**
	 * 공지사항 관리 초기화면
	 */
	@RequestMapping("lecture.do")
	public String initlecture(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".initlecture");
		logger.info("   - paramMap : " + paramMap);

		String loginID = (String) session.getAttribute("loginId");
		String usertype = (String) session.getAttribute("userType");
		model.addAttribute("usertype", usertype);
		paramMap.put("loginID", loginID);
		paramMap.put("usertype", usertype);

		System.out.println(loginID);
		System.out.println(usertype);

		return "lsp/lectureNew";
	}

	/**
	 * 공지사항 목록 조회
	 */
	@RequestMapping("lectureList.do")
	public String lectureList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("   - paramMap : " + paramMap);
		String title = (String) paramMap.get("title");

		int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); // 현재
																					// 페이지
																					// 번호
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); // 페이지
																			// 사이즈
		int pageIndex = (currentPage - 1) * pageSize; // 페이지 시작 row 번호

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		paramMap.put("title", title);

		// 공지사항 목록 조회
		List<lectureNewModel> lectureList = lectureService.lectureList(paramMap);
		model.addAttribute("lecture", lectureList);

		// 목록 수 추출 카운트 조회
		int totalCount = lectureService.lectureCnt(paramMap);

		model.addAttribute("lectureCnt", totalCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage", currentPage);

		logger.info("+ End " + className + ".lectureList");

		return "lsp/lectureListNew";
	}

	/**
	 * 공지사항 상세 조회
	 */
	@RequestMapping("detaillecture.do")
	@ResponseBody
	public Map<String, Object> detaillecture(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".detaillecture");
		logger.info("   - paramMap : " + paramMap);

		String result = "";

		// 공지사항 코드 단건 조회
		lectureNewModel detaillecture = lectureService.lectureDetail(paramMap);
		
		if(detaillecture != null) {
			result = "SUCCESS";  // 성공시 찍습니다. 
		}else {
			result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
		}

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", detaillecture);
		resultMap.put("resultMsg", result);
		System.out.println(detaillecture);

		logger.info("+ End " + className + ".detaillecture");

		return resultMap;
	}

	/**
	 * 공지사항 신규등록, 업데이트
	 */
	@RequestMapping("lectureSave.do")
	// Map 형태 redirect안할때 씀 즉 값만 바꾸겠다.라는 이야기
	@ResponseBody
	public Map<String, Object> lectureSave(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".lectureSave");
		logger.info("   - paramMap : " + paramMap);

		String action = (String) paramMap.get("action");

	    String result = "SUCCESS";
		String resultMsg = "저장완료";

		
		if("I".equals(action)){
			lectureService.insertlecture(paramMap);
		} else if("U".equals(action)){
			lectureService.updatelecture(paramMap);
		} else{
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
/*		// 사용자 정보 설정
		paramMap.put("loginID1", session.getAttribute("loginID"));
		if ("I".equals(action)) {
			// 신규 저장
			lectureService.insertlecture(paramMap);
			resultMsg = "SUCCESS";
		} else if ("U".equals(action)) {
			// 수정 저장
			lectureService.updatelecture(paramMap);
			resultMsg = "UPDATED";
			System.out.println(paramMap);
		} else {
			resultMsg = "FALSE : 등록에 실패하였습니다.";
		}*/

		// 결과값 전송
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;
	}

	/**
	 * 공지사항 삭제
	 */
	@RequestMapping("lectureDelete.do")
	@ResponseBody
	public Map<String, Object> lectureDelete(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".lectureDelete");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "DELETED";

		// 공지사항 삭제
		
		lectureService.deletelecture(paramMap);
//		lectureService.deleteNofile(paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		logger.info("+ End " + className + ".lectureDelete");

		return resultMap;
	}
	
		
	//파일다운로드
	@RequestMapping("downloadltFile.do")
	public void downloadltFile(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".downloadltFile");
		logger.info("   - paramMap : " + paramMap);


	}

	// 20211128 개발화면
	/**
	 * 강의계획서 및 공지 화면
	 * 20211128 개발
	 */
	@RequestMapping("lecturePlan.do")
	public String lecturePlanList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".initlecture");
		logger.info("   - paramMap >>>>> : " + paramMap);

		String loginID = (String) session.getAttribute("loginId");
		String usertype = (String) session.getAttribute("userType");
		model.addAttribute("usertype", usertype);
		paramMap.put("loginID", loginID);
		paramMap.put("usertype", usertype);

		System.out.println(loginID);
		System.out.println(usertype);

		return "lsp/lecturePlanList";
	}

	/**
	 * 강의계획서 및 공지 데이터 가져오기
	 * 20211128 개발
	 */
	@RequestMapping("lecturePlanData.do")
	public String listLgmGrp(Model model, @RequestParam Map<String, Object> paramMap, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception{
		logger.info("start" + className + ".listLmgGrp");
		logger.info("paramMap : " + paramMap);
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
		int pageIndex = (currentPage-1)*pageSize;
		String loginID = (String)session.getAttribute("loginId");
		String userType = (String)session.getAttribute("userType");
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		paramMap.put("loginId", loginID);
		
			
		logger.info("usertype :" + userType);
		logger.info("loingID :" + loginID);
		List<LmgListModel> listModel = lmgService.lecturePlanData(paramMap);
		model.addAttribute("listModel", listModel);
		int totalCount = lmgService.countlecturePlanData(paramMap);
		model.addAttribute("countListComnGrpCod", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageComGrpCod", currentPage);
		
		model.addAttribute("usertype", userType);
		model.addAttribute("loginID", loginID);
		
		logger.info("end" + className + ".listLmgGrp");
		
		return "/lsp/lecturePlanData";
	}
}