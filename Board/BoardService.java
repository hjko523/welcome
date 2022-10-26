package main.service;

import java.util.List;

public interface BoardService {

	// 저장처리
	public String insertNBoard(BoardVO vo) throws Exception;
		
	// 목록
	public List<?> selectNBoardList(BoardVO vo) throws Exception;
	
	// 총 게시물 수
	public int selectNBoardTotal(BoardVO vo) throws Exception;
	
	// 상세화면
	public BoardVO selectNBoardDetail(int unq) throws Exception;
	
	// 조회수 증가
	public int updateNBoardHits(int unq) throws Exception;
	
	// 수정처리
	public int updateNBoard(BoardVO vo) throws Exception;
	
	// 암호확인
	public int selectNBoardPass(BoardVO vo) throws Exception;
	
	// 삭제처리
	public int deleteNBoard(BoardVO vo) throws Exception;
	
}
