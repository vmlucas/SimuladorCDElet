<%@page import="simuladorElet.*, com.eletros.benef.*, com.util.*" %>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%
	Modelo modelo = (Modelo)session.getAttribute("modelo");
        Relatorio rel = (Relatorio)session.getAttribute("relatorio");
        Participante part = modelo.getParticipante(); 
        Simulacao simu = (Simulacao)session.getAttribute("simulacao");
        
        int dia_nasc      = 
            modelo.getParticipante().getDtNascimento().getDia();
	int mes_nasc      = modelo.getParticipante().getDtNascimento().getMes();
	int ano_nasc      = modelo.getParticipante().getDtNascimento().getAno();
	double reserva_migracao   = rel.getReservaMigracao();
	double aporte_inicial= simu.getAporteInicial();
	double salario_atual = simu.getParticipante().getSalarioAtual();
	double cresc_salarial= simu.getCrescimentoSalarial();
        //int ano_rest1     = modelo.getSimulacao().getAnoRest1();
	//int ano_rest2     = modelo.getSimulacao().getAnoRest2();
	//int dia_rest      = modelo.getSimulacao().getDataRest().getDia();
	//int mes_rest      = modelo.getSimulacao().getDataRest().getMes();
	//int ano_rest      = modelo.getSimulacao().getDataRest().getAno();
	int rent_anual1    = simu.getRentAnual1();
	int rent_anual2   = simu.getRentAnual2();
	
        double contMax    = simu.getContribuicaoMAx();
        double contMin    = simu.getContribuicaoMin();
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
	//double bpds            = modelo.getBpds();
        double qtd1 = simu.getAporte1();
        double qtd2 = simu.getAporte2();
	double qtd3 = simu.getAporte3();
                
