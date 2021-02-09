package tw.iii.model;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TradingDao {
	@Autowired
	private SessionFactory sessionfactory;

	public TradingDao(SessionFactory sessionfactory) {
		this.sessionfactory=sessionfactory;
	}
	
	//全部訂單資料
	public List<TradingRecord> getAllRecord(){
		Session session =sessionfactory.getCurrentSession();
		Query<TradingRecord> query =session.createQuery("from TradingRecord",TradingRecord.class);
		return query.list();
	}
	
	//帳號查詢訂單
	public List<TradingRecord> getRecordbyAccount(String account){
		Session session =sessionfactory.getCurrentSession();
		Query<TradingRecord> query =session.createQuery("from TradingRecord where account =?1",TradingRecord.class);
		query.setParameter(1, account);
		return query.list();
	}
	
	
	//訂單號查詢訂單
	public TradingRecord getRecordbyId(int id){
		Session session =sessionfactory.getCurrentSession();
		Query<TradingRecord> query =session.createQuery("from TradingRecord where id =?1",TradingRecord.class);
		query.setParameter(1, id);
		return query.list().get(0);
	}
	
	//用狀態查詢訂單
	public List<TradingRecord> getRecordbyStatus(String status){
		Session session =sessionfactory.getCurrentSession();
		Query<TradingRecord> query =session.createQuery("from TradingRecord where status =?1",TradingRecord.class);
		query.setParameter(1, status);
		return query.list();
	}
	
	//日期查詢訂單
	public List<TradingRecord> getRecordbyDate(Date date1,Date date2){
		Session session =sessionfactory.getCurrentSession();
		Query<TradingRecord> query =session.createQuery("from TradingRecord where date between ?1 and ?2",TradingRecord.class);
		query.setParameter(1, date1);
		query.setParameter(2, date2);
		return query.list();
	}
	//地址查詢訂單
	public List<TradingRecord> getRecordbyAdd(String address){
		Session session =sessionfactory.getCurrentSession();
		Query<TradingRecord> query =session.createQuery("from TradingRecord where address like ?1",TradingRecord.class);
		query.setParameter(1, '%'+address+'%');
		return query.list();
	}
	//電話查訂單
	public List<TradingRecord> getRecordbyTel(String tel){
		Session session =sessionfactory.getCurrentSession();
		Query<TradingRecord> query =session.createQuery("from TradingRecord where tel  =?1",TradingRecord.class);
		query.setParameter(1, tel);
		return query.list();
	}
	
	public Integer latestId(String account) {
		Session session =sessionfactory.getCurrentSession();
		Query<Integer> query=session.createQuery("select max(id) from TradingRecord where account =?1");
		query.setParameter(1, account);
		Integer max=query.uniqueResult();
		return max;
	}
	
	//細項查詢
	public List<TradingDetail> getDetail(int id){
		Session session =sessionfactory.getCurrentSession();
		Query<TradingDetail> query=session.createQuery("from TradingDetail where copyid =?2",TradingDetail.class);
		query.setParameter(2, id);
		return query.list();
		
	}
	
	
	
	//刪除訂單+細項
	public void delTradingRecord(int id) {
		Session session =sessionfactory.getCurrentSession();
		TradingRecord tbean=session.get(TradingRecord.class, id);
		if(tbean!=null) {
			session.delete(tbean);
			
		}
		
	}
	
	

	

	
	

}
