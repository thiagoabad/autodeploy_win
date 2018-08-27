# autodeploy_win
Auto deploy para gits locais em servidores Windows

Baseado no Simple automated GIT Deployment using GIT Hooks do noelboss:
https://gist.github.com/noelboss/3fe13927025b89757f8fb12e9066f2fa

Feito com AutoIT

Como funciona?
Se você tiver um repositório git local na sua rede ou PC e quiser que as mudanças que forem sendo feitas no repositório remoto sejam automaticamente enviadas para a pasta do servidor adequada esse programa é para você.

Foi pensado principalmente para uma equipe de desenvolvimento Python que queria que o código subisse automaticamente para um servidor de desenvolvimento, sendo asssim possivel que todos vissem o ponto atual do projeto na brach Master.

Pré-requisitos
Servidor Windows
Git instalado nesse servidor, na pasta program files (arquivos de programas)
Caso o repositório esteja em outra máquina, funcionará melhor se a pasta do repositório for mapeada um uma unidade.

Como usar

Crie um repositório
Não sabe fazê-lo? Siga esse passos:
https://www.blotdesign.com/article-detail.php?page=109

Baixe os executáveis desse projeto em uma pasta, juntos.
Edite o autodeploy.ini de modo a aceitar seu ambiente.
Execute o autodeploy.ini

Dicas:
1 - Funciona em mais de uma instância ao mesmo tempo, apenas crie pastas separadas com executáveis separados.
2 - Teste os acessos às pastas primeiro.
3 - Faça pelo menos 1 commit e um pull antes de executar.
4 - Coloque o sistema para rodar junto ao windows, via agendador de tarefas.
