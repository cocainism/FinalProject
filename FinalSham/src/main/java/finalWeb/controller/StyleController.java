package finalWeb.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import finalWeb.command.StyleCommand;
import finalWeb.dao.StyleDao;


@Controller
public class StyleController {

	@Autowired
	private StyleDao styleDao;

	public void setStyleDao(StyleDao styleDao) {
		this.styleDao = styleDao;
	}

	@ModelAttribute("style")
	public StyleCommand interceptor() {
		return new StyleCommand();
	}

	@RequestMapping("/mTotalList.do")
	public ModelAndView mtotalList() {

		ModelAndView mav = new ModelAndView("style/mTotalList", "style", styleDao.getStyle());
		return mav;
	}

	@RequestMapping("/mCutList.do")
	public ModelAndView cutList() {
		
		ModelAndView mav = new ModelAndView("style/mCutList", "style", styleDao.getStyle());
		return mav;
	}
	
	@RequestMapping("/mPermList.do")
	public ModelAndView permList() {
		
		ModelAndView mav = new ModelAndView("style/mPermList", "style", styleDao.getStyle());
		return mav;
	}
	
	@RequestMapping("/mColorList.do")
	public ModelAndView colorList() {
		
		ModelAndView mav = new ModelAndView("style/mColorList", "style", styleDao.getStyle());
		return mav;
	}
	
	@RequestMapping("/wTotalList.do")
	public ModelAndView wtotalList() {
		
		ModelAndView mav = new ModelAndView("style/wTotalList", "style", styleDao.getStyle());
		return mav;
	}
	
	@RequestMapping("/wLongList.do")
	public ModelAndView longList() {
		
		ModelAndView mav = new ModelAndView("style/wLongList", "style", styleDao.getStyle());
		return mav;
	}
	
	@RequestMapping("/wMediumList.do")
	public ModelAndView mediumList() {
		
		ModelAndView mav = new ModelAndView("style/wMediumList", "style", styleDao.getStyle());
		return mav;
	}
	
	@RequestMapping("/wShortList.do")
	public ModelAndView shortList() {
		
		ModelAndView mav = new ModelAndView("style/wShortList", "style", styleDao.getStyle());
		return mav;
	}

	@RequestMapping(value = "/insertStyleForm.do", method = RequestMethod.GET)
	public String insertStyleForm(ModelMap model) {
		
		List<String> list = new ArrayList<String>();
		
		list = styleDao.getDesigner();
		
		model.addAttribute("designerList", list);
		
		return "style/insertStyleForm";
	}

