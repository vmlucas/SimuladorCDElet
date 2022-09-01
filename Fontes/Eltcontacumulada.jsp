<!--- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
SIMULADOR
Arquivo: Eltcontacumulada.jsp
Objetivo: P�gina mostrada ao passar o mouse sobre o botao Calcular nos formularios EltSimulador2.jsp e EltSimulador2a.jsp
Data: 17/03/2003
Cliente: Eletros
Autor: Rejane Ribeiro
Email:rejane@eletros.com.br
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->

<%@page import="simuladorElet.*, com.eletros.benef.*, com.util.*" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>


<%
  	Modelo modelo = (Modelo)session.getAttribute("modelo");
        
        /* Se a op�ao de contribuicao bruta for a primeira*/
      	double cont_bruta1 = modelo.calculaContribuicaoBruta("1");
	
        /* Se a opcao de contribuicao bruta for a segunda*/
	double cont_bruta2 = modelo.calculaContribuicaoBruta("2");
	
        /* Se a opcao de contribuicao bruta for a terceira*/
	double cont_bruta3 = modelo.calculaContribuicaoBruta("3");
	
	/* Se a opcao de contribuicao bruta for a quarta*/
	double cont_bruta4 = modelo.calculaContribuicaoBruta("4");
	
%>

<html>
<head>
<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#FFFFFF" onload="window.focus();" topmargin="5" rightmargin="2">
<table width="95%" border="0" cellspacing="0" cellpadding="0">
  <tr valign="top">
    <td background="../img/canto_sup_azl_fundo.gif"><img src="../img/canto_sup_azl_esq.gif" width="8" height="9"></td>
    <td background="../img/canto_sup_azl_fundo.gif"><img src="../img/canto_sup_azl_fundo.gif" width="8" height="9"></td>
    <td background="../img/canto_sup_azl_fundo.gif" align="right"><img src="../img/canto_sup_azl_dir.gif" width="11" height="9"></td>
  </tr>
  <tr align="center" valign="top">

    <td colspan="3" background="../img/canto_sup_azl_fundo.gif" valign="top">
      <table width="95%" border="0" height="100%" align="center" valign="top">
        <tr valign="top">
          <td align="left" valign="top">
		  <font face="Verdana, Arial, Helvetica, sans-serif" size="1">
<!--- 		  Exibe descri��o da Data de Nascimento do Benefici�rios  -->
			</font><p><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b>Calculo da Contribu&ccedil;&atilde;o Bruta :</b><br><br>
			

			<b>1.8% e 6%:</b>&nbsp;
                                <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                     <%=cont_bruta1 %> 
                                </fmt:formatNumber>
                        <br><br>
			<b>2.25% e 7.5%:</b>&nbsp;
                                <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                     <%=cont_bruta2 %> 
                                </fmt:formatNumber>
                        <br><br>
			<b>3.375% e 11.25%:</b>&nbsp;
                                <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                     <%=cont_bruta3 %> 
                                </fmt:formatNumber>
                        <br><br>
			<b>4.5% e 15%:</b>&nbsp;
                                <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                     <%=cont_bruta4 %> 
                                </fmt:formatNumber>
                        <br><br>
			 </font>
			  </p>  
		     </td>
        </tr>

      </table>
</body>
</html>