package seed.project.common.config;

import java.util.Arrays;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import seed.project.common.filter.LoginFilter;
import seed.project.common.filter.ManagerFilter;

/*
만들어놓은 LoginFilter 클래스가 언제 적용될지 설정
*/

@Configuration // 서버가 켜질 때 해당 클래스 내 모든 메서드가 실행됨
public class FilterConfig {
	
	@Bean // 반환된 객체를 Bean으로 등록 : LoginFilter로 타입을 제한함
	public FilterRegistrationBean<LoginFilter> loginFilter() {
		// FilterRegistrationBean : 필터를 Bean으로 등록하는 객체
		
		FilterRegistrationBean<LoginFilter> filter
			= new FilterRegistrationBean<>();
		
		// 사용할 필터 객체 추가
		filter.setFilter(new LoginFilter());
		
		// /myPage/* : myPage로 시작하는 모든 요청
		String[] filteringURL = {"/myPage/*", "/board/2/board2Wrtie", "/board/2/board2Update"};
		
		// 필터가 동작할 URL 을 세팅
		// Arrays.asList(filteringURL)
		// -> filteringURL 배열을 List로 변환
		filter.setUrlPatterns(Arrays.asList(filteringURL));
		
		// 필터 이름 지정
		filter.setName("loginFilter");
		
		// 필터 순서 지정
		filter.setOrder(1);
		
		return filter; // 반환된 객체가 필터를 생성해서 Bean으로 등록
		
	}
	
	@Bean
	public FilterRegistrationBean<ManagerFilter> managerFilter(){
		
		FilterRegistrationBean<ManagerFilter> filter
		= new FilterRegistrationBean<>();
		
		// 사용할 필터 객체 추가
		filter.setFilter(new ManagerFilter());
		
		String[] filteringURL = {"/seed/menu", "/seed/add", "/seed/update"};
		
		// 필터가 동작할 URL 을 세팅
		// Arrays.asList(filteringURL)
		// -> filteringURL 배열을 List로 변환
		filter.setUrlPatterns(Arrays.asList(filteringURL));
		
		// 필터 이름 지정
		filter.setName("managerFilter");
		
		// 필터 순서 지정
		filter.setOrder(1);
		
		return filter;
		
	}
	
}
