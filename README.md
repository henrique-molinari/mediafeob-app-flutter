# Minha Nota UNIFEOB 🎓

O **Minha Nota UNIFEOB** é uma solução mobile desenvolvida para auxiliar os estudantes da instituição a gerirem seu desempenho acadêmico de forma precisa. O aplicativo automatiza os cálculos das médias bimestrais e semestrais, respeitando os pesos de cada avaliação (AIA, PI, P1/P2), e oferece uma funcionalidade preditiva.

---

## 🚀 Visão do Produto

Diferente de calculadoras genéricas, este app é customizado para as regras de negócio da **UNIFEOB**, eliminando a necessidade de cálculos manuais complexos e ajudando o aluno a focar no que importa: os estudos.

### Funcionalidades Principais
* **Cálculo Detalhado por Bimestre:** Campos específicos para P1/P2, AIA, PI e Notas Atitudinais.
* **Feedback de Status:** Alertas visuais indicando se o aluno está aprovado ou de recuperação.
* **Calculadora Inversa ("Quanto falta?"):** Informa exatamente quanto o aluno precisa tirar no 2º Bimestre para atingir a média de aprovação.
* **Design Institucional:** Interface moderna utilizando as cores Amarelo e Vermelho.

---

## 🛠️ Arquitetura e Tecnologias

O projeto adota a arquitetura **MVVM (Model-View-ViewModel)** para garantir um código limpo, testável e de fácil manutenção.

* **Linguagem:** Dart
* **Framework:** Flutter (Android & iOS)
* **Gerência de Estado:** Provider (ChangeNotifier)
* **Arquitetura:** Clean Architecture simplificada com foco em Features.

### Estrutura de Pastas (lib/src)
```text
├── core/
│   ├── theme/          # Configuração de cores (Amarelo/Vermelho) e estilos globais.
│   └── utils/          # Constantes e fórmulas matemáticas de cálculo.
├── features/
│   └── score_calculator/
│       ├── model/      # Entidades de dados e lógica de negócio.
│       ├── view/       # Interface do usuário (Telas).
│       ├── view_model/ # Lógica de estado e ponte entre dados e UI.
│       └── widgets/    # Componentes específicos da funcionalidade.
└── main.dart           # Ponto de entrada da aplicação.
```

---

## 📊 Regras de Cálculo (Métricas UNIFEOB)

O sistema utiliza a seguinte composição de notas:

### 1º Bimestre (Máximo 10,0)
* **Prova 1 (P1):** 7,0 pts
* **AIA:** 1,5 pts
* **Atitudinais:** 1,5 pts

### 2º Bimestre (Máximo 10,0)
* **Prova 2 (P2):** 4,0 pts
* **Validação PI:** 1,5 pts
* **Apresentação PI:** 1,5 pts
* **AIA:** 1,5 pts
* **Atitudinais:** 1,5 pts

> **Média Final:** $\frac{B1 + B2}{2} \geq 7,0$ para aprovação direta.

---

## 🏗️ Como Rodar o Projeto

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/henrique-molinari/minha-nota-unifeob.git](https://github.com/henrique-molinari/minha-nota-unifeob.git)
    ```
2.  **Entre na pasta do projeto:**
    ```bash
    cd minha_nota_unifeob
    ```
3.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```
4.  **Execute o aplicativo:**
    ```bash
    flutter run
    ```

---
Desenvolvido por Henrique Molinari para facilitar a jornada dos estudantes da UNIFEOB.
