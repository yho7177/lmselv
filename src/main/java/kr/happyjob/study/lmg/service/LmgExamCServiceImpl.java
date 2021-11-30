package kr.happyjob.study.lmg.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.lmg.dao.LmgExamCDAO;
import kr.happyjob.study.lmg.model.InquireExam;
import kr.happyjob.study.lmg.model.PagingInfo;
import kr.happyjob.study.lmg.model.Test;
import kr.happyjob.study.lmg.model.TestInfoSumClass;

@Service
public class LmgExamCServiceImpl implements LmgExamCService {
	@Autowired
	LmgExamCDAO dao;
	
	@Override
	public Map<String, Object> getExam(String loginId, int pageNo) throws Exception {
		PagingInfo pi = pagingProcess(pageNo, loginId);
		Map<String, Object> paramMap1 = new HashMap<String, Object>();
		paramMap1.put("startNum", pi.getStartNum());
		paramMap1.put("PageCntPerBlock", pi.getPostPerPage());
		paramMap1.put("loginId", loginId);
		List<TestInfoSumClass> lst = dao.getExam(paramMap1);
		List<String> compare = new ArrayList<String>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("loginId", loginId);
		for(TestInfoSumClass t : lst) {
			int test_no = t.getTest_no();
			paramMap.put("test_no", test_no);
			int i = dao.getCompareResult(paramMap);
			System.out.println(i);
			if(i > 0) {
				compare.add("yes");
			} else if ( i < 1) {
				compare.add("no");
			}
			paramMap.remove("test_no");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("lst", lst);
		map.put("compare", compare);
		map.put("pi", pi);
		return map;
	}

	private PagingInfo pagingProcess(int pageNo, String loginId) throws Exception {
		PagingInfo pi = new PagingInfo();
		pi.setStartNum(pageNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginId", loginId);
		int total = dao.getTotCntExamByUser(map);
		
		pi.setTotalPage(total); 
		pi.setCurrentPagingBlock(pageNo);

		pi.setStartPageNoOfBlock(pi.getCurrentPagingBlock());
		pi.setEndPageNoOfBlock(pi.getStartPageNoOfBlock());
		pi.setTotalPagingBlockCnt(pi.getTotalPage());
		return pi;
	}
	// 시험 info 
	@Override
	public List<Test> getExamInfo(Map<String, Object> paramMap) throws Exception {
		return dao.getExamInfo(paramMap);
	}
	
	// exam 결과 채점
	@Override
	public int submitExam(Map<String, Object> paramMap) throws Exception {
		int totalResult = 0;
		
		List<Test> lst = dao.getExamInfo(paramMap);
		int i = 1;
		for(Test t : lst) {
			if(t.getT_ans() == Integer.parseInt((String) paramMap.get("answer_" + i)) ) {
				paramMap.put("tj_score", 20);
				totalResult += 20;
			} else {
				paramMap.put("tj_score", 0);
			}
			
			paramMap.put("tj_ans", paramMap.get("answer_" + i));
			paramMap.put("q_no", paramMap.get("q_no_" + i));
			
			int j = dao.submitExam(paramMap);
			
			
			paramMap.remove("tj_score");
			paramMap.remove("tj_ans");
			paramMap.remove("tj_q_no");
			i++;
		}
		
		return totalResult;
	}

	@Override
	public Map<String, Object> inquireExam(Map<String, Object> paramMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<InquireExam> lst = dao.inquireExam(paramMap);
		// 총점수 계산
		int totalResult = totalResult(lst);
		// 상태(과락, 통과 -- 기준 : 60)
		String status = checkStatus(totalResult);
		
		map.put("totalResult", totalResult);
		map.put("status", status);
		map.put("lst", lst);
		return map;
	}
	
	// 총 점수 계산
	private int totalResult(List<InquireExam> lst) {
		int result = 0;
		for(InquireExam i : lst) {
			result += i.getTj_score();
		}
		return result;
	}

	// 상태(과락, 통과 -- 기준 : 60)
		private String checkStatus(int totalResult) {
			String result = "";
			if(totalResult >= 60) {
				result = "y";
			} else if(totalResult < 60) {
				result = "n";
			}
			return result;
		}
}
