<%@page import="simuladorElet.*, com.eletros.benef.*, com.util.*" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>

<%
       Modelo modelo = (Modelo)session.getAttribute("modelo");
       Relatorio rel = (Relatorio)session.getAttribute("relatorio");

        double rendaVitaliciaDouble = rel.getRendaVitalicia();
	//out.println("Renda Vitalicia" + rendaVitaliciaDouble);
	double rendaProgramadaDouble = rel.getRendaProgramada();
	//out.println("Renda Programada" + rendaProgramada);
	//out.flush();
	double bpdsDouble = modelo.getBpds();
        //double bpdsDouble = modelo.getSimulacao().parseDouble(bpds);
	//out.println("Bpds:" + bpds);
	
	double saldoDouble = rel.getSaldo();
	//out.println("Saldo" + saldoDouble);
	double reservaDouble = rel.getReservaMigracao();
	//out.println("Reserva" + reservaDouble);
	
	double rendaVitaliciaNova     = 0.0;
	double rendaProgramadaNova    = 0.0;
	double rendaVitaliciaNovaMetade   = 0.0;
	double rendaProgramadaNovaMetade  = 0.0;
	
	if (bpdsDouble != 0) {
	      rendaVitaliciaNova     = (((saldoDouble-reservaDouble)*rendaVitaliciaDouble)/saldoDouble);
	      rendaProgramadaNova    = (((saldoDouble-reservaDouble)*rendaProgramadaDouble)/saldoDouble);
	//out.println(rendaProgramadaNova);
	      rendaVitaliciaNovaMetade     = (((saldoDouble-(reservaDouble/2))*rendaVitaliciaDouble)/saldoDouble);
	      rendaProgramadaNovaMetade    = (((saldoDouble-(reservaDouble/2))*rendaProgramadaDouble)/saldoDouble);
    
	}else {
	
	      rendaVitaliciaNova     = rendaVitaliciaDouble;
	      rendaProgramadaNova    = rendaProgramadaDouble;
	//out.println(rendaProgramadaNova);
	     rendaVitaliciaNovaMetade     = rendaVitaliciaDouble;
	     rendaProgramadaNovaMetade    = rendaProgramadaDouble;
	
	}
	
%>

