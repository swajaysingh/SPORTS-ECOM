package com.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.CategoryDao;
import com.DAO.ProductDao;
import com.DAO.SupplierDao;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;

@Controller
public class ProductController {
	@Autowired
	CategoryDao categoryDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	SupplierDao supplierDao;

	@Autowired
	Category category;

	@Autowired
	Supplier supplier;

	
	  /*@Autowired Product product;*/
	 
	public LinkedHashMap<Integer, String> getCategories() {
		List<Category> listCategories = categoryDao.retriveCategory();
		LinkedHashMap<Integer, String> categoryList = new LinkedHashMap<Integer, String>();

		for (Category category : listCategories) {
			categoryList.put(category.getCatId(), category.getCatName());
		}
		return categoryList;
	}

	public LinkedHashMap<Integer, String> getSuppliers() {
		List<Supplier> listSuppliers = supplierDao.retriveSupplier();
		LinkedHashMap<Integer, String> supplierList = new LinkedHashMap<Integer, String>();

		for (Supplier supplier : listSuppliers) {
			supplierList.put(supplier.getSupplierId(), supplier.getSupplierName());
		}
		return supplierList;
	}

	// Product Insert method1
	@RequestMapping(value = "createProduct", method = RequestMethod.GET)
	public ModelAndView showProduct(Model m) {

		/*
		 * Product product = new Product(); m.addAttribute("createProductObj",
		 * product); m.addAttribute("category", new Category());
		 * m.addAttribute("supplier", new Supplier());
		 * 
		 * m.addAttribute("categoryList", this.getCategories());
		 * m.addAttribute("supplierList", this.getSuppliers());
		 * 
		 * return "createProduct";
		 */
		ModelAndView mv = new ModelAndView("createProduct");
		Product product = new Product();
		mv.addObject("createProductObj", product);
		mv.addObject("productList", this.productDao.retriveProduct());
		mv.addObject("category", new Category());
		mv.addObject("categoryList", this.categoryDao.retriveCategory());
		mv.addObject("supplier", new Supplier());
		mv.addObject("supplierList", this.supplierDao.retriveSupplier());
		return mv;

	}

	// Product insert method2
	@RequestMapping(value = "InsertProduct", method = RequestMethod.POST)
	public ModelAndView insertProduct(@Valid @ModelAttribute("createProductObj") Product product, BindingResult result,
			MultipartFile fileDetail, Model m) {
		ModelAndView mv = null;
		if (result.hasErrors()) {
			mv = new ModelAndView("createProduct");
			mv.addObject("productList", this.productDao.retriveProduct());
			mv.addObject("category", new Category());
			mv.addObject("categoryList", this.categoryDao.retriveCategory());
			mv.addObject("supplier", new Supplier());
			mv.addObject("supplierList", this.supplierDao.retriveSupplier());

			return mv;

		}

		else {
			System.out.println(product.toString());

			category = categoryDao.getCategorybyName(product.getCategory().getCatName());
			supplier = supplierDao.getSupplierbyName(product.getSupplier().getSupplierName());

			System.out.println(category + "\t" + supplier);

			product.setCategory(category);
			product.setSupplier(supplier);
			productDao.addProduct(product);

			mv = new ModelAndView("product");
			mv.addObject("productList", productDao.retriveProduct());

			String path = "E:\\Users\\swajay pc\\workspace\\Sportsfrontend\\src\\main\\webapp\\resources\\images\\";
			String totalFileWithPath = path + String.valueOf(product.getProductId()) + ".jpg";
			File pimage = new File(totalFileWithPath);

			fileDetail = product.getPimage();
			if (!fileDetail.isEmpty()) {
				try {
					byte fileBuffer[] = fileDetail.getBytes();
					FileOutputStream fos = new FileOutputStream(pimage);
					BufferedOutputStream bs = new BufferedOutputStream(fos);
					bs.write(fileBuffer);
					bs.close();
				} catch (Exception e) {
					m.addAttribute("File Exception", e.getMessage());
				}
			} else {
				m.addAttribute("error", "Problem in file uploading");
			}

			return mv;
		}
	}

	@RequestMapping(value = "/getAllproducts", method = RequestMethod.GET)
	public String display(Model m) {
		List<Product> listProduct = productDao.retriveProduct();
		m.addAttribute("productList", listProduct);
		return "product";
	}

	// product Update method1
	@RequestMapping(value = "updateProduct/{productId}", method = RequestMethod.GET)
	public ModelAndView updateProduct(@PathVariable("productId") int productId, HttpServletRequest request) {

		Product product = productDao.getProduct(productId);
		System.out.println(product);

		ModelAndView mv = new ModelAndView("UpdateProduct");
		mv.addObject("categoryList", categoryDao.retriveCategory());
		mv.addObject("supplierList", supplierDao.retriveSupplier());
		mv.addObject("editProductObj", product);

		return mv;

	}

	@RequestMapping(value = "UpdateProduct", method = RequestMethod.POST)
	public String updateMyProduct(@Valid @ModelAttribute("editProductObj") Product product, BindingResult result,
			Model m) {

		if (result.hasErrors())
			return "updateProduct";

		category = categoryDao.getCategorybyName(product.getCategory().getCatName());
		supplier = supplierDao.getSupplierbyName(product.getSupplier().getSupplierName());

		System.out.println("category" + category.getCatName());
		System.out.println("supplier" + supplier.getSupplierName());
		System.out.println(product.toString());
		System.out.println(product.getCategory().getCatName());

		System.out.println("Product id=\t" + product.getProductId());

		product.setCategory(category);
		product.setSupplier(supplier);
		productDao.updateProduct(product);
		

		
		return "redirect:/getAllproducts";
	}

	@RequestMapping(value = "deleteProduct/{productId}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable("productId") int productId, Model m) {
		System.out.println("inside delete product*******************");
		Product product = productDao.getProduct(productId);
		productDao.deleteProduct(product);
		List<Product> listProduct = productDao.retriveProduct();
		m.addAttribute("productList", listProduct);
		return "redirect:/getAllproducts";
	}

	@RequestMapping(value = "getAllproducts/{productId}")
	public String product(@PathVariable("productId") int productId, Model m) {
		Product product = productDao.getProduct(productId);
		m.addAttribute("product", product);
		System.out.println(product.toString());
		return "productDescription";
	}

}
