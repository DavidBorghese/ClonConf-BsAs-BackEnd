<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<%
	String idUpd=request.getParameter("idUpd");
	String nombre=request.getParameter("nombre");
	String apellido=request.getParameter("apellido");
	String email=request.getParameter("email");
	
	ConexionDB con=new ConexionDB();
	Statement st=con.conectar();
	
	try {
		Integer updateOk=st.executeUpdate("UPDATE oradores SET nombre= '"+nombre+"', apellido= '"+apellido+"', email= '"+email+"' WHERE id_orador=" +idUpd);
		
		if(updateOk==1) {
			response.sendRedirect("../view/listaOradores.jsp?mensaje=Orador%20modificado%20exitosamente");			
		} else {
			response.sendRedirect("../view/listaOradores.jsp?mensaje=No%20se%20pudo%20modificar%20el%20orador");			
		}
	} catch(Exception e) {
		response.sendRedirect("../view/listaOradores.jsp?mensaje=No%20se%20pudo%20modificar%20el%20orador");			
	}
	


%>