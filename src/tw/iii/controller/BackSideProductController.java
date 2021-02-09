package tw.iii.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.multipart.MultipartFile;

import tw.iii.model.Product;
import tw.iii.model.ProductDao;
import tw.iii.model.ProductService;

@Controller
public class BackSideProductController {

	@Autowired
	private ProductService pService;

	@Autowired
	private ProductDao pDao;

	@Autowired
	private HttpServletRequest req;

	// 跳轉至產品管理頁面
	@RequestMapping(path = "/bsProductManagement", method = RequestMethod.GET)
	public String bsProductManagement(Model m) {
		List<Product> list = pService.selectAll();
		m.addAttribute("selected", "bsAll");
		m.addAttribute("bsproductList", pService.selectAll());
		m.addAttribute("bscount", String.valueOf(pService.count()));
		return "BackSideProductManagement.jsp";
	}

	// 跳轉至新增頁面
	@RequestMapping(path = "/toBsCreateProduct", method = RequestMethod.GET)
	public String bsCreateProduct(Model m) {
		List<Product> list = pService.selectAll();
		m.addAttribute("bsproductList", list);
		return "BackSideCreateProduct.jsp";
	}

	/*
	 * // 跳轉至確認頁面
	 * 
	 * @RequestMapping(path = "/toConfirmPage", method = RequestMethod.POST) public
	 * String toConfirmPage(@RequestParam(name = "id") int
	 * productID,@RequestParam(name = "productname") String productName,
	 * 
	 * @RequestParam(name = "stock") int stock, @RequestParam(name = "price") int
	 * price,
	 * 
	 * @RequestParam(name = "species") String species, @RequestParam(name =
	 * "classification") String classf,
	 * 
	 * @RequestParam(name = "brand") String brand, @RequestParam(name =
	 * "descripton") String descripton,
	 * 
	 * @RequestParam(name = "status") String status, @RequestParam(name = "myfile")
	 * MultipartFile mfile, Model m) {
	 * 
	 * 
	 * 
	 * m.addAttribute("productID",productID); m.addAttribute("stock",stock);
	 * m.addAttribute("price",price); m.addAttribute("productname",productName);
	 * m.addAttribute("species",species); m.addAttribute("classfisication",classf);
	 * m.addAttribute("brand",brand); m.addAttribute("descripton",descripton);
	 * m.addAttribute("status",status);
	 * 
	 * 
	 * return "BackSideProductConfrim.jsp"; }
	 */
	

	// 新增
	@RequestMapping(path = "/bsAddProduct", method = RequestMethod.POST)
	public String bsAddProduct(@RequestParam(name = "productname") String productName,
			@RequestParam(name = "stock") int stock, @RequestParam(name = "price") int price,
			@RequestParam(name = "species") String species, @RequestParam(name = "classification") String classf,
			@RequestParam(name = "brand") String brand, @RequestParam(name = "descripton") String descripton,
			@RequestParam(name = "status") String status, @RequestParam(name = "myfile") MultipartFile mfile, Model m)
			throws IOException {
		Product product = new Product(productName, stock, price, species, classf, brand, descripton, status);

		if (!mfile.isEmpty()) {
			String filename = mfile.getOriginalFilename();
			String savepath = "C:\\Users\\iii\\Downloads\\SpringMVC_forum_Map0130\\WebContent\\WEB-INF\\img";
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
			product.setImg(filename);
		} else {
			product.setImg(null);
		}

		pService.insert(product);

		System.out.println("新增成功!!");
		return "BackSideCreateProduct.jsp";
	}

	// 刪除
	@RequestMapping(path = "/bsDelProduct", method = RequestMethod.GET)
	public String bsDelProduct(@RequestParam(name = "id") int id, Model m) {
		pService.delete(id);

		return bsSelectAll(m);
	}

	// 跳轉至更新頁面
	@RequestMapping(path = "/toBsUpdateProduct", method = RequestMethod.GET)
	public String toBsUpdateProduct(@RequestParam(name = "id") int id, Model m) {
		List<Product> list = pService.selectAll();
		m.addAttribute("bsproductList", list);

		Product pbean = pService.select(id);
		m.addAttribute("product", pbean);
	
		return "BakeSideProductUpdate.jsp";
	}

	// 更新
	@RequestMapping(path = "/bsUpdateProduct", method = RequestMethod.POST)
	public String bsUpdateProduct(@RequestParam(name = "id") int productID,
			@RequestParam(name = "productname") String productName, @RequestParam(name = "stock") int stock,
			@RequestParam(name = "price") int price, @RequestParam(name = "species") String species,
			@RequestParam(name = "classification") String classification, @RequestParam(name = "brand") String brand,
			@RequestParam(name = "descripton") String descripton, @RequestParam(name = "status") String status,
			@RequestParam(name = "myfile") MultipartFile mfile, Model m) throws IOException {
		System.out.println(
				productID + productName + stock + price + species + classification + brand + descripton + status);
		Product product = pDao.select(productID);
		product.setProductName(productName);
		product.setStock(stock);
		product.setBrand(brand);
		product.setClassification(classification);
		product.setDescripton(descripton);
		product.setSpecies(species);
		product.setPrice(price);
		product.setStatus(status);
		System.out.println(product.getProductID());

		if (!mfile.isEmpty()) {
			String filename = mfile.getOriginalFilename();
			String savepath = "C:\\Users\\iii\\Downloads\\SpringMVC_forum_Map0130\\WebContent\\WEB-INF\\img";
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
			product.setImg(filename);
		}

		pService.update(product);

		System.out.println("更新成功!!");

	

		return bsSelectAll(m);
	}

