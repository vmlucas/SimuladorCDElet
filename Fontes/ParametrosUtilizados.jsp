<%@page import="simuladorElet.*, com.eletros.benef.*, com.util.*" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%
       Modelo modelo = (Modelo)session.getAttribute("modelo");
       Relatorio rel = (Relatorio)session.getAttribute("relatorio");
       Simulacao simu = (Simulacao)session.getAttribute("simulacao");
%>
<%
	int dia_nasc      = 
            modelo.getParticipante().getDtNascimento().getDia();
	int mes_nasc      = modelo.getParticipante().getDtNascimento().getMes();
	int ano_nasc      = modelo.getParticipante().getDtNascimento().getAno();
        
        String idadeDep = "Não informado.";
        if( simu.isContrataPensao() )
            idadeDep = String.valueOf( simu.getIdadeDependente())+" anos.";
            
	double reserva_migracao   = rel.getReservaMigracao();
	double aporte_inicial= simu.getAporteInicial();
	double salario_atual = simu.getParticipante().getSalarioAtual();
	double cresc_salarial= simu.getCrescimentoSalarial();
	int rent_anual    = simu.getRentAnual1();
	int rent_anual2   = simu.getRentAnual2();
	int idade_aposent = simu.getIdadeAposentadoria();
	String num_aporte    = simu.getOptAporteContribuicao();
	double num_ent_aporte= simu.getAporteEnt();
	double rendaVitalicia  = rel.getRendaVitalicia();
	double rendaProgramada = rel.getRendaProgramada();
	double contAcum        = rel.getContAcum();
	double aporteTotal     = rel.getAporteTotal();
	double reservaMigracao    = rel.getReservaMigracao();
	int idade           = rel.getIdade();
	double saldo           = rel.getSaldo(); 
	double salarioFinal    = rel.getSalarioFinal();
	double percentual      = rel.getPercentual();
	double contBruta       = rel.getContBruta();
	double tempoCont       = rel.getTempoCont();
	double bpds            = modelo.getBpds();
        int    tempCont1       = ((int)tempoCont/12);
	int    tempCont2       = ((int)tempoCont%12);
        
        Participante part = modelo.getParticipante();
        
%>

<html>
<head>

