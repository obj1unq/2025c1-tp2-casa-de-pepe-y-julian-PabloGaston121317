object cuentaCorriente{
    var  saldo = 0
    const limiteExtracion = 2000

    method depositar(monto){
        saldo += monto
    }

    method extraer(monto){
        self.validarExtraer(monto)
        saldo -= monto
    }

    method extraccionPorCompra(precio){
        saldo -= precio
    }

    method validarExtraer(monto){
        if ( ! self.extracionPemitida(monto)){
            self.error("No se puede hacer extraciones mayores a 2000 pesos")
        }
    }

    method extracionPemitida(monto){

        return monto < limiteExtracion
    }

    method saldo() = saldo.max(0)

    method saldo(_saldo){
        saldo = _saldo
    }
}

object cuentaConGastos{
    var property saldo = 0
    const costoPorDeposito = 20
    const limitePorDeposito = 1000

    method depositar(monto){
        self.validarDepositar(monto)
        saldo += monto
        saldo -= costoPorDeposito
    }

    method extraer(monto){
        saldo -= monto
    }

    method extraccionPorCompra(precio){
        saldo -= precio
    }

    method validarDepositar(monto){
        if(! self.depositoPermitido(monto)){
            self.error("el limite por deposito es de 1000")
        }
    }

    method depositoPermitido(monto) = monto <= limitePorDeposito
}