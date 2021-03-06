package com.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.domain.ProjectVO;
import com.project.mapper.ProjectMapper;

@Controller
@RequestMapping("/file")
public class FileController {
	@Autowired
    private ProjectMapper projectMapper;
    
	@RequestMapping(method=RequestMethod.GET)
	 public ModelAndView file() throws Exception{
        List<ProjectVO> file = projectMapper.fileList();
        return new ModelAndView("file","list",file);
    }
	
	//게시글 작성 페이지(GET)    
    @RequestMapping(value="/post",method=RequestMethod.GET)
    public ModelAndView writeForm() throws Exception{
        
        return new ModelAndView("fileWrite");
    }
    
    //게시글 작성(POST)
    @RequestMapping(value="/post", method=RequestMethod.POST)
    public String write2(@RequestParam("fileName") String fileName, @RequestParam("fileWriter") String fileWriter, 
    		MultipartHttpServletRequest request) throws Exception{
    	
    	ProjectVO project = new ProjectVO();
    	project.setFileName(fileName);
    	project.setFileWriter(fileWriter);
    	
    	MultipartFile multi = request.getFile("report");
		
		String f = multi.getName();
		String multifile = multi.getOriginalFilename();
		
		if (multifile.equals("")) {
			 projectMapper.fileInsert(project);
			 
		    } else {
		    	String report = multifile.substring(multifile.lastIndexOf('\\')+1); 
		    	System.out.println(report);
		    	
		    	project.setReport(report);
		    	
		    	String folder = "c:\\upload\\";	
				File dir = new File(folder);
				if (!dir.isDirectory()) {
		            dir.mkdirs();
		        }
				
				File file = new File("c:\\upload\\" + report);
				multi.transferTo(file);

		        projectMapper.fileInsert(project);
		    }
		
    	
    	
    	return "redirect:/file";
    }
    
    
    
    
  //게시글 상세
    @RequestMapping(value="/{fileNo}",method=RequestMethod.GET)
    public ModelAndView view(@PathVariable("fileNo") int fileNo) throws Exception{
        
        ProjectVO project = projectMapper.fileView(fileNo);
        
        return new ModelAndView("fileView","file",project);
    }
    
    
  //게시글 수정 페이지(GET)
    @RequestMapping(value="/post/{fileNo}", method=RequestMethod.GET)
    public ModelAndView updateForm(@PathVariable("fileNo") int fileNo) throws Exception{
            
        ProjectVO project = projectMapper.fileView(fileNo);
        
        return new ModelAndView("fileUpdate","file",project);
    }
        
    //게시글 수정(PATCH)
    @RequestMapping(value="/post/{fileNo}", method=RequestMethod.PATCH)
    public String update(@ModelAttribute("ProjectVO")ProjectVO project,@PathVariable("fileNo") int fileNo) throws Exception{
            
    	projectMapper.fileUpdate(project);
            
        return "redirect:/file/"+ fileNo;
    }
    //게시글 삭제(DELETE)
    @RequestMapping(value="/post/{fileNo}", method=RequestMethod.DELETE)
    public String delete(@PathVariable("fileNo") int fileNo) throws Exception{
            
    	projectMapper.fileDelete(fileNo);
            
        return "redirect:/file";
    }

    @RequestMapping(value="/down.do", method=RequestMethod.GET)
	public void downloadCSV(HttpServletResponse response, HttpServletRequest request) throws IOException {
    	
    	File downloadFile = new File("c:\\upload\\" + request.getParameter("report"));
    	ProjectVO project = new ProjectVO();    	
    	
		response.setContentType("text/csv");
		String reportName = "CSV_Report_Name.csv";
		response.setHeader("Content-disposition", "attachment;filename="+reportName);
		
		String fileName = null;
		fileName = new String(downloadFile.getName().getBytes("utf-8"));
		response.setHeader("Content-Disposition", "attachment; filename=\""
                + fileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        OutputStream out = response.getOutputStream();
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(downloadFile);
            FileCopyUtils.copy(fis, out); // 스프링 클래스.
        } finally {
            if (fis != null)
                try {
                    fis.close();
                } catch (IOException ex) {
                }
        }
        out.flush();
    }
    
	
}
