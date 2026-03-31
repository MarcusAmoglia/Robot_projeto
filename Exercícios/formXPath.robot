*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${input_username}    //input[@name="username"]
${input_password}    //input[@type="password"]
${submit_button}     //button[@class="radius"]
${flash_element}     //div[@class="flash success"] 

#Isso feito acima de chama Xpath é mais preciso para localizar os elementos etc
#Caso tenha um option você utiliza [contains(text(),"Nome que está na opção")]


*** Keywords ***

    
abrir navegador/acessar site 
    Open Browser    https://the-internet.herokuapp.com/login    Edge

Esperar o navegador carregar 
    Wait Until Element Is Visible    ${input_username}    10s

preencher campos
    Input Text    ${input_username}    tomsmith 
    Input Password    ${input_password}    SuperSecretPassword! 

clicar em submit 
    Click Element    ${submit_button}

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