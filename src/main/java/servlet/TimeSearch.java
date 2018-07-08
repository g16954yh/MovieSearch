package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReadText;

/**
 * Servlet implementation class TimeSearch
 */
@WebServlet("/TimeSearch")
public class TimeSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ReadText rt = new ReadText();
		List<String> titleList = new ArrayList<String>();
		List<List<String>> timeList = new ArrayList<List<String>>();
		List<String> result = new ArrayList<String>();
		
		titleList = rt.Title("WEB-INF/MovieList.txt");
		timeList = rt.Time("WEB-INF/TimeList.txt");
		
		String selectValue = request.getParameter("movie");
		int value = Integer.parseInt(selectValue);
		result.add(titleList.get(value));//結果のリストの先頭にはタイトルを入れる
		List<String> time = timeList.get(value);
		for(int i=0; i<time.size(); i++) {
			if(!time.get(i).equals("0")) result.add(time.get(i));
		}
		
		request.setAttribute("result",result);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/TimeResult.jsp");
		dispatcher.forward(request, response);
		
		
		doGet(request, response);
	}

}
