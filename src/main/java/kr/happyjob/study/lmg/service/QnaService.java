package kr.happyjob.study.lmg.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.lmg.model.ListQnaCodModel;
import kr.happyjob.study.lmg.model.QnaCttModel;
import kr.happyjob.study.lmg.model.QnaModel;

public interface QnaService {

	public List<ListQnaCodModel>listQnaCod(Map<String, Object>paramMap) throws Exception;
	
	
	public int countListQnaCod(Map<String, Object>paramMap) throws Exception;

	public QnaCttModel selectQnaCttCod(Map<String, Object> paramMap) throws Exception;
	
	public int insertQnaCttCod(Map<String, Object> paramMap) throws Exception;
	
	public int updateQnaCttCod(Map<String, Object> paramMap) throws Exception;
	
}
