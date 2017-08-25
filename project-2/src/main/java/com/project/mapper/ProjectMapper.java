package com.project.mapper;

import java.util.List;

import com.project.domain.ProjectVO;

public interface ProjectMapper {

	// 글작성
	public void ProjectInsert(ProjectVO project) throws Exception;

	// 글목록
	public List<ProjectVO> ProjectList() throws Exception; // 추가
	
	
	//파일 글작성
    public void fileInsert(ProjectVO project)throws Exception;
    
    //파일 글목록
    public List<ProjectVO> FileList()throws Exception;
    
    //파일 글 상세보기
    public ProjectVO fileView(int fileNo)throws Exception;

}
