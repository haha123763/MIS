package ssm.dao;

import ssm.domain.Paper;

import java.util.List;

public interface IPaperDao {
    //@Insert("insert into paper(id,title,authors,pc_name,year,category,inclusion,impact,sci,volume,issue,page,firstAuthor,corAuthor,rank,paperFile) values(#{id},#{title},#{authors},#{pc_name},#{year},#{category},#{inclusion},#{impact},#{sci},#{volume},#{issue},#{page},#{firstAuthor},#{corAuthor},#{rank},#{paperFile})")
    void save(Paper paper) throws Exception;


   // @Select("select * from paper where id=#{id}")
    Paper findById(String id) throws Exception;

   // @Delete("delete from paper where id=#{id}")
    void  deleteById(String id) throws Exception;

    //@Update("update paper set title=#{title},authors=#{authors},pc_name=#{pc_name},year=#{year},category=#{category},inclusion=#{inclusion},impact=#{impact},sci=#{sci},volume=#{volume},issue=#{issue},page=#{page},firstAuthor=#{firstAuthor},corAuthor=#{corAuthor},rank=#{rank} where id=#{id}")
    void update(Paper paper) throws  Exception;

   // @Select("select * from paper")
    List<Paper> findAllByPage();

   // @Select(" select * from paper where 1=1 and authors like '%${authors}%' and year like '%${year}%' and category like '%${category}%' and inclusion like '%${inclusion}%' and title like '%${title}%' and sci like '%${sci}%'")
    List<Paper> selectByTerms(Paper paper);

    /*List<Paper> selectByTerms(String sql, Object[] toArray);*/
    /*#{参数名}：是加引号的
    ${参数名}：是不加引号的*/
}
