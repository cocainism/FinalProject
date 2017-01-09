package finalWeb.command;

//디자이너
public class DesignerCommand {
	private String designer;
	   private String designerPhoto;
	   private String spec;
	   private String favorite;
	   private String position;
	   private int designerNo;
	   
	public int getDesignerNo() {
		return designerNo;
	}
	public void setDesignerNo(int designerNo) {
		this.designerNo = designerNo;
	}
	public String getDesigner() {
		return designer;
	}
	public void setDesigner(String designer) {
		this.designer = designer;
	}
	public String getDesignerPhoto() {
		return designerPhoto;
	}
	public void setDesignerPhoto(String designerPhoto) {
		this.designerPhoto = designerPhoto;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public String getFavorite() {
		return favorite;
	}
	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}

}
