<%-- 
    Document   : VerTodos
    Created on : 10/03/2020, 19:20:15
    Author     : Carlos
--%>

<%@page import="java.util.List"%>
<%@page import="Classes.Funcoes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Funcoes fc = new Funcoes();
    List<Funcoes> RlistUsers = fc.ver();

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="css/style.css" rel="stylesheet">
        <title>Ver Todos</title>
    </head>
    <body>

        <%@ include file="Navbar.html"%>

        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Email</th>
                    <th scope="col">Telefone</th>
                    <th class="text-center" scope="col">Ações</th>
                </tr>
            </thead>
            <tbody style="background-color: white">
                <%
                    //percorro a lista atribuindo para data valores que estão na lista a cada ciclo
                    for (Funcoes datas : RlistUsers) {
                        
                %>
                <tr>
                    <th scope="row"><%=datas.getId()%></th>
                    <td><%=datas.getNome()%></td>
                    <td><%=datas.getEmail()%></td>
                    <td><%=datas.getTelefone()%></td>
                    <td class="text-center">
                        <!-- Passo o id da linha da lista para o href como referencia de linha quando o usuario
                             clica eu sei em qual clicou -->
                        <a type="button" href="Editar.jsp?id=<%=datas.getId()%>" class="btn btn-warning btn-sm">EDITAR</a>
                        <a type="button" href="Actions.jsp?apagar=true&id=<%=datas.getId()%>" class="btn btn-danger btn-sm">EXCLUIR</a>
                    </td>
                </tr>
                <% }%>

            </tbody>
        </table>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
