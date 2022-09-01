<%
   String login = null;
   String sessionId = null;
   sessionId = request.getParameter("sessionId");
   login = request.getParameter("login");
   if( login == null )
   {
       login = (String)session.getAttribute("login");
   }
   if( sessionId == null)
   {
     sessionId = (String)session.getAttribute("sessionId");
   }
%>
<script language="JavaScript">
<!--
function mmLoadMenus() {
  if (window.mm_menu_1118144313_0) return;
  window.mm_menu_1118144313_0 = new Menu("root",177,17,"Verdana, Arial, Helvetica, sans-serif",11,"#000000","#ffffff","#66cc99","#66cc99","center","middle",3,0,1000,-5,7,true,false,true,0,false,false);
  mm_menu_1118144313_0.addMenuItem("Indices&nbsp;Institucionais","location='/indices/loginIndice?login=<%=login %>&sessionId=<%=sessionId %>'");
  mm_menu_1118144313_0.addMenuItem("Solicitações Gerais","location='/Solicitacao/login?login=<%=login %>&sessionId=<%=sessionId %>'");
  mm_menu_1118144313_0.addMenuItem("Cronol&oacute;gico&nbsp;de&nbsp;Documentos","location='/Documentacao/login.do?login=<%=login %>&sessionId=<%=sessionId %>'");
  mm_menu_1118144313_0.addMenuItem("Solicitação de Férias","location='/Ferias/login.do?login=<%=login %>&sessionId=<%=sessionId %>'");
  mm_menu_1118144313_0.addMenuItem("Solicitação de Treinamento","location='/Treinamento/LoginTrein.do?login=<%=login %>&sessionId=<%=sessionId %>'");
  mm_menu_1118144313_0.addMenuItem("Fornecedores","location='/Fornecedores/index.jsp?login=<%=login %>&sessionId=<%=sessionId %>'");
   mm_menu_1118144313_0.bgImageUp="./images/mmmenu1_177x17_up.gif";
   mm_menu_1118144313_0.bgImageOver="./images/mmmenu1_177x17_over.gif";
   mm_menu_1118144313_0.hideOnMouseOut=true;
   mm_menu_1118144313_0.bgColor='#cccccc';

  mm_menu_1118144313_0.writeMenus();
} // mmLoadMenus()
//-->
</script>
<script language="JavaScript1.2" src="mm_menu.js"></script>
</head>

<body leftmargin="0" topmargin="0">
<table width="780" border="1" bordercolor="#FFFFFF">
  <tr>
    <td width="780" height="91"><img src="./images/barra.gif" width="750" height="83"></td>
  </tr>
</table>
<table width="753" border="1" bordercolor="#FFFFFF">
  <tr bordercolor="#FFFFFF">
    <td width="207" height="27">
      <script language="JavaScript1.2">mmLoadMenus();</script>
      <table border="0" cellpadding="0" cellspacing="0" width="197">
        <!-- fwtable fwsrc="menu2.png" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "1158737034" fwnested="0" -->
        <tr>
          <td><img src="./images/spacer.gif" alt="" name="undefined_2" width="70" height="1" border="0"></td>
          <td><img src="./images/spacer.gif" alt="" name="undefined_2" width="1" height="1" border="0"></td>
          <td><img src="./images/spacer.gif" alt="" name="undefined_2" width="55" height="1" border="0"></td>
          <td><img src="./images/spacer.gif" alt="" name="undefined_2" width="1" height="1" border="0"></td>
          <td><img src="./images/spacer.gif" alt="" name="undefined_2" width="70" height="1" border="0"></td>
          <td><img src="./images/spacer.gif" alt="" name="undefined_2" width="1" height="1" border="0"></td>
        </tr>
        <tr>
          <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_1118144313_0,0,20,null,'menu_r1_c1');"><img name="menu_r1_c1" src="./images/menu_r1_c1.gif" width="70" height="20" border="0" alt=""></a></td>
          <td><img name="menu_r1_c2" src="./images/menu_r1_c2.gif" width="1" height="20" border="0" alt=""></td>
          <td><a href="/login/home?login=<%=login %>&sessionId=<%=sessionId %>"><img name="menu_r1_c3" src="./images/menu_r1_c3.gif" width="55" height="20" border="0" alt=""></a></td>
          <td><img name="menu_r1_c4" src="./images/menu_r1_c4.gif" width="1" height="20" border="0" alt=""></td>
          <td><a href="/login/LogOut?login=<%=login %>"><img name="menu_r1_c5" src="./images/menu_r1_c5.gif" width="70" height="20" border="0" alt=""></a></td>
          <td><img src="./images/spacer.gif" alt="" name="undefined_2" width="1" height="20" border="0"></td>
        </tr>
      </table></td>
    <td width="586"><img src="./images/barra2.gif" width="544" height="21"><img src="images/spacer.gif" width="1" height="1"></td>
  </tr>
</table>
