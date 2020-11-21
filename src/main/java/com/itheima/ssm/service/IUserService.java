package com.itheima.ssm.service;

import com.itheima.ssm.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface IUserService extends UserDetailsService {
    List<UserInfo> findAllUser(int page, int pageSize) throws Exception;
    List<UserInfo> findAllAdmin(int page, int pageSize) throws Exception;
    void save(UserInfo userInfo) throws Exception;
    void deleteById(String id) throws  Exception;
    UserInfo findById(String id) throws Exception;
    void deleteSelect(String[] ids) throws Exception;
    void update(UserInfo userInfo) throws  Exception;
    boolean checkUsername(String username);
    public Map<String, Object> importUsers(MultipartFile file) throws Exception;

    }
