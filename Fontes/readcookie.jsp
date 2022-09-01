<%
String l1 = "9999";
String cookieName = l1;

Cookie listaPossiveisCookies[] = request.getCookies();
Cookie cookieJSP = null;

if (listaPossiveisCookies != null) {
//quando não existe cookies associados o método getCookies() retorna um valor null
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

<h1>Lê Cookie</h1>
<% if (cookieJSP != null) { %>
A pagina "addcookie" gravou o seguinte email:  %>
<% }
else { %>
O cookie não gravou ou o prazo do cookie expirou.

<% } %>

</body>
</html>

