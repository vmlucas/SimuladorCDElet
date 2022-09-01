<%@page import="simuladorElet.*, java.util.*"  %>
<%@taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%
   
	Collection resultTemp = (Collection)session.getAttribute("resultados");
        LinkedList result = new LinkedList( resultTemp );
        String previous = (String)request.getAttribute("previous");
        int cont = ((Integer)request.getAttribute("cont")).intValue();
     

	int i = 0;

	int totalRegistros = 0;
	int tamanhoLista   = result.size();
	int totalRegistrosAux = 0;
	int qtdMax = 4;
	int contMax = 0;

	if (previous.equals("false")) totalRegistros = tamanhoLista;
	else totalRegistros = cont ;

	if (totalRegistros>qtdMax ) {
	    totalRegistrosAux = totalRegistros - qtdMax;
	    totalRegistros    =  qtdMax ;
	}
 
%>



<html>
<head>
<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title>
<LINK REL="StyleSheet" HREF="Css/Eletros.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" src="Js/eletros.js"></SCRIPT>
<STYLE TYPE="text/css">
	A:VISITED{
		text-decoration : none;
		color : Black;
	}
	A:LINK{
		color : Black;
		text-decoration : none;
	}
	A:HOVER{
		text-decoration : underline;
		color : #117BA2;
	}

	.borda {
    border-width: thick; border-color: #336699;
	border-style:solid;
	border-top:  1px #336699;
	border-right : 1px  #336699;
	border-left	:1px  #336699;
}
.style1 {
	font-size: 10px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style6 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px; font-weight: bold; }
.style7 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
}
.style8 {font-family: Verdana, Arial, Helvetica, sans-serif}
</style>

