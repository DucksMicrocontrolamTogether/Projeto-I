**Esse � um projeto para mat�ria de Microcontroladores da Universidade Federal Do Paran� (2017/1)**

*A descri��o do projeto*

Projetar uma fechadura eletr�nica para cofres.


-Dever� possuir LCD, teclado matricial, buzzer sonoro e

acionador eletromec�nico baseado em motor-de-passo

-O usu�rio dever� gravar duas senhas padr�o de 04 d�gitos

na mem�ria de programa.

-Uma mensagem texto dever� aparecer apresentando o

produto personalizado.

-O teclado dever� conter, pelo menos, 0-9, ESC e ENTER

-Ao digitar a senha, deve aparecer apenas * na tela, ao

mesmo tempo que um beep sonoro curto deve soar a cada

pressionar de tecla. Ap�s digitar a senha, validar com ENTER.

-Caso erre a senha, ou desista da opera��o, tecle ESC

-A valida��o dever� ser visual no LCD com mensagens de

senha correta ou incorreta. Caso senha esteja correta, um

beep de 01 segundo deve soar e o motor-de-passo dever�

acionar um mecanismo indicando a movimenta��o da lingueta

de uma fechadura (acionador mec�nico por conta da equipe).

-Este mecanismo dever� ficar acionado por 03 segundos e

posteriormente dever� recolher automaticamente � posi��o

original.

-Um beep sonoro indicando que a senha est� correta deve

ser acionado concomitantemente.

-Caso o usu�rio digite a senha errada, um beep sonoro

diferenciado de 02 segundos indicar� senha incorreta. O

mecanismo n�o deve ser acionado.

-A cada tentativa de inser��o de senha errada, o sistema

deve ficar inerte por aproximadamente 03 segundos, voltando

a autom�tico ap�s este tempo.

-O teclado n�o deve possuir bounce

-Caracteres estranhos no LCD idem.

-Pode utilizar buzzer com oscilador interno