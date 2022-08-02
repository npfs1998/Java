
public abstract class Conta implements IConta {
	
	private static int AGENCIA_PADRAO = 1;
	private static int SEQUENCIAL = 1;
	
	protected int agencia;
	protected int numero;
	protected double saldo = 0;
	protected int cliente;
	
	public Conta(int cliente) {
		this.agencia = AGENCIA_PADRAO;
		this.numero = SEQUENCIAL++;
		this.cliente = cliente;
	}
	
	public Conta(int cliente, int numero) {
		this.agencia = AGENCIA_PADRAO;
		this.numero = numero;
		this.cliente = cliente;
	}
	
	public Conta(int agencia, int numero, double saldo, int cliente) {
		this.agencia = agencia;
		this.numero = numero;
		this.saldo = saldo;
		this.cliente = cliente;
	}
	
	@Override
	public void depositar(double valor) {
		this.saldo += valor;
	}

	@Override
	public boolean sacar(double valor) {
		if (this.saldo < valor) return false;
		this.saldo -= valor;
		return true;
	}

	@Override
	public boolean transferir(double valor, Conta contaDestino) {
		if (this.sacar(valor)) {
			contaDestino.depositar(valor);
			return true;
		}
		return false;
	}
	

	public int getAgencia() {
		return agencia;
	}

	public int getNumero() {
		return numero;
	}

	public double getSaldo() {
		return saldo;
	}

	public int getCliente() {
		return cliente;
	}

	public String getRegistro() {
		String tipo = "CC";
		if (this.getClass().getName().contains("Poupanca")) tipo = "CP";
		return tipo + ";" + agencia + ";" + numero + ";" + 
			String.format("%.2f", saldo).replace(',', '.') + ";" + cliente;
	}

	protected void imprimirInfosComuns() {
		System.out.println(String.format("Agencia: %d", this.agencia));
		System.out.println(String.format("Conta: %d", this.numero));
		System.out.println(String.format("Saldo: %.2f", this.saldo));
		System.out.println("\n");
	}

}
