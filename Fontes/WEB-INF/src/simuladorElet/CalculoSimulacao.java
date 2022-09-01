package simuladorElet;


import com.util.DataEletros;

import java.text.DecimalFormat;

import java.util.*;

/**
 * Classe responsável em fazer os cálculos necessários para elabora uma simulação
 * do plano CD - Eletrobrás.
 */
public class CalculoSimulacao 
{

        private Simulacao simulacao;
        private GregorianCalendar dataHoje = new GregorianCalendar();
        private double salarioFinal;
        private int tempo_contribuicao=0;
        
        // idade media de aposentadoria
        private final double sobrec_adm  = 0.03;
        private final double benef_risco = 0.086;
        private double rentAnual;
        private final static double rentMensal = 0.005;
        //todo mes de maio a URP deve ser atualizada. 
        private final double udp = 3156.80;
        // tempo_medio de contribuicao é de cinco anos
        public static final int tempo_medio = 60;
        
    //começa na indade 0, corresponde a posicao 0 do vetor
    private static final int[] expectVida = 
                            {81,80,79,78,77,76,75,74,73,73,72,71,70,69,68,67,
                             66,65,64,63,62,61,60,59,58,57,56,55,54,53,52,51,
                             50,49,48,47,46,45,45,44,43,42,41,40,39,38,37,36,
                             35,34,33,32,32,31,30,29,28,27,26,25,25,24,23,22,
                             21,21,20,19,18,17,17,16,15,15,14,13,13,12,12,11,
                             11,10,10,9,9,8,8,7,7,7,6,6,6,5,5,5,5,5,4,4,4,4,
                             3,3,3,3,3,3,2,2,2,2,2,2,2,1};
                             
    

       /**
        * Cosntrutor da classe
        * Usa como parametro um objeto do tipo Simulacao com os parametros
        * de entrada.
        * @param simu
        */
        public CalculoSimulacao(Simulacao simu)  
        {
	    this.simulacao = simu;
	    rentAnual = Math.pow((1+rentMensal),12)-1;
	    salarioFinal = simulacao.getParticipante().getSalarioAtual();
	}


