package com.itheima.ssm.dao;

import com.itheima.ssm.domain.SoftWork;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ISoftWorkDao {
//    @Insert("insert into softwork(id,name,status,authDate,applyDate,number,applicant,rank,scanFile) values(#{id},#{name},#{status},#{authDate},#{applyDate},#{number},#{applicant},#{rank},#{scanFile})")
    void save(SoftWork softwork) throws Exception;

//    @Select("select * from softwork where id=#{id}")
    SoftWork findById(String id) throws Exception;

//    @Delete("delete from softwork where id=#{id}")
    void  deleteById(String id) throws Exception;

//    @Update("update softwork set name=#{name},status=#{status},number=#{number},applicant=#{applicant},rank=#{rank} where id=#{id}")

    void update(SoftWork softwork) throws  Exception;

//    @Select("select * from softwork")
    List<SoftWork> findAllByPage();

//    @Select(" select * from softwork where 1=1 and name like '%${name}%' and applicant like '%${applicant}%' and status like '%${status}%'")
    List<SoftWork> selectByTerms(SoftWork softwork);
}
