<?xml version="1.0" encoding="windows-1252" ?>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="simuladorElet.*, com.eletros.benef.*, com.util.*" %>



<%

            Modelo modelo = (Modelo) request.getAttribute("modelo");
            Relatorio rel = (Relatorio) request.getAttribute("relat");
            Simulacao simu = (Simulacao)request.getAttribute("simulacao");
            //Participante participante = modelo.getSimulacao().getParticipante();
%>

<simulacao>
    <erro>
        <%=(String)request.getAttribute("erro") %>
    </erro>
    <participante>
        <idadeBenef>
            <meses>
                <%=((rel.getIdade() + rel.getTempoCont()) % 12)%> 
            </meses>
            <anos>
                <%=((rel.getIdade() + rel.getTempoCont()) / 12)%> 
            </anos>
        </idadeBenef>
        <salarioBenef>
            <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                <%=rel.getSalarioFinal()%> 
            </fmt:formatNumber>
        </salarioBenef>
        <contribFinal>
            <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                <%=rel.getContFinal()%> 
            </fmt:formatNumber>
        </contribFinal>
    </participante>   
    <saldoContribObrigatorias>
        <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
            <%=rel.getContAcum()%> 
        </fmt:formatNumber>
    </saldoContribObrigatorias>
    <saldoContribOpcionais>
        <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
            <%=rel.getAporteTotal()%> 
        </fmt:formatNumber>
    </saldoContribOpcionais>
    <saldoInicialProjetado>
        <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
            <%=rel.getReservaMigracao()%> 
        </fmt:formatNumber>
    </saldoInicialProjetado>
    <saldoTotal>
        <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
            <%=rel.getSaldo()%> 
        </fmt:formatNumber>
    </saldoTotal>
    <rendaVitalicia>
        <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
            <%=rel.getRendaVitalicia()%> 
        </fmt:formatNumber>
    </rendaVitalicia>
    <!--percentual da reserva acumulada para gerar a renda vitalícia -->
    <percentRendaVitalicia>
        <%=rel.getPercentual()%>   
    </percentRendaVitalicia>
    <rendaProgramada>
        <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
            <%=rel.getRendaProgramada()%> 
        </fmt:formatNumber>
    </rendaProgramada>
    <!-- periodo q o participante vai receber o benefício -->
    <periodoBenfEletros>
        <% int aux = simu.getIdadeAposentadoria();
            int idade = rel.getIdade();
            int tempoCont = rel.getTempoCont();

            int periodoBeneficio1 = (((aux * 12) - ((idade + tempoCont))) / 12);
            int periodoBeneficio2 = (((aux * 12) - (idade + tempoCont)) % 12);


        %>
        <anos>
            <%=periodoBeneficio1%>
        </anos>
        <meses>
            <%=periodoBeneficio2%>
        </meses>
    </periodoBenfEletros>
</simulacao>

