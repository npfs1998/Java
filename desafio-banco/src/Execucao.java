import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Scanner;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

import java.util.Date;
import java.util.List;

public class Execucao {
	Cliente cliente = null;
	Conta conta = null;
	List<Conta> contas = null;
	Scanner scan = new Scanner(System.in);
	Banco banco = new Banco("Cruzeiro");
	
	public void executar() {
		int opcao = 0;
		do {
			clearScreen();
	        System.out.println("** Banco " + banco.getNome() + " " + 
	     	         DataHoraFdh() + "\n");

			opcao = menuPrincipal();
		    if (cliente != null) telaCliente();
		    else
	        if(opcao == 1)
	        	cadastraCliente();
	        else if(opcao == 2){
				clearScreen();
		        System.out.println("** Banco " + banco.getNome() + " " + 
		     	         DataHoraFdh() + "\n");
	        	System.out.println("\n=== Dados dos Clientes ===\n");
	        	banco.ImprimirClientes();
		    	
	        	selecionarCliente();
	        	if (cliente != null) {
	        		telaCliente();
	        		continue;
	        	}
	        }
	        else if(opcao == 3) {
	        	selecionarCliente();
	        	if (cliente != null) {
	        		telaCliente();
	        		continue;
	        	}
	        }
	        else if(opcao == 4) {
	        	telaMovimentacao();
	        }
	        else if(opcao !=0){
	            System.out.println("\nOpção inválida\nPressione um tecla para continuar.");
	            scan.nextLine();
	        }     
	    } while (opcao != 0);

	    scan.close();	
		clearScreen();
	    System.out.println("\nAplicativo finalizado. " + 
	          DataHoraFdh());
	}

	private int menuPrincipal() {
	    System.out.println("## Escolha uma das opções abaixo ##\n");
    	System.out.println("Opção 1 - Cadastrar Cliente");
        System.out.println("Opção 2 - Relação de Clientes");
    	System.out.println("Opção 3 - Selecionar Cliente");
    	System.out.println("Opção 4 - Ver movimentação");
        System.out.println("Opção 0 - Sair do programa");
        System.out.println("_______________________");
        
        String ret = dialogoInput("Selecione a opção");
        //System.out.print("Digite aqui sua opção>> ");
        return strParaInt(ret);//scan.nextLine());
	}

	private void cadastraCliente() {
		clearScreen();
        System.out.println("** Banco" + banco.getNome() + " " + 
     	         DataHoraFdh() + "\n");
	    System.out.println("## Inclusão de Cliente ##\n");
    	//System.out.print("\nEntre o NOME do Cliente: ");
    	//String nome = scan.nextLine().toUpperCase();
    	String nome = dialogoInput("Entre o nome do cliente");
    	if (!nome.isEmpty()) {
    		if (banco.CriarCliente(nome.toUpperCase()) != null) 
    			System.out.println("\nClente " + nome.toUpperCase() + " criado!");
    		else
    			System.out.println("\nClente " + nome.toUpperCase() + " não criado!");
    	}
        System.out.println("\nPressione um tecla para continuar.");
        dialogoInput("Tecle para continuar");
	}
	
	private void selecionarCliente() {
    	cliente = null;
		System.out.print("\nSelecione um Cliente: ");
    	//int id = strParaInt(scan.nextLine());
    	String ret = dialogoInput("Selecione um cliente");
    	int id = strParaInt(ret);
    	cliente = banco.getCliente(id);
	}
	
	private void telaCliente() {
		int id = 0;
		do {
			clearScreen();
	        System.out.println("** Banco " + banco.getNome() + " " + 
	     	         DataHoraFdh() + "\n");
	    	System.out.println("\n=== Dados dos Clientes ===\n");
	    	cliente.ImprimirDadosCliente();
	    	System.out.println("");

			contas = banco.getContas(cliente.getId());
			for(int i=0; i < contas.size(); i++) {
				contas.get(i).imprimirExtrato();
			}
			
			id = menuCliente();
			if (id == 1) {
				selecionarConta();
				if (conta != null) {
					telaConta();
				}
			}
			else if (id == 2 || id == 3) {
				char tipo = (id == 2) ? 'C': 'P';
				conta = banco.CriarConta(cliente.getId(), tipo);
				if (conta != null) {
					telaConta();
				}
			}
		}
        while (id != 0);
        	
        cliente = null;
        contas = null;
		conta = null;
	}

	private void telaMovimentacao() {
		clearScreen();
	    System.out.println("** Banco " + banco.getNome() + " " + 
	     	         DataHoraFdh() + "\n");
	    System.out.println("\n=== Movimentações efetuadas ===\n");

	    List<String> listas = ArquivoDB.lerMovimentacao();
	    for (String lista : listas) {
	    	System.out.println(lista);
		}
	    
	    if (listas != null && listas.size()> 0)
	    	listas.clear();
	    
	    System.out.println("\nTecle para continuar\n");
		dialogoInput("Tecle para continuar");
	}