        /**
         * Retorna um relatório com o resultado da simulação
         */
        public Relatorio geraSimulacao() 
          throws Exception
        {
        
            //System.out.println("prazo renda certa "+simulacao.getIdadeAposentadoria()); 
            
            Relatorio relatorio = new Relatorio();
            relatorio.setSimulacao( simulacao );
            
            //idade do participante em meses
            int idade = calculoIdade();
            relatorio.setIdade( idade );
            
            //tempo de contribuicao em meses
            int tempo_contrib = calculoTempoContribuicao( idade );
            relatorio.setTempoCont( tempo_contrib );
            
            //calculo da taxaMensal
            double tx_1 = 1.0 + ( simulacao.getRentAnual1() / 100.00);
            double x    = 1.0/12.0;
            double taxa_mensal1 = Math.pow(tx_1,x);
            
            double tx_2 = 1.0 + ( simulacao.getRentAnual2() / 100.00);
            double taxa_mensal2 = Math.pow(tx_2,x);
            
            //calculo da contribuicao bruta
            double contribuicao_bruta = calculoContribuicaoBruta();
            relatorio.setContBruta( contribuicao_bruta );
            
            //calculo da contribuicao acumulada
            double contrib_acum = calculoContribuicaoAcumulada(idade, tempo_contrib);
            relatorio.setContAcum( contrib_acum );
            
            //calculo aporte inicial
            double aporteInicial = this.calculoAporteInicial(tempo_contrib, taxa_mensal1, taxa_mensal2);
            relatorio.setAporteIni( aporteInicial );
            
            
            //calculo aporte extra
            double aporteExtra = this.calculoAporteExtra(tempo_contrib, taxa_mensal1, taxa_mensal2);
            relatorio.setAporteExtra(  aporteExtra );
            relatorio.setAporteTotal( aporteExtra + aporteInicial );
            
            //calculo da reserva de migracao acumulada nos anos de contribuição
            double reservaMigracaoAcumulada = calculoReservaMigracao(tempo_contrib, taxa_mensal1, taxa_mensal2);
            relatorio.setReservaMigracao( reservaMigracaoAcumulada );
            
            //calcula o saldo
            double saldo = reservaMigracaoAcumulada + contrib_acum + aporteExtra + aporteInicial;
            relatorio.setSaldo( saldo );
            
            /**
             * calcula os fatores para o participante e para o dependente mais novo. 
            */
            double prazoRCMes = (simulacao.getIdadeAposentadoria()*12) - (idade + tempo_contrib);
            
            //verifica se o prazoRCMes é menor ou igual a zero. NÂO PODE, pois diz q o participante vai contribuir
            //mais do q receber.
            if( prazoRCMes <= 0.0 ) {
                throw new Exception( "Prazo de renda certa menor ou igual a 0 meses");
            }
            double prazoRCAno = prazoRCMes/12.0;
            relatorio.setIdadeVitalicia( prazoRCAno );
            
            double fatorRC = calculaFatorExpectativaVida( prazoRCAno );
            
            /**ATENÇÃO
             * ver se tem dependente, se nao ver expectativa de vida do participante ao final da Renda certa
            */
            Double idadeFimRC  = 0.0;
            int expectativaVidaFimRC = 0; 
            if( simulacao.isContrataPensao())
            {
               if( (simulacao.getIdadeDependente()*12) < (idade + tempo_contrib)  )
               {
                  idadeFimRC  = 
                    new Double((simulacao.getIdadeDependente()*12)  + prazoRCMes);
                  idadeFimRC = idadeFimRC/12.0;
                  
                   expectativaVidaFimRC = buscaExpectativaVida( idadeFimRC.intValue() )+3;
               }
               else 
               {
                   idadeFimRC = new Double( simulacao.getIdadeAposentadoria()); 
                   expectativaVidaFimRC = buscaExpectativaVida( idadeFimRC.intValue() );
               }
            }
            else 
            {
                idadeFimRC = new Double( simulacao.getIdadeAposentadoria());
                expectativaVidaFimRC = buscaExpectativaVida( idadeFimRC.intValue() );
            }
            
            //System.out.println("idadeFimRC "+idadeFimRC);
            double fatorRV = calculaFatorExpectativaVida( expectativaVidaFimRC );
            
            relatorio.setFatorParticRendaCerta( fatorRC );
            
            /**
             * calcula o valor a ser descontado do saldo para cobrir a renda vitalicia
             */
            double descontoSaldo = calculaDescontoSaldo(saldo, fatorRC,fatorRV,prazoRCAno);
            
             
            /**
             * CALCULO DO percentual de contribuição
             */
            double percentualContrib = descontoSaldo/saldo;
            relatorio.setPercentual( percentualContrib*100 );
            
            /**
             * Calculo da RENDA VITALÍCIA
             */
            double renda_vitalicia = (saldo - descontoSaldo)/fatorRC;
            relatorio.setRendaVitalicia( renda_vitalicia );
            
            /**
             * Cálculo da RENDA PROGRAMADA
             */
            double renda_programada = (saldo / fatorRC );
            relatorio.setRendaProgramada( renda_programada );
            
            double contFinal      = 0.0;            
            // Esse valor é referencial a UNP. 
            if (salarioFinal <= 2625.50)
            {
                contFinal = ((simulacao.getContribuicaoMin() * salarioFinal)/100);
            }
            else 
            {
                contFinal = (((simulacao.getContribuicaoMAx() * salarioFinal)/100)- (((simulacao.getContribuicaoMAx()-simulacao.getContribuicaoMin())*(2625.50))/100));
            }
            relatorio.setSalarioFinal( salarioFinal );
            relatorio.setContFinal( contFinal );
            
            return relatorio;        
        }
        
        
       /**
        * Calcula uma nova simulacao baseada na nova renda desejada pelo participante
        * @param rendaDesejada
        * @return
        */
        public Relatorio geraNovaRenda( double rendaDesejada ) 
          throws Exception
        {
            Relatorio relatorio = geraSimulacao();
            
            relatorio.setNovaRendaDesejada( rendaDesejada );
            
            double taxaAnualMedia   = calculaTaxaAnualMedia( relatorio.getTempoCont());
            
            /**Esse método irá recalcular o saldo de acordo com a Renda desejada pelo cliente e
             **irá retornar o que é necessário ser feito
             */
            double saldoAcumNovo = 
               ((rendaDesejada * relatorio.getFatorParticRendaCerta())/(1-relatorio.getPercentual()/100)) ;
            
            //double a  = (1+taxaAnualMedia);
            double txEqPer = Math.pow((1.0+taxaAnualMedia),(1.0/12.0))-1;

            /**
             * Calcula o saldo acumulado com os novos parametros
             */
            double saldo = relatorio.getSaldo() * (Math.pow((1+txEqPer),(-relatorio.getTempoCont())));
            /**
             * saldo acumulado tomando por base a nova renda
             */ 
            double saldoNovaRenda = saldoAcumNovo * (Math.pow((1+txEqPer),(-relatorio.getTempoCont())));
            double difSaldoAcumAtual = saldoNovaRenda-saldo;
            
            double pgto = 
               ((difSaldoAcumAtual * txEqPer * Math.pow((1+txEqPer),relatorio.getTempoCont()))/ ((Math.pow((1+txEqPer),relatorio.getTempoCont()))-1)/(1-sobrec_adm));
	
            relatorio.setContribuicaoMensalNovaRenda( pgto );
            
            return relatorio;        
        
        }
        
        
      /**
      * Calcula a projeção de contribuição e renda para os proximos 5 anos.
      * 
      * @param rendaDesejada
      * @param tempoCont
      * @return uma lista com Varios Calculos de simulação( objeto CalculoSimulacao),
      * uma para cada ano.
      */
      public java.util.List<Relatorio> calculoProjecao(double rendaDesejada, int tempoCont) 
        throws Exception
      {
        tempoCont = tempoCont + 12;
        
        if (tempoCont <= tempo_medio) 
              simulacao.setRentAnual2(0);
        
        ArrayList<Relatorio> list = new ArrayList<Relatorio>();

        for (int i=0; i<5 ; i++)
        {
           tempo_contribuicao = tempo_contribuicao + ((i+1)*12);    
           salarioFinal = simulacao.getParticipante().getSalarioAtual();
            
           Relatorio rel = geraNovaRenda( rendaDesejada );
        
           list.add(rel);
           tempo_contribuicao = 0;
        }
        
        return list; 
      }
  
  
    /**
     * Calcula o valor a ser descontado da reserva do participante, para cobrir
     * um benefício vitalício. Que pode ser maior q o benefício de Renda Certa 
     * previamente definido pelo participante.
     * 
     * Esse valor se da pela razao absoluta de R1-R2 <= 0.00001, onde
     * 
     * R1 = (Reserva - valor)/Fator(tempoRendaCerta)      
     * R2 = valor * ( 1 + i2 )^m, onde     
     * i2 = ( 1 + i )^1/12 
     * m = tempoRendaCerta*12
     * 
     * @param saldo
     * @param fatorPartic - Fator( tempoRendaCerta)
     * @param fatorDepend
     * @param prazoRendaCertaMes - prazo de renda certa em meses
     * @return saldo, fatorRC,fatorRV,prazoRCMes
     */
      private double calculaDescontoSaldo(double saldo, double fatorRCerta, double fatorRVit, double prazoRendaCerta) 
      {
         
         double descontoSaldo = saldo/2;
         double limS = saldo;
         double limI = 0.0;
         boolean flag = true;
         
         double aux = (1+ rentAnual);
         double aux3 = 1.0/12.0;
         double i2 = (Math.pow(aux,aux3))-1;
         i2 = i2+1;
         prazoRendaCerta = prazoRendaCerta*12.0;
         
         while( flag )
         {
             double r1 = (saldo - descontoSaldo)/fatorRCerta;    
             double r2 = ( descontoSaldo*Math.pow(i2,prazoRendaCerta))/ fatorRVit; 
             
             System.out.println( "Desc "+descontoSaldo+" R1 "+r1+" R2 "+r2+" Razao "+(r1-r2));
             double razao = Math.abs(r1-r2);
             if(  razao <= 0.00001 )
             {
               flag = false;
             }
             else
             {
               if( r1 > r2) {
                 limI = descontoSaldo;
                 double t = limS - limI;                 
                 descontoSaldo = descontoSaldo + (t/2.0);  
               }
               else{
                 limS = descontoSaldo;
                 double t = limS - limI;
                 descontoSaldo = descontoSaldo - (t/2.0);
               }
             }
         }
         
         return descontoSaldo;
      }
      
      
    /**
     * Fator q calcula a expectativa de vida levndo em conta um prazo de renda.
     * 
     * Fator = [(1 - V^n/12)/i] + [ (1 - V1^n1)/i1  ], onde
     * 
     * i = taxa anual de rendimento
     * i1 = [( 1 + i )^1/12 ] - 1
     * V1 = 1 / (1 + i1)
     * n1 = n * 12
     * n = prazo em anos
     * V = 1 / (1 + i) 
     * 
     * @param prazoRendaCerta
     * @return
     */
      private double calculaFatorExpectativaVida( double prazoRendaCerta) {
          /**
           * CALCULO DO C3 ***nao sei o q é C3
           */ 
          double c3 = 0.0;
          if (prazoRendaCerta > 0)
          {
             double aux = (1+ rentAnual);
             double aux3 = 1.0/12.0;
             double i2 = (Math.pow(aux,aux3))-1;
             
             double v1 = 1/aux;
             double v2 = 1/(1+i2);
             
             double n2 = prazoRendaCerta*12;
             double exp1 = (Math.pow(v1,prazoRendaCerta));
             double aux1 = ((1-exp1)/rentAnual);
             double exp2 = (Math.pow(v2,n2));
             double aux2 = ((1-exp2)/i2);

             c3 = aux1 + aux2 ;
          }
          
          return c3;
      }
  
  
      private int buscaExpectativaVida( int idade) {
          if( idade > (expectVida.length-1))
             return 1;    
          else return expectVida[idade];    
      }
      
      
      private int calculoTempoContribuicao( int idadeMeses)
      {
          DataEletros dataRest =  simulacao.getDataRest();
                      
          int ano_atual= dataHoje.get(Calendar.YEAR);
	  // Soma-se mais um pq o mes que o calendar pega é o ultimo passado e nao o atual
	  int mes_atual= (dataHoje.get(Calendar.MONTH)+1);
           
                    
          if (simulacao.getAnoRest1() != 0)
          {
            tempo_contribuicao = tempo_contribuicao + simulacao.getAnoRest1() * 12 ;
          }
          else 
          {
	     if(simulacao.getAnoRest2() != 0) 
             {
	 	tempo_contribuicao = tempo_contribuicao + (simulacao.getAnoRest2() * 12) - idadeMeses ;
             } 
             else
             {
               int i = mes_atual;

	       for (;ano_atual<= dataRest.getAno(); ano_atual++)
               {
			for (; i<13 ; i++)
                        {
			   tempo_contribuicao ++;
			   if ((i==dataRest.getMes()) && (ano_atual == dataRest.getAno())) 
                              break;
			}
			i = 1;
               }
             }
	   }

	   System.out.println(" Tempo de Contribuicao do Tempo de Contribuicao: " + tempo_contribuicao);
	   return tempo_contribuicao;
         
        }


