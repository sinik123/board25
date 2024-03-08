package com.tech.police.dao;

import java.util.ArrayList;

import com.tech.police.dto.PoliceBoardDto;

public interface IDao {

	public int selectAllCount(String searchType, String keyword);
	public ArrayList<PoliceBoardDto> selectAll(String searchType, String keyword, int rowStart, int rowEnd);
	public PoliceBoardDto select(int pnum);
}
