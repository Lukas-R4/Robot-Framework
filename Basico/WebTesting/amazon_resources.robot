*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}    https://www.amazon.com.br/
${MENU_ELETRONICOS}    (//a[contains(@tabindex,'0')])[12]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${BOTAO_PESQUISAR}    nav-search-submit-button
${XBOX_SERIES_S}    (//a[contains(.,'Xbox Series S')])[3]
${BTN_ADICIONAR_AO_CARRINHO}     add-to-cart-button
${AVISO_SUCESSO}    NATC_SMART_WAGON_CONF_MSG_SUCCESS
${CARRINHO}    nav-cart
${CARRINHO_VAZIO}    //h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    ${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    ${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//img[contains(@alt,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    twotabsearchtextbox    ${PRODUTO}

Clicar no botão de pesquisa
    Click Element    ${BOTAO_PESQUISAR}

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Page Contains    ${PRODUTO}

# GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
Então o título da página deve ficar "${TITULO}"
    Verificar se o título da página fica "${TITULO}"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S"

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element    ${XBOX_SERIES_S}
    Wait Until Element Is Visible    ${BTN_ADICIONAR_AO_CARRINHO}
    Click Element    ${BTN_ADICIONAR_AO_CARRINHO}
    Wait Until Element Is Visible    ${AVISO_SUCESSO}
    Page Should Contain    Adicionado ao carrinho

Verificar se o produto "${NOME_PRODUTO}" foi adicionado com sucesso
    Click Element    ${CARRINHO}
    Element Should Contain    sc-active-cart    ${NOME_PRODUTO}

Remover o produto "${NOME_PRODUTO}" do carrinho
    Verificar se o produto "${NOME_PRODUTO}" foi adicionado com sucesso
    Click Element    //input[@value='Excluir']
    Wait Until Element Is Visible    ${CARRINHO_VAZIO}
    Page Should Contain    foi removido de Carrinho de compras.

Verificar se o carrinho fica vazio
    Click Element    ${CARRINHO}
    Page Should Contain    Seu carrinho da Amazon está vazio