

<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<html>
<head>
<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title>
<LINK REL="StyleSheet" HREF="Css/Eletros.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" src="Js/eletros.js"></SCRIPT>
<script>
function refreshSim(){
		
			self.location.href="contribExtraordinaria.jsp";
		
}

function refreshNao(){
		
			self.location.href="optContribExtraordinaria.jsp";
}

</script>


<style>

 input {font-family:Verdana, Arial, Helvetica, sans-serif ; font-size:10px; }
 select {font-family:Verdana, Arial, Helvetica, sans-serif ; font-size:10px; }

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
                      <td width="770"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td height="414"><p><img src="./img/tit_simulacaomigr.gif" width="313" height="57"></p>
                              
                                <form action="/SimuladorElet/simular.do" method="get" name="formulario" onsubmit="return ChecarCampo(this);" >
                                <table width="415" border="0" cellspacing="0" cellpadding="0" align="center" height="280">
                                  <tr valign="top">
                                    <td colspan="3" height="40"><img src="./img/simulador_passo3.gif" width="417" height="43"></td>
                                  </tr>
                                  <tr align="center" valign="top">
                                    <td colspan="3" background="./img/simulador_fundo.gif" height="198"><table width="400" border="0" cellspacing="3" cellpadding="0" background="./img/nada.gif">
                                        <tr>
                                          <td height="18" colspan="3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#333399"><font color="#000000" size="3"><b><font size="2" color="#336699">Deseja fazer alguma contribui&ccedil;&atilde;o extraordin&aacute;ria?</font></b></font></font>&nbsp;<a href="#" OnMouseOver="teste('EltExibeHelpSimu.jsp?Pergunta=pergunta16','codigo','scrollbars=yes,width=200,height=130, top=170, left=587')" OnMouseOut="novaJanela.close();"><img src="./img/interrogacao.gif" width="15" height="15" border="0"></a></td>
                                        </tr>
                                        <tr>
                                          <td colspan="3"><table width="100" border="0" cellspacing="0" cellpadding="0">
                                              <tr>
                                                <td><div align="right">
                                                    <input type="radio" name="flagContrib" value="sim" onclick="refreshSim();" checked>
                                                </div></td>
                                                <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Sim</font></td>
                                                <td><div align="right">
                                                    <input type="radio" name="flagContrib" value="nao" onclick="refreshNao();">
                                                </div></td>
                                                <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">N&atilde;o</font></td>
                                              </tr>
                                          </table></td>
                                        </tr>
                                        <tr valign="middle">
                                          <td colspan="3" height="22"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b>Essa contribui&ccedil;&atilde;o ser&aacute;:</b></font></td>
                                        </tr>
                                        <tr>
                                          <td colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                              <tr>
                                                <td width="6%"><div align="left">
                                                    <input type="radio" name="lNumAporteOpAporte" value="Mensal" checked>
                                                </div></td>
                                                <td width="12%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Mensal</font></td>
                                                <td width="10%"><div align="right">
                                                    <input type="radio" name="lNumAporteOpAporte" value="Trimestral">
                                                </div></td>
                                                <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Trimestral</font></td>
                                                <td width="9%"><div align="right">
                                                    <input type="radio" name="lNumAporteOpAporte" value="Semestral">
                                                </div></td>
                                                <td width="18%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Semestral</font></td>
                                                <td width="11%"><div align="right">
                                                    <input type="radio" name="lNumAporteOpAporte" value="Anual">
                                                </div></td>
                                                <td width="18%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">Anual</font></td>
                                              </tr>
                                          </table></td>
                                        </tr>
                                        <tr>
                                          <td colspan="3" height="15"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#333399"> </font> <font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#333399"> </font></b><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#333399">&nbsp;</font></td>
                                        </tr>
                                        <tr>
                                          <td width="165" colspan="2" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b>Valor da contribui&ccedil;&atilde;o:</b></font></td>
                                        </tr>
                                        <tr>
                                          <td height="15" colspan="2" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b> R$
                                                  <input type="text" name="INumEntAporte" size="10"  value="0,0">
                                          </b></font> <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">(99999,99)</font> </td>
                                        </tr>
                                        <tr>
                                          <td height="15" colspan="2" valign="top">&nbsp;</td>
                                        </tr>
                                        <tr>
                                          <td height="15" colspan="2" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Cr&eacute;dito no momento da Simula&ccedil;&atilde;o :</font>&nbsp;<a href="#" OnMouseOver="teste('EltExibeHelpSimu.jsp?Pergunta=pergunta4','codigo','scrollbars=yes,width=200,height=170, top=300, left=550')" OnMouseOut="novaJanela.close();"><img src="./img/interrogacao.gif" width="15" height="15" border="0"></a></td>
                                        </tr>
                                        <tr>
                                          <td height="15" colspan="2" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#000000">R$</font></b>
                                                <input type="text" name="INumAporteInicial" size="10" value="0,0">
                    (99999,99)</font></td>
                                        </tr>
                                        <tr>
                                          <td height="15" colspan="2" valign="top">&nbsp;</td>
                                        </tr>
                                        <tr>
                                          <td height="15" colspan="2" valign="top"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Aportes Espor&aacute;dicos :</font></td>
                                        </tr>
                                        <tr>
                                          <td width="177" height="15" valign="top" background="img/nada.gif"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>1&ordm; Aporte : R$</strong>
                                                <input type="text" name="aporte1" size="10"  value="0,0">
                                          </font></td>
                                          <td width="214" background="img/nada.gif"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Data :
                                                  <input type="text" name="mesAporte1" size="4"  value="01" maxlength="2">
                    /
                    <input type="text" name="anoAporte1" size="7"  value="2006" maxlength="4">
                                          </strong></font></td>
                                        </tr>
                                        <tr>
                                          <td height="15" background="img/nada.gif" ><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>2&ordm; Aporte : R$</strong>
                                                <input type="text" name="aporte2" size="10"  value="0,0">
                                          </font></td>
                                          <td background="img/nada.gif"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Data :
                                                  <input type="text" name="mesAporte2" size="4"  value="01" maxlength="2">
                    /
                    <input type="text" name="anoAporte2" size="7"  value="2006" maxlength="4">
                                          </strong></font></td>
                                        </tr>
                                        <tr>
                                          <td height="15" background="img/nada.gif" ><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>3&ordm; Aporte : R$</strong>
                                                <input type="text" name="aporte3" size="10"  value="0,0">
                                          </font></td>
                                          <td background="img/nada.gif"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Data :
                                                  <input type="text" name="mesAporte3" size="4"  value="01" maxlength="2">
                    /
                    <input type="text" name="anoAporte3" size="7"  value="2006" maxlength="4">
                                          </strong></font></td>
                                        </tr>
                                      </table>
                                  <tr>
                                    <td width="67" valign="top"><img src="./img/simulador_baixo01.gif" width="350" height="38" border="0"> </td>
                                    <td width="67" valign="top"><input type="Image" src="./img/bot_simular.gif"   border="0" width="67" height="38">
                                    </td>
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
</table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>
    <script language="JavaScript">
