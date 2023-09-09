*** Settings ***
Documentation    Exercício de Listas
*** Variables ***
@{MESES_DO_ANO}    
...    Janeiro    
...    Fevereiro    
...    Março    
...    Abril    
...    Maio    
...    Junho    
...    Julho    
...    Agosto    
...    Setembro    
...    Outubro    
...    Novembro    
...    Dezembro
*** Test Cases ***

Imprimir Meses do ano
    Imprimir o mês 0
    Imprimir o mês 1
    Imprimir o mês 2
    Imprimir o mês 3
    Imprimir o mês 4
    Imprimir o mês 5
    Imprimir o mês 6
    Imprimir o mês 7
    Imprimir o mês 8
    Imprimir o mês 9
    Imprimir o mês 10
    Imprimir o mês 11

*** Keywords ***
 
Imprimir o mês ${MES}
    Log To Console    ${MESES_DO_ANO[${MES}]}
    Log    ${MESES_DO_ANO[${MES}]}