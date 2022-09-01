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

import simuladorElet.*;

public class RedirectAction extends MyActionServlet {
    /**This is the main action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form, 
                                 HttpServletRequest request, 
                                 HttpServletResponse response) throws IOException, 
                                                                      ServletException {
        if(!super.verificarSessao(request, response))
        {
          return mapping.findForward("erro");
        }
        
        String page = request.getParameter("page");
        
        if(page.equals("inicio")){
            HttpSession session = request.getSession();
            Simulacao simu = (Simulacao)session.getAttribute("simulacao");
            
            simu.setAnoRest1(0);
            simu.setAnoRest2(0);
            simu.setAporte1(0);
            simu.setAporte2(0);
            simu.setAporte3(0);
            simu.setAporteEnt(0);
            simu.setAporteInicial(0);
            simu.setCrescimentoSalarial(0);
            simu.setOptAporteContribuicao(null);
            simu.setSNumAporte(null);
            
            session.setAttribute("simulacao",simu);
        }
        
        return mapping.findForward(page);
    }
}
