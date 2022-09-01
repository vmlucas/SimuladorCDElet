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

public class ExcluiRelatorioAction extends MyActionServlet {
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
        
          Modelo modelo = (Modelo)session.getAttribute("modelo");
        
          String contAux = request.getParameter("cont");
          int    cont    = Integer.parseInt(contAux);
          
          String aux   = null;
          String valor = null;
          int select = 0 ; 
          
          try
          {
             for (int i=0; i<cont;i++)
             {
                 aux   = String.valueOf(i);
                 valor = request.getParameter(aux);
                 if (valor != null)
                 {
                     modelo.deleteSimulacao(valor);
                     select = 1; 
                 }
              }
              if (select != 1)
                 return mapping.findForward( "success");
              else
                 return mapping.findForward( "successOk");
          }
          catch(Exception e) 
          {
              e.printStackTrace();
              request.setAttribute("ErroMsg","Opera&ccedil;&atilde;o N&atilde;o Efetuada !");
              return mapping.findForward( "erro");
          }
         
    }
}
