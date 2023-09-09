*** Settings ***
Documentation    Exercício Dicionário
...    1 - Crie um arquivo de teste novo;
...    2 - Crie uma variável do tipo DICIONÁRIO na seção de variáveis globais que contenha nela os meses do ano e, para cada mês, informe o número de dias desse mês;
...    3 - Crie um teste que imprima no Console (Log To Console) cada mês e a sua respectiva quantidade de dias. 

*** Variables ***

&{MESES_DO_ANO}
...    primeiro=Janeiro
...    segundo=Fevereiro
...    terceiro=Março
...    quarto=Abril
...    quinto=Maio
...    sexto=Junho
...    setimo=Julho
...    oitavo=Agosto
...    nono=Setembro
...    decimo=Outubro
...    decimoPrimeiro=Novembro
...    decimoSegundo=Dezembro
    
&{QTD_Dias}
...    primeiro=31
...    segundo=28
...    terceiro=31
...    quarto=30
...    quinto=31
...    sexto=30
...    setimo=31
...    oitavo=31
...    nono=30
...    decimo=31
...    decimoPrimeiro=30
...    decimoSegundo=31

*** Test Cases ***
Imprimir Meses do ano
    Exibir a quantidade de dias do primeiro Mês do ano
    Exibir a quantidade de dias do segundo Mês do ano
    Exibir a quantidade de dias do terceiro Mês do ano
    Exibir a quantidade de dias do quarto Mês do ano
    Exibir a quantidade de dias do quinto Mês do ano
    Exibir a quantidade de dias do sexto Mês do ano
    Exibir a quantidade de dias do setimo Mês do ano
    Exibir a quantidade de dias do oitavo Mês do ano
    Exibir a quantidade de dias do nono Mês do ano
    Exibir a quantidade de dias do decimo Mês do ano
    Exibir a quantidade de dias do decimoPrimeiro Mês do ano
    Exibir a quantidade de dias do decimoSegundo Mês do ano
   
*** Keywords ***
 
Exibir a quantidade de dias do ${INDEX} Mês do ano
    Log To Console    O ${INDEX} mês do ano é conhecido como "${MESES_DO_ANO.${INDEX}}" e possui ${QTD_Dias.${INDEX}} dias.
