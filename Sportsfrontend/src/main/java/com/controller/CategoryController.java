package com.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.DAO.CategoryDao;
import com.model.Category;
import com.model.Product;

@Controller
public class CategoryController {

	@Autowired
	CategoryDao categoryDao;

	@Autowired
	Category category;

	@RequestMapping(value = "createCategory", method = RequestMethod.GET)
	public String showCategory(Model m) {
		System.out.println("my page");
		Category category = new Category();
		m.addAttribute(category);

		return "createCategory";
	}

	@RequestMapping(value = "AddCategory", method = RequestMethod.POST)
	public String addCategory(@Valid @ModelAttribute("category") Category category, BindingResult result, Model m) {

		if (result.hasErrors())
			return "createCategory";

		categoryDao.addCategory(category);

		List<Category> listCategory = categoryDao.retriveCategory();
		m.addAttribute("categoryList", listCategory);

		return "category";
	}

	@RequestMapping(value = "getAllcategories", method = RequestMethod.GET)
	public String display(Model m) {
		System.out.println("show category called*****************************");

		m.addAttribute(category);

		List<Category> listCategory = categoryDao.retriveCategory();
		m.addAttribute("categoryList", listCategory);
		return "category";

	}

	@RequestMapping(value = "updateCategory/{catId}", method = RequestMethod.GET)
	public String updateCategory(@PathVariable("catId") int catId, Model m) {

		Category category = categoryDao.getCategory(catId);

		m.addAttribute(category);

		List<Category> listCategory = categoryDao.retriveCategory();
		m.addAttribute("categoryList", listCategory);
		return "UpdateCategory";
	}

	@RequestMapping(value = "UpdateCategory", method = RequestMethod.POST)
	public String updateMyCategory(@Valid @ModelAttribute("category") Category category,BindingResult result, Model m) {
	
		if (result.hasErrors())
			return "updateCategory";
		
		categoryDao.updateCategory(category);
		Category category1 = new Category();
		m.addAttribute(category1);

		List<Category> listCategory = categoryDao.retriveCategory();
		m.addAttribute("categoryList", listCategory);

		return "redirect:/getAllcategories";

	}

	@RequestMapping(value = "deleteCategory/{catId}", method = RequestMethod.GET)
	public String deleteCategory(@PathVariable("catId") int catId, Model m) {
		System.out.println("deleteCategory called****************");
		System.out.println(catId);
		Category category = categoryDao.getCategory(catId);
		System.out.println(category.toString());
		categoryDao.deleteCategory(category);
		List<Category> listCategory = categoryDao.retriveCategory();
		m.addAttribute("categoryList", listCategory);
		return "redirect:/getAllcategories";
	}
}
