package simuladorServlet;

import com.util.DataEletros;
import com.util.Format;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import simuladorElet.*;

public class SimularAction extends MyActionServlet {
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
        
        String num_aporte    = request.getParameter("lNumAporteOpAporte");
        String num_ent_Aporte= request.getParameter("INumEntAporte");
        String aporteInicial = request.getParameter("INumAporteInicial");
        
        String F = "F";        
        String bpds = request.getParameter("bpds");
        String flagAporteExt = "S";
        
        String aporte1Aux   = request.getParameter("aporte1");
        String aporte2Aux   = request.getParameter("aporte2");
        String aporte3Aux   = request.getParameter("aporte3");

        
        HttpSession session = request.getSession();
        Modelo modelo = (Modelo)session.getAttribute("modelo");
        Simulacao simu = (Simulacao)session.getAttribute("simulacao");
        
        try
        {
            //verifica aporte inical
            if(( aporteInicial != null)&&(!aporteInicial.equals(""))) {
              simu.setAporteInicial(
                 Format.verificarNumero(aporteInicial));     
            }
            
            //verifica se haverá aportes pre-definidos 
            if(( num_aporte == null)||(num_aporte.equals("")))
            {
               num_aporte = "nada";
               flagAporteExt = "N";
            }  
            simu.setOptAporteContribuicao( num_aporte);
            simu.setSNumAporte(flagAporteExt);
            
            if((num_ent_Aporte != null)&&(!num_ent_Aporte.equals("")))
               simu.setAporteEnt(Format.verificarNumero(num_ent_Aporte));
            else
               simu.setAporteEnt(0.0);
                   
            //Verifica os aportes esporádicos
            if((aporte1Aux != null)&&(!aporte1Aux.equals(""))) 
            {
                int mesAporte1 = Integer.parseInt(request.getParameter("mesAporte1"));   
                int anoAporte1 = Integer.parseInt(request.getParameter("anoAporte1"));
                double aporte1 = Format.verificarNumero(aporte1Aux);
                simu.setDataAporte1(new DataEletros("01/"+mesAporte1+"/"+anoAporte1));
                simu.setAporte1(aporte1);
            }
            else {
                simu.setDataAporte1(new DataEletros("01/01/2009"));
                simu.setAporte1(0.0);
            }
            
            if((aporte2Aux != null)&&(!aporte2Aux.equals(""))) 
            {
                int mesAporte2 = Integer.parseInt(request.getParameter("mesAporte2"));   
                int anoAporte2 = Integer.parseInt(request.getParameter("anoAporte2"));
                double aporte2 = Format.verificarNumero(aporte2Aux);
                simu.setDataAporte2(new DataEletros("01/"+mesAporte2+"/"+anoAporte2));
                simu.setAporte2(aporte2);
            }
            else {
                simu.setDataAporte2(new DataEletros("01/01/2009"));
                simu.setAporte2(0.0);
            }
            
            if((aporte3Aux != null)&&(!aporte3Aux.equals(""))) 
            {
                int mesAporte3 = Integer.parseInt(request.getParameter("mesAporte3"));   
                int anoAporte3 = Integer.parseInt(request.getParameter("anoAporte3"));
                double aporte3 = Format.verificarNumero(aporte3Aux);
                simu.setDataAporte3(new DataEletros("01/"+mesAporte3+"/"+anoAporte3));
                simu.setAporte3(aporte3);
            }
            else {
                simu.setDataAporte3(new DataEletros("01/01/2009"));
                simu.setAporte3(0.0);
            }
            
            //gera simulacao
            Relatorio relatorio = modelo.geraRelatorio( simu );
            session.setAttribute("relatorio", relatorio);
            session.setAttribute("simulacao", simu);
            
            return mapping.findForward( "success");
        }
        catch(Exception e) {
            e.printStackTrace();
            request.setAttribute("ErroMsg",e.getMessage());
            return mapping.findForward( "erro");
        }
        
    }
}
