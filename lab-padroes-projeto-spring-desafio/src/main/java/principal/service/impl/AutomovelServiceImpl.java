package principal.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import principal.model.Automovel;
import principal.model.AutomovelRepository;
import principal.service.AutomovelService;

/*
 *  @author npfs
 *  
 */

@Service
public class AutomovelServiceImpl implements AutomovelService {

	@Autowired
	private AutomovelRepository automovelRepository;

	@Override
	public Iterable<Automovel> buscarTodos() {
		return automovelRepository.findAll();
	}

	@Override
	public Automovel buscarPorId(Long id) {
		Optional<Automovel> automovel = automovelRepository.findById(id);
		return automovel.get();
	}

	/*
	@Query("SELECT n FROM Note n WHERE n.title = ?1")
	List<Note> findByTitlePositionalBind(String title);
	*/
/*	
	@Override
	public Automovel buscarPorPlaca(String placa) {
//		Optional<Automovel> automovel = automovelRepository.buscarPorPlaca(placa);
//		return automovel.get();
		return null;
	}

	@Override
	public Automovel buscarPorChassi(String chassi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterable<Automovel> buscarPorProprietario(Long proprietario) {
		// TODO Auto-generated method stub
		return null;
	}
*/
	@Override
	public void inserir(Automovel automovel) {
		automovelRepository.save(automovel);
	}

	@Override
	public void atualizar(Long id, Automovel automovel) {
		Optional<Automovel> automovelBd = automovelRepository.findById(id);
		if (automovelBd.isPresent()) {
			automovelRepository.save(automovel);
		}	
	}

	@Override
	public void deletar(Long id) {
		automovelRepository.deleteById(id);
		
	}

	
}
