package kr.happyjob.study.jmg.controller;

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

import kr.happyjob.study.jmg.model.ResuMgtDtlModel;
import kr.happyjob.study.jmg.model.ResuMgtModel;
import kr.happyjob.study.jmg.service.ResuMgtService;

@Controller
@RequestMapping("/jmg/")
public class ResuMgtController {
	
	@Autowired
	ResuMgtService resuMgtService;
	
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	private final String className = this.getClass().toString();
	
	@RequestMapping("resumeMgt.do")
	public String init(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start" + className + ".initResume");
		logger.info("    - paramMap : " + paramMap);
		
		return "jmg/resuMgt";
	}
	
	@RequestMapping("resumeMgtList.do")
	public String EmpInfoList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start" + className + ".resumeMgtList");
		logger.info("   - paramMap : " + paramMap);
		
		String searchWord = (String) paramMap.get("searchWord");
		
		int currentPage = Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex = (currentPage -1) * pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		paramMap.put("searchWord", searchWord);
		
		List<ResuMgtModel> resuMgtList = resuMgtService.resuMgtList(paramMap);
		model.addAttribute("resuMgt", resuMgtList);
		
		
		int resuMgtCnt = resuMgtService.resuMgtCnt(paramMap);
		
	    model.addAttribute("resuMgtCnt", resuMgtCnt);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("currentPage",currentPage);
	    
	    logger.info("+ End" + className + ".resuMgtList");
	    
	    return "jmg/resuMgtList";
	}
	// 과정 내 학생 목록 조회
	@RequestMapping("listResuMgtDtl.do")
	public String listResuMgtDtl(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listResuMgtDtl");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
		

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 목록 조회
		List<ResuMgtDtlModel> listResuMgtDtl = resuMgtService.listResuMgtDtl(paramMap);
		model.addAttribute("listResuMgtDtl", listResuMgtDtl);
		
		// 목록 카운트 조회
		int totalCount = resuMgtService.countListResuMgtDtl(paramMap);
		model.addAttribute("totalCntResuMgtDtl", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage",currentPage);
		
		logger.info("+ End " + className + ".listResuMgtDtl");

		return "jmg/resuMgtDtlList";
	}	
	// 학생 정보
	@RequestMapping("selectResuMgtDtl.do")
	public String c_resumeControl_std_Detail(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,  HttpServletResponse response, HttpSession session) throws Exception {
		ResuMgtDtlModel resuMgtDtlModel  = resuMgtService.selectResuMgtDtl(paramMap);
		model.addAttribute("Std_Detail",resuMgtDtlModel);
		return "jmg/stuDetail";
	}
	@RequestMapping("resumeInfo.do")
	@ResponseBody
	public Map<String, Object> selectResuMgtDtl (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".resumeInfo");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 공통 상세 코드 단건 조회
		ResuMgtDtlModel resuMgtDtlModel = resuMgtService.selectResuMgtDtl(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("resuMgtDtlModel", resuMgtDtlModel);
		
		logger.info("+ End " + className + ".resumeInfo");
		
		return resultMap;
	}
}