	// 全部查詢
	@RequestMapping(path = "/bsSelectAll", method = RequestMethod.POST)
	public String bsSelectAll(Model m) {
		m.addAttribute("selected", "bsAll");
		m.addAttribute("bsproductList", pService.selectAll());
		m.addAttribute("bscount", String.valueOf(pService.count()));
		return "BackSideProductManagement.jsp";
	}

	// 上架
	@RequestMapping(path = "/statusOpen", method = RequestMethod.GET)
	public String statusOpen(Model m) {
		m.addAttribute("selected", "open");
		m.addAttribute("bsproductList", pService.selectAllOpen());
		m.addAttribute("bscount", String.valueOf(pDao.countAllOpen()));
		return "BackSideProductManagement.jsp";
	}

	// 下架
	@RequestMapping(path = "/statusClose", method = RequestMethod.GET)
	public String statusClose(@RequestParam(name = "status") String status, Model m) {
		m.addAttribute("selected", "close");
		m.addAttribute("bsproductList", pDao.selectclose(status));
		m.addAttribute("bscount", String.valueOf(pDao.countclose(status)));
		return "BackSideProductManagement.jsp";
	}

	// 缺貨
	@RequestMapping(path = "/stocknone", method = RequestMethod.GET)
	public String stocknone(@RequestParam(name = "stock") int stock, Model m) {
		m.addAttribute("selected", "none");
		m.addAttribute("bsproductList", pDao.selectnone(stock));
		m.addAttribute("bscount", String.valueOf(pDao.countnone(stock)));
		return "BackSideProductManagement.jsp";
	}
	
	// 去分類查詢
	@RequestMapping(path = "/tobsSelect", method = RequestMethod.GET)
	public String tobsSelectSpecies(Model m) {
		return "BackSideProductSelect.jsp";
	}
	
	// 動物分類查詢
	@RequestMapping(path = "/bsSelectSpecies", method = RequestMethod.GET)
	public String bsSelectSpecies(@RequestParam(name = "species") String species, Model m) {
		m.addAttribute("selected", "bsSelectSpecies");
		m.addAttribute("bsproductList", pService.selectspecies(species));
		m.addAttribute("bscount", String.valueOf(pService.countspecies(species)));
		return "BackSideProductManagement.jsp";
	}

	// 動物分類查詢   post
	@RequestMapping(path = "/bsSelectSpecies2", method = RequestMethod.POST)
	public String bsSelectSpecies2(@RequestParam(name = "species") String species, Model m) {
		m.addAttribute("selected", "bsSelectSpecies");
		m.addAttribute("bsproductList", pService.selectspecies(species));
		m.addAttribute("bscount", String.valueOf(pService.countspecies(species)));
		return "BackSideProductManagement.jsp";
	}
	
	// 品牌查詢
	@RequestMapping(path = "/bsSelectBrand", method = RequestMethod.GET)
	public String bsSelectBrand(@RequestParam(name = "brand") String brand, Model m) {
		m.addAttribute("selected", "bsSelectBrand");
		m.addAttribute("bsproductList", pService.selectbrand(brand));
		m.addAttribute("bscount", String.valueOf(pService.countbrand(brand)));
		return "BackSideProductManagement.jsp";
	}

	// 品牌查詢   post
	@RequestMapping(path = "/bsSelectBrand2", method = RequestMethod.POST)
	public String bsSelectBrand2(@RequestParam(name = "brand") String brand, Model m) {
		m.addAttribute("selected", "bsSelectBrand");
		m.addAttribute("bsproductList", pService.selectbrand(brand));
		m.addAttribute("bscount", String.valueOf(pService.countbrand(brand)));
		return "BackSideProductManagement.jsp";
	}
	
	// 產品種類查詢
	@RequestMapping(path = "/bsSelectClass", method = RequestMethod.GET)
	public String bsSelectClass(@RequestParam(name = "classification") String classf, Model m) {
		m.addAttribute("selected", "bsSelectClass");
		m.addAttribute("bsproductList", pService.selectclass(classf));
		m.addAttribute("bscount", String.valueOf(pService.countclass(classf)));
		return "BackSideProductManagement.jsp";
	}

	// 產品種類查詢   post
	@RequestMapping(path = "/bsSelectClass2", method = RequestMethod.POST)
	public String bsSelectClass2(@RequestParam(name = "classification") String classf, Model m) {
		m.addAttribute("selected", "bsSelectClass");
		m.addAttribute("bsproductList", pService.selectclass(classf));
		m.addAttribute("bscount", String.valueOf(pService.countclass(classf)));
		return "BackSideProductManagement.jsp";
	}
	
	// 價格查詢
	@RequestMapping(path = "/bsSelectPrice", method = RequestMethod.POST)
	public String bsSelectPrice(@RequestParam(name = "max") String max, @RequestParam(name = "min") String min,
			Model m) {
		m.addAttribute("selected", "bsLimitPrice");
		m.addAttribute("bsproductList", pService.selectwhere(Integer.parseInt(max), Integer.parseInt(min)));
		m.addAttribute("bscount", String.valueOf(pService.countwhere(Integer.parseInt(max), Integer.parseInt(min))));
		return "BackSideProductManagement.jsp";
	}

	@RequestMapping(path = "/bsGetAllProduct", method = RequestMethod.GET)
	public String bsGetAllProduct(Model m) {
		List<Product> list = pService.selectAll();
		m.addAttribute("bsproductList", list);
		m.addAttribute("bscount", String.valueOf(pService.count()));
		return "BackSideProductManagement.jsp";
	}
}
