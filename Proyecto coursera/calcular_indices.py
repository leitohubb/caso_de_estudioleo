def calcular_IMC(peso: float, altura: float) -> float:
    return peso / (altura ** 2)


def calcular_porcentaje_grasa(peso: float, altura: float, edad: int, valor_genero: float) -> float:
    IMC = calcular_IMC(peso, altura)
    porcentaje_grasa = (1.2 * IMC) + (0.23 * edad) - (10.8 * valor_genero) - 5.4
    return porcentaje_grasa


def calcular_calorias_en_reposo(peso: float, altura: float, edad: int, valor_genero: int) -> float:
    TMB = 10 * peso + 6.25 * (altura * 100) - 5 * edad + valor_genero
    return TMB


def calcular_calorias_en_actividad(peso: float, altura: float, edad: int, valor_genero: int, valor_actividad: float) -> float:
    TMB = calcular_calorias_en_reposo(peso, altura, edad, valor_genero)
    calorias_actividad = TMB * valor_actividad
    return calorias_actividad


def consumo_calorias_recomendado_para_adelgazar(peso: float, altura: float, edad: int, valor_genero: int) -> str:
    TMB = calcular_calorias_en_reposo(peso, altura, edad, valor_genero)
    rango_inferior = TMB * 0.8
    rango_superior = TMB * 0.85
    return f"Para adelgazar es recomendado que consumas entre: {rango_inferior:.2f} y {rango_superior:.2f} calorías al día."
    
    