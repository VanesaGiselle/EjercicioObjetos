import UIKit
import Foundation

/*
 PDP - Ejercicios de Objetos - Guía 1 - Trabajo con Objetos
  Paradigmas de Programación Trabajo con Objetos
 Ejercicio 1 - Pepita básica
 a. Codificar a pepita en Wollok, con estos patrones de modificación de la energía:
 ● cuando vuela, consume un joule por cada kilómetro que vuela, más 10 joules
 de "costo fijo" en cada vuelo.
 ● cuando come, adquiere 4 joules por cada gramo que come.
 No olvidar la inicialización.
 b. Pepita ahora es mensajera, le enseñamos a volar sobre la ruta 9.
 Agregar los siguientes lugares sobre la ruta 9, con el kilómetro en el que está cada una, y agregar lo que haga falta para que:
 ● pepita sepa dónde está (vale indicarle un lugar inicial al inicializarla).
 ● le pueda decir a pepita que vaya a un lugar, eso cambia el lugar y la hace volar
 la distancia.
 ● pueda preguntar si pepita puede o no ir a un lugar, puede ir si le da la energía
 para hacer la distancia entre donde está y donde le piden ir. Por ahora no validamos cuando le pedimos que vaya que pueda ir, eso lo agregaremos más adelante.
 Pensar en particular
 ● qué objeto se debe encargar del cálculo de la distancia entre dos lugares,
 piensen cómo lo preguntarían desde la consola. Si resulta que el cálculo se repite para distintos objetos... OK, después vamos a ver cómo arreglar eso.
 ● cómo hago para no repetir en distintos métodos de pepita la cuenta de la energía que necesita para moverse una cantidad de kilómetros.
 
 Ejercicio 2 - Tom y Jerry
 a. Implementar en Wollok un objeto que represente a tom, que es un gato. Lo que nos interesa de tom es manejar su energía y su velocidad, que dependen de sus actividades de comer ratones y de correr. La persona que registra las actividades de tom, registra los ratones que come y la cantidad de tiempo que corre en segundos. Cuando tom come un ratón, su energía aumenta en (12 joules + el peso del ratón en gramos). La velocidad de tom es 5 metros x segundo + (energia medida en joules / 10). Cuando tom corre, su energía disminuye en (0.5 x cantidad de metros que corrió). Observar que la cuenta está en joules consumidos por metro, pero cuando me dicen cuánto corrió, me lo dicen en segundos. La velocidad que se toma es la que corresponde a la energía de Tom antes de empezar a correr, y no varía durante una carrera.
 Nota: además de tom, hay otros objetos en juego, ¿cuáles son, qué mensaje tienen
 que entender?
 b. Lograr que tom entienda el mensaje:
 tom.meConvieneComerRatonA(unRaton, unaDistancia)
 1

 PDP - Ejercicios de Objetos - Guía 1 - Trabajo con Objetos
  Devuelve true si la energía que gana por comer al ratón es mayor a la que consume corriendo la distancia, que está medida en metros.
 Ejercicio 3 - Sueldo de Pepe
 Implementar en Wollok los objetos necesarios para calcular el sueldo de Pepe.
 El sueldo de pepe se calcula así: sueldo = neto + bono x presentismo + bono x resultados. El neto es el de la categoría, hay dos categorías: gerentes que ganan $1000 de neto, y cadetes que ganan $1500.
 Hay dos bonos por presentismo:
 ● Es $100 si la persona a quien se aplica no faltó nunca, $50 si faltó un día, $0 en cualquier otro caso;
 ● En el otro, nada.
 Hay tres posibilidades para el bono por resultados:
 ● 10% sobre el neto
 ● $80 fijos ● Onada
 Jugar cambiándole a pepe la categoría, la cantidad de días que falta y sus bonos por presentismo y por resultados; y preguntarle en cada caso su sueldo.
 Nota: acá aparecen varios objetos, piensen bien a qué objeto le piden cada cosa que hay que saber para poder llegar al sueldo de pepe.
 
 
 Ejercicio 4 - Celulares
 Se pide representar con objetos a personas que hablan entre sí por celulares.
 Juliana tiene un Samsung S21, y Catalina tiene un iPhone.
 El Samsung S21 pierde 0,25 "puntos" de batería por cada llamada, y el iPhone pierde 0,1% de la duración de cada llamada en batería. Ambos celulares tienen 5 "puntos" de batería como máximo.
 Implementar a Juliana, Catalina, el Samsung S21 de Juliana y el iPhone de Catalina en Wollok y hacer pruebas en donde Juliana y Catalina se hagan llamadas telefónicas de distintas duraciones.
 Conocer la cantidad de batería de cada celular.
 Saber si un celular está apagado (si está sin batería).
 Recargar un celular (que vuelva a tener su batería completa).
 Saber si Juliana tiene el celular apagado; saber si Catalina tiene el celular apagado.
 Ahora podemos también tener en cuenta el costo de las llamadas que se hacen entre Catalina y Juliana. Catalina tiene contratado como servicio de telefonía celular a Movistar, Juliana a Personal. Movistar cobra fijo $0,60 final el minuto, Claro cobra 0,50 el minuto + 21% de IVA y Personal $0,70 final los primeros 10 minutos que usaste el celu, y $0,40 el minuto el resto.
 Se pide hacer un diagrama de objetos que represente esto y saber cuánta plata gastó cada uno luego de haberse hecho varias llamadas entre sí.
 ¿Qué objeto me conviene que conozca a la compañía telefónica? ¿Qué debería pasar con los gastos de llamadas si a Juliana se le rompe su celular y se compra uno nuevo?

 */


