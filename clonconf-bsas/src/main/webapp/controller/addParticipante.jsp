<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<%
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
		Integer insertOk=st.executeUpdate("INSERT INTO participantes (nombre, apellido, dni, email, telefono, cantticket, ocupacion, estudios) VALUES ('"+nombre+"','"+apellido+"','"+dni+"','"+email+"','"+telefono+"' ,'"+ticket+"' ,'"+ocupacion+"' ,'"+estudios+"') ");
		
		if(insertOk==1) {
			response.sendRedirect("../view/listadoParticipantes.jsp?mensaje=Participante%20creado%20exitosamente");			
		} else {
			response.sendRedirect("../view/listadoParticipantes.jsp?mensaje=No%20se%20pudo%20crear%20el%20participante");			
		}
	} catch(Exception e) {
		
		response.sendRedirect("../view/listadoParticipantes.jsp?mensaje=No%20se%20pudo%20crear%20el%20participante");
		e.printStackTrace();
	}
	


%>