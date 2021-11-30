package kr.happyjob.study.board.service;

import kr.happyjob.study.board.dao.BoardDao;
import kr.happyjob.study.board.model.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDao dao;

	@Override
	public List<BoardVO> getBoardList() throws Exception {
		return dao.getBoardList();
	}

	@Override
	public BoardVO getBoardDetail(Map<String, Object> paramMap) throws Exception {
		return dao.getBoardDetail(paramMap);
	}

	@Override
	public int boardRegister(Map<String, Object> paramMap) throws Exception {
		return dao.boardRegister(paramMap);
	}

	@Override
	public int modifyBoard(Map<String, Object> paramMap) {
		return dao.modifyBoard(paramMap);
	}

	@Override
	public int deleteBoard(Map<String, Object> paramMap) {
		return dao.deleteBoard(paramMap);
	}
	@Override
	public int selectNBoardTotal() { return dao.selectNBoardTotal(); }

	@Override
	public List<BoardVO> selectNBoardList(Map<String, Object> paramMap) {
		
		return dao.selectNBoardList(paramMap);
	}


   

}