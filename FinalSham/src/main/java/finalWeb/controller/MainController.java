package finalWeb.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import finalWeb.dao.MainDao;

@Controller
public class MainController {

	@Autowired
	private MainDao mainDao;

	@RequestMapping(value = "/main.do")
	public String mainTiles(ModelMap model) throws Exception {

		List<Map> mainList = mainDao.selectMainList();
		List<Map> sliderList = mainDao.selectSliderList();

		model.addAttribute("mainList", mainList);
		model.addAttribute("sliderList", sliderList);
		return "content/main";
	}

	@RequestMapping(value = "/location.do")
	public String location(ModelMap model) throws Exception {

		return "content/location";
	}

	@RequestMapping(value = "/banner.do")
	public String banner(ModelMap model) throws Exception {

		List<Map> sliderList = mainDao.selectSliderList();

		model.addAttribute("sliderList", sliderList);

		return "content/banner";
	}

	@RequestMapping(value = "/bannerSubmit.do")
	public String bannerSubmit(ModelMap model, String[] sliderVar, @RequestParam(value="photo",required=false) MultipartFile photo)
			throws Exception {
		ArrayList<String> list = new ArrayList<String>();
		ArrayList photoList = new ArrayList();

		if (sliderVar.length != 0) {
			for (int i = 0; i < sliderVar.length; i++) {
				list.add(sliderVar[i]);
			}

			int sliderDelete = mainDao.deleteSliderAll();
			mainDao.insertSliderAll(list);
		}
		if(photo != null){
			
		String originalFilename = photo.getOriginalFilename();
		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		String extension = originalFilename.substring(originalFilename.indexOf("."));
		String fullPath = "C:\\Users\\user2\\Documents\\workspace-sts-3.8.2.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FinalSham\\build\\img\\slider" + "\\" + onlyFileName
				+ extension;

		// ���Ѱ��� ��������ִ� �ڵ�
		if (!photo.isEmpty()) {
			try {
				File file = new File(fullPath);
				photo.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mainDao.insertSlider("build/img/slider/"+onlyFileName + extension);
		}
		return "redirect:/banner.do";
	}

}
