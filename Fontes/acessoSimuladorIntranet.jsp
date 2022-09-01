<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Sistema de Acesso ao Simulador Eletrobr&aacute;s</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="Css/estilo.css" rel="stylesheet" type="text/css">


<style type="text/css">
<!--
.style1 {color: #ECE9D8}
-->
</style>
</head>
<!-- Menu da intranet -->
<%@include file="menu.jsp" %>

 <form action="/SimuladorElet/login.do" name="form1" method="post">
<table width="754" border="1" bordercolor="#FFFFFF">
  <TR bordercolor="#F1F1E2" bgColor=#F1F1E2>
     <TD colspan="2"><img src="images/barra4.gif" width="746" height="21" ></TD>
  </TR>
  <tr bordercolor="#993399">
    <td width="781" valign="top" bordercolor="#FFFFFF">
     
      <table width="96%" border=0 cellpadding=0 cellspacing=0 bgcolor="#F1f1e2">
      <tr bordercolor="#f1f1e2" >
			   <td class="titulo1" >
			     <DIV align="center">
            Sistema de Acesso ao Simulador Eletrobr&aacute;s</DIV>
			   </td>
      </tr>
			<tr bordercolor="#f1f1e2" >
			  <td >&nbsp;</td>
			</tr>
	    <tr bordercolor="#f1f1e2">
        <td height="113" class="textotitulo" >
          <DIV align="center">
	    <table width="209" height="70" border="2" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
              <tr>
                <td width="188" height="16"><span class="textotabela">N&uacute;mero Eletros do Participante: </span></td>
               
              </tr>
              <tr>
                <td height="17"><input name="NumLog" type="text" class="textotabela" value="" size="30" maxlength="7">
                <input type="hidden" name="loginUsu" value="<%=(String)session.getAttribute("login") %>"></td>
              </tr>
              <tr>
                <td height="17"><input type="image" src="./images/bot_ok.gif" width="50" height="24" align="middle" onClick="location.href='/SimuladorElet/login.do?NumLog='+form1.NumLog.value&loginUsu=<%=(String)session.getAttribute("login") %>">
                  <img src="images/bot_voltar.gif" width=80
              height=24 align="absmiddle" onClick="location.href='javascript:history.back()'"> </td>
              </tr>
            </table>
	  </DIV>
          </td>
      </tr>  
      <tr bordercolor="#f1f1e2">
         <td class="textotitulo" >
           <DIV align="center">           </DIV>
         </td>
	    </tr>
	    <tr bordercolor="#f1f1e2">
          <td height="10" class="titulo1">&nbsp;</td>
      </tr>
      <tr bordercolor="#f1f1e2">
         <td valign="middle"> 
           <DIV align="center">&nbsp;
           </DIV>
         </td>
      </tr>
      <TR bordercolor="#F1F1E2" bgColor=#F1F1E2>
              <TD ><img src="images/barra4.gif" width="746" height="21" ></TD>
            </TR>
      </table>

	</TD>
  </tr>
</table>
</form>
</body>
</html>
