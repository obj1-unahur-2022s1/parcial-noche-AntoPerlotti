import comidas.*

class Comensales {
	var property peso
	var property comidasIngeridas=[]
	
	method leAgrada(comida)
	
	method pesoTotalDeComidasIngeridas(){
		return comidasIngeridas.sum({x=>x.peso()})
	}
	
	method estaSatisfecho(){
		return self.pesoTotalDeComidasIngeridas() >= self.peso() * 0.01
	}
	
	method comer(comida){
		comidasIngeridas.add(comida)
	}
}

class Vegetariano inherits Comensales{
	
	override method leAgrada(comida){
		return comida.esAptoVegetariano() && comida.valoracion()>85
	}
	
	override method estaSatisfecho(){
		return super() && comidasIngeridas.all({x=> not x.esAbundante()})
	}
}

class HambrePopular inherits Comensales{
	
	override method leAgrada(comida){
		return comida.esAbundante()
	}
}

class DePaladarFino inherits Comensales{
	
	override method leAgrada(comida){
		return  comida.peso().between(150,300) && comida.valoracion()>100
	}
	
	override method estaSatisfecho(){
		return super() && comidasIngeridas.size().even()
	}
}
