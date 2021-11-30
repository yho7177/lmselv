package kr.happyjob.study.board.service;

import kr.happyjob.study.board.model.BoardVO;

import java.util.List;
import java.util.Map;

public interface BoardService {

	List<BoardVO> getBoardList() throws Exception;

	BoardVO getBoardDetail(Map<String, Object> paramMap) throws Exception;

	int boardRegister(Map<String, Object> paramMap) throws Exception;

	int modifyBoard(Map<String, Object> paramMap);

	int deleteBoard(Map<String, Object> paramMap);
	
	// 게시물 조회
	List<BoardVO> selectNBoardList(Map<String, Object> paramMap)throws Exception;
	
	//Total 개수 얻기
	int selectNBoardTotal();


/*	Map<String, Object> getTestList(String l_no, int pageNo) throws Exception;*/
}