	private int menuCliente() {
		System.out.println("## Escolha uma das opções abaixo ##\n");
		if (contas.size() > 0)
			System.out.println("Opção 1 - Selecionar Conta");
    	System.out.println("Opção 2 - Criar Conta Corrente");
    	System.out.println("Opção 3 - Criar Conta Poupança");
    	System.out.println("Opção 0 - Retornar");
        System.out.println("_______________________");
//        System.out.print("Digite aqui sua opção>> ");
//        return strParaInt(scan.nextLine());
    	String ret = dialogoInput("Selecione a opção");
        return strParaInt(ret);
        
	}

	private void selecionarConta() {
    	conta = null;
		System.out.print("\nSelecione uma Conta: ");
//    	int id = strParaInt(scan.nextLine());
    	String ret = dialogoInput("Selecione uma conta");
    	int id = strParaInt(ret);
    	conta = banco.getConta(id);
	}

	private void telaConta() {
    	int id = 0;
    	do {
    		clearScreen();
            System.out.println("** Banco " + banco.getNome() + " " + 
         	         DataHoraFdh() + "\n");
        	System.out.println("\n=== Dados da Conta ===\n");
        	cliente.ImprimirDadosCliente();
        	System.out.println("");
        	conta.imprimirExtrato();

    		id = menuConta();
            if (id == 1)
            	efetuarDeposito();
            else if (id == 2)
                efetuarSaque();
            else if (id == 3) {
            	transferirPara();
            }
            else if (id == 4) {
            	transferirDe();
            }
    	} while (id != 0);
    	conta = null;
	}

	private void efetuarDeposito() {
	    System.out.println("\n## Depósito em Conta ##\n");
//    	System.out.print("\nEntre o valor do depósito: ");
//    	double valor = strParaDouble(scan.nextLine());
    	String ret = dialogoInput("Entre o valor do depósito");
    	double valor = strParaDouble(ret);
    	if (valor != 0D) {
    		conta.depositar(valor); 
			banco.registrarMovimentacao(conta.getRegistro() + ";DEPOSITO EFETUADO NO VALOR DE [" + 
					String.format("%.2f", valor) + "]");
    		banco.atualizarRegistroConta(conta);
  			System.out.println("\nDepósito efetuado!");
    	}
    	else
  			System.out.println("\nDepósito não efetuado!");

        System.out.println("\nPressione um tecla para continuar.");
        dialogoInput("Pressione um tecla para continuar");
	}

	private void efetuarSaque() {
	    System.out.println("\n## Saque em Conta ##\n");
//    	System.out.print("\nEntre o valor do saque: ");
//    	double valor = strParaDouble(scan.nextLine());
    	String ret = dialogoInput("Entre o valor do saque");
    	double valor = strParaDouble(ret);
    	if (valor != 0D) {
    		if (conta.sacar(valor)) { 
    			banco.registrarMovimentacao(conta.getRegistro() + ";SAQUE EFETUADO NO VALOR DE [" + 
    					String.format("%.2f", valor) + "]");
        		banco.atualizarRegistroConta(conta);
    			System.out.println("\nSaque efetuado!");
    		}
    		else
    			System.out.println("\nSaque não efetuado!\nValor em conta insuficiente para o saque!");
    	}
    	else
  			System.out.println("\nSaque não efetuado!");

        System.out.println("\nPressione um tecla para continuar.");
        scan.nextLine();
	}

	private void transferirPara() {
	    System.out.println("\n## Tranferência para Conta ##\n");

		Conta contaDestino = null;
//		System.out.print("\nSelecione uma Conta a transferir: ");
//    	int id = strParaInt(scan.nextLine());
    	String ret = dialogoInput("Entre a conta a transferir");
    	int id = strParaInt(ret);
    	contaDestino = banco.getConta(id);
    	if (contaDestino != null) {
    		Cliente clienteDestino = banco.getCliente(contaDestino.getCliente());
    		System.out.println("\n**Dados da conta destino **");
    		clienteDestino.ImprimirCliente();
    		contaDestino.imprimirInfosComuns();
    		
        	//System.out.print("\nEntre o valor da transferência: ");
        	//double valor = strParaDouble(scan.nextLine());
        	String ret2 = dialogoInput("Entre o valor a transferir");
        	double valor = strParaDouble(ret2);
    		
    		if (conta.transferir(valor, contaDestino)) {
    			banco.registrarMovimentacao(conta.getRegistro() + ";TRANFERENCIA PARA A CONTA [" + contaDestino.getAgencia() + 
  					  ", " + contaDestino.getNumero() + "] NO VALOR DE [" + String.format("%.2f", valor) + "]");
    			banco.registrarMovimentacao(contaDestino.getRegistro() + ";TRANFERENCIA DA CONTA [" + conta.getAgencia() + 
					  ", " + conta.getNumero() + "] NO VALOR DE [" + String.format("%.2f", valor) + "]");
        		banco.atualizarRegistroConta(conta);
        		banco.atualizarRegistroConta(contaDestino);
    			System.out.println("\nTransferência efetuada!");
    		}
    		else
    			System.out.println("\nTransferência não efetuada!\nValor em conta insuficiente para efetuar a transferência!");
    	}
    	else {
            System.out.println("\nConta inexistente!\nPressione um tecla para continuar.");
            scan.nextLine();
    	}
	}
	
