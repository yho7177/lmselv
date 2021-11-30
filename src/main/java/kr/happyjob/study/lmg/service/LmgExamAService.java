package kr.happyjob.study.lmg.service;

import java.util.List;
import java.util.Map;


import kr.happyjob.study.lmg.model.Test;
import kr.happyjob.study.lmg.model.TestInfo;

/**
/**

  * @FileName : LmgExamService.java

  * @Project : lmselv

  * @Date : 2021. 11. 11. 

  * @작성자 : 윤효열

  * @변경이력 :

  * @프로그램 설명 : LmgExamService 인터페이스

  */
public interface LmgExamAService {

	Map<String, Object> getLectureList(String searchWord, int pageNo) throws Exception; // 현재 진행중인 강의 목록 가져오기(시험 등록 위해)

	Map<String, Object> getTestList(Map<String, Object> paramMap) throws Exception; // 학습관리 - 시험문제관리에서 과정명 클릭했을떄 과정에 대한 시험 리스트 ajax

	int addTestFir(TestInfo info) throws Exception; // 시험 정보 등록하는 ajax

	int problemAdd(Map<String, Object> paramMap) throws Exception; // 시험 문제 등록하는 ajax

	List<Test> getProblemList(Map<String, Object> paramMap) throws Exception; // 시험 문제 리스트 조회 ajax

	Test probelmDetail(Map<String, Object> paramMap) throws Exception; // 시험 문제에 대한 상세정보 조회 ajax

	int deleteProblem(Map<String, Object> paramMap) throws Exception; // 시험 문제 삭제 ajax

	int updateProblem(Map<String, Object> paramMap) throws Exception; // 시험문제 수정하는 ajax

	Map<String, Object> getExsubjectMgt(int pageNo, Map<String, Object> paramMap) throws Exception; // 시험 대상자 확인을 위한 강의에 대한 시험정보 + 페이징

	Map<String, Object> testInfoSelect(Map<String, Object> paramMap) throws Exception;

	int testInfoDel(Map<String, Object> paramMap) throws Exception;
	
	TestInfo getTestOne(Map<String, Object> paramMap) throws Exception; // 시험 정보 수정하기 위한 정보 가져오기

	int updateTestInfo(Map<String, Object> paramMap) throws Exception;



}
