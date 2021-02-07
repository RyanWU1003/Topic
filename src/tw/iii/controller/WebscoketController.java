package tw.iii.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import tw.iii.model.GoogleMap;
import tw.iii.model.MapDao;


@Controller
public class WebscoketController {

	
	//全部查詢
		@RequestMapping(path = "/gowebscoket",method = RequestMethod.GET)
		public String gowebscoket(Model m) {
		     String user =SecurityContextHolder.getContext().getAuthentication().getName();
		
	
		    	m.addAttribute("user",user);
	
			return "websco.jsp";
			
		}
		
		
		
}
