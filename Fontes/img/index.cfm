<!--- 
*******************************************************************************
Descrição: Nova Index
 
Autor:Andre 
 
Data:05/02/2002
 
Parâmetros de Entrada:
 
Retorno:
 
Informações Adicionais:
+ Includes
   iEltMenu
   iEltSuperior
   iEltLateral
   . 
+ Objetos
   .
+ Stored Procedures
   .
 
Modificações:
 
   dd/mm/yyyy - nome autor - Descrição
 
******************************************************************************* --->


<html>
<head>
<title>Eletros</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<cfif not ParameterExists(screenWidth)>
        
    <cfif isDefined("IDUSU")>
        <cflocation url="#url_site#eltBuscaResolucao.cfm?IDUSU=#URLEncodedFormat(IDUSU)#" addtoken="No">
    <cfelse>
        <cfif isdefined("radTipoUsu")>
            <cfset TipoUsu = "?radTipoUsu="&#radTipoUsu#>
        <cfelse>
            <cfset TipoUsu = "">    
        </cfif>    
        
        <cfif isdefined ("lStrMsgErro")> 
            <cfset MsgErro = "&lStrMsgErro="&#URLEncodedFormat(lStrMsgErro)#>
        <cfelse>
            <cfset MsgErro = "">        
        </cfif>

        <cflocation url="#url_site#eltBuscaResolucao.cfm#TipoUsu##MsgErro#" addtoken="No">
    </cfif>    
<cfelse>
    <cfif isdefined("radTipoUsu")>
        <cfset TipoUsu = "?radTipoUsu="&#radTipoUsu#>
    <cfelse>
        <cfset TipoUsu = "">    
    </cfif>    

        <cfif isdefined ("lStrMsgErro")> 
            <cfset MsgErro = "&lStrMsgErro="&#URLEncodedFormat(lStrMsgErro)#>
        <cfelse>
            <cfset MsgErro = "">        
        </cfif>
    
    
    <cfoutput>
        <SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
        <!--
        <cfif #screenwidth# eq "1152">
            if (#screenwidth# != screen.width && screen.width != "1280"){
                window.location.href="#url_site#eltBuscaResolucao.cfm#TipoUsu##MsgErro#";
            }            
        <cfelseif #screenwidth# eq "800">
            //if (#screenwidth# != screen.width  && screen.width != "600"){
            //    window.location.href="#url_site#eltBuscaResolucao.cfm#TipoUsu##MsgErro#";
            //}            

        <cfelse>
            if (#screenwidth# != screen.width){
                window.location.href="#url_site#eltBuscaResolucao.cfm#TipoUsu##MsgErro#";
            }            
        </cfif>

        //-->
        </SCRIPT>
    </cfoutput>
</cfif>


<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
<!--
    var tamwid;
    var tamhei;
    tamwid = ( screen.availWidth);
    tamhei = ( screen.availHeight);
    
    function MudaJanela(){
        var tamwid;
        var tamhei;
        tamwid = ( screen.availWidth);
        tamhei = ( screen.availHeight);
        self.moveTo(0,0);
        self.resizeTo(tamwid,tamhei);
    }
//-->
</SCRIPT>

<!--- query para inserir imagem do Eletros em Foco no final da página --->
 <cfquery name="qsLista" datasource="#odbc_data#">
                select top 1 datareferencia, nomearquivo, imagem
                from FocosPDF
                where  indativo= 1
                order by datareferencia desc
</cfquery>


<cfset lstrPalavra = "">
<script language="JavaScript">
    function FncAbreJanela(){
        window.open('PopUp_OnLoad.htm','_PopUp_','width=230,height=115,top=200,left=250');
    }
