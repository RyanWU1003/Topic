package tw.iii.model;

import java.util.List;

import org.springframework.stereotype.Component;


public class TradingDetailForm {
	
	private List<TradingDetail> detailForm;

	public List<TradingDetail> getDetailForm() {
		return detailForm;
	}

	public void setDetailForm(List<TradingDetail> detailForm) {
		this.detailForm = detailForm;
	}
}
