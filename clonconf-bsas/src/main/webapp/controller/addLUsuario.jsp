<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<%
	String nom=request.getParameter("nomAdd");
	String ape=request.getParameter("apeAdd");
	String user=request.getParameter("userAdd");
	String pass=request.getParameter("passAdd");
	String permisos=request.getParameter("permisosAdd");
	String fotoPerfil=request.getParameter("fotoPerfilAdd");
	
	ConexionDB con=new ConexionDB();
	Statement st=con.conectar();
	
	try {
		Integer insertOk=st.executeUpdate("INSERT INTO usuarios (user, pass, permisos, nombre, apellido, fotoPerfil) VALUES ('"+user+"','"+pass+"','"+permisos+"','"+nom+"','"+ape+"','"+fotoPerfil+"') ");
		
		if(insertOk==1) {
			response.sendRedirect("../view/listadoUsuarios.jsp?mensaje=Usuario%20creado%20exitosamente");			
		} else {
			response.sendRedirect("../view/listadoUsuarios.jsp?mensaje=No%20se%20pudo%20crear%20el%20usuario");			
		}
	} catch(Exception e) {
		
		response.sendRedirect("../view/listadoUsuarios.jsp?mensaje=No%20se%20pudo%20crear%20el%20usuario");
		e.printStackTrace();
	}
	


%>