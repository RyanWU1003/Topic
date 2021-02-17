package tw.iii.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping(path = "/updateauthority",method = RequestMethod.POST)
	public String updateAuthority(@RequestParam(name = "account") String account,@RequestParam(name = "pdauthority") String pdauthority
			,@RequestParam(name = "frauthority") String frauthority,Model m) {
		mb = mbs.selecter(account);
		mbs.updateAuthority(account, pdauthority, frauthority);
		m.addAttribute("selection", "all");
//		m.addAttribute("memberList", mbs.select(account));
		m.addAttribute("memberList", mbs.selectAll());
		
		return "backSideMember.jsp";
	}
}
