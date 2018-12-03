/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;

import java.io.IOException;
import java.util.Date;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Michail Sitmalidis
 */
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        HttpSession session = request.getSession(false);
        String loginURI = request.getContextPath() + "/index.htm";
        String logingURI = request.getContextPath() + "/loginFormHandling.htm";
        String registerURI = request.getContextPath() + "/goToRegisterForm.htm";
        String registeringURI = request.getContextPath() + "/registerFormHandling.htm";

        boolean loggedIn = session != null && session.getAttribute("user") != null;
        boolean logingRequest = request.getRequestURI().equals(logingURI);
        boolean loginRequest = request.getRequestURI().equals(loginURI);
        boolean registerRequest = request.getRequestURI().equals(registerURI);
        boolean registeringRequest = request.getRequestURI().equals(registeringURI);
       
        System.out.println(new Date() + "URI:" + request.getRequestURI());

        if (loggedIn || loginRequest ||logingRequest|| registerRequest||registeringRequest) {
            chain.doFilter(request, response);
        } else {
            response.sendRedirect(loginURI);
        }

    }

    @Override
    public void destroy() {
        Filter.super.destroy(); //To change body of generated methods, choose Tools | Templates.
    }

}
