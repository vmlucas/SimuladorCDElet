<?xml version="1.0" encoding="windows-1252" ?>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="simuladorElet.*, com.eletros.benef.*, com.util.*, java.util.*" %>



<%

            Modelo modelo = (Modelo) request.getAttribute("modelo");
            Relatorio rel = (Relatorio) request.getAttribute("relatorio");
            //Participante participante = modelo.getParticipante();
            List projecaoList = (List) request.getAttribute("listProjecao");
%>

<simulacao>
    <erro>
        <%=(String) request.getAttribute("erro")%>
    </erro>
    
    <rendaDesejada>
        <valor>  
            <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                <%=rel.getNovaRendaDesejada()%> 
            </fmt:formatNumber>
        </valor>  
        <contribAdicional>
            <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                <%=rel.getContribuicaoMensalNovaRenda()%> 
            </fmt:formatNumber>
        </contribAdicional>
        <anosAdicionaisContrib>
            <%
            for (int i = 0; i < projecaoList.size(); i++) {
                Relatorio aux = (Relatorio) projecaoList.get(i);

            %>
            <ano>
                <%=i + 1%>
            </ano>
            <rendaVitalicia>
                <fmt:formatNumber type="currency" currencySymbol="R$" minFractionDigits="2">
                    <%=aux.getRendaVitalicia()%> 
                </fmt:formatNumber>
            </rendaVitalicia>
            <%
            }   
            %>
        </anosAdicionaisContrib> 
    </rendaDesejada>
    
</simulacao>

