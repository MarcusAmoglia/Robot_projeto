*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${variavel1}    teste
${variavel2}    h
${variavel3}    12313

*** Keywords ***
Abrir site amazon  
    Open Browser    https://www.amazon.com.br/    Edge

Fechar Navegador
    Close Browser


*** Test Cases ***

Abrir site da amazon e fechar em seguida
    Abrir site amazon
    Fechar Navegador

