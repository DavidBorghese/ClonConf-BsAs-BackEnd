<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<%
	String idUpd=request.getParameter("idUpd");
	String nombre=request.getParameter("nombre");
	String apellido=request.getParameter("apellido");
	String dni=request.getParameter("dni");
	String email=request.getParameter("email");
	String telefono=request.getParameter("telefono");
	String ticket=request.getParameter("cantticket");
	String ocupacion=request.getParameter("ocupacion");
	String estudios=request.getParameter("estudios");

	
	ConexionDB con=new ConexionDB();
	Statement st=con.conectar();
	
	try {
		Integer updateOk=st.executeUpdate("UPDATE participantes SET nombre= '"+nombre+"', apellido= '"+apellido+"', dni= '"+dni+"', email= '"+email+"', telefono= '"+telefono+"', cantticket= '"+ticket+"', ocupacion= '"+ocupacion+"', estudios= '"+estudios+"' WHERE id=" +idUpd);
		
		if(updateOk==1) {
			response.sendRedirect("../view/listadoParticipantes.jsp?mensaje=Participante%20modificado%20exitosamente");			
		} else {
			response.sendRedirect("../view/listadoParticipantes.jsp?mensaje=No%20se%20pudo%20modificar%20el%20participante");			
		}
	} catch(Exception e) {
		response.sendRedirect("../view/listadoParticipantes.jsp?mensaje=No%20se%20pudo%20modificar%20el%20participante");
		e.printStackTrace();
	}
	


%>