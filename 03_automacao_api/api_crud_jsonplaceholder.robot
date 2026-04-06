*** Settings ***  

Library    RequestsLibrary
Library    Collections
Test Setup    Criar_sessao_API

*** Variables ***
#Sessão
${SESSAO}    Teste
${API}        https://jsonplaceholder.typicode.com    

#Endpoints
${END_USUARIO}    /users/1
${END_POST}    /posts
${END_PUT}    /posts/1

#Dados
${NAME}    Bret

#Variaveis para tirar o erro 
${json}           ${None}
${search_user}    ${None}
${post_user}      ${None}
${put_id}         ${None}
${delete}         ${None}
${search_id}      ${None}

*** Keywords ***
Criar_sessao_API
    Create Session    ${SESSAO}    url=${API}    verify=True

#TC01
Faz a busca do usuario 1
    ${search_user}    GET On Session    ${SESSAO}    ${END_USUARIO}    
    ${json}    Set Variable    ${search_user.json()} 
    Set Test Variable   ${json}
    Set Test Variable    ${search_user}

Valido que o username é Bret  
    Should Be Equal    ${json}[username]    ${NAME}    


O Status deve ser igual a 200
    Status Should Be    200    ${search_user}    

#TC02
Eu crio um novo post
    ${dicionario}    Create Dictionary    title=Teste    body=SimTEste    userId=21 
    ${post_user}    POST On Session    ${SESSAO}  ${END_POST}  json=${dicionario}
    Set Test Variable    ${post_user}
O Status deve ser 201
    Status Should Be    201    ${post_user}
O ID gerado deve ser 101
    ${json}    Set Variable    ${post_user.json()}
    Should Be Equal As Integers   ${json}[id]    101

#TC03    
Eu atualizo o post 1
    ${dicionario}    Create Dictionary    title=Mudou    userId=1
    ${put_id}    PUT On Session    ${SESSAO}    ${END_PUT}    ${dicionario}     
    Set Test Variable    ${put_id}     
O Status deve ser 200
    Status Should Be    200    ${put_id}
O título deve ser atualizado para Post Editado
    ${json}    Set Variable    ${put_id.json()}
    Should Be Equal As Strings    ${json}[title]    Mudou

#TC04
Eu busco posts com filtro userId 1
    ${dicionario}    Create Dictionary    userId=1
    ${search_id}    GET On Session    ${SESSAO}    ${END_POST}    params=${dicionario}
    Set Test Variable    ${dicionario}
    Set Test Variable    ${search_id}

Status deve ser 200
    Status Should Be    200    ${search_id}

Deve retornar 10 posts
    ${json}    Set Variable    ${search_id.json()}
    ${quantidade}    Get Length    ${json}
    Should Be Equal As Integers    ${quantidade}    10

#TC05
Eu deleto o post 1
    ${delete}    DELETE On Session    ${SESSAO}    ${END_PUT}
    Set Test Variable    ${delete}
deve ser 200
    Status Should Be    200    ${delete}
    

*** Test Cases ***

Scenario TC01(Back): Buscar Usuario Bret (GET)
    When Faz a busca do usuario 1
    And Valido que o username é Bret
    Then O Status deve ser igual a 200


Scenario TC02(Back): Criar um novo Post (POST)
 
    When Eu crio um novo post
    And O Status deve ser 201
    Then O ID gerado deve ser 101


Scenario TC03(Back): Atualizar o Post ID 1 (PUT)
    
    When Eu atualizo o post 1
    And O Status deve ser 200
    Then O título deve ser atualizado para Post Editado


Scenario TC04(Back): Buscar posts do usuario 1 (GET com filtro)

    When Eu busco posts com filtro userId 1
    Then Status deve ser 200
    And Deve retornar 10 posts

Scenario TC05(Back): Deletar o Post ID 1 (DELETE)
 
    When Eu deleto o post 1
    Then deve ser 200