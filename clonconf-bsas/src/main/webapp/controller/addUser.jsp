<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<%
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");
	String repPass=request.getParameter("repPass");
	//TODO: comprobar que pass==repPass
	
	ConexionDB con=new ConexionDB();
	Statement st=con.conectar();
	
	try {
		Integer insOk=st.executeUpdate("INSERT INTO usuarios (user,pass,permisos) VALUES ('"+user+"','"+pass+"','user') ");
		
		if(insOk==1) {
			response.sendRedirect("../view/login.jsp?mensaje=Usuario%20registrado%20correctamente");			
		} else {
			response.sendRedirect("../view/registro.jsp?mensaje=Error:No%20se%20pudo%20crear%20el%20usuario");	
		}
	} catch(Exception e) {
		response.sendRedirect("../view/registro.jsp?mensaje=El%20usuario%20ya%20existe,%20debe%20logearse");
		
	}
	


%>