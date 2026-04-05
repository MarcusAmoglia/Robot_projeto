*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}            https://www.youtube.com/  
${browser}        Edge  
${SearchBar}      //input[@class="ytSearchboxComponentInput yt-searchbox-input title"]
${Submit}         //button[@aria-label="Search"]
${Video_index}    (//a[@id="video-title"])[1]
${skip_jaba}      //button[@class="ytp-skip-ad-button"]
*** Keywords ***
Dado que eu acesso o site do youtube
    Open Browser    ${url}    ${browser}
Quando digito o nome da música
    Input Text    ${SearchBar}    Cafuné Tek it 
E clico no botão buscar 
    Click Button    ${Submit} 
E clico na primeira opção da lista
    Wait Until Element Is Visible    ${Video_index}    5s
    Click Element    ${Video_index}
E pulo o anúncio 
    Wait Until Element Is Visible    ${skip_jaba}    14s
    Click Button    ${skip_jaba}
Então o vídeo é executado 
        Log    Teste Passou
     

       
                       

*** Test Cases ***
Cenário: Executar vídeo no youtube 
    Dado que eu acesso o site do youtube 
    Quando digito o nome da música
    E clico no botão buscar 
    E clico na primeira opção da lista 
    E pulo o anúncio
    Então o vídeo é executado 
