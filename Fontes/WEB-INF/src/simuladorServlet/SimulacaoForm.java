package simuladorServlet;

import com.util.DataEletros;

import com.util.Format;

import javax.servlet.http.*;
import org.apache.struts.action.*;


public class SimulacaoForm extends org.apache.struts.validator.ValidatorForm 
{
    private String dataNasc;
    private int IAposentado;
    
    private String idadeDep;
    private String INumSalAtual;
    private String INumCrescSalarial;
    private int Rest1;
    private int AnoRest2;
    private String DataRest;
        
    
    public void reset(ActionMapping mapping, HttpServletRequest request)
    {
       String dataInicial = "";
       String dataFinal = "";
    }
    
    public ActionErrors validate(ActionMapping mapping,
              HttpServletRequest request)
    {
       System.out.println("Entering validate in ScheduleSelectForm");

       ActionErrors erros = new ActionErrors();
        if(getDataNasc() == null || getDataNasc().equals(""))
          erros.add("Data de nascimento", new ActionMessage("errors.dataNasc1"));
        if(getDataNasc() != null || !getDataNasc().equals(""))
        {
          try 
          {
            new DataEletros(getDataNasc());            
          }
          catch(Exception e) {
            erros.add("Data de nascimento", new ActionMessage("errors.dataNasc2"));
          }
        }
        if(getIAposentado() == 0)
          erros.add("Idade recebimento da renda certa", new ActionMessage("errors.idadeApos1"));
        if(getIAposentado() > 0)
        {
          if(getIAposentado() < 75 )
           erros.add("Idade recebimento da renda certa", new ActionMessage("errors.idadeApos2"));
        }
        if((getIdadeDep() != null)&&(!getIdadeDep().equals("")))
        {
            try
            {
               double crescimento = Format.verificarNumero(getIdadeDep());
            }
            catch(Exception e) {
               erros.add("idade dependente mais novo", new ActionMessage("errors.IdadeDep"));
            }  
          
        } 
        if(getINumSalAtual() == null || getINumSalAtual().equals(""))
        {
          erros.add("Salário", new ActionMessage("errors.salario"));
        }
        else {
           
           try
           {
              double crescimento = Format.verificarNumero(getINumSalAtual());
           }
           catch(Exception e) {
              erros.add("Salário", new ActionMessage("errors.salario"));
           }
        }
        
        if(getINumCrescSalarial() == null || getINumCrescSalarial().equals(""))
          erros.add("Crescimento salarial", new ActionMessage("errors.crescSal"));
        else {
            try
            {
               double crescimento = Format.verificarNumero(getINumCrescSalarial());
            }
            catch(Exception e) {
               erros.add("Salário", new ActionMessage("errors.crescSal"));
            }  
        }
          
        if(getRest1() != 0 )
        {
            if(getRest1() <= 5 ) 
              erros.add("Tempo de contribuição", new ActionMessage("errors.tempoCont"));
        }
        if(getAnoRest2() != 0 )
        {
            if(getAnoRest2() <= 55 ) 
              erros.add("Idade na data de solicitação do benefício", 
                new ActionMessage("errors.idadeSol"));
        }
        if( getDataRest() != null) {
            try 
            {
                new DataEletros(getDataRest());            
            }
            catch(Exception e) {
                erros.add("Data de solicitação do benefício", 
                   new ActionMessage("errors.dataApos"));
            } 
        }
         
       return erros;
    }

    public void setDataNasc(String dataNasc) {
        this.dataNasc = dataNasc;
    }

    public String getDataNasc() {
        return dataNasc;
    }

    public void setIAposentado(int iAposentado) {
        this.IAposentado = iAposentado;
    }

    public int getIAposentado() {
        return IAposentado;
    }

    public void setIdadeDep(String idadeDep) {
        this.idadeDep = idadeDep;
    }

    public String getIdadeDep() {
        return idadeDep;
    }

    public void setINumSalAtual(String iNumSalAtual) {
        this.INumSalAtual = iNumSalAtual;
    }

    public String getINumSalAtual() {
        return INumSalAtual;
    }

    public void setINumCrescSalarial(String iNumCrescSalarial) {
        this.INumCrescSalarial = iNumCrescSalarial;
    }

    public String getINumCrescSalarial() {
        return INumCrescSalarial;
    }

    public void setRest1(int rest1) {
        this.Rest1 = rest1;
    }

    public int getRest1() {
        return Rest1;
    }

    public void setAnoRest2(int anoRest2) {
        this.AnoRest2 = anoRest2;
    }

    public int getAnoRest2() {
        return AnoRest2;
    }

    public void setDataRest(String dataRest) {
        this.DataRest = dataRest;
    }

    public String getDataRest() {
        return DataRest;
    }

    
}
