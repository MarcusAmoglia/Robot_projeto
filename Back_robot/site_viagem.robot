*** Settings ***
Library    SeleniumLibrary
Library    logica.py
Test Setup    que eu acesse o site PHP Travels

*** Variables ***
${url}            https://www.phptravels.net/
${browser}        Chrome

#Inputs do cadastro
${SINGUP_DROPDOWN}    //button[@class="btn light flex items-center gap-1.5"]
${SINGUP_BUTTON}    //span[text()='Customer Signup']   
${NAME_INPUT}    //input[@id="first_name"]
${LAST_NAME_INPUT}    //input[@id="last_name"]
${SINGUP_EMAIL}    //input[@type="email"]
${SINGUP_PASSWORD}    //input[@id="password"]
${SINGUP_CONFIPASSWORD}    //input[@id="confirm_password"]
${SINGUP_CHALLENGE}    //label[@for="captcha_answer"]
${SINGUP_CAPTCHA}    //input[@id="captcha_answer"]
${BUTTON_TERMS_OF_SERVICE}    //div[@class="checkbox-custom"]
${BUTTON_CREATE_ACCOUNT}    //button[@class="btn emerald w-full relative"]
${SUCESS_MESSAGE}    //div[@class="alert-success"]

#Inputs do login
${Login_button}   //span[@class="material-symbols-outlined !text-[18px]"]
${Email_input}    //input[@id="email"]
${Password_input}     //input[@id="password"]
${Confirm_button}    //button[@class="btn w-full"]

#Dados usuario
${Nome}     John
${Sobrenome}    Wick
${Email}    teste@gmail.com
${Senha}    123456789

#Sem categoria
${VERIFY_EMAIL}    //div[@class="space-y-3"]


*** Keywords ***

#Cadastro 

que eu acesse o site PHP Travels
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

eu acesso a tela de cadastro
    Wait Until Element Is Visible    ${SINGUP_DROPDOWN}
    Mouse Over    ${SINGUP_DROPDOWN}
    Execute Javascript    document.querySelector("a[href*='signup']").click()
    

eu preencho os campos de nome "John" e sobrenome "Wick"
    Sleep    3s
    Input Text    ${NAME_INPUT}    ${Nome}
    Sleep    3s
    Input Text    ${LAST_NAME_INPUT}    ${Sobrenome}

informo o e-mail de cadastro "teste@gmail.com"
    Wait Until Element Is Visible    ${SINGUP_EMAIL}
    Input Text    ${SINGUP_EMAIL}    ${Email}
    Sleep    3s

eu preencho a senha
    Input Text    ${SINGUP_PASSWORD}    ${Senha}
    Sleep    2s
    Input Text    ${SINGUP_CONFIPASSWORD}    ${Senha}
    Sleep    2S

resolvo o desafio matemático de segurança
    ${desafio}    Get Text    ${SINGUP_CHALLENGE}      
    ${resposta}    resolver_desafio_matematico    ${desafio}
    Input Text    ${SINGUP_CAPTCHA}    ${resposta}
    Sleep    2s
    Click Element    ${BUTTON_TERMS_OF_SERVICE}

clico no botão para finalizar o cadastro
    Click Button    ${BUTTON_CREATE_ACCOUNT}

o sistema deve exibir a mensagem de sucesso do registro
    ${sucesso}    Element Should Contain    ${SUCESS_MESSAGE}    Registration successful! 
    IF    '${sucesso}' == 'PASS'
        Log To Console    Sucesso!!
    ELSE    
        Close Browser
    END

#Login com Sucesso
eu acesso a tela de login
    Wait Until Element Is Visible    ${Login_button}
    Execute Javascript    document.querySelector("a[href*='https://phptravels.net/login']").click() 
eu informo o e-mail "teste@gmail.com"
    Wait Until Element Is Visible    ${Email_input}
    Input Text    ${Email_input}    ${Email}
    Sleep    2s
informo a senha "123456"
    Wait Until Element Is Visible    ${Password_input}
    Input Password    ${Password_input}    ${Senha}
clico no botão de login
    Wait Until Element Is Visible    ${Confirm_button}
    Click Button    ${Confirm_button}
o sistema deve exibir um pedido de confirmação de E-mail
    ${verifique_email}    Element Should Contain    ${VERIFY_EMAIL}    Please verify your email address before logging in.
    IF    '${verifique_email}' == 'PASS'
        Log To Console    Sucesso!!
    ELSE
        Close Browser
    END
    
    

         
          

*** Test Cases ***

# Feature: Gerenciamento de Usuário no PHP Travels
#Prática de front
Scenario TC01(Front): Cadastro com sucesso
        When eu acesso a tela de cadastro
        And informo o e-mail de cadastro "teste@gmail.com"
        And eu preencho os campos de nome "John" e sobrenome "Wick"
        And eu preencho a senha
        And resolvo o desafio matemático de segurança
        And clico no botão para finalizar o cadastro
        Then o sistema deve exibir a mensagem de sucesso do registro

Scenario TC02(Front): Login com sucesso
        When eu acesso a tela de login 
        And eu informo o e-mail "teste@gmail.com"
        And informo a senha "123456"
        And clico no botão de login
        Then o sistema deve exibir um pedido de confirmação de E-mail








