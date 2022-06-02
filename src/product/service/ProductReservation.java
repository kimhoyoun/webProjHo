package product.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductService;

public class ProductReservation implements ProductService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pname = request.getParameter("pname");
		String price = request.getParameter("price");
		
		request.setAttribute("mainUrl", "Reservation");
		request.setAttribute("pname", pname);
		request.setAttribute("price", price);
	}

}
