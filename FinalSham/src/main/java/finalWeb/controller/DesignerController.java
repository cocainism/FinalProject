package finalWeb.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import finalWeb.command.DesignerCommand;
import finalWeb.dao.DesignerDao;

@Controller
public class DesignerController {

	@Autowired
	private DesignerDao designerDao;

	@RequestMapping(value = "/designer.do")
	public String designer(ModelMap model) throws Exception {

		List<Map> designerList = designerDao.selectDesignerList();

		model.addAttribute("designerList", designerList);

		System.out.println(designerList);
		return "content/designer";
	}

	@RequestMapping(value = "/addDesignerForm.do")
	public String addDesignerForm(ModelMap model) throws Exception {

		return "content/addDesignerForm";
	}

	@RequestMapping(value = "/addDesigner.do")
	public String addDesigner(DesignerCommand designerCommand,
			@RequestParam(value = "photo", required = false) MultipartFile photo) throws Exception {

		String originalFilename = photo.getOriginalFilename();
		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		String extension = originalFilename.substring(originalFilename.indexOf("."));
		String fullPath = "C:\\Users\\user2\\Documents\\workspace-sts-3.8.2.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FinalSham\\build\\img\\designer"
				+ "\\" + onlyFileName + extension;

		if (!photo.isEmpty()) {
			try {
				File file = new File(fullPath);
				System.out.println("file::::" + file);
				photo.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		designerCommand.setDesignerPhoto("build/img/designer/" + onlyFileName + extension);
		designerDao.insertDesigner(designerCommand);
		return "redirect:/designer.do";
	}

	@RequestMapping(value = "/designerSubmit.do")
	public String designerSubmit(DesignerCommand designerCommand) throws Exception {

		designerDao.deleteDesignerAll();
		designerDao.insertDesignerAll(designerCommand);

		return "redirect:/designer.do";
	}

	@RequestMapping(value = "/updateDesignerForm.do")
	public String updateDesignerForm(DesignerCommand designerCommand, Model model) throws Exception {
		model.addAttribute("designerInfo", designerDao.selectDesigner(designerCommand));
		return "content/updateDesignerForm";
	}

	@RequestMapping("photoUpdateDesigner.do")
	public String photoUpdateDesigner(HttpServletRequest request, @RequestParam("photo") MultipartFile photo,
			DesignerCommand designerCommand) {

		String originalFilename = photo.getOriginalFilename();
		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf("."));
		String extension = originalFilename.substring(originalFilename.indexOf("."));
		String fullPath = "C:\\Users\\user2\\Documents\\workspace-sts-3.8.2.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FinalSham\\build\\img\\designer" + "\\" + onlyFileName
				+ extension;

		designerCommand.setDesignerPhoto("build/img/designer/" + onlyFileName + extension);

		designerDao.photoUpdateDesigner(designerCommand);

		if (!photo.isEmpty()) {
			try {
				File file = new File(fullPath);
				photo.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/designer.do";
	}

	@RequestMapping(value = "/deleteDesigner.do")
	public String deleteDesigner(int designerNo) throws Exception {
		designerDao.deleteDesigner(designerNo);
		return "redirect:/designer.do";
	}

	@RequestMapping("updateDesigner.do")
	public String updateDesigner(DesignerCommand designerCommand) {
		designerDao.updateDesigner(designerCommand);
		return "redirect:/designer.do";
	}
}
