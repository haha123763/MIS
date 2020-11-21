package com.itheima.ssm.service;

import com.itheima.ssm.domain.SoftWork;

import java.util.List;

public interface ISoftWorkService {
    List<SoftWork> findAllByPage(int page, int pageSize) throws Exception;
    List<SoftWork> selectByTerms(int page, int pageSize, SoftWork softWork) throws Exception;
    void save(SoftWork softWork) throws Exception;
    void deleteById(String id) throws  Exception;
    SoftWork findById(String id) throws Exception;
    void update(SoftWork softWork) throws  Exception;
    void deleteSelect(String[] ids) throws Exception;
}
