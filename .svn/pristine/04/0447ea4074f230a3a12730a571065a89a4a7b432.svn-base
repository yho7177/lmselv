package kr.happyjob.study.lmg.controller;

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

import kr.happyjob.study.lmg.model.HomeworkMgtModel;
import kr.happyjob.study.lmg.model.SurveyModel;
import kr.happyjob.study.lmg.service.SurveyService;

@Controller
@RequestMapping("/lmg")
public class SurveyController {

	@Autowired
	SurveyService surveyService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	// 학생 설문 조회 초기화면
	@RequestMapping("survey.do")
	public String initSurvey(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".initSurvey");
		logger.info("   - paramMap : " + paramMap);

		String usertype = (String) session.getAttribute("userType");
		String loginID = (String) session.getAttribute("loginId");

		paramMap.put("loginID", loginID);

		model.addAttribute("usertype", usertype);
		model.addAttribute("loginID", loginID);

		logger.info("+ End " + className + ".initSurvey");

		return "lmg/survey";
	}

	// 수강 목록 조회
	@RequestMapping("surveyList.do")
	public String listSurvey(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".listSurvey");
		logger.info("   - paramMap : " + paramMap);

		int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); // 현재
																					// 페이지
																					// 번호
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); // 페이지
																			// 사이즈
		int pageIndex = (currentPage - 1) * pageSize; // 페이지 시작 row 번호

		String usertype = (String) session.getAttribute("userType");
		String loginID = (String) session.getAttribute("loginId");

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);

		paramMap.put("loginID", loginID);

		logger.info("   - usertype : " + usertype);

		if ("A".equals(usertype)) { // 관리자

			// 수강 목록 조회
			List<SurveyModel> listSurveyModel = surveyService.listSurveyMgt(paramMap);
			model.addAttribute("listSurveyModel", listSurveyModel);

			// 수강 목록 카운트 조회
			int totalCount = surveyService.countListSurveyMgt(paramMap);
			model.addAttribute("totalCntSurvey", totalCount);

		} else if ("D".equals(usertype)) { // 강사

			// 수강 목록 조회
			List<SurveyModel> listSurveyModel = surveyService.listSurveyResult(paramMap);
			model.addAttribute("listSurveyModel", listSurveyModel);

			// 수강 목록 카운트 조회
			int totalCount = surveyService.countListSurveyResult(paramMap);
			model.addAttribute("totalCntSurvey", totalCount);

		} else { // 학생

			// 수강 목록 조회
			List<SurveyModel> listSurveyModel = surveyService.listSurvey(paramMap);
			model.addAttribute("listSurveyModel", listSurveyModel);

			// 수강 목록 카운트 조회
			int totalCount = surveyService.countListSurvey(paramMap);
			model.addAttribute("totalCntSurvey", totalCount);
		}

		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageSurvey", currentPage);

		model.addAttribute("usertype", usertype);
		model.addAttribute("loginID", loginID);

		logger.info("+ End " + className + ".listSurvey");

		return "/lmg/surveyList";
	}

	/* 학생 목록 조회 */
	@RequestMapping("surveyUserList.do")
	public String listSurveyuser(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".listSurveyuser");
		logger.info("   - paramMap : " + paramMap);

		int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); // 현재
																					// 페이지
																					// 번호
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); // 페이지
																			// 사이즈
		int pageIndex = (currentPage - 1) * pageSize; // 페이지 시작 row 번호

		String usertype = (String) session.getAttribute("userType");
		String loginID = (String) session.getAttribute("loginId");

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);

		paramMap.put("loginID", loginID);

		logger.info("   - usertype : " + usertype);

		// 학생 목록 조회
		List<SurveyModel> listSurveyUserModel = surveyService.listSurveyUser(paramMap);
		model.addAttribute("listSurveyUserModel", listSurveyUserModel);

		// 학생 목록 카운트 조회
		int totalCount = surveyService.countListSurveyUser(paramMap);
		model.addAttribute("totalCntSurveyUser", totalCount);

		logger.info("+ End " + className + ".listSurveyuser");

		return "/lmg/surveyUserList";
	}

	/* 설문조사 모달 data */
	@RequestMapping("/surveyQList.do")
	public String surveySubmit(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".surveySubmit");
		logger.info("   - paramMap : " + paramMap);

		String usertype = (String) session.getAttribute("userType");
		String loginID = (String) session.getAttribute("loginId");
		// int ciNo = 0;

		// int currentPage =
		// Integer.parseInt((String)paramMap.get("currentPage")); // 현재 페이지 번호
		// int pageSize = Integer.parseInt((String)paramMap.get("pageSize")); //
		// 페이지 사이즈
		// int pageIndex = (currentPage-1)*pageSize; // 페이지 시작 row 번호
		//
		// paramMap.put("pageIndex", pageIndex);
		// paramMap.put("pageSize", pageSize);

		paramMap.put("usertype", usertype);
		paramMap.put("loginID", loginID);

		// 설문조사 모달 불러오기
		List<SurveyModel> surveyModel = surveyService.svyQList(paramMap);

		// if(surveyModel.size() > 0) {
		// ciNo = surveyModel.get(0).getCi_no();
		// }

		model.addAttribute("surveyModel", surveyModel);
		// model.addAttribute("ciNo", ciNo);
		model.addAttribute("surveycnt", surveyModel.size());

		// 설문조사 카운트 조회
		int totalCount = surveyService.countSvyQList(paramMap);
		model.addAttribute("totalCount", totalCount);

		// model.addAttribute("pageSize",pageSize);
		// model.addAttribute("currentPage",currentPage);

		logger.info("+ End " + className + ".surveySubmit");

		return "/lmg/surveyQList";
	}

	/* 설문 라디오버튼 값 DB insert */
	@RequestMapping("/surveyInsert.do")
	@ResponseBody
	public Map<String, Object> surveyInsert(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".surveyInsert");
		logger.info("   - paramMap : " + paramMap);

		String loginID = (String) session.getAttribute("loginId");

		paramMap.put("loginID", loginID);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		surveyService.srvyQueSub(paramMap); // 설문답
		surveyService.svyYN(paramMap); // 설문 상태 업데이트

		resultMap.put("result", "SUCCESS");

		logger.info("+ End " + className + ".surveyInsert");

		return resultMap;
	}

	/* 설문조가 값 불러오기 */
	@RequestMapping("surveyAList.do")
	@ResponseBody
	public Map<String, Object> surveyAList(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".surveyAList");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";


		String usertype = (String) session.getAttribute("userType");
		//String loginID = (String) session.getAttribute("loginId");

		//paramMap.put("loginID", loginID);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		logger.info("   - usertype : " + usertype);
		
		List<SurveyModel> suveryAListModel = surveyService.surveyAList(paramMap);
		
		resultMap.put("suveryAListModel", suveryAListModel);
		resultMap.put("suverycnt", suveryAListModel.size());
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		
		logger.info("+ End " + className + ".surveyAList");

		return resultMap;
	}
}
