package simuladorElet;

import com.eletros.*;

/**
 * Classe responsavel por verificar se o usuario logado na intranet é um administrador da
 * natureza SIMULELET.
 * Se caso ele for, ele pode usar o simulador como qualquer participante.
 */
public class AjusteModelo 
{

  private Usuario usu;
  private RespNaturezaDAO resp;
  
  /**
   * Construtor da classe
   * 
   * @throws java.lang.Exception
   * @param params
   * @param usuario
   */
  public AjusteModelo(Usuario usuario, String jndi)
    throws Exception
  {
     usu = usuario;
     resp = new RespNaturezaDAO("SIMUELET",jndi);
  }
  
  /**
   * Verifica se o usuário logado na intranet, é um administrador do sistema.
   * 
   * @throws java.lang.Exception
   */
  public void verificaInstanciaModelo()
    throws Exception
  {
     if(!resp.verificaAdministrador(usu))
     {
        throw new Exception("Acesso n&atilde;o permitido.");
     }
     
  }
}