	@RequestMapping(value = "/insertStylePro.do", method = RequestMethod.POST)
	public String insertStylePro(ModelMap model, @RequestParam("photo") MultipartFile photo,
			@RequestParam("photo2") List<MultipartFile> photo2, @RequestParam("video") List<String> video,
			@ModelAttribute("style") StyleCommand styleCommand) {

		// 대표사진
		String originalFilename = photo.getOriginalFilename();
		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		String extension = originalFilename.substring(originalFilename.indexOf(".")); // 확장자
		String fullPath = "C:\\Users\\user2\\git\\Sham\\FinalSham\\WebContent\\fileList" + "\\" + onlyFileName
				+ extension;
		String fullName = onlyFileName + extension;

		// 이 외의 사진
		List<String> originalFilename2 = new ArrayList<String>();
		List<String> onlyFileName2 = new ArrayList<String>();
		List<String> extension2 = new ArrayList<String>();
		List<String> fullPath2 = new ArrayList<String>();
		List<String> fullName2 = new ArrayList<String>();

		String setName = fullName + ",";

		for (int i = 0; i < photo2.size(); i++) {
			originalFilename2.add(photo2.get(i).getOriginalFilename());
		}

		for (int i = 0; i < originalFilename2.size(); i++) {
			onlyFileName2.add(originalFilename2.get(i).substring(0, originalFilename2.get(i).indexOf(".")));
			extension2.add(originalFilename2.get(i).substring(originalFilename2.get(i).indexOf(".")));
			fullPath2.add("C:\\Users\\user2\\git\\Sham\\FinalSham\\WebContent\\styleImages\\" + onlyFileName2.get(i)
					+ extension2.get(i));
			fullName2.add(onlyFileName2.get(i) + extension2.get(i));

			setName += fullName2.get(i) + ",";
		}

		styleCommand.setStylePhoto(setName);
		styleCommand.setFileCount(photo2.size() + 1);

		if (!photo.isEmpty()) {
			try {
				File file = new File(fullPath);
				photo.transferTo(file);// 경로로 보내기
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (!(photo2.size() == 0)) {
			try {
				for (int i = 0; i < photo2.size(); i++) {

					File file = new File(fullPath2.get(i));
					photo2.get(i).transferTo(file);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 영상
		String fullVideo = "";
		styleCommand.setVideoCount(video.size());

		for (int i = 0; i < video.size(); i++) {
			fullVideo += video.get(i) + ",";
		}

		styleCommand.setStyleVideo(fullVideo);

		styleDao.insertStyle(styleCommand);

		model.addAttribute("type", styleCommand.getStyleType());
		
		return "style/insertStylePro";
	}

	
	@RequestMapping(value = "/styleInfo.do", method = RequestMethod.GET)
	public String styleInfo(ModelMap model, String styleNum) {

		StyleCommand styleCommand = null;

		// ����
		styleCommand = styleDao.getStyleInfo(styleNum);

		String str = "";
		String photoList = ""; // ù��° ���� �� ����

		str = styleCommand.getStylePhoto(); // ���⼱ ��ü ���� ����
		photoList = str.substring(str.indexOf(",") + 1, str.length()); // ù��° ����
																		// �� ����

		str = str.substring(0, str.indexOf(",")); // ù��° ���� ���̸� ���ؼ� ����
		styleCommand.setStylePhoto(str); // ù��° �������̸� �ٽ� ��ü�� ����

		int photoCount = styleCommand.getFileCount() - 1;// ��ǥ����(ù��° ����) �� ������
															// ����

		List<String> photo = new ArrayList<String>();

		int x = 0;

		for (int i = 0; i < photoCount; i++) {

			photo.add(photoList.substring(x, photoList.indexOf(",")));

			x = photoList.indexOf(",") + 1;
			photoList = photoList.substring(x, photoList.length());
			x = 0;
		}

		// ������
		List<String> video = new ArrayList<String>();
		int videoCount = styleCommand.getVideoCount();
		String videoList = styleCommand.getStyleVideo();
		int y = 0;

		for (int i = 0; i < videoCount; i++) {
			video.add(videoList.substring(y, videoList.indexOf(",")));

			y = videoList.indexOf(",") + 1;
			videoList = videoList.substring(y, videoList.length());
			y = 0;
		}

		// if (video.get(0) == "") {
		// video.removeAll(video);
		// }
		// System.out.println("d"+video.get(0));
		// System.out.println(video.size());

		model.addAttribute("style", styleCommand);
		model.addAttribute("photoList", photo);
		model.addAttribute("videoList", video);

		return "style/styleInfo";
	}

	@RequestMapping(value = "/updateStyleForm.do", method = RequestMethod.GET)
	public String updateStyleForm(ModelMap model, String styleNum) {

		StyleCommand styleCommand = null;
		styleCommand = styleDao.getStyleInfo2(styleNum);

		String str = "";
		String photoList = "";

		photoList = styleCommand.getStylePhoto(); // ���⼱ ��ü ���� ����
		// photoList = str.substring(str.indexOf(",")+1, str.length());
		str = photoList.substring(0, photoList.indexOf(",")); // ù��° ���� ���̸� ���ؼ�
																// ����

		styleCommand.setStylePhoto(str); // ù��° �������̸� �ٽ� ��ü�� ����

		int photoCount = styleCommand.getFileCount();// ������ ����

		List<String> photo = new ArrayList<String>();

		int x = 0;

		for (int i = 0; i < photoCount; i++) {

			photo.add(photoList.substring(x, photoList.indexOf(",")));

			x = photoList.indexOf(",") + 1;
			photoList = photoList.substring(x, photoList.length());
			x = 0;
		}

		// // ������
		// List<String> video = new ArrayList<String>();
		// int videoCount = styleCommand.getVideoCount();// ���� ����
		// String videoList = styleCommand.getStyleVideo();// ���� ����
		// int y = 0;
		//
		// for (int i = 0; i < videoCount; i++) {
		// video.add(videoList.substring(y, videoList.indexOf(",")));
		//
		// y = videoList.indexOf(",") + 1;
		// videoList = videoList.substring(y, videoList.length());
		// y = 0;
		// }

		model.addAttribute("style", styleCommand);
		model.addAttribute("photoList", photo);
		// model.addAttribute("videoList", video);

		return "style/updateStyleForm";
	}

	@RequestMapping(value = "/updateStylePro.do", method = RequestMethod.POST)
	public String updateStylePro(ModelMap model, @RequestParam("photo") MultipartFile photo,
			@RequestParam("photo2") List<MultipartFile> photo2, @RequestParam("video") List<String> video,
			@RequestParam("strphoto") List<String> strphoto, @ModelAttribute("style") StyleCommand styleCommand) {

		// ��ǥ ����
		String originalFilename = photo.getOriginalFilename();
		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		String extension = originalFilename.substring(originalFilename.indexOf(".")); // Ȯ����
		String fullPath = "C:\\Users\\user2\\git\\Sham\\FinalSham\\WebContent\\fileList" + "\\" + onlyFileName
				+ extension;
		String fullName = onlyFileName + extension;

		// ������ ����
		List<String> originalFilename2 = new ArrayList<String>();
		List<String> onlyFileName2 = new ArrayList<String>();
		List<String> extension2 = new ArrayList<String>();
		List<String> fullPath2 = new ArrayList<String>();
		List<String> fullName2 = new ArrayList<String>();

		String setName = fullName + ",";

		for (int i = 0; i < photo2.size(); i++) {
			originalFilename2.add(photo2.get(i).getOriginalFilename());
		}

		for (int i = 0; i < originalFilename2.size(); i++) {
			onlyFileName2.add(originalFilename2.get(i).substring(0, originalFilename2.get(i).indexOf(".")));
			extension2.add(originalFilename2.get(i).substring(originalFilename2.get(i).indexOf(".")));
			fullPath2.add("C:\\Users\\user2\\git\\Sham\\FinalSham\\WebContent\\styleImages\\" + onlyFileName2.get(i)
					+ extension2.get(i));
			fullName2.add(onlyFileName2.get(i) + extension2.get(i));

			setName += fullName2.get(i) + ",";
		}


		if (!(strphoto.get(0).equals("strphoto"))) {

			styleCommand.setFileCount(photo2.size() + strphoto.size() + 1);

			for (int i = 0; i < strphoto.size(); i++) {
				setName += strphoto.get(i) + ",";
			}
		} else {
			styleCommand.setFileCount(photo2.size() + 1);
		}

		styleCommand.setStylePhoto(setName);

		if (!photo.isEmpty()) {
			try {
				File file = new File(fullPath);
				photo.transferTo(file);// �ش� ��η� �̵�~
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (!(photo2.size() == 0)) {
			try {
				for (int i = 0; i < photo2.size(); i++) {

					File file = new File(fullPath2.get(i));
					photo2.get(i).transferTo(file);// �ش� ��η� �̵�~
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// ������
		String fullVideo = "";
		styleCommand.setVideoCount(video.size());

		for (int i = 0; i < video.size(); i++) {
			fullVideo += video.get(i) + ",";
		}

		styleCommand.setStyleVideo(fullVideo);
		styleDao.updateStyle(styleCommand);

		model.addAttribute("type", styleCommand.getStyleType());

		return "style/updateStylePro";
	}

	@RequestMapping(value = "/deleteStyleForm.do", method = RequestMethod.GET)
	public String deleteStyleForm(ModelMap model, String styleNum, String styleType) {

		styleDao.deleteStyle(styleNum);
		
		model.addAttribute("type", styleType);

		return "style/deleteStyleForm";
	}
}