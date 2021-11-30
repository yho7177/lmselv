package kr.happyjob.study.board.dao;

import kr.happyjob.study.board.model.BoardVO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface BoardDao {

	List<BoardVO> getBoardList() throws Exception;

	BoardVO getBoardDetail(Map<String, Object> paramMap) throws Exception;

	int boardRegister(Map<String, Object> paramMap) throws Exception;

	int modifyBoard(Map<String, Object> paramMap);

	int deleteBoard(Map<String, Object> paramMap);

	int selectNBoardTotal();
	
	List<BoardVO> selectNBoardList(Map<String, Object> paramMap);

	


}



