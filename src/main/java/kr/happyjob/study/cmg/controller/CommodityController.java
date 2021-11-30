package kr.happyjob.study.cmg.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.cmg.model.CommodityModel;
import kr.happyjob.study.cmg.model.ItemListDTL;
import kr.happyjob.study.cmg.service.CommodityService;

@Controller
@RequestMapping("/cmg/")
public class CommodityController {

	@Autowired
	CommodityService commodityService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	/**
	 * 강의실관리 초기화면
	 */
	@RequestMapping("lectureroomMgt.do")
	public String commodity(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".initComnCod");
		logger.info("   - paramMap : " + paramMap);
		
		String loginID = (String) session.getAttribute("loginId");
		paramMap.put("loginID", loginID);
		System.out.println(loginID);

		return "cmg/commodity";
	}

	/**
	 * 강의실 목록조회
	 */
	@RequestMapping("commodityList.do")
	public String commodityList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".commodityList");
		logger.info("   - paramMap : " + paramMap);
		
		int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); // 현재
																					// 페이지
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); // 페이지
																					// 사이즈
		int pageIndex = (currentPage - 1) * pageSize; // 페이지 시작 row 번호

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		

		// 강의실 목록조회
		List<CommodityModel> commodityList = commodityService.commodityList(paramMap);
		model.addAttribute("commodity", commodityList);

		// 목록 수 추출해서 보내기
		int commodityCnt = commodityService.commodityCnt(paramMap);

		model.addAttribute("commodityCnt", commodityCnt);
		model.addAttribute("commoditycurrentPage", currentPage);
		model.addAttribute("pageSize", pageSize);

		logger.info("+ End " + className + ".commodityList");

		return "cmg/commodityList";
	}
	
		// 강의실보기 상세 조회
		@RequestMapping("detailCommodityNo.do")
		@ResponseBody
		public Map<String,Object> detailCommodity(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
			
			//System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
			  logger.info("+ Start " + className + ".detailCommodity");
			  logger.info("   - paramMap : " + paramMap);
			  
			String result="";
			
			// 선택된 게시판 1건 조회 
			CommodityModel detailCommodity = commodityService.commodityDetail(paramMap);
			
			if(detailCommodity != null) {
				result = "SUCCESS";  // 성공시 찍습니다. 
			}else {
				result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
			}
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("resultMsg", result); // success 용어 담기 
			resultMap.put("result", detailCommodity); // 리턴 값 해쉬에 담기 
			System.out.println(detailCommodity);
			
			logger.info("+ End " + className + ".detailCommodity");
		    
		    return resultMap;
		}
	
		// 강의실 신규등록, 업데이트
		@RequestMapping("commoditySave.do")
		@ResponseBody
		public Map<String, Object> commoditySave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".commoditySave");
			logger.info("   - paramMap : " + paramMap);
			
			String action = (String)paramMap.get("action");
			String resultMsg = "";
			
			// 사용자 정보 설정
			paramMap.put("loginID", session.getAttribute("loginId"));
			if ("I".equals(action)) {
				// 그룹코드 신규 저장
				commodityService.insertCommodity(paramMap);
				resultMsg = "SUCCESS";
			} else if("U".equals(action)) {
				// 그룹코드 수정 저장
				commodityService.updateCommodity(paramMap);
				resultMsg = "UPDATED";
				System.out.println(paramMap);
			} else {
				resultMsg = "FALSE : 등록에 실패하였습니다.";
			}
			
			//결과 값 전송
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("resultMsg", resultMsg);
		    
		    return resultMap;
		}
		
		//  강의실 삭제
		@RequestMapping("commodityDelete.do")
		@ResponseBody
		public Map<String, Object> commodityDelete(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".commodityDelete");
			logger.info("   - paramMap : " + paramMap);

			String result = "SUCCESS";
			String resultMsg = "DELETED";
			
			// 그룹코드 삭제
			commodityService.deleteCommodity(paramMap);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("result", result);
			resultMap.put("resultMsg", resultMsg);
			
			logger.info("+ End " + className + ".commodityDelete");
			
			return resultMap;
		}
		
		
		/*    강의실에 있는 장비 상세정보       */
		/* 장비목록 */
		@RequestMapping("itemList.do")
		public String itemList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception{
			
			logger.info("start" + className + ".itemList");
			logger.info("paramMap" + paramMap);
			
			int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
			int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
			int pageIndex = (currentPage-1)*pageSize;
			
			paramMap.put("pageIndex", pageIndex);
			paramMap.put("pageSize", pageSize);
			
			//장비 상세목록조회
			List<ItemListDTL> itemListDtl = commodityService.itemList(paramMap);
			int itemListCount = commodityService.itemListCount(paramMap);

			model.addAttribute("itemListCount", itemListCount);
			model.addAttribute("itemListDtl", itemListDtl);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPageItem", currentPage);
			
			logger.info("end" + className + ".itemList");
			
			return "/cmg/itemList";
		}
		
		// 장비 단건조회
		@RequestMapping("selectItem.do")
		@ResponseBody
		public Map<String, Object> selectItem(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception{
			
			logger.info("start" + className + ".selectItem");
			logger.info("paramMap" + paramMap);
			
			String result = "SUCCESS";
			String resultMsg = "장비를 조회했습니다.";
			
			// 장비 단건조회
			ItemListDTL itemListDtl = commodityService.selectItem(paramMap);
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("result", result);
			resultMap.put("resultMsg", resultMsg);
			resultMap.put("itemListDtl", itemListDtl);
			
			logger.info("end" + className + ".selectItem");
			
			return resultMap;
		}
		
		// 장비 저장
		@RequestMapping("itemSave.do")
		@ResponseBody
		public Map<String, Object> itemSave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception{
			
			logger.info("start" + className + ".itemSave");
			logger.info("paramMap" + paramMap);
			
			String action = (String)paramMap.get("action");
			String result = "SUCCESS";
			String resultMsg = "장비를 저장했습니다.";
			
			//사용자 정보 설정
			paramMap.put("loginID", session.getAttribute("loginId"));
			
			if("I".equals(action)){
				commodityService.insertItemList(paramMap);
			} else if("U".equals(action)){
				commodityService.updateItemList(paramMap);
			} else{
				result = "FALSE";
				resultMsg = "장비 저장을 실패 했습니다.";
			}
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("result", result);
			resultMap.put("resultMsg", resultMsg);
			
			logger.info("end" + className + ".itemSave");
			
			return resultMap;
		}
		
		// 장비 삭제
		@RequestMapping("itemDelete.do")
		@ResponseBody
		public Map<String, Object> itemDelete(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception{
			
			logger.info("start" + className + ".itemDelete");
			logger.info("paramMap" + paramMap);
			
			String result = "SUCCESS";
			String resultMsg = "삭제되었습니다.";
			
			// 장비삭제
			commodityService.itemDelete(paramMap);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("result", result);
			resultMap.put("resultMsg", resultMsg);
			
			logger.info("end" + className + ".itemDelete");
			
			return resultMap;
		}
}