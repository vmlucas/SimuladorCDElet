
<%@ page contentType="text/html;charset=iso-8859-1"  %>
<%@page import="simuladorElet.*, com.eletros.benef.*, java.text.*,com.util.*" %>

<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
     Modelo modelo = (Modelo)session.getAttribute("modelo");
     Participante participante = modelo.getParticipante();
     
     //String patrocinadora = participante.getPatrocinadoraAtual().getNome().trim();
     //String nome = participante.getNome();
     DataEletros dtNascimento = null;
     
     if( participante.getDtNascimento() != null)
     {
        dtNascimento   = 
             new DataEletros(participante.getDtNascimento().getTime());
     }
     
     DecimalFormat df = new DecimalFormat();
     DecimalFormatSymbols symbol = new DecimalFormatSymbols();
     symbol.setDecimalSeparator(',');
        
     df.setDecimalFormatSymbols( symbol );
     String salario  = df.format( participante.getSalarioAtual());
     
     double saldoAtual = modelo.getReservaMatematica();
     double bpds = modelo.getBpds();
%> 



<html:html>
<head>
<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK REL="StyleSheet" HREF="Css/Eletros.css" type="text/css">
</head>
<font color="Yellow">
<html:errors />
</font>

<html:javascript formName="simulacaoForm" dynamicJavascript="true" staticJavascript="true"/>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="img/bkgSimulador.gif">

