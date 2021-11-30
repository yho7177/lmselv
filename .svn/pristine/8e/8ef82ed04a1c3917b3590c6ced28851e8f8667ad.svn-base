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

import kr.happyjob.study.lmg.model.HomeworkSubModel;
import kr.happyjob.study.lsp.model.NoticeNewModel;
import kr.happyjob.study.lsp.service.NoticeNewService;

@Controller
@RequestMapping("/lsp/")
public class NoticeNewController {

	@Autowired
	NoticeNewService noticeService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	/**
	 * 공지사항 관리 초기화면
	 */
	@RequestMapping("notice.do")
	public String initNotice(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".initNotice");
		logger.info("   - paramMap : " + paramMap);

		String loginID = (String) session.getAttribute("loginId");
		String usertype = (String) session.getAttribute("userType");
		model.addAttribute("usertype", usertype);
		paramMap.put("loginID", loginID);
		paramMap.put("usertype", usertype);

		System.out.println(loginID);
		System.out.println(usertype);

		return "lsp/noticeNew";
	}

	/**
	 * 공지사항 목록 조회
	 */
	@RequestMapping("noticeList.do")
	public String noticeList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
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
		List<NoticeNewModel> noticeList = noticeService.noticeList(paramMap);
		model.addAttribute("notice", noticeList);

		// 목록 수 추출 카운트 조회
		int totalCount = noticeService.noticeCnt(paramMap);

		model.addAttribute("noticeCnt", totalCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage", currentPage);

		logger.info("+ End " + className + ".noticeList");

		return "lsp/noticeListNew";
	}

	/**
	 * 공지사항 상세 조회
	 */
	@RequestMapping("detailNotice.do")
	@ResponseBody
	public Map<String, Object> detailNotice(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".detailNotice");
		logger.info("   - paramMap : " + paramMap);

		String result = "";

		// 공지사항 코드 단건 조회
		NoticeNewModel detailNotice = noticeService.noticeDetail(paramMap);
		
		if(detailNotice != null) {
			result = "SUCCESS";  // 성공시 찍습니다. 
		}else {
			result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
		}

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", detailNotice);
		resultMap.put("resultMsg", result);
		System.out.println(detailNotice);

		logger.info("+ End " + className + ".detailNotice");

		return resultMap;
	}

	/**
	 * 공지사항 신규등록, 업데이트
	 */
	@RequestMapping("noticeSave.do")
	// Map 형태 redirect안할때 씀 즉 값만 바꾸겠다.라는 이야기
	@ResponseBody
	public Map<String, Object> noticeSave(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".noticeSave");
		logger.info("   - paramMap : " + paramMap);

		String action = (String) paramMap.get("action");

		// String result = "SUCCESS";
		String resultMsg = "";

		// 사용자 정보 설정
		paramMap.put("loginID1", session.getAttribute("loginID"));
		if ("I".equals(action)) {
			// 신규 저장
			noticeService.insertNotice(paramMap, request);
			resultMsg = "SUCCESS";
		} else if ("U".equals(action)) {
			// 수정 저장
			noticeService.updateNotice(paramMap, request);
			resultMsg = "UPDATED";
			System.out.println(paramMap);
		} else {
			resultMsg = "FALSE : 등록에 실패하였습니다.";
		}

		// 결과값 전송
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultMsg", resultMsg);

		return resultMap;
	}

	/**
	 * 공지사항 삭제
	 */
	@RequestMapping("noticeDelete.do")
	@ResponseBody
	public Map<String, Object> noticeDelete(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".noticeDelete");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "DELETED";

		// 공지사항 삭제
		
		noticeService.deleteNotice(paramMap,request);
//		noticeService.deleteNofile(paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		logger.info("+ End " + className + ".noticeDelete");

		return resultMap;
	}
	
		
	//파일다운로드
	@RequestMapping("downloadNtFile.do")
	public void downloadNtFile(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".downloadNtFile");
		logger.info("   - paramMap : " + paramMap);

		// 첨부파일 조회
		NoticeNewModel noticeNewModel = noticeService.noticeDetail(paramMap);

		byte fileByte[] = FileUtils.readFileToByteArray(new File(noticeNewModel.getFile_root()));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(noticeNewModel.getFile_name(), "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);

		response.getOutputStream().flush();
		response.getOutputStream().close();

		logger.info("+ End " + className + ".downloadNtFile");
	}

}
