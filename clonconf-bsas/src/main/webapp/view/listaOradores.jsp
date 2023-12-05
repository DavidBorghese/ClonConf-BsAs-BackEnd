<!doctype html>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tabla Oradores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="./css/index.css">
  </head>
  <body>
    <jsp:include page="menu.jsp"></jsp:include>
    <div class="container">
    	<h1 class="text-center m-3 fs-3">Listado de Oradores</h1>
		<% 
			String mensaje=request.getParameter("mensaje");
			if(mensaje!=null) {
				out.println("<div class='bg-danger text-center p-1 rounded'>");
				out.println(mensaje);
				out.println("</div>");
			}	
		%>	    
    
	<button class="btn btn-primary my-2" data-bs-toggle='modal' data-bs-target='#addModal'>Agregar Orador</button>
    	
    	<table class="table text-center table-dark table-hover">
			<thead>
				<tr>
					<th scope="col">#ID</th>
					<th scope="col">Nombre</th>
					<th scope="col">Apellido</th>
					<th scope="col">Email</th> 
					<th scope="col">Operaciones</th>
				</tr>
			</thead>
    		
    		<tbody>
    		<% 
    		ConexionDB con= new ConexionDB();
    		Statement st=con.conectar();
    		ResultSet rs=st.executeQuery("SELECT * FROM oradores");
    		
    		while(rs.next()){
    			out.println("<tr>");

    			out.println("<td>");
    			out.println(rs.getInt("id_orador"));
    			out.println("</td>");

    			out.println("<td>");
    			out.println(rs.getString("nombre"));
    			out.println("</td>");

    			out.println("<td>");
    			out.println(rs.getString("apellido"));
    			out.println("</td>");

    			out.println("<td>");
    			out.println(rs.getString("email"));
    			out.println("</td>");
    			
    			out.println("<td>");
    			out.println("<a href='#' data-bs-toggle='modal' data-bs-target='#deleteModal' idDel='"+rs.getInt("id_orador")+"' nombre='"+rs.getString("nombre")+"' apellido='"+rs.getString("apellido")+"'><i class='bi bi-trash-fill'></i></a>");
    			out.println("<a href='#' data-bs-toggle='modal' data-bs-target='#updateModal' idUpd='"+rs.getInt("id_orador")+"' nombre='"+rs.getString("nombre")+"' apellido='"+rs.getString("apellido")+"' email='"+rs.getString("email")+"'><i class='bi bi-pencil-fill'></i></a>");
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
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Orador</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="../controller/addOrador.jsp" method="post">
		          <div class="mb-3 text-center">
		            <input type="text" class="form-control mb-3" id="nomAdd" name="nomAdd" placeholder="Nombre">
		            <input type="text" class="form-control mb-3" id="apeAdd" name="apeAdd" placeholder="Apellido">
		            <input type="text" class="form-control mb-3" id="emailAdd" name="emailAdd" placeholder="Email">
		            <input type="text" class="form-control mb-3" id="dniAdd" name="dniAdd" placeholder="DNI">
		            <input type="text" class="form-control mb-3" id="telAdd" name="telAdd" placeholder="Telefono">
		            <textarea rows="4" class="form-control mb-3" id="temasAdd" name="temasAdd" placeholder="Temas del que hablará"></textarea>
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
		        <form action="../controller/delOrador.jsp" method="post">
		          <div class="mb-3 text-center">
		            <label for="recipient-name" class="col-form-label ">¿Desea eliminar el orador?</label>

		            <input type="hidden" class="form-control" id="recipient-name" name="id_orador">
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
		        <form action="../controller/updOrador.jsp" method="post">
		          <div class="mb-3 text-center">
		           
		            <input type="text" class="form-control" id="idUpd" name="idUpd" readonly="readonly">
		            <input type="text" class="form-control" id="nombre" name="nombre">
		            <input type="text" class="form-control" id="apellido" name="apellido">
		            <input type="text" class="form-control" id="email" name="email">
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
    
    <script src="js/listaDeOradores.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  </body>
</html>