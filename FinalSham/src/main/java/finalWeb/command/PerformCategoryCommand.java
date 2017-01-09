package finalWeb.command;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {"style", "price", "performDate", "designer"})
public class PerformCategoryCommand {
	
	private String designer;
	private int performNo;
	private String performDate;
	private String style;
	private int price;
	private String id;
	
	public String getDesigner() {
		return designer;
	}
	public void setDesigner(String designer) {
		this.designer = designer;
	}
	public int getPerformNo() {
		return performNo;
	}
	public void setPerformNo(int performNo) {
		this.performNo = performNo;
	}
	public String getPerformDate() {
		return performDate;
	}
	public void setPerformDate(String performDate) {
		this.performDate = performDate;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
