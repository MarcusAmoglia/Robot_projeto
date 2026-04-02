*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${API_URL}      https://jsonplaceholder.typicode.com
${SESSAO}       sessao_independente  

# Endpoints
${ENDPOINT_USERS}    /users/1
${ENDPOINT_POSTS}    /posts

*** Test Cases ***

Desafio 01: Buscar Usuario Bret (GET)
    [Documentation]    Valida se o usuário ID 1 tem o username 'Bret'
    [Setup]    Create Session    ${SESSAO}    url=${API_URL}    verify=True

    # Faz a busca
    ${response}=    GET On Session    ${SESSAO}    ${ENDPOINT_USERS}
    
    # Validações
    Status Should Be    200    ${response}
    ${json}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${json}[username]    Bret
    Log To Console    \n[PASS] Usuario Bret encontrado com sucesso!

Desafio 02: Criar um novo Post (POST)
    [Documentation]    Simula o cadastro de um novo post e valida o ID 101
    [Setup]    Create Session    ${SESSAO}    url=${API_URL}    verify=True

    # 1. Monta o dicionário (Corpo da requisição)
    ${meu_payload}    Create Dictionary    title=QA    body=Engenharia de Software    userId=1

    # 2. Envia os dados e guarda a resposta
    ${response}=    POST On Session    ${SESSAO}    ${ENDPOINT_POSTS}    json=${meu_payload}

    # 3. Valida se foi criado (201)
    Status Should Be    201    ${response}

    # 4. Extrai o JSON da resposta do SERVIDOR
    ${json_resposta}=    Set Variable    ${response.json()}
    
    # Valida o ID que o servidor gerou (JSONPlaceholder sempre gera 101)
    Should Be Equal As Numbers    ${json_resposta}[id]    101
    Log To Console    \n[PASS] Post criado com ID: ${json_resposta}[id]

Desafio 03: Atualizar o Post ID 1 (PUT)
    [Documentation]    Simula a edição de um post que já existe
    [Setup]    Create Session    ${SESSAO}    url=${API_URL}    verify=true

    # 1. Prepare os novos dados (Dicionário)
    # Crie o dicionário com id=1, title=Post Editado, body=Qualquer coisa e userId=1
    ${dicionario}    Create Dictionary    id=1    title=Post Editado    body=Qualquer coisa      userId=1      
   

    # 2. Faça a requisição PUT
    # Use o comando PUT On Session no endpoint /posts/1 passando o json=${payload_editado}
    ${response}    PUT On Session    ${SESSAO}    /posts/1    json=${dicionario}
   

    # 3. Valide o Status Code
    # Verifique se o servidor respondeu 200 (OK)
    Status Should Be    200    ${response}
    
    # 4. Verifique se a alteração "pegou"
    # Extraia o JSON da resposta e valide se o 'title' é o novo que você inventou
    ${json_resposta}    Set Variable    ${response.json()}
  
     
    # Use o Should Be Equal aqui
    Should Be Equal    ${json_resposta}[title]    Post Editado
    Log To Console    \n[PASS] Post 1 atualizado com sucesso!