Aula 01

https://www.youtube.com/watch?v=WVLhm1AMeYE&index=1&list=PLuN4DpjKVR1omeTtjvJRGU1_J8MsFN-fv

Para configurar o git

git config --global git.name "MTF"
git config --global git.email "marcos.fornaroli@matera.com"

Aula 02

https://www.youtube.com/watch?v=-GhA2JPImgU&list=PLuN4DpjKVR1omeTtjvJRGU1_J8MsFN-fv&index=2

git init (Para criar um .git)

git add . (manda para stage area todos os arquivos novos e alterados). Manda para a staged area
git add *.txt (adciona todos os arquivos .txt)

git commit -m "mensagem para identificar o commit" (tira da staged area e manda para o repositório).


Aula 03

https://www.youtube.com/watch?v=bDLEBDaS3ao&index=3&list=PLuN4DpjKVR1omeTtjvJRGU1_J8MsFN-fv

-> Pra consultar todas as alterações que foram feitas em um arquivo que ainda não foi enviada para a staged area

git diff (irá demonstrar em verde qual foi a sua alteração.

-> Para consultar os arquivos que estão na staged area e que já tinha sido git add .

git diff --staged

-> Para mostrar o log de todos os commits

git log

-> Para ver mais informações do log (além de mostrar o histórico do commit, mostra também o diff de cada arquivo que foi alterado).

git log -p

Para mostrar um único commit na consulta

git log -p -1

-> Para visualizar o editor pra mostrar as alterações (visualizador de relatório de alterações do git)

gitk


Aula 04

https://www.youtube.com/watch?v=dRV13jZqhU0&list=PLuN4DpjKVR1omeTtjvJRGU1_J8MsFN-fv&index=4

-> Quando vc comita algo antes da hora, falta coisas para implementar.


O comando abaixo mostra o commit e as coisas que foram alteradas.

git log --pretty=oneline


-> Para editar o ultimo commit efetuado ( faz a alteração desejada)

git add . (para adicionar a alteração)

git commit --amend -m "Novas funcionalidades (edicao)"   irá adicionar a alteração ao último commit efetuado

git log --pretty=oneline (para consultar o log do commit)

-> Caso dê um git add . para incluir um novo arquivo para a staged area e não quer comitar o arquivo, ou seja, quer retirar da staged area

git reset HEAD <nome do arquivo com extensão>

-> Caso faça alterações e dê um git add . no arquivo e queira descartar essas alterações (Você reverte o arquivo para o último status do arquivo do commit).
 
git checkout -- <nome do arquivo>


-> Para remover um arquivo

git rm <nome aruquivo>  (obs. caso tenha arquivos alterados, novos arquivos e arquivo deletados. Primeiro deve-se excluir os arquivos com git rm e depois git add . para os arquivos novos e alterados).


Aula 05

https://www.youtube.com/watch?v=Fhd8OKIDQ5M&list=PLuN4DpjKVR1omeTtjvJRGU1_J8MsFN-fv&index=5

-> Como listar as tags

git tag

-> Para criar uma tag e com uma descrição

git tag -a v1.0 -m "Versao 1.0"

obs. -a é uma tag anotada, quem criou, qdo criou

-> Para mostrar os detalhes de uma tab

git show v1.0

-> Para ver os arquivos que estão em uma tag

git checkout v1.0

-> Para voltar a tag original

git checkout master

-> Para deletar uma tag

git tag -d v1.1

Obs. tag é somente um ponteiro

o Importante é usar os branches (MASTER é o branch padrão)

-> Criar uma nova ramificação para o branch

git branch teste

git checkout teste (move os arquivos o branch criado).

git checkout -b teste (cria o branch e move os arquivos).

com isso pode-se alterar os arquivos nesta branch e depois voltar para o master (git checkout master). Neste caso teremos uma branch teste

-> Para comparar as versões entre a teste e a master (teste é a origem e a master é o destino) . Você tem que estar na destino para fazer o merge.

git merge teste (Neste caso vc traz as alterações que foram feitas no branch teste para a master e depois pode deletar a teste se quiser)

Obs: quando houver alterações no teste2 e também no mesmo código alteração no master... ao efetuar o git merge teste2 dará conflito e você terá que tomar a decisão qual lógica será a válida.


Aula 06   (Aqui é um servidor local)

https://www.youtube.com/watch?v=fRQrnWqDLn0&list=PLuN4DpjKVR1omeTtjvJRGU1_J8MsFN-fv&index=6

Criando um servidor e inicializando  (cria um repositório com o nome BARE) e já cria alguns arquivos na pasta cliente1

git init --bare (irá inicializar na pasta onde está seu projeto)

-> Para clonar o repositório para sua máquina local (deve estar na sua pasta de trabalho local)

git clone file:////CP4461/projetos/cliente1

git clone file:////CP4461/projetos/cliente1 prjrede1 (vc redefine a sua pasta para prjrede1)

-> Para ver o nome do seu servidor onde vc fez o clone

git remote (vai mostrar com o nome origin)

git push origin master  (manda para o servidor o projeto que esta na master e com isso poderá compartilhar com os demais desenvolvedores). Com isso quem fizer um git clone já irá pegar o projeto atualizado com as alterações que vc já fez.

Obs. o push vc mandar para o servidor os arquidos do seu clone e disponibizando para todos da rede que possam fazer um clone do projeto.

-> Sabendo que alguém alterou um arquivo e fez push para o servidor e você vai trabalhar nele... tem como atualizar este arquivo na sua pasta local

git pull origin master  (neste caso ele faz um merge automático entre os arquivos). Caso não queira perder suas alterações poderá criar um branch dentro do seu projeto local


Aula 07 (Aqui é um servidor na nuvem)

https://www.youtube.com/watch?v=1IfAFYQD8u0&index=7&list=PLuN4DpjKVR1omeTtjvJRGU1_J8MsFN-fv

-> Site github.com você pode usar para gerar repositórios na nuvem. Assim de qq lugar você poderá usar seus arquivos.
Depois de configurar sua conta, é preciso gerar uma par de chaves para que se tenha acesso ao github.

Vai na sua pasta e digita ssh-heygen  (irá gerar uma par de chaves. Não precisar informar nome do arquivo e nem senha. Basta só dando enter que as chaves serão geradas). Importante gera na pasta de perfil de usuário.

Depois de gerado o arquivo que estará na pasta de perfil de usuário. Na pasta SSH abrir o arquivo id_rsa.pub e selecionar todo o conteúdo existente no arquivo. Entrar na sua conta do github, na opção account settings, selecione a opção SSH KEYS, clique no botão Add SSH Key e em Title coloca uma descrição qualquer (PC de casa) e em KEY coloca a chave selecionada no arquivo e clica em ADD Key. Pronto, configuração efetuada. Dessa forma o github local pode acessar a conta do github 


Aula 08

https://www.youtube.com/watch?v=mGeIFe-pDow&list=PLuN4DpjKVR1omeTtjvJRGU1_J8MsFN-fv&index=8

pull request (você enviar tudo que alterou para que a pessoa possa validar isso e pode mandar ou não para o projeto definitivo).

Neste caso vc criar um repositório com a opção COLABORE, faz um clone deste repositório para sua máquina local. Trabalha e depois da um git add . e git commit -m "comentario" e em seguida da um git push origin master. Com isso irá enviar o seu arquivo alterado para sua pasta COLABORA na sua conta do github. Depois se quiser enviar sua alteração ao AUTOR ORIGINAL para que ele avalie e veja se deseja adicionar sua colocaboração, você deverá dar um pull request.
