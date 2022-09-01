package simuladorElet;

import extrato.*;
import java.util.Collection;
import EJB.Eletros.*;
import com.eletros.benef.*;
import javax.naming.*;
import javax.rmi.*;
import com.util.*;
import java.util.*;

/**
 * Classe responsável em gerar a simulação, salvar e guardar os parâmetros usados
 * na simulação. É a classe que representa o modelo de negócios do sistema.
 */
public class Modelo 
{

     private Participante participante;
     //private Simulacao simu;
     //private SimuladorEletDAO dataAccess;
     private ExtratoCD extrato;
     private double reservaMatematica;
     private double bpds;
     
     /**
     * Construtor usado por usuarios administradores do sistema, acessam simulação
     * para qualquer participante.
     * Busca informações sobre o participante na base de dados da marlin.
     * 
     * @param login
     * @throws Exception
     */
     public Modelo(String login) 
        throws Exception
     {
           //busca o EJB de extrato na base de dados 
           InitialContext ctx = new InitialContext();
           Object ref = ctx.lookup("ExtratoEJB");
           
           String numEletros = zeroEsq(login);
           
           ctx = new InitialContext();
           ref = ctx.lookup("ParticipanteEJB");
           ParticipanteEJBHome home = (ParticipanteEJBHome) PortableRemoteObject.narrow(ref, ParticipanteEJBHome.class);
           ParticipanteEJB partEJB =  home.create();
            
           participante = partEJB.BuscarParticipante( numEletros );
           
           if( participante instanceof ParticipanteCDElet ) {
               ParticipanteCDElet part = (ParticipanteCDElet)participante;

                ctx = new InitialContext();
                ref = ctx.lookup("ExtratoEJB");
                ExtratoEJBHome extHome = (ExtratoEJBHome) PortableRemoteObject.narrow(ref, ExtratoEJBHome.class);
                ExtratoEJB extratoEJB = extHome.create();

                ExtratoCD extrato = extratoEJB.geraExtratoCDElet( part );

                reservaMatematica = extrato.getSaldoAtual();
                bpds = part.getBPDSAtual();
           }
           else if( participante instanceof ParticipanteCDONS) {
               String msg = participante.getNome()+",<br>"+
                          "O simulador so pode ser usado pelos participantes <br>"+
                          "do plano CD Eletrobras ou do plano BD que desejam migrar. Obrigado.";
               throw new Exception( msg );
           }
           else {
               ParticipanteBD part = (ParticipanteBD)participante;
               
               reservaMatematica = part.getReservaPoupanca();
               bpds = part.getValorBPDS();
           }
         
         //bloqueia o acesso se a reserva for zero.
         /*if(simulacao.getReservaMatematica() == 0.0)
         {
                String msg = participante.getNome()+",<br>"+
                             "As informa&ccedil;&otilde;es sobre a sua reserva de migra&ccedil;&atilde;o ainda n&atilde;o est&atilde;o dispon&iacute;veis.<br>"+
                             "Por favor, entre em contato com a Eletros. Obrigado.";
                throw new Exception(msg);            
         }  */
     }
    
    
     /**
     * Construtor para quem não é participante.
     * 
     * @throws Exception
     */
     public Modelo() 
       throws Exception
     {
         participante = new ParticipanteBD();
         participante.setNumEletros("000");
         
     }
     
     
     /**
     * Faz os cálculos da simulação e gera um objeto Relatorio com os resultados.
     * 
     * @return uma objeto Relatorio
     */
     /*public Relatorio geraSimulacao() 
       throws Exception
     {
         CalculoSimulacao calculo = new CalculoSimulacao(simulacao);                  
         
         return calculo.geraSimulacao();
     }*/
     
     
     /**
     * Faz os cálculos da simulação e gera um objeto Relatorio com os resultados.
     * 
     * @return uma objeto Relatorio
     */
     public Relatorio geraRelatorio(Simulacao simu) 
       throws Exception
     {
         simu.setParticipante( participante );
               // simu.setAnoReserva( partBD.getDataRef());
               // simu.setMesReserva(rs.getInt(3));
         simu.setReservaMatematica(this.reservaMatematica);
         simu.setReservaBpds(bpds); 
               
         this.verificaTempoContrib( simu );
         CalculoSimulacao calculo = new CalculoSimulacao(simu);                  
         
         return calculo.geraSimulacao();
     }
     
     
     /**
     * Faz os cálculos da simulação e gera um objeto Relatorio com os resultados.
     * 
     * @return uma objeto Relatorio
     */
     public ResumoMigracao geraRelatorioMigracao(Relatorio rel) 
       throws Exception
     {
            ResumoMigracao resumo = new ResumoMigracao();
            if (bpds != 0) {
                resumo.setRendaVitaliciaNova((((rel.getSaldo() - rel.getReservaMigracao()) * rel.getRendaVitalicia()) / rel.getSaldo()));
                resumo.setRendaProgramadaNova((((rel.getSaldo() - rel.getReservaMigracao()) * rel.getRendaProgramada()) / rel.getSaldo()));
                resumo.setRendaVitaliciaNovaMetade((((rel.getSaldo() - (rel.getReservaMigracao() / 2)) * rel.getRendaVitalicia()) / rel.getSaldo()));
                resumo.setRendaProgramadaNovaMetade((((rel.getSaldo() - (rel.getReservaMigracao() / 2)) * rel.getRendaProgramada()) / rel.getSaldo()));

            } else {

                resumo.setRendaVitaliciaNova(rel.getRendaVitalicia());
                resumo.setRendaProgramadaNova(rel.getRendaProgramada());
                resumo.setRendaVitaliciaNovaMetade(rel.getRendaVitalicia());
                resumo.setRendaProgramadaNovaMetade(rel.getRendaProgramada());
            }
            
            return resumo;
     }
     
     
     /**
     * Faz novos cálculos da simulação baseado em uma renda desejada pelo
     * particpante. Gera um objeto Relatorio com os resultados.
     * 
     * @param rendaDesejada
     * @return um objeto Relatorio
     * @throws Exception
     */
     public Relatorio calculoNovaRenda(Simulacao simu, double rendaDesejada) 
       throws Exception
     {
         simu.setParticipante( participante );
               // simu.setAnoReserva( partBD.getDataRef());
               // simu.setMesReserva(rs.getInt(3));
         simu.setReservaMatematica(this.reservaMatematica);
         simu.setReservaBpds(bpds); 
               
         this.verificaTempoContrib( simu );
         CalculoSimulacao calculo = new CalculoSimulacao(simu);     
         
         return calculo.geraNovaRenda( rendaDesejada );
     }
     
     
     /**
     * Calcula a projeção de contribuição e renda para os proximos 5 anos.
     * 
     * @param rendaDesejada
     * @param tempoCont
     * @return uma lista com Varios Calculos de simulação( objeto CalculoSimulacao),
     * uma para cada ano.
     */
     public java.util.List<Relatorio> calculoProjecao(Simulacao simu, double rendaDesejada, int tempoCont) 
       throws Exception
     {
         simu.setParticipante( participante );
               // simu.setAnoReserva( partBD.getDataRef());
               // simu.setMesReserva(rs.getInt(3));
         simu.setReservaMatematica(this.reservaMatematica);
         simu.setReservaBpds(bpds); 
               
         this.verificaTempoContrib( simu );
         CalculoSimulacao calculo = new CalculoSimulacao(simu);       
         
         return calculo.calculoProjecao( rendaDesejada, tempoCont );
     }
     
     
     /**
     * Calcula a contribuição bruta do participante, baseado no salario atual.
     * 
     * @param txMaior - menor percentual de desconto
     * @param txMenor - maior percentual de desconto
     * @return valor a ser contribuido.
     */
     public double calculaContribuicaoBruta(String opcaoContrib) 
     {
         Simulacao simu = new Simulacao();
         simu.setOpcaoContrib(opcaoContrib);
         simu.setParticipante( participante );
         
         CalculoSimulacao simulador = new CalculoSimulacao(simu);
         
         return simulador.calculoContribuicaoBruta();    
     }
     
     
    /**
     * Busca uma lista de simulações salvas no BD Oracle.
     * 
     * @return uma lista de objetos Relatorio
     * @throws Exception
     */
     public Collection buscarSimulacoes() 
       throws Exception
     {
         //return dataAccess.buscarSimulacoes();
         return new LinkedList();
     }
     
     
     /**
     * Salva os resultados de uma simulação
     * @param relatorio
     * @throws Exception
     */
     public void insereSimulacao( Relatorio relatorio) 
       throws Exception
     {
        // dataAccess.inserirSimulacao(relatorio);  
     }
     
     
     /**
     * Apaga os resultados salvos de uma simulação.
     * @param valor
     * @throws Exception
     */
     public void deleteSimulacao(String valor) 
       throws Exception
     {
         //dataAccess.deleteSimulacao(valor);        
     }

