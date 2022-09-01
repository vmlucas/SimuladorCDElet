package simuladorServlet;

import java.io.IOException;
import javax.naming.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import com.eletros.*;
import simuladorElet.*;


public class LoginIntranetAction extends Action {
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
        HttpSession session = request.getSession();
        
        String loginUsu = request.getParameter("login");
        String sessionId = request.getParameter("sessionId");
        session.setAttribute("login", loginUsu);
        session.setAttribute("sessionId",sessionId);
        
        String jndi = "java:/jdbc/OracleSimuladorElet";
           
        try
        {
            //recuperando o o eto registrado
            Context ctx = new InitialContext();
            Usuario usuario = (Usuario)ctx.lookup(loginUsu);
            
            AjusteModelo ajuste = new AjusteModelo(usuario,jndi);
            ajuste.verificaInstanciaModelo();
            
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
