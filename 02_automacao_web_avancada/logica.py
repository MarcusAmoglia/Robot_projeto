import re

def resolver_desafio_matematico(frase):
    tradutor = {
        "zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5,
        "six": 6, "seven": 7, "eight": 8, "nine": 9, "ten": 10,
        "eleven": 11, "twelve": 12, "thirteen": 13, "fourteen": 14,
        "fifteen": 15, "sixteen": 16, "seventeen": 17, "eighteen": 18, 
        "nineteen": 19, "twenty": 20, "thirty": 30, "forty": 40,
        "fifty": 50, "sixty": 60, "seventy": 70, "eighty": 80, "ninety": 90,
        "hundred": 100
    }
    
    def converter_palavra_para_numero(texto):
        if '-' in texto:
            partes = texto.split('-')
            if len(partes) == 2:
                return tradutor[partes[0]] + tradutor[partes[1]]
        
        if ' ' in texto:
            partes = texto.split()
            if len(partes) == 2:
                if partes[1] == 'hundred':
                    return tradutor[partes[0]] * 100
                else:
                    return tradutor[partes[0]] + tradutor[partes[1]]
        
        return tradutor[texto]
    
    frase_limpa = frase.lower().replace('?', '').replace('what is', '').strip()
    
    for palavra_chave in ['twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']:
        for prox in ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']:
            frase_limpa = frase_limpa.replace(f"{palavra_chave} {prox}", str(tradutor[palavra_chave] + tradutor[prox]))
    
    for num in ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']:
        frase_limpa = frase_limpa.replace(f"{num} hundred", str(tradutor[num] * 100))
    
    for palavra, numero in tradutor.items():
        frase_limpa = frase_limpa.replace(palavra, str(numero))
    
    numeros = [int(x) for x in re.findall(r'\d+', frase_limpa)]
    
    if 'minus' in frase or '-' in frase:
        resultado = numeros[0] - numeros[1]
    elif 'times' in frase or 'multiplied' in frase or '*' in frase:
        resultado = numeros[0] * numeros[1]
    else:
        resultado = numeros[0] + numeros[1]
    
    return str(resultado)