//EJERCICIO 1 - PEPITA

class Pajaro {
    var energia:Int = 5
    var distancia:Int = 0
    var costoFijo:Int = 0
    var posicionActual:Int = 0
    var puedeIr:Bool = true
        
    init(){}
    init(cF:Int, pC:Int){
        self.costoFijo = cF
        self.posicionActual = pC
    }
    
    
    func volar(posicionDestino: Int) throws {
        distancia = abs(posicionActual - posicionDestino)
        
        let energiaDespuesDeVolar = self.energia - ((1 * self.distancia) + self.costoFijo)
        
        if self.energia == 0 {
            throw ErrorPaloma.noTieneEnergia
        }
        
        if energiaDespuesDeVolar > 0 {
            self.energia = energiaDespuesDeVolar
            self.posicionActual = posicionDestino
        } else {
            throw ErrorPaloma.noLlegaAEseLugar
        }
    }
    
    func comer(pesoComida:Int){
        self.energia = self.energia + (pesoComida * 4)
    }
    
}

enum ErrorPaloma: Error {
    case noTieneEnergia
    case noLlegaAEseLugar
}



//Workspace
var pepita: Pajaro = Pajaro(cF: 10,pC: 3)
//pepita.comer(pesoComida: 30)

do {
    try pepita.volar(posicionDestino: 10)
    print("anduvo ok")
} catch ErrorPaloma.noTieneEnergia {
    print("Hubo un error en la energia")
} catch ErrorPaloma.noLlegaAEseLugar {
    print("Hubo un error en la llegada")
}

//EJERCICIO 2 - TOM Y JERRY
 
class Gato {
    var energia:Int = 0
    private var velocidad:Int = 0
    var tiempoCorriendo:Int = 0
    
    func comer(raton: Raton) {
        self.energia = self.energia + energiaPorComer(raton: raton)
    }
    
    private func energiaPorComer(raton: Raton) -> Int {
        return Int(12.0 + raton.peso)
    }
    
    private func energiaPorCorrer(distancia: Double) -> Int {
        return Int(distancia * 0.5)
    }
    
    func correr(distancia: Double) {
        self.velocidad = 5 * self.tiempoCorriendo + (self.energia/10)
        self.energia = self.energia - energiaPorCorrer(distancia: distancia)
    }
    
    func meConvieneComerRaton(raton: Raton, distancia: Double) -> Bool {
        
        if energiaPorComer(raton: raton) > energiaPorCorrer(distancia: distancia) {
            return true
        } else {
            return false
        }
    }
    
}

class Raton {
    var peso: Double
    
    init(peso: Double){
        self.peso = peso
    }
}


var tom: Gato = Gato()
var jerry: Raton = Raton(peso: 1050.0)

tom.meConvieneComerRaton(raton: jerry, distancia: 1.0)


