*** Settings ***
Documentation   Exemplo de escopo de variáveis: GLOBAIS, SUITE, TESTE (test case) e LOCAL (keyword)
Library         String

*** Variable ***
${GLOBAL_INSTANCIADA}     Minha variável GLOBAL_INSTANCIADA foi instanciada para a suíte

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01
    Uma keyword qualquer 02

Caso de teste de exemplo 02
    Uma keyword qualquer 02
    Uma keyword qualquer 03

Caso de teste de exemplo 03
    Uma keyword qualquer 04

*** Keywords ***
Uma keyword qualquer 01
    ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}     Generate Random String
    # A nova variável "GLOBAL_CRIADA_EM_TEMPO_EXECUCAO" recebe o valor retornado de "Generate Random String"

    Set Global Variable    ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}
    # A variável "GLOBAL_CRIADA_EM_TEMPO_EXECUCAO" se tornou global.
    # Pode ser sobrescrita

    Set Suite Variable     ${SUITE_CRIADA_EM_TEMPO_EXECUCAO}    Variável da suíte
    # A nova variável "SUITE_CRIADA_EM_TEMPO_EXECUCAO" recebe uma string e já é setada como visível na suite

    Set Test Variable      ${TESTE_01}   Variável do teste 01
    # A nova variável "TESTE_01" recebe uma string e já é setada como visível no caso de teste
    Log    ${TESTE_01}

    ${LOCAL}    Set Variable    Variável local da keyword 01
    # Primeiro declara a variável, chama a função e informa o valor a ser atribuído. Escopo sempre será local.

    Log   ${LOCAL}

Uma keyword qualquer 02
    ${LOCAL}     Set Variable    Variável local da keyword 02
    Log    ${LOCAL}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO} / ${LOCAL}
    # A keyword abaixo vai funcionar no Caso de Teste 01 e falhar no Case de Teste 02
    Log    ${TESTE_01}

Uma keyword qualquer 03
    ${LOCAL}     Set Variable    Variável local da keyword 03
    Log    ${LOCAL}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO} / ${LOCAL}

Uma keyword qualquer 04
    ${LOCAL}     Set Variable    Variável local da keyword 04
    Log    ${LOCAL}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO} / ${LOCAL}
