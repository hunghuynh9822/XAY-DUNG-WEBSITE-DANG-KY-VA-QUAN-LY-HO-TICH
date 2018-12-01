package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Consts;
import DAO.HoSoDangKyDAO;
import Entities.HSDK;

public class QuanLyDangKyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HoSoDangKyDAO hoSoDangKyDAO;
	List<HSDK> hsdks;

	public QuanLyDangKyServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		hoSoDangKyDAO = new HoSoDangKyDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		hsdks = new ArrayList<HSDK>();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String mess = (String)(request.getParameter("message"));
		String page = "";
		request.setAttribute("message", mess);
		page = "/CONTENT/jsp/QuanLyHoSoDangKy_New.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String action = request.getRequestURI();
		String[] words=action.split("/");
		
		switch (words[words.length-1]) {
		case "getAll":
			GetAll(request, response);
			break;
		default:
			break;
		}
	}
	
	private void GetAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int loaiGiay = Integer.parseInt(request.getParameter("key"));
		PrintWriter out = response.getWriter();
		StringBuilder data = new StringBuilder();
		List<HSDK> DSHSDK;
		data.append("{ \"hsdk\":[");
		try {
			if (loaiGiay == -1)
			{
				DSHSDK = hoSoDangKyDAO.getAllHSDKCoQuan(1);
			}
			else
			{
				DSHSDK = hoSoDangKyDAO.getHSDKLoaiGiayTo(1,loaiGiay);
			}
			for (int i = 0; i < DSHSDK.size(); i++) {
				StringBuilder temp = new StringBuilder();
				if (i == DSHSDK.size() - 1) { //Trường hợp dòng cuối cùng sẽ không có dấu ","
					temp.append("{");
					temp.append("\"stt\":\"\","); // Ký tự trống để điền STT tự động
					temp.append("\"id\":\""+DSHSDK.get(i).getHoSoDangKyId()+"\",");
					temp.append("\"ten\":\""+DSHSDK.get(i).getHoSoDangKyTen()+"\",");
					temp.append("\"ma\":\""+DSHSDK.get(i).getHoSoDangKyMa()+"\",");
					temp.append("\"ngayDangKy\":\""+Consts.ConvertUtilToString(DSHSDK.get(i).getNgayDangKy())+"\",");
					temp.append("\"ngayHetHan\":\""+Consts.ConvertUtilToString(DSHSDK.get(i).getNgayHetHan())+"\",");
					temp.append("\"loaiGiayTo\":\""+DSHSDK.get(i).getLoaiGiayToId()+"\"}");
				}
				else
				{
					temp.append("{");
					temp.append("\"stt\":\"\","); // Ký tự trống để điền STT tự động
					temp.append("\"id\":\""+DSHSDK.get(i).getHoSoDangKyId()+"\",");
					temp.append("\"ten\":\""+DSHSDK.get(i).getHoSoDangKyTen()+"\",");
					temp.append("\"ma\":\""+DSHSDK.get(i).getHoSoDangKyMa()+"\",");
					temp.append("\"ngayDangKy\":\""+Consts.ConvertUtilToString(DSHSDK.get(i).getNgayDangKy())+"\",");
					temp.append("\"ngayHetHan\":\""+Consts.ConvertUtilToString(DSHSDK.get(i).getNgayHetHan())+"\",");
					temp.append("\"loaiGiayTo\":\""+DSHSDK.get(i).getLoaiGiayToId()+"\"},");
				}
				data.append(temp);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		data.append("]}");
		out.println(data.toString());
	}

}