<LINK REL="StyleSheet" HREF="Css/Eletros.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" src="Js/eletros.js"></SCRIPT>
<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title>
<style type="text/css">
<!--
.style1 {font-weight: bold}
.style3 {
	font-size: 14px;
	font-weight: bold;
}
.style4 {
	color: #000000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="img/bkgSimulador.gif">
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" background="img/nada1.gif">
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
                    <td width="770"><table width="508" border="0" cellspacing="0" cellpadding="0" align="center">
                      <tr>
                        <td width="508" valign="top"><table width="89%" border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                              <td height="60"><p><img src="./img/tit_simulacaomigr.gif" width="313" height="57"></p>
                          </table>
                           <form action="">
                              <table width="417" border="0" cellspacing="0" cellpadding="0" align="center" height="300">
                                <tr valign="top">
                                  <td width="417" height="15" colspan="2"><img src="./img/simulador_top.gif" width="417" height="19"></td>
                                </tr>
                                <tr align="center" valign="top">
                                  <td colspan="2" background="./img/simulador_fundo.gif"><table width="406" border="0" cellspacing="3" cellpadding="0" background="./img/nada.gif">
                                      <tr>
                                        <td colspan="2">&nbsp;</td>
                                      </tr>
                                      <tr valign="top">
                                        <td colspan="2"><img src="img/Tit_parametros.gif" width="208" height="21"></td>
                                      </tr>
                                      <tr>
                                        <td width="271" valign="middle" height="45"><p><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b><font color="#336699" size="2">Data Nasc. Participante:<br>
                                        </font></b><font color="#336699" size="2"><font color="#000000"><strong><%=dia_nasc %> / <%=mes_nasc %> /<%=ano_nasc %></strong></font></font></font></p></td>
                                      </tr>
                                      <tr>
                                          <td width="271" valign="middle" height="45"><p><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b><font color="#336699" size="2">Idade do dependente mais novo na data de aposentadoria.<br>
                                          </font></b><font color="#336699" size="2"><font color="#000000"><strong><%=idadeDep %> </strong></font></font></font></p></td>
                                        <td rowspan="3" width="126" valign="top"><table width="126" border="0" cellspacing="0" cellpadding="0" align="right">
                                            <tr>
                                              <td width="126"><div align="right"><a href="/SimuladorElet/redirect.do?page=detalhes"><img src="img/botao-detalhes-novo.gif" width="57" height="24" border="0"></a></div></td>
                                            </tr>
                                            <tr>
                                              <td><div align="right"><a href="/SimuladorElet/redirect.do?page=inicio"><img src="img/botao-nova-simulacao-novo.gif" width="96" height="24" border="0"></a></div></td>
                                            </tr>
                                            <tr>
                                              <td><div align="right"><a href="/SimuladorElet/redirect.do?page=alterar"><img src="img/botao-alterar-parametros-no.gif" width="112" height="24" border="0"></a></div></td>
                                            </tr>
                                            <tr>
                                              <td><div align="right"><a href="/SimuladorElet/redirect.do?page=melhoreRenda"><img src="img/botao-melhore-novo.gif" width="112" height="24" border="0"></a></div></td>
                                            </tr>
                                            <tr>
                                              <td><div align="right"><a href="javascript:window.print();"><img border="0" src="img/botao-imprimir-novo.gif" width="57" height="24"></a></div></td>
                                            </tr>
                                            
                                        </table></td>
                                      </tr>
                                      <tr>
                                        <td width="271" valign="top" height="65"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b><font color="#336699" size="2"><br>
                    Rentabilidade anual adotada:</font></b><font color="#336699" size="2"><font color="#000000"> <br>
                    <strong><%=rent_anual %>% nos cinco primeiros anos<br>
                    <% if (rent_anual2 != 0){                    
				      out.println(rent_anual2  + "% nos anos seguintes") ; 
				  }%>
                  </strong> </font></font></font></td>
                                      </tr>
                                      <tr>
                                        <td width="271" height="40" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b><font color="#336699" size="2"><br>
                    Faixa de contribui&ccedil;&atilde;o:<br>
                                          </font></b><font color="#336699" size="2"><font color="#000000"> <strong>
                                          <%=simu.getContribuicaoMin()+" e "+
                                                simu.getContribuicaoMAx() %>
                                          </strong> </font></font></font></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" height="66" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><b><br>
                    Tempo de contribui&ccedil;&atilde;o no Plano CD:<br>
                                          </b></font> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"> <strong>
                                          <% if (tempCont1<2){%>
                                          <%=tempCont1%> ano
                                          <%}else{%>
                                          <%=tempCont1%> anos
                                          <%}%>
                                          <% if (tempCont2>0){ %>
                    e
                    <% if (tempCont2>1){%>
                    <%=tempCont2%> meses
                    <%}else{%>
                    <%=tempCont2%> m&ecirc;s
                    <%}}%>
                                        </strong></font> </td>
                                      </tr>
                                      <!--        <tr> 
                  <td height="25" valign="top"><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Benef&iacute;cio de Risco : </strong><font color="#000000">10%</font> </font></td>
                  <td height="25" valign="top">&nbsp;</td>
                </tr> -->
                                      <tr>
                                        <td height="25" valign="top"><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Percentual Destinado para :</strong></font></td>
                                        <td height="25" valign="top">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td height="147" colspan="2" valign="top"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Administra&ccedil;&atilde;o do Passivo (Sobrecarga Administrativa) </strong> <br>
                    3% incidente sobre as contribui&ccedil;&otilde;es mensais obrigat&oacute;rias e extraordin&aacute;rias (volunt&aacute;rias). <br>
                    <br>
                    <strong>Administra&ccedil;&atilde;o do Ativo</strong> <br>
                    <br>
                    Ser&aacute; deduzido o valor correspondente a 0,5% a.a. sobre o estoque de investimentos.</font> </td>
                                      </tr>
                                     
                                      <tr>
                                         <td height="127" colspan="3"><b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">Sal&aacute;rio Atual: 
                                          </font></b> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"> <strong>
                                              <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                      <%=salario_atual %> 
                                            </fmt:formatNumber>
                                          </strong></font>
										    <p><strong><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">C</font></strong><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>rescimento Salaria</strong><b>l:</b></font> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000">
                                                                                        <strong>
                                                                                        <fmt:formatNumber minFractionDigits="2">
                                                                                          <%=cresc_salarial %> 
                                                                                        </fmt:formatNumber>%
                                                                                        </strong></font> <br>
										    <% if (!(part.getNumEletros().equals("000"))){%>
                                          <font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>Reserva de Migra&ccedil;&atilde;o:</b></font><span class="style4"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                                                         <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                                                          <%=reserva_migracao %> 
                                                                                        </fmt:formatNumber>
                                                                                         </font></span><br>
                                        </p>
										    <%}%>
										
										</td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" height="10" valign="top"> <span class="inpBusca"><span class="style3"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000"><font color="#333366"><font color="#336699">Contribui&ccedil;&otilde;es Extraordin&aacute;rias</font></font></font></span></span><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><font color="#336699" size="2"><b><b><br>
                                          </b></b></font></font> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><br>
                                          </font>
                                          <% if (part.getNumEletros().equals("000")){%>
                                          <b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">Reserva de </font></b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><font color="#336699"><b> Migra&ccedil;&atilde;o:</b></font></font> <span class="style4"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                             <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                                                          <%=aporte_inicial %> 
                                                                                        </fmt:formatNumber>
                                             </font></span><br>
                                          <%}else{%>
                                          <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><font color="#336699"><b>Cr&eacute;dito no momento da Simula&ccedil;&atilde;o:</b></font> 
                                             <strong>
                                             <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                    <%=aporte_inicial %> 
                                             </fmt:formatNumber>
                                             </strong><br>
                                         <%}%>
                                         <% if (!num_aporte.equals("nada")){%>
                                         <b><font  face="Verdana, Arial, Helvetica, sans-serif" color="#336699" size="2">Extra:</font></b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                         <strong>
                                               <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                    <%=num_ent_aporte %> 
                                             </fmt:formatNumber>
                                               ( <%=num_aporte%> )</strong><br>
                                         </font>
                                         <%}%>
                                         <br>
                                        </font> </td>
                                      </tr>
                                      <tr>
                                        <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b><font color="#336699" size="2"><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Aportes Espor&aacute;dicos</strong></font></font></b></font></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2"><table width="291" height="83" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                              <td width="142"><strong><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">Valor</font></strong></td>
                                              <td width="149"><strong><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">Data</font></strong></td>
                                            </tr>
                                            <tr>
                                              <td><span class="style4"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                              <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                    <%=simu.getAporte1() %> 
                                             </fmt:formatNumber>
                                              </font></span></td>
        
                                              <td><div align="left" class="style4"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                  <%=simu.getDataAporte1() %>
                                                  </font></div></td>
                                            </tr>
                                            <tr>
                                              <td><span class="style4"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                                 <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                    <%=simu.getAporte2() %> 
                                                 </fmt:formatNumber>
                                                 </font></span></td>
                                              <td><span class="style4"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                                <%=simu.getDataAporte2() %></font></span></td>
                                            </tr>
                                            <tr>
                                              <td><span class="style4"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                                 <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                    <%=simu.getAporte3() %> 
                                                 </fmt:formatNumber>
                                                </font></span></td>
                                              <td><span class="style4"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
                                                <%=simu.getDataAporte3() %></font></span></td>
                                            </tr>
                                        </table></td>
                                      </tr>
                                  </table></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2"><img src="./img/simulador_boton.gif" width="417" height="19"></td>
                                </tr>
                              </table>
                          </form></td>
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
</table><html:link page="/redirect.do">
      <bean:message key="link.redirect"/>
    </html:link><html:link page="/MelhoreRenda.jsp">
      <bean:message key="link.MelhoreRenda"/>
    </html:link><html:link page="/AlteraSimulacao.jsp">
      <bean:message key="link.AlteraSimulacao"/>
    </html:link><html:link page="/RelatorioDetalhes.jsp">
      <bean:message key="link.RelatorioDetalhes"/>
    </html:link></body>

</html>