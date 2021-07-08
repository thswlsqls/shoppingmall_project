package com.care.root.mybatis.notice;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.care.root.notice.dto.NoticeDTO;
import com.care.root.notice.dto.NoticeRepDTO;

public interface NoticeMapper {
	public List<NoticeDTO> selectAllNoticeList(@Param("s") int start, @Param("e") int end);
	public int writeSave(NoticeDTO dto);
	public NoticeDTO contentView(int noticeId);
	public void noticeViews(int noticeId);
	public int modify(NoticeDTO dto);
	public void addReply(NoticeRepDTO dto); //답글 달기 답글
	public List<NoticeRepDTO> getRepList(int write_group);
	public int delete(int noticeId);
	public int selectNoticeCount();
}
