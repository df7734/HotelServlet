package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName="ManagerFilter", urlPatterns={"*.jsp"})
public class ManagerFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        boolean isManager = false;
        if(session != null && session.getAttribute("user_id") != null){
            isManager = session.getAttribute("user_id").equals("2");
        }

        // Check if the user is accessing login page
        if (req.getRequestURI().equals(
                req.getContextPath() + "/manager.jsp") || req.getRequestURI().equals(
                req.getContextPath() + "/viewRooms.jsp") || req.getRequestURI().equals(
                req.getContextPath() + "/chooseRoom.jsp")) {
            if (!isManager) {
                // Redirect to landing or home page
                HttpServletResponse res = (HttpServletResponse) response;
                res.sendRedirect(req.getContextPath()
                        + "/account.jsp");
            } else {
                // Otherwise, nothing to do if he has not logged in
                // pass the request along the filter chain
                chain.doFilter(request, response);
            }
        } else {
            // For all other pages,
            if (!isManager) {
                // Nothing to do
                chain.doFilter(request, response);
            } else {
                if(req.getRequestURI().equals(req.getContextPath() + "/account.jsp")){
                    HttpServletResponse res = (HttpServletResponse) response;
                    res.sendRedirect(req.getContextPath() + "/manager.jsp");
                }
                else{
                    chain.doFilter(request, response);
                }
            }
        }
    }
}
