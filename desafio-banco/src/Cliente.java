
public class Cliente {
	private static int SEQUENCIAL = 1;
	
	private int id;
	private String nome;

	public Cliente(String nome) {
		this.id = SEQUENCIAL++;
		this.nome = nome;
	}

/*	public Cliente(String nome, int id) {
		this.id = id;
		this.nome = nome;
	}
*/
	public Cliente(int id, String nome) {
		this.id = id;
		this.nome = nome;
	}

	public int getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getRegistro() {
		return id + ";" + nome;
	}

	public void ImprimirCliente() {
		System.out.println(String.format("Titular: %s", this.getNome()) + "\n");
	}
	
	public void ImprimirDadosCliente() {
		System.out.println(String.format("%d", this.id) + " - " + this.getNome());
	}
	
}
