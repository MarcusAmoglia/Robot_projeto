🤖 **Automação de Testes: Robot Framework (E2E & API)**

Este projeto consolida automações de testes cobrindo todo o ciclo de uma aplicação. O foco principal é demonstrar a aplicação de Engenharia de Software no QA, utilizando o **Robot Framework** integrado com **Python** para resolver desafios de interface e validação de dados em APIs REST.

---

🧠 **Diferencial Técnico: Integração Robot + Python**

O ponto alto do projeto é a superação de desafios de segurança no front-end, como **Captcha Matemático**.

Em vez de usar apenas comandos básicos, foi desenvolvida uma library customizada em Python. O Robot captura o desafio textual da tela, e o script Python processa a lógica aritmética para retornar o resultado correto automaticamente.

Isso demonstra:

- Capacidade de estender o framework com código puro  
- Uso de **Expressões Regulares (Regex)** para tratamento de strings  
- Domínio de lógica de programação aplicada à automação  

---

🛠️ **Tecnologias e Bibliotecas**

- **Linguagem:** Python 3.x  
- **Framework:** Robot Framework  

**Principais bibliotecas:**

- SeleniumLibrary → Automação de interface web  
- RequestsLibrary → Testes de integração de API  
- Collections → Manipulação de listas e dicionários  

---

🎯 **Conceitos e Práticas Aplicadas**

**Automação Web (Front-end)**

- BDD (Gherkin) → Escrita de cenários em Português para clareza de negócio  
- Sincronização → Uso de `Wait Until...` para garantir estabilidade (anti-flakiness)  
- Mapeamento de elementos → Uso de XPath e ID  

**Automação de API (Back-end)**

- Ciclo CRUD → Validação de GET, POST, PUT e DELETE  
- Data Validation → Verificação de status codes e integridade de JSON  
- Filtros → Uso de parâmetros (Query Strings)  