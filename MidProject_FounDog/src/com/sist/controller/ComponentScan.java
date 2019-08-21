package com.sist.controller;
import java.io.*;
import java.util.*;

public class ComponentScan {
	public static void main(String[] args) {
		ComponentScan c = new ComponentScan();
		c.componentFileData("com.sist.model");
	}
	public static List<String> componentFileData(String pack) {
		List<String> list = new ArrayList<String>();
		try {
			String path = "C:\\midProject\\MidProject_FounDog\\src";
			System.out.println(path);
			path = path + "\\" + pack.replace(".", "\\");
			System.out.println(path);
			
			File dir = new File(path);
			File[] flist = dir.listFiles();
			for (File f : flist) {
				System.out.println("f.getName() : "+f.getName());
				String fname = f.getName();
				String ext = fname.substring(fname.lastIndexOf(".")+1);
				if(ext.equals("java")) {
					String clsName = pack+"."+fname.substring(0, fname.lastIndexOf("."));
					System.out.println(clsName);
					list.add(clsName);
				}
			}
		} catch (Exception ex) {}
		return list;
	}
}
