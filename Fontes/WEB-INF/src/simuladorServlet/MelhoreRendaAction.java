package simuladorServlet;

import com.util.Format;

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

public class MelhoreRendaAction extends MyActionServlet {
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
           
           String rendaDesejada = request.getParameter("INumRendaDesejada");
           double renda = 0.0;
           Modelo modelo = (Modelo)session.getAttribute("modelo");
           Simulacao simu = (Simulacao)session.getAttribute("simulacao");
           
           String l1 = request.getParameter("l1");
           String F = "F";
           
           try
           {
              if(( rendaDesejada != null)&&(!rendaDesejada.equals(""))) {
                  renda = Format.verificarNumero(rendaDesejada);
              }
              Relatorio relatorio = modelo.calculoNovaRenda(simu, renda );
              
              session.setAttribute("relatorio", relatorio);
              session.setAttribute("listProjecao",modelo.calculoProjecao(simu,0.0, relatorio.getTempoCont()));
              
              int aux1 = simu.getRentAnual1();
              int aux2 = simu.getRentAnual2();
              
              if ((aux1 == aux2))
                  return mapping.findForward( "successOpcoes");
              else
                  return mapping.findForward( "successOpcao");
           }
           catch(Exception e) {
               e.printStackTrace();
               request.setAttribute("ErroMsg",e.getMessage());
               return mapping.findForward( "erro");
           }
    }
}
