<%-- 
    Document   : Actions
    Created on : 08/03/2020, 11:14:57
    Author     : Carlos
--%>

<%@page import="Classes.Funcoes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Funcoes fc = new Funcoes();
    boolean result;
    
    if (request.getParameterMap().containsKey("apagar")) {
        result = fc.apagar(Integer.parseInt(request.getParameter("id")));
        response.sendRedirect("index.jsp?apagado=" + result);

    } else if (request.getParameterMap().containsKey("editar")) {
        fc.setNome(request.getParameter("nome"));
        fc.setEmail(request.getParameter("email"));
        fc.setTelefone(request.getParameter("telefone"));

        //execute function update
        result = fc.atualizar(request.getParameter("id"));
        response.sendRedirect("index.jsp");

    } else if (request.getParameterMap().containsKey("adicionar")) {
        fc.setNome(request.getParameter("nome"));
        fc.setEmail(request.getParameter("email"));
        fc.setTelefone(request.getParameter("telefone"));

        //execute function add
        result = fc.adicionar();
        response.sendRedirect("index.jsp?result="+result);
    }


%>