//EJERCICIO 3 - SUELDO DE PEPE
/*
class Sueldo {
    var sueldo: Int = 0
    
    private func calcularNeto(gerente: Bool) -> Int {
        return gerente ? 1000 : 1500
    }
    
    private func calcularPresentismo(presentismo: Bool,ausencia:Int) -> Int {
        if presentismo {
            switch ausencia {
            case 0:
                return 100
            case 1:
                return 50
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    
    private func calcularResultado(porcentaje: Bool, fijo: Bool, gerente: Bool) -> Int {
        if porcentaje {
            return Int(Double(calcularNeto(gerente: gerente)) * 0.1)
        } else if fijo {
            return 80
        } else {
            return 0
        }
    }
    
    func calcularSueldo(gerente: Bool, presentismo: Bool, ausencia: Int, porcentaje: Bool, fijo: Bool) -> Int {
        return calcularNeto(gerente: gerente) + calcularPresentismo(presentismo: presentismo, ausencia: ausencia) + calcularResultado(porcentaje: porcentaje, fijo: fijo, gerente: gerente)
    }
}

var sueldoDePepe: Sueldo = Sueldo()
sueldoDePepe.calcularSueldo(gerente: true, presentismo: true, ausencia: 0, porcentaje: false, fijo: true)
*/
/*
class Sueldo {
    var gerente: Bool
    var presentismo: Bool
    var ausencia: Int
    var porcentaje: Bool
    var fijo: Bool
    var sueldo: Int = 0
    var neto: Int = 0
    var bonoPresentismo: Int = 0
    var bonoResultado:Int = 0
    
    init(gerente: Bool, presentismo: Bool, ausencia: Int, porcentaje: Bool, fijo: Bool){
        self.gerente = gerente
        self.presentismo = presentismo
        self.ausencia = ausencia
        self.porcentaje = porcentaje
        self.fijo = fijo
    }
    
    func calcularNeto() {
        if self.gerente == true {
            self.neto = 1000
        } else {
            self.neto = 1500
        }
    }
    
    func calcularPresentismo(){
        if self.presentismo == true {
            switch ausencia {
            case 0:
                self.bonoPresentismo = 100
            case 1:
                self.bonoPresentismo = 50
            default:
                self.bonoPresentismo = 0
            }
        } else {
            self.bonoPresentismo = 0
        }
    }
    
    func calcularResultado() throws {
        if self.porcentaje == true && self.fijo == false {
            self.bonoResultado = Int(Double(neto) * 0.1)
        } else if porcentaje == false && fijo == true {
            self.bonoResultado = 80
        } else {
            self.bonoResultado = 0
        }
        if self.porcentaje == true && self.fijo == true {
            throw ErrorBono.doblebono
        }
    }
    
    func calcularSueldo() throws -> Int {
        calcularNeto()
        calcularPresentismo()
        try calcularResultado()
        self.sueldo = self.neto + self.bonoPresentismo + self.bonoResultado
        return self.sueldo
    }
}

enum ErrorBono: Error {
    case doblebono
}

var sueldoDePepe: Sueldo = Sueldo(gerente: true, presentismo: false, ausencia: 0, porcentaje: true, fijo: false)

do{
    try sueldoDePepe.calcularSueldo()
} catch {
    print("Error al colocar datos, no puede tener doble bono")
}
*/

class Categoria {
    func calcularNeto() -> Int {
        return 0
    }
}

class Gerente: Categoria {
    override func calcularNeto() -> Int {
        return 1000
    }
}

class Cadete: Categoria {
    override func calcularNeto() -> Int {
        return 1500
    }
}

class BonoPresentismo {
    func calcularPresentismo() -> Int {
        return 0
    }
}

class SinAusencia: BonoPresentismo {
    override func calcularPresentismo() -> Int {
        return 100
    }
}

class UnaAusencia: BonoPresentismo {
    override func calcularPresentismo() -> Int {
        return 50
    }
}

class BonoResultado {
    func calcularResultado(neto: Int) -> Int {
        return 0
    }
}

class Fijo: BonoResultado {
    override func calcularResultado(neto: Int) -> Int {
        return 80
    }
}

class Variable: BonoResultado {
    override func calcularResultado(neto: Int) -> Int {
        return Int(Double(calcularResultado(neto: neto)) * 0.1)
    }
}

class Sueldo {
    var categoria: Categoria
    var bonoResultado: BonoResultado
    var bonoPresentismo: BonoPresentismo
    
    init(categoria: Categoria, bonoResultado: BonoResultado, bonoPresentismo: BonoPresentismo){
        self.categoria = categoria
        self.bonoResultado = bonoResultado
        self.bonoPresentismo = bonoPresentismo
    }
    
