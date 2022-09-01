<%@page import="simuladorElet.*, com.eletros.benef.*, com.util.*" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<html>
<head>
<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title>
<LINK REL="StyleSheet" HREF="Css/Eletros.css" type="text/css">
</head>


<%
   
     Modelo modelo = (Modelo)session.getAttribute("modelo");
     Relatorio rel = (Relatorio)session.getAttribute("relatorio");
     Participante participante = modelo.getParticipante(); 
%>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="img/bkgSimulador.gif">
<table width="725" border="0" align="center" cellpadding="0" cellspacing="0" background="img/nada1.gif">
  <tr>
    <td width="725" valign="top"><!-- <topo> -->
        <%@ include file="./Script/tit_sup.htm" %>
        <!-- </topo> -->
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <!-- <lateral esquerda> -->
            <td width="6" height="100%" valign="top" class="bkgLatEsquerda">&nbsp;</td>
            <!-- </lateral esquerda> -->
            <!-- <meio> -->
            <td valign="top" width="720"><!-- <barra login> -->
                <%@ include file="Script/tit_login.jsp" %>
                <!-- </barra login> -->
                <table width="712" border="0" cellpadding="0" cellspacing="13">
                  <tr>
                    <td width="701">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td height="60"><p><img src="./img/tit_simulacaomigr.gif" width="313" height="57"></p>
                              <table width="415" border="0" cellspacing="0" cellpadding="0" align="center" height="242">
                                <tr valign="bottom">
                                  <td colspan="2" height="15"><img src="./img/simulador_top.gif" width="417" height="19"></td>
                                </tr>
                                <tr align="center" valign="top">
                                  <td height="190" colspan="2" background="./img/simulador_fundo.gif">
                                  <table width="407" border="0" cellspacing="3" cellpadding="0" background="./img/nada.gif">
                                      <tr valign="top">
                                        <td width="283" height="23" >
                                            <img src="img/Tit_resultSimul.gif" width="239" height="20">
                                        </td>
                                        <td rowspan="18" width="112"><div align="right"> <br>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                  <tr>
                                                    <td><div align="right">
                                                       <a href="/SimuladorElet/redirect.do?page=detalhes">
                                                        <img src="img/botao-detalhes-novo.gif" width="57" height="24" border="0"></a>
                                                    </div></td>
                                                  </tr>
                                                 <% if (!(participante.getNumEletros().equals("000"))){ %>
												  <tr>
                                                    <td><div align="right"><a href="/SimuladorElet/redirect.do?page=inicio"><img src="img/botao-nova-simulacao-novo.gif" width="96" height="24" border="0"></a></div></td>
                                                  </tr>
                                                  						  <tr>
                                                    <td><a href="/SimuladorElet/insereRelatorio.do"><img src="img/botao-salvar-simulacao.gif" width="108" height="24" border="0"></a></td>
                                                  </tr>
                                                  <tr>
                                                    <td><div align="right"><a href="javascript:window.print();"><img border="0" src="img/botao-imprimir-novo.gif" width="57" height="24"></a></div></td>
                                                  </tr>
                                                  <%}else{%>
												  <tr>
                                                    <td><div align="right"><a href="/SimuladorElet/redirect.do?page=inicio"><img src="img/botao-nova-simulacao-novo.gif" width="96" height="24" border="0"></a></div></td>
                                                  </tr>
                                                  <tr>
                                                    <td><div align="right"><a href="javascript:window.print();"><img border="0" src="img/botao-imprimir-novo.gif" width="57" height="24"></a></div></td>
                                                  </tr>
                                                  <%}%>
                                                </table>
                                        </div></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" height="27">
										<div align="left">
										<font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" size="2"><b>Renda Vital&iacute;cia: </b></font><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="1"> 
                                           <strong><fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                   <%=rel.getRendaVitalicia()%> </fmt:formatNumber>
                                          </strong></font></div></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" height="38">
										<div align="left">
										<font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" size="2"><b>Idade na data de solicita&ccedil;&atilde;o do <br>
                    Benef&iacute;cio:</b></font><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="1">
                    <% if (((rel.getIdade()+rel.getTempoCont())%12) >= 2) {%>
                    <font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="1"> <strong><%=((rel.getIdade()+rel.getTempoCont())/12)%> anos e <%=((rel.getIdade()+rel.getTempoCont())%12)%> meses</strong></font>
                    <% }else{%>
                    <font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="1"> <strong><%=((rel.getIdade()+rel.getTempoCont())/12)%> anos
                    <% if (((rel.getIdade()+rel.getTempoCont())%12)>0) { %>
                    e <%=((rel.getIdade()+rel.getTempoCont())%12)%> m&ecirc;s</strong></font>
                    <%}}%>
                  </font></div></td>
                                      </tr>
                                  </table></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2"><img src="./img/simulador_boton.gif" width="417" height="19"></td>
                                </tr>
                              </table>
                      </table>
                    </td>
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
  

</table><html:link page="/redirect.do">
      <bean:message key="link.redirect"/>
    </html:link><html:link page="/insereRelatorio.do">
      <bean:message key="link.insereRelatorio"/>
    </html:link></body>

</html>