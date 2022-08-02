
public class ContaCorrente extends Conta {

	public ContaCorrente(int cliente) {
		super(cliente);
	}

	public ContaCorrente(int cliente, int numero) {
		super(cliente, numero);
	}

	public ContaCorrente(int agencia, int numero, double saldo, int cliente) {
		super(agencia, numero, saldo, cliente);
	}

	@Override
	public void imprimirExtrato() {
		System.out.println("*** Extrato Conta Corrente ***");
		super.imprimirInfosComuns();
	}


	
}