    	/* Esse método irá calcular a idade do participante e tranformá-la para meses */
	private int calculoIdade() 
        {
           int ano_atual= dataHoje.get(Calendar.YEAR);
           // Soma-se mais um pq o mes que o calendar pega é o ultimo passado e nao o atual
           int mes_atual= (dataHoje.get(Calendar.MONTH)+1);
           int dia_atual= (dataHoje.get(Calendar.DAY_OF_MONTH));
           
           DataEletros dataNasc = 
                   new DataEletros(simulacao.getParticipante().getDtNascimento().getTime());
                      
           int idade=0;
      	   if(mes_atual >= dataNasc.getMes()){
           if(dia_atual < dataNasc.getDia())
		    idade = (((ano_atual - dataNasc.getAno())*12) + ((mes_atual-1) - dataNasc.getMes())) ;
		   else
		    idade = (((ano_atual - dataNasc.getAno())*12) + ((mes_atual) - dataNasc.getMes())) ;
		 }else
		   if(dia_atual < dataNasc.getDia())
	        idade = (((ano_atual-1 - dataNasc.getAno())*12) + (12 - (dataNasc.getMes()-(mes_atual-1)))) ;
	       else
            idade = (((ano_atual-1 - dataNasc.getAno())*12) + (12 - (dataNasc.getMes()-(mes_atual)))) ;

           return idade;
       }


