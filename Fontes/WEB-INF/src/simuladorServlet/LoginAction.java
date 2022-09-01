package simuladorServlet;

import com.eletros.Usuario;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.InitialContext;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import simuladorElet.*;

public class LoginAction extends Action {
    /**This is the main action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form, 
                                 HttpServletRequest request, 
                                 HttpServletResponse response) throws IOException, 
                                                                      ServletException 
    {
        //numero eletros do participante        
        String login = request.getParameter("NumLog");
        //login do usuario logado pela intranet da Eletros
        String loginUsu = request.getParameter("loginUsu");
        
        HttpSession session = request.getSession();
        
          try
          {
              Modelo modelo = null; 
              /**instancia a classe modelo de acordo com o tipo de usuário*/
              //usuario logado pela intranet, que pode acessar qualquer participante
              if( (loginUsu !=null)&&( login != null ) )
              {
                  Context ctx = new InitialContext();
                  Usuario usuario = (Usuario)ctx.lookup(loginUsu);
                  modelo = new Modelo(login);  
              }//participante vindo do site da Eletros
              else if( (login !=null)&&(!login.equals("") ) )
              {
                  modelo = new Modelo(login);
              }//qualquer pessoa
              else 
              {
                  modelo = new Modelo();    
              }
              
              session.setAttribute("modelo", modelo);   
              return mapping.findForward( "success");
           }
           catch(Exception e)
           { 
              e.printStackTrace();
              
              request.setAttribute("ErroMsg",e.getMessage());
              return mapping.findForward( "erro" );
           }
        
        
    }
}
