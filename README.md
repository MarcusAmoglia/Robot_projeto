# 🤖 AUTOMAÇÃO DE TESTES: ROBOT FRAMEWORK (E2E & API)

## 🚀 VISÃO GERAL DO PROJETO

Este projeto consolida automações de testes cobrindo **todo o ciclo de uma aplicação**, com foco em demonstrar na prática a aplicação de **Engenharia de Software voltada para QA**.

A solução utiliza o **Robot Framework** integrado com **Python**, permitindo lidar com cenários mais complexos tanto em **interfaces web (E2E)** quanto em **validação de APIs REST**.

---

## 🧠 DIFERENCIAL TÉCNICO: INTEGRAÇÃO ROBOT + PYTHON

O grande destaque do projeto é a resolução de desafios reais de automação, como **Captcha Matemático no front-end**.

Em vez de depender apenas de keywords padrão, foi desenvolvida uma **library customizada em Python**, onde:

- O Robot captura o texto do desafio diretamente da interface  
- O Python processa a lógica matemática  
- O resultado é retornado automaticamente para o fluxo de teste  

### 💡 Isso demonstra:

- Extensão do framework com código puro  
- Uso de **Expressões Regulares (Regex)** para tratamento de dados  
- Aplicação prática de **lógica de programação na automação**  
- Capacidade de resolver problemas reais fora do "happy path"  

---

## 🛠️ TECNOLOGIAS E BIBLIOTECAS

### 🔹 Linguagem
- **Python 3.x**

### 🔹 Framework
- **Robot Framework**

### 🔹 Principais Bibliotecas

- **SeleniumLibrary**  
  → Automação de interface web (interação com elementos, cliques, inputs)

- **RequestsLibrary**  
  → Testes de integração e validação de APIs REST

- **Collections**  
  → Manipulação avançada de listas e dicionários dentro dos testes

---

## 🎯 CONCEITOS E PRÁTICAS APLICADAS

### 🌐 AUTOMAÇÃO WEB (FRONT-END)

- **BDD (Gherkin)**  
  → Escrita de cenários em Português, aproximando testes da regra de negócio  

- **Sincronização (Anti-flakiness)**  
  → Uso de `Wait Until...` para garantir estabilidade e confiabilidade  

- **Mapeamento de Elementos**  
  → Estratégias com **XPath** e **ID** para localização precisa  

- **Fluxos E2E**  
  → Simulação completa da jornada do usuário  

---

### 🔌 AUTOMAÇÃO DE API (BACK-END)

- **Ciclo CRUD completo**  
  → Validação de **GET, POST, PUT e DELETE**  

- **Validação de Dados (Data Validation)**  
  → Conferência de **status codes** e estrutura de respostas JSON  

- **Filtros e Query Params**  
  → Testes com parâmetros dinâmicos em requisições  

- **Validação de Integridade**  
  → Garantia de consistência dos dados retornados pela API  

---

## 🏁 CONCLUSÃO

Este projeto não é apenas uma automação simples — ele demonstra **maturidade técnica em QA**, indo além do básico ao integrar lógica de programação com automação.

O resultado é uma solução mais **robusta, inteligente e preparada para cenários reais de mercado**.
