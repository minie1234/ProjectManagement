package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    @RequestMapping(value="/post",method=RequestMethod.POST)
    public String write(@ModelAttribute("ProjectVO") ProjectVO project, MultipartHttpServletRequest request) throws Exception{
 
		MultipartFile report = request.getFile("report");
		String ff= report.getOriginalFilename();		
		String fileName = ff.substring(ff.lastIndexOf('\\')+1);
		
		File file = new File("c:\\Users\\ss\\Desktop\\upload\\"+fileName);
		
		try {
            report.transferTo(file);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        projectMapper.fileInsert(project);
        
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

	
}
