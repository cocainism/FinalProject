package finalWeb.command;

public class ItemListCommand {

	private String itemType;

	public String getItemType() {
		return itemType;
	}
	public void setItemType(String itemType) {
		this.itemType = itemType;
	}
	
	@Override
	public String toString() {
		return itemType;
	}
	
	
}
