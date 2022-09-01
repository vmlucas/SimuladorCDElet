
<!--- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Arquivo: EltExibeHelpSimu.jsp
Objetivo: 
Data: 25/02/2003
Cliente: Eletros
Autor: Rejane Ribeiro
Email:rejane@eletros.com.br
Par�metros de entrada:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> --->

<%

 String pergunta = request.getParameter("Pergunta");
 

%>
<html>

<head>
<title>Eletros</title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#FFFFFF" onload="window.focus();" topmargin="5" rightmargin="2">
<table width="95%" border="0" cellspacing="0" cellpadding="0">
  <tr valign="top">
    <td background="img/canto_sup_azl_fundo.gif"><img src="img/canto_sup_azl_esq.gif" width="8" height="9"></td>
    <td background="img/canto_sup_azl_fundo.gif"><img src="img/canto_sup_azl_fundo.gif" width="8" height="9"></td>
    <td background="img/canto_sup_azl_fundo.gif" align="right"><img src="img/canto_sup_azl_dir.gif" width="11" height="9"></td>
  </tr>
  <tr align="center" valign="top">
   
    <td colspan="3" background="img/canto_sup_azl_fundo.gif" valign="top">
	<% if (pergunta.equals("pergunta2")==true){%>
	<table width="95%" border="0" height="100%" align="center">
        <tr valign="top">
          <td align="center">
		  <br>
		     <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              <!--- 		  Exibe descri��o do Servi�o --->
            </font><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              <font size="1">&Eacute; o valor da remunera&ccedil;&atilde;o em 
              esp&eacute;cie efetivamente recebida pelo empregado-participante 
              da ELETROS. Parcelas como indeniza&ccedil;&otilde;es, di&aacute;rias 
              de viagem, abonos de f&eacute;rias entre outros n&atilde;o integram 
              o Sal&aacute;rio de Contribui&ccedil;&atilde;o para o plano.<br>
              (Consulte Regulamento do plano)</font> </font>

	     </td>
        </tr>
      </table>
      <%}%>
             
	<% if (pergunta.equals("pergunta3")==true){%>
	<table width="95%" border="0" height="100%" align="center">
        <tr valign="top">
          <td align="center">
		  <br>
		  <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
<!--- 		  Exibe descri��o do Servi�o --->
			<font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                        Este valor corresponde ao saldo atual acumulado no plano CD Eletrobrás.

			</font>
		  	</font>

	     </td>
        </tr>
      </table>
      <%}%>
	   <% if (pergunta.equals("pergunta4")==true){%>
	  <table width="95%" border="0" height="100%" align="center">
        <tr valign="top">
          <td align="center">
		  <br>
            <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
            <!--- 		  Exibe descri��o do Servi�o --->
            </font><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Trata-se de um valor  que pode ser aportado no momento em que o participante faz esta simula&ccedil;&atilde;o. (Serve para avaliar o impacto de uma contribui&ccedil;&atilde;o adicional no benef&iacute;cio futuro) </font></td>
        </tr>
      </table>
      <%}%>
	   <% if (pergunta.equals("pergunta5")==true){%>
	  <table width="95%" border="0" height="100%" align="center">
        <tr valign="top">
          <td align="center">
		  <br>
            <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
            <!--- 		  Exibe descri��o do Servi�o --->
            <font size="1">Trata-se da proje&ccedil;&atilde;o real anual de crescimento 
            do seu sal&aacute;rio (% acima da infla&ccedil;&atilde;o). </font></font></td>
        </tr>
      </table>
      <%}%>
	   <% if (pergunta.equals("pergunta6")==true){%>
	  <table width="95%" border="0" height="100%" align="center">
        <tr valign="top">
          <td align="center">
		  <br>
            <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
            <!--- 		  Exibe descri��o do Servi�o --->
            <font size="1">&Eacute; o valor da remunera&ccedil;&atilde;o em esp&eacute;cie efetivamente recebida pelo empregado-participante da ELETROS. Parcelas como indeniza&ccedil;&otilde;es, d&iacute;arias de viagem, abonos de f&eacute;rias entre outros n&atilde;o integram o Sal&aacute;rio de Contribui&ccedil;&atilde;o para o plano.<br>
            (Consulte Regulamento do plano)</font><br>
            </font></td>
        </tr>
      </table>
      <%}%>
	 <% if (pergunta.equals("pergunta7a")==true){%>
	  <table width="95%" border="0" height="100%" align="center">
        <tr valign="top">
          <td align="center">
		  <br>
		  <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
<!--- 		  Exibe descri��o do Servi�o --->
			<font size="1" face="Verdana, Arial, Helvetica, sans-serif">Neste
			campo, voc� ir� informar o tempo que pretende contribuir para a
			ELETROS  antes de solicitar o benef�cio
			</font>

		  </font>

		  </td>
        </tr>
      </table>
      <%}%>
	 <% if (pergunta.equals("pergunta7b")==true){%>
	  <table width="95%" border="0" height="100%" align="center">
        <tr valign="top">
          <td align="center">
		  <br>
		  <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
<!--- 		  Exibe descri��o do Servi�o --->
			<font size="1" face="Verdana, Arial, Helvetica, sans-serif">
			Informe com qual idade pretende solicitar o benef�cio da ELETROS.</font>

		  </font>

		  </td>
        </tr>
      </table>
      <%}%>
	 <% if (pergunta.equals("pergunta7c")==true){%>
	  <table width="95%" border="0" height="100%" align="center">
        <tr valign="top">
          <td align="center">
		  <br>
		  <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<p><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
			Neste campo, voc� ir� informar a data que pretende solicitar o benef�cio da ELETROS
		  </font>
		  </td>
        </tr>
      </table>
      <%}%>
      <% if (pergunta.equals("pergunta8")==true){%>
      <table width="95%" border="0" height="100%" align="center">
        <tr valign="top">
          <td align="center"> 
<p><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> &Eacute; a partir 
              deste par&acirc;metro que ser&aacute; calculada a evolu&ccedil;&atilde;o 
              do seu saldo acumulado individual. Aqui voc&ecirc; tem a op&ccedil;&atilde;o 
              de simular uma taxa diferenciada no per&iacute;odo dos pr&oacute;ximos 
              5 anos. Este valor &eacute; superior &agrave; infla&ccedil;&atilde;o. 
              Vale lembrar que a meta atuarial &eacute; 6% a.a. superior &agrave; 
              infla&ccedil;&atilde;o.</font> </td>
        </tr>
      </table>
      <%}%>
	  
  	 <% if (pergunta.equals("pergunta15")==true){%>
      <!-- 
      <table width="100%" border="0" cellspacing="4" cellpadding="0" align="center">
        <tr valign="top"> 
          <td height="15"> <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">&Eacute; uma renda que ser&aacute; paga a voc&ecirc; por um per&iacute;odo fixo, definido por voc&ecirc; nessa simula&ccedil;&atilde;o. </font> </div></td>
        </tr>
      </table>
	  -->
	  
	  <table width="95%" border="0" cellspacing="4" cellpadding="0" align="center">
        <tr valign="top"> 
          <td height="15"> <div align="center"><FONT face=Arial size=1><font face="Verdana, Arial, Helvetica, sans-serif">Este valor de benef&iacute;cio ser&aacute; devido a partir da sua solicita&ccedil;&atilde;o, por um per&iacute;odo fixo definido nesta simula&ccedil;&atilde;o. Terminado o prazo, n&atilde;o haver&aacute; mais benef&iacute;cio a ser pago ao participante. N&atilde;o ser&aacute; convertido em renda vital&iacute;cia.A cada ano, haver&aacute; rec&aacute;lculo deste valor em fun&ccedil;&atilde;o da rentabilidade</font></FONT><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> . </font></div></td>
        </tr>
      </table>
	  
	  
      <%}%>

	 <% if (pergunta.equals("pergunta9")==true){%>
	  
	  <table width="95%" border="0" height="100%" align="center">
        <tr valign="top">
          <td align="center"><p align="left"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">As 
              faixas de contribui&ccedil;&atilde;o s&atilde;o incidentes sobre 
              o sal&aacute;rio. Quanto maiores forem os percentuais selecionados, 
              maiores ser&atilde;o os valores da contribui&ccedil;&atilde;o previdenci&aacute;ria. 
              <br>
              A contribui&ccedil;&atilde;o para o plano CD &eacute; em escalas, 
              ou seja, a primeira parcela &eacute; aplicada at&eacute; o limite 
              de R$ 2.625,50. A partir deste valor, &eacute; aplicada a segunda 
              parcela. A Patrocinadora contribui 
              com o mesmo valor, mensal, na conta individual do participante<br>
              Para ver os valores da sua contribui&ccedil;&atilde;o em cada faixa, 
              clique em calcular.
              </font> 
          </td>
        </tr>
      </table>
      <%}%>
      	 <% if (pergunta.equals("pergunta13")==true){%>
	  	  
	<!--  <table width="95%" border="0" height="100%" align="center">
        <tr valign="top">
          <td align="center">
		  <br>
            <font face="Verdana, Arial, Helvetica, sans-serif" size="1"> &Eacute; 
            o benef&iacute;cio de aposentadoria que ser&aacute; pago ao participante, 
            a partir da data de sua solicita&ccedil;&atilde;o, de forma vital&iacute;cia, 
            com a garantia de recebimento deste valor at&eacute; a data que o 
            participante escolheu nesta simula&ccedil;&atilde;o para recebimento por prazo definido. Anualmente, o benef&iacute;cio 
            ser&aacute; recalculado, considerando o desempenho dos investimentos 
            da Eletros.</font> </td>
        </tr>
      </table>-->
	  <table width="95%" border="0" height="100%" align="center">
        <tr valign="top">
          <td align="center">
		    <font size="1" face="Verdana, Arial, Helvetica, sans-serif"><br>
           Este valor de benef&iacute;cio ser&aacute; devido a partir da sua solicita&ccedil;&atilde;o, sendo pago primeiramente pelo prazo definido pelo participante, e, ap&oacute;s este prazo decorrido, o mesmo valor ser&aacute; pago de forma vital&iacute;cia&rdquo;. A cada ano, haver&aacute; rec&aacute;lculo deste valor em fun&ccedil;&atilde;o da rentabilidade.</font></td>
        </tr>
      </table>
      <%}%>
      <% if (pergunta.equals("pergunta14")==true){%>
      <table width="95%" border="0" height="100%" align="center">
        <tr valign="top"> 
          <td align="center"> <br>
            <font size="1" face="Verdana, Arial, Helvetica, sans-serif">Para ter direito ao benef&iacute;cio de renda vital&iacute;cia, 
            &eacute; separado do valor total do saldo acumulado do participante 
            um percentual que ser&aacute; provisionado para permitir a continuidade 
            do pagamento do benef&iacute;cio.</font></td>
        </tr>
      </table>
      <%}%>
	
      <% if (pergunta.equals("pergunta10")==true){%>
      <table width="95%" border="0" height="100%" align="center">
        <tr valign="top"> 
          <td align="center"> <br>
            <font size="1" face="Verdana, Arial, Helvetica, sans-serif">&Eacute; o valor do benef&iacute;cio que o participante tem direito de transferir para o plano CD em lugar de transferir a Reserva Matem&aacute;tica para o Saldo de Conta Individual. Tamb&eacute;m ser&aacute; poss&iacute;vel transferir 50% em forma de benef&iacute;cio (50% do BPDS) e o restante (50% da reserva matem&aacute;tica) para o saldo de conta individual. </font></td>
        </tr>
      </table> 
      <%}%>
	  
	  <% if (pergunta.equals("pergunta16")==true){%>
      <table width="95%" border="0" height="100%" align="center">
        <tr valign="top"> 
          <td align="center"> <br>
            <font size="1" face="Verdana, Arial, Helvetica, sans-serif">Corresponde a uma 
            contribui&ccedil;&atilde;o opcional que serve para incrementar seu 
            benef&iacute;cio. </font></td>
        </tr>
      </table> 
      <%}%>
    </td>
  </tr>
  <tr>
    <td background="img/canto_sup_azl_fundo.gif"><img src="img/canto_inf_azl_esq.gif" width="10" height="11"></td>
    <td background="img/canto_sup_azl_fundo.gif"><img src="img/canto_sup_azl_fundo.gif" width="8" height="9"></td>
    <td background="img/canto_sup_azl_fundo.gif" align="right"><img src="img/canto_inf_azl_dir.gif" width="11" height="11"></td>
  </tr>
</table>
</body>
</html>