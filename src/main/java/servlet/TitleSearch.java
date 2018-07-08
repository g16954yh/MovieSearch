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
import model.Title;

/**
 * Servlet implementation class TitleSearch
 */
@WebServlet("/TitleSearch")
public class TitleSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TitleSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		Title t = new Title();
		ReadText rt = new ReadText();
		List<String> titleList = new ArrayList<String>();
		List<List<String>> timeList = new ArrayList<List<String>>();
		List<List<String>> result = new ArrayList<List<String>> ();
		String[] timeValue; //checkboxの値の配列
		List<String> value = new ArrayList<String>();
		
		//text読み込み
		titleList = rt.Title("WEB-INF/MovieList.txt");
		timeList = rt.Time("WEB-INF/TimeList.txt");
		
		//top.jspのcheckboxの値を取得
		timeValue = request.getParameterValues("time");
		if(timeValue==null) {
			//選択されていなかった場合
			RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
			dispatcher.forward(request, response);
		}
		else {
			//1つ以上選択されている
			int i = 0;
			for(; i<timeValue.length; i++) {
				//条件に一致するものを探してリストに入れる
				result.add(t.search(timeValue[i],titleList,timeList));
				
				//条件をリストに入れる
				String valueString1 = timeValue[i];
				int valueInt1 = Integer.parseInt(valueString1);
				if(valueInt1!=21) {
					int valueInt2 = valueInt1+1;
					String valueString2 = Integer.toString(valueInt2);
					value.add(valueString1+":00-"+valueString2+":59");
				}
				else {
					value.add(valueString1+":00-");
				}
			}
			
			request.setAttribute("value",value);
			request.setAttribute("result",result);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/TitleResult.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
		
		doGet(request, response);
	}

}
