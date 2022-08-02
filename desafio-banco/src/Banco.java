import java.util.ArrayList;
import java.util.List;

public class Banco {
	private String nome;
//	private List<Conta> contas = new ArrayList<Conta>();
	//private BancoDB db = new BancoDB();
	private ArquivoDB adb = new ArquivoDB();
	
	private List<Cliente> clientes = adb.carregarClientes();
	private List<Conta> contas = adb.carregarContas();


	public Banco(String nome) {
		super();
		this.nome = nome;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Conta> getContas() {
		return contas;
	}

	public void setContas(Conta conta) {
		this.contas.add(conta);
	}

	public void setClientes(Cliente cliente) {
		this.clientes.add(cliente);
	}

	public Cliente CriarCliente(String nome) {
		int id = adb.sequencial("CLIENTE");
		Cliente c = new Cliente(id, nome);
		this.setClientes(c);
		adb.gravarCliente(c.getRegistro());
		registrarMovimentacao(c.getRegistro() + ";CRIACAO DE CLIENTE");
		
		return c;
	}

	public void adicionarCliente(int id, String nome) {
		Cliente c = new Cliente(id, nome);
		this.setClientes(c);
	}

	public Conta CriarConta(int id, char tipo) {
		Conta c = null;
		int idseq = adb.sequencial("CONTA");
		switch (tipo) {
			case 'C':
				c = new ContaCorrente(id, idseq);
				break;
			case 'P':
				c = new ContaPoupanca(id, idseq);
				break;
		}
		this.setContas(c);
		adb.gravarConta(c.getRegistro());
		registrarMovimentacao(c.getRegistro() + ";CRIACAO DE CONTA");

		return c;
	}
	
	public void atualizarRegistroConta(Conta conta) {
		adb.atualizarConta(conta.getRegistro(), 
				conta.getAgencia(), conta.getNumero());
	}
	
	public void registrarMovimentacao(String movimento) {
		adb.gravarMovimentacao(Execucao.DataHoraFdh() + ";" + movimento);
	}
	
	public void imprimirInfos() {
		System.out.println("\n*** Banco: " + this.getNome() +
				"  Contas: " + this.contas.size() + 
				"  Clientes: " + this.clientes.size() + " ***\n");
		ImprimirDadosPorCliente();
	}	
	
	@SuppressWarnings("unused")
	private void ImprimirDados() {
		for(int i=0; i<contas.size(); i++) {
			Conta c = contas.get(i);
			int id = c.cliente;
			Cliente cl = this.getCliente(id);
			cl.ImprimirCliente();
			c.imprimirExtrato();
		}
	}
	
	public Cliente getCliente(int id) {
		Cliente c = null;
		for(int i=0; i<clientes.size(); i++) {
			if(clientes.get(i).getId() == id) {
				c = clientes.get(i);
				break;
			}
		}
		return c;
	}

	public Conta getConta(int id) {
		Conta c = null;
		for(int i=0; i<contas.size(); i++) {
			if(contas.get(i).getNumero() == id) {
				c = contas.get(i);
				break;
			}
		}
		return c;
	}
	
	private void ImprimirDadosPorCliente() {
		for(int i=0; i<clientes.size(); i++) {
			Cliente cl = clientes.get(i);
			cl.ImprimirCliente();
			int id = cl.getId();
			List<Conta> cs = this.getContas(id);
			for(int j=0; j<cs.size(); j++) {
				Conta c = cs.get(j);
				c.imprimirExtrato();
			}
		}
	}

	public void ImprimirClientes() {
		for(int i=0; i<clientes.size(); i++) {
			Cliente cl = clientes.get(i);
			cl.ImprimirDadosCliente();
		}
	}

	public List<Conta> getContas(int id) {
		List<Conta> cs = new ArrayList<Conta>();
		for(int i=0; i<contas.size(); i++) {
			if(contas.get(i).getCliente() == id) {
				Conta c = contas.get(i);
				cs.add(c);
			}
		}
		return cs;
	}
	
	/*
	public void gravarDados() {
		db.gravarClientes(clientes);
		db.gravarContas(contas);
	}
	*/
}
