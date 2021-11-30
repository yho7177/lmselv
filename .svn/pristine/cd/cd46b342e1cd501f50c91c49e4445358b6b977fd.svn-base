package kr.happyjob.study.lsp.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.lsp.model.LearnMtrStudtModel;
import kr.happyjob.study.lsp.model.LearnMtrTeachModel;
import kr.happyjob.study.lsp.service.LearnMtrService;
import kr.happyjob.study.lsp.model.LearnMtrStudtModel;
import kr.happyjob.study.lsp.model.LearnMtrTeachModel;



@Controller
@RequestMapping("/lsp/")
public class LearnMtrController {
	
	@Autowired
	LearnMtrService learnMtrService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	//학습자료관리 강사조회 초기화면
	@RequestMapping("documentMgt.do")
	public String initDocument(Model model, @RequestParam Map<String, Object>paramMap, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initDocument");
		logger.info("   - paramMap : " + paramMap);
		
		String usertype = (String) session.getAttribute("userType");
		String  loginID = (String) session.getAttribute("loginId");
		
		paramMap.put("loginID", loginID);
		
		
		
		model.addAttribute("usertype", usertype);
		model.addAttribute("loginID", loginID);
		
		logger.info("+ End " + className + ".initDocument");
		
		return "/lsp/learnMtr";
	}
	//학습자료관리 학생조회 초기화면
	@RequestMapping("document.do")
	public String initDocument2(Model model, @RequestParam Map<String, Object>paramMap, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initDocument2");
		logger.info("   - paramMap : " + paramMap);
		
		String usertype = (String) session.getAttribute("userType");
		String  loginID = (String) session.getAttribute("loginId");
		
		paramMap.put("loginID", loginID);
		
		
		
		model.addAttribute("usertype", usertype);
		model.addAttribute("loginID", loginID);
		
		logger.info("+ End " + className + ".initDocument2");
		
		return "/lsp/learnMtr";
	}

	// 자료 목록 조회
	@RequestMapping("documentTeachList.do")
	public String listMtrTeachDoc(Model model, @RequestParam Map<String, Object> paramMap, 
			HttpServletRequest request,	HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listMtrTeachDoc");
		logger.info("   - paramMap : " + paramMap);
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;	
		
		String usertype = (String) session.getAttribute("userType");
		String  loginID = (String) session.getAttribute("loginId");
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		paramMap.put("loginID", loginID);
		
		/* 강사 목록 조회 */
		if ("D".equals(usertype)) {

			logger.info("   - usertype : " + usertype);
			
			// 과제 목록 조회
			List<LearnMtrTeachModel> listMtrTeachModel = learnMtrService.listMtrTeachDoc(paramMap);
			model.addAttribute("listMtrTeachModel", listMtrTeachModel);
			
			// 과제 목록 카운트 조회
			int totalCount = learnMtrService.countListMtrTeachDoc(paramMap);
			model.addAttribute("totalCntTeach", totalCount);
			
		/* 학생 강의명 콤보박스 */
		} else if("C".equals(usertype)) {

			logger.info("   - usertype : " + usertype);
			
			// 과제 목록 조회
			List<LearnMtrTeachModel> listMtrTeachModel2 = learnMtrService.listMtrTeachDoc2(paramMap);
			model.addAttribute("listMtrTeachModel", listMtrTeachModel2);
			
			// 과제 목록 카운트 조회
			int totalCount2 = learnMtrService.countListMtrTeachDoc2(paramMap);
			model.addAttribute("totalCntTeach", totalCount2);
			
		}
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageTeachMain",currentPage);
		
		model.addAttribute("usertype", usertype);
		model.addAttribute("loginID", loginID);
		
		logger.info("+ End " + className + ".listMtrTeachDoc");
		
		return "/lsp/learnMtrMaint";
	}
	
	/* 자료 목록 단건조회 */
	@RequestMapping("selectMtrTeach.do")
	@ResponseBody
	public Map<String, Object> selectMtrTeach (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectMtrTeach");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		LearnMtrTeachModel learnMtrTeachModel;
		LearnMtrTeachModel learnMtrTeachModel2;
		
		String usertype = (String) session.getAttribute("userType");
		String  loginID = (String) session.getAttribute("loginId");
		
		paramMap.put("loginID", loginID);
		
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		/* 강사가 강의중인 목록 단건 조회 */
		if ("D".equals(usertype)) {

			logger.info("   - usertype : " + usertype);
			
			learnMtrTeachModel = learnMtrService.selectMtrTeach(paramMap);
			
			resultMap.put("learnMtrTeachModel", learnMtrTeachModel);
			resultMap.put("result", result);
			resultMap.put("resultMsg", resultMsg);
			
		/* 학생이 수강중인 목록 단건 조회 */
		} else if("C".equals(usertype)) {

			logger.info("   - usertype : " + usertype);

			learnMtrTeachModel2 = learnMtrService.selectMtrTeach2(paramMap);
			
			resultMap.put("learnMtrTeachModel2", learnMtrTeachModel2);
			resultMap.put("result", result);
			resultMap.put("resultMsg", resultMsg);
		}
		
		resultMap.put("usertype", usertype);
		resultMap.put("loginID", loginID);
		
		
		logger.info("+ End " + className + ".selectMtrTeach");
		
		return resultMap;
	}
	
