package com.cragardev.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cragardev.languages.models.Language;
import com.cragardev.languages.services.LanguageService;

@Controller
public class HomeController {
	
//	@Autowired
//	LanguageService languageService;
	
	// Injecting the language service
	private final LanguageService languageService;
	
	public HomeController(LanguageService languageService) {
		super();
		this.languageService = languageService;
	}
	
	
	//
	// ========= Create One and View All Page ===========
	//
	
	@GetMapping("/languages")
	public String dashboard(Model model, 
			@ModelAttribute("language") Language language) {
		
		List<Language> languages = languageService.allLanguages();
		model.addAttribute("languages", languages);
		
		return "index.jsp";
	}
	
	
	// 
	// =========  Show One Page ==========================
	// 
	
	@GetMapping("/languages/showOne/{id}") // need to add the id
	public String showOneLanguage(Model model, @PathVariable(value="id") Long id){
		
		Language language = languageService.findLanguage(id);
		model.addAttribute("language", language);	
		
		return "showOne.jsp";
	}
	
	
	// 
	// =========  Create Language Processing ================:::::::::::::::::::::::::
	// 
	
	@PostMapping("/languages/create")
	public String createLanguage(
			@Valid
			@ModelAttribute("language") Language language, BindingResult result) {
		
		if(result.hasErrors()) {
			return "index.jsp";
		} else { 
			languageService.createLanguage(language);
			return "redirect:/languages";
		}
		
		
	}
	
	
	
	// 
	// =========  Update Page ==========================
	// 
	
	@GetMapping("/languages/update/{id}") // need to add the id
	public String updateLanguage(Model model, 
			@PathVariable(value="id") Long id, 
			@ModelAttribute("language") Language language) {
		
		model.addAttribute("language", languageService.findLanguage(id));
		
		return "update.jsp";
	}

	
		
	// 
	// =========  Update Language Processing =================::::::::::::::::::::::::
	// 
	
	@RequestMapping(value="/languages/updating/{id}", method=RequestMethod.PUT)
	public String updateLanguageProcess(
			@Valid 
			@ModelAttribute("language") Language language, BindingResult result) {
		
		if (result.hasErrors()) {
            return "update.jsp";
        } else {
            languageService.updateLanguage(language);
            return "redirect:/languages";
        }
	}
	
		
	
	// 
	// =========  Delete Language Processing ==================::::::::::::::::::::::
	// 
	
	@GetMapping("/languages/delete/{id}")
	private String deleteLanguage(@PathVariable("id") Long id) {
		languageService.deleteLanguage(id);
		return "redirect:/languages";

	}

	
	
	
	
	// 
	// §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
	// 
		
	
}
