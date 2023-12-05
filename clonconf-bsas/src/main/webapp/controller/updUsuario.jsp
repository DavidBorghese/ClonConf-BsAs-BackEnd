<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<%
	String idUpd=request.getParameter("idUpd");
	String nombre=request.getParameter("nombre");
	String apellido=request.getParameter("apellido");
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");
	String permisos=request.getParameter("permisos");
	
	ConexionDB con=new ConexionDB();
	Statement st=con.conectar();
	
	try {
		Integer updateOk=st.executeUpdate("UPDATE usuarios SET nombre= '"+nombre+"', apellido= '"+apellido+"', user= '"+user+"', pass= '"+pass+"', permisos= '"+permisos+"' WHERE id=" +idUpd);
		
		if(updateOk==1) {
			response.sendRedirect("../view/listadoUsuarios.jsp?mensaje=Usuario%20modificado%20exitosamente");			
		} else {
			response.sendRedirect("../view/listadoUsuarios.jsp?mensaje=No%20se%20pudo%20modificar%20el%20usuario");			
		}
	} catch(Exception e) {
		response.sendRedirect("../view/listadoUsuarios.jsp?mensaje=No%20se%20pudo%20modificar%20el%20usuario");
		e.printStackTrace();
	}
	


%>