package kr.happyjob.study.cmg.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.cmg.model.CommodityModel;
import kr.happyjob.study.cmg.model.ItemListDTL;

public interface CommodityDao {

   /** 목록 조회 */
   //gouppcodelist 가 쿼리문 ID가 됌.
   
	public List<CommodityModel> commodityList(Map<String, Object> paramMap) throws Exception;
   
   /** 그룹코드 목록 카운트 조회 */
   public int commodityCnt(Map<String, Object> paramMap)throws Exception;

   //신규등록 저장
   public int insertCommodity(Map<String, Object> paramMap)throws Exception;
   
   //신규수정
   public int updateCommodity(Map<String, Object> paramMap)throws Exception;
   
   //강의실 상세보기
   public CommodityModel commodityDetail(Map<String, Object> paramMap)throws Exception;
   
   //강의실삭제
   public int deleteCommodity(Map<String, Object> paramMap)throws Exception;
   
   //장비조회
   public List<ItemListDTL> itemList(Map<String, Object> paramMap) throws Exception;
   
   //장비 카운트
   public int itemListCount(Map<String, Object> paramMap) throws Exception;
   
   //장비 단건 조회
   public ItemListDTL selectItem(Map<String, Object> paramMap) throws Exception;
   
   //장비 저장
   public int insertItemList(Map<String, Object> paramMap) throws Exception;
   
   //장비 수정
   public int updateItemList(Map<String, Object> paramMap) throws Exception;
   
   //장비 삭제
   public int itemDelete(Map<String, Object> paramMap) throws Exception;
   
}