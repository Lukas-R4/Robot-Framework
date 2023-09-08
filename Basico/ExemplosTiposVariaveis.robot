*** Settings ***
Documentation   Exemplo de tipos de variáveis: SIMPLES, LISTAS e DICIONÁRIOS
*** Variable ***
#Simples - Valor único
${SIMPLES}   Vamos ver os tipos de variáveis no robot!

#Tipo Lista (arrays) - separar itens com espaço duplo
@{FRUTAS}    morango   banana   maça   uva   abacaxi

#Tipo Dicionário (chave=valor) - separar cada chave=valor com espaço duplo
&{PESSOA}    nome=Lucas Rodrigues   email=lucas@exemplo.com.br   idade=25   sexo=masculino

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    # Lendo um valor Simples
    Log    ${SIMPLES}

    # Lendo um item de uma Lista
    Log    Essa tem que ser maça: ${FRUTAS[2]} e essa tem que ser morango: ${FRUTAS[0]}

    # Lendo chaves de um Dicionário
    Log    Nome: ${PESSOA.nome} e email: ${PESSOA.email}
