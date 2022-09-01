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

public class OpcaoRentabilidadeAction extends MyActionServlet {
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
        if(!super.verificarSessao(request, response))
        {
          return mapping.findForward("erro");
        }
        
        String rent_anual    = request.getParameter("INumRentAnual1");
        String rent_anual2   = request.getParameter("INumRentAnual2");
        String opcao_cont1   = request.getParameter("IStrContribuicao1");
        
        HttpSession session = request.getSession();
        Simulacao simu = (Simulacao)session.getAttribute("simulacao");
        
        if ((rent_anual2 != null))
        {
           simu.setRentAnual1(Integer.parseInt(rent_anual));
           simu.setRentAnual2(Integer.parseInt(rent_anual2));
        }
        else 
        {
           simu.setRentAnual1(Integer.parseInt(rent_anual));
           simu.setRentAnual2(Integer.parseInt(rent_anual));
        }
        
        simu.setOpcaoContrib( opcao_cont1);
        session.setAttribute("simulacao", simu);
        
        return mapping.findForward( "success");
    }
}
