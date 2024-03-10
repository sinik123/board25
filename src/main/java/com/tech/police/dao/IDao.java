package com.tech.police.dao;

import java.util.ArrayList;

import com.tech.police.dto.PoliceBoardDto;

public interface IDao {

	public int selectAllCount(String searchType, String keyword);
	public ArrayList<PoliceBoardDto> selectAll(String searchType, String keyword, int rowStart, int rowEnd);
	public PoliceBoardDto select(int pnum);
	public void updateHit(int pnum);
	public void insert(String ptitle, String pcontent, String pwriter, String pfilesrc);
	public void update(int pnum, String ptitle, String pcontent, String pwriter, String pfilesrc);
	public void delete(int pnum);
}
