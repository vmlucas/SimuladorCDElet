<cfparam name="radTipoUsu" default="1">


<script language="JavaScript">
//Verifica se é número	
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
	 		alert("Preencha o campo Login somente com números.");
	    	return false;
		}
		if ( (campo.value.length > 7) ) {
	 		alert("Preencha o campo Login com até 7 dígitos");
	    	return false;
        }
    }
}

<!--- Só permite digitar numeros --->
function Tecla(e)
{
	if (document.all) // Internet Explorer
		var tecla = event.keyCode;
	else if(document.layers) // Nestcape
		var tecla = e.which;
		if (tecla > 47 && tecla < 58) // numeros de 0 a 9 ou vírgula
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

<cfif ParameterExists(ScreenWidth)>
	<cfset ScreenWidth = "&ScreenWidth="&#ScreenWidth#>
<cfelse>
	<cfset 	ScreenWidth = "">
</cfif>

<!--- Função p/ dar reload pro titular --->
function ReloadTit(){
		<cfoutput>
			self.location.href="index.cfm?radTipoUsu=1#ScreenWidth#"
		</cfoutput>
}
<!--- Função p/ dar reload pro Dependente --->
function ReloadDep(){
		<cfoutput>
			self.location.href="index.cfm?radTipoUsu=2#ScreenWidth#"
		</cfoutput>
}

</SCRIPT>
</td> <!--- Este td fecha a coluna do meio --->

      <td width="135" valign="top" background="#DirImg#fundo_direita.gif"> 

      <table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr valign="top"> 
	          <td valign="top"><img src="./img/topo_dir.jpg" width="144" height="195" border="0"><br></td>
		</tr>
		<tr valign="top">
		  <td valign="top">
		    <table width="88%" height="100%" border="0" cellspacing="0" cellpadding="0">
	              <tr valign="top"> 
      	          <td colspan="2" valign="top"><img src="./img/tab_top.gif" width="144" height="16"></td>
			   </tr>
		         <tr align="right"> 
            	    <td colspan="2" background="./img/tab_fundo.gif"> 
<!--- <!--- <!--- ESTÁ LOGADO ---> ---> --->
				<cfif isdefined ('IDUSU')>
	 				<cfquery name="qsBuscaDicas" datasource="#odbc_data#">
						SELECT * FROM Dicas
						WHERE IndAtivo = '1'
					</cfquery>
				
				<cfset #lNumCodDica# = #RandRange(1,#qsBuscaDicas.Recordcount#)#>
				<!---<cfset #PrimeiroNome# = #gettoken("Luciana Vital de Matos",1," ")#> depois não preciso colocar esta linha, pois já virá da validação do usuário --->
		                  <table  align="right" width="105" border="0" cellspacing="0" cellpadding="0" background="<cfoutput>#DirImg#</cfoutput>nada.gif">
            		        <tr valign="top" background="<cfoutput>#DirImg#</cfoutput>nada.gif"> 
		                      <td width="94" height="100%" valign="top" background="<cfoutput>#DirImg#</cfoutput>nada.gif" align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="283C88"><b>
						<script language="JavaScript">
						dia = new Date();
						hora = dia.getHours();
						
						if(hora < 12)
							document.write("Bom dia, ");		
						else if(hora < 18)
							document.write("Boa tarde, ");
						else 
							document.write("Boa noite, ");	
						</script>
						<br>
						  <cfset #letra1# = #Left(PrimeiroNome,1)#>
						  <cfset #restonome# = #Mid(PrimeiroNome,2,15)#>
  
						  <cfoutput>#letra1##Lcase(restonome)#</cfoutput><br>
	 				  <!--- <cfoutput>#LCase(PrimeiroNome)#</cfoutput> --->
					  <!--- <cfoutput>#LCase(PrimeiroNome)#</cfoutput> ---><br> 
	                        <font size="1">.....................</font><br>
						</b><font color="#000000"><cfoutput query="qsBuscaDicas" startrow="#lNumCodDica#" maxrows="1">#DescrDica#</cfoutput></font></font>
				</td>
                      <td width="11" valign="top"></td>
                    </tr>
                  </table>
  		   </td>
              </tr>
              <tr> 
                <td colspan="2"><img  src="<cfoutput>#DirImg#</cfoutput>tab_baixo.gif" width="144" height="17"></td>
              </tr>
            </table>
		<cfif isdefined('noticia')>
	   		
			<cfquery name="qsNoticias" datasource="#ODBC_DATA#">
				select top 5* from noticias
				where indativo = 1
				and codnoticia <> #codnoticia#
				order by codnoticia desc
			</cfquery>
	   
		   <table width="95%" border="0" cellspacing="0" cellpadding="3">
		   		<cfif qsNoticias.recordcount neq 0>
					<tr> 
			                <td width="15%" height="20">&nbsp;</td>
			                <td colspan="2" align="center" height="20" class="azul"><font size="1"><b><font color="283C88" face="Verdana, Arial, Helvetica, sans-serif">
							<span class="azul">
							<cfif qsNoticias.recordcount eq 1>
								Última Notícia
							<cfelse>
								Últimas <cfoutput>#qsNoticias.recordcount#</cfoutput> Notícias
							</cfif>
							</span></font></td>
			        </tr>
				</cfif>
				<cfoutput query="qsNoticias">
					  <tr> 
		                <td width="15%" height="20"><img src="#DirImg#nada.gif" width="10" height="15"></td>
		                <td colspan="2" align="center" height="20"><font size="1" face="Arial, Helvetica, sans-serif" color="283C88">.............................</font></td>
		              </tr>
		              <tr> 
		                <td width="15%">&nbsp;</td>
		                <td width="9%" valign="top"><img src="#DirImg#seta3.gif" width="8" height="8"></td>
		                <td width="76%" class="azul"><font size="1"><b><font color="##003366" face="Verdana, Arial, Helvetica, sans-serif">
						<span class="azul">
						
							<cfif qsNoticias.recordcount neq 0>
								<cfif qsNoticias.link neq "">
									<a href="#link#?codnoticia=#codnoticia#&noticia=1<cfif isdefined('idusu')>&idusu=#idusu#</cfif>" class="noticias"><b>#titulo#</b></a>
								<cfelse>
									<a href="../../../Eletros/Internet/Include/EltExibeNoticia.cfm?codnoticia=#codnoticia#%ACicia=1<cfif isdefined('idusu')>&idusu=#idusu#</cfif>" class="noticias"><b>#titulo#</b></a>
								</cfif>
							</cfif>		
						</span></a></font></b></font><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b></b></font></td>
		              </tr> 
					 </cfoutput>	
			        <br>
			      </td>
			    </tr>
		   </table>
		</cfif>
<!--- <!--- NÃO ESTÁ LOGADO ---> --->			
	<cfelse>
	<form action="<cfoutput>#DirScript#</cfoutput>EltValidaUsuario.cfm" method="post" name="valida">
	 <input type="Hidden" name="CodPag" value="<cfoutput>#CodPag#</cfoutput>"> 
	<cfif find( "Mozilla/4.0" ,#cgi.http_user_agent#,1)> <!--- If p/verificar se é IE, o Netscape utiliza o Mozilla/4.7 --->	

		<!--- Parte referente ao layer que funciona no IE --->
		<cfif ((#radTipoUsu# eq "1") or (#radTipoUsu# eq ""))><!---  Mostra a div do titular e oculta a div do dependente --->
				<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
				<!--
					if (screen.width == "1152"){
							document.write("<div id=\"CaixaDep\" style=\"position:absolute; left:840px; top:258px; width:84px; height:125px; z-index:15; visibility: hidden\">");
					}
					else if (screen.width == "1024"){
							document.write("<div id=\"CaixaDep\" style=\"position:absolute; left:774px; top:258px; width:94px; height:117px; z-index:14;visibility: hidden\">");
					}
					else if (screen.width == "800"){
						document.write("<div id=\"CaixaDep\" style=\"position:absolute; left:663px; top:260px; width:94px; height:117px; z-index:14; visibility: hidden\">");
					}
				//-->
				</SCRIPT>		
				<!--- <div id="CaixaDep" style="position:absolute; left:668px; top:269px; width:94px; height:117px; z-index:14; visibility: hidden">   --->
				 <table width="94" border="0" cellspacing="0" cellpadding="0">
				    <tr valign="middle" align="left"> 
					<cfoutput>
				      <td><img src="#DirImg#bot_login.gif"><br>
					  <input type="text" name="lNumLog" size="8" maxlength="7" onchange="return vld_login(this)" onKeyPress="return Tecla(event);">
				        <br>
				        <img src="#DirImg#bot_coddep.gif"><br>
				        <input type="text" name="LNumDep" size="8" maxlength="2" width="50" onKeyPress="return Tecla(event);">
				        <br>
				        <img src="#DirImg#bot_senha.gif"><br>
				        <input type="password" name="lStrSenha" size="8" maxlength="18">
					  <br>
					  </cfoutput>
				     <cfif isdefined ('lStrMsgErro')>
						<font size="1" face="Verdana, Arial, Helvetica, sans-serif"><span class="branco"><b><cfoutput>#lStrMsgErro#</cfoutput></b></span></font>
				    </cfif>
				    </td>
    				    </tr>
						<tr> 
		                <td colspan="2"><a href="<cfoutput>#dirScript#</cfoutput>EltEsqueciSenha.cfm?CodPag=11"><img src="<cfoutput>#dirimg#</cfoutput>tab_baixo_login.gif" border="0"></a></td>
                	</tr>
				  </table>			
				 </div>
				<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
				<!--
					if (screen.width == "1152"){
						document.write("<div id=\"CaixaTit\" style=\"position:absolute; left:840px; top:258px; width:84px; height:125px; z-index:15; visibility: visible\">");
					}
					else if (screen.width == "1024"){
						document.write("<div id=\"CaixaTit\" style=\"position:absolute; left:774px; top:258px; width:84px; height:125px; z-index:15;visibility: visible\">");
					}
					else if (screen.width == "800"){
						document.write("<div id=\"CaixaTit\" style=\"position:absolute; left:663px; top:260px; width:84px; height:125px; z-index:15; visibility: visible\">");
					}
				//-->
				</SCRIPT>		 
				
				<!--- <div id="CaixaTit" style="position:absolute; left:774px; top:222px; width:84px; height:125px; z-index:15; visibility: visible">   --->
				  <table width="94" border="0" cellspacing="0" cellpadding="0">
				    <tr> 
				      <td> 
					<cfoutput>
				        <img src="#DirImg#bot_login.gif" vspace="3"><br>
				          <input type="text" name="lNumLog" size="8" maxlength="7" onchange="return vld_login(this)" onKeyPress="return Tecla(event);">
				           <br>
				        <img src="#DirImg#bot_senha.gif" vspace="3"><br>
				          <input type="password" name="lStrSenha" size="8" maxlength="18">
				      </cfoutput>
					    <cfif isdefined ('lStrMsgErro')><br><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><span class="branco"><b><cfoutput>#lStrMsgErro#</cfoutput></b></span></font></cfif>
					</td>
				    </tr>
					<tr> 
		                <td colspan="2"><a href="<cfoutput>#dirScript#</cfoutput>EltEsqueciSenha.cfm?CodPag=11"><img src="<cfoutput>#dirimg#</cfoutput>tab_baixo_login.gif" border="0"></a></td>
                	</tr>
				  </table>
				</div>
	
		<cfelse> <!--- Mostra a div do dependente e oculta a div do titular --->
	 		<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
				<!--
					if (screen.width == "1152"){
						document.write("<div id=\"CaixaDep\" style=\"position:absolute; left:840px; top:258px; width:84px; height:125px; z-index:15; visibility: visible\">");
					}
					else if (screen.width == "1024"){
							document.write("<div id=\"CaixaDep\" style=\"position:absolute; left:774px; top:258px; width:94px; height:117px; z-index:14;visibility: visible\">");
					}
					else if (screen.width == "800"){
						document.write("<div id=\"CaixaDep\" style=\"position:absolute; left:663px; top:260px; width:94px; height:117px; z-index:14; visibility: visible\">");
					}
				//-->
				</SCRIPT>		
				<!--- <div id="CaixaDep" style="position:absolute; left:668px; top:269px; width:94px; height:117px; z-index:14; visibility: hidden">   --->
				
				 <table width="94" border="0" cellspacing="0" cellpadding="0">
				    <tr valign="middle" align="left"> 
					<cfoutput>
				      <td><img src="#DirImg#bot_login.gif"><br>
					  <input type="text" name="lNumLog" size="8" maxlength="7" onchange="return vld_login(this)" onKeyPress="return Tecla(event);">
				        <br>
				        <img src="#DirImg#bot_coddep.gif"><br>
				        <input type="text" name="LNumDep" size="8" maxlength="2" width="50" onKeyPress="return Tecla(event);">
				        <br>
				        <img src="#DirImg#bot_senha.gif"><br>
				        <input type="password" name="lStrSenha" size="8" maxlength="18">
					</cfoutput>
					  <br>
				     <cfif isdefined ('lStrMsgErro')>
						<font size="1" face="Verdana, Arial, Helvetica, sans-serif"><span class="branco"><b><cfoutput>#lStrMsgErro#</cfoutput></b></span></font>
				    </cfif>
				    </td>
    				    </tr>
						<tr> 
		                <td colspan="2"><a href="<cfoutput>#dirScript#</cfoutput>EltEsqueciSenha.cfm?CodPag=11"><img src="<cfoutput>#dirimg#</cfoutput>tab_baixo_login.gif" border="0"></a></td>
                	</tr>
				  </table>			
				</div>
	
				<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
				<!--
					if (screen.width == "1152"){
						document.write("<div id=\"CaixaTit\" style=\"position:absolute; left:840px; top:258px; width:84px; height:125px; z-index:15; visibility: hidden\">");
					}
					else if (screen.width == "1024"){
						document.write("<div id=\"CaixaTit\" style=\"position:absolute; left:774px; top:258px; width:84px; height:125px; z-index:15;visibility: hidden\">");
					}
					else if (screen.width == "800"){
						document.write("<div id=\"CaixaTit\" style=\"position:absolute; left:663px; top:260px; width:84px; height:125px; z-index:15; visibility: hidden\">");
					}
				//-->
				</SCRIPT>		
				 <!--- <div id="CaixaTit" style="position:absolute; left:668px; top:269px; width:84px; height:125px; z-index:15; visibility: hidden">  --->
				  <table width="94" border="0" cellspacing="0" cellpadding="0">
				    <tr> 
				      <td> 
  				      <cfoutput>
				        <div align="left"><img src="#DirImg#bot_login.gif"><br>
					    <input type="text" name="lNumLog" size="8" maxlength="7" onchange="return vld_login(this)" onKeyPress="return Tecla(event);">
				           <br>
				        <img src="#DirImg#bot_senha.gif"><br>
				          <input type="password" name="lStrSenha" size="8" maxlength="18">
				      </cfoutput><br>
					    <cfif isdefined ('lStrMsgErro')><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><span class="branco"><b><cfoutput>#lStrMsgErro#</cfoutput></b></span></font></cfif>
					  </div>
				      </td>
				    </tr>
					<tr> 
		                <td colspan="2"><a href="<cfoutput>#dirScript#</cfoutput>EltEsqueciSenha.cfm?CodPag=11"><img src="<cfoutput>#dirimg#</cfoutput>tab_baixo_login.gif" border="0"></a></td>
                	</tr>
				  </table>
				</div> 
			</cfif>
			<!--- Fim do if que mostra os layers --->

                    <table width="105" border="0" cellspacing="0" cellpadding="0" background="<cfoutput>#DirImg#</cfoutput>nada.gif">
                      <tr> 
                        <td width="94" align="center" height="50" valign="top"> 
                          <table width="87%" border="0" cellspacing="0" cellpadding="0">
                            <tr align="left" valign="middle"> 
                              <td height="22"> 
                                <input type="radio" name="radTipoUsu" value="1" onClick="MM_showHideLayers('CaixaDep','','hide','CaixaTit','','show')" <cfif (#radTipoUsu# eq "1") or (#radTipoUsu# eq "")>checked</cfif>>
                              </td>
                              <td height="22" width="82%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b>Titular</b></font></td>
                            </tr>
                            <tr align="left" valign="middle"> 
                              <td height="22"> 
                                <input type="radio" name="radTipoUsu" value="2" onClick="MM_showHideLayers('CaixaDep','','show','CaixaTit','','hide')" <cfif #radTipoUsu# eq "2">checked</cfif>>
                              </td>
                              <td height="22" width="82%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b>Dependente</b></font></td>
                            </tr>
                          </table>
                        </td>
                        <td width="11">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td width="94" align="center" height="110"> <br>
                        </td>
                        <td width="11">&nbsp;</td>
                      </tr>
                    </table>
			</td>
		  </tr>
          <tr> 
              <td><img src="./img/tab_baixo_esqueci_layer2.gif" border="0"></td>
			  <td><input type="image" src="./img/tab_baixo_ok.gif" align="top" width="35" height="36" border="0"></td>
		  </tr>
		</form>
            </table>
	   <cfif isdefined('noticia')>
	   		
			<cfquery name="qsNoticias" datasource="#ODBC_DATA#">
				select top 5* from noticias
				where indativo = 1
				and codnoticia <> #codnoticia#
				order by codnoticia desc
			</cfquery>
	   
		   <table width="95%" border="0" cellspacing="0" cellpadding="3">
		   		<cfif qsNoticias.recordcount neq 0>
					<tr> 
			                <td width="15%" height="20">&nbsp;</td>
			                <td colspan="2" align="center" height="20" class="azul"><font size="1"><b><font color="283C88" face="Verdana, Arial, Helvetica, sans-serif">
							<span class="azul">
							<cfif qsNoticias.recordcount eq 1>
								Última Notícia
							<cfelse>
								Últimas <cfoutput>#qsNoticias.recordcount#</cfoutput> Notícias
							</cfif>
							</span></font></td>
			        </tr>
				</cfif>
				<cfoutput query="qsNoticias">
					  <tr> 
		                <td width="15%" height="20"><img src="./img/nada.gif" width="10" height="15"></td>
		                <td colspan="2" align="center" height="20"><font size="1" face="Arial, Helvetica, sans-serif" color="283C88">.............................</font></td>
		              </tr>
		              <tr> 
		                <td width="15%">&nbsp;</td>
		                <td width="9%" valign="top"><img src="#DirImg#seta3.gif" width="8" height="8"></td>
		                <td width="76%" class="azul"><font size="1"><b><font color="##003366" face="Verdana, Arial, Helvetica, sans-serif">
						<span class="azul">
						</span></a></font></b></font><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b></b></font></td>
		              </tr> 
					 </cfoutput>	
			        <br>
			      </td>
			    </tr>
		   </table>
		</cfif>

	<cfelse> <!--- Não é Internet Explore --->		

                    <table width="105" border="0" cellspacing="0" cellpadding="0" background="./img/nada.gif">
                      <tr> 
                        <td width="94" align="center" height="50" valign="top"> 
                          <table border="0" cellspacing="0" cellpadding="0" background="./img/nada.gif">
<tr align="left" valign="middle"> 
                              
          <td width="20" height="22"> 
<input type="radio" name="radTipoUsu" value="1"  onClick="ReloadTit()" <cfif (#radTipoUsu# eq "1") or (#radTipoUsu# eq "")>checked</cfif>>
                              </td>
                              
          <td height="22" width="76"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b>Titular</b></font></td>
                            </tr>
                            <tr align="left" valign="middle"> 
                              <td height="22"> 
                                <input type="radio" name="radTipoUsu" value="2" onClick="ReloadDep()" <cfif #radTipoUsu# eq "2">checked</cfif>>
                              </td>
                              
          <td height="22" width="76"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b>Dependente</b></font></td>
                            </tr>
				  <tr><td><img src="./img/nada.gif" height="4"></td>
				  </tr>  

				<cfif ((#radTipoUsu# eq "") or (#radTipoUsu# eq "1"))>
				   <tr> 
	                      
            <td align="center" colspan="2"> <img src="img/bot_login.gif" alt="" width="54" height="9" vspace="2" border="0" align="left"><br>
	                          <input type="text" name="lNumLog" size="8" maxlength="7" onchange="vld_login(lNumLog)">
			               <br>
	                          <img src="./img/bot_senha.gif" border="0" align="left" alt="" vspace="2"><br>
	                          <input type="password" name="lStrSenha" size="8" maxlength="18">
	                          <br>
					  <cfif isdefined ('lStrMsgErro')><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><span class="branco"><b><cfoutput>#lStrMsgErro#</cfoutput></b></span></font></cfif>
	                       </td>
				     
            <td width="10">&nbsp;</td>
				    </tr>
					<tr> 
		                
            <td colspan="2"><a href="www.eletros.com.br/script/EltEsqueciSenha.cfm?CodPag=11"><img src="./img/tab_baixo_login.gif" width="83" height="11" border="0"></a></td>
                	</tr>
				 <cfelseif #radTipoUsu# eq "2">
				   <tr> 
	                      
            <td align="center" colspan="2"> <img src="./img/bot_login.gif" vspace="1" border="0" alt="" align="left"><br>
	                          <input type="text" name="lNumLog" size="8" maxlength="7" onchange="vld_login(lNumLog)">
			               <br>
				        <img src="./img/bot_coddep.gif" vspace="1" border="0" alt="" align="left"><br>
				        <input type="text" name="LNumDep" size="8" maxlength="2" width="50">
					   <br>
	                          <img src="./img/bot_senha.gif" vspace="1" border="0" alt="" align="left"><br>
	                          <input type="password" name="lStrSenha" size="8" maxlength="18">
	                          <br>
					  <cfif isdefined ('lStrMsgErro')><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><span class="branco"><b><cfoutput>#lStrMsgErro#</cfoutput></b></span></font></cfif>
	                       </td>
				     
            <td width="10">&nbsp;</td>
				    </tr>
					<tr> 
		                <td colspan="2"><a href="www/eletros.com.br/script/EltEsqueciSenha.cfm?CodPag=11"><img src="./img/tab_baixo_login.gif" border="0"></a></td>
                	</tr>
				 </cfif>   
                     </table>
                    </td>
                    <td width="11">&nbsp;</td>
                  </tr>
                      <!--- <tr> 
                        <td width="94" align="center" height="20"> <br>
                        </td>
                        <td width="11">&nbsp;</td>
                      </tr> --->
                    </table>
			</td>
		  </tr>
              <tr> 
                
  <td> <img src="./img/tab_baixo_esqueci_layer2.gif" width="109" height="36" border="0"></td>
			<td><input type="image" src="./img/tab_baixo_ok.gif" align="top" width="35" height="36" border="0">
		    </td>
		   </tr>
		</form>
            </table>
		 <cfif isdefined('noticia')>
	   		
			<cfquery name="qsNoticias" datasource="#ODBC_DATA#">
				select top 5* from noticias
				where indativo = 1
				and codnoticia <> #codnoticia#
				order by codnoticia desc
			</cfquery>
	   
		   <table width="95%" border="0" cellspacing="0" cellpadding="3">
		   		<cfif qsNoticias.recordcount neq 0>
					<tr> 
			                <td width="15%" height="20">&nbsp;</td>
			                <td colspan="2" align="center" height="20" class="azul"><font size="1"><b><font color="283C88" face="Verdana, Arial, Helvetica, sans-serif">
							<span class="azul">
							<cfif qsNoticias.recordcount eq 1>
								Última Notícia
							<cfelse>
								Últimas <cfoutput>#qsNoticias.recordcount#</cfoutput> Notícias
							</cfif>
							</span></font></td>
			        </tr>
				</cfif>
		        <cfoutput query="qsNoticias">
					  <tr> 
		                <td width="15%" height="20"><img src="#DirImg#nada.gif" width="10" height="15"></td>
		                <td colspan="2" align="center" height="20"><font size="1" face="Arial, Helvetica, sans-serif" color="283C88">.............................</font></td>
		              </tr>
		              <tr> 
		                <td width="15%">&nbsp;</td>
		                <td width="9%" valign="top"><img src="#DirImg#seta3.gif" width="8" height="8"></td>
		                <td width="76%" class="azul"><font size="1"><b><font color="##003366" face="Verdana, Arial, Helvetica, sans-serif">
						<span class="azul">
						
							<cfif qsNoticias.recordcount neq 0>
								<cfif qsNoticias.link neq "">
									<a href="#link#?codnoticia=#codnoticia#&noticia=1<cfif isdefined('idusu')>&idusu=#idusu#</cfif>" class="noticias"><b>#titulo#</b></a>
								<cfelse>
									<a href="../../../Eletros/Internet/Include/EltExibeNoticia.cfm?codnoticia=#codnoticia#%ACicia=1<cfif isdefined('idusu')>&idusu=#idusu#</cfif>" class="noticias"><b>#titulo#</b></a>
								</cfif>
							</cfif>		
						</span></a></font></b></font><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b></b></font></td>
		              </tr> 
					 </cfoutput>	
			        <br>
			      </td>
			    </tr>
		   </table>
		</cfif>
	</cfif> <!--- Fim do if p/verificar qual o Navegador --->
</cfif> <!--- Fim do if de não logado --->	
	
	            </td>
	          </tr>
	          	<tr> 
	            <td valign="bottom"><br>
	            </td>
	           </tr>
	        </table>
	        <br>
	      </td>
	    </tr>
	  </table>

		<cfoutput>	  
	  <!--- Inicio Rodape --->
		<table width="736" border="0" cellspacing="0" cellpadding="0" align="center">
		  <tr> 
		    <td width="135" valign="bottom" background="#DirImg#fundo_esquerda.gif"> <img src="#DirImg#mulher_esquerda.jpg" width="135" height="76"></td>

		    <td width="464" valign="top"> 
		      <table width="464" border="0" cellspacing="0" cellpadding="0" background="#DirImg#nada.gif">
		        <tr> 
		          <td>&nbsp; 
		          </td>
		        </tr>
		      </table>
		    </td>

		    <td width="135" valign="top" background="#DirImg#fundo_direita.gif"> 
		      <table width="145" border="0" cellspacing="0" cellpadding="0" background="#DirImg#nada.gif">
		        <tr> 
		          <td colspan="2" height="15"><img src="#DirImg#nada.gif" width="135" height="1"></td>
		          <td width="1"></td>
		        </tr>
		        <tr> 
		          <td width="38"> 
		            <div align="center" class="Desenv"> 
		              <p><span class="Desenv"><img src="#DirImg#nada.gif" width="38" height="1"><br>
		                </span></p>
		            </div>
		          </td>
		          <td align="center" width="116"> 
		            <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="003366">Melhor 
		              <br>
		              Visualização <br>
		              em 800x600 </font>
		            <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="003366"><a href="http://www.marlin.com.br" target="_blank"><span class="noticias">Desenvolvimento<br>
		              Marlin</span></a></font>
		          </td>
		          <td width="1">&nbsp;</td>
		        </tr>
		      </table>
		    </td>
		  </tr>
		</table>	  </cfoutput>	 
 <!--- Fim Rodape --->
	  
 </td>

  
