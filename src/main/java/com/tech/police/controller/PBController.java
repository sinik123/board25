package com.tech.police.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.police.dao.IDao;
import com.tech.police.service.PBContentViewService;
import com.tech.police.service.PBListService;
import com.tech.police.service.PBService;

@Controller
public class PBController {

	@Autowired
	private SqlSession sqlSession;
	
	private PBService pbService;
	
	@RequestMapping("/policeBoard")
	public String policeBoard(HttpServletRequest request, Model model) {
		model.addAttribute("dao", sqlSession.getMapper(IDao.class));
		model.addAttribute("request", request);
		
		pbService = new PBListService();
		pbService.execute(model);
		
		return "policeBoard";
	}
	
	@RequestMapping("/contentView")
	public String contentView(HttpServletRequest request, Model model) {
		model.addAttribute("dao", sqlSession.getMapper(IDao.class));
		model.addAttribute("request", request);
		
		pbService = new PBContentViewService();
		pbService.execute(model);
		
		return "contentView";
	}
}