<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" background="img/nada1.gif" bgcolor="#1A50B8">
<tr>
	<td width="776" valign="top">
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
                    <html:form action='/verificaTempoContrib' method="post" onsubmit="return validateSimulacaoForm(this);">

	  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>
			      <table width="100%" border="0" cellspacing="0" cellpadding="0">
				    
				        <tr>
				          <td height="60" colspan="2">
				            <p><img src="./img/tit_simulacaomigr.gif" width="313" height="57"></p>

				              <table width="415" border="0" cellspacing="0" cellpadding="0" align="center" height="400" class="titNoticias">
				                <tr valign="top">
				                  <td colspan="2" height="32"><img src="./img/simulador_passo1.gif" width="417" height="43"></td>
				              </tr>
				                <tr align="center" valign="top">
				                  <td colspan="2" background="./img/simulador_fundo.gif">
				                    <table width="400" border="0" cellspacing="3" cellpadding="0" background="./img/nada.gif">
                            <tr>
                              <td width="192"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">Sua
                                Data de Nascimento</font></td>
                              <td width="199"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">At&eacute;
                                que idade deseja receber a renda certa? </font></td>
                            </tr>
                            <tr>
                              <td valign="middle">
                                <%if( dtNascimento != null){  %>
                                   <input type="text" name="dataNasc" size="15" maxlength="10" value="<%=dtNascimento.toString() %>"  readonly="true">
                                <% }else{ %>
                                   <input type="text" name="dataNasc" size="15" maxlength="10">
                                <% } %>   
                              </td>
                              <td ><input type="text" name="IAposentado" size="5" maxlength="3"> 
                                 <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">anos.</font>
                              </td>
                            </tr>
                            <tr>
                              <td height="20"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">(dd/mm/aaaa)</font></td>
                              <td width="199">&nbsp;</td>
                            </tr>
							<tr>
                              <td  width="3" colspan="2"></td>
                            </tr>
                            
                            <tr>
                              <td width="192"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">Idade do dependente mais novo na data de aposentadoria.</font></td>
                              <td><input type="text" name="idadeDep" size="5" maxlength="3"> 
                                 <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">anos.</font>
                              </td>
                            </tr>
                            <tr>
                              <td colspan="2"></td>
                            </tr>
                            <tr>
                              <td colspan="2"></td>
                            </tr>
                            <tr>
                              <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Saldo Atual
                                </font>&nbsp;<a href="#" OnMouseOver="teste('EltExibeHelpSimu.jsp?Pergunta=pergunta3','codigo','scrollbars=yes,width=200,height=150, top=300, left=490')" OnMouseOut="novaJanela.close();"><img src="./img/interrogacao.gif" width="15" height="15" border="0"></a></td>
                              <td width="199">&nbsp;</td>
                            </tr>
                            <tr>
                              <td> <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">
                               <b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"></font></b>
                               <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                  <%=saldoAtual%>
                               </fmt:formatNumber>
                               </font> </td>
                              <td> <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">&nbsp;
                                </font></td>
                            </tr>
                            <tr>
                              <td colspan="2"></td>
                            </tr>
                            <tr>
                              <td colspan="2"></td>
                            </tr>
                            <%
                            if (bpds != 0.0 ){
                            %>
                            <tr>
                              <td colspan="2"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">BPDS(Benef&iacute;cio Proporcional Diferido Saldado)</font><a href="#" OnMouseOver="teste('EltExibeHelpSimu.jsp?Pergunta=pergunta10','codigo','scrollbars=yes,width=200,height=200, top=300, left=550')" OnMouseOut="novaJanela.close();"><img src="./img/interrogacao.gif" width="15" height="15" border="0"></a> </td>
                              </tr>
                            <tr>
                              <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">
                                <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                  <%=bpds%>
                               </fmt:formatNumber></font>
                              <td>&nbsp;</td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                            </tr>
                            <% } %>
                            <tr>
                              <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Sal&aacute;rio 
                                Atual
                                 
                                <a href="#" onMouseOver="teste('EltExibeHelpSimu.jsp?Pergunta=pergunta2','codigo','scrollbars=yes,width=200,height=200,top=300, left=550')" onMouseOut="novaJanela.close();"><img src="./img/interrogacao.gif" width="15" height="15" border="0"></a></font></td>
                              <td width="199"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Crescimento
                                Salarial</font>&nbsp;<a href="#" OnMouseOver="teste('EltExibeHelpSimu.jsp?Pergunta=pergunta5','codigo','scrollbars=yes,width=200,height=50, top=300, left=550')" OnMouseOut="novaJanela.close();"><img src="./img/interrogacao.gif" width="15" height="15" border="0"></a></td>
                            </tr>
                            <tr>
                              <td> <b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">R$</font></b>
                                <input type="text" name="INumSalAtual" size="10" value="<%=salario %>"></td>
                              <td> <b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">%</font></b>
                                <input type="text" name="INumCrescSalarial" size="10"  value="0,0">
                              </td>
                            </tr>
                            <tr>
                              <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">(99999,99)</font></td>
                              <td width="199"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">(Ex:
                                0,5/ 1,0/ 1,5 ...)</font> </td>
                            </tr>
                            <tr>
                              <td colspan="2"></td>
                            </tr>
                            <tr>
                              <td colspan="2"></td>
                            </tr>
                            <tr>
                              <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b><font color="#336699">Escolha
                                uma das op&ccedil;&otilde;es abaixo:</font></b></font></td>
                            </tr>
                            <tr>
                              <td colspan="2"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5%"> <input type="radio" name="radiobutton" value="opt1"  onclick="ZeraRadio(0);" checked>
                                    </td>
                                    <td width="95%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tempo
                                      de contribui&ccedil;&atilde;o at&eacute; a data do in&iacute;cio do
                                      recebimento do benef&iacute;cio</font>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td width="5%">&nbsp;</td>
                                    <td width="95%" valign="middle"><b>
                                      <input type="text" name="Rest1" size="3">
                                      </b> <font face="Verdana, Arial, Helvetica, sans-serif" size="1">anos
                                      </font><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;
                                      </font>
                                      <!--           <input type="text" name="MesRest1" size="2">
				                                </b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">meses</font><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
				                                </font></b>-->
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="5%"> <input type="radio" name="radiobutton" value="opt2" onclick="ZeraRadio(1);" >
                                    </td>
                                    <td width="95%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Idade
                                      na data de solicita&ccedil;&atilde;o do benef&iacute;cio</font>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td width="5%">&nbsp;</td>
                                    <td width="95%"><b>
                                      <input type="text" name="AnoRest2" size="3">
                                      </b> <font face="Verdana, Arial, Helvetica, sans-serif" size="1">anos
                                      </font><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;
                                      </font>
                                      <!--				                           <input type="text" name="MesRest2" size="2">
				                                </b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">meses</font><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
				                                </font></b>-->
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="5%"> <input type="radio" name="radiobutton" value="opt3"  onclick="ZeraRadio(2);">
                                    </td>
                                    <td width="95%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Data
                                      de solicita&ccedil;&atilde;o do benef&iacute;cio</font>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td width="5%">&nbsp;</td>
                                    <td width="95%"><b>
                                      <input type="text" name="DataRest" size="15" maxlength="10">
                                      
                                      </b> <b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                                      </font></b></td>
                                  </tr>
                                  <tr>
                                    <td width="5%"></td>
                                    <td width="95%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">(dd/mm/aaaa)</font></td>
                                  </tr>
                                </table></td>
                            </tr>
                          </table>
				                  </td>
				              </tr>


				              <tr>
				                  <td width="355" valign="top"><img src="./img/simulador_baixo01.gif" width="350" height="38"></td>
				                  <td width="67" valign="top">
		         			  	<input type="image" src="./img/simulador_baixo03.gif">                                                        
				         	  </td>
				              </tr>
				            </table>
				          

						  </td>
				        </tr>
			      </table>
 			</td>
		</tr>
      	</table>
</html:form></td>
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
</table><html:link page="/verificaTempoContrib.do">
   <bean:message key="link.verificaTempoContrib"/>
  </html:link></body>
</html:html>