       public double calculoContribuicaoBruta()
       {
           System.out.println("Salario final renda desejada loop:"+salarioFinal);
           double contribuicao_bruta;
           
           if (salarioFinal<= udp)
             contribuicao_bruta = (4.5/100.0 * salarioFinal)*(simulacao.getContribuicaoMin()/4.5);
           else
             contribuicao_bruta = ((15.0/100.0 * salarioFinal)- (10.5/100.0*udp))*(simulacao.getContribuicaoMAx()/15.0);
          
           //System.out.println("Contribuicao Bruta:" + contribuicao_bruta);
           return contribuicao_bruta;
       }


       private double calculoContribuicaoAcumulada(int idade,int tempo_contrib )
       {

            int aux  = (dataHoje.get(Calendar.MONTH)+1);;
            int cont = 0;
            int idadeAux = idade+1;
            int paridade = 2;
            //paridade
            if( idadeAux >= 780)
               paridade=1;
            
            double contribuicao_acumulada = 0.0;
            double crescimentoSalarial = simulacao.getCrescimentoSalarial( ); 
               
            double tx_1 = 1.0 + ( simulacao.getRentAnual1() / 100.00);
            double x    = 1.0/12.0;
            double taxa_mensal1 = Math.pow(tx_1,x);
            double tx_2 = 1.0 + ( simulacao.getRentAnual2() / 100.00);
            double taxa_mensal2 = Math.pow(tx_2,x);
            
            if (tempo_contrib <=tempo_medio)
            {
                for(int j = 1; j<=tempo_contrib; j++,idadeAux++ )
                {

                     if (cont == 12)
                     {
                        salarioFinal = 
                           ((salarioFinal * crescimentoSalarial)/100.0) + salarioFinal ;
                        cont = 0;
                     }
                     cont ++ ;

                     if (aux == 12 )
                     {
                          double aux2 = ((2*paridade) * 
                                         (this.calculoContribuicaoBruta()) * (1- sobrec_adm - benef_risco));
                          contribuicao_acumulada = (contribuicao_acumulada * (taxa_mensal1) + aux2);
                          //Calculando o crescimento salarial ...
                          aux = 1;
                     }
                     else
                     {
                          double aux2 = ((1*paridade) * 
                                          (this.calculoContribuicaoBruta()) * (1- sobrec_adm - benef_risco));
                          contribuicao_acumulada = (contribuicao_acumulada * (taxa_mensal1)) + aux2;
                          aux ++;
                     }
                }
            }
            else
            {

                /* A taxa mensal 1 será utilizada quando o participante escolher a contribuicao menor ou igual a 5 anos,
                   Após 5 anos será utilizada a taxa mensal 2.*/
               for(int j = 1; j<=tempo_contrib; j++,idadeAux++ )
               {
                      if (j <= tempo_medio)
                      {
                           if (cont == 12)
                           {
                              salarioFinal = 
                                 ((salarioFinal * crescimentoSalarial)/100.0) + salarioFinal;
                              cont = 0;
                           }
                           cont ++ ;

                           // O numero doze é apenas o mes de dezembro.
                           if (aux == 12 )
                           {
                                double aux2 = 
                                  ((2*paridade) * this.calculoContribuicaoBruta() * (1- sobrec_adm - benef_risco));
                                contribuicao_acumulada = (contribuicao_acumulada * (taxa_mensal1)) + aux2;
                                aux = 1;
                           }
                           else
                           {
                               double aux2 = 
                                  ((1*paridade) * this.calculoContribuicaoBruta() * (1- sobrec_adm - benef_risco));
                               contribuicao_acumulada = (contribuicao_acumulada * (taxa_mensal1)) + aux2;
                               aux ++;
                           }
                      }
                      else
                      {
                           if (cont == 12)
                           {
                               salarioFinal = 
                                  ((salarioFinal * crescimentoSalarial)/100.0) + salarioFinal;
                               cont = 0;
                           }
                           cont ++ ;

                           if (aux == 12 )
                           {
                               double aux2 = 
                                  ((2*paridade) * this.calculoContribuicaoBruta() * (1- sobrec_adm - benef_risco));
                               contribuicao_acumulada = (contribuicao_acumulada * (taxa_mensal2)) + aux2;
                               aux = 1;
                           }
                           else
                           {
                               double aux2 = 
                                   ((1*paridade) * this.calculoContribuicaoBruta() * (1- sobrec_adm - benef_risco));
                               contribuicao_acumulada = (contribuicao_acumulada * (taxa_mensal2)) + aux2;
                               aux ++;
                           }


                       }
               }
            }
            return contribuicao_acumulada;
        }	

	
       /** Utilizar as taxas da mesma maneira da contribuicao, levando em conta o tempo de contribuicao.
           O aporte inicial é o Credito Inicial na Migração .
        */
        private double calculoAporteInicial(int tempo_contrib, double taxa_mensal1, double taxa_mensal2 )
        {
           double aporteInicial = simulacao.getAporteInicial();
           double a = (1-sobrec_adm);
           double aporteInicialAux =  aporteInicial;
           double b = ((taxa_mensal1) * a);
           //System.out.println("A*B: " + b);

           //System.out.println("Tempo Contribuicao: " + tempo_contribuicao);
           for(int j = 1; j<=tempo_contrib; j++)
           {
                 if (j==1)
                     aporteInicialAux = aporteInicialAux * (1-sobrec_adm);

                 if (j <= tempo_medio)
                 {
                      if (j != 1)
                     // aporteInicial valor inicial...
                     aporteInicialAux = aporteInicialAux * (taxa_mensal1);
                 }
                 else
                     aporteInicialAux = aporteInicialAux * (taxa_mensal2);
           }
           return aporteInicialAux;
         }//fecha  funcao

    
         private double calculoAporteExtra(int tempo_contrib, double taxa_mensal1, double taxa_mensal2 )
         {
               int k = 0;
               //double aporteEnt = simulacao.getAporteEnt();
               String optAporteContribuicao = simulacao.getOptAporteContribuicao();
               double aporteExtraTx  =  simulacao.getAporteEnt();
               double aporteExtra = 0.0;
               
               aporteExtraTx = aporteExtraTx * (1-sobrec_adm);

               for(int j = 1; j<=tempo_contrib; j++)
               {

                 //Isso é por causa do valor inicial do aporte que deve permanecer o mesmo no primeiro mes
                 //if (j !=0){
                 if (j <= tempo_medio)
                 {
                       if (optAporteContribuicao.equals("M"))
                       {
                          aporteExtra = aporteExtraTx + (aporteExtra * (taxa_mensal1));
                       }
                       else
                       {
                          if (optAporteContribuicao.equals("T"))
                          {
                                  k++;
                                  if(k!=3)
                                  {
                                       aporteExtra = (aporteExtra * (taxa_mensal1));
                                  }
                                  else
                                  {
                                       aporteExtra = aporteExtraTx + (aporteExtra * (taxa_mensal1));
                                       k=0;
                                  }
                          }
                          else
                          {
                                  if(optAporteContribuicao.equals("S"))
                                  {
                                      k++;
                                      if(k!=6)
                                      {
                                        aporteExtra = (aporteExtra * (taxa_mensal1));
                                      }
                                      else 
                                      {
                                        aporteExtra = aporteExtraTx + (aporteExtra * (taxa_mensal1));
                                        k=0;
                                      }
                                  }
                                  else
                                  {
                                      if (optAporteContribuicao.equals("A"))
                                      {
                                         k++;
                                         if(k!=12)
                                         {
                                             aporteExtra = (aporteExtra * (taxa_mensal1));
                                         }
                                         else
                                         {
                                             aporteExtra = aporteExtraTx + (aporteExtra * (taxa_mensal1));
                                             k=0;
                                         }
                                      }
                                  }//fecha 3 else
                          }//fecha 2 else
                       }//fecha 1 else
                 }
                 else
                 {
                        if (optAporteContribuicao.equals("M"))
                        {
                             aporteExtra = aporteExtraTx + (aporteExtra * (taxa_mensal2));
                        }
                        else
                        {
                             if (optAporteContribuicao.equals("T"))
                             {
                                   k++;
                                   if(k!=3)
                                   {
                                        aporteExtra = (aporteExtra * (taxa_mensal2));
                                   }
                                   else
                                   {
                                       //System.out.println("Else Trimestral !");
                                       aporteExtra = aporteExtraTx + (aporteExtra * (taxa_mensal2));
                                       k=0;
                                   }
                             }
                             else 
                             {
                                   if(optAporteContribuicao.equals("S"))
                                   {
                                       k++;
                                       if(k!=6)
                                       {
                                            aporteExtra = (aporteExtra * (taxa_mensal2));
                                       }
                                       else
                                       {
                                            aporteExtra = aporteExtraTx + (aporteExtra * (taxa_mensal2));
                                            k=0;
                                       }
                                   }
                                   else
                                   {
                                        if (optAporteContribuicao.equals("A"))
                                        {
                                             k++;
                                             if(k!=12)
                                             {
                                                 aporteExtra = (aporteExtra * (taxa_mensal2));
                                             }
                                             else 
                                             {
                                                 aporteExtra = aporteExtraTx + (aporteExtra * (taxa_mensal2));
                                                 k=0;
                                             }
                                        }
                                   }//fecha 7 else
                             }//fecha 6 else
                        }//fecha 5 else
                       }//fecha 4 else
                 }//fecha 1 for
            aporteExtra = aporteExtra + this.calculoAporteEsporadicos(tempo_contrib, taxa_mensal1, taxa_mensal2);
            
            return aporteExtra;
         }//fecha  funcao */
         
         
         private double calculoAporteEsporadicos(int tempo_contrib, double taxa_mensal1, double taxa_mensal2)
         {
             double pQtd1Double = simulacao.getAporte1();
             double pQtd2Double = simulacao.getAporte2();
             double pQtd3Double = simulacao.getAporte3();
             
             double aporteEsp = 0.0;
             boolean cont     = false;
             int data1 = this.retornarDatasAportes(
                 simulacao.getDataAporte1().getMes(),simulacao.getDataAporte1().getAno());
             int data2 = this.retornarDatasAportes(
                 simulacao.getDataAporte2().getMes(),simulacao.getDataAporte2().getAno());
             int data3 = this.retornarDatasAportes(
                 simulacao.getDataAporte3().getMes(),simulacao.getDataAporte3().getAno());

             for(int j = 1; j<=tempo_contrib-1; j++)
             {

                 if (j<=tempo_medio)
                 {
                    if (j==data1)
                    {
                       aporteEsp  = aporteEsp +(pQtd1Double * (1-sobrec_adm));
                       cont = true;
                    }
                    if (j==data2)
                    {
                       aporteEsp = (aporteEsp* (taxa_mensal1)) + (pQtd2Double * (1-sobrec_adm));
                       cont = true;
                    }
                    if (j==data3)
                    {
                       aporteEsp  = (aporteEsp* (taxa_mensal1)) +(pQtd3Double * (1-sobrec_adm));
                       cont = true;
                    }
                    if (cont == false)
                       aporteEsp = aporteEsp * (taxa_mensal1);
                    else
                       cont = false;
                 }
                 else
                 {
                    if (j==data1)
                    {
                      aporteEsp  = aporteEsp +(pQtd1Double * (1-sobrec_adm));
                      cont = true;
                    }
                    if (j==data2)
                    {
                      aporteEsp = (aporteEsp* (taxa_mensal2)) + (pQtd2Double * (1-sobrec_adm));
                      cont = true;
                    }
                    if (j==data3)
                    {
                      aporteEsp  = (aporteEsp* (taxa_mensal2)) +(pQtd3Double * (1-sobrec_adm));
                      cont = true;
                    }
                    if (cont == false)aporteEsp = aporteEsp * (taxa_mensal2);
                    else cont = false;

                 }

             }
            return aporteEsp;
          }
          
          
          private int retornarDatasAportes(int pMesAporte, int pAnoAporte)
          {

              int data = 0;
              GregorianCalendar calend = new GregorianCalendar();
              int mesAtual = calend.get(Calendar.MONTH)+1;
              int anoAtual = calend.get(Calendar.YEAR);

              data = ((pAnoAporte - anoAtual)*12) + (pMesAporte-mesAtual);
              return data;
          }
          
          
          /** Este método utiliza o tempo de contribuicao, do validate.
           *
           */
          private double calculoReservaMigracao(int tempo_contrib, double taxa_mensal1, double taxa_mensal2)
          {

              //reservaMigracao = simu.getReservaMatematica();
              double rm = simulacao.getReservaMatematica();
              
              for(int j = 1; j<=tempo_contrib;j++)
              {

                   if (j <= tempo_medio)
                   {
                       if (j != 1)
                         rm = rm * (taxa_mensal1);
                   }
                   else
                     rm = rm * (taxa_mensal2);
                  
              }
              return rm;
          }


