package principal.service;

import principal.model.Automovel;

/*
 *  @author npfs
 *  
 */

public interface AutomovelService {

	Iterable<Automovel> buscarTodos();

	Automovel buscarPorId(Long id);

//	Automovel buscarPorPlaca(String placa);

//	Automovel buscarPorChassi(String chassi);
	
//	Iterable<Automovel> buscarPorProprietario(Long proprietario);

	void inserir(Automovel automovel);

	void atualizar(Long id, Automovel automovel);

	void deletar(Long id);
}
