package ssm.service.impl;

import com.github.pagehelper.PageHelper;
import ssm.dao.IUserDao;
import ssm.domain.UserInfo;
import ssm.service.IUserService;
import ssm.utils.EJConvertor;
import ssm.utils.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {


    @Autowired
    private IUserDao userDao;

    private EJConvertor ejConvertor;
    /**
     * 检验 UserInfo 信息是否有效
     *
     * @param userInfo 仓库管理员信息
     * @return 返回一个 boolean 值，若仓库管理员信息中要求非空均有值，返回 true，否则返回 false
     */
    private boolean userInfoCheck(UserInfo userInfo) {

        return userInfo.getUsername()!= null && userInfo.getPassword()!= null && userInfo.getId() != null;
    }

    /**
     * 从文件中导入信息
     *
     * @param file 导入用户信息的文件
     * @return 返回一个Map，其中：key为total代表导入的总记录数，key为available代表有效导入的记录数
     */

    @Override
    public Map<String, Object> importUsers(MultipartFile file) throws Exception {
        // 初始化结果集
        Map<String, Object> resultSet = new HashMap<>();
        long total = 0;
        long available = 0;
        // 从文件中读取
        try {
            List<UserInfo> users = ejConvertor.excelReader(UserInfo.class, FileUtil.convertMultipartFileToFile(file));

            if (users != null) {
                total = users.size();

                // 验证记录
                List<UserInfo> availableList = new ArrayList<>();
                for (UserInfo UserInfo : users) {
                    if (userInfoCheck(UserInfo))
                        availableList.add(UserInfo);
                }

                // 保存到数据库
                available = availableList.size();
                if (available > 0)
                    userDao.insertBatch(availableList);
            }
        } catch (Exception e) {
            throw e;
        }
        resultSet.put("total", total);
        resultSet.put("available", available);
        return resultSet;
    }

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserInfo findById(String id) throws Exception{
        return  userDao.findById(id);
    }


    @Override
    public void deleteSelect(String[] ids) throws Exception {
        if(ids!=null) {
            for (String id : ids) {
                userDao.deleteById(id);
            }
        }
    }


    @Override
    public void update(UserInfo userInfo) throws Exception {
        userDao.update(userInfo);
    }

    @Override
    public boolean checkUsername(String username) {
        boolean b=userDao.checkUsername(username);
        System.out.println("--------------"+b);
        return b;
    }

    @Override
    public List<UserInfo> findAllUser(int page, int pageSize) throws Exception {
        PageHelper.startPage(page, pageSize);
        return userDao.findAllUser();
    }

    @Override
    public List<UserInfo> findAllAdmin(int page, int pageSize) throws Exception {
        PageHelper.startPage(page, pageSize);
        return userDao.findAllAdmin();
    }

    @Override
    public void save(UserInfo userInfo) throws Exception {
        //对密码进行加密处理
        userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        userDao.save(userInfo);
    }

    @Override
    public void deleteById(String id) throws Exception {
        userDao.deleteById(id);

    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        //处理自己的用户对象封装成UserDetails
        User user = new User(userInfo.getUsername(), userInfo.getPassword(),true, true, true, true, getAuthority(userInfo.getRole()));
        return user;

    }

    //作用就是返回一个List集合，集合中装入的是角色描述
    public List<SimpleGrantedAuthority> getAuthority(String role) {
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        list.add(new SimpleGrantedAuthority(role)) ;
        return list;
    }

}
