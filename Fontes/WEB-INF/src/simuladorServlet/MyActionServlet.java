package simuladorServlet;

import org.apache.struts.action.*;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.ServletException;
import java.util.regex.*;
import Log.*;
import javax.rmi.*;
import java.rmi.*;
import javax.naming.*;

public class MyActionServlet extends Action
{
   /** Verifica se a sessão ainda está ativa
     * @param request servlet request
     * @param response servlet response
     */
    public boolean verificarSessao(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, java.io.IOException
    {
        HttpSession session = request.getSession();

        Object obj = session.getAttribute("modelo");
        if( obj == null )
        {
           request.setAttribute("error", new Exception("sessão expirada, faça o login novamente"));
           request.setAttribute("pagina","/login/");
           return false;
        }
        else
        {
          return true;
        }

    }

    public boolean verificarCookie(HttpServletRequest request, HttpServletResponse response,String login,String sessionId)
      throws ServletException, java.io.IOException
    {
        boolean retorno = false;

        if( request.getCookies() == null )
        {
            request.setAttribute("error", new Exception("sessão expirada, faça o login novamente"));
            request.setAttribute("pagina","/login/");
            return false;
        }

        Cookie[] cookies = request.getCookies();
        for(int i=0; i < cookies.length; i++)
        {
           Cookie c = cookies[i];
           if((c.getName().equals(login))&&(c.getValue().equals(sessionId)))
           {
             retorno = true;
           }
        }
        if( retorno )
        {
           return true;
        }
        else
        {
           request.setAttribute("error", new Exception("sessão expirada, faça o login novamente"));
           request.setAttribute("pagina","/login/");
           return false;
        }
    }

  /**
   * Gera registro de log no BD.
   *
   * @param msg
   * @param tipo
   * @param sistema
   * @param login
   */
    public void log(String login, String sistema, String tipo,String msg )
    {
       try
       {
         //busca EJB para geração de logs
         Context ctx = new InitialContext();
         Object ref = ctx.lookup("EJBLog");
         EJBLogHome logHome = (EJBLogHome)
                     PortableRemoteObject.narrow(ref,EJBLogHome.class);
         EJBLog EJBLog = logHome.create();
         EJBLog.log(login,sistema,tipo,msg);
       }
       catch(Exception e)
       {
         e.printStackTrace();
       }
    }

    /**
     * verifica se o número recebido como parâmetro tem
     * algum ponto, se tiver gera uma <tt>Exception</tt>
     * @param numero
     * @throws Exception
     */
    public void verificarNumero(String numero)
      throws Exception
    {
        Pattern p = Pattern.compile("[[0-9]*.[0-9]*]*");
        Matcher m = p.matcher(numero);

        if(m.matches())
        {
           throw new Exception("Formato numérico inválido");
        }
    }
}