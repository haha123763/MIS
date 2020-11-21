package com.itheima.ssm.service;

import com.itheima.ssm.domain.Paper;

import java.util.List;

public interface IAllService {
    List<Paper> findAllByPage(int page, int pageSize) throws Exception;
    List<Paper> selectByTerms(int page, int pageSize, Paper paper) throws Exception;
    void save(Paper Paper) throws Exception;
    void deleteById(String id) throws  Exception;
    Paper findById(String id) throws Exception;
}
