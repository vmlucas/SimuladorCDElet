package simuladorServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import simuladorElet.Modelo;

public class BuscaRelatoriosAction extends MyActionServlet {
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
        if(!super.verificarSessao(request, response))
        {
          return mapping.findForward("erro");
        }
        
        String previous        = request.getParameter("previous");
        int cont = Integer.parseInt(request.getParameter("cont"));
           
        Modelo modelo = (Modelo)session.getAttribute("modelo");
        if(!modelo.getParticipante().getNumEletros().equals("000"))
        {
            try 
            {
                session.setAttribute("resultados", modelo.buscarSimulacoes());
                request.setAttribute("previous",previous);
                request.setAttribute("cont",new Integer(cont));
                
                return mapping.findForward( "success");  
            }
            catch(Exception e) 
            {
               e.printStackTrace();
               request.setAttribute("ErroMsg",e.getMessage());
               return mapping.findForward( "erro");
            }            
        }
        else 
        {
            request.setAttribute("ErroMsg","Usuario sem permissao para buscar relatorio");
            return mapping.findForward( "erro");
        }
    
    }
}
