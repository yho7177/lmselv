package kr.happyjob.study.lmg.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.lmg.dao.QnaDao;
import kr.happyjob.study.lmg.model.ListQnaCodModel;
import kr.happyjob.study.lmg.model.QnaCttModel;
import kr.happyjob.study.lmg.model.QnaModel;

@Service
public class QnaServiceImpl implements QnaService{
	// Set logger
		private final Logger logger = LogManager.getLogger(this.getClass());
		
		// Get class name for logger
		private final String className = this.getClass().toString();
	
	@Autowired
	QnaDao qnaDao;
	
	public List<ListQnaCodModel> listQnaCod(Map<String, Object>paramMap) throws Exception{
		
		List<ListQnaCodModel> listQnaCod = qnaDao.listQnaCod(paramMap);
		
		return listQnaCod;
	}
	
	
	
	public QnaCttModel selectQnaCttCod(Map<String, Object> paramMap) throws Exception{
		
		QnaCttModel qnaCttModel = qnaDao.selectQnaCttCod(paramMap);
		
		return qnaCttModel;
	};
	
	public int countListQnaCod(Map<String, Object>paramMap) throws Exception{
		
		int totalCount = qnaDao.countListQnaCod(paramMap);
		
		return totalCount;
	}
	
	public int insertQnaCttCod(Map<String, Object> paramMap) throws Exception{
		
		int ret = qnaDao.insertQnaCttCod(paramMap);
		
		return ret;
	}
	
	public int updateQnaCttCod(Map<String, Object> paramMap) throws Exception{
		
		int ret = qnaDao.updateQnaCttCod(paramMap);
		
		return ret;
	}
	
}
