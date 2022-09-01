package simuladorElet;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;
import EJB.Eletros.*;
import javax.rmi.*;
import com.eletros.*;

/**
 * Classe responsável por buscar na base de dados o responsável pela
 * natureza da sistema, e atualiza o responsável pela solicitação
 */
public class RespNaturezaDAO 
{
  String natureza;
  String jndi;
  
  
  /**
   * Cosntrutor simples 
   */
  public RespNaturezaDAO(String natureza,String jndi)
  {
    this.natureza = natureza;
    this.jndi = jndi;
  }
  
  
  /**
   * Verifica se o usuario é responsavel pela natureza recebida no construtor.
   */
  public boolean verificaAdministrador(Usuario usuario)
    throws Exception
  {
      boolean flag = false;
      Connection conn = getConnection();
      
      String query = "SELECT CD_NTZ "+
                     "FROM RPS_ELET_NTZ_SOL A "+
                     "WHERE A.NM_RPS = '"+usuario.getLogin().toUpperCase()+"' "+
                     "AND A.CD_NTZ = '"+natureza+"' "+
                     "AND A.DT_RPS_INI <= SYSDATE "+
                     "AND A.DT_RPS_FIM IS NULL";     
      
      Statement statement = conn.createStatement();
      ResultSet resultado = statement.executeQuery( query );
      if( resultado.next() )
      {
          flag = true;   
      }
      
      resultado.close();
      statement.close();
      closeConnection( conn );
      
      return flag;
  }


  /**
   * Busca uma lista com os responsaveis pela natureza da classe
   * @throws Exception
   * @return uma colecao de obejtos do tipo Usuario
   */
  public Collection buscarResponsaveis()
    throws Exception
  {
     LinkedList responsaveis = new LinkedList();
     
     try
     {
        InitialContext ctx = new InitialContext();
        Object ref = ctx.lookup("UsuarioEJB");
        UsuarioEJBHome home = (UsuarioEJBHome)
                PortableRemoteObject.narrow(ref,UsuarioEJBHome.class);
        UsuarioEJB usuarioEJB = home.create();
     
        Connection conn = getConnection();
        Statement statement = conn.createStatement();
     
        String query = "SELECT * "+
                     "FROM RPS_ELET_NTZ_SOL "+
                     "WHERE CD_NTZ = '"+natureza.toUpperCase()+"' "+
                     "AND DT_RPS_INI <= SYSDATE "+
                     "AND DT_RPS_FIM IS NULL";     
      
        ResultSet result = statement.executeQuery( query );
        System.out.println( query );
        while( result.next())
        {
           String nome = result.getString("NM_RPS");
           Usuario responsavel = usuarioEJB.buscarUsuarioLogin( nome );
           responsaveis.add(responsavel);
        }

        result.close();
        statement.close();
        closeConnection( conn );
        
     }
     catch(Exception e)
     {
        e.printStackTrace();
        throw new Exception("Ocorreram erros ao se tentar buscar o nome e o e-mail do"+
             " responsável pela natureza "+natureza);
     }
     return responsaveis;
  }

  
  /**
   * Atualiza na base de dados o responsável pela natureza da solicitação
   * representada pelo atributo da classe <tt>natureza</tt>. Cadastra o usuario 
   * <tt>responsavel</tt> com a data final nula.
   */
  public void atualizarResponsavel(String responsavel, String dataInicio)
     throws Exception
  {
     try
     {
       Connection conn = getConnection();
     
       Statement statement = conn.createStatement();
       String query = "INSERT INTO RPS_ELET_NTZ_SOL "+
                     "VALUES('"+natureza+"','"+responsavel+"',"+
                     "TO_DATE('"+dataInicio+"','DD/MM/YYYY'),NULL)";
     
       statement.executeUpdate( query );
     
       statement.close();
       closeConnection( conn );
     }
     catch(Exception e)
     {
       e.printStackTrace();
       throw new Exception("Ocorreram erros ao se inserir um novo responsável "+
                "pela natureza "+natureza);
     }
  }

  
  /**
   * Atualiza na base de dados o responsável pela natureza do sistema.
   * Coloca a data fim para a data atual. Finalizando assim a responsabilidade do usuario
   * para com o sistema.
   */
  public void removerResponsavel(String responsavel)
     throws Exception
  {
     try
     {
       Connection conn = getConnection();
     
       Statement statement = conn.createStatement();
       String query = "UPDATE RPS_ELET_NTZ_SOL SET DT_RPS_FIM = SYSDATE "+
                     "WHERE CD_NTZ = 'MFER' AND NM_RPS = '"+responsavel.toUpperCase()+"'";
     
       statement.executeUpdate( query );
     
       statement.close();
       closeConnection( conn );
     }
     catch(Exception e)
     {
       e.printStackTrace();
       throw new Exception("Ocorreram erros ao se tentar remover o responsável "+
                "pela natureza "+natureza);
     }
  }
  
  
  /**
   *  Retorna uma conexão 
   */
  public Connection getConnection()
   throws SQLException
  {
    Connection conn = null;
       try 
       {		
             InitialContext initContext = new InitialContext();		
             //Context envContext  = (Context)initContext.lookup("java:/comp/env");		
             DataSource ds = (DataSource)initContext.lookup(jndi);		
             conn = ds.getConnection();		
       }
       catch(NamingException ne)
       {			
          System.out.println(ne.toString());		
       }
       return conn;  
  }
    
    
  /**
   *  fecha a conexão aberta.
   */
  public void closeConnection(Connection conn)
    throws Exception
  {
    try
    {
      conn.close();
      System.out.println("Conexão Fechada");
    }
    catch(SQLException e)
    {
      e.printStackTrace();
      throw new Exception("Erro ao fechar a conexão");
    }
  }
}