import cosas.*
import cuenta.*

object casa {
    const compras = []
    var cuentaBancaria = cuentaCorriente

    method categoriasCompradas(){

        return self.categoriasDeLasCompras().withoutDuplicates()
    }

    method categoriasDeLasCompras(){

        return  compras.map({compra => compra.categoria()})
    }


    method faltaComida(){

        return self.cantidadDeComidas() < 2
    }

    method cantidadDeComidas() = self.comprados(comida).size()



    method queFaltaComprar(cosas){

        return cosas.filter({cosa => self.compreEsto(cosa)})
    }

    method compreEsto(cosa){

        return not  compras.contains(cosa)
    }

    method malaEpoca(){

        return compras.all({compra => compra.esCategoria(comida)})
    }


    method comprados(categoria){

        return compras.filter({compra => compra.categoria() == categoria})
    }

    method compraMasCara(){

        return compras.max({compra => compra.precio() })
    }

    method esDerrochona(){

        return self.gastoTotal() > 9000
    }

    method gastoTotal() = compras.sum({compra=> compra.precio()})

    method vieneDeComprar(categoria){

        return self.ultimaCompra().categoria() == categoria
    }

    method ultimaCompra() = compras.last()

    method tieneAlgun(categoria){

        return compras.any({compra => compra.categoria() == categoria})
    }

    method cantidadDeCosasCompradas(){

        return compras.size()
    }

    method comprar(cosa){
        cuentaBancaria.extraccionPorCompra(cosa.precio())
        compras.add(cosa)
    }

    // Cree otro metodo  en cuentas por que me saltaba error en   todos los test de la casa de julian
    // por la excepcion que solo puede extraer  2000 pesos
    // y la heladera tiene un precio de 200000 mil

    method compras() = compras

    method cuentaBancaria() = cuentaBancaria

    method cuentaBancaria(_cuentaBancaria){
        cuentaBancaria = _cuentaBancaria
    }

    

}
