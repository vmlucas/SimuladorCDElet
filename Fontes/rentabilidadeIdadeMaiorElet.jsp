<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<html>
<head>
<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title>
<LINK REL="StyleSheet" HREF="Css/Eletros.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/javascript">
<!--

function teste(theURL,winName,features) { //v2.0
  novaJanela=window.open(theURL,winName,features);
  novaJanela.focus();
}

//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="img/bkgSimulador.gif">
<table width="736" border="0" align="center" cellpadding="0" cellspacing="0" background="img/nada1.gif">
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
                        <td height="60"><p><img src="./img/tit_simulacaomigr.gif" width="313" height="57"></p>
                            
                            <form action="/SimuladorElet/opcaoRentabilidade.do" method="post" name="frmdados">
                              <table width="415" border="0" cellspacing="0" cellpadding="0" align="center" height="304">
                                <tr valign="top">
                                  <td colspan="2" height="30"><img src="./img/simulador_passo2.gif" width="417" height="43"></td>
                                </tr>
                                <tr align="center" valign="top">
                                  <td height="190" colspan="2" background="./img/simulador_fundo.gif"><table width="400" border="0" cellspacing="3" cellpadding="0" background="./img/nada.gif">
                                      <tr>
                                        <td height="18" colspan="3"><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#336699"><b>Escolha a Rentabilidade Anual</b></font>&nbsp;<a href="#" onMouseOver="teste('EltExibeHelpSimu.jsp?Pergunta=pergunta8','codigo','scrollbars=yes,width=200,height=180, top=300, left=560')" onMouseOut="novaJanela.close();"><img src="./img/interrogacao.gif" width="15" height="15" border="0"></a></td>
                                      </tr>
                                      <tr>
                                        <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Nos pr&oacute;ximos cinco anos do plano</font></td>
                                        <td ><select name="INumRentAnual1">
                                            <option value="3">3%</option>
                                            <option value="4">4%</option>
                                            <option value="5">5%</option>
                                            <option value="6" selected>6%</option>
                                            <option value="7">7%</option>
                                            <option value="8">8%</option>
                                            <option value="9">9%</option>
                                            <option value="10">10%</option>
                                        </select></td>
                                        <td width="141" height="15" align="right" valign="right"><a href="#" onMouseOver="teste('EltRentabilidadeElet.htm','codigo','scrollbars=yes,width=450,height=120,top=400, left=100')" onMouseOut="novaJanela.close();"> </a><a href="#" OnMouseOver="teste('EltRentabilidadeElet.htm','codigo','scrollbars=yes,width=450,height=120, top=200, left=100')" OnMouseOut="novaJanela.close();"><img src="img/botao-rentabilidade-novo.gif" width="132" height="24" border="0"></a></td>
                                      </tr>
                                      <tr>
                                        <td height="45"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">N</font><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">os anos restantes do plano <br>
                                        </font></td>
                                        <td height="45"><select name="INumRentAnual2">
                                            <option value="3">3%</option>
                                            <option value="4">4%</option>
                                            <option value="5">5%</option>
                                            <option value="6" selected>6%</option>
                                            <option value="7">7%</option>
                                            <option value="8">8%</option>
                                            <option value="9">9%</option>
                                            <option value="10">10%</option>
                                        </select></td>
                                        <td height="45">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b>Op&ccedil;&atilde;o de contribui&ccedil;&atilde;o</b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">&nbsp;</font>&nbsp;<a href="#" onMouseOver="teste('EltExibeHelpSimu.jsp?Pergunta=pergunta9&usuario=137CC763-D604-4CF6-A1E0-0A1EC4638D72','codigo','scrollbars=yes,width=380,height=200, top=300 left=460')" onMouseOut="novaJanela.close();"><img src="./img/interrogacao.gif" width="15" height="15" border="0"></a></td>
                                      </tr>
                                      <tr valign="middle">
                                        <td height="15" width="186" valign="top"><select name="IStrContribuicao1">
                                            <option value="1">1.8% e 6%</option>
                                            <option value="2">2.25% e 7.5%</option>
                                            <option value="3">3.75% e 11.25%</option>
                                            <option value="4" selected>4.5% e 15%</option>
                                          </select>
                                        </td>
                                        <td height="15" valign="top" width="61">
                                           <a href="#" onMouseOver="teste('Eltcontacumulada.jsp?INumSalAtual=<%=request.getParameter("INumSalAtual")%>','codigo','scrollbars=yes,width=200,height=150, top=200, left=460')"> <img src="./img/bot_calcular.gif" width="54" height="29" border="0"> </a> </td>
                                        <td height="15" valign="middle" width="141">&nbsp;</td>
                                      </tr>
                                  </table></td>
                                </tr>
                                <tr>
                                  <td width="355" valign="top"><img src="./img/simulador_baixo01.gif" width="350" height="38"></td>
                                  <td width="67" valign="top"><input name="image" type="image" src="./img/simulador_baixo03.gif" border="0"></td>
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
  <tr>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr> 
   <td width="466" valign="top"> 
        
      <script language="JavaScript">
//Verifica se � n�mero	
function nochars(strval){
  var retval = true;
  for (var i = 0; i < strval.length; i++){
     if (strval.substring(i,i+1) < "0" || strval.substring(i,i+1) > "9"){
        strval.value=""; 
		retval=false;
        break;
     }
  }
  return retval;
}

function ReloadTit(){
		
			self.location.href="index.cfm?radTipoUsu=1"
		
}

function ReloadDep(){
		
			self.location.href="index.cfm?radTipoUsu=2"
		
}

</SCRIPT>
</td> 
  </tr>
</table><html:link page="/opcaoRentabilidade.do">
      <bean:message key="link.opcaoRentabilidade"/>
    </html:link></body>
</html>
 

