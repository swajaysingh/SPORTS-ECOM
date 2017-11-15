package com.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.DAO.CategoryDao;
import com.DAO.ProductDao;
import com.DAO.SupplierDao;
import com.DAOImpl.CategoryDaoImpl;
import com.DAOImpl.ProductDaoImpl;
import com.DAOImpl.SupplierDaoImpl;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;




@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	CategoryDao categoryDao;
	/*@Autowired
	CategoryDaoImpl categoryDaoImpl;*/
	
	@Autowired
	ProductDao productDao;
	/*@Autowired
	ProductDaoImpl productDaoImpl;*/
	
	@Autowired
	SupplierDao supplierDao;
	/*@Autowired
	SupplierDaoImpl supplierDaoImpl;*/
	
	@Autowired
	Category category;
	
	@RequestMapping("/adding")
	public String addPage()
	{
		return "adding";
	}
	
	/*@RequestMapping(value="AddCategory",method=RequestMethod.POST)
	public String addCategory(@ModelAttribute("category")Category category,Model m )
	{
		categoryDao.addCategory(category);
		
		List<Category> listCategory=categoryDao.retriveCategory();
		m.addAttribute("categoryList",listCategory);
		
		return "AdminHome";
	}
//-------------------------------------------------------------------
	//PRODUCT info
	
	@RequestMapping(value="product",method=RequestMethod.GET)
	public String showProduct(Model m){
		System.out.println("my page");
		Product product = new Product();
		m.addAttribute(product);
		
		m.addAttribute("categoryList", this.getCategories());
		m.addAttribute("supplierList", this.getSuppliers());
		return "Product";
	}
	
	public LinkedHashMap<Integer, String> getCategories(){
		List<Category> listCategories = categoryDao.retriveCategory();
		LinkedHashMap<Integer, String> categoryList = new LinkedHashMap<Integer, String>();
		
		for(Category category : listCategories){
			categoryList.put(category.getCatId(), category.getCatName());
		}
		return categoryList;
	}
	
	public LinkedHashMap<Integer, String> getSuppliers(){
		List<Supplier> listSuppliers = supplierDao.retriveSupplier();
		LinkedHashMap<Integer, String> supplierList = new LinkedHashMap<Integer, String>();
		
		for(Supplier supplier : listSuppliers){
			supplierList.put(supplier.getSupplierId(), supplier.getSupplierName());
		}
		return supplierList;
	}
	
	@RequestMapping(value="InsertProduct",method=RequestMethod.POST)
	public String insertProduct(@ModelAttribute("product")Product product,@RequestParam("pimage")MultipartFile fileDetail,Model m){
		productDao.addProduct(product);
		System.out.println("add");
		String path = "E:\\Users\\swajay pc\\workspace\\Sportsfrontend\\src\\main\\webapp\\resources\\images\\";
		String totalFileWithPath = path + String.valueOf(product.getProductId())+".jpg";
		File pimage = new File(totalFileWithPath);
		
		if(!fileDetail.isEmpty()){
			try{
				byte fileBuffer[] = fileDetail.getBytes();
				FileOutputStream fos = new FileOutputStream(pimage);
				BufferedOutputStream bs = new BufferedOutputStream(fos);
				bs.write(fileBuffer);
				bs.close();
			}
			catch (Exception e) {
				m.addAttribute("File Exception",e.getMessage());
			}
		}
		else
		{
			m.addAttribute("error","Problem in file uploading");
		}
		Product p1 = new Product();
		m.addAttribute(p1);
		return "redirect:/product";
	}
	
	//------------------------------------------------------------------
	//SUPPLIER INFO
	
	@RequestMapping(value="AddSupplier",method=RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier")Supplier supplier ,Model m){
		supplierDao.addSupplier(supplier);
		
		List<Supplier> listSupplier = supplierDao.retriveSupplier();
		m.addAttribute("supplierList",listSupplier);
		
		return "AdminHome";
	}
	
	@RequestMapping(value="supplier",method=RequestMethod.GET)
	public String showSupplier(Model m){
		
		Supplier supplier = new Supplier();
		m.addAttribute(supplier);
		
		List<Supplier> listSupplier = supplierDao.retriveSupplier();
		m.addAttribute("supplierList",listSupplier);
		
		return "Supplier";

	}
	*/
	
	
}