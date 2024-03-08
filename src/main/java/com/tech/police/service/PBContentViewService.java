package com.tech.police.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.police.dao.IDao;

public class PBContentViewService implements PBService {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		
		IDao dao = (IDao) map.get("dao");
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		model.addAttribute("dto", dao.select(pnum));
	}
}
