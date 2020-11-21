package com.itheima.ssm.dao;

import com.itheima.ssm.domain.Paper;
import com.itheima.ssm.domain.Patent;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Date;
import java.util.List;

public interface IPatentDao {

//    @Insert("insert into patent(id,name,appnum,type,approvalDate,applicationDate,checkDate,status,certnum,patentee,rank) values(#{id},#{name},#{appnum},#{type},#{approvalDate},#{applicationDate},#{checkDate},#{status},#{certnum},#{patentee},#{rank})")
    void save(Patent patent) throws Exception;

//    @Select("select * from patent where id=#{id}")
    Patent findById(String id) throws Exception;

//    @Delete("delete from patent where id=#{id}")
    void  deleteById(String id) throws Exception;

//    @Update("update patent set name=#{name},type=#{type},appnum=#{appnum},status=#{status},certnum=#{certnum},patentee=#{patentee},rank=#{rank} where id=#{id}")
    void update(Patent patent) throws  Exception;

//    @Select("select * from patent")
    List<Patent> findAllByPage();

//    @Select(" select * from patent where 1=1 and appnum like '%${appnum}%' and patentee like '%${patentee}%' and status like '%${status}%' and name like '%${name}%'")
    List<Patent> selectByTerms(Patent patent);

}
