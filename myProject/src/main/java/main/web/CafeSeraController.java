package main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CafeSeraController {

	@RequestMapping("/cafeSera.do")
	public String cafeSera() {
		
		return "/cafeSera/cafeSera";
	}
	
	@RequestMapping("/cafeSeraMenu.do")
	public String cafeSeraMenu() {
		
		return "/cafeSera/menu";
	}
	
	@RequestMapping("/cafeSeraMembership.do")
	public String cafeSeraMebrship() {
		
		return "/cafeSera/membership";
	}
	
	@RequestMapping("/cafeSeraNotice.do")
	public String cafeSeraNotice() {
		
		return "/cafeSera/notice";
	}
	
	@RequestMapping("/cafeSeraLocation.do")
	public String cafeSeraLocation() {
		
		return "/cafeSera/location";
	}
	
}
