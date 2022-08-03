package principal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import principal.model.Automovel;
import principal.service.AutomovelService;

/*
 *  @author npfs
 *  
 */

@RestController
@RequestMapping("automoveis")
public class AutomovelRestController {

	@Autowired
	private AutomovelService automovelService;

	@GetMapping
	public ResponseEntity<Iterable<Automovel>> buscarTodos() {
		return ResponseEntity.ok(automovelService.buscarTodos());
	}

	@GetMapping("/{id}")
	public ResponseEntity<Automovel> buscarPorId(@PathVariable Long id) {
		return ResponseEntity.ok(automovelService.buscarPorId(id));
	}
/*
	@GetMapping("/{placa}")
	public ResponseEntity<Automovel> buscarPorPlaca(@PathVariable String placa) {
		return ResponseEntity.ok(automovelService.buscarPorPlaca(placa));
	}
	@GetMapping("{/chassi}")
	public ResponseEntity<Automovel> buscarPorChassi(@PathVariable String chassi) {
		return ResponseEntity.ok(automovelService.buscarPorChassi(chassi));
	}

	@GetMapping("/{proprietario}")
	public ResponseEntity<Iterable<Automovel>> buscarPorProprietario(@PathVariable Long proprietario) {
		return ResponseEntity.ok(automovelService.buscarPorProprietario(proprietario));
	}
*/
	@PostMapping
	public ResponseEntity<Automovel> inserir(@RequestBody Automovel automovel) {
		automovelService.inserir(automovel);
		return ResponseEntity.ok(automovel);
	}

	@PutMapping("/{id}")
	public ResponseEntity<Automovel> atualizar(@PathVariable Long id, @RequestBody Automovel automovel) {
		automovelService.atualizar(id, automovel);
		return ResponseEntity.ok(automovel);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deletar(@PathVariable Long id) {
		automovelService.deletar(id);
		return ResponseEntity.ok().build();
	}
	
	
}
