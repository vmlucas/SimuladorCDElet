<?xml version="1.0" encoding="windows-1252" ?>
<%@ page import="simuladorElet.*, com.eletros.benef.*, com.util.*" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%
       Modelo modelo = (Modelo)request.getAttribute("modelo");
       
       Relatorio rel = (Relatorio)request.getAttribute("relat");
       ResumoMigracao resumo = (ResumoMigracao)request.getAttribute("resumo");
%>
<resumo>
    <nomeParticipante>
        <%=modelo.getParticipante().getNome() %>
    </nomeParticipante>
    <numEletros>
        <%=modelo.getParticipante().getNumEletros() %>
    </numEletros>
    <lista_opcao>
        <opcao>
            <nome>
               100% BPDS 
            </nome>
            <total1>
              <valorBPDS>
                <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                     <%=modelo.getBpds() %> 
                </fmt:formatNumber>
              </valorBPDS>
              <valorRendaProgramada>
                  <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                      <%=resumo.getRendaProgramadaNova() %> 
                  </fmt:formatNumber>
              </valorRendaProgramada>
              <valorTotal>
                  <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                      <%=resumo.getRendaProgramadaNova() + modelo.getBpds() %> 
                  </fmt:formatNumber>
              </valorTotal>
            </total1>
            <total2>
              <valorBPDS>
                <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                     <%=modelo.getBpds() %> 
                </fmt:formatNumber>
              </valorBPDS>
              <valorRendaVitalicia>
                  <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                      <%=resumo.getRendaVitaliciaNova() %>   
                  </fmt:formatNumber>
              </valorRendaVitalicia>
              <valorTotal>
                  <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                      <%=resumo.getRendaVitaliciaNova()+ modelo.getBpds() %> 
                  </fmt:formatNumber>
              </valorTotal>
            </total2>
        </opcao>
        <opcao>
            <nome>
               50% BPDS 
            </nome>
            <total1>
              <valorBPDS>
                <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                     <%=modelo.getBpds()/2.0 %> 
                </fmt:formatNumber>
              </valorBPDS>
              <valorRendaProgramada>
                  <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                      <%=resumo.getRendaProgramadaNovaMetade() %> 
                  </fmt:formatNumber>
              </valorRendaProgramada>
              <valorTotal>
                  <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                      <%=resumo.getRendaProgramadaNovaMetade() + (modelo.getBpds()/2.0) %> 
                  </fmt:formatNumber>
              </valorTotal>
            </total1>
            <total2>
              <valorBPDS>
                <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                     <%=modelo.getBpds()/2.0 %> 
                </fmt:formatNumber>
              </valorBPDS>
              <valorRendaVitalicia>
                  <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                      <%=resumo.getRendaVitaliciaNovaMetade() %>   
                  </fmt:formatNumber>
              </valorRendaVitalicia>
              <valorTotal>
                  <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                      <%=resumo.getRendaVitaliciaNovaMetade()+ (modelo.getBpds()/2.0) %> 
                  </fmt:formatNumber>
              </valorTotal>
            </total2>
        </opcao>
        <opcao>
            <nome>
               100% CD 
            </nome>
            <valorRendaProgramada>
                  <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                      <%=rel.getRendaProgramada() %>
                  </fmt:formatNumber>
              </valorRendaProgramada>
            <valorRendaVitalicia>
                  <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                      <%=rel.getRendaVitalicia() %>  
                  </fmt:formatNumber>
              </valorRendaVitalicia>
        </opcao>
    </lista_opcao>    
</resumo>

                   
                        
               