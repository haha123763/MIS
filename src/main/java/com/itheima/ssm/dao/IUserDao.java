package com.itheima.ssm.dao;

import com.itheima.ssm.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IUserDao {
//    @Select("select * from user where username=#{username}")
    UserInfo findByUsername(String username) throws Exception;
    void insertBatch(List<UserInfo> users);
//    @Select("select * from user where role='ROLE_ADMIN'")
    List<UserInfo> findAllAdmin() throws Exception;

//    @Select("select * from user where role='ROLE_USER'")
    List<UserInfo> findAllUser() throws Exception;

//    @Insert("insert into user(id,username,password,Chinese_name,English_name,department,job_title,phone,email,role) values(#{id},#{username},#{password},#{Chinese_name},#{English_name},#{department},#{job_title},#{phone},#{email},#{role})")
    void save(UserInfo userInfo) throws Exception;

//    @Select("select * from user where id=#{id}")

    UserInfo findById(String id) throws Exception;

//    @Delete("delete from user where id=#{id}")
    void  deleteById(String id) throws Exception;

//    @Update("update user set username=#{username},password=#{password},Chinese_name=#{Chinese_name},English_name=#{English_name},department=#{department},job_title=#{job_title},phone=#{phone},email=#{email},role=#{role} where id=#{id}")
    void update(UserInfo userInfo) throws  Exception;
    boolean checkUsername(String username);
}