</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="img/bkgSimulador.gif">
<table width="778" height="652" border="0" align="center" cellpadding="0" cellspacing="0" background="img/nada1.gif">
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
                    <td width="770"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td height="414"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr valign="top">
                                <td height="60"><p>&nbsp;</p>
                                    <table width="490" border="0" cellspacing="0" cellpadding="0" align="center">
                                      <tr>
                                        <td width="490" valign="top"><table  border="0" cellpadding="0" cellspacing="0" >
                                            <tr>
                                              <td  height="102"><img src="img/tit_relatorio_Elet.gif" width="450" height="100"></td>
                                            </tr>
                                            <tr>
                       
                                              <td width="460" height="244" valign="top"  >
                                                 <form action="/SimuladorElet/excluiRelatorio.do" method="post">
                                                  <table width="68%" height="674" border="1" cellpadding="0" cellspacing="0" bordercolor="#336699" background="./img/simulador_fundo.gif">
                                                    <tr>
                                                      <td colspan="2" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Data</font></strong></td>
                                                      <% for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++)
                                                         {
			                                      Relatorio aux2 = (Relatorio)result.get(i); 
                                                      %>
                                                      <td width="16%" height="24" bgcolor="#FFFFFF"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><%=aux2.getSimulacao().getDataSimulacao()%></b></font></td>
                                                      <%}  %>
                                                    </tr>
                                                    <tr>
                                                      <td colspan="2" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Reserva de Migra&ccedil;&atilde;o </font></strong></td>
                                                      <%  double reservaMigracao  = 0.0;
		                                         for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
			                                        Relatorio aux2 = (Relatorio)result.get(i); 
		                                                reservaMigracao = aux2.getReservaMigracao(); %>
                                                      <td height="26"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                                                             <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                                <%=reservaMigracao %> 
                                                             </fmt:formatNumber>
                                                             </font></td>
                                                      <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td colspan="2" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Sal&aacute;rio</font></strong></td>
                                                      <% double salarioAtual = 0.0;
		                                         for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
  		                                                Relatorio aux2 = (Relatorio)result.get(i); 
			                                        salarioAtual = aux2.getSimulacao().getParticipante().getSalarioAtual(); %>
                                                      <td height="23"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                                                             <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                                <%=salarioAtual %> 
                                                             </fmt:formatNumber>
                                                             </font></td>
                                                      <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td colspan="2" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Crescimento Salarial</font></strong></td>
                                                      <%
				                          double  crescSalarial = 0.0;
		                                          for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
 		                                               Relatorio aux2 = (Relatorio)result.get(i); 
		                                               crescSalarial = aux2.getSimulacao().getCrescimentoSalarial(); %>
                                                      <td height="24"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                                                            <fmt:formatNumber minFractionDigits="2">
                                                                <%=crescSalarial %> 
                                                             </fmt:formatNumber>%
                                                          </font></td>
                                                      <%}%>
                                                    </tr>
                                                    <% int anoRest1 =0;
	               int anoRest2 =0;

		       %>
                                                    <tr>
                                                      <td colspan="2" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Tempo Contribui&ccedil;&atilde;o</font></strong></td>
                                                      <% 
                                                         String anoRestAux  = "-";
                                                         for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                              Relatorio aux2 = (Relatorio)result.get(i);
			                                      anoRest2 = aux2.getSimulacao().getAnoRest2();
		                                              if ( anoRest2 == 0){ %>
                                                                  <td height="26"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=anoRestAux%></font></td>
                                                              <%}else{%>
                                                                  <td width="10%" height="24"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%= anoRest2%></font></td>
                                                             <%}%>
                                                         <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td colspan="2" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Idade Aposentadoria</font></strong></td>
                                                      <%
                                                        for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                             Relatorio aux2 = (Relatorio)result.get(i);
			                                     if (anoRest1 == 0){%>
                                                      <td height="27"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=anoRestAux%></font></td>
                                                      <%}else{%>
                                                      <td height="30"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=anoRest1%></font></td>
                                                      <%}%>
                                                      <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td colspan="2" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Data da Solicita&ccedil;&atilde;o do Benef&iacute;cio</font></strong></td>
                                                      <% DataEletros dataRest = null;
                                                         for(i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
			                                     Relatorio aux2 = (Relatorio)result.get(i);
		                                             dataRest = aux2.getSimulacao().getDataRest();
			                                     if (dataRest == null){%>
                                                      <td height="25"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=anoRestAux%></font></td>
                                                      <%}else{ %>
                                                      <td height="28"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=dataRest.toString()%></font></td>
                                                      <%}%>
                                                      <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td width="40%" rowspan="2" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Rentabilidade</font></strong></td>
                                                      <td width="34%" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Pr&oacute;ximos 5 anos</font></strong></td>
                                                      <%
			                                  for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                              Relatorio aux2 = (Relatorio)result.get(i);
                                                      %>
                                                      <td height="12"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=aux2.getSimulacao().getRentAnual2()%></font></td>
                                                      <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Anos Seguintes </font></strong></td>
                                                      <%
			                                  for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                              Relatorio aux2 = (Relatorio)result.get(i);
                                                      %>
                                                      <td height="12"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                                                           <%=aux2.getSimulacao().getRentAnual1()%></font></td>
                                                      <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td rowspan="2" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Contribui&ccedil;&atilde;o</font></strong></td>
                                                      <td bgcolor="#FFFFFF"><span class="style6">M&iacute;nima</span></td>
                                                      <%
			                                  for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                              Relatorio aux2 = (Relatorio)result.get(i);
                                                      %>
                                                      <td height="28"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=aux2.getSimulacao().getContribuicaoMin()%></font></td>
                                                      <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td bgcolor="#FFFFFF"><span class="style6">M&aacute;xima</span></td>
                                                      <%
			                                  for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                              Relatorio aux2 = (Relatorio)result.get(i);
                                                      %>
                                                      <td height="28"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=aux2.getSimulacao().getContribuicaoMAx()%></font></td>
                                                      <%}%>
                                                    </tr>
                                                    <% String  numAporte   = null;
		                                       double  numEntAporte = 0.0;
			                               String t  = "-";
                                                    %>
                                                    <tr>
                                                      <td rowspan="3" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Aportes Extraordin&aacute;rios</font></strong></td>
                                                      <td bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Periodicidade</font></strong></td>
                                                      <%
			                                     for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                                 Relatorio aux2 = (Relatorio)result.get(i);
			                                         numEntAporte = aux2.getSimulacao().getAporteEnt();
		                                                 if (numEntAporte == 0.0){ %>
                                                      <td height="25"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=t%></font></td>
                                                      <%}else{ %>
                                                      <td height="25"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=aux2.getSimulacao().getSNumAporte()%></font></td>
                                                      <%}
			                              }%>
                                                    </tr>
                                                    <tr>
                                                      <td bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Valor R$</font></strong></td>
                                                      <%
			                                    for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                                 Relatorio aux2 = (Relatorio)result.get(i);
			                                         numEntAporte = aux2.getSimulacao().getAporteEnt();
		       if (numEntAporte == 0.0){ %>
                                                      <td height="25"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=t%></font></td>
                                                      <%}else{%>
                                                      <td height="25"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=numEntAporte %></font></td>
                                                      <%}
			  } %>
                                                    </tr>
                                                    <tr>
                                                      <td bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Cr&eacute;dito Adicional</font></strong></td>
                                                      <%  double aporteInicial  = 0.0;

		                                          for(i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                              Relatorio aux2 = (Relatorio)result.get(i);
			                                      aporteInicial = aux2.getSimulacao().getAporteInicial();
		                                      %>
                                                      <td height="20"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=aporteInicial %></font></td>
                                                      <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td rowspan="3" bgcolor="#FFFFFF"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Aportes Espor&aacute;dicos</strong></font></td>
                                                      <td bgcolor="#FFFFFF"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Data / Valor</strong></font></td>
                                                      <%
		                                             for(i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                                  Relatorio aux2 = (Relatorio)result.get(i);
                                                      %>
                                                      <td height="10"><span class="style1"><%=aux2.getSimulacao().getDataAporte1() %><br>
                                                            <%=aux2.getSimulacao().getAporte1() %> </span></td>
                                                      <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td bgcolor="#FFFFFF"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Data / Valor</strong></font></td>
                                                      <%
		                                            for(i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                                  Relatorio aux2 = (Relatorio)result.get(i);
			    %>
                                                      <td height="10"><span class="style1"><%=aux2.getSimulacao().getDataAporte2()%><br>
                                                            <%=aux2.getSimulacao().getAporte2() %> </span></td>
                                                      <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td bgcolor="#FFFFFF"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Data / Valor</strong></font></td>
                                                      <%
		                                            for(i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                                  Relatorio aux2 = (Relatorio)result.get(i);
			    %>
                                                      <td height="10"><span class="style1"><%=aux2.getSimulacao().getDataAporte3()%><br>
                                                            <%=aux2.getSimulacao().getAporte3() %> </span></td>
                                                      <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td colspan="2" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Saldo Acumulado </font></strong></td>
                                                      <%
			                                    for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                                  Relatorio aux2 = (Relatorio)result.get(i);
                                                      %>
                                                      <td height="20"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=aux2.getSaldo() %></font></td>
                                                      <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td colspan="2" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Renda Vital&iacute;cia R$</font></strong></td>
                                                      <%
			                                    for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                                 Relatorio aux2 = (Relatorio)result.get(i);
                                                      %>
                                                      <td height="20"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=aux2.getRendaVitalicia() %></font></td>
                                                      <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td colspan="2" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Renda Certa R$</font></strong></td>
                                                      <%
			                                    Relatorio aux2 = null;
                                                            for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                                aux2 = (Relatorio)result.get(i);
                                                      %>
                                                      <td height="20"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=aux2.getRendaProgramada() %></font></td>
                                                      <%}%>
                                                    </tr>
                                                    <% double bpds = aux2.getSimulacao().getReservaBpds(); %>
                                                    <tr>
                                                      <td colspan="2" bgcolor="#FFFFFF"><span class="style6">Resumo da Migra&ccedil;&atilde;o </span></td>
                                                      <%
			                                  for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                              aux2 = (Relatorio)result.get(i);
                                                      %>
                                                      <td height="20"><span class="style7"><a href="/SimuladorElet/destacaRelatorio.do?codigo=<%=aux2.getSimulacao().getDataSimulacao().toString() %> ">#</a></span></td>
                                                      <%}%>
                                                    </tr>
                                                    <tr>
                                                      <td colspan="2" bgcolor="#FFFFFF"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Excluir</font></strong></td>
                                                      <%
			                                  for (i=cont,contMax=0;(i<tamanhoLista)&&(contMax<qtdMax);i++,contMax++){
		                                              aux2 = (Relatorio)result.get(i);
                                                      %>
                                                      <td height="20"><div align="center">
                                                          <input name="<%=i%>" type="checkbox" value="<%=aux2.getSimulacao().getDataSimulacao().toString()%>">
                                                      </div></td>
                                                      <%}%>
                                                    </tr>
                                                  </table>
                                               
                                               <tr bg="./img/simulador_fundo.gif" >
                                                 <td  class="borda" height="40" background="./img/simulador_fundo.gif" ><a href="javascript:window.print();"><img border="0" src="img/botao-imprimir-novo.gif" width="57" height="24"></a>
                                                  <input name="image" type="image" src="img/botao-excluir.gif" width="57" height="22" >
                                                  <input type="hidden" name="cont" value="<%=i%>" >
                                                </td>
                                            </tr>
                                        </table></td>
                                      </tr>
                                       </form>
                                    </table>
                            <tr>
          <td height="20 " valign="top"  >
            <% if ((cont-qtdMax)>=0) { %>
            <a href = "/SimuladorElet/buscaRelatorios.do?previous=true&cont=<%=cont-qtdMax%>"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&lt;Anterior&nbsp;</font></a>
            <%}
			   if ((tamanhoLista>4) && ((cont+qtdMax)<tamanhoLista)){%>
            <a href="/SimuladorElet/buscaRelatorios.do?previous=true&cont=<%=cont+qtdMax%>">
            <font size="2" face="Verdana, Arial, Helvetica, sans-serif">Pr&oacute;ximo></font></a>
            <%}%>            
</table>
                      



    </td>
   
  </tr></table>
              </table>
      </table></td>
  </tr>
  <tr>
  
  <td> <!-- <rodape> -->
        <%@ include file="Script/tit_inf.htm" %>
        <!-- </rodape> --></td></tr>
</table></td>
            <!-- </meio> --><html:link page="/destacaRelatorio.do">
      <bean:message key="link.destacaRelatorio"/>
    </html:link><html:link page="/excluiRelatorio.do">
      <bean:message key="link.excluiRelatorio"/>
    </html:link><html:link page="/buscaRelatorios.do">
      <bean:message key="link.buscaRelatorios"/>
    </html:link></body>

</html>