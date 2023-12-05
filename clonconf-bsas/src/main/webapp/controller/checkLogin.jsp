<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<%
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");
	
	ConexionDB con=new ConexionDB();
	Statement st=con.conectar();
	ResultSet rs=st.executeQuery("SELECT * FROM usuarios WHERE user='"+user+"' and pass='"+pass+"'");
	
	if(rs.next()) {
		if(rs.getString("permisos").equals("admin")){
			response.sendRedirect("../view/listaOradores.jsp");	
		} else {
			response.sendRedirect("../view/inicio.jsp?id="+rs.getInt("id"));	
		}
			
	} else {
		response.sendRedirect("../view/login.jsp?mensaje=Datos%20incorrectos,%20ingreselos%20nuevamente");	
	}

%>