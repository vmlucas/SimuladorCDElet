

<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<html>
<head>
<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title>
<LINK REL="StyleSheet" HREF="Css/Eletros.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" src="Js/eletros.js"></SCRIPT>
</head>
<style>

 input {font-family:Verdana, Arial, Helvetica, sans-serif ; font-size:10px; }
 select {font-family:Verdana, Arial, Helvetica, sans-serif ; font-size:10px; }

</style>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="img/bkgSimulador.gif">
<table width="778" height="644" border="0" align="center" cellpadding="0" cellspacing="0" background="img/nada1.gif">
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
                <%@ include file="Script/tit_login.jsp" %>
                <!-- </barra login> -->
                <table border="0" cellspacing="13" cellpadding="0">
                  <tr>
                    <td width="770" height="444"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td height="414"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                              <td height="60"><p><img src="./img/tit_simulacaomigr.gif" width="313" height="57"></p>
                                <form action="/SimuladorElet/MelhoreRenda.do" method="post" >
                                  <table width="417" border="0" cellspacing="0" cellpadding="0" align="center" height="236">
                                    <tr valign="top">
                                      <td width="417" height="15" colspan="2"><img src="./img/simulador_top.gif" width="417" height="19"></td>
                                    </tr>
                                    <tr align="center" valign="top">
                                      <td height="186" colspan="2" background="./img/simulador_fundo.gif"><table border="0" cellspacing="3" cellpadding="0" background="./img/nada.gif" width="400">
                                          <tr>
                                            <td colspan="2">&nbsp;</td>
                                          </tr>
                                          <tr valign="top">
                                            <td colspan="2"><img src="img/Tit_AumentarRenda.gif" width="300" height="21"></td>
                                          </tr>
                                          <tr>
                                            <td width="261" height="30" valign="middle"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><b> Qual o valor da renda desejada?</b></font></td>
                                            <td rowspan="3" valign="top" width="130"><table width="125" border="0" cellspacing="0" cellpadding="0" align="right">
                                                <tr>
                                                  <td><div align="right"><a href="/SimuladorElet/redirect.do?page=detalhes"><img src="img/botao-detalhes-novo.gif" width="57" height="24" border="0"></a></div></td>
                                                </tr>
                                                <tr>
                                                  <td><div align="right"><a href="/SimuladorElet/redirect.do?page=inicio"><img src="img/botao-nova-simulacao-novo.gif" width="96" height="24" border="0"></a></div></td>
                                                </tr>
                                                <tr>
                                                  <td><div align="right"><a href="/SimuladorElet/redirect.do?page=parametros"><img src="img/botao-parametros-utilizado-.gif" width="129" height="24" border="0"></a></div></td>
                                                </tr>
                                                <tr>
                                                  <td><div align="right"><a href="/SimuladorElet/redirect.do?page=alterar"><img src="img/botao-alterar-parametros-no.gif" width="112" height="24" border="0"></a></div></td>
                                                </tr>
                                                <tr>
                                                  <td height="22"><div align="right"><a href="javascript:window.print();"><img src="img/botao-imprimir-novo.gif" width="57" height="24" border="0"></a></div></td>
                                                </tr>
                                            </table></td>
                                          </tr>
                                          <tr>
                                            <td valign="middle"><input type="text" name="INumRendaDesejada" size="10" value="0,0" >
                                                <font size="1" face="Verdana, Arial, Helvetica, sans-serif"><font color="#000000">(99999,99)</font></font> </td>
                                          </tr>
                                          <tr>
                                            <td valign="middle" height="41"><input type="image" src="./img/bot_calcular.gif" width="54" height="29" border="0">
                                            </td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                    <tr valign="top">
                                      <td colspan="2"><img src="./img/simulador_boton.gif" width="417" height="19"></td>
                                    </tr>
                                    <tr valign="top">
                                      <td colspan="2"></td>
                                    </tr>
                                  </table>
							    </form>
                                 
                          </table>                        
                    </table></td>
                  </tr>
              </table></td>
            <!-- </meio> -->
          </tr>
        </table>
       
    </td>
  </tr>
  <tr>
    <td height="68" valign="top"> <!-- <rodape> -->
        <%@ include file="Script/tit_inf.htm" %>
<!-- </rodape> --></td>
  </tr>
</table><html:link page="/MelhoreRenda.do">
      <bean:message key="link.MelhoreRenda"/>
    </html:link><html:link page="/redirect.do">
      <bean:message key="link.redirect"/>
    </html:link></body>

</html>