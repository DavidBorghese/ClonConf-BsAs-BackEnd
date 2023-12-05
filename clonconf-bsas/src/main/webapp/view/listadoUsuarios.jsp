<!doctype html>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Listado de Usuarios</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 		rel="stylesheet"		integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" 		crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
	<link rel="stylesheet" href="./css/index.css">
	
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>

	<div class="container">

		<h1 class="text-center m-3 fs-3">Listado de Usuarios</h1>
		<% 
			String mensaje=request.getParameter("mensaje");
			if(mensaje!=null) {
				out.println("<div class='bg-danger text-center p-1 rounded'>");
				out.println(mensaje);
				out.println("</div>");
			}	
		%>	  

	<button class="btn btn-primary my-2" data-bs-toggle='modal' data-bs-target='#addModal'>Agregar Usuario</button>
		<table class="table text-center table-dark table-hover">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">User</th>
					<th scope="col">Password</th>
					<th scope="col">Nombre</th>
					<th scope="col">Apellido</th>
					<th scope="col">Permisos</th>
					<th scope="col">Operaciones</th> 
				</tr>
			</thead>
			<tbody>
				<!-- dentro de estas etiquetas programamos en java  -->

				<% 
		    	/* podemos conectarno a la db, buscar los alumnos, generar una tabla y enviarla al cliente  */
		    	ConexionDB conn=new ConexionDB();
				Statement st=conn.conectar();
				ResultSet rs=st.executeQuery("SELECT * FROM usuarios");
				
				while(rs.next()) {
					out.println("<tr>");
					
					out.println("<td>");
					out.println(rs.getInt("id"));
					out.println("</td>");
					
					out.println("<td>");
					out.println(rs.getString("user"));
					out.println("</td>");

					out.println("<td>");
					out.println(rs.getString("pass"));
					out.println("</td>");
					
	    			out.println("<td>");
	    			out.println(rs.getString("nombre"));
	    			out.println("</td>");

	    			out.println("<td>");
	    			out.println(rs.getString("apellido"));
	    			out.println("</td>");
	    			
	    			out.println("<td>");
	    			out.println(rs.getString("permisos"));
	    			out.println("</td>");
					
					out.println("<td>");
	    			out.println("<a href='#' data-bs-toggle='modal' data-bs-target='#deleteModal' idDel='"+rs.getInt("id")+"' nombre='"+rs.getString("nombre")+"' apellido='"+rs.getString("apellido")+"'><i class='bi bi-trash-fill'></i></a>");
	    			out.println("<a href='#' data-bs-toggle='modal' data-bs-target='#updateModal' idUpd='"+rs.getInt("id")+"' user='"+rs.getString("user")+"' pass='"+rs.getString("pass")+"' nombre='"+rs.getString("nombre")+"' apellido='"+rs.getString("apellido")+"' permisos='"+rs.getString("permisos")+"' ><i class='bi bi-pencil-fill'></i></a>");
					out.println("</td>");					

					out.println("</tr>");
				}
				
		    	
		    	%>
			</tbody>
		</table>


    			<!-- Create modal -->
		<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Usuario</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="../controller/addLUsuario.jsp" method="post">
		          <div class="mb-3 text-center">
		            <input type="text" class="form-control mb-3" id="nomAdd" name="nomAdd" placeholder="Nombre">
		            <input type="text" class="form-control mb-3" id="apeAdd" name="apeAdd" placeholder="Apellido">
		            <input type="text" class="form-control mb-3" id="userAdd" name="userAdd" placeholder="User">
		            <input type="text" class="form-control mb-3" id="passAdd" name="passAdd" placeholder="Contraseña">
		            <input type="text" class="form-control mb-3" id="permisosAdd" name="permisosAdd" placeholder="user o admin?">
		            <textarea rows="4" class="form-control mb-3" id="fotoPerfilAdd" name="fotoPerfilAdd" placeholder="Link de Avatar"></textarea>
		          </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
			        <button type="submit" class="btn btn-success">Crear</button>
			      </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>	

	<!-- Delete modal -->
			<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar </h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form action="../controller/delUsuario.jsp" method="post">
			          <div class="mb-3 text-center">
			            <label for="recipient-name" class="col-form-label ">¿Desea eliminar el orador?</label>
	
			            <input type="hidden" class="form-control" id="idDel" name="id">
			          </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
				        <button type="submit" class="btn btn-danger">Eliminar</button>
				      </div>
			        </form>
			      </div>
			    </div>
			  </div>
			</div>
		
		<!-- Update modal -->
		<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Modificar Orador</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="../controller/updUsuario.jsp" method="post">
		          <div class="mb-3 text-center">
		           
		            <input type="text" class="form-control" id="idUpd" name="idUpd" readonly="readonly">
		            <input type="text" class="form-control" id="nombre" name="nombre">
		            <input type="text" class="form-control" id="apellido" name="apellido">
		            <input type="text" class="form-control" id="user" name="user">
		         	<input type="text" class="form-control" id="pass" name="pass">
		           	<input type="text" class="form-control" id="permisos" name="permisos">
		          </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
			        <button type="submit" class="btn btn-primary">Modificar</button>
			      </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>

	</div>



	    <script src="js/listaUsuarios.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>