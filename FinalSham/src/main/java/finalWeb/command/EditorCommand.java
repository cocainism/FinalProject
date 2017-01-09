package finalWeb.command;

import org.springframework.web.multipart.MultipartFile;

public class EditorCommand {

	private MultipartFile Filedata;

	public MultipartFile getFiledata() {
		return Filedata;
	}

	public void setFiledata(MultipartFile filedata) {
		Filedata = filedata;
	}

}
