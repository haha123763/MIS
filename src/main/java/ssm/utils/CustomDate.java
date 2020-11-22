package ssm.utils;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class CustomDate implements WebBindingInitializer {
    @Override
    public void initBinder(WebDataBinder binder) {

    }

    @Override
    public void initBinder(WebDataBinder binder, WebRequest request) {
    // TODO Auto-generated method stub
    // 转换日期
     DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
     binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
 }
