*** Settings ***
Documentation    
...    1 - Crie um arquivo de teste novo;

...    2 - Cria uma nova keyword, onde ela nos produzirá um e-mail customizado com as seguintes regras:

...    Essa keyword deve receber por argumento o nome e sobrenome de uma pessoa

...    Essa keyword deve gerar uma palavra aleatória que será usada na composição do e-mail (DICA: olhe na documentação da Library String ou Library Faker para achar uma keyword que gere essa palavra aleatória)

...    Junte o nome + sobrenome + palavra aleatória + @testerobot.com e retorne esse e-mail montado ao final da keyword. Exemplo: MayFernandesWedd34Dd@testerobot.com

...    3 - Crie um teste que vai chamar essa keyword, passar os argumentos esperados e armazenar o valor retornado em uma nova variável simples;

...    4 - Faça um Log To Console para imprimir essa variável simples.


Library    String

*** Variables ***

&{USUARIO}    nome=Lucas    sobrenome=Rodrigues

*** Test Cases ***

Criação de email
    ${EMAIL_CUSTOMIZADO}    Criar um novo e-mail customizado    ${USUARIO.nome}    ${USUARIO.sobrenome}
    Log    E-mail Criado com sucesso! "${EMAIL_CUSTOMIZADO}"
    Log To Console    E-mail Criado com sucesso! "${EMAIL_CUSTOMIZADO}"

*** Keywords ***

Criar um novo e-mail customizado
    [Arguments]    ${NOME}    ${SOBRENOME}
    ${PALAVRA_ALEATORIA}    Generate Random String
    ${DOMINIO}    Set Variable    testerobot.com
    [Return]    ${NOME}${SOBRENOME}${PALAVRA_ALEATORIA}@${DOMINIO}
    