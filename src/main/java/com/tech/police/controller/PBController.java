package com.tech.police.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.police.dao.IDao;
import com.tech.police.service.PBContentViewService;
import com.tech.police.service.PBDeleteService;
import com.tech.police.service.PBEditPostService;
import com.tech.police.service.PBEditViewService;
import com.tech.police.service.PBListService;
import com.tech.police.service.PBService;
import com.tech.police.service.PBWriteService;

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
	
	@RequestMapping("/writeView")
	public String writeView() {
		return "writeView";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		model.addAttribute("dao", sqlSession.getMapper(IDao.class));
		model.addAttribute("request", request);
		
		pbService = new PBWriteService();
		pbService.execute(model);
		
		return "redirect:policeBoard";
	}
	
	@RequestMapping("/deletePost")
	public String deletePost(HttpServletRequest request, Model model) {
		model.addAttribute("dao", sqlSession.getMapper(IDao.class));
		model.addAttribute("request", request);
		
		pbService = new PBDeleteService();
		pbService.execute(model);
		
		return "redirect:policeBoard";
	}
	
	@RequestMapping("/editView")
	public String editView(HttpServletRequest request, Model model) {
		model.addAttribute("dao", sqlSession.getMapper(IDao.class));
		model.addAttribute("request", request);
		
		pbService = new PBEditViewService();
		pbService.execute(model);
		
		return "editView";
	}
	
	@RequestMapping("/editPost")
	public String editPost(HttpServletRequest request, Model model) {
		model.addAttribute("dao", sqlSession.getMapper(IDao.class));
		model.addAttribute("request", request);
		
		pbService = new PBEditPostService();
		pbService.execute(model);
		
		return "redirect:policeBoard";
	}
}