<!--
// begin absolutely positioned scrollable area object scripts 
// Extension developed by David G. Miles 
// Original Scrollable Area code developed by Thomas Brattli 

function MM_preloadImages() { //v3.0
  //var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    //var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    //if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}


function verifyCompatibleBrowser(){ 
    this.ver=navigator.appVersion 
    this.dom=document.getElementById?1:0 
    this.ie5=(this.ver.indexOf("MSIE 5")>-1 && this.dom)?1:0; 
    this.ie4=(document.all && !this.dom)?1:0; 
    this.ns5=(this.dom && parseInt(this.ver) >= 5) ?1:0; 
 
    this.ns4=(document.layers && !this.dom)?1:0; 
    this.bw=(this.ie5 || this.ie4 || this.ns4 || this.ns5) 
    return this 
} 
bw=new verifyCompatibleBrowser() 

var speed=50 
 
var loop, timer 
 
function ConstructObject(obj,nest){ 
    nest=(!nest) ? '':'document.'+nest+'.' 
    this.el=bw.dom?document.getElementById(obj):bw.ie4?document.all[obj]:bw.ns4?eval(nest+'document.'+obj):0; 
    this.css=bw.dom?document.getElementById(obj).style:bw.ie4?document.all[obj].style:bw.ns4?eval(nest+'document.'+obj):0; 
    this.scrollHeight=bw.ns4?this.css.document.height:this.el.offsetHeight 
    this.clipHeight=bw.ns4?this.css.clip.height:this.el.offsetHeight 
    this.up=MoveAreaUp;this.down=MoveAreaDown; 
    this.MoveArea=MoveArea; this.x; this.y; 
    this.obj = obj + "Object" 
    eval(this.obj + "=this") 
    return this 
} 
function MoveArea(x,y){ 
    this.x=x;this.y=y 
    this.css.left=this.x 
    this.css.top=this.y 
} 
 
function MoveAreaDown(move){ 
	if(this.y>-this.scrollHeight+objContainer.clipHeight){ 
    this.MoveArea(0,this.y-move) 
    if(loop) setTimeout(this.obj+".down("+move+")",speed) 
	} 
} 
function MoveAreaUp(move){ 
	if(this.y<0){ 
    this.MoveArea(0,this.y-move) 
    if(loop) setTimeout(this.obj+".up("+move+")",speed) 
	} 
} 
 
function PerformScroll(speed){ 
	if(initialised){ 
		loop=true; 
		if(speed>0) objScroller.down(speed) 
		else objScroller.up(speed) 
	} 
} 
 
function CeaseScroll(){ 
    loop=false 
    if(timer) clearTimeout(timer) 
} 
var initialised; 

function InitialiseScrollableArea(){ 
    objContainer=new ConstructObject('divContainer') 
    objScroller=new ConstructObject('divContent','divContainer') 
    objScroller.MoveArea(0,0) 
    objContainer.css.visibility='visible' 
    initialised=true; 
} 
// end absolutely positioned scrollable area object scripts//-->

//Funcao utilizada em paginas que utilizam bot�o imprimir, encontrada nas p�ginas do Previdenci�rio e Eletros-Sa�de
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
  </script>
    <script type='text/javascript'>
//HV Menu v5- by Ger Versluis (http://www.burmees.nl/)
//Submitted to Dynamic Drive (http://www.dynamicdrive.com)
//Visit http://www.dynamicdrive.com for this script and more

function Go(){return}
  </script>
    
 
</p><html:link page="/simular.do">
      <bean:message key="link.simular"/>
    </html:link><td width="466" valign="top"> 
      
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

//Valida o campo Rentabilidade Anual 
function vld_login(campo) {
   if (campo.value != ""){
	  	if (!nochars(campo.value)){
	 		alert("Preencha o campo Login somente com n�meros.");
	    	return false;
		}
		if ( (campo.value.length > 7) ) {
	 		alert("Preencha o campo Login com at� 7 d�gitos");
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
		if (tecla > 47 && tecla < 58) // numeros de 0 a 9 ou v�rgula
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
 
</body>

</html>


