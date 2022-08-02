import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.List;
import java.util.ArrayList;

public class BancoDB {

    private String dbClientes = "C:\\workspace\\eclipse-workspace\\desafio-banco\\src\\DB\\clientes.dat";
    private String dbContas = "C:\\workspace\\eclipse-workspace\\desafio-banco\\src\\DB\\contas.dat";

    public BancoDB() {
    }

    public void gravarClientes(List<Cliente> clientes) {
        try {
            ObjectOutputStream file = new ObjectOutputStream(new FileOutputStream(dbClientes));
            for (Cliente cliente : clientes) {
                file.writeObject(cliente);
            }
            file.close();
        } catch (IOException e) {
            System.out.println("Cliente grav " + e.getMessage());
        }
    }

    public List<Cliente> carregarClientes() {
        List<Cliente> clientes = new ArrayList<Cliente>();
        try {
            Cliente cliente = null;
            ObjectInputStream file = new ObjectInputStream(new FileInputStream(dbClientes));
            do {
                cliente = (Cliente) file.readObject();
                if (cliente != null) {
                    clientes.add(cliente);
                }
            } while (cliente != null);
            file.close();
        } catch (IOException e) {
            System.out.println("Cliente carr " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println("Cliente carr " + e.getMessage());
        }
        return clientes;
    }

    public void gravarContas(List<Conta> contas) {
        try {
            ObjectOutputStream file = new ObjectOutputStream(new FileOutputStream(dbContas));
            for (Conta conta : contas) {
                file.writeObject(conta);
            }
            file.close();
        } catch (IOException e) {
            System.out.println("Conta grav " + e.getMessage());
        }
    }

    public List<Conta> carregarContas() {
        List<Conta> contas = new ArrayList<Conta>();
        try {
            Conta conta = null;
            ObjectInputStream file = new ObjectInputStream(new FileInputStream(dbContas));
            do {
                conta = (Conta) file.readObject();
                if (conta != null) {
                    contas.add(conta);
                }
            } while (conta != null);
            file.close();
        } catch (IOException e) {
            System.out.println("Conta carr " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println("Conta carr " + e.getMessage());
        }
        return contas;
    }
}
