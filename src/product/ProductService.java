package product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ProductService {

	void execute(HttpServletRequest request, HttpServletResponse response);
}
