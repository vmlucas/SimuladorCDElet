<%@page import="simuladorElet.*, com.eletros.benef.*, com.util.*" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%
       Modelo modelo = (Modelo)session.getAttribute("modelo");
       Relatorio rel = (Relatorio)session.getAttribute("relatorio");
       Participante participante = modelo.getParticipante(); 
       Simulacao simu = (Simulacao)session.getAttribute("simulacao");
%>

<html>
<head>

<LINK REL="StyleSheet" HREF="Css/Eletros.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" src="Js/eletros.js"></SCRIPT>
<script language="JavaScript">
<!--

function teste(theURL,winName,features) { //v2.0
  novaJanela=window.open(theURL,winName,features);
  novaJanela.focus();
}

//-->
</SCRIPT>
<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title></head>

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
                    <td width="770"><form action="">
                      <table width="402" border="0" cellspacing="0" cellpadding="0" align="center" height="300">
                        <tr valign="top">
                          <td width="402" height="15" colspan="2"><img src="./img/simulador_top.gif" width="399" height="20"></td>
                        </tr>
                        <tr align="center" valign="top">
                          <td colspan="2" background="./img/simulador_fundo.gif"><table width="380" border="0" cellspacing="0" cellpadding="0" background="./img/nada.gif">
                              <tr>
                                <td colspan="2">&nbsp;</td>
                              </tr>
                              <tr valign="top">
                                <td colspan="2" height="2"><img src="./img/tit_detalhes.gif" width="84" height="21"></td>
                              </tr>
                              <tr>
                                <td width="265" valign="top" height="65"><font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" size="2"><b> Renda Vital&iacute;cia:</b></font> <a href="#" OnMouseOver="teste('EltExibeHelpSimu.jsp?Pergunta=pergunta13','codigo','scrollbars=yes,width=200,height=250, top=200, left=460')" OnMouseOut="novaJanela.close();"><img src="./img/interrogacao.gif" width="15" height="15" border="0"></a><br>
                                    <font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="2"> 
                                        <strong>
                                           <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                      <%=rel.getRendaVitalicia()%> 
                                           </fmt:formatNumber>
                                        </strong></font> <font size="1" face="Verdana, Arial, Helvetica, sans-serif"><br>
              (Para o recebimento da renda vital&iacute;cia &eacute; reservado do saldo de conta do participante um percentual de:</font><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                                        <b>
                                            <fmt:formatNumber minFractionDigits="2">
                                                      <%=rel.getPercentual()%> 
                                            </fmt:formatNumber>
                                        </b></font></b></font><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> <b>%</b>) <a href="#" OnMouseOver="teste('EltExibeHelpSimu.jsp?Pergunta=pergunta14','codigo','scrollbars=yes,width=200,height=200, top=200, left=460')" OnMouseOut="novaJanela.close();"><img src="./img/interrogacao.gif" width="15" height="15" border="0"></a></font></td>
                                <td rowspan="2" valign="top"><table width="125" border="0" cellspacing="0" cellpadding="0" align="right">
                                    <tr>
                                      <td><div align="right"> <a href="/SimuladorElet/redirect.do?page=inicio"> <img src="img/botao-nova-simulacao-novo.gif" width="96" height="24" border="0"></a></div></td>
                                    </tr>
                                    <tr>
                                      <td><div align="right"><a href="/SimuladorElet/redirect.do?page=parametros"><img src="img/botao-parametros-utilizado-.gif" width="129" height="24" border="0"></a></div></td>
                                    </tr>
                                    <tr>
                                      <td height="30"><div align="right"><a href="/SimuladorElet/redirect.do?page=alterar"><img src="img/botao-alterar-parametros-no.gif" width="112" height="24" border="0"></a></div></td>
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
                                <td width="265" valign="top" height="65"><p><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b><font color="#336699" size="2"><br>
                Renda Programada:<a href="#" OnMouseOver="teste('EltExibeHelpSimu.jsp?Pergunta=pergunta15','codigo','scrollbars=yes,width=200,height=10, top=200, left=460')" OnMouseOut="novaJanela.close();"><img src="./img/interrogacao.gif" width="15" height="15" border="0"></a></font><font size="1" face="Verdana, Arial, Helvetica, sans-serif"></font><font color="#336699" size="2"><br>
                </font></b><font color="#336699" size="2"><font color="#000000"> 
                       <strong>
                           <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                             <%=rel.getRendaProgramada()%> 
                           </fmt:formatNumber>
                       </strong><br>
                <% int aux = simu.getIdadeAposentadoria(); 
                   int idade = rel.getIdade();
                   int tempoCont = rel.getTempoCont();
					  		
					   int periodoBeneficio1 = (((aux*12) -((idade+tempoCont)))/12);
					   int periodoBeneficio2 = (((aux*12) -(idade+tempoCont))%12);
					 	   
					  
					 %>
                <font size="1"> (O per&iacute;odo de recebimento do benef&iacute;cio da Eletros &eacute; de <b>
                                      <% if (periodoBeneficio1<2){%>
                                      <%=periodoBeneficio1 %>&nbsp;ano
                                      <%}else{%>
                                      <%=periodoBeneficio1 %>&nbsp;anos
                                      <%}%>
                                      <% if (periodoBeneficio2>0){ %>
                e</b></font></font></font></font><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><font color="#336699" size="2"><font color="#000000"><font size="1"><b>&nbsp; <%=periodoBeneficio2%>
                <%if (periodoBeneficio2 >1){%>
                meses
                <%}else{ %>
                m&ecirc;s
                <%}%>
                </b></font></font></font></font>
                <%}%>
                <font size="1" face="Verdana, Arial, Helvetica, sans-serif">)</font> </p></td>
                              </tr>
                              <tr>
                                <td colspan="2" height="40" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" size="2"><b><br>
              Na data de solicita&ccedil;&atilde;o do benef&iacute;cio</b></font> <font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#336699"><br>
              <b>Idade:</b><font color="#000000"> </font><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#336699"><font color="#000000"><strong><%=((idade+tempoCont)/12) %> anos
              <% int auxIdade = ((idade+tempoCont)%12); 
                        if (auxIdade >0){%>
              e
              <% if (auxIdade >1 ){%>
              <%=((idade+tempoCont)%12)%> meses
              <%}else{%>
              <%=((idade+tempoCont)%12)%> m&ecirc;s
              <%} }%>
              </strong></font></font><br>
              <font color="#336699"><b>Sal&aacute;rio: </b></font> <font color="#000000">
                     <strong>
                       <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                             <%=rel.getSalarioFinal()%> 
                       </fmt:formatNumber>
                     </strong></font> <br>
              <font color="#336699"><b>Contribui&ccedil;&atilde;o do Participante:</b></font> <font color="#000000">
                     <strong>
                        <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                             <%=rel.getContFinal()%> 
                       </fmt:formatNumber>
                     </strong></font></font></td>
                              </tr>
                              <tr>
                                <td width="265" height="10"></td>
                                <td width="132" valign="top">&nbsp;</td>
                              </tr>
                              <% 
			     if (!(participante.getNumEletros().equals("000"))){ %>
                              <tr valign="top">
                                <td colspan="2"><table border="0" cellspacing="0" cellpadding="0" width="338" height="267">
                                    <tr valign="bottom">
                                      <td height="66" width="32%">&nbsp;</td>
                                      <td height="62" rowspan="3" valign="middle"><div align="center"><img src="img/fiosElet.gif" width="136" height="192"> </div></td>
                                      <td height="66" width="47%" valign="middle"><table width="97" border="0" cellspacing="0" cellpadding="0" align="left">
                                          <tr>
                                            <td><img src="img/contribuicoes1.gif" width="97" height="26"></td>
                                          </tr>
                                          <tr bgcolor="#FFFFFF">
                                            <td height="26"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#333399"> 
                                                  <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                      <%=rel.getContAcum()%> 
                                                  </fmt:formatNumber>
                                            </font></div></td>
                                          </tr>
                                          <tr>
                                            <td></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td width="32%" height="89" valign="middle"><div align="center">
                                          <table width="97" border="0" cellspacing="0" cellpadding="0" align="right">
                                            <tr>
                                              <td><img src="img/saldo%20de%20conta.gif" width="97" height="18"></td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF">
                                              <td height="26"><div align="center"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#333399"> 
                                                 <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                      <%=rel.getSaldo()%> 
                                                  </fmt:formatNumber>
                                            </font></div></td>
                                            </tr>
                                          </table>
                                      </div></td>
                                      <td width="47%" height="89" valign="middle"><table width="97" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td><img src="img/contribuicoes2.gif" width="97" height="26"></td>
                                          </tr>
                                          <tr bgcolor="#FFFFFF">
                                            <td height="26"><div align="center"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#333399"> <font color="#000000"> 
                                               <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                      <%=rel.getAporteTotal()%> 
                                                  </fmt:formatNumber>
                                            </font></font></div></td>
                                          </tr>
                                          <tr>
                                            <td>&nbsp;</td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td width="32%" valign="top">&nbsp;</td>
                                      <td width="47%" valign="middle" height="71"><table width="97" border="0" cellspacing="0" cellpadding="0" align="left">
                                          <tr>
                                            <td><img  src="img/SaldoInicial.gif" width="96" height="26"></td>
                                          </tr>
                                          <tr bgcolor="#FFFFFF">
                                            <td height="26"><div align="center"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#333399"> <font color="#000000">
                                              <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                      <%=rel.getReservaMigracao()%> 
                                                  </fmt:formatNumber>
                                              </font></font></div></td>
                                          </tr>
                                          <tr>
                                            <td>&nbsp;</td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                </table></td>
                              </tr>
                              <%}else{%>
                              <tr valign="top">
                                <td colspan="2"><table border="0" cellspacing="0" cellpadding="0" width="343" height="269">
                                    <tr valign="bottom">
                                      <td height="66" width="32%">&nbsp;</td>
                                      <td height="62" rowspan="3" valign="middle"><div align="center"><img src="img/fios.gif" width="148" height="205"> </div></td>
                                      <td height="66" width="47%" valign="middle"><table width="97" border="0" cellspacing="0" cellpadding="0" align="left">
                                          <tr>
                                            <td><img src="img/contribuicoes1.gif" width="97" height="26"></td>
                                          </tr>
                                          <tr bgcolor="#FFFFFF">
                                            <td height="26"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#333399"><font color="#000000"> 
                                                <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                      <%=rel.getContAcum()%> 
                                                  </fmt:formatNumber>
                                            </font></font></div></td>
                                          </tr>
                                          <tr>
                                            <td></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td width="32%" height="89" valign="middle"><div align="center">
                                          <table width="97" border="0" cellspacing="0" cellpadding="0" align="right">
                                            <tr>
                                              <td><img src="img/saldo%20de%20conta.gif" width="97" height="18"></td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF">
                                              <td height="26"><div align="center"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#333399"><font color="#000000"> 
                                                <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                      <%=rel.getSaldo()%> 
                                                  </fmt:formatNumber>
                                              </font></font></div></td>
                                            </tr>
                                          </table>
                                      </div></td>
                                      <td width="47%" height="89" valign="middle">&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td width="32%" valign="top">&nbsp;</td>
                                      <td width="47%" valign="middle" height="71"><table width="97" border="0" cellspacing="0" cellpadding="0" align="left">
                                          <tr>
                                            <td><img src="img/contribuicoes2.gif" width="97" height="26"></td>
                                          </tr>
                                          <tr bgcolor="#FFFFFF">
                                            <td height="26"><div align="center"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#333399"> <font color="#000000"></font><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#333399"><font color="#000000">
                                                <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                      <%=rel.getAporteTotal()%> 
                                                  </fmt:formatNumber>
                                                </font></font></font></div></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                </table></td>
                              </tr>
                              <%}%>
                              <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b><font color="#336699" size="2"><font color="#000000">
                                  </font></font></b></font></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr valign="top">
                          <td colspan="2"><img src="./img/simulador_boton.gif" width="402" height="19"></td>
                        </tr>
                      </table>
                    </form></td>
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
</table><html:link page="/MelhoreRenda.do">
      <bean:message key="link.MelhoreRenda"/>
    </html:link></body>

</html>