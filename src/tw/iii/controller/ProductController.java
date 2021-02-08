package tw.iii.controller;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import tw.iii.model.Product;
import tw.iii.model.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService pService;
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest req;

	// 全部查詢
	@RequestMapping(path = "/selectAll", method = RequestMethod.POST)
	public String entryAction( Model m) {
		m.addAttribute("selection", "all");
		m.addAttribute("productList", pService.selectAllOpen());
		m.addAttribute("count", String.valueOf(pService.countAllOpen()));
		return "product.jsp";
	}


	@RequestMapping(path="/getAllProduct",method = RequestMethod.GET)
	public String allProductPage(Model m) {
		List<Product> list=pService.selectAllOpen();
		m.addAttribute("productList",list);
		m.addAttribute("count", String.valueOf(pService.countAllOpen()));
		return "product.jsp";
	}
	
	@RequestMapping(path="/getProductDetail",method = RequestMethod.GET)
	public String productDetail(@RequestParam(name="id")int id, Model m) {
		Product product =pService.getById(id);
		m.addAttribute("product",product);
		return "ProductDetail.jsp";
	}
	// 動物分類查詢
	@RequestMapping(path = "/selectSpecies", method = RequestMethod.GET)
	public String selectspecies(@RequestParam(name = "species") String species, Model m) {
		m.addAttribute("selection", "selectSpecies");
		m.addAttribute("productList", pService.selectspeciesOpen(species));
		m.addAttribute("count", String.valueOf(pService.countspeciesOpen(species)));
		return "product.jsp";
	}

	// 品牌查詢
	@RequestMapping(path = "/selectBrand", method = RequestMethod.GET)
	public String selectbrand(@RequestParam(name = "brand") String brand, Model m) {
		m.addAttribute("selection", "selectBrand");
		m.addAttribute("productList", pService.selectbrandOpen(brand));
		m.addAttribute("count", String.valueOf(pService.countbrandOpen(brand)));
		return "product.jsp";
	}

	// 產品種類查詢
	@RequestMapping(path = "/selectClass", method = RequestMethod.GET)
	public String selectClass(@RequestParam(name = "classification") String classf, Model m) {
		m.addAttribute("selection", "selectClass");
		m.addAttribute("productList", pService.selectclassOpen(classf));
		m.addAttribute("count", String.valueOf(pService.countclassOpen(classf)));
		return "product.jsp";
	}

	// 價格查詢
	@RequestMapping(path = "/selectPrice", method = RequestMethod.POST)
	public String selectPrice(@RequestParam(name = "max") String max, @RequestParam(name = "min") String min, Model m) {
		m.addAttribute("selection", "limitPrice");
		m.addAttribute("productList", pService.selectwhereOpen(Integer.parseInt(max), Integer.parseInt(min)));
		m.addAttribute("count", String.valueOf(pService.countwhereOpen(Integer.parseInt(max), Integer.parseInt(min))));
		return "product.jsp";
	}

}