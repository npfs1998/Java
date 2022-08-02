
public class ContaPoupanca extends Conta {

	public ContaPoupanca(int cliente) {
		super(cliente);
	}

	public ContaPoupanca(int cliente, int numero) {
		super(cliente, numero);
	}
	
	public ContaPoupanca(int agencia, int numero, double saldo, int cliente) {
		super(agencia, numero, saldo, cliente);
	}

	@Override
	public void imprimirExtrato() {
		System.out.println("*** Extrato Conta Poupanca ***");
		super.imprimirInfosComuns();
	}
}
