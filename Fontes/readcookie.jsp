<%
String l1 = "9999";
String cookieName = l1;

Cookie listaPossiveisCookies[] = request.getCookies();
Cookie cookieJSP = null;

if (listaPossiveisCookies != null) {
//quando n�o existe cookies associados o m�todo getCookies() retorna um valor null
  int numCookies = listaPossiveisCookies.length;

  for (int i = 0 ; i < numCookies ; ++i) {
    if (listaPossiveisCookies[i].getName().equals(cookieName)) { //procura pelo cookie
      cookieJSP = listaPossiveisCookies[i];
      break;
    }
  }
}

%>


<html>
<body>

<h1>L� Cookie</h1>
<% if (cookieJSP != null) { %>
A pagina "addcookie" gravou o seguinte email:  %>
<% }
else { %>
O cookie n�o gravou ou o prazo do cookie expirou.

<% } %>

</body>
</html>

