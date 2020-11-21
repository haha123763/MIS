package com.itheima.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.ssm.dao.IPatentDao;
import com.itheima.ssm.domain.Patent;
import com.itheima.ssm.service.IPatentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("patentService")
@Transactional
public class PatentServiceImpl implements IPatentService {
    @Autowired
    private IPatentDao patentDao;


    @Override
    public List<Patent> findAllByPage(int page, int pageSize) throws Exception {
        PageHelper.startPage(page, pageSize);
        return patentDao.findAllByPage();
    }

    @Override
    public List<Patent> selectByTerms(int page, int pageSize,Patent patent) throws Exception {
        PageHelper.startPage(page, pageSize);
        return patentDao.selectByTerms(patent);
    }

    @Override
    public void save(Patent patent) throws Exception {
        patentDao.save(patent);
    }

    @Override
    public void deleteById(String id) throws Exception {
        patentDao.deleteById(id);
    }

    @Override
    public Patent findById(String id) throws Exception {
        Patent patent=patentDao.findById(id);
        return patent;
    }

    @Override
    public void update(Patent patent) throws Exception {
        patentDao.update(patent);
    }

    @Override
    public void deleteSelect(String[] ids) throws Exception {
        if(ids!=null) {
            for (String id : ids) {
                patentDao.deleteById(id);
            }
        }
    }

}
