/**
 * 
 */
package org.feng.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 姜峰
 *
 */
//@Component 没有作用，换成xml配置
public class MyExceptionResolver implements HandlerExceptionResolver {

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.HandlerExceptionResolver#resolveException(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)
	 */
	@Override
	public ModelAndView resolveException(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
			Exception arg3) {
		// TODO Auto-generated method stub
		MyException me = null;
		if (arg3 instanceof MyException) {
			me = (MyException) arg3;
		} else {
			me = new MyException("系统异常");
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error");
		mv.addObject("message", me.getMessage());
		return mv;
	}

}
