import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class ArquivoDB {
	static String path = ".\\DB\\";
    private String dbClientes = path + "clientes.txt";
    private String dbContas = path + "contas.txt";
    private String seqClientes = path + "sequenciacliente.txt";
    private String seqContas = path + "sequenciaconta.txt";
    private static String dbMovimentacao = path + "movimentacao.txt";
	
    public ArquivoDB() { }

    public int sequencial(String tipo) {
    	int seq = 0;
    	String arq = seqClientes;
    	if (tipo == "CONTA") arq = seqContas;
    	try {
    		FileReader fr = new FileReader(arq);
    		BufferedReader br = new BufferedReader(fr);
    		while (br.ready()) {
    			String linha = br.readLine();
    			int id = Integer.parseInt(linha.toString());
  				seq = id;
    			break;
    		}
    		br.close();
    		fr.close();
    	} catch (IOException e) {
    		System.out.println(e.getMessage());
    	}
    	
    	try {
    		FileWriter fw = new FileWriter(arq, false);
    		BufferedWriter bw = new BufferedWriter(fw);
    		int n = seq + 1;
    		String s = String.format("%d", n);
    		bw.write(s);
    		bw.close();
    		fw.close();
    	} catch (IOException e) {
    		System.out.println(e.getMessage());
    	}

    	
    	return seq;
    }
    
    public void gravarCliente(String registro) {
    	gravarRegistro(registro, dbClientes);
    }

    public void gravarConta(String registro) {
    	gravarRegistro(registro, dbContas);
    }

    public void atualizarConta(String registro, int agencia, int numero) {
    	List<String> linhas = lerArquivo(dbContas);
    	int i = 0;
    	try {
    		for (String linha : linhas) {
            	String[] split = linha.split(";");
            	int agencia_ = Integer.parseInt(split[1].toString());
            	int numero_ = Integer.parseInt(split[2].toString());
            	if (agencia == agencia_ && numero == numero_) {
            		linhas.set(i, registro);
            		atualizaRegistro(dbContas, linhas);
            		break;
            	}
            	i++;
            }
    	} catch (Exception e) {
    		System.out.println(e.getMessage());
    	}
    	linhas.clear();
    }
    
    public void gravarMovimentacao(String registro) {
    	gravarRegistro(registro, dbMovimentacao);
    }

    public void gravarRegistro(String registro, String dbArquivo) {
    	File arquivo = new File(dbArquivo);
	
    	try {
    		if (!arquivo.exists()) {
    			arquivo.createNewFile();
    		} 

    		FileWriter fw = new FileWriter(arquivo, true);
    		BufferedWriter bw = new BufferedWriter(fw);
    		bw.write(registro);
    		bw.newLine();
    		bw.close();
    		fw.close();
		
		}
		catch (IOException e) {
			System.out.println(e.getMessage());
		}
    }
    
    public List<Cliente> carregarClientes() {
    	
    	List<Cliente> clientes = new ArrayList<Cliente>();
    	List<String> linhas = lerArquivo(dbClientes);
        try {
            for (String linha : linhas) {
            	String[] split = linha.split(";");
            	int id = Integer.parseInt(split[0].toString());
            	String nome = split[1].toString();
            	Cliente cliente = new Cliente(id, nome);
            	clientes.add(cliente);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        linhas.clear();
        return clientes;
    }
    
    public List<Conta> carregarContas() {
        List<Conta> contas = new ArrayList<Conta>();
    	List<String> linhas = lerArquivo(dbContas);
    	String TIPO = "CC";
        try {
            for (String linha : linhas) {
            	String[] split = linha.split(";");
            	String tipo = split[0].toString();
            	int agencia = Integer.parseInt(split[1].toString());
            	int numero = Integer.parseInt(split[2].toString());
            	double saldo = Execucao.strParaDouble(split[3].toString());
            	int cliente = Integer.parseInt(split[4].toString());
            	Conta conta = null;
            	if (tipo.charAt(1) == TIPO.charAt(1)) {
            		conta = new ContaCorrente(agencia, numero, saldo, cliente);
            	}
            	else
            	{
            		conta = new ContaPoupanca(agencia, numero, saldo, cliente);
            	}
            	
        		contas.add(conta);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        linhas.clear();
        return contas;
    }
    
    
    public static List<String> lerMovimentacao() {
    	return lerArquivo(dbMovimentacao);
    }
    
    public static List<String> lerArquivo(String arquivo) {
        List<String> linhas = null;
		try {
	    	Path path = Paths.get(arquivo);
			linhas = Files.readAllLines(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
        return linhas;
    }

    public static boolean atualizaRegistro(String arquivo, List<String> linhas) {
		try {
	    	Path path = Paths.get(arquivo);
			Files.write(path, linhas);
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
        return true;
    }

}
