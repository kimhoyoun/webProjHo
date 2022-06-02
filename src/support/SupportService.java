package support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SupportService {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
