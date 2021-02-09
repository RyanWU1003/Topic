package tw.iii.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.iii.model.Employee;
import tw.iii.model.EmployeeDao;
import tw.iii.model.Product;
import tw.iii.model.ProductDao;
import tw.iii.model.ProductService;

@Controller
public class EmployeeController {
	
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private EmployeeDao edao;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private HttpServletRequest req;

	
	//全部查詢
	@RequestMapping(path = "/goemployee", method = RequestMethod.GET)
	public String goemployee(Model m) throws IOException{
		m.addAttribute("employeeList", edao.selectAll());
		return "employee.jsp";
	}
	
	//回首頁
	@RequestMapping(path = "/gobackhome", method = RequestMethod.GET)
	public String gohome(Model m) throws IOException{
//		m.addAttribute("employeeList", edao.selectAll());
		return "employee&BackSideProduct.jsp";
	}
	
	//跳轉至新增
	@RequestMapping(path="/toaddemployeejsp",method = RequestMethod.GET)
	public String toaddemployeejsp(Model m) {
		return "employeeadd.jsp";
	}
	
	//跳轉至更新
	@RequestMapping(path="/toupdateemployeejsp",method = RequestMethod.GET)
	public String toupdateemployeejsp(@RequestParam(name="empID")int empid, Model m) {
		List<Employee> list = edao.selectAll();
		m.addAttribute("employeeList", list);
		
		Employee employee = edao.select(empid);
		m.addAttribute("employee", employee);
		return "employeeupdate.jsp";
	}
	
	//新增員工
	@RequestMapping(path = "/addemployee", method = RequestMethod.POST)
	public String addemployee(@RequestParam(name="empAccount")String empaccount,@RequestParam(name="empPassword")String emppassword,
			@RequestParam(name="empName")String empname,@RequestParam(name="title")String title, Model m) 
					throws IllegalStateException, IOException, ParseException{
		Employee employee = new Employee(empaccount, emppassword, empname, title);
		edao.insert(employee);
		return goemployee(m);
	}
	
	//刪除員工
	@RequestMapping(path = "/deleteemployee", method = RequestMethod.GET)
	public String deleteemployee(@RequestParam(name="empID")int empid, Model m) throws IOException {
		edao.delete(empid);
		return goemployee(m);
	}
	
	//更新員工
	@RequestMapping(path = "/updateemployee", method = RequestMethod.POST)
	public String updateemployee(@RequestParam(name="empID")int empid, @RequestParam(name="empAccount")String empaccount,
			@RequestParam(name="empPassword")String emppassword, @RequestParam(name="empName")String empname,
			@RequestParam(name="title")String title, Model m) throws IllegalStateException, IOException, ParseException{
		edao.update(empid, empaccount, emppassword, empname, title);
		return goemployee(m);
	}
	
	//id查詢
	@RequestMapping(path = "/selectemployeeid", method = RequestMethod.POST)
	public String selectemployeeid(@RequestParam(name="empID")int empid, Model m) {
		m.addAttribute("employeeList", edao.selectid(empid));
		return "employee.jsp";
	}
	
	//title查詢
	@RequestMapping(path = "/selectemployeetitle", method = RequestMethod.POST)
	public String selectemployeetitle(@RequestParam(name="title")String title, Model m) {
		m.addAttribute("employeeList", edao.selecttitle(title));
		return "employee.jsp";
	}
	
	@RequestMapping(path = "/employeelogin", method = RequestMethod.POST)
	public String employeeLogin(@RequestParam(name = "empAccount")String empaccount, 
			@RequestParam(name = "empPassword")String emppassword, Model m, HttpServletRequest req) {
		
		Map<String,String> err=new HashMap<String,String>();
		
		boolean isLogin=edao.login(empaccount, emppassword);
		
		if(empaccount==null||empaccount.length()==0) {
			err.put("empAccount","請輸入帳號" );
		}
		if(emppassword==null||emppassword.length()==0) {
			err.put("empPassword", "請輸入密碼");
		}
		
		if(isLogin) {
			HttpSession session=req.getSession();
			session.setAttribute("isLogin", isLogin);
			return "employee&BackSideProduct.jsp";
		}
		m.addAttribute("err", err);
		if(err!=null&&!err.isEmpty()) {
			return "eeindex.jsp";		
			}
		err.put("msg", "帳號或密碼錯誤，請重新輸入!");
		return "eeindex.jsp";
	}
	
	
}





