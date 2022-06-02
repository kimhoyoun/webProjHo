package product.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductService;

public class ProductResult implements ProductService{
@Override
public void execute(HttpServletRequest request, HttpServletResponse response) {
	request.setAttribute("mainUrl", "Result");
	
	
}
}
