package com.care.root.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.dto.BoardDTO;
import com.care.root.board.dto.BoardRepDTO;
import com.care.root.member.session_name.MemberSessionName;
import com.care.root.message.MessageDTO;
import com.care.root.mybatis.board.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired BoardMapper mapper;
	@Override
	public void selectAllBoardList(Model model, int num) {
		int allCount = mapper.selectBoardCount(); // 글 총 개수 얻어오기
		int pageLetter = 3; //한 페이지에 3개의 글 표현
		int repeat = allCount /pageLetter;
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("boardList",mapper.selectAllBoardList(start, end));
	}
	@Override
	public String writeSave(MultipartHttpServletRequest mul,
								HttpServletRequest request) {
		BoardDTO dto = new BoardDTO();
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		HttpSession session = request.getSession();
		dto.setId((String)session.getAttribute( MemberSessionName.LOGIN ));
		
		MultipartFile file = mul.getFile("image_file_name");
		
		BoardFileService bfs = new BoardFileServiceImpl();
		
		if( file.isEmpty() ) { // 파일이 비워있으면 true
			dto.setImageFileName("nan");
		}else { //파일이 존재하는 경우
			dto.setImageFileName( bfs.saveFile(file) );
		}
		/*
		int result = mapper.writeSave(dto);
		String message = bfs.getMessage(result, request);
		return message;
		*/
		return bfs.getMessage(mapper.writeSave(dto), request);
	}
	@Override
	public void contentView(int writeNo, Model model) {
		model.addAttribute("personalData", mapper.contentView(writeNo));
		upHit(writeNo);
	}
	private void upHit(int writeNo) {
		mapper.upHit(writeNo);
	}
	@Override
	public String boardDelete(int writeNo, String imageFileName, HttpServletRequest request) {
		BoardFileService bfs = new BoardFileServiceImpl();
		int result = mapper.delete(writeNo);
		
		MessageDTO dto = new MessageDTO();
		
		if(result == 1) {//DB삭제 성공
			bfs.deleteImage(imageFileName);
		}
		dto.setRequest(request);
		dto.setResult(result);
		dto.setSuccessMessage("성공적으로 삭제 되었습니다");
		dto.setSuccessURL("/board/boardAllList");
		dto.setFailMessage("삭제 중 문제가 발생하였습니다");
		dto.setFailURL("/board/contentView");
		
		return bfs.getMessage(dto);
	}
	public String modify(MultipartHttpServletRequest mul,HttpServletRequest request ) {
		BoardDTO dto = new BoardDTO();
		dto.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		
		MultipartFile file = mul.getFile("imageFileName");
		BoardFileService bfs = new BoardFileServiceImpl();
		
		if( file.isEmpty() ) { // 이미지 변경 되지 않았음
			dto.setImageFileName(mul.getParameter("originFileName"));
		}else { // 이미지 변경 되었음.
			dto.setImageFileName(bfs.saveFile(file));
			bfs.deleteImage(mul.getParameter("originFileName"));
		}
		int result = mapper.modify(dto);
		
		MessageDTO mDto = new MessageDTO();
		mDto.setResult(result);
		mDto.setRequest(request);
		mDto.setSuccessMessage("성공적으로 수정되었습니다");
		mDto.setSuccessURL("/board/boardAllList");
		mDto.setFailMessage("수정 중 문제 발생!!!");
		mDto.setFailURL("/board/modify_form");
		
		return bfs.getMessage(mDto);
	}
	@Override
	public void addReply(BoardRepDTO dto) {
		mapper.addReply(dto);
	}
	public List<BoardRepDTO> getRepList(int write_group){
		return mapper.getRepList(write_group);
	}
}















