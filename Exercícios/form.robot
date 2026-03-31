*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${input_username}    id=username
${input_password}    id=password
${submit_button}     id=login
${flash_element}     id=flash

*** Keywords ***

    
abrir navegador/acessar site 
    Open Browser    https://the-internet.herokuapp.com/login    Edge

Esperar o navegador carregar 
    Wait Until Element Is Visible    ${input_username}    10s

preencher campos
    Input Text    ${input_username}    tomsmith 
    Input Password    ${input_password}    SuperSecretPassword! 

clicar em submit 
    Submit Form    ${submit_button}

Verificar login sucedido
    Element Should Be Visible   ${flash_element}
    Element Should Contain    ${flash_element}    You logged into a secure area!

Fechar navegador se passar
    IF    '${TEST_STATUS}' == 'PASS'
        Close Browser
    END

    
*** Test Cases ***

Cenário 1: Preencher Formulário
    abrir navegador/acessar site 
    preencher campos
    clicar em submit
    Verificar login sucedido
    [Teardown]     Fechar navegador se passar