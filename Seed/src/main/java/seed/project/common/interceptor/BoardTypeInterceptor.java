package seed.project.common.interceptor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import seed.project.board.model.service.BoardService3;

@Slf4j
public class BoardTypeInterceptor implements HandlerInterceptor{

	@Autowired
	private BoardService3 service;

	// 전처리
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		ServletContext application = request.getServletContext();
		
		if(application.getAttribute("boardTypeList") == null) {
			
			List<Map<String, Object>> boardTypeList = service.selectBoardTypeList();
			
			application.setAttribute("boardTypeList", boardTypeList);
			
		}
		
		
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	
	
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
	
	
	
	
}
