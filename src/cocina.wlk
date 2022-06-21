import comidas.*
import comensales.*

object cocina{
	
	var property listadoDeComidas=[]
	
	method comidasVegetarianas(){
		return listadoDeComidas.filter({x=>x.esAptoVegetariano()})
	}
	
	method comidasNoVegetarianas(){
		return listadoDeComidas.filter({x=>not x.esAptoVegetariano()})
	}
	
	method tieneBuenaOfertaVegetariana(){
		return (self.comidasVegetarianas().size() - self.comidasNoVegetarianas().size()).abs() <=2
	}
	
	method platoFuerteCarnivoro(){
		return self.comidasNoVegetarianas().max({x=>x.valoracion()})
	}
	
	method leGustanLasComidas(comensal){
		return listadoDeComidas.filter({x=>comensal.leAgrada(x)})
	}
	
	method elegirPlatoPara(comensal){
		if(self.leGustanLasComidas(comensal).isEmpty()) self.error("Ups, No hay ninguna comida que le agrade al comensal")
		else{
		const comidaAleatoria= self.leGustanLasComidas(comensal).anyOne()
		listadoDeComidas.remove(comidaAleatoria)
		comensal.comer(comidaAleatoria)
		}
	}
}


