package com.itheima.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.ssm.dao.ISoftWorkDao;
import com.itheima.ssm.domain.SoftWork;
import com.itheima.ssm.service.ISoftWorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("SoftworkService")
@Transactional
public class SoftWorkServiceImpl implements ISoftWorkService {
    @Autowired
    private ISoftWorkDao softworkDao;


    @Override
    public List<SoftWork> findAllByPage(int page, int pageSize) throws Exception {
        PageHelper.startPage(page, pageSize);
        return softworkDao.findAllByPage();
    }

    @Override
    public List<SoftWork> selectByTerms(int page, int pageSize, SoftWork softWork) throws Exception {
        PageHelper.startPage(page, pageSize);
        return softworkDao.selectByTerms(softWork);
    }

    @Override
    public void save(SoftWork softWork) throws Exception {
        softworkDao.save(softWork);
    }

    @Override
    public void deleteById(String id) throws Exception {
        softworkDao.deleteById(id);
    }

    @Override
    public SoftWork findById(String id) throws Exception {
        SoftWork softWork=softworkDao.findById(id);
        return softWork;
    }

    @Override
    public void update(SoftWork softWork) throws Exception {
        softworkDao.update(softWork);
    }


    @Override
    public void deleteSelect(String[] ids) throws Exception {
        if(ids!=null) {
            for (String id : ids) {
                softworkDao.deleteById(id);
            }
        }
    }

}
