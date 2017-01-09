package finalWeb.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import finalWeb.command.PhotoCommand;
import finalWeb.command.ShopInfoCommand;
import finalWeb.dao.ShopInfoDao;

@Controller
public class ShopInfoController {

	@Autowired
	private ShopInfoDao shopInfoDao;

	@RequestMapping(value = "/shopInfoSubmit.do")
	public String shopInfoSubmit(ModelMap model, @RequestParam("ir1") String ir1, ShopInfoCommand shopInfoCommand)
			throws Exception {
		shopInfoCommand.setShopInfo(ir1);

		shopInfoDao.deleteShopInfo();
		shopInfoDao.insertshopInfo(shopInfoCommand);

		model.addAttribute("shopInfoCommand", shopInfoCommand);
		return "redirect:/shopInfo.do";
	}

	@RequestMapping("/shopInfoUpdate.do")
	public String shopInfoUpdate(ModelMap model, ShopInfoCommand shopInfoCommand) {
		@SuppressWarnings("rawtypes")
		List<Map> shopInfoList = shopInfoDao.selectshopInfoList();

		model.addAttribute("shopInfoList", shopInfoList);

		return "content/SmartEditor2";
	}

	@RequestMapping("/shopInfo.do")
	public String shopInfo(ModelMap model, ShopInfoCommand shopInfoCommand) {
		@SuppressWarnings("rawtypes")
		List<Map> shopInfoList = shopInfoDao.selectshopInfoList();

		model.addAttribute("shopInfoList", shopInfoList);
		return "content/shopInfo";
	}

	@RequestMapping("/skin.do")
	public String skin(HttpSession session) {
		return "content/shop/SmartEditor2Skin";
	}

	@RequestMapping("/smart_editor2_inputarea.do")
	public String smart_editor2_inputarea(HttpSession session) {
		return "content/shop/smart_editor2_inputarea";
	}

	@RequestMapping("/smart_editor2_inputarea_ie8.do")
	public String smart_editor2_inputarea_ie8(HttpSession session) {
		return "content/shop/smart_editor2_inputarea_ie8";
	}

	@RequestMapping("/photo_uploader.do")
	public String photo_uploader(HttpSession session) {
		return "content/popup/photo_uploader";
	}

	@RequestMapping("/submit.do")
	public void submit(HttpServletRequest request) {
		System.out.println("에디터 컨텐츠값:" + request.getParameter("editor"));
	}

	@RequestMapping("/photoUpload")
	public String photoUpload(HttpServletRequest request, PhotoCommand photoCommand) {
		String callback = photoCommand.getCallback();
		String callback_func = photoCommand.getCallback_func();
		String file_result = "";
		try {
			if (photoCommand.getFiledata() != null && photoCommand.getFiledata().getOriginalFilename() != null
					&& !photoCommand.getFiledata().getOriginalFilename().equals("")) {
				// 파일이 존재하면
				String original_name = photoCommand.getFiledata().getOriginalFilename();
				String ext = original_name.substring(original_name.lastIndexOf(".") + 1);
				// 파일 기본경로
				String defaultPath = request.getSession().getServletContext().getRealPath("/");
				// 파일 기본경로 _ 상세경로
				String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator;
				File file = new File(path);
				System.out.println("path:" + path);
				// 디렉토리 존재하지 않을경우 디렉토리 생성
				if (!file.exists()) {
					file.mkdirs();
				}
				// 서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
				String realname = UUID.randomUUID().toString() + "." + ext;
				///////////////// 서버에 파일쓰기 /////////////////
				photoCommand.getFiledata().transferTo(new File(path + realname));
				file_result += "&bNewLine=true&sFileName=" + original_name + "&sFileURL=/resource/photo_upload/"
						+ realname;
			} else {
				file_result += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:" + callback + "?callback_func=" + callback_func + file_result;
	}

	// 다중파일업로드
	@RequestMapping("/multiplePhotoUpload.do")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 파일정보
			String sFileInfo = "";
			// 파일명을 받는다 - 일반 원본파일명
			String filename = request.getHeader("file-name");
			// 파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
			// 확장자를소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			// 파일 기본경로
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			// 파일 기본경로 _ 상세경로
			String filePath = dftFilePath + "resource" + File.separator + "photo_upload" + File.separator;
			File file = new File(filePath);
			if (!file.exists()) {
				file.mkdirs();
			}
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;
			///////////////// 서버에 파일쓰기 /////////////////
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			if (is != null) {
				is.close();
			}
			os.flush();
			os.close();
			///////////////// 서버에 파일쓰기 /////////////////
			// 정보 출력
			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName=" + filename;
			;
			sFileInfo += "&sFileURL=" + "/resource/photo_upload/" + realFileNm;
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}