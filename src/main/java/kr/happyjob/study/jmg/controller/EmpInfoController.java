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

import kr.happyjob.study.jmg.model.EmpInfoModel;
import kr.happyjob.study.jmg.model.ResuMgtDtlModel;
import kr.happyjob.study.jmg.service.EmpInfoService;
import kr.happyjob.study.system.model.ComnDtlCodModel;

@Controller
@RequestMapping("/jmg/")
public class EmpInfoController {
	
	@Autowired
	EmpInfoService empInfoService;
	
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	private final String className = this.getClass().toString();
	
	@RequestMapping("careerInfo.do")
	public String init(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start" + className + ".initEmploy");
		logger.info("    - paramMap : " + paramMap);
		
		return "jmg/empInfo";
	}
	
	@RequestMapping("careerInfoList.do")
	public String EmpInfoList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("   - paramMap : " + paramMap);
		
		String searchKey = (String) paramMap.get("searchKey");
		String searchWord = (String) paramMap.get("searchWord");

		paramMap.put("searchKey", searchKey);
		paramMap.put("searchWord", searchWord);
		
		int currentPage = Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex = (currentPage -1) * pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		List<EmpInfoModel> empInfoList = empInfoService.empInfoList(paramMap);
		model.addAttribute("empInfo", empInfoList);
		
		// 목록 수 추출해서 보내기
		int empInfoCnt = empInfoService.empInfoCnt(paramMap);
		
	    model.addAttribute("empInfoCnt", empInfoCnt);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("currentPage",currentPage);
	    logger.info("   - empInfoList : " + empInfoList);
	    return "jmg/empInfoList";
	}
	/**
	 *  그룹코드 삭제
	 */
	@RequestMapping("deleteEmpInfo.do")
	@ResponseBody
	public Map<String, Object> deleteComnGrpCod(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".deleteEmpInfo");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "삭제 되었습니다.";
		
		// 그룹코드 삭제
		empInfoService.deleteEmpInfo(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".deleteEmpInfo");
		
		return resultMap;
	}
	/**
	 *  학생 조회
	 */
	@RequestMapping("selectEmpInfo.do")
	@ResponseBody
	public Map<String, Object> selectComnDtlCod (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectEmpInfo");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 공통 상세 코드 단건 조회
		EmpInfoModel empInfoModel = empInfoService.selectEmpInfo(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("empInfoModel", empInfoModel);
		
		logger.info("+ End " + className + ".selectEmpInfo");
		
		return resultMap;
	}
	@RequestMapping("fRegist.do")
	@ResponseBody
	public Map<String, Object> fRegist (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".fRegist");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 취업 등록
		EmpInfoModel empInfoModel = empInfoService.fRegist(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("empInfoModel", empInfoModel);
		
		logger.info("+ End " + className + ".fRegist");
		
		return resultMap;
	}
	@RequestMapping("fListEmpAdd.do")
	public String EmpInfoAddList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("   - paramMap : " + paramMap);
		
		String searchKey2 = (String) paramMap.get("searchKey2");
		String searchWord2 = (String) paramMap.get("searchWord2");

		paramMap.put("searchKey2", searchKey2);
		paramMap.put("searchWord2", searchWord2);
		
		int currentPage = Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex = (currentPage -1) * pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		List<EmpInfoModel> empInfoAddList = empInfoService.empInfoAddList(paramMap);
		model.addAttribute("empInfoAddList", empInfoAddList);
		
		// 목록 수 추출해서 보내기
		int empInfoAddCnt = empInfoService.empInfoAddCnt(paramMap);
		
	    model.addAttribute("empInfoAddCnt", empInfoAddCnt);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("currentPage",currentPage);
	    logger.info("   - empInfoAddList : " + empInfoAddList);
	    
	    return "jmg/empInfoAddList";
	}
	/**
	 *  취업 정보 등록 저장
	 */
	@RequestMapping("saveEmpList.do")
	@ResponseBody
	public Map<String, Object> saveEmpList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("과정저장" + className + ".saveEmp");
		logger.info("   - paramMap : " + paramMap);
		
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		String action = (String)paramMap.get("action");
		
		if ("I".equals(action)) {
			//  신규 저장
			empInfoService.insertEmpList(paramMap);
		} else if("U".equals(action)) {
			//  수정 저장
			empInfoService.updateEmpList(paramMap);
			System.out.println("---------------------"+paramMap);
		} else {
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
			
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + "saveEmp.do");
		
		return resultMap;
	}
}
