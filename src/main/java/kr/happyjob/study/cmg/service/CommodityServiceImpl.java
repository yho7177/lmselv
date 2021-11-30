package kr.happyjob.study.cmg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.cmg.dao.CommodityDao;
import kr.happyjob.study.cmg.model.CommodityModel;
import kr.happyjob.study.cmg.model.ItemListDTL;
import kr.happyjob.study.system.model.NoticeModel;

@Service
public class CommodityServiceImpl implements CommodityService {

	@Autowired
	CommodityDao commodityDao;

	
	//강의실조회
	@Override
	public List<CommodityModel> commodityList(Map<String, Object> paramMap) throws Exception{

		List<CommodityModel> commodityList = commodityDao.commodityList(paramMap);
		return commodityList;
	}
	
	//강의실카운트
	@Override
	public int commodityCnt(Map<String, Object> paramMap) throws Exception {
		int commodityCnt = commodityDao.commodityCnt(paramMap);
		
		return commodityCnt;
	}
	
	//강의실 신규등록
	@Override
	public int insertCommodity(Map<String, Object> paramMap) throws Exception {
		
		int statusChange = commodityDao.insertCommodity(paramMap);
		
		return statusChange;
		
	}
	//강의실 신규수정
	@Override
	public int updateCommodity(Map<String, Object> paramMap) throws Exception {
		
		int statusChange = commodityDao.updateCommodity(paramMap);
		return statusChange;
		
		
	}
	//강의실 상세보기
	@Override
	public CommodityModel commodityDetail(Map<String, Object> paramMap) throws Exception {
		
		CommodityModel commodityModel = commodityDao.commodityDetail(paramMap);
		return commodityModel;
	}
	
	//강의실 삭제
	@Override
	public int deleteCommodity(Map<String, Object> paramMap) throws Exception {
		int statusChange = commodityDao.deleteCommodity(paramMap);
		return statusChange;
	}
	
	//장비조회
	@Override
	public List<ItemListDTL> itemList(Map<String, Object> paramMap) throws Exception {
		
		List<ItemListDTL> itemList = commodityDao.itemList(paramMap);
		
		return itemList;
	}
	
	//장비 카운트
	@Override
	public int itemListCount(Map<String, Object> paramMap) throws Exception {
		
		int itemListCount = commodityDao.itemListCount(paramMap);
		
		return itemListCount;
	}
	
	//장비 단건 조회
	@Override
	public ItemListDTL selectItem(Map<String, Object> paramMap) throws Exception {
		
		ItemListDTL itemListDTL = commodityDao.selectItem(paramMap);
		
		return itemListDTL;
	}

	//장비 저장
	@Override
	public int insertItemList(Map<String, Object> paramMap) throws Exception {
		
		int ret = commodityDao.insertItemList(paramMap);
		
		return ret;
	}

	//장비 수정
	@Override
	public int updateItemList(Map<String, Object> paramMap) throws Exception {
		
		int ret = commodityDao.updateItemList(paramMap);
		
		return ret;
	}

	//장비 삭제
	@Override
	public int itemDelete(Map<String, Object> paramMap) throws Exception {
		
		int ret = commodityDao.itemDelete(paramMap);
		
		return ret;
	}

}
