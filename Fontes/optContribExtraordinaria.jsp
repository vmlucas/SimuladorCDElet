

<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<html>
<head>
<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title>
<LINK REL="StyleSheet" HREF="Css/Eletros.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" src="Js/eletros.js"></SCRIPT>

<script language="JavaScript">
function refreshSim(){

			self.location.href="contribExtraordinaria.jsp";


}
function refreshNao(){
		
			self.location.href="optContribExtraordinaria.jsp";
}

function nochars2(strval){
  var retval = true;
  for (var i = 0; i < strval.length; i++){
     if (strval.substring(i,i+1) < "0" || strval.substring(i,i+1) > "9")
	 {
	 	if (strval.substring(i,i+1) != ",")
		{
			if (strval.substring(i,i+1) != ".")
			{
				retval=false;
		        break;
			}
		}
     }
  }
  return retval;
}

function cheka_radio()
{

	  if (formulario.flagContrib.value == "" )
	  {
	  alert("Escolha uma opcao.");
	  return false;
	  }

 }

function teste(theURL,winName,features) { //v2.0
  novaJanela=window.open(theURL,winName,features);
  novaJanela.focus();
}

</script>
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
                              <td height="60"><p><img src="./img/tit_simulacaomigr.gif" width="313" height="57"></p>
                                  
                                  <form action="/SimuladorElet/simular.do" method="post" name="formulario" onsubmit="return cheka_radio(this);">
                                    <table width="415" border="0" cellspacing="0" cellpadding="0" align="center" height="217">
                                      <tr valign="top">
                                        <td colspan="3" height="40"><img src="./img/simulador_passo3.gif" width="417" height="43"></td>
                                      </tr>
                                      <tr align="center" valign="top">
                                        <td colspan="3" background="./img/simulador_fundo.gif" height="135"><table width="400" border="0" cellspacing="3" cellpadding="0" background="./img/nada.gif">
                                            <tr>
                                              <td height="18" colspan="2"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#333399"><font color="#000000" size="3"><b><font size="2" color="#336699">Deseja fazer alguma contribui&ccedil;&atilde;o extraordin&aacute;ria?</font></b></font></font>&nbsp;<a href="#" OnMouseOver="teste('EltExibeHelpSimu.jsp?Pergunta=pergunta16','codigo','scrollbars=yes,width=200,height=150, top=170, left=587')" OnMouseOut="novaJanela.close();"><img src="./img/interrogacao.gif" width="15" height="15" border="0"></a></td>
                                            </tr>
                                            <tr>
                                              <td colspan="2"><table width="100" border="0" cellspacing="0" cellpadding="0">
                                                  <tr>
                                                    <td><div align="right">
                                                        <input type="radio" name="flagContrib" value="sim" onclick="refreshSim();" >
                                                    </div></td>
                                                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Sim</font></td>
                                                    <td><div align="right">
                                                        <input type="radio" name="flagContrib" value="nao" onclick="refreshNao();" checked>
                                                    </div></td>
                                                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">N&atilde;o</font></td>
                                                  </tr>
                                              </table></td>
                                            </tr>
                                        </table></td>
                                      </tr>
                                      <tr>
                                        <td width="67" valign="top"><img src="./img/simulador_baixo01.gif" width="350" height="38" border="0"> </td>
                                        <td width="67" valign="top"><input type="Image" src="./img/bot_simular.gif" border="0" width="67" height="38">
                                        </td>
                                      </tr>
                                    </table>
		                  </form>
                            <tr>
                              <td>&nbsp;</td>
                            </tr>
                          </table></td>
                        </tr></table></td>
                </tr></table>
            
        <!-- <rodape> -->
<%@ include file="Script/tit_inf.htm" %>
              <!-- </rodape> -->
          </td>
        </tr>
      </table>
    
<script language="JavaScript">



function ReloadTit(){

			self.location.href="index.cfm?radTipoUsu=1"

}

function ReloadDep(){

			self.location.href="index.cfm?radTipoUsu=2"

}

</SCRIPT><html:link page="/simular.do">
      <bean:message key="link.simular"/>
    </html:link></body>

</html>

