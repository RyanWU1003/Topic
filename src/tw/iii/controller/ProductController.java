package tw.iii.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.iii.model.Product;
import tw.iii.model.ProductDao;
import tw.iii.model.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService pService;
	private ProductDao pdao;
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest req;

	// 全部查詢
	@RequestMapping(path = "/selectAll", method = RequestMethod.POST)
	public String entryAction(Model m) {
		m.addAttribute("selection", "all");
		m.addAttribute("productList", pService.selectAll());
		m.addAttribute("count", String.valueOf(pService.count()));
		return "product.jsp";
	}

	// 動物分類查詢
	@RequestMapping(path = "/selectSpecies", method = RequestMethod.POST)
	public String selectspecies(@RequestParam(name = "species") String classf, Model m) {
		m.addAttribute("selection", "selectSpecies");
		m.addAttribute("productList", pService.selectspecies(classf));
		m.addAttribute("count", String.valueOf(pService.countspecies(classf)));
		return "product.jsp";
	}

	// 品牌查詢
	@RequestMapping(path = "/selectBrand", method = RequestMethod.POST)
	public String selectbrand(@RequestParam(name = "brand") String classf, Model m) {
		m.addAttribute("selection", "selectBrand");
		m.addAttribute("productList", pService.selectbrand(classf));
		m.addAttribute("count", String.valueOf(pService.countbrand(classf)));
		return "product.jsp";
	}

	// 產品種類查詢
	@RequestMapping(path = "/selectClass", method = RequestMethod.POST)
	public String selectClass(@RequestParam(name = "classification") String classf, Model m) {
		m.addAttribute("selection", "selectClass");
		m.addAttribute("productList", pService.selectclass(classf));
		m.addAttribute("count", String.valueOf(pService.countclass(classf)));
		return "product.jsp";
	}

	// 價格查詢
	@RequestMapping(path = "/selectPrice", method = RequestMethod.POST)
	public String selectPrice(@RequestParam(name = "max") String max, @RequestParam(name = "min") String min, Model m) {
		m.addAttribute("selection", "limitPrice");
		m.addAttribute("productList", pService.selectwhere(Integer.parseInt(max), Integer.parseInt(min)));
		m.addAttribute("count", String.valueOf(pService.countwhere(Integer.parseInt(max), Integer.parseInt(min))));
		return "product.jsp";
	}
	/*
	 * //產品細項
	 * 
	 * @RequestMapping(path="/goproductdetail",method=RequestMethod.GET) public
	 * String goproductdetail(Model m , @RequestParam(name="productID") int
	 * productid) {
	 * 
	 * m.addAttribute("productList", pService.selectid(productid)); return
	 * "WEB-INF/html/productDetail.jsp"; }
	 */
	
	@RequestMapping(path="/getAllProduct",method = RequestMethod.GET)
	public String allProductPage(Model m) {
		List<Product> list=pService.selectAll();
		m.addAttribute("productList",list);
		return "product.jsp";
	}
	
	@RequestMapping(path="/getProductDetail",method = RequestMethod.GET)
	public String productDetail(@RequestParam(name="id")int id, Model m) {
		Product product =pService.getById(id);
		List<Product> list =pService.selectspecies(product.getSpecies());
		List<Product> newlist=new ArrayList<Product>();
		for(int i =0;i<list.size();i++) {
			if(i==6) {
				break;
			}else {
				newlist.add(list.get(i));
			}
		}
		m.addAttribute("product",product);
		m.addAttribute("productList",newlist);
		return "ProductDetail.jsp";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	//新增
	@RequestMapping(path = "/addproduct",method = RequestMethod.GET)
	public String addproductAction(@RequestParam(name="productname")String productName,
			@RequestParam(name="stock") String stock,
			@RequestParam(name="price")String price, 
			@RequestParam(name="species") String species,
			@RequestParam(name="classification")String classf,
			@RequestParam(name="brand") String brand,
			@RequestParam(name="descripton") String descripton,
			@RequestParam(name="addimg") MultipartFile mfile, 
//			@RequestParam(name="img") String img,
			Model m) throws IOException {
		
		Product pBean = new Product();
		pBean.setProductName(productName);
		pBean.setStock(Integer.parseInt(stock));
		pBean.setPrice(Integer.parseInt(price));
		pBean.setSpecies(species);
		pBean.setClassification(classf);
		pBean.setBrand(brand);
		pBean.setDescripton(descripton);
		pBean.setImg(null);
		
		if (!mfile.isEmpty()) {
			String filename = mfile.getOriginalFilename();
			String savepath = req.getServletContext().getRealPath("/") + "uploadtempDir\\";
			File file = new File(savepath);
			file.mkdirs();
			File savefile = new File(file, filename);
			InputStream inn = mfile.getInputStream();
			FileOutputStream fos = new FileOutputStream(savefile);
			byte[] bb = new byte[1024];
			int le = -1;
			while ((le = inn.read(bb)) != -1) {
				fos.write(bb, 0, le);
			}
			pBean.setImg(filename);
		} else {
			pBean.setImg(null);
		}
		
		pService.insert(pBean);
		
		m.addAttribute("selection","all");
		m.addAttribute("productList",pService.selectAll());
		m.addAttribute("count",pService.count());
		return "WEB-INF/html/productManagement.jsp";
	}

	//刪除
	@RequestMapping(path="/delAction",method = RequestMethod.GET)
	public String delAction(@RequestParam(name="productID")String id,Model m) {
		pService.delete(Integer.parseInt(id));
		
		m.addAttribute("selection","all");
		m.addAttribute("productList",pService.selectAll());
		m.addAttribute("count",pService.count());
		return "WEB-INF/html/productManagement.jsp";
	}
	
//	//跳轉至新增
//	@RequestMapping(path="/select",method = RequestMethod.GET)
//	public String select(@RequestParam(name="id")String id,Model m) {
//		Product pbean = pService.select(Integer.parseInt(id));
//		m.addAttribute("id",pbean.getProductID());
//		m.addAttribute("name",pbean.getProductName());
//		m.addAttribute("price",pbean.getPrice());
//		
//		m.addAttribute("selection","all");
//		m.addAttribute("productList",pService.selectAll());
//		m.addAttribute("count",pService.count());
//		return "WEB-INF/html/productManagement.jsp";
//	}

	//更新
	@RequestMapping(path="/updateAction",method = RequestMethod.POST)
	public String updateAction(@RequestParam(name="id")String id,
			@RequestParam(name="productName")String productName,
			@RequestParam(name="stock") String stock,
			@RequestParam(name="price")String price, 
			@RequestParam(name="species") String species,
			@RequestParam(name="classification")String classf,
			@RequestParam(name="brand") String brand,
			@RequestParam(name="descripton") String descripton,
			Model m) {

		pService.update(Integer.parseInt(id), productName,Integer.parseInt(stock),Integer.parseInt(price),species, classf, descripton, descripton, descripton);


		m.addAttribute("selection","all");
		m.addAttribute("productList",pService.selectAll());
		m.addAttribute("count",pService.count());
		return "WEB-INF/html/productManagement.jsp";
		}

}
