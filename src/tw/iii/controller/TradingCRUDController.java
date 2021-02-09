package tw.iii.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.iii.model.Cart;
import tw.iii.model.Member;
import tw.iii.model.MemberDAO;
import tw.iii.model.Product;
import tw.iii.model.ProductDao;
import tw.iii.model.TradingDao;
import tw.iii.model.TradingDetail;
import tw.iii.model.TradingDetailForm;
import tw.iii.model.TradingDetailpk;
import tw.iii.model.TradingRecord;

@Controller
public class TradingCRUDController {
	@Autowired
	private TradingDao tdao;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private ProductDao pdao;
	
	private List<TradingDetail> detailForm=new ArrayList<TradingDetail>(); 
	
	//顯示所有訂單
	@GetMapping(path="/showAllTrading")
	public String showAllTrading(Model m) {
		List<TradingRecord> recordList=tdao.getAllRecord();
		m.addAttribute("recordList",recordList);
		
		return "WEB-INF/html/Trading.jsp";
	}
	
	//搜尋單筆訂單
	@PostMapping(path="/showTradingbyId")
	public String searchbyId(@RequestParam(name="orderid")int id,Model m) {
		TradingRecord recordList=tdao.getRecordbyId(id);
		m.addAttribute("tradingRecord",recordList);
		return "WEB-INF/html/Trading.jsp";
	}
	
	//搜尋會員訂單
	@PostMapping(path="/showTradingbyAccount")
	public String searchbyAccount(@RequestParam(name="account")String account,Model m) {
		List<TradingRecord> recordList =tdao.getRecordbyAccount(account);
		m.addAttribute("recordList",recordList);
		return "WEB-INF/html/Trading.jsp";
	}
	//日期查詢訂單
	@PostMapping(path="/searchbyDate")
	public String searchbyDate(@RequestParam(name="date1")String date1
			,@RequestParam(name="date2")String date2
			,Model m) throws ParseException {
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		Date newdate1=sdf.parse(date1);
		Date newdate2=sdf.parse(date2);
		List<TradingRecord> recordList =tdao.getRecordbyDate(newdate1, newdate2);
		m.addAttribute("recordList",recordList);
		return "WEB-INF/html/Trading.jsp";
	}
	
	//電話查詢訂單
	@PostMapping(path="")
	public String searchbyTel(@RequestParam(name="tel")String tel,Model m) {
		List<TradingRecord> recordList =tdao.getRecordbyTel(tel);
		m.addAttribute("recordList",recordList);
		return "WEB-INF/html/Trading.jsp";
	}
	
	//狀態查詢訂單
	@PostMapping(path="/searchbyStatus")
	public String searchbyStatus(@RequestParam(name="status")String status,Model m) {
		List<TradingRecord> recordList =tdao.getRecordbyStatus(status);
		m.addAttribute("recordList",recordList);
		return "WEB-INF/html/Trading.jsp";
	}
	
	//地址查尋訂單
	@PostMapping(path="/searchbyAddress")
	public String searchbyAddress(@RequestParam(name="address")String address,Model m) {
		List<TradingRecord> recordList =tdao.getRecordbyAdd(address);
		m.addAttribute("recordList",recordList);
		return "WEB-INF/html/Trading.jsp";
	}


	//單筆訂單細項顯示(後台)
	@GetMapping(path="/showTradingRecordnDetail")
	public String showTradingRecordnDetail(@RequestParam(name="orderid")int id,Model m) {
		TradingRecord trecord=tdao.getRecordbyId(id);
		//Member member=memberDAO.getAccount(trecord.getAccount());
		List<TradingDetail> tradingDetail =tdao.getDetail(id);
		m.addAttribute("trecord",trecord);
		m.addAttribute("tradingDetail",tradingDetail);
		return "WEB-INF/html/UpdateMyTrading.jsp";
	}
	
	//新增訂單
	@PostMapping(path="/createnewTrading")
	public String createnewTrading(@RequestParam(name="account")String account,
			@RequestParam(name="recipient")String recipient,
			@RequestParam(name="tel")String tel,
			@RequestParam(name="address")String address,
			@RequestParam(name="remarks")String remarks,
			@RequestParam(name="detailForm")TradingDetailForm formlist,Model m ) throws ParseException {
		
		Date date =new Date();
		SimpleDateFormat dateFt=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String dateTime=dateFt.format(date);
		Date dateResult =dateFt.parse(dateTime);
		
		
		return "showAllTrading";
	}
	
	//刪除訂單(後台)
	@GetMapping(path="/delTradingRecord")
	public String delTradingRecord(@RequestParam(name="orderid")int id,Model m) {
		System.out.println(id);
		tdao.delTradingRecord(id);
		return "showAllTrading";
	}
	
	
	//查詢訂單(前台)
	@GetMapping(path="/showTradingRecord")
	public String showTradingRecord(Model m) {
		String account =SecurityContextHolder.getContext().getAuthentication().getName();
		List<TradingRecord> tradingRecord =tdao.getRecordbyAccount(account);
		
		
		ArrayList<LinkedHashMap<String,Object>> maps=new ArrayList<>();
		
		for(int i =0;i<tradingRecord.size();i++) {
			List<TradingDetail> tradingDetail =tdao.getDetail(tradingRecord.get(i).getid());
			LinkedHashMap<String,Object> map=new LinkedHashMap<String,Object>();
			
			map.put("tradingRecord",tradingRecord.get(i) );
			map.put("tradingDetail", tradingDetail);
			
			List<Product> plist=new ArrayList<>();
			
			for(int j =0;j<tradingDetail.size();j++) {
				Product p=(Product) pdao.getByName(tradingDetail.get(j).getProductname());
				plist.add(p);
				map.put("product",plist);
			}
			
			maps.add(map);
		}
		m.addAttribute("allDetail",maps);
		//m.addAttribute("tradingRecord",tradingRecord);會員帳號的所有訂單
		return "WEB-INF/html/MyTradingRecord.jsp";
	}
	
	//查詢細項(前台)
	@GetMapping(path="/showTradingDetail")
	public String showTradingDetail(@RequestParam(name="orderid")int id,Model m) {
		System.out.println(id);
		List<TradingDetail> tradingDetail =tdao.getDetail(id);
	
		m.addAttribute("tradingDetail",tradingDetail);
		return "WEB-INF/html/MyTradingDetail.jsp";
	}
	
	
}
