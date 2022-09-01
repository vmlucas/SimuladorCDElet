package simuladorElet;

/**
 * Classe que representa os resultados de uma simulação
 */
public class Relatorio 
{
    private Simulacao simulacao;
    private int idade;
    private int tempoCont;
    private double contBruta;
    private double contAcum;
    private double aporteIni;
    private double aporteExtra;
    private double aporteTotal;
    private double reservaMigracao;
    private double saldo;
    private double idadeVitalicia;
    private double fatorParticRendaCerta;
    private double percentual;
    private double novaRendaDesejada;
    private double contribuicaoMensalNovaRenda;
    private double rendaVitalicia;
    private double rendaProgramada;
    private double salarioFinal;
    private double contFinal;
    
    public Relatorio() {
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public int getIdade() {
        return idade;
    }

    public void setTempoCont(int tempoCont) {
        this.tempoCont = tempoCont;
    }

    public int getTempoCont() {
        return tempoCont;
    }

    public void setContBruta(double contBruta) {
        this.contBruta = contBruta;
    }

    public double getContBruta() {
        return contBruta;
    }

    public void setContAcum(double contAcum) {
        this.contAcum = contAcum;
    }

    public double getContAcum() {
        return contAcum;
    }

    public void setAporteIni(double aporteIni) {
        this.aporteIni = aporteIni;
    }

    public double getAporteIni() {
        return aporteIni;
    }

    public void setAporteExtra(double aporteExtra) {
        this.aporteExtra = aporteExtra;
    }

    public double getAporteExtra() {
        return aporteExtra;
    }

    public void setAporteTotal(double aporteTotal) {
        this.aporteTotal = aporteTotal;
    }

    public double getAporteTotal() {
        return aporteTotal;
    }

    public void setReservaMigracao(double reservaMigracao) {
        this.reservaMigracao = reservaMigracao;
    }

    public double getReservaMigracao() {
        return reservaMigracao;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setIdadeVitalicia(double idadeVitalicia) {
        this.idadeVitalicia = idadeVitalicia;
    }

    public double getIdadeVitalicia() {
        return idadeVitalicia;
    }

    public void setPercentual(double percentual) {
        this.percentual = percentual;
    }

    public double getPercentual() {
        return percentual;
    }

    public void setRendaVitalicia(double rendaVitalicia) {
        this.rendaVitalicia = rendaVitalicia;
    }

    public double getRendaVitalicia() {
        return rendaVitalicia;
    }

    public void setRendaProgramada(double rendaProgramada) {
        this.rendaProgramada = rendaProgramada;
    }

    public double getRendaProgramada() {
        return rendaProgramada;
    }

    public void setSalarioFinal(double salarioFinal) {
        this.salarioFinal = salarioFinal;
    }

    public double getSalarioFinal() {
        return salarioFinal;
    }

    public void setContFinal(double contFinal) {
        this.contFinal = contFinal;
    }

    public double getContFinal() {
        return contFinal;
    }

    public void setSimulacao(Simulacao simulacao) {
        this.simulacao = simulacao;
    }

    public Simulacao getSimulacao() {
        return simulacao;
    }

    public void setNovaRendaDesejada(double novaRendaDesejada) {
        this.novaRendaDesejada = novaRendaDesejada;
    }

    public double getNovaRendaDesejada() {
        return novaRendaDesejada;
    }

    public void setContribuicaoMensalNovaRenda(double contribuicaoMensalNovaRenda) {
        this.contribuicaoMensalNovaRenda = contribuicaoMensalNovaRenda;
    }

    public double getContribuicaoMensalNovaRenda() {
        return contribuicaoMensalNovaRenda;
    }

    public void setFatorParticRendaCerta(double fatorParticRendaCerta) {
        this.fatorParticRendaCerta = fatorParticRendaCerta;
    }

    public double getFatorParticRendaCerta() {
        return fatorParticRendaCerta;
    }
}
