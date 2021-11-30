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

import kr.happyjob.study.lmg.model.ListQnaCodModel;
import kr.happyjob.study.lmg.model.QnaCttModel;
import kr.happyjob.study.lmg.model.QnaModel;
import kr.happyjob.study.lmg.service.QnaService;

@Controller
@RequestMapping("/lmg/")
public class QnaController {
	
	@Autowired
	QnaService qnaService;
	
	// Set logger
		private final Logger logger = LogManager.getLogger(this.getClass());

		// Get class name for logger
		private final String className = this.getClass().toString();
		
	//로그인 후 초기화면 
		@RequestMapping("qna.do") //jsp
	public String initQnaCod(Model model, @RequestParam Map<String, Object>paramMap,HttpServletRequest requet,
			HttpServletResponse response, HttpSession session) throws Exception{
			
			logger.info("+Start"+ className + ".initQnaCod");
			logger.info("-paramMap : "+ paramMap);
			
			logger.info("+ End "+ className +".initQnaCod");
		
		
		return "lmg/qna"; //jsp이름 이걸.....
	}
		// qna 창 초기 접속화면
		@RequestMapping("listQnaCod.do") //jsp
		public String listQnaCod(Model model, @RequestParam Map<String, Object>paramMap,HttpServletRequest requet,
			HttpServletResponse response, HttpSession session) throws Exception{
			
			logger.info("+ Start " + className + ".listQnaCod");
			logger.info("   - paramMap : " + paramMap);
			
			int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
			int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
			int pageIndex = (currentPage-1)*pageSize;
			
			paramMap.put("pageIndex", pageIndex);
			paramMap.put("pageSize", pageSize);
			
			List<ListQnaCodModel>listQnaCodModel = qnaService.listQnaCod(paramMap);
			model.addAttribute("listQnaCodModel", listQnaCodModel);
			
			
			int totalCount = qnaService.countListQnaCod(paramMap);
			model.addAttribute("totalCntQnaCod", totalCount);
			
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPageQnaCod", currentPage);
			
			logger.info("+ End " + className + ".listQnaCod");
			
			return "/lmg/listQnaCod"; //jsp이름 이걸.....
		}
		
		//기존 데이터 조회
		@RequestMapping("selectQnaCttCod.do")
		@ResponseBody
		public Map<String, Object> selectQnaCttCod(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception{
			System.out.println("dsfsdfds");
			logger.info("+ Start " + className + ".selectQnaCttCod");
			logger.info("   - paramMap : " + paramMap);

			String result = "SUCCESS";
			String resultMsg = "조회 되었습니다.";
			
			QnaCttModel qnaCttModel = qnaService.selectQnaCttCod(paramMap);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("result", result);
			resultMap.put("resultMsg", resultMsg);
			resultMap.put("qnaCttModel", qnaCttModel);
			
			logger.info("+End"+ className + ".selectQnaCttCod");
			
			return resultMap;
		}
		
		
		
		
		
		
		
		
		@RequestMapping("saveQnaCttCod.do")
		@ResponseBody
		public Map<String, Object> saveQnaCttCod(Model model, @RequestParam Map<String, Object>paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception{
				
				logger.info("+ Start " + className + ".saveQnaCttCod");
				logger.info("   - paramMap : " + paramMap);
				
				String action = (String)paramMap.get("action");
				
				String result = "SUCCESS";
				String resultMsg = "저장 되었습니다.";
				
				// 사용자 정보 설정
				if("I".equals(action)){
					// 신규 질의 응답
					qnaService.insertQnaCttCod(paramMap);
				} else if("U".equals(action)){
					// 기존 질의 응답 수정
					qnaService.updateQnaCttCod(paramMap);
				}else{
					result = "FALSE";
					resultMsg = "무슨 요청인지 알수 없음";
				}
				
				Map<String, Object> resultMap = new HashMap<>();
				resultMap.put("result", result);
				resultMap.put("resultMsg", resultMsg);
				
				logger.info("+ End " + className + ".saveQnaCttCod");
				
				return resultMap;
		}

}
