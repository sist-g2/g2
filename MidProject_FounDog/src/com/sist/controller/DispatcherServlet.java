package com.sist.controller;

import java.io.*;
import java.lang.reflect.Method;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public List<String> list = new ArrayList<String>();
	public void init(ServletConfig config) throws ServletException {
		String path = config.getInitParameter("xmlPath");
		try {
			SAXParserFactory spf = SAXParserFactory.newInstance();
			SAXParser sp = spf.newSAXParser();
			
			HandlerMapping hm = new HandlerMapping();
			sp.parse(new File(path), hm);
			
			List<String> packList = hm.getPackList();
			System.out.println("packlist size : "+packList.size());
			
			for (String pack : packList) {
				System.out.println("pack: " + pack);
				List<String> clsList = ComponentScan.componentFileData(pack);
				System.out.println("clsList size : "+clsList.size());
				for (String cls : clsList) {
					System.out.println("cls: "+cls);
					list.add(cls);
				}
			}
		} catch (Exception ex) {}
		
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String cmd = request.getRequestURI();
			cmd = cmd.substring(request.getContextPath().length()+1);
			
			for (String cls : list) {
				Class clsName = Class.forName(cls);
				if (clsName.isAnnotationPresent(Controller.class)==false) {
					continue;
				}
				Object obj = clsName.newInstance();
				
				Method[] methods = clsName.getDeclaredMethods();
				for (Method m : methods) {
					RequestMapping rm = m.getAnnotation(RequestMapping.class);
					if (cmd.equals(rm.value())){
						Model model = new Model(request, response);
						String jsp = (String)m.invoke(obj, model);
						if(jsp.startsWith("redirect")) {
							response.sendRedirect(jsp.substring(jsp.indexOf(":")+1));
						} else {
							RequestDispatcher rd = request.getRequestDispatcher(jsp);
							rd.forward(request, response);							
						}
						return;
					}
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
