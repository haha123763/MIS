package ssm.service;

import ssm.domain.Paper;

import java.util.List;

public interface IPaperService {
    List<Paper> findAllByPage(int page, int pageSize) throws Exception;
    List<Paper> selectByTerms(int page, int pageSize, Paper paper) throws Exception;
//    List<Paper> selectByTerms(int page, int pageSize, Map<String,String[]> condition) throws Exception;
    void save(Paper Paper) throws Exception;
    void deleteById(String id) throws  Exception;
    Paper findById(String id) throws Exception;
    void update(Paper paper) throws  Exception;
    void deleteSelect(String[] ids) throws Exception;
}
