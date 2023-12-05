<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<%
	String id=request.getParameter("id_orador");
	
	ConexionDB con=new ConexionDB();
	Statement st=con.conectar();
	
	try {
		Integer deleteOk=st.executeUpdate("DELETE FROM oradores WHERE id_orador="+id);
		
		if(deleteOk==1) {
			response.sendRedirect("../view/listaOradores.jsp?mensaje=Orador%20eliminado%20exitosamente");			
		} else {
			response.sendRedirect("../view/listaOradores.jsp?mensaje=No%20se%20pudo%20eliminar%20el%20orador");			
		}
	} catch(Exception e) {
		response.sendRedirect("../view/listaOradores.jsp?mensaje=No%20se%20pudo%20eliminar%20el%20orador");			
	}
	


%>