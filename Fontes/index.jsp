<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<html>
<head>
	<title>Simulador Plano CD - Eletrobr&aacute;s/Eletros/Cepel</title>
	<LINK REL="StyleSheet" HREF="Css/Eletros.css" type="text/css">
	<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" src="Js/eletros.js"></SCRIPT>
    <style type="text/css">
<!--
.style1 {font-size: 10px}
.style2 {font-size: 12px; }
-->
    </style>
</head>

<body leftmargin="1" topmargin="1" rightmargin="1" bottommargin="1" marginwidth="0" marginheight="0" background="img/bkgSimulador.gif">

<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" background="img/nada1.gif">
<tr>
	<td valign="top">
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
				  <%@ include file="Script/tit_login_senha.jsp" %>
				<!-- </barra login> -->
		
				<table border="0" cellspacing="13" cellpadding="0">
				<tr>
					<td width="738"><table width="91%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="60"><p><img src="img/tit_simulacaomigr.gif" width="313" height="57"></p>
                            <table width="415" border="0" cellspacing="0" cellpadding="0" align="center" height="300">
                              <tr valign="top">
                                <td colspan="2" height="15"><img src="img/simulador_top.gif" width="417" height="19"></td>
                              </tr>
                              <tr align="center" valign="top">
                                <td colspan="2" background="img/simulador_fundo.gif"><table width="400" border="0" cellspacing="3" cellpadding="0" background="./Img/nada.gif">
                                    <tr>
                                  </tr></table>
                                  <table width="400" border="0" cellspacing="3" cellpadding="0" background="./Img/nada.gif"><tr></tr></table>
                                  <table width="400" border="0" cellspacing="3" cellpadding="0" background="./Img/nada.gif"><tr></tr></table>
                                  <table width="400" border="0" cellspacing="3" cellpadding="0" background="./Img/nada.gif"><tr></tr></table>
                                  <table width="413" height="198" border="0" align="left" cellpadding="0" cellspacing="3" background="./Img/nada.gif">
                                    <tr><td width="407" height="18" colspan="2"><ul>
                                       <!--   <li><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Se voc&ecirc; j&aacute; &eacute; participante do Plano, digite seu n&uacute;mero Eletros* (utilize os 7 d&iacute;gitos do seu n&uacute;mero de inscri&ccedil;&atilde;o) e sua senha.</font> <br>
                                                        <font size="1" face="Verdana, Arial, Helvetica, sans-serif">* O login e a senha s&atilde;o os mesmos utilizados no site da Eletros.</font></li>-->
                                      </ul></td>
                                    </tr>
                                    <tr>
                                      <td height="98" colspan="2">
									     <SCRIPT LANGUAGE="JavaScript">
                                       function initArray() {
                                          this.length = initArray.arguments.length;
                                          for (var i = 0; i < this.length; i++) {
                                             this[i] = initArray.arguments[i];
                                          }
                                       }
                                       var ctext = "<ul><li class=style2><strong>Participante: Digite seu login e a sua senha.</strong><br></li></ul>";
                                       var speed = 1000;
                                       var x = 0;
                                       var color = new initArray(
                                          "", 
                                          "white", 
                                          "", 
                                          "white", 
                                          "",
                                          "white"
                                        );
                                      if(navigator.appName == "Netscape") {
                                           document.write('<layer id="c"><left>'+ctext+'</left></layer><br>');
                                      }
                                      if (navigator.appVersion.indexOf("MSIE") != -1){
                                         document.write('<div id="c"><left>'+ctext+'</left></div>');
                                       }
                                     function chcolor(){ 
                                       if(navigator.appName == "Netscape") {
                                          document.c.document.write('<left><font color="'+color[x]);
                                          document.c.document.write('">'+ctext+'</font></left>');
                                          document.c.document.close();
                                      }
                                     else if (navigator.appVersion.indexOf("MSIE") != -1){
                                         document.all.c.style.color = color[x];
                                    }
                                    (x < color.length-1) ? x++ : x = 0;
                                   }
                                   setInterval("chcolor()",500);
                                     </SCRIPT>
									     <ul>
                                          <li class="style2">Caso n&atilde;o possua  senha, por favor entre em contato pelos telefones :(21) 2179-4764 / (21)2179-4750</li>
                                          </ul>                                      
                                       
                                        <ul>
                                          <li class="style2">N&atilde;o Participante: <font face="Verdana, Arial, Helvetica, sans-serif"><span class="style2"><a href="/SimuladorElet/login.do">Para iniciar sua Simula&ccedil;&atilde;o , clique aqui.</a><br>
                                          </span></font></li>
                                          <li class="style2"><FONT color=#ff0000><STRONG>Desative</STRONG></FONT> seu bloqueador de pop-up (Janelas), pois em alguns links do site ser&atilde;o necess&aacute;rios abrir as p&aacute;ginas em uma nova janela. </li>
                                      </ul></td>
                                    </tr>
                                </table>
                                <div align="left"></div></td>
                              </tr>
                              <tr valign="top">
                                <td colspan="2"><img src="img/simulador_boton.gif" width="417" height="19"></td>
                              </tr>
                            </table>
                        </td>
                      </tr>
                    </table></td>
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
</table><html:link page="/login.do">
   <bean:message key="link.login"/>
  </html:link></body>
</html>
