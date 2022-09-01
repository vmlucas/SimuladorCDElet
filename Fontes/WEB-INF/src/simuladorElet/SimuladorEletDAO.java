package simuladorElet;

import com.eletros.benef.Participante;
import com.util.DataEletros;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;


/**
 * Classe q representa todas as consultas a base de dados Oracle do sistema.
 */
public class SimuladorEletDAO 
{
    
    private Participante participante;
    
    /**
     * Cosntrutor da classe. 
     * @param part
     */
    public SimuladorEletDAO(Participante part) 
    {
        participante = part;
    }
    
    
    /**
     * Retornar todas as simulacoes salvas pelo participante
     * @return Collection of Relatorio
     * @throws Exception
     */
    public Collection buscarSimulacoes()
      throws Exception
    {
        Connection conn = null;
        ArrayList lista = new ArrayList();


        try 
        {
           conn = getConnection(); //dbConn.getConnection();
           Statement stmt  = conn.createStatement();


           String  command = "SELECT to_char(TS_SML,'dd/mm/yyyy hh24:mi:ss'),NU_PTI_ICR,VA_SML_RSV_MGR,VA_SML_CRE_ADI,VA_SML_SAL,PC_SML_CRM_SAL,VA_SML_ID_APS,VA_SML_TMP_CBU,to_char(DT_SML_BNF,'dd/mm/yyyy'),PC_SML_RNT_MED_PZ,PC_SML_RNT_LNG_PZ,PC_SML_CBU_MMO,PC_SML_CBU_MAX,FL_SML_APO_EXA,DE_SML_PER,VA_SML_APO_EXA,VA_SML_SLD_ACU,VA_SML_REN_VTL,VA_SML_REN_CER,VA_SML_BPD,to_char(DT_SML_APO_EPO_1,'dd/mm/yyyy'),to_char(DT_SML_APO_EPO_2,'dd/mm/yyyy'),to_char(DT_SML_APO_EPO_3,'dd/mm/yyyy'),VA_SML_APO_EPO_1,VA_SML_APO_EPO_2,VA_SML_APO_EPO_3 FROM SML_ELET_BD "+
                         "WHERE NU_PTI_ICR ='"+participante.getNumEletros()+"' ORDER BY TS_SML";

           ResultSet rs = stmt.executeQuery(command);

          while (rs.next())
          {
              Relatorio relatorio = new Relatorio();
              participante.setSalarioAtual(rs.getDouble(5));
              
              //cria objeto simulacao
              Simulacao simu = new Simulacao();
              simu.setParticipante( participante );
              
              simu.setReservaMatematica(rs.getDouble(3));
              simu.setReservaBpds(rs.getDouble(20));
              simu.setDataSimulacao( new DataEletros(rs.getString(1)));
              simu.setCrescimentoSalarial( rs.getDouble(6) );
              simu.setIdadeAposentadoria( rs.getInt(7) );
              simu.setRentAnual1(rs.getInt(10));
              simu.setRentAnual2(rs.getInt(11));
              simu.setAporteInicial(rs.getDouble(4));
              simu.setAporteEnt(rs.getDouble(16));
              simu.setOptAporteContribuicao(rs.getString(14));
              //simu.setContribuicaoMin(rs.getDouble(12));
              //simu.setContribuicaoMAx(rs.getDouble(13));
              simu.setAporte1(rs.getDouble(24));
              simu.setAporte2(rs.getDouble(25));
              simu.setAporte3(rs.getDouble(26));
              String dataRest = rs.getString(9);
              if( dataRest != null)
                  simu.setDataRest(new DataEletros(dataRest));
              String dataAporte1 = rs.getString(21);
              if( dataAporte1 != null)
                  simu.setDataAporte1( new DataEletros(rs.getString(21)));
              String dataAporte2 = rs.getString(22);
              if( dataAporte2 != null)
                  simu.setDataAporte2( new DataEletros(rs.getString(22)));
              String dataAporte3 = rs.getString(23);
              if( dataAporte3 != null)
                  simu.setDataAporte3( new DataEletros(rs.getString(23)));
              simu.setSNumAporte( rs.getString(15) );
              
              relatorio.setSimulacao( simu );
              relatorio.setTempoCont(rs.getInt(8));
              relatorio.setSaldo(rs.getDouble(17));
              relatorio.setRendaVitalicia(rs.getDouble(18));
              relatorio.setRendaProgramada(rs.getDouble(19));
              relatorio.setReservaMigracao(rs.getDouble(3));
              
              lista.add(relatorio);
       }

      }
      catch(SQLException e)
      {
         e.printStackTrace();
         throw new Exception("Erro ao buscar as simulacoes do participante");
      }
      finally{
          if( conn != null)
             conn.close();  
      }
      
      return lista;

    }
    
    
    /**
     * Insere os resultados de uma nova simulação na base de dados.
     * @param relatorio - Objeto Relatorio
     * @throws Exception
     */
    public void inserirSimulacao(Relatorio relatorio)
      throws Exception
    {

       Connection conn = null;
        
        Simulacao simu = relatorio.getSimulacao();
        
        try 
        {
           DecimalFormat formatter = new DecimalFormat("#.##");
           DecimalFormatSymbols symbol = new DecimalFormatSymbols();
           symbol.setDecimalSeparator('.');
           formatter.setDecimalFormatSymbols( symbol );
                  
           conn = getConnection(); //dbConn.getConnection();
           Statement stmt  = conn.createStatement();
           String  command = null;
           if( simu.getDataRest() != null ) 
           {
             command ="INSERT INTO SML_ELET_BD(TS_SML,NU_PTI_ICR,VA_SML_RSV_MGR,VA_SML_CRE_ADI,"+
                         "VA_SML_SAL,PC_SML_CRM_SAL,VA_SML_ID_APS,VA_SML_TMP_CBU,DT_SML_BNF,"+
                         "PC_SML_RNT_MED_PZ,PC_SML_RNT_LNG_PZ,PC_SML_CBU_MMO,PC_SML_CBU_MAX,"+                                     
                         "FL_SML_APO_EXA,DE_SML_PER,VA_SML_APO_EXA,VA_SML_SLD_ACU,VA_SML_REN_VTL,"+
                         "VA_SML_REN_CER,DT_SML_APO_EPO_1,DT_SML_APO_EPO_2,DT_SML_APO_EPO_3,"+                                   
                         "VA_SML_APO_EPO_1,VA_SML_APO_EPO_2,VA_SML_APO_EPO_3,VA_SML_BPD) VALUES"+
                         "(sysdate,'"+participante.getNumEletros()+"',"+simu.getReservaMatematica()+","+simu.getAporteInicial()+","+participante.getSalarioAtual()+","+
                          simu.getCrescimentoSalarial()+","+simu.getAnoRest2()+","+ simu.getAnoRest1() +",to_date('"+simu.getDataRest().toString()+"','dd/mm/yyyy'),"+
                          simu.getRentAnual1()+","+simu.getRentAnual2()+","+simu.getContribuicaoMin()+","+simu.getContribuicaoMAx()+",'"+simu.getSNumAporte()+"','"+
                          simu.getOptAporteContribuicao()+"',"+formatter.format(simu.getAporteEnt())+","+formatter.format(relatorio.getSaldo())+","+formatter.format(relatorio.getRendaVitalicia())+","+formatter.format(relatorio.getRendaProgramada())+",to_date('"+simu.getDataAporte1().toString()+"','dd/mm/yyyy'), to_date('"+simu.getDataAporte2().toString()+"','dd/mm/yyyy'), to_date('"+simu.getDataAporte3().toString()+"','dd/mm/yyyy'),"+simu.getAporte1()+","+simu.getAporte2()+","+simu.getAporte3()+","+formatter.format(simu.getReservaBpds())+")";
           }
           else {
               command ="INSERT INTO SML_ELET_BD(TS_SML,NU_PTI_ICR,VA_SML_RSV_MGR,VA_SML_CRE_ADI,"+
                           "VA_SML_SAL,PC_SML_CRM_SAL,VA_SML_ID_APS,VA_SML_TMP_CBU,DT_SML_BNF,"+
                           "PC_SML_RNT_MED_PZ,PC_SML_RNT_LNG_PZ,PC_SML_CBU_MMO,PC_SML_CBU_MAX,"+                                     
                           "FL_SML_APO_EXA,DE_SML_PER,VA_SML_APO_EXA,VA_SML_SLD_ACU,VA_SML_REN_VTL,"+
                           "VA_SML_REN_CER,DT_SML_APO_EPO_1,DT_SML_APO_EPO_2,DT_SML_APO_EPO_3,"+                                   
                           "VA_SML_APO_EPO_1,VA_SML_APO_EPO_2,VA_SML_APO_EPO_3,VA_SML_BPD) VALUES"+
                           "(sysdate,'"+participante.getNumEletros()+"',"+simu.getReservaMatematica()+","+simu.getAporteInicial()+","+participante.getSalarioAtual()+","+
                            simu.getCrescimentoSalarial()+","+simu.getAnoRest2()+","+ simu.getAnoRest1() +",NULL,"+
                            simu.getRentAnual1()+","+simu.getRentAnual2()+","+simu.getContribuicaoMin()+","+simu.getContribuicaoMAx()+",'"+simu.getSNumAporte()+"','"+
                            simu.getOptAporteContribuicao()+"',"+formatter.format(simu.getAporteEnt())+","+formatter.format(relatorio.getSaldo())+","+formatter.format(relatorio.getRendaVitalicia())+","+formatter.format(relatorio.getRendaProgramada())+",to_date('"+simu.getDataAporte1().toString()+"','dd/mm/yyyy'), to_date('"+simu.getDataAporte2().toString()+"','dd/mm/yyyy'), to_date('"+simu.getDataAporte3().toString()+"','dd/mm/yyyy'),"+simu.getAporte1()+","+simu.getAporte2()+","+simu.getAporte3()+","+formatter.format(simu.getReservaBpds())+")";
                   
           }
           System.out.println(command);
           stmt.executeUpdate(command);
     
        }
        catch(SQLException e)
        {
              e.printStackTrace();
              throw new Exception("Erro ao adicionar a simulacao");
        }
        finally
        {
              if( conn != null)
                conn.close();  
        }
    }
    
    
    /**
     *  Apaga a simulacao selecionada pelo participante
     *  @throws SQLException
     */
    public void deleteSimulacao(String dataSimulacao)
      throws Exception
    {
      Connection conn = null;
      try 
      {
         //System.out.println("1");
         conn = getConnection();
         //System.out.println("2");
         System.out.println(dataSimulacao);
         Statement stmt  = conn.createStatement();
        
         String  command ="DELETE FROM SML_ELET_BD WHERE to_char(TS_SML,'dd/mm/yyyy') = '"+ dataSimulacao +"' AND NU_PTI_ICR='"+ participante.getNumEletros() + "'";

         System.out.println(command);
         stmt.executeUpdate(command);

      }
      catch(SQLException e)
      {
            e.printStackTrace();
            throw new Exception("Erro ao apagar a simulacao");
      }
      finally{
            if( conn != null)
              conn.close();  
      }

    }
    
    
    /**
    *  retorna uma conexão do pool de conexão
    *  @returns java.sql.Connection
    *  @throws SQLException
    */
    private Connection getConnection()
     throws SQLException
    {
     Connection conn = null;
     try 
     {                
           InitialContext initContext = new InitialContext();         
           //Context envContext  = (Context)initContext.lookup("java:/comp/env");             
           DataSource ds = (DataSource)initContext.lookup("java:/jdbc/OracleSimuladorElet");              
           conn = ds.getConnection();         
     }
     catch(NamingException ne)
     {                        
        System.out.println(ne.toString());            
     }
     return conn;
    }
}
