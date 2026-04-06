# 📚 Guia de Exercícios de Automação

### 1. Estrutura Básica e Ciclo de Vida
[cite_start]**O Conceito:** Todo arquivo .robot é dividido em seções principais: Settings (bibliotecas), Variables (dados), Keywords (ações) e Test Cases (os testes em si)[cite: 1, 5, 8, 11, 12].

[cite_start]**O Exercício:** [cite: 11]
* [cite_start]Crie um script que utilize a SeleniumLibrary[cite: 11].
* [cite_start]Defina variáveis para armazenar valores de teste[cite: 11].
* [cite_start]Crie Keywords para abrir o site da Amazon e fechar o navegador logo em seguida[cite: 11].

---

### 2. Interação com Formulários (ID Locators)
**O Conceito:** A forma mais simples e performática de encontrar um elemento na tela é através do atributo `id`. [cite_start]É um identificador único que evita confusão para o robô[cite: 12].

[cite_start]**O Exercício:** [cite: 12, 13, 14]
* [cite_start]Acesse a página de login do The Internet Herokuapp[cite: 12].
* [cite_start]Utilize os locators do tipo `id=` para mapear os campos de usuário, senha e o botão de login[cite: 12].
* [cite_start]Realize o preenchimento, clique no botão e valide se a mensagem de sucesso aparece na tela[cite: 12].
* [cite_start]Implemente um Teardown para fechar o navegador apenas se o teste passar[cite: 14].

---

### 3. XPath e Localização Avançada
**O Conceito:** Quando o elemento não tem ID ou o ID é dinâmico, utilizamos o XPath. [cite_start]Ele funciona como um "endereço" completo do elemento no código da página[cite: 1].

[cite_start]**O Exercício:** [cite: 1, 2, 3, 4]
* [cite_start]Repita a automação de login do exercício anterior, mas agora é proibido usar IDs[cite: 1].
* [cite_start]Mapeie os inputs e botões utilizando a sintaxe `//tag[@atributo="valor"]`[cite: 1].
* [cite_start]Tente usar classes ou outros atributos para tornar o seletor mais preciso[cite: 1].

---

### 4. BDD e Escrita em Gherkin
[cite_start]**O Conceito:** O BDD (*Behavior Driven Development*) utiliza uma linguagem natural (Dado, Quando, Então) para que qualquer pessoa, técnica ou não, entenda o que o teste faz[cite: 8].

[cite_start]**O Exercício:** [cite: 8, 9, 10]
* [cite_start]Escolha um fluxo no YouTube (como buscar e dar play em uma música)[cite: 8].
* [cite_start]Escreva o caso de teste utilizando as palavras-chave Dado, Quando, E e Então[cite: 8, 10].
* [cite_start]Crie as Keywords correspondentes que executem cada um desses passos, incluindo esperas explícitas (`Wait Until...`) para lidar com anúncios[cite: 8, 9].

---

### 5. Automação de Back-end (API REST)
**O Conceito:** Testar o Back-end significa validar a comunicação entre sistemas através de APIs. [cite_start]Usamos a `RequestsLibrary` para enviar requisições e a `Collections` para validar as respostas[cite: 5].

[cite_start]**O Exercício:** [cite: 5, 6, 7]
* [cite_start]Configure uma sessão para a API JSONPlaceholder[cite: 5].
* [cite_start]Realize uma busca (GET) pelos posts do usuário 1[cite: 5].
* [cite_start]**Desafios de Validação:** [cite: 5, 6, 7]
    * [cite_start]Verifique se o código de status retornado é 200 (Sucesso)[cite: 5].
    * [cite_start]Converta a resposta para JSON[cite: 6].
    * [cite_start]Valide se a lista retornada contém exatamente 10 itens[cite: 5].
    * [cite_start]Garanta que todos os itens da lista pertencem ao `userId=1`[cite: 7].