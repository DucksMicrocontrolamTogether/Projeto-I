**Esse é um projeto para matéria de Microcontroladores da Universidade Federal Do Paraná (2017/1)**

##A descrição do projeto

Projetar uma fechadura eletrônica para cofres.


1. Deverá possuir LCD, teclado matricial, buzzer sonoro e acionador eletromecânico baseado em motor-de-passo

2. O usuário deverá gravar duas senhas padrão de 04 dígitos na memória de programa.

3. Uma mensagem texto deverá aparecer apresentando o produto personalizado.

4. O teclado deverá conter, pelo menos, 0-9, ESC e ENTER

5. Ao digitar a senha, deve aparecer apenas * na tela, ao mesmo tempo que um beep sonoro curto deve soar a cada pressionar de tecla. Após digitar a senha, validar com ENTER.

6. Caso erre a senha, ou desista da operação, tecle ESC

7. A validação deverá ser visual no LCD com mensagens de senha correta ou incorreta. Caso senha esteja correta, um beep de 01 segundo deve soar e o motor-de-passo deverá acionar um mecanismo indicando a movimentação da lingueta de uma fechadura (acionador mecânico por conta da equipe).

8. Este mecanismo deverá ficar acionado por 03 segundos e posteriormente deverá recolher automaticamente à posição original.

9. Um beep sonoro indicando que a senha está correta deve ser acionado concomitantemente.

10. Caso o usuário digite a senha errada, um beep sonoro diferenciado de 02 segundos indicará senha incorreta. O mecanismo não deve ser acionado.

11. A cada tentativa de inserção de senha errada, o sistema deve ficar inerte por aproximadamente 03 segundos, voltando a automático após este tempo.

12. O teclado não deve possuir bounce

13. Caracteres estranhos no LCD idem.

14. Pode utilizar buzzer com oscilador interno
