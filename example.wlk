//las distintas instancias pueden tener distintos valores?
//si = cambia con el tiempo? si= var sino= const
// no = pueden cambiar en el tiempo? si = variable
// no= quiero acceder desde afuera? si = es metodo
// no=constante
class Corsa {
  const property color 

  method capacidad() = 4

  method velocidadMaxima() = 150

  method peso() = 1300

  
}

class Kwid {
  var tieneTanqueDeGas

  method agregarTanque() {
    tieneTanqueDeGas = true
    
  }

  method quitarTanque() {
    tieneTanqueDeGas = false
    
  }

  method tieneTanqueDeGas() = tieneTanqueDeGas

  method capacidad() =
    if (tieneTanqueDeGas) 3 else 4

  method peso() = if (tieneTanqueDeGas) 1350 else 1200    
  

  method velocidadMaxima() = if (tieneTanqueDeGas) 120 else 110

  method color() = "Azul"
}

object trafic {
  var property interior=comodo
  var property motor=pulenta

  method capacidad() = interior.capaciad()
  method velocidadMaxima()= motor.velocidadMaxima()
  method peso() = 4000 + interior.peso() + motor.peso()
  method color() = "Blanco"



}

object comodo {
  method capaciad() = 5
  method peso() = 700  
}

object popular {
  method capacidad() = 12
  method peso() = 1000  
}

object pulenta {
  method peso() = 800
  method velocidadMaxima() = 130  
  
}

object bataton {
  method peso() = 500 
  method velocidadMaxima() = 80 
}


class AutoEspecial {
  const property capacidad    
  const property velocidadMaxima 
  const property peso 
  const property color   
}

class Dependencia {
  const property flota = #{}

  var property empleados

  const property pedidos = #{}

  method agregarPedido(pedido) {
    pedidos.add(pedido)
  } 

  method quitarPedido(pedido) {
    pedidos.remove(pedido)
  }



  method agregarAflota(rodado) {
    flota.add(rodado)
    
  }  

  method quitarDeFlota(rodado) {
    flota.remove(rodado)
    
  }

  method pesoTotalFlota() =
    flota.sum({unRodado => unRodado.peso()})


  method estaBienEquipada() = 
    flota.size() >= 3 && flota.all({unRodadado => unRodadado.velocidadMaxima() >= 100})
  
  method capacidadTotalEnColor(color) =   
    flota.filter({unRodado => unRodado.color() == color})
  
  method rodadoMasRapido() = self.rodadoMasRapido()
    
  method colorDelRodadoMasRapido() = flota.max({unRodado => unRodado.velocidadMaxima()})
  
  method capacidadTotal() =flota.sum({unRodado => unRodado.capaciad()})
    

  method capacidadFaltante() = empleados - self.capacidadTotal()

  method esGrande() = empleados.size() >= 40 and flota.size() >= 5

  method totalDePasajeros() = 
  pedidos.sum({unPedido => unPedido.cantidadPasajeros()})

  method cualesPedidosNoSonSatifechos() =
    pedidos.filter({unPedido => unPedido.satisfaceElPedido({unAuto => Dependencia.flota()})})
 //REVISAR 
  method todosLosPedidosSonIncompatibles(color) = pedidos.all({unPedido => unPedido.esColorIncompatible(color)}) 

  method relejarATodos() {
    pedidos.forEach({unPedido => unPedido.relejar()})
  }


  }

//hacer test (test on dos dependencias)
//etapa2

class Pedido {
  const property distancia
  var tiempoMaximo 
  const property cantidadPasajeros
  const property coloresIncompatibles

  method velocidadRequerida() = distancia / tiempoMaximo
  
  method satisfaceElPedido(auto) = 
    auto.velocidadMaxima() >= self.velocidadRequerida()  + 10 && auto.capacidad() >= cantidadPasajeros && !coloresIncompatibles.contains(auto.color())

  
  method acelerar() {
    tiempoMaximo -= 1
  }

  method relajar() {
    tiempoMaximo  += 1
  }

  method tiempoMaximo() = tiempoMaximo 

  method esColorIncompatible(color)= coloresIncompatibles.contains(color)
}

//etapa 3

