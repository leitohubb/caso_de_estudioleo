def calcular_IMC(peso: float, altura: float,) ->float:
 imc = peso / (altura **2)
 return imc

def calcular_porcentaje_grasa(peso: float, altura: float, edad: int, valor_genero: float,) ->float:
    imc = calorias_reposo = (10 * peso) + (6.25 * altura) - (5 * edad) + valor_genero
    return calorias_reposo

def solicitar_datos():
    peso = float (input("Ingrese su peso en Kilogramos: "))
    altura = float(input("Ingrese su altura en metros: "))
    