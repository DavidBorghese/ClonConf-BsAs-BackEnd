<!doctype html>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Listado Participantes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="./css/index.css">
  </head>
  <body>
    <jsp:include page="menu.jsp"></jsp:include>
    <div class="container">
    	<h1 class="text-center m-3 fs-3">Listado de Participantes</h1>
		<% 
			String mensaje=request.getParameter("mensaje");
			if(mensaje!=null) {
				out.println("<div class='bg-danger text-center p-1 rounded'>");
				out.println(mensaje);
				out.println("</div>");
			}	
		%>	    
    
    	<button class="btn btn-primary my-2" data-bs-toggle='modal' data-bs-target='#createModal'>Agregar Participante</button>
    	
    	
    	<table class="table text-center table-dark table-hover">
			<thead>
				<tr>
					<th scope="col">#ID</th>
					<th scope="col">Nombre</th>
					<th scope="col">Apellido</th>
					<th scope="col">DNI</th>
					<th scope="col">Email</th>
					<th scope="col">Teléfono</th>
					<th scope="col">Cantidad Ticket</th> 
					<th scope="col">Ocupación</th> 
					<th scope="col">Estudios</th> 					 
					<th scope="col">Operaciones</th>
				</tr>
			</thead>
    		
    		<tbody>
    		<% 
    		ConexionDB con=new ConexionDB();
    		Statement st=con.conectar();
    		ResultSet rs=st.executeQuery("SELECT * FROM participantes");
    		
    		while(rs.next()){
    			out.println("<tr>");

    			out.println("<td>");
    			out.println(rs.getInt("id"));
    			out.println("</td>");

    			out.println("<td>");
    			out.println(rs.getString("nombre"));
    			out.println("</td>");

    			out.println("<td>");
    			out.println(rs.getString("apellido"));
    			out.println("</td>");
    			
    			out.println("<td>");
    			out.println(rs.getString("dni"));
    			out.println("</td>");    			
    			
    			out.println("<td>");
    			out.println(rs.getString("email"));
    			out.println("</td>");
    			
    			out.println("<td>");
    			out.println(rs.getString("telefono"));
    			out.println("</td>");
    			
    			out.println("<td>");
    			out.println(rs.getString("cantticket"));
    			out.println("</td>");
    			
    			out.println("<td>");
    			out.println(rs.getString("ocupacion"));
    			out.println("</td>");
    			
    			out.println("<td>");
    			out.println(rs.getString("estudios"));
    			out.println("</td>");
    			
    			out.println("<td>");
    			out.println("<a href='#' data-bs-toggle='modal' data-bs-target='#deleteModal' idDel='"+rs.getInt("id")+"' nombre='"+rs.getString("nombre")+"' apellido='"+rs.getString("apellido")+"'><i class='bi bi-trash-fill'></i></a>");
    			out.println("<a href='#' data-bs-toggle='modal' data-bs-target='#updateModal' idUpd='"+rs.getInt("id")+"' nombre='"+rs.getString("nombre")+"' apellido='"+rs.getString("apellido")+"' dni='"+rs.getInt("dni")+"' email='"+rs.getString("email")+"' telefono='"+rs.getInt("telefono")+"' cantticket='"+rs.getInt("cantticket")+"' ocupacion='"+rs.getString("ocupacion")+"' estudios='"+rs.getString("estudios")+"' ><i class='bi bi-pencil-fill'></i></a>");
    			out.println("</td>");    			

    			out.println("</tr>");
    		}
    		%>
    		
    		</tbody>
    	</table>
    	
    	
		<!-- Create modal -->
		<div class="modal fade" id="createModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Crear Participante</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="../controller/addParticipante.jsp" method="post">
		          <div class="mb-3 text-center">
		            <input type="text" class="form-control mb-3" id="nombre" name="nombre" placeholder="Nombre">
		            <input type="text" class="form-control mb-3" id="apellido" name="apellido" placeholder="Apellido">
		            <input type="text" class="form-control mb-3" id="dni" name="dni" placeholder="DNI">
		            <input type="text" class="form-control mb-3" id="email" name="email" placeholder="Email">
		            <input type="text" class="form-control mb-3" id="telefono" name="telefono" placeholder="Teléfono">
		            <input type="number" class="form-control mb-3" id="cantticket" name="cantticket">
		            <input type="text" class="form-control mb-3" id="ocupacion" name="ocupacion" placeholder="Ocupacion">
		            <input type="text" class="form-control mb-3" id="estudios" name="estudios" placeholder="Estudios">
		          </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
			        <button type="submit" class="btn btn-primary">Crear</button>
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
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Modificar Participante</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="../controller/updParticipante.jsp" method="post">
		          <div class="mb-3 text-center">
		            <input type="hidden" class="form-control " id="idUpd" name="idUpd" readonly="readonly">
		            <input type="text" class="form-control mb-3" id="nombre" name="nombre">
		            <input type="text" class="form-control mb-3" id="apellido" name="apellido">
		            <input type="text" class="form-control mb-3" id="dni" name="dni">
		            <input type="text" class="form-control mb-3" id="email" name="email">
		            <input type="text" class="form-control mb-3" id="telefono" name="telefono">
		            <input type="text" class="form-control mb-3" id="cantticket" name="cantticket">
		            <input type="text" class="form-control mb-3" id="ocupacion" name="ocupacion">
		            <input type="text" class="form-control mb-3" id="estudios" name="estudios">
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
		
		<!-- Delete modal -->
		<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar Participante</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="../controller/delParticipante.jsp" method="post">
		          <div class="mb-3 text-center">
		            <label for="recipient-name" class="col-form-label ">¿Desea eliminar el Participante?</label>
		           
		            <input type="hidden" class="form-control" id="recipient-name" name="id">
		          </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
			        <button type="submit" class="btn btn-primary">Eliminar</button>
			      </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>		
    	
    </div>
    
    <script src="js/listaParticipantes.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  </body>
