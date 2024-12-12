# ✨ Flappy Bird - Implementação em Assembly para o Processador do ICMC ✨

Este repositório contém a implementação do jogo Flappy Bird utilizando a linguagem Assembly, adaptada para o processador do Instituto de Ciências Matemáticas e de Computação (ICMC). O projeto foi desenvolvido como parte da disciplina **SSC0513-BSI - Organização e Arquitetura de Computadores**, ministrada pelo Professor Eduardo do Valle Simões, no segundo semestre do curso de Bacharelado em Sistemas de Informação. 🌟

## 🔖 Conteúdo do Repositório

- **game.asm**: Implementação principal do jogo em Assembly, contendo todas as funções necessárias para a execução do jogo no processador do ICMC.
- **game.c**: Versão do jogo em linguagem C, utilizada para facilitar testes e entendimento da lógica geral antes da implementação em Assembly. ✨

## 🎮 Como Funciona

### 🔄 Objetivo do Jogo
O jogador controla um pássaro que deve desviar de obstáculos (cano). O objetivo é acumular a maior pontuação passando entre os canos. 🌟

### ⚔️ Controles
- **Espaço**: Faz o pássaro "voar" (movimento para cima). ✨

### 🌀 Lógica do Jogo
1. **Cálculo de gravidade**: O pássaro é puxado para baixo após cada quadro, simulando o efeito da gravidade.
2. **Detecção de colisão**: O jogo verifica se o pássaro colidiu com um obstáculo ou com os limites da tela.
3. **Pontuação**: A cada cano ultrapassado, o jogador ganha um ponto. 🎮

## 🔧 Como Rodar o Projeto

### 📁 Rodar o Código Assembly

1. Certifique-se de ter o simulador do processador do ICMC configurado.
2. Compile o arquivo `game.asm` utilizando o compilador adequado ao processador.
3. Carregue o código compilado no simulador e execute. ✨

### 🔧 Rodar a Versão em C

1. Certifique-se de ter um compilador C instalado (como GCC).
2. Compile o código utilizando o comando:
   ```bash
   gcc -o flappy_bird game.c
   ```
3. Execute o programa:
   ```bash
   ./flappy_bird
   ```

## 🌐 Requisitos do Sistema
- Para a versão Assembly: Simulador do processador do ICMC. [Baixe aqui](https://gitlab.com/simoesusp/disciplinas/-/blob/master/SSC0513-BSI_Organizacao-e-Arquitetura-de-Computadores/Simulador_Windows_Tudo_Pronto_F%C3%A1cil.zip?ref_type=heads).
- Para a versão em C: Ambiente Windows com suporte às bibliotecas `conio.h` e `windows.h`. ✨

## 🏆 Créditos
O projeto foi desenvolvido por Miguel Filippo Rocha Calhabeu. Para dúvidas ou sugestões, entre em contato via e-mail: migue.calhabeu@gmail.com. ✨

## 🕵️‍♂️ Observações Adicionais
- O jogo foi implementado como um desafio acadêmico, explorando as funcionalidades do processador do ICMC e os conceitos de organização de computadores.
- Melhorias na otimização do código Assembly podem ser realizadas para maior eficiência.
- A implementação em C serve como um apoio para entender a lógica do jogo de forma mais abstrata antes de traduzí-la para Assembly. 🎮
