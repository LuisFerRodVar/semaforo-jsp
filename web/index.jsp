<%-- 
    Document   : index
    Created on : 21 may 2024, 5:00:35
    Author     : LuisFer
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    // Obtener el estado actual del semáforo por medio de la sesión
    Integer state = (Integer) session.getAttribute("light");
    if (state == null) {
        state = 0;
    }

    // Manejar la lógica del formulario
    String action = request.getParameter("action");
    if ("green".equals(action)) {
        state = 1;
        session.setAttribute("light", state);
    } else if ("red".equals(action)) {
        state = -1;
        session.setAttribute("light", state);
    }   else if ("yellow".equals(action)) {
        state = 0;
        session.setAttribute("light", state);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Semáforo</title>
        <link rel="stylesheet" href="./css/styles.css"
    </head>
    <body>
        <main>
            <form method="post" action="index.jsp">
                <input type="hidden" name="action" value="red">
                <%if(state == -1){%>
                <button class="red"></button>
                <% } else{ %>
                <button type="submit"></button>
                <% } %>
            </form>
            <form method="post" action="index.jsp">
                <input type="hidden" name="action" value="yellow">
                <%if(state == 0){%>
                <button class="yellow"></button>
                <% } else{ %>
                <button type="submit"></button>
                <% } %>
            </form>
            <form method="post" action="index.jsp">
                <input type="hidden" name="action" value="green">
                <%if(state == 1){%>
                <button class="green"></button>
                <% } else{ %>
                <button type="submit"></button>
                <% } %>
            </form>
        </main>
    </body>
</html>
