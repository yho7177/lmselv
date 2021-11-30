package kr.happyjob.study.lmg.controller;


import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.lmg.model.ClassInfo;
import kr.happyjob.study.lmg.model.InquireExam;
import kr.happyjob.study.lmg.model.PagingInfo;
import kr.happyjob.study.lmg.model.Test;
import kr.happyjob.study.lmg.model.TestInfo;
import kr.happyjob.study.lmg.model.TestInfoSumClass;
import kr.happyjob.study.lmg.service.LmgExamAService;

/**
/**

  * @FileName : LmgExamController.java

  * @Project : lmselv

  * @Date : 2021. 11. 11. 

  * @작성자 : 윤효열

  * @변경이력 :

  * @프로그램 설명 : 관리자가 접근 가능한 시험관련 페이지 controller

  */
@Controller
@RequestMapping("/lmg/")
public class LmgExamAController {
	
	@Autowired
	LmgExamAService service;
	
	/**
	
	  * @Method Name : examMgt
	
	  * @작성일 : 2021. 11. 11.
	
	  * @작성자 : 윤효열
	
	  * @변경이력 : 
	
	  * @Method 설명 : 관리자 - 학습관리 - 시험문제관리 페이지 (관리자용)
	
	  * @return
	
	  */
	@RequestMapping("examMgt.do")
	public String examMgt(Model model, @RequestParam(value ="searchWord", required=false) String searchWord, @RequestParam(value ="pageNo", required=false) String tmp ) {
		// 현재 페이지 설정
		int pageNo = (tmp == null) ? 1 : Integer.parseInt(tmp);
		
		try {
			// 현재 진행중인 강의 목록 가져오기(시험 등록 위해) + 페이징
			Map<String, Object> result = service.getLectureList(searchWord, pageNo); 
			
			// 강의 목록
			List<ClassInfo> lst = (List<ClassInfo>) result.get("lst"); 
			PagingInfo pi = (PagingInfo) result.get("pi"); // 페이징 객체
			
			// 검색 결과가 없을떄 처리
			if(lst.size() == 0) {
				String message = "검색결과가 없습니다!";
				model.addAttribute("result", message);
			}
			
			model.addAttribute("lecture", lst);
			model.addAttribute("pi", pi);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return "lmg/examMgt";
	}
	
	/**
	
	  * @Method Name : getTestList
	
	  * @작성일 : 2021. 11. 12.
	
	  * @작성자 : user
	
	  * @변경이력 : 
	
	  * @Method 설명 : 학습관리 - 시험문제관리에서 과정명 클릭했을떄 과정에 대한 시험 리스트 출력하는 AJAX
	
	  * @param l_no
	
	  */
	@RequestMapping(value="getTestList", method= RequestMethod.POST)
	public void getTestList(@RequestParam Map<String, Object> paramMap, Model model) {
		// 현재 페이지 설정
		String tmp = (String) paramMap.get("pageNo");
		int pageNo = (tmp == null) ? 1 : Integer.parseInt(tmp);
		
		paramMap.remove("pageNo");
		paramMap.put("pageNo", pageNo);
		try {
			// 과정에 대한 시험 info 조회 + 페이징
			Map<String, Object> map = service.getTestList(paramMap);
			
			// 과정에 대한 시험 info
			List<TestInfo> lst = (List<TestInfo>) map.get("lst");
			// 페이징 객체
			PagingInfo pi = (PagingInfo) map.get("pi");
			
			model.addAttribute("testLst", lst);
			model.addAttribute("testPi", pi);
			model.addAttribute("result", lst.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value="testInfoDel.do", method = RequestMethod.GET)
	public String testInfoDel(@RequestParam Map<String, Object> paramMap ) {
		System.out.println(paramMap.get("test_no"));
		try {
			int i = service.testInfoDel(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/lmg/examMgt.do?pageNo=1&searchWord=";
	}
	
	/**
	
	  * @Method Name : addTestFir
	
	  * @작성일 : 2021. 11. 12.
	
	  * @작성자 :윤효열
	
	  * @변경이력 : 
	
	  * @Method 설명 : 시험 정보 등록 ajax
	
	  * @param info
	
	  */
	@RequestMapping(value="addTestFir", method=RequestMethod.POST)
	public ResponseEntity<String> addTestFir(TestInfo info) {
		try {
			// 시험 정보 등록하는 ajax
			int i = service.addTestFir(info); 
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("faile", HttpStatus.BAD_REQUEST);
		}
	}
	
	/**
	
	  * @Method Name : problemAdd
	
	  * @작성일 : 2021. 11. 15.
	
	  * @작성자 : 윤효열
	
	  * @변경이력 : 
	
	  * @Method 설명 :  시험 문제 등록하는 ajax
	
	  * @param paramMap
	
	  */
	@RequestMapping(value="problemAdd", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> problemAdd(@RequestParam Map<String, Object> paramMap ) {
		try {
			// 시험 문제 등록하는 ajax
			int i = service.problemAdd(paramMap);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
	}
	
	/**
	
	  * @Method Name : getProblemList
	
	  * @작성일 : 2021. 11. 15.
	
	  * @작성자 : 윤효열
	
	  * @변경이력 : 
	
	  * @Method 설명 : 시험문제 등록 모달에서 문제 list 출력하는 ajax
	
	  * @param paramMap
	  * @param model
	
	  */
	@RequestMapping(value="getProblemList", method=RequestMethod.POST)
	public void getProblemList(@RequestParam Map<String, Object> paramMap, Model model) {
		try {
			// 시험 문제 리스트 조회 ajax
			List<Test> lst = service.getProblemList(paramMap);
			model.addAttribute("lst", lst);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	
	  * @Method Name : problemDetail
	
	  * @작성일 : 2021. 11. 15.
	
	  * @작성자 : 윤효열
	
	  * @변경이력 : 
	
	  * @Method 설명 : 시험문제등록 모달에서 문제를 클릭했을떄 정보 가져오기 ajax(수정을 위함)
	
	  * @param paramMap
	
	  */
	@RequestMapping(value="problemDetail", method = RequestMethod.POST)
	public void problemDetail(@RequestParam Map<String, Object> paramMap, HttpServletResponse resp) {
		try {
			// 시험 문제에 대한 상세정보 조회 ajax
			Test test = service.probelmDetail(paramMap);
			
			// json 처리
			JSONObject json = new JSONObject();
			json.put("q_no", test.getQ_no());
			json.put("t_que", test.getT_que());
			json.put("t_ans", test.getT_ans());
			json.put("t_ex1", test.getT_ex1());
			json.put("t_ex2", test.getT_ex2());
			json.put("t_ex3", test.getT_ex3());
			json.put("t_ex4", test.getT_ex4());
			json.put("test_no", test.getTest_no());
			
			resp.setContentType("application/json");
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().print(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	
	  * @Method Name : deleteProblem
	
	  * @작성일 : 2021. 11. 15.
	
	  * @작성자 : 윤효열
	
	  * @변경이력 : 
	
	  * @Method 설명 : 시험 문제하나를 삭제하는 ajax
	
	  * @param paramMap
	
	  */
	@RequestMapping(value="deleteProblem", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteProblem(@RequestParam Map<String, Object> paramMap) {
		try {
			// 시험 문제 삭제 ajax
			int i = service.deleteProblem(paramMap);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
	}
	
	/**
	
	  * @Method Name : updateProblem
	
	  * @작성일 : 2021. 11. 15.
	
	  * @작성자 : 윤효열
	
	  * @변경이력 : 
	
	  * @Method 설명 : 시험문제 수정하는 ajax
	
	  * @param paramMap
	  * @return
	
	  */
	@RequestMapping(value="updateProblem", method=RequestMethod.POST)
	public ResponseEntity<String> updateProblem(@RequestParam Map<String, Object> paramMap) {
		try {
			// 시험문제 수정하는 ajax
			int i = service.updateProblem(paramMap);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
	}
	
	/**
	
	  * @Method Name : exsubjectMgt
	
	  * @작성일 : 2021. 11. 15.
	
	  * @작성자 : user
	
	  * @변경이력 : 
	
	  * @Method 설명 : 학습관리 - 시험대상자관리 페이지 (관리자)
	
	  * @param model
	  * @param searchWord
	  * @param tmp
	
	  */
	@RequestMapping("exsubjectMgt.do")
	public void exsubjectMgt(Model model, @RequestParam Map<String, Object> paramMap) {
		// 현재 페이지 설정
		String tmp = (String) paramMap.get("pageNo");
		int pageNo = (tmp == null) ? 1 : Integer.parseInt(tmp);
		
		try {
			// 시험 대상자 확인을 위한 강의에 대한 시험정보 + 페이징
			Map<String, Object> result = service.getExsubjectMgt(pageNo, paramMap);
			List<TestInfoSumClass> lst = (List<TestInfoSumClass>) result.get("lst");
			List<Integer> nonTaker = (List<Integer>) result.get("nonTaker");
			PagingInfo pi = (PagingInfo) result.get("pi");
			List<Integer> taker = (List<Integer>) result.get("taker");
			
			model.addAttribute("lst",lst);
			model.addAttribute("pi",pi);
			model.addAttribute("nonTaker", nonTaker);
			model.addAttribute("taker", taker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	
	  * @Method Name : testInfoSelect
	
	  * @작성일 : 2021. 11. 18.
	
	  * @작성자 : 윤효열
	
	  * @변경이력 : 
	
	  * @Method 설명 : 시험 대상자 관리(학생아이디, 점수, 상태, 미응시자, 응시자 구분 ajax)
	
	  * @param model
	  * @param paramMap
	
	  */
	@RequestMapping(value = "testInfoSelect", method=RequestMethod.POST)
	public void testInfoSelect(Model model, @RequestParam Map<String, Object> paramMap) {
		try {
			// 응시, 미응시자들의 정보 가져오기
			Map<String, Object> map = service.testInfoSelect(paramMap);
			List<InquireExam> takers = (List<InquireExam>) map.get("takers");
			List<String> status = (List<String>) map.get("status");
			List<String> nonTakers = (List<String>) map.get("nonTakers");
			
			model.addAttribute("takers", takers);
			model.addAttribute("status", status);
			model.addAttribute("nonTakers", nonTakers);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="testUpdate", method = RequestMethod.POST)
	public void testUpdate(@RequestParam Map<String, Object> paramMap, HttpServletResponse resp) {
		// 수정하기 위한 testinfo 가져오기
		try {
			TestInfo test = service.getTestOne(paramMap);
			JSONObject json = new JSONObject();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			json.put("name", test.getTest_name());
			json.put("start", sdf.format(test.getTest_start()));
			json.put("end", sdf.format(test.getTest_end()));
			resp.setContentType("application/json");
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().print(json);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// testinfo 수정 작업
	@RequestMapping(value="updateTestInfo", method = RequestMethod.POST)
	public ResponseEntity<String> updateTestInfo(@RequestParam Map<String, Object> paramMap) {
		try {
			int i = service.updateTestInfo(paramMap);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
	}
}
