package tw.iii.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ProductService {
	@Autowired
	private ProductDao pDao;
	
	public Product getById(int productID) {
		return pDao.getById(productID);
	}

	public Product insert(Product PD) {
		return pDao.insert(PD);
	}
	public boolean delete(int productID) {
		return pDao.delete(productID);
	}
	public Product select(int productID) {
		return pDao.select(productID);
	}
	public Product update(int productID, String productName, int stock, int price, String species, String classification,
	String brand, String descripton,String img) {
		return pDao.update(productID, productName, stock, price, species, classification, brand, descripton, img);
	}
	public List<Product> selectAll(){
		return pDao.selectAll();
	}
	public List<Product> selectbrand(String brand){
		return pDao.selectbrand(brand);
	}
	public List<Product> selectspecies(String species){
		return pDao.selectspecies(species);
	}
	public List<Product> selectclass(String classification){
		return pDao.selectclass(classification);
	}
	public List<Product> selectwhere(int max,int min){
		return pDao.selectwhere(max, min);
	}
	public List<Product> selectid(int productID){
		return pDao.selectid(productID);
	}
	public Object count() {
		return pDao.count();
	}
	public Object countwhere(int max,int min) {
		return pDao.countwhere(max, min);
	}
	public Object countbrand(String brand) {
		return pDao.countbrand(brand);
	}
	public Object countspecies(String species) {
		return pDao.countspecies(species);
	}
	public Object countclass(String classification) {
		return pDao.countclass(classification);
	}
	public boolean login(String username, String password) {
		return pDao.login(username, password);
	}
	
}
