package simuladorServlet;

import com.util.DataEletros;
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

public class SimularMudancasAction extends MyActionServlet {
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
        Simulacao simu = (Simulacao)session.getAttribute("simulacao");
        
        String salarioAtual = request.getParameter("INumSalAtual");
        String crescimentoSalarial = request.getParameter("INumCrescSalarial");
        String opcao_cont1   = request.getParameter("IStrContribuicao1");
        String rent_anual    = request.getParameter("INumRentAnual1");
        String rent_anual2   = request.getParameter("INumRentAnual2");
        String num_ent_Aporte= request.getParameter("INumEntAporte");
        String aporteInicial = request.getParameter("INumAporteInicial");
        String num_aporte    = request.getParameter("lNumAporteOpAporte");
        String aporte1Aux   = request.getParameter("aporte1");
        String aporte2Aux   = request.getParameter("aporte2");
        String aporte3Aux   = request.getParameter("aporte3");
        String flagAporteExt = "S";
        
        
        if (!(rent_anual2.equals("null")))
        {
           simu.setRentAnual1(Integer.parseInt(rent_anual));
           simu.setRentAnual2(Integer.parseInt(rent_anual2));
        }
        else 
        {
           simu.setRentAnual1(Integer.parseInt(rent_anual));
        }
        simu.setOpcaoContrib(opcao_cont1);
        
        try
        {
            double crescimento = Format.verificarNumero(crescimentoSalarial);
            //double aporteIni = Format.verificarNumero(aporte);
            double salario = Format.verificarNumero( salarioAtual );
            simu.setCrescimentoSalarial( crescimento );   
            simu.getParticipante().setSalarioAtual(salario);
            
            //verifica aporte inical
            if(( aporteInicial != null)||(!aporteInicial.equals(""))) {
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
                double aporte1 = Format.verificarNumero(aporte1Aux);
                simu.setDataAporte1(new DataEletros(request.getParameter("dataAporte1")));
                simu.setAporte1(aporte1);
            }
            else {
                simu.setDataAporte1(new DataEletros("01/01/2009"));
                simu.setAporte1(0.0);
            }
            
            if((aporte2Aux != null)&&(!aporte2Aux.equals(""))) 
            {
                double aporte2 = Format.verificarNumero(aporte2Aux);
                simu.setDataAporte2(new DataEletros(request.getParameter("dataAporte2")));
                simu.setAporte2(aporte2);
            }
            else {
                simu.setDataAporte2(new DataEletros("01/01/2009"));
                simu.setAporte2(0.0);
            }
            
            if((aporte3Aux != null)&&(!aporte3Aux.equals(""))) 
            {
                double aporte3 = Format.verificarNumero(aporte3Aux);
                simu.setDataAporte3(new DataEletros(request.getParameter("dataAporte3")));
                simu.setAporte3(aporte3);
            }
            else {
                simu.setDataAporte3(new DataEletros("01/01/2009"));
                simu.setAporte3(0.0);
            }
            
            //gera simulacao
            Relatorio relatorio = modelo.geraRelatorio(simu);
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
