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


public class InsereRelatorioAction extends MyActionServlet {
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
        Relatorio relatorio = (Relatorio)session.getAttribute("relatorio");
        
        /*simuladorBean simulador = (simuladorBean)session.getAttribute("simulador");
                  
              String login = request.getParameter("l1");
                  String reservaMigracao  = request.getParameter("reservaMigracao");
                  String creditoAdicional = request.getParameter("creditoAdicional");
                  String salarioAtual     = request.getParameter("salarioAtual");
                  String crescSalarial    = request.getParameter("crescSalarial");
                  String anoRest1         = request.getParameter("anoRest1");
                  String anoRest2         = request.getParameter("anoRest2");
                  String diaRest          = request.getParameter("diaRest");
                  String mesRest          = request.getParameter("mesRest");
                  String anoRest          = request.getParameter("anoRest");
                  String rentAnual        = request.getParameter("rentAnual");
                  String rentAnual2       = request.getParameter("rentAnual2");
                  String numAporte        = request.getParameter("numAporte");
                  String numEntAporte     = request.getParameter("numEntAporte");
                  String contribuicao     = request.getParameter("contribuicao");
                  String bpds             = request.getParameter("bpds");
                  
                  String saldoS           = request.getParameter("saldo");
                  double saldo            = Double.parseDouble(saldoS);
                  String rendaVitalS      = request.getParameter("rendaCertaVitalicia");
                  double rendaCertaVitalicia =  Double.parseDouble(rendaVitalS);
                  String rendaCertaS      = request.getParameter("rendaCerta");
                  double rendaCerta       = Double.parseDouble(rendaCertaS);
                  String aporteEspData1 = String.valueOf(simulador.getAporteExtMes1())+"/"+String.valueOf(simulador.getAporteExtAno1());
                  String aporteEspData2 = String.valueOf(simulador.getAporteExtMes2())+"/"+ String.valueOf(simulador.getAporteExtAno2());
                  String aporteEspData3 = String.valueOf(simulador.getAporteExtMes3())+"/"+ String.valueOf(simulador.getAporteExtAno3());

              double qtd1 = simulador.getQtd1();
              double qtd2 = simulador.getQtd2();
                  
              double qtd3 = simulador.getQtd3();
              relatorioSimuElet relat = new relatorioSimuElet(login,reservaMigracao,creditoAdicional,salarioAtual,crescSalarial,
                                                                anoRest1,anoRest2,diaRest,mesRest,anoRest,rentAnual,rentAnual2,
                                                                                                                contribuicao,numAporte,numEntAporte,saldo,rendaCertaVitalicia,rendaCerta,bpds,aporteEspData1,aporteEspData2,aporteEspData3,qtd1,qtd2,qtd3,jndi);                                                                                                
              */
         try 
         {
            modelo.insereSimulacao( relatorio );    
            return mapping.findForward( "success");
         }
         catch(Exception e) 
         {
             e.printStackTrace();
             request.setAttribute("ErroMsg","Opera&ccedil;&atilde;o N&atilde;o Efetuada !");
             return mapping.findForward( "erro");
         }
        
    }
}