	/* 자료 등록 저장 */
	@RequestMapping("saveMtrTeach.do")
	@ResponseBody
	public Map<String, Object> saveMtrTeach(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".saveMtrTeach");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action");
		
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		if ("I".equals(action)) {
			// 그룹코드 신규 저장
			logger.info("   - action : " + action);
			
			learnMtrService.insertMtrTeach(paramMap);
			
		} else if("U".equals(action)) {
			// 그룹코드 수정 저장
			logger.info("   - action : " + action);
			
			learnMtrService.updateMtrTeach(paramMap);
			
		} else {
			logger.info("   - action : " + action);
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveMtrTeach");
		
		return resultMap;
	}
	
	/* 자료 삭제*/
	@RequestMapping("deleteMtrTeach.do")
	@ResponseBody
	public Map<String, Object> deleteMtrTeach(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".deleteMtrTeach");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "삭제 되었습니다.";
		
		learnMtrService.deleteMtrTeach(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".deleteMtrTeach");
		
		return resultMap;
	}
	
	/* 올려진 자료 목록 조회 */
	@RequestMapping("listMtrStudt.do")
	public String listMtrStudt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listMtrStudt");
		logger.info("   - paramMap : " + paramMap);
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 올려진 자료목록 조회
		List<LearnMtrStudtModel> listMtrStudtModel = learnMtrService.listMtrStudt(paramMap);
		model.addAttribute("listMtrStudtModel", listMtrStudtModel);
		
		// 올려진 자료 카운트 조회
		int totalCount = learnMtrService.countListMtrStudt(paramMap);
		model.addAttribute("totalCntMrtSub", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageMrtSub",currentPage);
		
		logger.info("+ End " + className + ".listMtrStudt");

		return "/lsp/learnMtr";
	}
	
	/* 올려진 자료 단건 조회 */
	@RequestMapping("selectMtrStudt.do")
	@ResponseBody
	public Map<String, Object> selectMtrStudt (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectMtrStudt");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		LearnMtrStudtModel learnMtrStudtModel = learnMtrService.selectMtrStudt(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("learnMtrStudtModel", learnMtrStudtModel);
		
		logger.info("+ End " + className + ".selectMtrStudt");
		
		return resultMap;
	}
	
	/* 과제 제출 저장 */
//	@RequestMapping("saveMtrStudt.do")
//	@ResponseBody
//	public Map<String, Object> saveMtrStudt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
//			HttpServletResponse response, HttpSession session) throws Exception {
//		
//		logger.info("+ Start " + className + ".saveMtrStudt");
//		logger.info("   - paramMap : " + paramMap);
//
//		String action = (String)paramMap.get("action");
//		String result = "SUCCESS";
//		String resultMsg = "저장 되었습니다.";
//		String  loginID = (String) session.getAttribute("loginId");
//		
//		if ("I".equals(action)) {
//			// 과제 제출 신규 저장
//			learnMtrService.insertMtrStudt(paramMap,request);
//			
//			paramMap.put("loginID", loginID);
//			model.addAttribute("loginID", loginID);
//			
//		} else if("U".equals(action)) {
//			// 과제 제출 수정 저장
//			learnMtrService.updateMtrStudt(paramMap,request);
//		} else {
//			result = "FALSE";
//			resultMsg = "알수 없는 요청 입니다.";
//		}
//		
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		
//		logger.info("saveMtrStudt    result : "+result + "resultMsg" +  resultMsg);
//		
//		resultMap.put("result", result);
//		resultMap.put("resultMsg", resultMsg);
//		
//		logger.info("+ End " + className + ".saveMtrStudt");
//		
//		return resultMap;
//	}
//	
//	/* 과제 제출 삭제*/
//	@RequestMapping("deleteMtrStudt.do")
//	@ResponseBody
//	public Map<String, Object> deleteMtrStudt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
//			HttpServletResponse response, HttpSession session) throws Exception {
//		
//		logger.info("+ Start " + className + ".deleteMtrStudt");
//		logger.info("   - paramMap : " + paramMap);
//
//		String result = "SUCCESS";
//		String resultMsg = "삭제 되었습니다.";
//		
//		learnMtrService.deleteMtrStudt(paramMap, request);
////		homeworkService.deleteHwfile(paramMap);
//		
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		resultMap.put("result", result);
//		resultMap.put("resultMsg", resultMsg);
//		
//		logger.info("+ End " + className + ".deleteMtrStudt");
//		
//		return resultMap;
//	}
//	
//	@RequestMapping("downloadHwFile.do")
//    public void downloadHwFile(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
//          HttpServletResponse response, HttpSession session) throws Exception {
//    
//       logger.info("+ Start " + className + ".downloadHwFile");
//       logger.info("   - paramMap : " + paramMap);
       
       // 첨부파일 조회
       
//       LearnMtrStudtModel learnMtrStudtModel = homeworkService.selectHwSub(paramMap);
//       
//       byte fileByte[] = FileUtils.readFileToByteArray(new File(homeworkSubModel.getFile_root()));
//       
//       response.setContentType("application/octet-stream");
//        response.setContentLength(fileByte.length);
//        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(homeworkSubModel.getFile_name(),"UTF-8")+"\";");
//        response.setHeader("Content-Transfer-Encoding", "binary");
//        response.getOutputStream().write(fileByte);
//         
//        response.getOutputStream().flush();
//        response.getOutputStream().close();
//
//       logger.info("+ End " + className + ".downloadHwFile");
//	}
}