    func calcularSueldo() -> Int {
        return categoria.calcularNeto() + bonoResultado.calcularResultado(neto: categoria.calcularNeto()) + bonoPresentismo.calcularPresentismo()
    }
}
var gerente: Gerente = Gerente()
var sinAusencia: SinAusencia = SinAusencia()
var bonoFijo: Fijo = Fijo()
var sueldoPepe: Sueldo = Sueldo(categoria: gerente, bonoResultado: bonoFijo, bonoPresentismo: sinAusencia)
sueldoPepe.calcularSueldo()
var sueldoAlan: Sueldo = Sueldo(categoria: Cadete(), bonoResultado: Variable(), bonoPresentismo: UnaAusencia())
sueldoAlan.calcularSueldo()


//Ejercicio 4

class Persona {
    private var celular: Celular
    private var compania: Compania
    private var listadoDeLlamadas: [Llamada] = []

    
    init(celular: Celular, compania: Compania){
        self.celular = celular
        self.compania = compania
    }
    
    func dineroGastadoEnLlamadas() -> Double {
        return compania.precioLlamadas(llamadas: listadoDeLlamadas)
    }
    
    func apagado() -> Bool {
        return celular.apagado()
    }
    
    func recargarCelular() {
        celular.recargarCelular()
    }
    
    func bateria() -> Double {
        return celular.bateria
    }
    
    func agregarLlamadas(llamada: Llamada) {
        listadoDeLlamadas.append(llamada)
    }
}

class Celular {
    var bateria: Double = 5.0
    
    init(bateria: Double){
        self.bateria = bateria
    }
    
    func apagado() -> Bool {
        return self.bateria <= 0
    }
    
    func recargarCelular(){
        self.bateria = 5.0
    }
    
    func duracionBateria(cantidadDeLlamadas: Int, duracionDeLlamadas: Double) -> Double {
        return 0
    }
}

class SamsungS21: Celular {
    override func duracionBateria(cantidadDeLlamadas: Int, duracionDeLlamadas: Double) -> Double {
        return self.bateria - (0.25 * Double(cantidadDeLlamadas))
    }
}

class Iphone: Celular {
    override func duracionBateria(cantidadDeLlamadas: Int, duracionDeLlamadas: Double) -> Double {
        return self.bateria - (0.1 * duracionDeLlamadas)
    }
}

class Compania {
    func precioLlamadas(llamadas: [Llamada]) -> Double {
        var sumador = 0.0
        for llamada in llamadas {
            sumador = sumador + precioLlamada(llamada: llamada)
        }
        return sumador
    }
    
    func precioLlamada(llamada: Llamada) -> Double {
        return 0
    }
}

class Movistar: Compania {
    override func precioLlamadas(llamadas: [Llamada]) -> Double {
        var sumador = 0.0
        for llamada in llamadas {
            sumador = sumador + llamada.duracionDeLlamada * 0.6
        }
        return sumador
    }
}

class Claro: Compania {
    override func precioLlamadas(llamadas: [Llamada]) -> Double {
        var sumador = 0.0
        for llamada in llamadas {
            sumador = sumador + ((llamada.duracionDeLlamada * 0.5) * 1.21)
        }
        return sumador
    }
}

class Personal: Compania {
    override func precioLlamadas(llamadas: [Llamada]) -> Double {
        var sumador = 0.0
        for llamada in llamadas {
            if llamada.duracionDeLlamada < 10 {
                sumador = sumador + (llamada.duracionDeLlamada * 0.7)
            }
            if llamada.duracionDeLlamada > 10 {
                let minutosRestantes: Double = llamada.duracionDeLlamada - 10.0
                sumador = sumador + 7.0 + (minutosRestantes * 0.4)
            }
        }
        return sumador
    }
}

class Llamada {
    var duracionDeLlamada: Double
    
    init(duracionDeLlamada: Double) {
        self.duracionDeLlamada = duracionDeLlamada
    }
    
}

var juliana: Persona = Persona(celular: SamsungS21(bateria: 5.0), compania: Claro())

let llamada = Llamada(duracionDeLlamada: 20.0)
juliana.agregarLlamadas(llamada: llamada)
juliana.agregarLlamadas(llamada: Llamada(duracionDeLlamada: 5.0))
juliana.agregarLlamadas(llamada: Llamada(duracionDeLlamada: 10.0))
juliana.agregarLlamadas(llamada: Llamada(duracionDeLlamada: 2.9))
juliana.dineroGastadoEnLlamadas()


