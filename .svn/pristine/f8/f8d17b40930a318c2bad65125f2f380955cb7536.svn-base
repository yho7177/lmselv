package kr.happyjob.study.lmg.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.lmg.dao.SurveyDAO;
import kr.happyjob.study.lmg.model.SurveyModel;

@Service
public class SurveyServiceImpl  implements SurveyService{

	@Autowired
	SurveyDAO surveyDAO;
	
	/* 관리자 수강 목록 조회 */
	@Override
	public List<SurveyModel> listSurveyMgt(Map<String, Object> paramMap) throws Exception{
		
		List<SurveyModel> listLmgSurveyMgt = surveyDAO.listLmgSurveyMgt(paramMap);
		
		return listLmgSurveyMgt;
	}
	
	/* 관리자 수강 목록 카운트 조회 */
	@Override
	public int countListSurveyMgt(Map<String, Object> paramMap) throws Exception{
		
		int totalCount = surveyDAO.countListLmgSurveyMgt(paramMap);
		
		return totalCount;
		
	}
	
	/* 강사 수강 목록 조회 */
	@Override
	public List<SurveyModel> listSurveyResult(Map<String, Object> paramMap) throws Exception{
		
		List<SurveyModel> listLmgSurveyResult = surveyDAO.listLmgSurveyResult(paramMap);
		
		return listLmgSurveyResult;
	}
	
	/* 강사 수강 목록 카운트 조회 */
	@Override
	public int countListSurveyResult(Map<String, Object> paramMap) throws Exception{
		
		int totalCount = surveyDAO.countListLmgSurveyResult(paramMap);
		
		return totalCount;
		
	}
	
	/* 학생 수강 목록 조회 */
	@Override
	public List<SurveyModel> listSurvey(Map<String, Object> paramMap) throws Exception{
		
		List<SurveyModel> listLmgSurvey = surveyDAO.listLmgSurvey(paramMap);
		
		return listLmgSurvey;
	}
	
	/* 학생 수강 목록 카운트 조회 */
	@Override
	public int countListSurvey(Map<String, Object> paramMap) throws Exception{
		
		int totalCount = surveyDAO.countListLmgSurvey(paramMap);
		
		return totalCount;
	}
	
	/* 학생 목록 조회 */
	@Override
	public List<SurveyModel> listSurveyUser(Map<String, Object> paramMap) throws Exception{
		
		List<SurveyModel> listLmgSurveyUser = surveyDAO.listLmgSurveyUser(paramMap);
		
		return listLmgSurveyUser;
	}
	
	/* 학생 목록 카운트 조회 */
	@Override
	public int countListSurveyUser(Map<String, Object> paramMap) throws Exception{
		
		int totalCount = surveyDAO.countListLmgSurveyUser(paramMap);
		
		return totalCount;
	}
	
	/* 설문조사 모달 불러오기 */
	public List<SurveyModel> svyQList(Map<String, Object> paramMap) throws Exception{
		
		List<SurveyModel> surveyQList = surveyDAO.surveyQList(paramMap);
		
		return surveyQList;
	}
	
	/* 설문조사 카운트 조회 */
	public int countSvyQList(Map<String, Object> paramMap) throws Exception{
		
		int totalCount = surveyDAO.countSurvyQList(paramMap);
		
		return totalCount;
	}
	
	/* 설문 라디오버튼 값 DB insert */
	public void srvyQueSub(Map<String, Object> paramMap) throws Exception{
		List<String> answerList = new ArrayList<String>();
		
		int surveycnt = Integer.parseInt((String) paramMap.get("surveycnt"));
		
		for(int i = 1; i <= surveycnt; i++){
			answerList.add((String) paramMap.get("answer" + i));
			paramMap.put("item", (String) paramMap.get("answer"+i));
			paramMap.put("svy_no",i );
			int result = surveyDAO.srvyQueSub(paramMap);
			
			if (paramMap.get("srvy_end") == null){
				if("1".equals((String)paramMap.get("answer"+i))){
					int t =  Integer.parseInt("1");
					paramMap.put("svy_ex1", t);
				}else{
					int f = Integer.parseInt("0");
					paramMap.put("svy_ex1", f);
				}
				if("2".equals((String)paramMap.get("answer"+i))){
					int t =  Integer.parseInt("1");
					paramMap.put("svy_ex2", t);
				}else{
					int f = Integer.parseInt("0");
					paramMap.put("svy_ex2", f);
				}
				if("3".equals((String)paramMap.get("answer"+i))){
					int t =  Integer.parseInt("1");
					paramMap.put("svy_ex3", t);
				}else{
					int f = Integer.parseInt("0");
					paramMap.put("svy_ex3", f);
				}
				if("4".equals((String)paramMap.get("answer"+i))){
					int t =  Integer.parseInt("1");
					paramMap.put("svy_ex4", t);
				}else{
					int f = Integer.parseInt("0");
					paramMap.put("svy_ex4", f);
				}
				if("5".equals((String)paramMap.get("answer"+i))){
					int t =  Integer.parseInt("1");
					paramMap.put("svy_ex5", t);
				}else{
					int f = Integer.parseInt("0");
					paramMap.put("svy_ex5", f);
				}
			}
		}
	}
	
	/* 설문 상태 업데이트 */
	public void svyYN(Map<String, Object> paramMap) throws Exception{
		surveyDAO.svyYN(paramMap);
	}
	
	/* 설문조가 값 불러오기 */
	@Override
	public List<SurveyModel> surveyAList(Map<String, Object> paramMap) throws Exception{
		
		return surveyDAO.surveyAList(paramMap);
	}
}
