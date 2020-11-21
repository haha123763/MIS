package com.itheima.ssm.dao;

import com.itheima.ssm.domain.Project;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IProjectDao {
//    @Insert("insert into project(id,number,name,startDate,endDate,leader,rank,category,source,level,type,totalFund,receivedFund,scanFile) values(#{id},#{number},#{name},#{startDate},#{endDate},#{leader},#{rank},#{category},#{source},#{level},#{type},#{totalFund},#{receivedFund},#{scanFile})")

    void save(Project project) throws Exception;

//    @Select("select * from project where id=#{id}")
    Project findById(String id) throws Exception;

//    @Delete("delete from project where id=#{id}")
    void  deleteById(String id) throws Exception;

//    @Update("update project set number=#{number},name=#{name},startDate=#{startDate},endDate=#{endDate},leader=#{leader},rank=#{rank},category=#{category},source=#{source},level=#{level},type=#{type},totalFund=#{totalFund},receivedFund=#{receivedFund},scanFile=#{scanFile} where id=#{id}")
    void update(Project project) throws  Exception;

//    @Select("select * from project")
    List<Project> findAllByPage();

//    @Select(" select * from project where 1=1 and category like '%${category}%' and name like '%${name}%' and leader like '%${leader}%' and source like '%${source}%'")
    List<Project> selectByTerms(Project project);
}
