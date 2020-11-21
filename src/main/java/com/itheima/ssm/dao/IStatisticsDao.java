package com.itheima.ssm.dao;

import com.itheima.ssm.domain.Paper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IStatisticsDao {

    @Select("select * from paper where id=#{id}")
    Paper findById(String id) throws Exception;

    @Select("select * from paper")
    List<Paper> findAllByPage();

    @Select(" select * from paper where 1=1 and authors like '%${authors}%' and year like '%${year}%' and category like '%${category}%' and inclusion like '%${inclusion}%' and title like '%${title}%'")
    List<Paper> selectByTerms(Paper paper);
}
