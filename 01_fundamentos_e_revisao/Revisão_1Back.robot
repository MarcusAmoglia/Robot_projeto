*** Settings ***
Library    RequestsLibrary
Library    Collections
Test Setup    Criar sessão api 

*** Variables ***

${API}    https://jsonplaceholder.typicode.com
${SESSAO}    TESTANDO
#Endpoints
${POSTS}    /posts
${POST_USER1}    /posts?userId=1
${DATA_USER1}    /users/1

#Remover erros
${busca_user1}    ${None}
${json}    ${None}

*** Keywords ***
Criar sessão api
    Create Session    ${SESSAO}    url=${API}    verify=True

eu busco os posts do usuario 1
    ${busca_user1}    GET On Session    ${SESSAO}    ${POST_USER1}
    ${json}    Set Variable    ${busca_user1.json()}
    Set Test Variable    ${busca_user1}
    Set Test Variable    ${json}

o status deve ser 200
    Status Should Be    200    ${busca_user1}

deve retornar 10 posts
    ${lenght}    Get Length    ${json}
    Should Be Equal As Integers    ${lenght}    10
    
todos os posts devem ter userId igual a 1
    ${dicionario}    Create Dictionary    userId=1  
    ${search_id}    GET On Session    ${SESSAO}    ${POSTS}    json=${dicionario}


*** Test Cases ***
Scenario: Buscar posts do usuario 1 e validar
    When eu busco os posts do usuario 1
    Then o status deve ser 200
    And deve retornar 10 posts
    And todos os posts devem ter userId igual a 1