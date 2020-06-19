package com.springexample.springmvc4;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Range;

public class Person {
	
	//@NotBlank(message = "이름은 필수 입력 항목입니다.")
	@NotBlank(message = "{name.required}") // message="{메시지 번들 아이디}"
	@Pattern(regexp = "[a-zA-Z0-9]{8,12}", message="{name.invalid}") // 정규표현식을 사용해서 유효성 검사 (데이터 형식 검사)
	private String name;
	
	@NotBlank(message = "{phone.required}")	
	@Pattern(regexp = "0[0-9]{1,2}-[0-9]{3,4}-[0-9]{4}", message="{phone.invalid}")
	private String phone;
	
	@NotBlank(message = "{email.required}")
	@Email(message="{email.invalid}")
	private String email;

	@NotNull(message = "{age.required}")
	@Range(min = 0, max = 150, message = "{age.outofrange}")
	private Integer age;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

}
