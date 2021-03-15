<%-- 
    Document   : index2
    Created on : 08/03/2020, 13:54:06
    Author     : Carlos
--%>

<%@page import="java.util.List"%>
<%@page import="Classes.Funcoes"%>
<%@page import="Classes.ConectarBD"%>
<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<%
    if (request.getParameterMap().containsKey("result")) {
        if (request.getParameter("result").equals("true")) {

%> <script> alert("Cadastrado com sucesso!");</script>  <%            } else {
%> <script> alert("Erro ao cadastrar usuï¿½rio!");</script>  <%
        }

    }

    Funcoes fc = new Funcoes();
    List<Funcoes> lt = fc.ver();

    String id = "";
    String nome = "";
    String email = "";
    String telefone = "";

    if (lt.size() > 0) {
//pegar a pocisao do ultimo valor recebido
        
        id = ""+lt.get(lt.size()-1).getId();
        nome = lt.get(lt.size()-1).getNome();
        email = lt.get(lt.size()-1).getEmail();
        telefone = lt.get(lt.size()-1).getTelefone();;
    }

%>

<%    
    ConectarBD cdBD = new ConectarBD();
    cdBD.conectar();
%>

<html>
    <head>
        <title>CRUD Java Web</title>
        <meta charset="Latin1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="css/style.css" rel="stylesheet">
    </head>

    <%@ include file="Navbar.html" %>

    <body>
        <div class="row d-flex justify-content-center mt-3 mb-3 p-3">

            <div class="col-sm-5 mb-3 pb-3">

                <div class="text-center">
                    <h3>Preencha os dados abaixo:</h3>
                </div>

                <form method="POST" action="Actions.jsp?adicionar=true">
                    <div class="form-group">
                        <label for="name">Digite seu nome:</label>
                        <input type="text" name="nome" class="form-control" id="nome" placeholder="Nome">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Endereço de email:</label>
                        <input type="email" name="email" class="form-control" id="email1" aria-describedby="emailHelp" placeholder="Seu email">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Digite seu telefone:</label>
                        <input type="number" name="telefone" class="form-control" id="telefone" placeholder="Seu telefone">
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">ENVIAR</button>
                    </div>
                </form>

            </div> <!---fim div p1-->


            <div class="col-sm-5">

                <div class="text-center">
                    <h3>Último usuário cadastrado:</h3>
                </div>

                <form method="POST" action="Actions.jsp">
                    <div class="form-group">
                        <label for="name">ID:</label>
                        <label> <%=id%> </label>
                    </div>

                    <div class="form-group">
                        <label for="name">Nome:</label>
                        <label> <%=nome%> </label>
                    </div>

                    <div class="form-group">
                        <label for="InputEmail">Endereï¿½o de email:</label>
                        <label> <%=email%> </label>
                    </div>

                    <div class="form-group">
                        <label for="InputPhoneNumber">Digite seu telefone:</label>
                        <label> <%=telefone%> </label>
                    </div>

                    <div class="text-center">
                        <a class="btn btn-success m-1" href="VerTodos.jsp">Visualizar Todos</a>
                        <a class="btn btn-warning m-1" href="Editar.jsp?id=<%=id%>">Editar Atual</a>
                        <a class="btn btn-danger m-1" href="Actions.jsp?apagar=true&id=<%=id%>">Excluir Atual</a>
                    </div>
                </form>

            </div><!---fim div p2-->

        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
