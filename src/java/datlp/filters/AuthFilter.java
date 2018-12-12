/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.filters;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
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
 * @author DAT
 */
public class AuthFilter implements Filter {
    
    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    private List<String> admin;
    private List<String> member;
    
    public AuthFilter() {
        admin = new ArrayList<>();
        admin.add("");
        admin.add("''");
        admin.add("login");
        admin.add("login.action");
        admin.add("loadAllMember");
        admin.add("loadAllMember.action");
        admin.add("banMember");
        admin.add("banMember.action");
        admin.add("changePass");
        admin.add("changePass.action");
        admin.add("deleteEquip");
        admin.add("deleteEquip.action");
        admin.add("deleteMemberMission");
        admin.add("deleteMemberMission.action");
        admin.add("deleteMission");
        admin.add("deleteMission.action");
        admin.add("insertEquip");
        admin.add("insertEquip.action");
        admin.add("insertMember");
        admin.add("insertMember.action");
        admin.add("insertMemberMission");
        admin.add("insertMemberMission.action");
        admin.add("insertMission");
        admin.add("insertMission.action");
        admin.add("judgeMission");
        admin.add("judgeMission.action");
        admin.add("loadAllEquip");
        admin.add("loadAllEquip.action");
        admin.add("loadAllMember");
        admin.add("loadAllMember.action");
        admin.add("loadAllMission");
        admin.add("loadAllMission.action");
        admin.add("loadAdminIndex");
        admin.add("loadAdminIndex.action");
        admin.add("logout");
        admin.add("logout.action");
        admin.add("resetPassword");
        admin.add("resetPassword.action");
        admin.add("searchMember");
        admin.add("searchMember.action");
        admin.add("searchEquip");
        admin.add("searchEquip.action");
        admin.add("searchMission");
        admin.add("searchMission.action");
        admin.add("updateEquip");
        admin.add("updateEquip.action");
        admin.add("updateMember");
        admin.add("updateMember.action");
        admin.add("updateMission");
        admin.add("updateMission.action");
        admin.add("uploadAttachment");
        admin.add("uploadAttachment.action");
        admin.add("uploadEquipImg");
        admin.add("uploadEquipImg.action");
        admin.add("uploadMemberImage");
        admin.add("uploadMemberImage.action");
        admin.add("viewEquipDetail");
        admin.add("viewEquipDetail.action");
        admin.add("viewMemberDetail");
        admin.add("viewMemberDetail.action");
        admin.add("viewMissionDetail");
        admin.add("viewMissionDetail.action");
        admin.add("initMission");
        admin.add("initMission.action");
        admin.add("initEquip");
        admin.add("initEquip.action");
        admin.add("admin-changepass.jsp");
        admin.add("admin-member-insert.jsp");
        admin.add("admin-member-resetpassword.jsp");
        
        member = new ArrayList<>();
        member.add("");
        member.add("''");
        member.add("login");
        member.add("login.action");
        member.add("changePass");
        member.add("changePass.action");
        member.add("getOnWorkingMission");
        member.add("getOnWorkingMission.action");
        member.add("chooseEquip");
        member.add("chooseEquip.action");
        member.add("logout");
        member.add("logout.action");
        member.add("loadMissionHistory");
        member.add("loadMissionHistory.action");
        member.add("loadMemberEquip");
        member.add("loadMemberEquip.action");
        member.add("submitMission");
        member.add("submitMission.action");
        member.add("uploadFileText");
        member.add("uploadFileText.action");
        member.add("viewMemberEquipDetail");
        member.add("viewMemberEquipDetail.action");
        member.add("viewMemberEquipDetail");
        member.add("viewMemberEquipDetail.action");
        member.add("viewMemberMissionDetail");
        member.add("viewMemberMissionDetail.action");
        member.add("uploadMemberImgByMember");
        member.add("uploadMemberImgByMember.action");
        member.add("viewProfile");
        member.add("viewProfile.action");
        member.add("member-changepass.jsp");
        
    }    
    
    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }    
    
    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        String uri = req.getRequestURI();
        if(uri.contains("/assets/") || uri.contains("/mission/") || uri.contains("/img/")) {
            chain.doFilter(request, response);
        } else {
            int index = uri.lastIndexOf("/");
            String resource = uri.substring(index + 1);

            HttpSession session = req.getSession(false);
            if(session == null || session.getAttribute("USERNAME") == null) {
                if(resource.contains("login")) {
                    chain.doFilter(request, response);
                } else {
                    res.sendRedirect("login.jsp");
                }
            } else {
                String role = (String) session.getAttribute("ROLE");
                if(role.equals("Admin") && admin.contains(resource)) {
                    chain.doFilter(request, response);
                } else if (role.equals("Member") && member.contains(resource)) {
                    chain.doFilter(request, response);
                } else if(resource.contains("login")) {
                    chain.doFilter(request, response);
                } else {
                    res.sendRedirect("login.jsp");
                }   
            }
        }    
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {        
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {                
                log("AuthFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);                
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");                
                pw.print(stackTrace);                
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }
    
}
