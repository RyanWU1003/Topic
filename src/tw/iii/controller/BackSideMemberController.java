package tw.iii.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.iii.model.Member;
import tw.iii.model.MemberService;

@Controller
public class BackSideMemberController {
	@Autowired
	private MemberService mbs;
	
	private Member mb;
	
	@RequestMapping(path = "/selectAllMember",method = RequestMethod.GET)
	public String selectAllMember(Model m) {
		m.addAttribute("selection", "all");
		m.addAttribute("memberList", mbs.selectAll());
		return "backSideMember.jsp";
	}
}
