package tw.iii.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.iii.model.Cart;

@Controller
public class CheckController {
	
	//結帳前檢驗登入
	@RequestMapping(path="/check",method = RequestMethod.GET)
	public String checkout(HttpSession session) {
//		boolean isLogin =(boolean) session.getAttribute("isLogin");
//		if(!isLogin) {
//			return "login";
//		}else {
//		return "checkPage";}
		
		List<Cart> list=(List<Cart>)session.getAttribute("cart");
		session.setAttribute("cart", list);
		return "WEB-INF/pages/checkPage";
	}
	
	 
}
