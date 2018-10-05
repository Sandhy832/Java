package p1;
import java.lang.ClassNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class GetReslt extends HttpServlet {
	String url="jdbc:oracle:thin:@//localhost:1521/XE";
	String u="SANDY";
	String p="sandy";
	Connection con=null;
	PreparedStatement st=null;
	ResultSet rs=null;
	PrintWriter pw=null;
	public void init()
	{
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Loaded");
			con=DriverManager.getConnection(url, u, p);
			System.out.println("Connected");
		}
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
			System.out.println("Problem Occurred");
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			System.out.println("Problem Occurred");
		}
	}
	public void service(HttpServletRequest req,HttpServletResponse res)
	{
		try {
			String s="SELECT * FROM VTURESULT WHERE MARKS1=?";
			String t=req.getParameter("usn");
			st=con.prepareStatement(s);
			st.setString(1, t);
			rs=st.executeQuery();
			while(rs.next()==true)
			{
			String a=rs.getString(1);
			String b=rs.getString(2);
			int c=rs.getInt(3);
			int d=rs.getInt(4);
			int e=rs.getInt(5);
			pw=res.getWriter();
			pw.println(a);
			pw.println(b);
			pw.println(c);
			pw.println(d);
			pw.println(e);
			}
		} 
		catch (SQLException | IOException e) 
		{
			e.printStackTrace();
			System.out.println("SQLException or IOException");
		}
		
	}
}
