<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="timed_password_generator.class.asp"-->
<%
    Dim my_psw
    Set my_psw = new timed_password_generator

    Response.write(my_psw.Get_password())
%> 