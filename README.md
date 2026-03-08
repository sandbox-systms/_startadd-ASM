## Um pequeno programa, completo que atravessa as três camadas.
---
Memoria do processo, chamadas de função, interface com o kernel.
---
O programa receberá 2 números, chamará uma função em Assembly para somá-los e exibirá 
o resultado no terminal. 

>>>Tudo em X86_64 - Linux.

## Fluxo 

_start 
|______ chama função soma (a, b)
|______ conversão de resultado para string 
|______ syscall write ---> imprime result. 