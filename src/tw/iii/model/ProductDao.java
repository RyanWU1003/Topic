package tw.iii.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("productDao")
public class ProductDao implements IproductDao {

	@Autowired
	private SessionFactory sessionfactory;

	public ProductDao(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}

	
	@Override
	public Product insert(Product PD) {
		Session session = sessionfactory.getCurrentSession();
		Product product = session.get(Product.class, PD.getProductID());

		if (product == null) {

			session.save(PD);
			System.out.println("Add Success !!");
			return PD;
		}
		return null;
	}

	@Override
	public boolean delete(int productID) {
		Session session = sessionfactory.getCurrentSession();
		Product product = session.get(Product.class, productID);

		if (product != null) {
			session.delete(product);
			return true;
		}
		return false;
	}


	@Override
	public Product update(int productID, String productName, int stock, int price, String species,
			String classification, String brand, String descripton, String img) {
		Session session = sessionfactory.getCurrentSession();
		Product product = session.get(Product.class, productID);

		if (product != null) {
			product.setProductName(productName);
			product.setPrice(price);
			product.setClassification(classification);
			session.save(product);

		}
		return product;
	}

	@Override
	public Product select(int productID) {
		Session session = sessionfactory.getCurrentSession();
		Product product = session.get(Product.class, productID);
		return product;
	}
	
	
	@Override
	public List<Product> selectAll() {
		Session session = sessionfactory.getCurrentSession();
		Query<Product> query = session.createQuery("from Product", Product.class);
		return query.list();
	}

	@Override
	public List<Product> selectbrand(String brand) {
		Session session=sessionfactory.getCurrentSession();
		Query<Product> query = session.createQuery("from Product where  brand like ?1",Product.class);
		query.setParameter(1,brand);
		return query.list();
	}

	@Override
	public List<Product> selectspecies(String species) {
		Session session=sessionfactory.getCurrentSession();
		Query<Product> query = session.createQuery("from Product where species like ?1",Product.class);
		query.setParameter(1,species);
		return query.list();
	}
	
	public List<Product> selectid(int productID){
		Session session=sessionfactory.getCurrentSession();
		Query<Product> query = session.createQuery("from Product where productID like ?1",Product.class);
		query.setParameter(1,productID);
		return query.list();
	}

	@Override
	public List<Product> selectclass(String classification) {
		Session session=sessionfactory.getCurrentSession();
		Query<Product> query = session.createQuery("from Product where classification like ?1",Product.class);
		query.setParameter(1,classification);
		return query.list();
	}

	@Override
	public List<Product> selectwhere(int max, int min) {
		Session session = sessionfactory.getCurrentSession();
		Query<Product> query = session.createQuery("from Product where price between :xxx and :ooo", Product.class);
		query.setParameter("xxx", min);
		query.setParameter("ooo", max);
		return query.list();
	}

	@Override
	public Object count() {
		Session session = sessionfactory.getCurrentSession();
		String hql = "select count(*) from Product";
		Object count = session.createQuery(hql).uniqueResult(); // uniqueResult()方法返回Object型別

		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Object countwhere(int max, int min) {
		Session session=sessionfactory.getCurrentSession();
		Query<Object> query =session.createQuery("select count(*) from Product where price between :xxx and :ooo");
		query.setParameter("xxx",min);
		query.setParameter("ooo",max);
		Object count2  = query.uniqueResult();
		return count2;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Object countbrand(String brand) {
		Session session=sessionfactory.getCurrentSession();
		Query<Object> query =session.createQuery("select count(*)  from Product where  brand like ?1");
		query.setParameter(1,brand);	
		Object count3  = query.uniqueResult();
		return count3;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Object countspecies(String species) {
		Session session=sessionfactory.getCurrentSession();
		Query<Object> query =session.createQuery("select count(*)  from Product where  species like ?1");
		query.setParameter(1,species);	
		Object count4  = query.uniqueResult();
		return count4;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Object countclass(String classification) {
		Session session=sessionfactory.getCurrentSession();
		Query<Object> query =session.createQuery("select count(*)  from Product where  classification like ?1");
		query.setParameter(1,classification);	
		Object count5  = query.uniqueResult();
		return count5;
	}



	@Override
	public boolean login(String username, String password) {
		Session session=sessionfactory.getCurrentSession();
		Query<Object> query = session.createQuery("from Users where userName=?1 and userPassword=?2");		
		query.setParameter(1, username);
		query.setParameter(2, password);
		
		return query.list().isEmpty()?false:true;
		
	}
	
	public Product getById(int productID) {
		Session session=sessionfactory.getCurrentSession();
		Product product =session.get(Product.class,productID);
		return product;
	}

}
