package simuladorServlet;

import java.io.IOException;

import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import simuladorElet.*;

public class DestacaRelatorioAction extends MyActionServlet {
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
        
        String data = request.getParameter("codigo");
        
        Relatorio relatorio = null;
        Collection col = (Collection)session.getAttribute("resultados");
        Iterator it = col.iterator();
        while( it.hasNext() ) {
            Relatorio rel = (Relatorio)it.next();
            if( data.equals( rel.getSimulacao().getDataSimulacao().toString()))
            {
               relatorio = rel;
               break;
            }   
               
        }
        
        session.setAttribute("relatorio", relatorio);
        return mapping.findForward( "success");
    }
}
