class Plato {
	var property peso=0
	var property valoracion=0
	
	
	method esAptoVegetariano()
	
	method esAbundante(){
		return peso > 250
	}
	
}

class Provoleta inherits Plato{
	const pesoProvo
	const tieneEspecias= true
	
	override method peso(){
		return pesoProvo
	}
	
	override method esAptoVegetariano(){
		return (not tieneEspecias)
	}
	
	method esEspecial(){
		return self.esAbundante() || tieneEspecias
	}
	
	override method valoracion(){
		return if(self.esEspecial()){120}
		else {80}
	}
}

class HamburguesaDeCarne inherits Plato{
	const tipoDePan
	
	override method peso(){
		return 250
	}
	
	override method esAptoVegetariano(){
		return false
	}
	
	override method valoracion(){
		return 60 + tipoDePan.valoracion()
	}
	
}

class PanIndustrial{
	
	method valoracion(){
		return 0
	}
}

class PanCasero{
	
	method valoracion(){
		return 20
	}
}

class PanMasaMadre{
	
	method valoracion(){
		return 45
	}
}

class HamburguesaVege inherits HamburguesaDeCarne{
	
	const property estaHechaDe
	
	override method esAptoVegetariano(){
		return true
	}
	
	override method valoracion(){
		return super() + 17.min(2 * self.estaHechaDe().size())
	}
	
}

class Parrillada inherits Plato{
	var property cortes=[]
	
	override method peso(){
		return cortes.sum({x=>x.pesoCorte()})
	}
	
	override method esAptoVegetariano(){
		return false
	}
	
	method corteDeMayorCalidad(){
		return cortes.max({x=>x.calidad()})
	}

	override method valoracion(){
		return 0.max(15*self.corteDeMayorCalidad().calidad()- cortes.size())
	}
}

class Cortes{
	const nombre
	const property calidad
	var property pesoCorte
}
