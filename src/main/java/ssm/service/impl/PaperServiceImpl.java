package ssm.service.impl;

import com.github.pagehelper.PageHelper;
import ssm.dao.IPaperDao;
import ssm.domain.Paper;
import ssm.service.IPaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("paperService")
@Transactional
public class PaperServiceImpl implements IPaperService {
    @Autowired
    private IPaperDao paperDao;


    @Override
    public List<Paper> findAllByPage(int page, int pageSize) throws Exception {
        PageHelper.startPage(page, pageSize);
        return paperDao.findAllByPage();
    }

    @Override
    public List<Paper> selectByTerms(int page, int pageSize,Paper paper) throws Exception {
        PageHelper.startPage(page, pageSize);
        return paperDao.selectByTerms(paper);
    }
   /* @Override
    public List<Paper> selectByTerms(int page, int pageSize, Map<String,String[]> condition) throws Exception {
        PageHelper.startPage(page, pageSize);
        String sql="select * from user where 1=1 ";
        StringBuilder sb=new StringBuilder(sql);
        Set<String> keySet=condition.keySet();
        //定义参数的集合
        List<Object> params=new ArrayList<Object>();
        for(String key:keySet){
            String value=condition.get(key)[0];
            if(value!=null&&!"".equals(value)){
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");//加条件的值
            }
        }

        return paperDao.selectByTerms(sql,params.toArray());
    }
*/
    @Override
    public void save(Paper paper) throws Exception {
        paperDao.save(paper);
    }

    @Override
    public void deleteById(String id) throws Exception {
        paperDao.deleteById(id);
    }

    @Override
    public Paper findById(String id) throws Exception {
        Paper paper=paperDao.findById(id);
        return paper;
    }

    @Override
    public void update(Paper paper) throws Exception {
        paperDao.update(paper);
    }

    @Override
    public void deleteSelect(String[] ids) throws Exception {
        if(ids!=null) {
            for (String id : ids) {
                paperDao.deleteById(id);
            }
        }
    }

}