%>
<html>
<head>
<LINK REL="StyleSheet" HREF="Css/Eletros.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" src="Js/eletros.js"></SCRIPT>
<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title>
<style type="text/css">
<!--
.style6 {
	font-size: 12px;
	font-weight: bold;
}
-->
</style>
</head>
<style type="text/css">
<!--
.fonte {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
	font-style: normal;
	color: #000000;
	list-style-position: outside;
	list-style-image: none;
	list-style-type: none;
}
.style1 {
	color: #000000;
	font-weight: bold;
}
.style4 {list-style-image: none; list-style-type: none; font-style: normal; list-style-position: outside;}
.style5 {color: #000000}
.style9 {font-size: 11px}
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
                    <td width="770" height="60"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top">
                        <td height="81"><p><img src="./img/tit_simulacaomigr.gif" width="313" height="57"></p>
                      <tr valign="top">

                        <td height="60">
                          <form action="/SimuladorElet/simularMudancas.do" method="get" name="frmdados">

                          <table width="417" border="0" cellspacing="0" cellpadding="0" align="center" height="732">
                            <tr valign="top">
                              <td width="417" height="19"><div align="center"><img src="./img/simulador_top.gif" width="408" height="19"></div></td>
                            </tr>
                            <tr align="right" valign="top">
                              <td height="672" background="./img/simulador_fundo.gif"><table width="395" border="0" align="center" cellpadding="0" cellspacing="0" background="./img/nada.gif">
                                  <tr>
                                    <td height="40" colspan="6" valign="top"><img src="img/Tit_alterarParam.gif" width="180" height="16"></td>
                                  </tr>
                                
                                  <tr>
                                    <td width="395" height="174" valign="top"><table width="395" border="0" cellspacing="1" cellpadding="2">
                                      <tr>
                                        <td width="100" height="30"><span class="style6 style9"><font face="Verdana, Arial, Helvetica, sans-serif" color="#336699">Sal&aacute;rio Atual:</font></span></td>
                                        <td width="16"><div align="right" class="style9"><font face="Verdana, Arial, Helvetica, sans-serif" color="#336699"><b>R$</b></font></div></td>
                                        <td width="129"><input name="INumSalAtual" type="text" class="fonte" value="<%=formatar(salario_atual)%>" size="15"> </td>
                                        <td width="130" rowspan="4" align="right" valign="top"><table width="129" border="0" align="right" cellpadding="0" cellspacing="0">
                                          <tr>
                                            <td width="138"><div align="right"><a href="/SimuladorElet/redirect.do?page=inicio"><img src="img/botao-nova-simulacao-novo.gif" width="96" height="24" border="0"></a></div></td>
                                          </tr>
                                          <tr>
                                            <td><div align="right"><a href="/SimuladorElet/redirect.do?page=detalhes"><img src="img/botao-detalhes-novo.gif" width="57" height="24" border="0"></a></div></td>
                                          </tr>
                                          <tr>
                                            <td><div align="right"><a href="/SimuladorElet/redirect.do?page=parametros"><img src="img/botao-parametros-utilizado-.gif" width="129" height="24" border="0"></a></div></td>
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
                                        <td height="45"><span class="style6 style9"><font face="Verdana, Arial, Helvetica, sans-serif" color="#336699">Cresc. Salarial: </font></span></td>
                                        <td>&nbsp;</td>
                                        <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
                                          <input name="INumCrescSalarial" type="text" class="fonte" value="<%=formatar(cresc_salarial)%>" size="3">
                                          <b>%</b></font><br> <span class="fonte"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">(Ex</font></span><span class="style4"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">.:</font></span><span class="fonte"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">0,5</font></span><span class="style4"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">/</font></span><span class="fonte"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000"> 1,5 ...)</font></span></td>
                                        
                                      </tr>
                                      <tr>
                                        <td height="50" valign="top"><span class="style6 style9"><font face="Verdana, Arial, Helvetica, sans-serif" color="#336699">Op&ccedil;&atilde;o de contribui&ccedil;&atilde;o: </font></span></td>
                                        
                                        <td><span class="fonte">
                                        </span></td>
                                        <td valign="top"><span class="fonte">
                                          <select name="IStrContribuicao1" class="fonte">
                                            <% if (contMin == 1.8) {%>
                                            <option value="1" selected>1.8% e 6%</option>
                                            <%} else { %>
                                            <option value="1">1.8% e 6%</option>
                                            <%}
				    if (contMin ==2.25) { %>
                                            <option value="2" selected>2.25% e 7.5%</option>
                                            <%}else { %>
                                            <option value="2" >2.25% e 7.5%</option>
                                            <%} 
				   if (contMin ==3.75) { %>
                                            <option value="3" selected>3.75% e 11.25%</option>
                                            <%}else { %>
                                            <option value="3" >3.75% e 11.25%</option>
                                            <%}
				   if (contMin ==4.5) { %>
                                            <option value="4" selected>4.5% e 15%</option>
                                            <%}else{%>
                                            <option value="4">4.5% e 15%</option>
                                            <%}%>
                                          </select>
                                        </span></td>
                                      </tr>
                                      <tr>
                                        <td height="21" colspan="3" valign="top"><table width="255" border="0" cellspacing="2" cellpadding="2">
                                          <tr>
                                            <td colspan="3" class="bkgMnuSubAberto"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#333399"><font color="#000000" size="3"><b><font color="#336699" size="2">Rentabilidade Anual</font></b></font></font><font color="#336699" size="2"> adotada:</font></b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><b> </b></font></td>
                                          </tr>
                                          <tr>
                                            <td width="97"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Nos pr&oacute;ximos cinco anos do plano</font></td>
                                            <td width="144"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
                                              <select name="INumRentAnual1" class="fonte" >
                                                <option value="3" >3%</option>
                                                <option value="4">4%</option>
                                                <option value="5">5%</option>
                                                <option value="6"selected>6%</option>
                                                <option value="7">7%</option>
                                                <option value="8">8%</option>
                                                <option value="9">9%</option>
                                                <option value="10">10%</option>
                                              </select>
                                            </font></td>
                                          </tr>
                                          <tr>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">N</font><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">os anos restantes do plano </font><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">&nbsp;&nbsp;&nbsp;</font></td>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
                                              <select name="INumRentAnual2" class="fonte">
                                                <option value="3">3%</option>
                                                <option value="4">4%</option>
                                                <option value="5">5%</option>
                                                <option value="6"selected>6%</option>
                                                <option value="7">7%</option>
                                                <option value="8">8%</option>
                                                <option value="9">9%</option>
                                                <option value="10">10%</option>
                                              </select>
                                            </font></td>
                                          </tr>
                                        </table></td>
                                        </tr>
                                     
                                    </table></td>
                                    
                                  </tr>
                                
                                 
                                  
                                  <tr>
                                    <td height="25" valign="top" class="bkgMnuSubAberto"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#000000"><b><font color="#336699">Contribui&ccedil;&otilde;es Extraordin&aacute;rias</font></b></font><font color="#336699">:</font></b></font></td>
                                    
                                    
                                  </tr>
                                  <tr>
                                    <td height="34" colspan="2"><div align="left"> <a href="#" onMouseOver="teste('Eltcontacumulada.jsp?INumSalAtual=<%=request.getParameter("INumSalAtual")%>','codigo','scrollbars=yes,width=200,height=140, top=200, left=460')" onMouseOut="novaJanela.close();"> </a><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#336699"><b>
                                        <% if (part.getNumEletros().equals("000")){%>
                                        <font color="#000000">Cr&eacute;dito no momento da Simula&ccedil;&atilde;o:</font><br>
                                        </b></font>
                                            <%}else{%>
                                            <span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Cr&eacute;dito Inicial na Migra&ccedil;&atilde;o:</font></span><br>
                                            <%}%>
                                            <span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">R$</font></span>
                                            <input name="INumAporteInicial" type="text" class="fonte" value="<%=formatar(aporte_inicial)%>" size="20">
                                    </div></td>
                                  </tr>
                                  <tr>
                                    <td height="26" colspan="3" valign="top"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">(99999,99)</font></td>
                                  </tr>
                                  <tr>
                                    <td height="40" colspan="6" valign="top"><p><b><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif">Extra: </font></b> <br>
                                            <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><span class="style1">R$</span></font><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#336699">
                                            
                                            <input name="INumEntAporte" type="text" class="fonte" value="<%=formatar(num_ent_aporte) %>" size="10">
                                        </font></p></td>
                                  </tr>
                                  <tr>
                                    <td height="25" colspan="6" valign="top"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">(99999,99)</font> </td>
                                  </tr>
                                  <tr>
                                    <td colspan="6" valign="top"><span class="style1"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Periodicidade: </font></span></td>
                                  </tr>
                                  <tr>
                                    <td colspan="6" valign="top"><table width="212" height="28" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                          <td width="20"><% if (num_aporte.equals("Mensal")){%>
                                              <input type="radio" name="lNumAporteOpAporte" value="Mensal"  checked >
                                              <%} else {%>
                                              <input type="radio" name="lNumAporteOpAporte" value="Mensal"  >
                                              <%}%></td>
                                          <td width="192"><div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Mensal</font></div></td>
                                        </tr>
                                        <tr>
                                          <td>
                                            <div align="left">
                                              <% if (num_aporte.equals("Trimestral")){%>
                                              <input type="radio" name="lNumAporteOpAporte" value="Trimestral" checked>
                                              <%}else{%>
                                              <input type="radio" name="lNumAporteOpAporte" value="Trimestral">
                                              <%}%>
                                            </div></td><td><div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Trimestral</font></div></td>
                                        </tr>
                                        <tr>
                                          <td>
                                            <div align="left">
                                              <% if (num_aporte.equals("Semestral")){%>
                                              <input type="radio" name="lNumAporteOpAporte" value="Semestral" checked >
                                              <%}else{%>
                                              <input type="radio" name="lNumAporteOpAporte" value="Semestral">
                                              <%}%>
                                            </div></td><td><div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Semestral</font></div></td>
                                        </tr>
                                        <tr>
                                          <td><% if (num_aporte.equals("Anual")){%>
                                            <input type="radio" name="lNumAporteOpAporte" value="Anual" checked>
                                            <%}else{%>
                                            <input type="radio" name="lNumAporteOpAporte" value="Anual" >
                                          <%}%></td>
                                          <td><div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Anual</font></div></td>
                                        </tr>
                                        
                                      </table>
                                  </tr>
                                  <tr>
                                    <td height="86" colspan="6" valign="top"><table width="393" border="0" align="left" cellpadding="0" cellspacing="0" background="img/simulador_fundo.gif">
                                      <tr>
                                        <td width="168" height="32"><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Aportes Espor&aacute;dicos:</strong></font></td>
                                      </tr>
                                      <tr>
                                        <td width="168" height="15" valign="top" background="img/nada.gif"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>1&ordm; Aporte : R$</strong>
                                              <input type="text" name="aporte1" size="10"  class="fonte" value="<%=qtd1%>">
                                        </font></td>
                                        <td width="207" background="img/nada.gif"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Data :
                                                <input type="text" name="dataAporte1" size="12" class="fonte" value="<%=simu.getDataAporte1().toString() %>" maxlength="10">
                                            </strong></font></td>
                                      </tr>
                                      <tr>
                                        <td height="15" background="img/nada.gif" ><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>2&ordm; Aporte : R$</strong>
                                              <input type="text" name="aporte2" size="10"  class="fonte" value="<%=qtd2%>">
                                        </font></td>
                                        <td background="img/nada.gif"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Data :
                                                <input type="text" name="dataAporte2" size="12"  class="fonte" value="<%=simu.getDataAporte2().toString() %>" maxlength="10">
                                        </strong></font></td>
                                      </tr>
                                      <tr>
                                        <td height="18" background="img/nada.gif" ><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>3&ordm; Aporte : R$</strong>
                                              <input type="text" name="aporte3" size="10" class="fonte" value="<%=qtd3%>">
                                        </font></td>
                                        <td background="img/nada.gif"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Data :
                                                <input type="text" name="dataAporte3" size="12"  value="<%=simu.getDataAporte3().toString() %>" maxlength="10" class="fonte">
                                        </strong></font></td>
                                      </tr>
                                    </table></td>
                                  </tr>
                              </table>
                            </td>
                            </tr>
                            <tr align="right" valign="top">
                              <td height="41" background="./img/simulador_fundo.gif"><img src="img/simulador_baixo01.gif" width="350" height="38"><input type="image" src="img/bot_simular.gif" width="67" height="38"></td>
                            </tr>
                          </table>
                          </form>                      
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
</table><html:link page="/simularMudancas.do">
      <bean:message key="link.simularMudancas"/>
    </html:link></body>

</html>
<%!
  String formatar(double number)
  {
     String valor =  String.valueOf(number);
     valor = valor.replace('.',',');
     
     return valor;                                      
  }

%>