</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MudaJanela();InitialiseScrollableArea();">
  <table width="736" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
        <!---     INSERE O MENU DE NAVEGAÇÃO --->
        <cfinclude template="../include/iEltMenu.cfm"> 
        <!---     INSERE A BARRA SUPERIOR --->    
        <cfinclude template="../include/iEltSuperior.cfm">

        <table width="466" border="0" cellspacing="0" cellpadding="0" background="<cfoutput>#DirImg#</cfoutput>nada.gif">
          <tr> 
            <td width="260" valign="top"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr valign="top"> 
                  <td height="40"><img src="<cfoutput>#DirImg#</cfoutput>tit_oque.gif" width="242" height="36"></td>
                </tr>
                <tr> 
                  <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">A 
                    Fundação Eletrobrás de Seguridade Social - Eletros, criada 
                    em 1971, é o fundo de pensão dos empregados da Eletrobrás, 
                    do Cepel, do ONS e da própria Eletros. Tem como finalidade 
                    básica instituir e executar planos privados de concessão de 
                    benefícios.<br>
                 <cfif isdefined('IDUSU')>
                  <a href="<cfoutput>#DirScript#</cfoutput>EltInfoEletros.cfm?IDUSU=<cfoutput>#URLEncodedFormat(IDUSU)#</cfoutput>" class="noticias">
                <cfelse>
                 <a href="<cfoutput>#DirScript#</cfoutput>EltInfoEletros.cfm" class="noticias">
                </cfif>
              Ler mais...</a> </font>
              </td>
                </tr>
              </table>

              <br>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr valign="top"> 
                  <td height="24"><img src="<cfoutput>#DirImg#</cfoutput>tit_oqueha.gif" width="260" height="19"></td>
                </tr>
                <tr> 
                  <td height="15"><img src="<cfoutput>#DirImg#</cfoutput>barra_pontos.gif" width="260" height="5"></td>
                </tr>
                <tr valign="top"> 
                  <td> 
                    <table width="257" border="0" cellspacing="0" cellpadding="2">
                      <tr> 
                        <td colspan="2"><img src="<cfoutput>#DirImg#</cfoutput>tit_novoregl_planoCD.gif" width="225" height="16"> 
                        </td>
                      </tr>
                      <tr> 
                        <td align="center">
                <cfif isdefined('IDUSU')><a href="<cfoutput>#DirScript#</cfoutput>EltRegulamentoCD.cfm?IDUSU=<cfoutput>#URLEncodedFormat(IDUSU)#</cfoutput>"><cfelse><a href="<cfoutput>#DirScript#</cfoutput>EltRegulamentoCD.cfm?CodPag="></cfif>
                    <img src="<cfoutput>#DirImg#</cfoutput>img_novoregul_planoCD.gif" border="0" width="38" height="52">
                </a>
                </td>
                        <td width="200" valign="top" align="left"><font color="09098A" size="1" face="Verdana, Arial, Helvetica, sans-serif">
                Aguardando aprovação da Secretaria de Previdência Complementar.</font></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr valign="middle"> 
                  <td height="15"><img src="<cfoutput>#DirImg#</cfoutput>barra_pontos.gif" width="260" height="5"></td>
                </tr>
                <tr valign="middle"> 
                  <td height="15"> 
                    <table width="257" border="0" cellspacing="0" cellpadding="2">
                      <tr> 
                        <td colspan="2">
                <img src="<cfoutput>#DirImg#</cfoutput>tit_manual_explic.gif" width="149" height="16" border="0"> 
                        </td>
                      </tr>
                      <tr> 
                        <td align="center" width="129">
                <cfif isdefined('IDUSU')><a href="<cfoutput>#DirScript#</cfoutput>EltPlanoCDMisto.cfm?IDUSU=<cfoutput>#URLEncodedFormat(IDUSU)#</cfoutput>"><cfelse><a href="<cfoutput>#DirScript#</cfoutput>EltPlanoCDMisto.cfm?CodPag=14"></cfif>                                
                <img src="<cfoutput>#DirImg#</cfoutput>planomisto.gif"  border="0">
                </a>
                </td>
                        <td width="120" valign="top" align="left"><font color="09098A" size="1" face="Verdana, Arial, Helvetica, sans-serif">Eletrobr&aacute;s<br>
                          Cepel<br>
                          Eletros </font></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr valign="middle"> 
                  <td height="15"><img src="<cfoutput>#DirImg#</cfoutput>barra_pontos.gif" width="260" height="5"></td>
                </tr>
                <tr valign="middle"> 
                  <td height="15"> 
                    <table width="257" border="0" cellspacing="0" cellpadding="2">
                      <tr> 
                        <td colspan="2"><img src="<cfoutput>#DirImg#</cfoutput>tit_eletros_foco.gif" width="126" height="14"> 
                        </td>
                      </tr>
                      <tr> 
                        <td align="center" width="129">
                <cfif isdefined('IDUSU')><a href="<cfoutput>#DirScript#</cfoutput>EltFoco.cfm?IDUSU=<cfoutput>#URLEncodedFormat(IDUSU)#</cfoutput>"><cfelse><a href="<cfoutput>#DirScript#</cfoutput>EltFoco.cfm?codpag=4"></cfif>
                    <img src="<cfoutput>#DirImgManut##qsLista.imagem#</cfoutput>" border="0" width="103" height="140">
                </a></td>
                        <td width="120" valign="top" align="left"><font color="09098A" size="1" face="Verdana, Arial, Helvetica, sans-serif">O 
                          Eletros em Foco é um periódico de caráter institucional 
                          destinado aos participantes da Fundação. </font></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr valign="middle"> 
                  <td height="15">&nbsp;</td>
                </tr>
              </table>
            </td>
            <td width="13">&nbsp;</td>
            <td width="183" valign="top"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="1">
                <tr bgcolor="EC9C39"> 
                  <td> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
                      <tr> 
                        <td><img src="<cfoutput>#DirImg#</cfoutput>tit_ult_noticias.gif" width="181" height="29"></td>
                      </tr>
                      <tr align="center"> 
                        <td height="180"> 
                          <p> <!-- begin absolutely positioned scrollable area object--> 
                          </p>

    
            
                
                
