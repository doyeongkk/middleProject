package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardServiceImpl;
import service.IBoardService;
import vo.PostVO;
import web.IAction;

public class DonBoardAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		IBoardService boardService = BoardServiceImpl.getService();
		List<PostVO> list = boardService.getAllDon();
		
		
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		System.out.println(board_no);
		
		request.setAttribute("list", list);
		request.setAttribute("board_no", board_no);
		
		return "/board/DonBoard.jsp";
	}

}