	private void transferirDe() {
	    System.out.println("\n## Tranferência da Conta ##\n");

		Conta contaDe = null;
		//System.out.print("\nSelecione uma Conta a transferir: ");
    	//int id = strParaInt(scan.nextLine());
    	String ret = dialogoInput("Entre uma conta de onde transferir");
    	int id = strParaInt(ret);
    	contaDe = banco.getConta(id);
    	if (contaDe != null) {
    		if (contaDe.cliente != conta.cliente) {
    			Cliente clienteDe = banco.getCliente(contaDe.getCliente());
    			System.out.println("\n**Dados da conta de origem **");
    			System.out.println("\n**Esta conta não é sua **");
    			clienteDe.ImprimirCliente();
    			contaDe.imprimirInfosComuns();
    			scan.nextLine();
    			return;
    		}
    		
			System.out.println("\n**Dados da conta de origem **");
			contaDe.imprimirInfosComuns();
        	//System.out.print("\nEntre o valor da transferência: ");
        	//double valor = strParaDouble(scan.nextLine());
	    	String ret2 = dialogoInput("Entre o valor da transferência");
	    	double valor = strParaDouble(ret2);
    		
    		if (contaDe.transferir(valor, conta)) {
    			banco.registrarMovimentacao(contaDe.getRegistro() + ";TRANFERENCIA PARA A CONTA [" + conta.getAgencia() + 
    					  ", " + conta.getNumero() + "] NO VALOR DE [" + String.format("%.2f", valor) + "]");
    			banco.registrarMovimentacao(conta.getRegistro() + ";TRANFERENCIA DA CONTA [" + contaDe.getAgencia() + 
  					  ", " + contaDe.getNumero() + "] NO VALOR DE [" + String.format("%.2f", valor) + "]");
        		banco.atualizarRegistroConta(contaDe);
        		banco.atualizarRegistroConta(conta);
        		System.out.println("\nTransferência efetuada!");
    		}
    		else
    			System.out.println("\nTransferência não efetuada!\nValor em conta insuficiente para efetuar a transferência!");
    	}
    	else {
            System.out.println("\nConta inexistente!\nPressione um tecla para continuar.");
            scan.nextLine();
    	}
	}
	
	private int menuConta() {
		System.out.println("## Escolha uma das opções abaixo ##\n");
		System.out.println("Opção 1 - Efetuar Depósito");
    	System.out.println("Opção 2 - Efetuar Saque");
		if (contas.size() > 1) {
	    	System.out.println("Opção 3 - Efetuar Transferência Para");
	    	System.out.println("Opção 4 - Efetuar Transferência De");
	    	System.out.println("Opção 0 - Retornar");
	        System.out.println("_______________________");
		}
//        System.out.print("Digite aqui sua opção>> ");
//        return strParaInt(scan.nextLine());
    	String ret = dialogoInput("Selecione a opção");
        return strParaInt(ret);
		
	}

	public static Date DataHora() {
		return (Date)Calendar.getInstance().getTime();
	}
	
	public static String DataHoraFdh() {
		Date data = DataHora();
		SimpleDateFormat sddia = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdhora = new SimpleDateFormat("HH:mm:ss");
		String retorno = sddia.format(data) + " " + sdhora.format(data);
		return retorno;
	}
	
	public static String DataHoraFd() {
		Date data = DataHora();
		SimpleDateFormat sddia = new SimpleDateFormat("dd/MM/yyyy");
		String retorno = sddia.format(data);
		return retorno;
	}
	
	public static String DataHoraFh() {
		Date data = DataHora();
		SimpleDateFormat sdhora = new SimpleDateFormat("HH:mm:ss");
		String retorno = sdhora.format(data);
		return retorno;
	}

	public static int strParaInt(String s) {
		int retorno = 0;
		if (s.chars().allMatch(Character::isDigit)) {
			try {
				retorno = Integer.parseInt(s);
			} catch (Exception e) {
				retorno = 0;
			}
		}
		return retorno;
	}

	public static double strParaDouble(String s) {
		double retorno = 0;
		try {
		retorno = Double.parseDouble(s.replace(',', '.'));
		} catch (Exception e) {
			retorno = 0;
		}
		return retorno;
	}
	
	public static String dialogoInput(String descricao) {
        String ret = "";
		JFrame jFrame = new JFrame();
        ret = JOptionPane.showInputDialog(jFrame, descricao);
        jFrame.dispose();
        if (ret == null) ret = "";
        return ret;
	}

	public static void clearScreen() {  
		System.out.print("\033[H\033[2J");  
		System.out.flush();  
		//System.out.print("\f");
		/*
		try {
			new ProcessBuilder("cmd", "/c","cls").inheritIO().start().waitFor();
			new ProcessBuilder("clear").inheritIO().start().waitFor();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		*/
	}
}
