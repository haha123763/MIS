package ssm.service.impl;

import com.github.pagehelper.PageHelper;
import ssm.dao.IProjectDao;
import ssm.domain.Project;
import ssm.service.IProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("projectService")
@Transactional
public class ProjectServiceImpl implements IProjectService {
    @Autowired
    private IProjectDao projectDao;


    @Override
    public List<Project> findAllByPage(int page, int pageSize) throws Exception {
        PageHelper.startPage(page, pageSize);
        return projectDao.findAllByPage();
    }

    @Override
    public List<Project> selectByTerms(int page, int pageSize,Project project) throws Exception {
        PageHelper.startPage(page, pageSize);
        return projectDao.selectByTerms(project);
    }

    @Override
    public void save(Project project) throws Exception {
        projectDao.save(project);
    }

    @Override
    public void deleteById(String id) throws Exception {
        projectDao.deleteById(id);
    }

    @Override
    public Project findById(String id) throws Exception {
        Project project=projectDao.findById(id);
        return project;
    }

    @Override
    public void update(Project project) throws Exception {
        projectDao.update(project);
    }

    @Override
    public void deleteSelect(String[] ids) throws Exception {
        if(ids!=null) {
            for (String id : ids) {
                projectDao.deleteById(id);
            }
        }
    }

}