<html>
<head>
<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title>
<LINK REL="StyleSheet" HREF="Css/Eletros.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" src="Js/eletros.js"></SCRIPT>
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
                    <td width="770"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td height="414"><table width="462" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                              <td width="462" valign="top"><table width="89%" border="0" cellspacing="0" cellpadding="0">
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
                                            <td width="144" height="25" colspan="2" valign="top"><p><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><strong>Op&ccedil;&atilde;o 1:</strong><b><br>
                                    </b></font></p></td>
                                          </tr>
                                          <tr>
                                            <td colspan="2"><table width="90%" height="109" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#336699">
                                                <tr>
                                                  <td width="24%" rowspan="3" valign="middle"><p><font color="#336699" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>100% BPDS</strong>*<strong><br>
                                                </strong></font><font size="1"><strong><font color="#000000" face="Verdana, Arial, Helvetica, sans-serif">
                                                    <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                      <%=bpdsDouble%> 
                                                    </fmt:formatNumber>
                                                </font></strong></font></p></td>
                                                  <td width="6%" rowspan="3"><font size="1">&nbsp;</font><font color="#336699" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>+</strong></font><font size="1">&nbsp;</font></td>
                                                  <td width="45%"><p><font size="1"><strong><font color="#336699" face="Verdana, Arial, Helvetica, sans-serif">Renda Programada </font><font color="#000000" face="Verdana, Arial, Helvetica, sans-serif"><br>
                                                        <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                          <%=rendaProgramadaNova%> 
                                                        </fmt:formatNumber>
                          </font></strong></font></p></td>
                                                  <td width="25%"><p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#336699">Total</font><br>
                                                         <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                          <%=rendaProgramadaNova+bpdsDouble %> 
                                                         </fmt:formatNumber>
                                                      </strong></font></p></td>
                                                </tr>
                                                <tr>
                                                  <td align="center"><strong><font color="#336699" size="1" face="Verdana, Arial, Helvetica, sans-serif">ou</font></strong></td>
                                                  <td><font size="1">&nbsp;</font></td>
                                                </tr>
                                                <tr>
                                                  <td><p><font size="1"><strong><font color="#336699" face="Verdana, Arial, Helvetica, sans-serif">Renda Vital&iacute;cia</font><font color="#000000" face="Verdana, Arial, Helvetica, sans-serif"> <br>
                                                        <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                          <%=rendaVitaliciaNova %> 
                                                         </fmt:formatNumber>
                                                        </font></strong></font></p></td>
                                                  <td><p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#336699">Total</font><br>
                                                        <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                          <%=rendaVitaliciaNova+bpdsDouble %> 
                                                         </fmt:formatNumber>
                                                        </strong></font></p></td>
                                                </tr>
                                              </table>
                                                <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><br>
                                              </font></p></td>
                                          </tr>
                                          <tr>
                                            <td colspan="2">&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td colspan="2"><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Op&ccedil;&atilde;o 2:</strong></font></td>
                                          </tr>
                                          <tr>
                                            <td height="128" colspan="2"><table width="91%" height="94" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#336699">
                                                <tr>
                                                  <td width="24%" rowspan="3" valign="middle"><p><font color="#336699" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>50%<br>
                          BPDS</strong>*<strong><br>
                      </strong></font><font size="1"><strong><font color="#000000" face="Verdana, Arial, Helvetica, sans-serif">
                                                         <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                          <%=bpdsDouble/2 %> 
                                                         </fmt:formatNumber>
                                    </font></strong></font></p></td>
                                                  <td width="6%" rowspan="3"><font size="1">&nbsp;</font><font color="#336699" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>+</strong></font><font size="1">&nbsp;</font></td>
                                                  <td width="44%"><p><font size="1"><strong><font color="#336699" face="Verdana, Arial, Helvetica, sans-serif">Renda Programada </font><font color="#000000" face="Verdana, Arial, Helvetica, sans-serif"><br>
                                                          <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                          <%=rendaProgramadaNovaMetade %> 
                                                         </fmt:formatNumber>
                                                          </font></strong></font></p></td>
                                                  <td width="26%"><p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#336699">Total</font><br>
                                                         <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                          <%=rendaProgramadaNovaMetade + (bpdsDouble/2) %> 
                                                         </fmt:formatNumber>
                                                         </strong></font></p></td>
                                                </tr>
                                                <tr>
                                                  <td align="center"><strong><font color="#336699" size="1" face="Verdana, Arial, Helvetica, sans-serif">ou</font></strong></td>
                                                  <td><font size="1">&nbsp;</font></td>
                                                </tr>
                                                <tr>
                                                  <td><p><font size="1"><strong><font color="#336699" face="Verdana, Arial, Helvetica, sans-serif">Renda Vital&iacute;cia</font><font color="#000000" face="Verdana, Arial, Helvetica, sans-serif"> <br>
                                                         <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                          <%=rendaVitaliciaNovaMetade %> 
                                                         </fmt:formatNumber>
                                                         </font></strong></font></p></td>
                                                  <td><p><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#336699">Total</font><br>
                                                          <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                          <%=rendaVitaliciaNovaMetade + (bpdsDouble/2) %> 
                                                         </fmt:formatNumber>
                                                    </strong></font></p></td>
                                                </tr>
                                            </table></td>
                                          </tr>
                                          <tr>
                                            <td colspan="2"><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Op&ccedil;&atilde;o 3</strong></font></td>
                                          </tr>
                                          <tr>
                                            <td colspan="2"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#336699">Renda Programada: </font> 
                                                <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                          <%=rendaProgramadaDouble %> 
                                                         </fmt:formatNumber>
                                                </strong></font></td>
                                          </tr>
                                          <tr>
                                            <td colspan="2"><font color="#336699" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>ou</strong></font></td>
                                          </tr>
                                          <tr>
                                            <td colspan="2"><font color="#336699" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Renda Vital&iacute;cia:</strong></font><font size="1"><strong><font color="#000000" face="Verdana, Arial, Helvetica, sans-serif"> 
                                               <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                                                          <%=rendaVitaliciaDouble %> 
                                                         </fmt:formatNumber>
                                               </font></strong></font></td>
                                          </tr>
                                          <tr>
                                            <td colspan="2">&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td height="25" colspan="2"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">* O BPDS ser&aacute; devido a partir de <%=rel.getSimulacao().getMesReserva()%>/ <%=rel.getSimulacao().getAnoReserva()%><font color="#000000"> **</font></font></td>
                                          </tr>
                                          <tr>
                                            <td colspan="2"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>**Para cada ano completo de adiamento da data prevista acima, estima-se um acr&eacute;scimo de 6% no valor do BPDS. </strong></font></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td valign="top"><a href="javascript:history.back()"><img src="img/simulador_voltar.gif" width="67" height="38" border="0"> </a> </td>
                                      <td valign="top"><input name="Image" type="Image" src="img/simulador_baixo05.gif" width="350" height="38" border="0">
                                      </td>
                                    </tr>
                                  </table>
                                  <p><font size="1" face="Verdana, Arial, Helvetica, sans-serif">* O conte&uacute;do destas simula&ccedil;&otilde;es &eacute; de car&aacute;ter meramente ilustrativo, n&atilde;o gerando quaisquer direitos ou obriga&ccedil;&otilde;es.</font> </p>
                                 
                                  <p>&nbsp;</p></td>
                            </tr>
                          </table>                          <p>&nbsp;</p>
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
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>

</html>