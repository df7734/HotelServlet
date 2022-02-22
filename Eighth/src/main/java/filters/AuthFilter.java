package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName="AuthFilter", urlPatterns={"*.jsp"})
public class AuthFilter implements Filter {
    public AuthFilter() {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        boolean isLoggedIn = false;
        if(session != null){
            isLoggedIn = session.getAttribute("name") != null;
        }

        // Check if the user is accessing login page
        if (req.getRequestURI().equals(
                req.getContextPath() + "/start.jsp") || req.getRequestURI().equals(
                req.getContextPath() + "/login.jsp") || req.getRequestURI().equals(
                req.getContextPath() + "/registration.jsp")) {
            if (isLoggedIn) {
                // Redirect to landing or home page
                HttpServletResponse res = (HttpServletResponse) response;
                res.sendRedirect(req.getContextPath()
                        + "/index.jsp");
            } else {
                // Otherwise, nothing to do if he has not logged in
                // pass the request along the filter chain
                chain.doFilter(request, response);
            }
        } else {
            // For all other pages,
            if (isLoggedIn) {
                // Nothing to do
                chain.doFilter(request, response);
            } else {
                // Redirect to login page if he has not logged in
                HttpServletResponse res = (HttpServletResponse) response;
                    res.sendRedirect(req.getContextPath() + "/start.jsp");
            }
        }
    }

    public void init(FilterConfig fConfig) throws ServletException {
    }
}
