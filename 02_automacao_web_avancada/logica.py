import re

def resolver_desafio_matematico(frase):
    tradutor = {
        "zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5,
        "six": 6, "seven": 7, "eight": 8, "nine": 9, "ten": 10,
        "eleven": 11, "twelve": 12, "thirteen": 13, "fourteen": 14,
        "fifteen": 15, "sixteen": 16, "seventeen": 17, "eighteen": 18, "nineteen": 19,
        "twenty": 20, "thirty": 30, "forty": 40, "fifty": 50,
        "sixty": 60, "seventy": 70, "eighty": 80, "ninety": 90,
        "hundred": 100
    }

    tokens = re.findall(r'\w+|\+|\*|\-', frase.lower())
    
    numeros = []
    operacao = "soma"
    acumulado = 0

    for t in tokens:
        v = None
        if t in tradutor:
            v = tradutor[t]
        elif t.isdigit():
            v = int(t)
        elif t in ['*', 'multiplied', 'times']:
            operacao = "multiplicacao"
            continue
        elif t in ['-', 'minus']:
            operacao = "subtracao"
            continue
        elif t in ['+', 'plus']:
            operacao = "soma"
            continue

        if v is not None:
            if v >= 20 and v < 100:
                acumulado = v
            elif v < 10 and acumulado > 0:
                numeros.append(acumulado + v)
                acumulado = 0
            else:
                numeros.append(v + acumulado)
                acumulado = 0

    if len(numeros) >= 2:
        n1, n2 = numeros[0], numeros[1]
        if operacao == "multiplicacao":
            res = n1 * n2
        elif operacao == "subtracao":
            res = n1 - n2
        else:
            res = n1 + n2
        return str(res)

    return "0"