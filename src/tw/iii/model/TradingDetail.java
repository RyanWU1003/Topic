package tw.iii.model;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Entity
@Table(name="tradingdetail")
@Component
public class TradingDetail {
	
	@EmbeddedId
	@Autowired
	private TradingDetailpk pk;
	
	@Column(name="productname")
	private String productname;
	@Column(name="price")
	private int price;
	@Column(name="qty")
	private int qty;
	@Column(name="copyid")
	private int copyid;

	public TradingDetail() {
		
	}
	

	public TradingDetail(String productname, int price, int qty,int copyid
			) {
		super();
		this.productname = productname;
		this.price = price;
		this.qty = qty;
		this.copyid=copyid;
	}




	public TradingDetail(TradingDetailpk pk, String productname, int price, int qty) {
		super();
		this.pk = pk;
		this.productname = productname;
		this.price = price;
		this.qty = qty;
		
	}


	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}


	public int getCopyid() {
		return copyid;
	}


	public void setCopyid(int copyid) {
		this.copyid = copyid;
	}



}
