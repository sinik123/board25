package com.tech.police.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.police.dao.IDao;

public class PBWriteService implements PBService {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		
		IDao dao = (IDao) map.get("dao");
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String ptitle = request.getParameter("ptitle");
		String pcontent = request.getParameter("pcontent");
		String pwriter = request.getParameter("pwriter");
		String pfilesrc = request.getParameter("pfilesrc");
		dao.insert(ptitle, pcontent, pwriter, pfilesrc);
	}
}
