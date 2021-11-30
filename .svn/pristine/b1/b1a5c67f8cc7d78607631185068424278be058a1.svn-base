package kr.happyjob.study.lmg.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kr.happyjob.study.lmg.model.PagingInfo;
import kr.happyjob.study.lmg.model.TestInfoSumClass;
import kr.happyjob.study.lmg.service.LmgExamAService;


/**
/**

  * @FileName : LmgExamDController.java

  * @Project : lmselv

  * @Date : 2021. 11. 12. 

  * @작성자 : 윤효열

  * @변경이력 :

  * @프로그램 설명 : 강사가 접근하는 시험 관련 controller

  */
@Controller
@RequestMapping("/lmg/")
public class LmgExamDController {
	
	@Autowired
	private LmgExamAService serviceA;
	
	
	/**
	
	  * @Method Name : examResult
	
	  * @작성일 : 2021. 11. 11.
	
	  * @작성자 : 윤효열
	
	  * @변경이력 : 
	
	  * @Method 설명 : 학습관리 - 시험결과조회 페이지 (강사용) - 강사에 맞는 강의만 출력
	
	  * @return
	
	  */
	@RequestMapping("examResult.do")
	public String examResult(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest req) {
		
		String tmp = (String) paramMap.get("pageNo");
		int pageNo = (tmp == null) ? 1 : Integer.parseInt(tmp);
		
		String loginID = (String) req.getSession().getAttribute("loginId");
		paramMap.put("loginID", loginID);
		try {
			Map<String, Object> map = serviceA.getExsubjectMgt(pageNo, paramMap);
			
			// 시험정보 + 강의 정보 => TestInfoSumClass
			List<TestInfoSumClass> lst = (List<TestInfoSumClass>) map.get("lst");
			PagingInfo pi = (PagingInfo) map.get("pi");
			
			model.addAttribute("lst",lst);
			model.addAttribute("pi",pi);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return "lmg/examResult";
	}
}
