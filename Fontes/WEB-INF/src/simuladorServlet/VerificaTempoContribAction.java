package simuladorServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import simuladorElet.*;
import com.util.*;
import java.util.*;


public class VerificaTempoContribAction extends MyActionServlet {
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
        
        String DataRest  = request.getParameter("DataRest");
        String rest = request.getParameter("Rest1");
        String anoRest2 = request.getParameter("AnoRest2");
        String aporte = request.getParameter("INumAporteInicial");
        int   idadeRendaCertaAux = Integer.parseInt(request.getParameter("IAposentado"));
        String dataNascimento = request.getParameter("dataNasc");
        String idadeDepAux = request.getParameter("idadeDep");
        
        String crescimentoSalarial = request.getParameter("INumCrescSalarial");
        String salarioAtual = request.getParameter("INumSalAtual");
        
        
        boolean contratarPensao = false;
        if (( idadeDepAux != null )&&(!idadeDepAux.equals("")))
           contratarPensao = true;
        
        HttpSession session = request.getSession();
        Modelo modelo = (Modelo)session.getAttribute("modelo");
        Simulacao simu = new Simulacao();
        
           // Essas vari?veis ser?o criadas para armazenarem os valores digitados pelo usu?rio e configur?-los.
           /*String salarioAtual  = v.colocaVirgula(request.getParameter("INumSalAtual"));
           String reservaMigra  = v.colocaVirgula(request.getParameter("INumReservaMigra"));
          // String bpds                = v.colocaVirgula(request.getParameter("bpds"));
          */
        int   tempoCont    = 0;
        int   idade        = 0;
        int   idadeAux     = 0;
        int   idadeRendaCerta = idadeRendaCertaAux * 12 ;
        try
        { 
           DataEletros dtNas = new DataEletros(dataNascimento);
           
           if( dataNascimento != null)
           {
             modelo.getParticipante().setDtNascimento(dtNas);
           }                   
           DataEletros dataHoje = new DataEletros(System.currentTimeMillis());
           int anoHoje= dataHoje.getAno();
           int mesHoje = dataHoje.getMes();
           int diaHoje = dataHoje.getDia();
            
           DataEletros dataNasc = new DataEletros(
                   modelo.getParticipante().getDtNascimento().getTime() );   
           int anoNasc= dataNasc.getAno();
           int mesNasc = dataNasc.getMes();
           int diaNasc = dataNasc.getDia();
         
           DataEletros dataRest = null;
         
           if(mesHoje >= mesNasc)
           {
              idade = ((( anoHoje - anoNasc)*12) + ((mesHoje) - mesNasc)) ;
           }
           else
              idade = (((anoHoje-1 - anoNasc)*12) + ((mesHoje - mesNasc) + mesNasc+1)) ;

         
             if (!rest.equals("")) 
             {
                simu.setAnoRest1( Integer.parseInt(rest) );
                tempoCont = ((Integer.parseInt(request.getParameter("Rest1"))*12));
                idadeAux = (idade+tempoCont);
                
             }
             else
             {
                if(!anoRest2.equals(""))
                {
                   int rest2 = Integer.parseInt(anoRest2);
                   if( idadeRendaCertaAux <= rest2) {
                       request.setAttribute("ErroMsg",
                         "A idade para receber a renda certa tem de ser maior que a idade de solicita&ccedil;&atilde;o do benef&iacute;cio.");
                       return mapping.findForward( "erro" );   
                   }
                    simu.setAnoRest2( rest2 );
                   tempoCont = ((rest2*12)-(idade));
                   idadeAux = (rest2*12);
                    
                }
                else 
                {
                   dataRest = new DataEletros(DataRest);
                   GregorianCalendar calendar = new GregorianCalendar();
                   calendar.setTime( dataRest );
                   
                   int pDataRestIniInt = calendar.get(Calendar.DAY_OF_MONTH );
                   int pDataRestMeioInt= calendar.get(Calendar.MONTH );
                   int pDataRestFimInt = calendar.get(Calendar.YEAR );
                   
                   int i = mesHoje;
                   if (pDataRestMeioInt == mesNasc)
                   {
                         if (pDataRestIniInt < diaNasc )
                         {
                               pDataRestMeioInt = pDataRestMeioInt-1 ;
                         }
                   }

                   pDataRestMeioInt =   pDataRestMeioInt -1;
                   for ( ; anoHoje <= pDataRestFimInt; anoHoje++)
                   {
                        for (; i<12 ; i++)
                        {
                             tempoCont ++;
                             if ((i==pDataRestMeioInt) && (anoHoje == pDataRestFimInt)) 
                                   break;

                        }
                        i = 0;
                   }
                   idadeAux = (idade+(tempoCont));
                }

              }  

          
              double crescimento = Format.verificarNumero(crescimentoSalarial);
              //double aporteIni = Format.verificarNumero(aporte);
              double salario = Format.verificarNumero( salarioAtual );
              simu.setCrescimentoSalarial( crescimento );  
              simu.setContrataPensao( contratarPensao );
              //modelo.getSimulacao().setAporteInicial( aporteIni );   
              simu.setIdadeAposentadoria( idadeRendaCertaAux );
              modelo.getParticipante().setSalarioAtual(salario);
              if((idadeDepAux != null)&&(!idadeDepAux.equals("")))
                 simu.setIdadeDependente( Integer.parseInt(idadeDepAux));
              simu.setDataRest( dataRest );
              
              session.setAttribute("simulacao", simu);
              
              
          }
          catch(Exception e)
          { 
            e.printStackTrace();
           
            request.setAttribute("ErroMsg",e.getMessage());
            return mapping.findForward( "erro" );
          }
          
        if (idadeAux<600)
        {
            request.setAttribute("ErroMsg",
              "A idade m&iacute;nima para solicita&ccedil;&atilde;o do benef&iacute;cio deve ser 50 anos.");
            return mapping.findForward( "erro" );
        } 
        else 
        {
            if (idadeAux>idadeRendaCerta)
            { 
                request.setAttribute("ErroMsg",
                  "A idade estipulada para recebimento da Renda Certa &eacute; maior que a "+
                  "idade prevista para in&iacute;cio do recebimento do benef&iacute;cio.");
                return mapping.findForward( "erro" );
            }
            else 
            {
              if (tempoCont > 60)
              { 
                 return mapping.findForward( "successMaior");
                        
              }
              else
              {
                  return mapping.findForward( "successMenor");       
              } 
            }
        }
        
    }
}
