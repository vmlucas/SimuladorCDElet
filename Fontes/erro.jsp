


<html>
<head>
<title>ERRO!!! Plano CD Eletrobras/Eletros/Cepel</title>
<LINK REL="StyleSheet" HREF="Css/Eletros.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" src="Js/eletros.js"></SCRIPT>
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="img/bkgSimulador.gif">
<table width="736" border="0" align="center" cellpadding="0" cellspacing="0" background="img/nada1.gif">
  <tr>
    <td valign="top"><!-- <topo> -->
        <%@ include file="./Script/tit_sup.htm" %>
        <!-- </topo> -->
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <!-- <lateral esquerda> -->
            <td width="6" height="100%" valign="top" class="bkgLatEsquerda">&nbsp;</td>
            <!-- </lateral esquerda> -->
            <!-- <meio> -->
            <td valign="top" width="770"><!-- <barra login> -->
                <%@ include file="Script/tit_loginIncorreto.jsp" %>
                <!-- </barra login> -->
                <table border="0" cellspacing="13" cellpadding="0">
                  <tr>
                    <td width="770"><table width="498" border="0" cellspacing="0" cellpadding="0" align="center">
                      <tr>
                        <td width="498" valign="top"><br>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr valign="top">
                                <td height="60"><p><img src="./img/tit_simulacaomigr.gif" width="313" height="57"></p>
                            </table>
                           <table width="415" border="0" cellspacing="0" cellpadding="0" align="center" height="300">
                                <tr valign="top">
                                  <td colspan="2" height="15"><img src="./img/simulador_top.gif" width="417" height="19"></td>
                                </tr>
                                <tr align="center" valign="top">
                                  <td colspan="2" background="./img/simulador_fundo.gif"><table width="400" border="0" cellspacing="3" cellpadding="0" background="./img/nada.gif">
                                      <tr>
                                        <td width="144" height="40" colspan="2" valign="top"><p><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><b><br>
                                        </b></font></p></td>
                                      </tr>
                                      <tr>
                                        <%
                                           String erro = (String)request.getAttribute("ErroMsg");
                                        %>
                                        <td colspan="2"><p><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><b><%=erro %></b></font></p></td>
                                      </tr>
                                  </table></td>
                                </tr>
                                <tr>
                                  <td valign="top"><a href="javascript:history.back()"><img src="img/simulador_voltar.gif" width="67" height="38" border="0"> </a> </td>
                                  <td valign="top"><input type="Image" src="img/simulador_baixo05.gif" border="0" width="350" height="38">
                                  </td>
                                </tr>
                              </table>
                         </td>
                      </tr>
                    </table></td>
                  </tr>
              </table></td>
            <!-- </meio> -->
          </tr>
        </table>
        <!-- <rodape> -->
        <%@ include file="Script/tit_inf.htm" %>
        <!-- </rodape> -->
    </td>
  </tr>
  
 
</table>

</body>

</html>