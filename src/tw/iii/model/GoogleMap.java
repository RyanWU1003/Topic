package tw.iii.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="googlemap")
@Component
public class GoogleMap {
 
   @Id @Column(name="id")
   @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
   
   @Column(name="mapname")
	private String mapname;
   
   @Column(name="tel")
	private String tel;
   
   @Column(name = "dress")
	private String dress;
   
   @Column(name="lat")
	private BigDecimal lat;
   
   @Column(name="lng")
	private BigDecimal lng;
   
   @Column(name="city")
   private String city;
	
	
	
	public String getCity() {
	return city;
}


public void setCity(String city) {
	this.city = city;
}


	public GoogleMap() {
		
	}
	
	
  public GoogleMap(String mapname,String tel,String dress,BigDecimal lat,BigDecimal lng) {
		this.mapname=mapname;
		this.tel=tel;
		this.dress=dress;
		this.lat=lat;
		this.lng=lng;
	}


public int getId() {
	return id;
}


public void setId(int id) {
	this.id = id;
}


public String getMapname() {
	return mapname;
}


public void setMapname(String mapname) {
	this.mapname = mapname;
}


public String getTel() {
	return tel;
}


public void setTel(String tel) {
	this.tel = tel;
}


public String getDress() {
	return dress;
}


public void setDress(String dress) {
	this.dress = dress;
}


public BigDecimal getLat() {
	return lat;
}


public void setLat(BigDecimal lat) {
	this.lat = lat;
}


public BigDecimal getLng() {
	return lng;
}


public void setLng(BigDecimal lng) {
	this.lng = lng;
}

}
