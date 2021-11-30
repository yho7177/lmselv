package kr.happyjob.study.common.comnUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.happyjob.study.system.model.ComnCodUtilModel;
import kr.happyjob.study.system.service.ComnCodService;

@Component
public class ComnCodUtil {

	private static List<ComnCodUtilModel> listComnCod;


	@Autowired
	ComnCodService comnCodService;

	/* 시작전 공통 코드 조회 */
	/*
		Servlet 생성 -> Init -> service, doGet(), doPost() -> destory().
		Servlet 생성 후 Init전에 객체를 생성함.
		시작 후 리스트 전체를 불러옴.
	 */
	@PostConstruct
	public void initCodes() throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		listComnCod = comnCodService.listAllComnCode(paramMap);
	}

	
	/**
	 * 공통코드 조회
	 */
	public static List<ComnCodUtilModel> getComnCod(String grp_cod) {

		List<ComnCodUtilModel> resultList = new ArrayList<ComnCodUtilModel>();

		if (listComnCod != null) {

			for (ComnCodUtilModel comnCodUtilModel : listComnCod) {
				if (comnCodUtilModel.getGrp_cod().equals(grp_cod)) {
					resultList.add(comnCodUtilModel);
				}
			}
		}

		return resultList;
	}

	/**
	 * 공통코드 조회 value : 제외처리
	 */
	public static List<ComnCodUtilModel> getComnCod(String grp_cod, String value) {

		List<ComnCodUtilModel> resultList = new ArrayList<ComnCodUtilModel>();

		if (listComnCod != null) {

			for (ComnCodUtilModel comnCodUtilModel : listComnCod) {
				if (comnCodUtilModel.getGrp_cod().equals(grp_cod)) {
					if (!comnCodUtilModel.getDtl_cod().equals(value))
						resultList.add(comnCodUtilModel);
				}
			}
		}

		return resultList;
	}

}
