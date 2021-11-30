package kr.happyjob.study.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/board")
public class FreeBoardController {


    @RequestMapping(value = "/freeboardlist.do")
    public String freeboardlist(HttpServletRequest request, ModelMap model)
    {
        return "freeboard/freeboardlist";
    }

    @RequestMapping(value = "/freeboardlist2.do")
    public String freeboardlist2(HttpServletRequest request, ModelMap model)
    {
        return "freeboard/freeboardlist2";
    }

    @RequestMapping(value = "/freeboardlist3.do")
    public String freeboardlist3(HttpServletRequest request, ModelMap model)
    {
         String id = request.getParameter("id").toString();
         if(id.equals("abcd"))
         {
             model.addAttribute("userid",id);
         }else
         {
             model.addAttribute("userid","잘못된 입력");
         }

        return "freeboard/freeboardlist";
    }


}
