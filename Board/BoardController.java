package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;


@Controller
public class BoardController {	
	
	@Resource(name="boardService")// BoardServiceImpl의 @Service 이름이 같아야한다
	private BoardService boardService;
	
	// 등록화면
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		
		return "board/boardWrite";
	}
	
	// 저장처리
	@RequestMapping("/boardWriteSave.do")  
	@ResponseBody	// ajax에게 결과를 다시 전송해주어야한다
	public String insertNBoard(BoardVO vo) throws Exception{
		// 저장이 정상실행될 경우 result = null
		String result = boardService.insertNBoard(vo);
		
		String msg = "";
		if(result == null) msg = "ok";
		else msg = "fail";
		
		return msg;
	}
	
	// 목록출력
	@RequestMapping("/boardList.do")
	public String selectNBoardList (BoardVO vo, ModelMap model ) throws Exception{
		
		int unit = 10;
		
		/* 페이징처리 - total 개수 */		
		int total = boardService.selectNBoardTotal(vo);
		
		/* 1 페이지 당 10개씩 출력 */
		// (double)12/10 -> ceil(1.2)(페이지가 1.2가 아닌 2페이지가 나와야하므로) -> Integer(2.0) => 최종 2 (page)
		int totalPage = (int) Math.ceil((double)total/unit);
		
		/* 페이지 번호 클릭시 목록출력 */
		int viewPage = vo.getViewPage();
		
		// 비정상 페이지수 접근시 1페이지가 출력되도록 설정
		if(viewPage > totalPage	|| viewPage < 1) {
			viewPage = 1;
		}
		
		// 1 페이지 -> 1, 10 => (1-1)*10 + 1
		// 2 페이지 -> 11, 20 => (2-1)*10 + 11
		int startIndex = (viewPage -1) * unit + 1;
		int endIndex = startIndex + (unit - 1);
		
		/* 행 번호 */
		// total 34 -> 1p : 34~25 / 2p : 24~15 / 3p : 14~5 / 4p : 4~1
		// int p1 = total - 0;
		// int p2 = total - 10;
		// int p3 = total - 20;
		// int p1 = total - 30;
		
		int startRowNo =  total - (viewPage -1)*unit;
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		// list 출력
		List <?> list = boardService.selectNBoardList(vo);
		System.out.println("List : " + list);
		
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("resultList", list);
		model.addAttribute("rowNumber", startRowNo);
		
		return "board/boardList";
	}
	
	// 상세보기
	@RequestMapping("/boardDetail.do")
	public String selectNBoardDetail(BoardVO vo, ModelMap model) throws Exception{
		
		// 조회수 증가
		boardService.updateNBoardHits(vo.getUnq());
		
		// 화면출력
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		
		String content = boardVO.getContent();
		
		// 내용 줄바꿈 허용 - java문법
		boardVO.setContent( content.replace("\n", "<br>"));
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardDetail";
	}
	
	// 수정하기
	@RequestMapping("/boardModifyWrite.do")
	public String selectNBoardModifyWrite(BoardVO vo, ModelMap model) throws Exception{
		
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardModifyWrite";
	}

	
	@RequestMapping("/boardModifySave.do")
	@ResponseBody	// ajax에게 결과를 다시 전송해주어야한다
	public String updateNBoard(BoardVO vo) throws Exception{
		
		// 암호확인
		int result = 0;
		
		int count = boardService.selectNBoardPass(vo);	// int count = 1;
		if (count == 1) {		
		// 수정처리
			result = boardService.updateNBoard(vo);		// int result = 1;			
		} else {
			result = -1;			
		}
		return result+"";
		
	}
	
	
	@RequestMapping("/passWrite.do")
	public String passWrite(int unq, ModelMap model) {
		
		model.addAttribute("unq", unq);
		
		
		return "board/passWrite";
	}
	
	@RequestMapping("/boardDelete.do")
	@ResponseBody
	public String deleteBoard(BoardVO vo) throws Exception {
		
		// 암호 일치 검사
		int result = 0;
		
		int count = boardService.selectNBoardPass(vo);
		
		if(count == 1) {
			result = boardService.deleteNBoard(vo);
	
		} else if (count == 0) {
			result = -1;
		}
			
		return result+"";
	}
	
}







