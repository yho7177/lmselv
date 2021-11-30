package kr.happyjob.study.board.controller;

import kr.happyjob.study.board.model.BoardVO;
import kr.happyjob.study.board.service.BoardService;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;
import java.util.function.Predicate;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/board/")
public class BoardController {

    @Autowired
    private BoardService boardService;
    
    Predicate<Object> pred;


    private final Logger logger = LogManager.getLogger(this.getClass());
    private final String className = this.getClass().toString();
    private Object BoardVO;

    //글목록페이지
    @RequestMapping (value = "/boardlist.do")
    public String boardListDo(@RequestParam Map<String, Object>paramMap, Model model, HttpServletRequest request) throws Exception{

     //
    	if(!paramMap.containsKey("viewPage"))
    		paramMap.put("viewPage", 1);
    	
    	System.out.println("viewPage: " + paramMap.get("viewPage"));
    	System.out.println("model: " + model);
    	System.out.println("paramMap: " + paramMap);


    	//총 데이터 개수
    	int total = boardService.selectNBoardTotal();
    	System.out.println("total: " + total);

    	// 12/10 
    	int totalPage = (int)Math.ceil((double)total/10);
    	System.out.println("totalPage: " + totalPage);
    	int viewPage = 1;
    	
    	if(viewPage > totalPage || viewPage < 1) {
    		viewPage = 1;
    	}

    	String s = String.valueOf(paramMap.get("viewPage"));
    	viewPage = Integer.parseInt(s);

    	

    	int startPage = (viewPage -1) * 10;
    	int endPage = (viewPage * 10);
    	
    	/*int p1 = total - 0;
    	int p2 = total - 10;
    	int p3 = total - 20;
    	int p4 = total - 30;*/
    	
    	int startRowNo = total - (viewPage-1)*10;
    	
    	
    	
    	
    	paramMap.put("startPage", startPage);
    	paramMap.put("endPage", endPage);
    	



    	System.out.println("테스트");
    	

        List<BoardVO> list = boardService.selectNBoardList(paramMap);

        model.addAttribute("rownumber", startRowNo);
        model.addAttribute("total", total);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("list", list);
  


      // BoardVO.addAttribute("resultList", list);

    	 return "board/boardlist";
       /* logger.info("start" + className + ".initComCod");
        logger.info("paramMap" + b);
        logger.info("end" + className + "initComCod");*/
        
        
        
       
       
    }
    //글 상세페이지
    @RequestMapping("boardDetail.do")
    public String viewForm(Model model, @RequestParam Map<String, Object> paramMap) throws Exception{
    	System.out.println(paramMap.get("b_no"));
        BoardVO b = boardService.getBoardDetail(paramMap);
        model.addAttribute("b", b);
        return "board/boardDetail";
    }
    //글작성페이지
    @RequestMapping("/boardRegister.do")
    public String boardRegister(BoardVO b){
    	
        return "board/boardRegister";
    }

    //글쓰기
    @RequestMapping(value="/insertBoard.do", method = RequestMethod.POST)
    public String write(@RequestParam Map<String, Object> paramMap) throws Exception {
    	
    	try {
			int i = boardService.boardRegister(paramMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "redirect:boardlist.do";
    }

    //글수정
    @RequestMapping(value="/modifyBoard.do", method = RequestMethod.POST)
    public String updateTest(@RequestParam Map<String, Object> paramMap) throws Exception {
        int i = boardService.modifyBoard(paramMap);
        return "redirect:boardlist.do";
    }
    
    @RequestMapping(value="/deleteBoard.do")
    public String deleteTest(@RequestParam Map<String, Object> paramMap) throws Exception {
    	System.out.println("!");
    	System.out.println(paramMap.get("b_no"));
        int i = boardService.deleteBoard(paramMap);
        return "redirect:boardlist.do";
    }






   /* @RequestMapping("/borderEdit.do")
    public String borderEdit(HttpServletRequest request, ModelMap model) throws Exception
    {
        String loginID="";
        String b_no="";
        //글쓰기권한 검삭도 가능.
        if (request.getSession().getAttribute("loginID") == null)
        {
            request.getSession().invalidate();
            return "redirect:/login.do";
        }
        else
        {
            loginID = request.getSession().getAttribute("loginID").toString();
        }
        b_no = request.getParameter("b_no").toString();
        model.addAttribute("loginID",loginID);
        model.addAttribute("b_no",b_no);

        return "board/boardreply"

    }*/






}
