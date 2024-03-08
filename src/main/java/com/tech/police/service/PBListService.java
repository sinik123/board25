package com.tech.police.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.police.dao.IDao;
import com.tech.police.dto.PoliceBoardDto;
import com.tech.police.vopage.SearchVO;

public class PBListService implements PBService {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		
		IDao dao = (IDao) map.get("dao");
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String searchType = request.getParameter("searchType");
		if (searchType == null) {
			searchType = "";
		}
		
		String keyword = request.getParameter("keyword");
		if (keyword == null) {
			keyword = "";
		}
		
		String pageStr = request.getParameter("page");
		int page = pageStr == null ? 1 : Integer.parseInt(pageStr);
		SearchVO searchVO = new SearchVO();
		searchVO.setPage(page);
		
		String displayRowCount = request.getParameter("displayRowCount");
		if (displayRowCount != null) {
			searchVO.setDisplayRowCount(Integer.parseInt(displayRowCount));
		}
		
		int total = dao.selectAllCount(searchType, keyword);
		searchVO.pageCalculate(total);
		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();
		System.out.println(rowStart);
		System.out.println(rowEnd);
		ArrayList<PoliceBoardDto> list = dao.selectAll(searchType, keyword, rowStart, rowEnd);
		
		model.addAttribute("list", list);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchVO", searchVO);
	}
}