          /**
           * Taxa anual média será utilizada para recalcular o saldo desejado pelo participante 
           **/
	  private double calculaTaxaAnualMedia(int tempo_contrib)
          {
	        double tx_1 = 1.0 + ( simulacao.getRentAnual1() / 100.00);
	        double tx_2 = 1.0 + ( simulacao.getRentAnual2() / 100.00);
		double per2 = tempo_contrib - tempo_medio;

		double aux1 =((Math.pow(tx_1,(tempo_medio/12))));
		double aux2 =((Math.pow(tx_2,(per2/12))));
		

		double txPer  = (Math.pow((aux1*aux2),(double) (12/(double)tempo_contrib)))-1;
                return txPer;
	  }

          
          public Simulacao getSimulacao() {
            return simulacao;
          }
          



   public static void main (String args[]) {

      Simulacao simu = new Simulacao();
      simu.setContrataPensao(false);
      
      CalculoSimulacao calc = new CalculoSimulacao( simu );
      
      double prazoRendaCerta = 30.0;
      
      double fatorPartic = calc.calculaFatorExpectativaVida( prazoRendaCerta );
      
      int expectativaVidaDepend = 13;
      double saldo = 159632.83;
      
      double fatorDepend = calc.calculaFatorExpectativaVida( expectativaVidaDepend );
      
      /**
       * calcula o valor a ser descontado do saldo para cobrir a renda vitalicia
       */
      double descontoSaldo = calc.calculaDescontoSaldo(saldo, fatorPartic,fatorDepend,prazoRendaCerta*12.0);
      double percentualContrib = descontoSaldo/saldo*100;
      
      /**
       * Calculo da RENDA VITALÍCIA
       */
      double renda_vitalicia = (saldo - descontoSaldo)/fatorPartic;
      
      /**
       * Cálculo da RENDA PROGRAMADA
       */
      double renda_programada = (saldo / fatorPartic );
      
      System.out.println("Desconto no saldo "+descontoSaldo);
      System.out.println("Percentual "+percentualContrib);
      System.out.println("RC "+renda_programada);
      System.out.println("RV "+renda_vitalicia);
      
      
  }


    
}
