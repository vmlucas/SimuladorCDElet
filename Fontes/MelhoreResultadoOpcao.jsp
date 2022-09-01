<%@page import="simuladorElet.*, com.eletros.benef.*, com.util.*" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%
       List  projecaoList = (List)session.getAttribute("listProjecao");
       Modelo model = (Modelo)session.getAttribute("modelo");
       Participante part = model.getParticipante();
%>

<html>
<head>


<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title>
<LINK REL="StyleSheet" HREF="Css/Eletros.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" src="Js/eletros.js"></SCRIPT>

<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
<!--


function Versao(){

			self.location.href="EltSimulador1.cfm?versao=1&lStrMesVersao=" + lStrMesVersao;

		}

function MudaVersao(formsub) {
if (formsub.options[formsub.selectedIndex].value != '')
	{
		//var endereco;

		self.location.href = "EltSimulador1.cfm?versao=1&lStrMesVersao=" + formsub.options[formsub.selectedIndex].value;

		//parent.frames[6].location = endereco;
		//top.frames[6].location.reload;
		//endereco.refresh;
	}
}


function cheka_val()
{
	if (frmsimulacao.INumCrescSalarial.value > 9.9)
		{
			alert("Valor deve ser menor que 10%.");
			frmsimulacao.INumCrescSalarial.value = " ";
			frmsimulacao.INumCrescSalarial.focus();
			return false;
		}
}

function teste(theURL,winName,features) { //v2.0
  novaJanela=window.open(theURL,winName,features);
  novaJanela.focus();
}

//-->
</script>
<style>

 input {font-family:Verdana, Arial, Helvetica, sans-serif ; font-size:10px; }
 select {font-family:Verdana, Arial, Helvetica, sans-serif ; font-size:10px; }

</style>

</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="img/bkgSimulador.gif">

<table width="795" border="0" align="center" cellpadding="0" cellspacing="0" background="img/nada1.gif" bgcolor="#1A50B8">
<tr>
	<td width="795" valign="top">
		<!-- <topo> -->
	    <%@ include file="./Script/tit_sup.htm" %>
		<!-- </topo> -->	
		
		<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<!-- <lateral esquerda> -->
			<td width="6" height="100%" valign="top" class="bkgLatEsquerda">&nbsp;		  </td>
			<!-- </lateral esquerda> -->
			<!-- <meio> -->
			<td valign="top" width="770">
				<!-- <barra login> -->
				  <%@ include file="Script/tit_login.jsp" %>
				<!-- </barra login> -->
		
				<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="776">

	  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>
			      <table width="100%" border="0" cellspacing="0" cellpadding="0">
				    
				        <tr>
				          <td height="60" colspan="2">
                        <form action="EltSimuladorDetalhes.jsp" method="post" >
                            <table width="466" border="0" cellspacing="0" cellpadding="0" align="center"><tr>
    <td width="466" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr valign="top">
            <td height="60"><p><img src="./img/tit_simulacaomigr.gif" width="313" height="57"></p>
                <table width="415" border="0" cellspacing="0" cellpadding="0" align="center" height="306">
                  <tr valign="top">
                    <td colspan="2" height="15"><img src="./img/simulador_top.gif" width="417" height="19"></td>
                  </tr>
                  <tr align="center" valign="top">
                    <td height="268" colspan="2" background="./img/simulador_fundo.gif"><table width="352" height="304" border="0" align="center" cellpadding="0" cellspacing="0" background="./img/nada.gif">
                        <tr valign="top">
                          <td height="33" colspan="3"><img src="./img/Tit_AumentarRenda.gif" width="300" height="21"></td>
                        </tr>
                            <tr>
                              <% if (!part.getNumEletros().equals("000")){%>
                                 <td height="35" valign="bottom"><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Na hip&oacute;tese de migra&ccedil;&atilde;o de 100% da reserva matem&aacute;tica suas op&ccedil;&otilde;es ser&atilde;o : </strong></font></td>
                                   <%}else{%>
                                  <td height="35" ><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></td>
                                 <%}%>
                                  <td width="130" height="82" rowspan="3" >
                                  <table width="125" border="0" cellspacing="0" cellpadding="0" align="right">
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
                          <td width="197" height="26" valign="bottom"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><strong>Op&ccedil;&atilde;o </strong></font> </td>
                        </tr>
                        <tr>
                          <td height="94" valign="top"><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif">Continuar contribuindo por um per&iacute;odo maior.<br>
                          Veja abaixo a sua renda para cada ano extra de contribui&ccedil;&atilde;o.</font><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">&nbsp;</font></td>
                        </tr>
                        <tr>
                          <td colspan="2" valign="bottom" height="87">
                            <table width="43%" border="0" align="center" cellpadding="2" cellspacing="2" bordercolor="#FF9933">
                              <%  int cont = 0;  
                                for (int i=0; i< projecaoList.size(); i++){
                                 Relatorio aux = (Relatorio)projecaoList.get(i);
                                 if (cont==0){ 
                          %>
                              <tr align="center" bordercolor="#FF9933" bgcolor="#FF9933">
                                <td><strong><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=i+1%>&deg;&nbsp;ano</font></strong></td>
                                <td><strong><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                     <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                      <%=aux.getRendaVitalicia() %> 
                                     </fmt:formatNumber>
                                 </font></strong></td>
                              </tr>
                              <% cont=1;}else{%>
                              <tr align="center" bordercolor="#FF9933" bgcolor="#FFFFFF">
                                <td><strong><font color="#FF9933" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=i+1%>&deg;&nbsp;ano</font></strong></td>
                                <td><strong><font color="#FF9933" size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                   <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                      <%=aux.getRendaVitalicia() %> 
                                     </fmt:formatNumber>
                                   </font></strong></td>
                              </tr>
                              <%cont=0;}}%>
                          </table></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr valign="top">
                    <td colspan="2"><img src="./img/simulador_boton.gif" width="417" height="19"></td>
                  </tr>
                </table>
                <p>&nbsp;</p>
      </table></td>
    </tr>
                            </table>
				            </form>
				          </td>
				        </tr>
			      </table>
 			</td>
		</tr>
      	</table>
</td>
				</tr>
				</table>		
			</td>
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
  </html:link></body>
</html>
