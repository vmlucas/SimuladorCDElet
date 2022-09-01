<%@page contentType="text/html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<html>

<head>
<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title>
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
<style>

 input {font-family:Verdana, Arial, Helvetica, sans-serif ; font-size:10px; }
 select {font-family:Verdana, Arial, Helvetica, sans-serif ; font-size:10px; }

</style>
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
                            <tr>
                              <td><table width="25%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <td width="466" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr valign="top">
          <td height="60"><p><img src="img/tit_simulacaomigr.gif" width="313" height="57"></p>
              
              <form action="/SimuladorElet/opcaoRentabilidade.do" method="post" name="frmdados">
                <table width="415" border="0" cellspacing="0" cellpadding="0" align="center" height="400">
                  <tr valign="top">
                    <td colspan="2" height="30"><img src="./img/simulador_passo2.gif" width="417" height="43"></td>
                  </tr>
                  <tr align="center" valign="top">
                    <td colspan="2" background="./img/simulador_fundo.gif"><table width="400" border="0" cellspacing="3" cellpadding="0" background="./img/nada.gif">
                        <tr>
                          <td height="18" colspan="4"><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#336699"><b>Escolha a Rentabilidade Anual</b></font>&nbsp;<a href="#" OnMouseOver="teste('EltExibeHelpSimu.jsp?Pergunta=pergunta8','codigo','scrollbars=yes,width=200,height=150, top=300, left=560')" OnMouseOut="novaJanela.close();"><img src="./img/interrogacao.gif" width="15" height="15" border="0"></a></td>
                        </tr>
                        <tr>
                          <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Nos pr&oacute;ximos cinco anos do plano</font>
                              <select name="INumRentAnual1">
                                <option value="3">3%</option>
                                <option value="4">4%</option>
                                <option value="5">5%</option>
                                <option value="6"selected>6%</option>
                                <option value="7">7%</option>
                                <option value="8">8%</option>
                                <option value="9">9%</option>
                                <option value="10">10%</option>
                              </select>
                          </td>
                          <td width="135"><div align="right"><a href="#" OnMouseOver="teste('EltRentabilidadeElet.htm','codigo','scrollbars=yes,width=450,height=120, top=200, left=100')" OnMouseOut="novaJanela.close();"><img src="img/botao-rentabilidade-novo.gif" width="132" height="24" border="0"></a></div></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td colspan="4"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b>Op&ccedil;&atilde;o de contribui&ccedil;&atilde;o</b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">&nbsp;</font>&nbsp;<a href="#" OnMouseOver="teste('EltExibeHelpSimu.jsp?Pergunta=pergunta9&usuario=137CC763-D604-4CF6-A1E0-0A1EC4638D72','codigo','scrollbars=yes,width=380,height=180, top=300 left=460')" OnMouseOut="novaJanela.close();"><img src="./img/interrogacao.gif" width="15" height="15" border="0"></a></td>
                        </tr>
                        <tr valign="middle">
                          <td height="15" width="108" valign="top"><select name="IStrContribuicao1">
                              <option value="1">1.8% e 6%</option>
                              <option value="2">2.25% e 7.5%</option>
                              <option value="3">3.75% e 11.25%</option>
                              <option value="4" selected>4.5% e 15%</option>
                            </select>
                          </td>
                          <td height="15" valign="top" width="61">&nbsp;</td>
                          <td valign="top" width="81">
                              <a href="#" onMouseOver="teste('Eltcontacumulada.jsp?INumSalAtual=<%=request.getParameter("INumSalAtual")%>','codigo','scrollbars=yes,width=200,height=140, top=200, left=460')"><img src="./img/bot_calcular.gif" width="54" height="29" border="0" ></a></td>
                          <td height="15" valign="middle" width="135">&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="350" valign="top"><img src="./img/simulador_baixo01.gif" width="350" height="38"></td>
                    <td width="68" valign="top"><input border="0" type="image" src="./img/simulador_baixo03.gif">
                    </td>
                  </tr>
                </table>
            </form></td>
        </tr>
      </table>
          <script language="JavaScript">
//Verifica se &eacute; n&uacute;mero	
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

//Valida o campo Rentabilidade Anual 
function vld_login(campo) {
   if (campo.value != ""){
	  	if (!nochars(campo.value)){
	 		alert("Preencha o campo Login somente com n&uacute;meros.");
	    	return false;
		}
		if ( (campo.value.length > 7) ) {
	 		alert("Preencha o campo Login com at&eacute; 7 d&iacute;gitos");
	    	return false;
        }
    }
}


function Tecla(e)
{
	if (document.all) // Internet Explorer
		var tecla = event.keyCode;
	else if(document.layers) // Nestcape
		var tecla = e.which;
		if (tecla > 47 && tecla < 58) // numeros de 0 a 9 ou v&iacute;rgula
			return true;
		else
		   {
			if (tecla != 8) // backspace
				event.keyCode = 0;
				//return false;
			else
				return true;
		}
}

function MM_showHideLayers2() { //v3.0

  var i,p,v,obj,args=MM_showHideLayers.arguments;
  
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }

    obj.visibility=v; }
    
}

function MM_findObj(n, d) { //v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
}


function MM_showHideLayers()
{ 

	  var i, p, v, obj, args=MM_showHideLayers.arguments;

	  for (i=0; i<(args.length-2); i+=3) 
	  	if ((obj=MM_findObj(args[i]))!=null) { 
			v=args[i+2];
	    	if (obj.style) { 
				obj=obj.style; 
				v=(v=='show')?'visible':(v='hide')?'hidden':v; 
			}
	    	obj.visibility=v; 
		}
}

 
	



function ReloadTit(){
		
			self.location.href="index.cfm?radTipoUsu=1"
		
}

function ReloadDep(){
		
			self.location.href="index.cfm?radTipoUsu=2"
		
}

    </SCRIPT>
      <td width="135" valign="top" background="./img/fundo_direita.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr valign="top">
            <td valign="top"><br>
            </td>
          </tr>
      </table></td>
  </tr>
                              </table></td>
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
    </table>    
    <p>&nbsp;</p>
    <p>&nbsp;</p><html:link page="/opcaoRentabilidade.do">
            <bean:message key="link.opcaoRentabilidade"/>
        </html:link></body>


</html>
 