    public Participante getParticipante() {
        return participante;
    }

    public void setParticipante(Participante participante) {
        this.participante = participante;
    }
     
     private String zeroEsq(String numElet) 
     {
           if (numElet.length() < 7)
           {
                do  
                {
                     numElet = "0"+numElet;
                }while(numElet.length() < 7);
           }
        
           return numElet;
     }

    
     private void verificaTempoContrib(Simulacao simu )
            throws Exception {

        
        // Essas vari?veis ser?o criadas para armazenarem os valores digitados pelo usu?rio e configur?-los.
        /*String salarioAtual  = v.colocaVirgula(request.getParameter("INumSalAtual"));
        String reservaMigra  = v.colocaVirgula(request.getParameter("INumReservaMigra"));
        // String bpds                = v.colocaVirgula(request.getParameter("bpds"));
         */
        
        int tempoCont = 0;
        int idade = 0;
        int idadeAux = 0;
        int idadeRendaCerta = simu.getIdadeAposentadoria() * 12;

        DataEletros dataHoje = new DataEletros(System.currentTimeMillis());
        int anoHoje = dataHoje.getAno();
        int mesHoje = dataHoje.getMes();
        int diaHoje = dataHoje.getDia();

        DataEletros dataNasc = 
                new DataEletros(participante.getDtNascimento().getTime());
        int anoNasc = dataNasc.getAno();
        int mesNasc = dataNasc.getMes();
        int diaNasc = dataNasc.getDia();

        if (mesHoje >= mesNasc) {
            idade = (((anoHoje - anoNasc) * 12) + ((mesHoje) - mesNasc));
        } else {
            idade = (((anoHoje - 1 - anoNasc) * 12) + ((mesHoje - mesNasc) + mesNasc + 1));
        }
        if ( simu.getAnoRest1() > 0) {
            tempoCont = ( simu.getAnoRest1() * 12);
            idadeAux = (idade + tempoCont);

        } else if (simu.getAnoRest2() > 0) {

            if (simu.getIdadeAposentadoria() <= simu.getAnoRest2()) {
                throw new Exception(
                        "A idade para receber a renda certa tem de ser maior que a idade de solicita&ccedil;&atilde;o do benef&iacute;cio.");
            }
            tempoCont = ((simu.getAnoRest2() * 12) - (idade));
            idadeAux = (simu.getAnoRest2() * 12);

        } else {
            
            GregorianCalendar calendar = new GregorianCalendar();
            calendar.setTime(simu.getDataRest());

            int pDataRestIniInt = calendar.get(Calendar.DAY_OF_MONTH);
            int pDataRestMeioInt = calendar.get(Calendar.MONTH);
            int pDataRestFimInt = calendar.get(Calendar.YEAR);

            int i = mesHoje;
            if (pDataRestMeioInt == mesNasc) {
                if (pDataRestIniInt < diaNasc) {
                    pDataRestMeioInt = pDataRestMeioInt - 1;
                }
            }

            pDataRestMeioInt = pDataRestMeioInt - 1;
            for (; anoHoje <= pDataRestFimInt; anoHoje++) {
                for (; i < 12; i++) {
                    tempoCont++;
                    if ((i == pDataRestMeioInt) && (anoHoje == pDataRestFimInt)) {
                        break;
                    }
                }
                i = 0;
            }
            idadeAux = (idade + (tempoCont));
        }

        if (idadeAux < 600) {
            throw new Exception(
                    "A idade m&iacute;nima para solicita&ccedil;&atilde;o do benef&iacute;cio deve ser 50 anos.");
        } else {
            if (idadeAux > idadeRendaCerta) {
                throw new Exception(
                        "A idade estipulada para recebimento da Renda Certa &eacute; maior que a " +
                        "idade prevista para in&iacute;cio do recebimento do benef&iacute;cio.");
            }
        }

    }

    public double getBpds() {
        return bpds;
    }

    public double getReservaMatematica() {
        return reservaMatematica;
    }

    
    
}
