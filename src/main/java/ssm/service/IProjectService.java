package ssm.service;

import ssm.domain.Project;

import java.util.List;

public interface IProjectService {
    List<Project> findAllByPage(int page, int pageSize) throws Exception;
    List<Project> selectByTerms(int page, int pageSize, Project project) throws Exception;
    void save(Project Project) throws Exception;
    void deleteById(String id) throws  Exception;
    Project findById(String id) throws Exception;
    void update(Project project) throws  Exception;
    void deleteSelect(String[] ids) throws Exception;
}
