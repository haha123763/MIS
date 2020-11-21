package com.itheima.ssm.service;

import com.itheima.ssm.domain.Patent;

import java.util.List;

public interface IPatentService {
    List<Patent> findAllByPage(int page, int pageSize) throws Exception;
    List<Patent> selectByTerms(int page, int pageSize, Patent patent) throws Exception;
    void save(Patent Patent) throws Exception;
    void deleteById(String id) throws  Exception;
    Patent findById(String id) throws Exception;
    void update(Patent patent) throws  Exception;
    void deleteSelect(String[] ids) throws Exception;
}
