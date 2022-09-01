/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package simuladorServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import simuladorElet.*;
import com.util.*;

/**
 *
 * @author victor
 */
public class GeraResumoMigracaoXMLAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    private Modelo modelo;

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String numEletros = request.getParameter("numEletros");
        String dataNascimento = request.getParameter("p1");
        if (numEletros != null) {
            modelo = new Modelo(numEletros);
        } else {
            modelo = new Modelo();
        }

        if (dataNascimento != null) {
            DataEletros dtNas = new DataEletros(dataNascimento);
            modelo.getParticipante().setDtNascimento(
                    dtNas);
        } else {
            if (modelo.getParticipante().getDtNascimento() == null) {
                request.setAttribute("erro", "Participante sem data de nascimento");
                return mapping.findForward(SUCCESS);
            }
        }

        String DataRest = request.getParameter("p9");
        String rest = request.getParameter("p7");
        String anoRest2 = request.getParameter("p8");
        // String aporte = request.getParameter("INumAporteInicial");
        int idadeRendaCertaAux = Integer.parseInt(request.getParameter("p2"));

        String idadeDepAux = request.getParameter("p3");

        String crescimentoSalarial = request.getParameter("p6");
        String salarioAtual = request.getParameter("p5");
        String rent5 = request.getParameter("p10");
        String rentProx = request.getParameter("p11");
        String opContrib = request.getParameter("p12");
        String isContribExtra = request.getParameter("p13");
        String tipoContribExtra = request.getParameter("p14");
        String valorContribExtra = request.getParameter("p15");
        String aporteInicial = request.getParameter("p16");
        String aporteExtra1 = request.getParameter("p17");
        String aporteExtra2 = request.getParameter("p18");
        String aporteExtra3 = request.getParameter("p19");
        String dataAporteExtra1 = request.getParameter("p20");
        String dataAporteExtra2 = request.getParameter("p21");
        String dataAporteExtra3 = request.getParameter("p22");
        //String novaRenda = request.getParameter("p24");

        try {
            Simulacao simu = new Simulacao();
            boolean contratarPensao = false;
            if ((idadeDepAux != null) && (!idadeDepAux.equals(""))) {
                contratarPensao = true;
                simu.setIdadeDependente(Integer.parseInt(idadeDepAux));
            }
            if ((rest != null) && (!rest.equals(""))) {
                simu.setAnoRest1(Integer.parseInt(rest));
            } else if ((anoRest2 != null) && (!anoRest2.equals(""))) {
                int rest2 = Integer.parseInt(anoRest2);
                simu.setAnoRest2(rest2);
            } else {
                DataEletros dataRest = new DataEletros(DataRest);
                simu.setDataRest(dataRest);
            }


            double crescimento = Format.verificarNumero(crescimentoSalarial);
            //double aporteIni = Format.verificarNumero(aporte);
            double salario = Format.verificarNumero(salarioAtual);

            simu.setCrescimentoSalarial(crescimento);
            simu.setContrataPensao(contratarPensao);
            simu.setIdadeAposentadoria(idadeRendaCertaAux);
            modelo.getParticipante().setSalarioAtual(salario);
            if ((rentProx != null)) {
                simu.setRentAnual1(Integer.parseInt(rent5));
                simu.setRentAnual2(Integer.parseInt(rentProx));
            } else {
                simu.setRentAnual1(Integer.parseInt(rent5));
                simu.setRentAnual2(Integer.parseInt(rent5));
            }
            
            simu.setOpcaoContrib( opContrib );

            //verifica aporte inical
            if ((aporteInicial != null) && (!aporteInicial.equals(""))) {
                simu.setAporteInicial(
                        Format.verificarNumero(aporteInicial));
            }
            //verifica se haver? aportes pre-definidos 
            if ((tipoContribExtra == null) || (tipoContribExtra.equals(""))) {
                tipoContribExtra = "nada";
            }
            simu.setOptAporteContribuicao(tipoContribExtra);
            simu.setSNumAporte(isContribExtra);

            if ((valorContribExtra != null) && (!valorContribExtra.equals(""))) {
                simu.setAporteEnt(Format.verificarNumero(valorContribExtra));
            } else {
                simu.setAporteEnt(0.0);
            }

            if ((aporteExtra1 != null) && (!aporteExtra1.equals(""))) {
                double aporte1 = Format.verificarNumero(aporteExtra1);
                simu.setDataAporte1(new DataEletros(dataAporteExtra1));
                simu.setAporte1(aporte1);
            } else {
                simu.setDataAporte1(new DataEletros("01/01/2009"));
                simu.setAporte1(0.0);
            }

            if ((aporteExtra2 != null) && (!aporteExtra2.equals(""))) {
                double aporte2 = Format.verificarNumero(aporteExtra2);
                simu.setDataAporte2(new DataEletros(dataAporteExtra2));
                simu.setAporte2(aporte2);
            } else {
                simu.setDataAporte2(new DataEletros("01/01/2009"));
                simu.setAporte2(0.0);
            }

            if ((aporteExtra3 != null) && (!aporteExtra3.equals(""))) {
                double aporte3 = Format.verificarNumero(aporteExtra3);
                simu.setDataAporte3(new DataEletros(dataAporteExtra3));
                simu.setAporte3(aporte3);
            } else {
                simu.setDataAporte3(new DataEletros("01/01/2009"));
                simu.setAporte3(0.0);
            }


            Relatorio rel = modelo.geraRelatorio(simu);
            ResumoMigracao resumo = modelo.geraRelatorioMigracao(rel);

            request.setAttribute("relat", rel);
            request.setAttribute("modelo", modelo);
            request.setAttribute("resumo", resumo);

            return mapping.findForward(SUCCESS);

        } catch (Exception e) {
            request.setAttribute("erro", e.getMessage());
            return mapping.findForward(SUCCESS);
        }









    }
}
