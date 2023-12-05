<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<%
	String id=request.getParameter("id");
	
	ConexionDB con=new ConexionDB();
	Statement st=con.conectar();
	
	try {
		Integer deleteOk=st.executeUpdate("DELETE FROM usuarios WHERE id="+id);
		
		if(deleteOk==1) {
			response.sendRedirect("../view/listadoUsuarios.jsp?mensaje=Usuario%20eliminado%20exitosamente");			
		} else {
			response.sendRedirect("../view/listadoUsuarios.jsp?mensaje=No%20se%20pudo%20eliminar%20el%20usuario");			
		}
	} catch(Exception e) {
		response.sendRedirect("../view/listadoUsuarios.jsp?mensaje=No%20se%20pudo%20eliminar%20el%20usuario");	
		e.printStackTrace();
	}
	


%>