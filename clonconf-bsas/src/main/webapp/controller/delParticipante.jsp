<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<%
	String id=request.getParameter("id");
	
	ConexionDB con=new ConexionDB();
	Statement st=con.conectar();
	
	try {
		Integer deleteOk=st.executeUpdate("DELETE FROM Participantes WHERE id="+id);
		
		if(deleteOk==1) {
			response.sendRedirect("../view/listadoParticipantes.jsp?mensaje=Participante%20eliminado%20exitosamente");			
		} else {
			response.sendRedirect("../view/listadoParticipantes.jsp?mensaje=No%20se%20pudo%20eliminar%20el%20participante");			
		}
	} catch(Exception e) {
		response.sendRedirect("../view/listadoParticipantes.jsp?mensaje=No%20se%20pudo%20eliminar%20el%20participante");			
	}
	


%>