<form name="form1" method="post" action="">
    <!-- begin absolutely positioned scrollable area object--> 
        <cfif ScreenWidth eq "1152">
            <cfif find("Netscape6" ,#cgi.http_user_agent#,1)> <!--- If p/verificar se é Netscape 6 --->    
                <div id="divUpControl" style="width: 10px; height: 11px; left: 668px; top: 165px; z-index: 2;">
            <cfelse>
                <div id="divUpControl" style="width: 10px; height: 11px; left: 664px; top: 153px; z-index: 2;">
            </cfif>

        <cfelseif ScreenWidth eq "1024">
            <cfif find("Netscape6" ,#cgi.http_user_agent#,1)> <!--- If p/verificar se é Netscape 6 --->    
                <div id="divUpControl" style="width: 10px; height: 11px; left: 607px; top: 165px; z-index: 2;">
            <cfelse>
                <div id="divUpControl" style="width: 10px; height: 11px; left: 610px; top: 153px; z-index: 2;">
            </cfif>
        <cfelseif ScreenWidth eq "800">
            <cfif find("Netscape6" ,#cgi.http_user_agent#,1)> <!--- If p/verificar se é Netscape 6 --->    
                <div id="divUpControl" style="width: 10px; height: 11px; left: 490px; top: 170px; z-index: 2;">
            <cfelse>
                <div id="divUpControl" style="width: 10px; height: 11px; left: 484px; top: 153px; z-index: 2;">
            </cfif>
        </cfif>
     
     
        <a href="javascript:;" onMouseOver="PerformScroll(-7)" onMouseOut="CeaseScroll()">
        <img src="<cfoutput>#DirImg#</cfoutput>seta_up.gif" width="43" height="8" border="0">
        </a> 
    </div>
        <cfif ScreenWidth eq "1152">
            <cfif find("Netscape6" ,#cgi.http_user_agent#,1)> <!--- If p/verificar se é Netscape 6 --->    
                <div id="divDownControl" style="width: 10px; height: 11px; left: 668px; top: 342px; z-index: 3;">
            <cfelse>
                <div id="divDownControl" style="width: 10px; height: 11px; left: 664px; top: 335px; z-index: 3;">
            </cfif>
        <cfelseif ScreenWidth eq "1024">
            <cfif find("Netscape6" ,#cgi.http_user_agent#,1)> <!--- If p/verificar se é Netscape 6 --->    
                <div id="divDownControl" style="width: 10px; height: 11px; left: 607px; top: 340px; z-index: 3;">
            <cfelse>
                <div id="divDownControl" style="width: 10px; height: 11px; left: 610px; top: 335px; z-index: 3;">
            </cfif>
        <cfelseif ScreenWidth eq "800">
            <cfif find("Netscape6" ,#cgi.http_user_agent#,1)> <!--- If p/verificar se é Netscape 6 --->    
                <div id="divDownControl" style="width: 10px; height: 11px; left: 490px; top: 339px; z-index: 3;">
            <cfelse>
                <div id="divDownControl" style="width: 10px; height: 11px; left: 484px; top: 328px; z-index: 3;">
            </cfif>
        </cfif>
 <!---       <div id="divDownControl" style="left: 674px; top: 350px; width: 12px; height: 10px; z-index: 3"> --->
        <a href="javascript:;" onMouseOver="PerformScroll(7)" onMouseOut="CeaseScroll()">
        <img src="<cfoutput>#DirImg#</cfoutput>seta_down.gif" width="43" height="8" border="0">
        </a>
    </div>

<cfset data = now()>

<cfquery name="qsNoticias" datasource="#ODBC_DATA#">
    select * from noticias
    where datainicio < #data#
    and datafim > #data#
    and indativo = 1
    order by Datainclusao desc
</cfquery>

    <cfif ScreenWidth eq "1152">
        <cfif find("Netscape6" ,#cgi.http_user_agent#,1)> <!--- If p/verificar se é Netscape 6 --->    
            <div id="divContainer" style="left: 608px; top: 182px; width: 51; z-index: 5;">
        <cfelse>
            <div id="divContainer" style="left: 600px; top: 170px; width: 251; z-index: 5;">
        </cfif>
    <cfelseif ScreenWidth eq "1024">
        <cfif find("Netscape6" ,#cgi.http_user_agent#,1)> <!--- If p/verificar se é Netscape 6 --->    
            <div id="divContainer" style="left: 542px; top: 185px; width: 201; z-index: 5;">
        <cfelse>
            <div id="divContainer" style="left: 540px; top: 177px; width: 201; z-index: 5;">
        </cfif>
    <cfelseif ScreenWidth eq "800">
        <cfif find("Netscape6" ,#cgi.http_user_agent#,1)> <!--- If p/verificar se é Netscape 6 --->    
            <div id="divContainer" style="left: 427px; top: 180px; width: 51px; z-index: 5;">
        <cfelse>
            <div id="divContainer" style="left: 427px; top: 173px; width: 251; z-index: 5;">
        </cfif>
    </cfif>
    
<!---  <div id="divContainer" style="left: 610px; top: 170px; width: 251; z-index: 5;"> --->  
        <div id="divContent">
        <table width="172" border="0" cellspacing="3" cellpadding="3" bgcolor="FFFFFF">
            <cfoutput query="qsNoticias">
                <tr> 
                    <td width="13" valign="top"><img src="#DirImg#seta_ult_noticias.gif" width="11" height="11" border=0></td>
                    <td width="159" valign="top">
                        <font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="noticias" color="##003366">
                        <cfif qsNoticias.recordcount neq 0>
                            <cfif qsNoticias.link neq "">
                                <a class="noticias" href="#link#?codnoticia=#codnoticia#&noticia=1<cfif isdefined('idusu')>&idusu=#idusu#</cfif>"><b>#titulo#</b></a>
                            <cfelse>
                                <a class="noticias" href="EltExibeNoticia.cfm?codnoticia=#codnoticia#&noticia=1<cfif isdefined('idusu')>&idusu=#idusu#</cfif>"><b>#titulo#</b></a>
                            </cfif>
                        <cfelse>
                            Não existem noticias cadastradas
                        </cfif>
                        </font>
                    </td>
                </tr>
           </cfoutput>
        </table>
          </div>
      </div>
<!-- end absolutely positioned scrollable area object --> 
</form>
                
                          <p>&nbsp;</p>
                        </td>
                      </tr>
                      <tr> 
                        <td>&nbsp;</td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
              <br>

              <table width="183" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td rowspan="5" background="<cfoutput>#DirImg#</cfoutput>bg_pontos_vertical.gif" width="14"><img src="<cfoutput>#DirImg#</cfoutput>nada.gif" width="10" height="1"></td>
                  <td width="186"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="2">
                      <tr> 
                        <td colspan="2"><img src="<cfoutput>#DirImg#</cfoutput>tit_rede_cred.gif" width="142" height="14"></td>
                      </tr>
                      <tr> 
                        <td width="79" align="center">
                <cfif isdefined('IDUSU')><a href="<cfoutput>#DirScript#</cfoutput>EltRCredenciada.cfm?IDUSU=<cfoutput>#URLEncodedFormat(IDUSU)#</cfoutput>"><cfelse><a href="<cfoutput>#DirScript#</cfoutput>EltRCredenciada.cfm?CodPag=14"></cfif>                
                    <img src="<cfoutput>#DirImg#</cfoutput>medico.jpg" width="67" height="69" border="0">
                </a>
                </td>
                        <td width="96" align="left" valign="top"><font color="09098A" size="1" face="Verdana, Arial, Helvetica, sans-serif">Veja 
                          como é fácil pesquisar nossa rede credenciada.</font></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td height="15" width="186"><img src="<cfoutput>#DirImg#</cfoutput>barra_pontos2.gif" width="170" height="5"></td>
                </tr>
                <tr> 
                  <td width="186"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="2">
                      <tr> 
                        <td colspan="2" height="18"><img src="<cfoutput>#DirImg#</cfoutput>tit_simul_migra.gif" width="182" height="15"></td>
                      </tr>
                      <tr> 
                     <td width="79" align="center">
                        <cfif isdefined('IDUSU')><a href="<cfoutput>#DirScript#</cfoutput>EltSimuladorIniciar.cfm?IDUSU=<cfoutput>#URLEncodedFormat(IDUSU)#</cfoutput>"><cfelse><a href="<cfoutput>#DirScript#</cfoutput>EltSimuladorIniciar.cfm?CodPag=53"></cfif>
                    <img src="<cfoutput>#DirImg#</cfoutput>simulador.jpg" width="61" height="79" border="0">
                </a>
                </td>
                        <td width="96" align="left" valign="top"><font color="09098A" size="1" face="Verdana, Arial, Helvetica, sans-serif"><br>
                          <br>
                          <img src="<cfoutput>#DirImg#</cfoutput>img_EmBreve.gif" width="69" height="14" hspace="5" vspace="5"></font></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td width="186" height="15"><img src="<cfoutput>#DirImg#</cfoutput>barra_pontos2.gif" width="170" height="5"></td>
                </tr>
                <tr> 
                  <td width="186" height="100%">
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    </td>
                </tr>
              </table>
              
            </td>
          </tr>
        </table>
        <table width="466" border="0" cellspacing="0" cellpadding="0">
          <tr align="center"> 
            <td height="15"><img src="<cfoutput>#DirImg#</cfoutput>barra_pontos3.gif" width="461" height="3"></td>
          </tr>
          <tr> 
            <td> 
              <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><font color="003366">Funda&ccedil;&atilde;o 
                Eletrobr&aacute;s de Seguridade Social - ELETROS</font></b><font color="003366"><br>
                Rua Uruguaiana, 174 / 5&ordm;, 6&ordm; e 7&ordm; andares - Centro<br>
                Rio de Janeiro - CEP: 20050-092<br>
                Tel: (21) 3806-4700 Fax: (21) 2509-2897 </font></font></div>
              <p align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="003366"><b>ELETROS-SA&Uacute;DE</b><br>
                Av. Rio Branco, 81 / 20&ordm; andar - Centro - Rio de Janeiro 
                - CEP: 20040-004<br>
                Tel: (21) 2263-6032 Fax: (21) 2263-6172</font></p>
              <p align="center"></p>
              <p align="center"></p>
            </td>
          </tr>
        </table>
        <br>
      
   
        <!---     INSERE A LATERAL DIREITA --->
        <cfinclude template="../include/iEltLateral.cfm">
    
    
    
    </tr>
  </table>
</form>
</body>
</html>
