package simuladorElet;

import com.eletros.benef.Participante;

import com.util.DataEletros;

/**
 * Classe que representa a simulção em sim. Seus parametros de entrada e informações
 * relativas ao participante.
 */
public class Simulacao 
{
   private DataEletros dataSimulacao;
   private Participante participante;
   public int anoReserva;        
   public int mesReserva;         
   public double reservaMatematica;    
   public double reservaBpds; 
    
   private double crescimentoSalarial;
   private double aporteInicial;
   private int idadeAposentadoria;
   private boolean contrataPensao=false;
   private int IdadeDependente;
   private int anoRest1;
   private int anoRest2;
   private DataEletros dataRest;
   private int rentAnual1;
   private int rentAnual2;
   private String opcaoContrib;
   private String optAporteContribuicao;
   private double aporteEnt;
   private double contribuicaoMin;
   private double contribuicaoMAx;
   private double aporte1;
   private double aporte2;
   private double aporte3;
   private DataEletros dataAporte1;
   private DataEletros dataAporte2;
   private DataEletros dataAporte3;
   
   private String sNumAporte;
   
     
   
   public Simulacao(){
       
   }

    public String getOpcaoContrib() {
        return opcaoContrib;
    }

    public void setOpcaoContrib(String opcaoContrib) {
        this.opcaoContrib = opcaoContrib;
         if(opcaoContrib.equals("1"))
         {
             contribuicaoMin = 1.8;
             contribuicaoMAx = 6.0;
         }
         else
         {
            if(opcaoContrib.equals("2") )
            {
               contribuicaoMin = 2.25;
               contribuicaoMAx = 7.5;
            }
            else 
            {
                if (opcaoContrib.equals("3"))
                {
                    contribuicaoMin = 3.75;
                    contribuicaoMAx = 11.25;
                }
                else
                {
                   contribuicaoMin = 4.5;
                   contribuicaoMAx = 15.0;
                }

            }
         }
    }

   
   
    public void setParticipante(Participante participante) {
        this.participante = participante;
    }

    public Participante getParticipante() {
        return participante;
    }

    public void setCrescimentoSalarial(double crescimentoSalarial) {
        this.crescimentoSalarial = crescimentoSalarial;
    }

    public double getCrescimentoSalarial() {
        return crescimentoSalarial;
    }

    public void setAporteInicial(double aporteInicial) {
        this.aporteInicial = aporteInicial;
    }

    public double getAporteInicial() {
        return aporteInicial;
    }

    public void setIdadeAposentadoria(int idadeAposentadoria) {
        this.idadeAposentadoria = idadeAposentadoria;
    }

    public int getIdadeAposentadoria() {
        return idadeAposentadoria;
    }

    public void setAnoRest1(int anoRest1) {
        this.anoRest1 = anoRest1;
    }

    public int getAnoRest1() {
        return anoRest1;
    }

    public void setAnoRest2(int anoRest2) {
        this.anoRest2 = anoRest2;
    }

    public int getAnoRest2() {
        return anoRest2;
    }

    public void setRentAnual1(int rentAnual1) {
        this.rentAnual1 = rentAnual1;
    }

    public int getRentAnual1() {
        return rentAnual1;
    }

    public void setRentAnual2(int rentAnual2) {
        this.rentAnual2 = rentAnual2;
    }

    public int getRentAnual2() {
        return rentAnual2;
    }

    public void setAporte1(double aporte1) {
        this.aporte1 = aporte1;
    }

    public double getAporte1() {
        return aporte1;
    }

    public void setAporte2(double aporte2) {
        this.aporte2 = aporte2;
    }

    public double getAporte2() {
        return aporte2;
    }

    public void setAporte3(double aporte3) {
        this.aporte3 = aporte3;
    }

    public double getAporte3() {
        return aporte3;
    }

    public void setDataRest(DataEletros dataRest) {
        this.dataRest = dataRest;
    }

    public DataEletros getDataRest() {
        return dataRest;
    }

    public void setOptAporteContribuicao(String optAporteContribuicao) {
        this.optAporteContribuicao = optAporteContribuicao;
    }

    public String getOptAporteContribuicao() {
        return optAporteContribuicao;
    }

    public void setAporteEnt(double aporteEnt) {
        this.aporteEnt = aporteEnt;
    }

    public double getAporteEnt() {
        return aporteEnt;
    }

    public void setDataSimulacao(DataEletros dataSimulacao) {
        this.dataSimulacao = dataSimulacao;
    }

    public DataEletros getDataSimulacao() {
        return dataSimulacao;
    }

    public double getContribuicaoMin() {
        return contribuicaoMin;
    }

    public double getContribuicaoMAx() {
        return contribuicaoMAx;
    }

    public void setDataAporte1(DataEletros dataAporte1) {
        this.dataAporte1 = dataAporte1;
    }

    public DataEletros getDataAporte1() {
        return dataAporte1;
    }

    public void setDataAporte2(DataEletros dataAporte2) {
        this.dataAporte2 = dataAporte2;
    }

    public DataEletros getDataAporte2() {
        return dataAporte2;
    }

    public void setDataAporte3(DataEletros dataAporte3) {
        this.dataAporte3 = dataAporte3;
    }

    public DataEletros getDataAporte3() {
        return dataAporte3;
    }

    public void setReservaMatematica(double reservaMatematica) {
        this.reservaMatematica = reservaMatematica;
    }

    public double getReservaMatematica() {
        return reservaMatematica;
    }

    public void setReservaBpds(double reservaBpds) {
        this.reservaBpds = reservaBpds;
    }

    public double getReservaBpds() {
        return reservaBpds;
    }

    public void setAnoReserva(int anoReserva) {
        this.anoReserva = anoReserva;
    }

    public int getAnoReserva() {
        return anoReserva;
    }

    public void setMesReserva(int mesReserva) {
        this.mesReserva = mesReserva;
    }

    public int getMesReserva() {
        return mesReserva;
    }

    public void setSNumAporte(String sNumAporte) {
        this.sNumAporte = sNumAporte;
    }

    public String getSNumAporte() {
        return sNumAporte;
    }

    public void setIdadeDependente(int idadeDependente) {
        this.IdadeDependente = idadeDependente;
    }

    public int getIdadeDependente() {
        return IdadeDependente;
    }

    public void setContrataPensao(boolean contrataPensao) {
        this.contrataPensao = contrataPensao;
    }

    public boolean isContrataPensao() {
        return contrataPensao;
    }
}
