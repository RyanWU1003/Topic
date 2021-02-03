package tw.iii.model;

import java.util.List;

public interface IproductDao {
	public Product insert(Product PD);
	public boolean delete(int productID);
	public Product select(int productID);
	public Product update(int productID, String productName, int stock, int price, String species, String classification,
	String brand, String descripton,String img);
	public List<Product> selectAll();
	public List<Product> selectid(int productID);
	public List<Product> selectbrand(String brand);
	public List<Product> selectspecies(String species);
	public List<Product> selectclass(String classification);
	public List<Product> selectwhere(int max,int min) ;
	public Object count();
	public Object countwhere(int max,int min);
	public Object countbrand(String brand);
	public Object countspecies(String species);
	public Object countclass(String classification);
	public boolean login(String username, String password);
	public Product getById(int productID);
	

}
