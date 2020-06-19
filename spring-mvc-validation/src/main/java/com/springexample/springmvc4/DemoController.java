package com.springexample.springmvc4;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(path = "/demo/")
public class DemoController {
	
//	@RequestMapping(path = "/read-data-1", method=RequestMethod.POST)
//	public String readData1(
//			Person person, 
//			@RequestParam(required = false, defaultValue = "0") int myData) {
//		
//		System.out.println(myData);
//				
//		return "result";
//		
//	}
	
	@RequestMapping(path = "/read-data-1", method=RequestMethod.POST)
	public String readData1(
			@Valid @ModelAttribute("person1") Person person) { // @Valid : validation 수행하는 설정  
		
		return "result";
		
	}
	
	//BindingResult : 데이터를 읽는 중에 발생된 오류정보를 저장한 객체
	//                오류 발생했을 때 이 전달인자가 없으면 예외 발생, 있으면 정상 수행
	@RequestMapping(path = "/read-data-2", method=RequestMethod.POST)
	public String readData2(
			@Valid @ModelAttribute("person2")Person person,
			BindingResult br) { 

		if (br.hasErrors()) {
			return "home";
		}
		
		return "result";
		
	}
	
	
}









