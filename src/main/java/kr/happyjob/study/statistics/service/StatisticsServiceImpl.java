package kr.happyjob.study.statistics.service;

import java.sql.Date;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.lmg.model.ClassInfo;
import kr.happyjob.study.lmg.model.PagingInfo;
import kr.happyjob.study.lmg.model.StuNumChart;
import kr.happyjob.study.statistics.dao.StatisticsDAO;
import kr.happyjob.study.statistics.model.ExamStatistics;

@Service
public class StatisticsServiceImpl implements StatisticsService {
	@Autowired
	private StatisticsDAO dao;

	@Override
	public List<ExamStatistics> getExamStatistics(Map<String, Object> paramMap) throws Exception {
		return dao.getExamStatistics(paramMap);
	}

	@Override
	public int getExamStatisticsCnt() throws Exception {
		return dao.getExamStatisticsCnt();
	}

	@Override
	public Integer getStuCnt(int ci_no) throws Exception {
		return dao.getStuCnt(ci_no);
	}

	@Override
	public List<ExamStatistics> getExamChart(Map<String, Object> paramMap) throws Exception {
		return dao.getExamChart(paramMap);
	}

	@Override
	public Map<String, Object> getStudentNumForClass(Map<String, Object> paramMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		PagingInfo pi = pagingProcess(paramMap);
		map.put("searchStart", paramMap.get("searchStart"));
		map.put("searchEnd", paramMap.get("searchEnd"));
		map.put("startNum", pi.getStartNum());
		map.put("postPerPage", pi.getPostPerPage());
		List<ClassInfo> lst = dao.getClassInfo(map);
		
		List<Integer> cnt = new ArrayList<Integer>();
		
		List<StuNumChart> date = dao.getDateGroup(paramMap);
		for(ClassInfo c : lst) {
			cnt.add(dao.getClassStudentNum(c.getCi_no()));
		}
		map.put("lst", lst);
		map.put("cnt", cnt);
		map.put("date", date);
		map.put("pi", pi);
		
		 
		return map;
	}
	
	private PagingInfo pagingProcess(Map<String, Object> map) throws Exception {
		PagingInfo pi = new PagingInfo();
		int pageNo = (Integer) map.get("pageNo");
		System.out.println("pageNo : " + pageNo);
		pi.setStartNum(pageNo);
		int total = dao.getClassInfoCnt(map);

		pi.setTotalPage(total);
		pi.setCurrentPagingBlock(pageNo);

		pi.setStartPageNoOfBlock(pi.getCurrentPagingBlock());
		pi.setEndPageNoOfBlock(pi.getStartPageNoOfBlock());
		pi.setTotalPagingBlockCnt(pi.getTotalPage());
		return pi;
	}

	
}
