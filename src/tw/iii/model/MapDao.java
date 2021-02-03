package tw.iii.model;

import java.util.List;
import java.util.Map;
import java.util.concurrent.Future;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Repository;

@Repository("mapdao")
public class MapDao {

	@Autowired
	private SessionFactory sessionfactory;
	
	public MapDao(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}


	public List<GoogleMap> selectAllpage(int page) {
		Session session=sessionfactory.getCurrentSession();
		Query<GoogleMap> query = session.createQuery("from GoogleMap", GoogleMap.class);		
		query.setFirstResult(page);
		query.setMaxResults(5);
		List<GoogleMap> list = query.list();
		return list;
		
	}
	
	public List<GoogleMap> selectcitypage(String city,int page) {
		Session session=sessionfactory.getCurrentSession();
		Query<GoogleMap> query = session.createQuery("from GoogleMap where city like ?1",GoogleMap.class);
		query.setParameter(1,city);
		query.setFirstResult(page);
		query.setMaxResults(5);
		List<GoogleMap> list = query.list();
		return list;
		
	}
	
	
	public List<GoogleMap> selectAll() {
		Session session=sessionfactory.getCurrentSession();
		Query<GoogleMap> query = session.createQuery("from GoogleMap", GoogleMap.class);	
		
		List<GoogleMap> list = query.list();
		return list;
		
	}
	
	public List<GoogleMap> selectcity(String city) {
		Session session=sessionfactory.getCurrentSession();
		Query<GoogleMap> query = session.createQuery("from GoogleMap where city like ?1",GoogleMap.class);
		query.setParameter(1,city);
		
		List<GoogleMap> list = query.list();
		return list;
		
	}
	
	public Long mapclasscount(String city) {
		Session session=sessionfactory.getCurrentSession();
		Query<Long> query = session.createQuery(" select count(*) from GoogleMap where city = ?1");
		query.setParameter(1,city);
		Long forumcount = query.uniqueResult();
		return forumcount;
	}
	
	public Long mapcount() {
		Session session=sessionfactory.getCurrentSession();
		Query<Long> query = session.createQuery(" select count(*) from GoogleMap");		
		Long forumcount = query.uniqueResult();
		return forumcount;
	}
	

	
	
//	@Async
//	public  Future<GoogleMap> select(int id) {
//		Session session=sessionfactory.getCurrentSession();
//		GoogleMap map = session.get(GoogleMap.class,id);	
//		return new AsyncResult<GoogleMap>(map);
//	}
	

	public  GoogleMap select(int id) {
		Session session=sessionfactory.getCurrentSession();
		GoogleMap map = session.get(GoogleMap.class,id);	
		return map;
	}
}
