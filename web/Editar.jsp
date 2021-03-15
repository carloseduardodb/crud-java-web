<%-- 
    Document   : Editar
    Created on : 08/03/2020, 19:45:01
    Author     : Carlos
--%>

<%@page import="java.util.List"%>
<%@page import="Classes.Funcoes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    String id = "";
    String nome = "";
    String email = "";
    String telefone = "";
    
    Funcoes fc = new Funcoes();
    
    List<Funcoes> lista = fc.ver();
    
    for(Funcoes value : lista){
        String idr = ""+value.getId();
        if(idr.equals(request.getParameter("id"))){
            id = ""+value.getId();
            nome = value.getNome();
            email = value.getEmail();
            telefone = value.getTelefone();
        }
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="css/style.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="Navbar.html" %>
        <div class="p-5">
            <form method="POST" action="Actions.jsp?editar=true&id=<%=id%>">
                <div class="form-group">
                    <label for="name">Digite seu nome:</label>
                    <input type="text" value="<%=nome%>" name="nome" class="form-control" id="nome" placeholder="Nome">
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail1">Endereço de email:</label>
                    <input type="email" value="<%=email%>" name="email" class="form-control" id="email1" aria-describedby="emailHelp" placeholder="Seu email">
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail1">Digite seu telefone:</label>
                    <input type="number" value="<%=telefone%>" name="telefone" class="form-control" id="telefone" placeholder="Seu telefone">
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-warning">ATUALIZAR</button>
                </div>
            </form>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
