**Quarto passo - Bem-vindo ao wiki do repositório!**

Esse repositório ajuda no salvamento do estado do terraform e configurações de conta para os usuários colaborarem entre si com o uso do terraform.

1 - Pre-requisito 
* A conta da organização já tem que estar criada na AWS.

Como a primeira conta da organização criada via GUI esse repositório serve para criar o bucket onde iremos salvar esses dados.
Porem o lab já se encontra criado, então seguiremos com a parametrizado e configuração do sistema operacional
Mas primeiro vamos fazer alguns ajustes:

2 - Uso do repositório:

<img width="95" alt="image" src="https://github.com/user-attachments/assets/fcf15663-4841-4995-9c98-f429a918ea25">
* Configuração do git:
Faça o download do git no endereço "Git":https://git-scm.com/downloads. Instale o pacote conforme a versão do seu sistema operacional

<img width="167" alt="image" src="https://github.com/user-attachments/assets/ea7960c3-4057-4f90-9f63-7a8eafc5c0e9">
* Utilize qualquer editor de código como sublime, Atom ou VsCode. Neste exemplo vamos utilizar o VsCode:
Faça o download do VsCode no endereço "VsCode":https://code.visualstudio.com/download. Instale o pacote conforme a versão do seu sistema operacional

<img width="72" alt="image" src="https://github.com/user-attachments/assets/c1942320-3162-4210-9eba-0181ff6f04b0">
* Instalação do AWS CLI:
Faça o download do AWS CLI no endereço "AWS CLI":https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html. Instale o pacote conforme a versão do seu sistema operacional.

<img width="35" alt="image" src="https://github.com/user-attachments/assets/bd1931ac-58b2-4582-b493-fcb28bee08c6">
* Instalação do terraform:
Faça o download do terraform no endereço "Terraform":https://developer.hashicorp.com/terraform/install. Instale o pacote conforme a versão do seu sistema operacional.

3 - Configuração do VsCode:

* Abra o Vscode e efetue login VsCode para clone e versionamento do código.
<img width="333" alt="image" src="https://github.com/user-attachments/assets/fce31344-3924-4d54-b046-335313ad1c94">

4 - Clone do repositório via git.

* Para clonar o repositório, crie uma pasta no seu SO e execute o comando no terminal a partir da pasta que você criou.
Digite: <pre><code>git clone https://github.com/gudesantana/llabs_ConsoleUsers.git </code></pre>

* Execute o comando no seu terminal.
<pre><code>git pull</code></pre>
Nesse momento o repositório deverá ser baixado para trabalho no seu repositório local

Nosso projeto já se encontra criado, porem mesmo assim segue ajuda para externá-lo a outros projetos.

Navegue entre os workspaces digitando o comando;
<pre><code>terraform workspace list</code></pre>

Escolha o workspace criado conforme os resultados. Utilize o comando abaixo para selecionar o workspace desejado.
<pre><code>terraform workspace SELECT <workspace></code></pre>

5 - Para add novos grupos, edite o arquivo main.tf apartir da linha 10 seguindo o exemplo abaixo. crie os users seguindo a ordem de criacão. Não crie users realinhando afinidades pois o terraform ira destruir e recriar os recuros. isso pode gerar problemas. 

Segue o codigo de exemplo:
<pre><code>
G-LlabsAdminUsersAws = {
      policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}
</code></pre>

6 - Para add usuarios grupos, edite o arquivo main.tf apartir da linha 34 seguindo o exemplo abaixo. crie os users seguindo a ordem de criacão. Não crie users realinhando afinidades pois o terraform ira destruir e recriar os recuros. isso pode gerar problemas. 

Segue o codigo:
  users_groups = {
    "user1"        = ["G-LlabsReadonlyUsersAws", "G-LlabsAdminUsersAws"]
    "user2"        = ["G-LlabsReadonlyUsersAws", "G-LlabsAdminUsersAws"]
    "user3"        = ["G-LlabsReadonlyUsersAws"]
    "user4"        = ["G-LlabsAdminUsersAws"]
    "srv.user5"    = ["G-LlabsAdminUsersAws"]
  }

Apos criar os usuários as secret keys e passwors ficaram armazenadas no repositorio com senhas e chaves criptografadas.
Para descriptografia desses codigos, favor entrar em contato.
Caso queira, pode recriar a base utilizando o site keybase.io e utilizar a chave privada de sua escolha.

O resultado ficará armazenado da seguinte forma:
<img width="515" alt="image" src="https://github.com/user-attachments/assets/6cf25675-ee9b-4592-a4cc-99ff00c3c737">

Para descriptografar, pode utilizar o proprio terminal do git com o seguinte comando de exemplo seguindo a imagem:
<pre><code>
echo 'wcFMAxAlP+37/QjiARAApuT1fIEHw9vLDNvth79a+zBo65IpwV+xF93trRdnl3Rxs7fwgvsDMqgRsxVSzLZQUfTE2DWIGC74FOCbnn3fsNBthVbXoPjotcW5TVPMISUjyJdoGS5vKd6EfM86wptuz2OtFpnEmPhTyycUt+CcOwaSEspSDmpWxHkMpxmkqhr24tTnwzEYZaM/cGTEwH/PbevMramR1HpDP6crLEn8okOAzB9Q+/chkDLBpikK89q1JIY+Nfv8ES0Fqr2Wo6IE/dnvhqHo+qdk3icTb5jq5jy7w9gOHSH6OC/79kJ6c40PoWhgv4fIf1YpwJwyYWrPonfMqKDwb+VLwm2/slAWfCUoRtf4hBIPDrTU5v4qJDQU6g8Q2aDE0nSrdDN5MZggYJFhTaRIcrUiDKlhqmCPq18sM3u9rHF1VF5OiGPXIUecabulHIaPDga/vYgUG3eJpbU7Eh3k/VVkBZSs1PxOXna1kd+KgY8McP6Ooo/WYXQJqQDjDU590GCkjizAH7JiUURVDBt9fyMb/z1VEMt3Zk8lsXmv0QzSJRJ+gjJXPzHeOsuBvyjQUyX6jdNiWwcgedGxhchQGAhRamQd6hxG8txtIOkTiiD7G6mW2Y4JP6/X6iQuTglJ4+aaGzrltDY0FHFxJQfSnFguTqJKyjKjKXLDxP1+MsCM11S835NhF+3SRQEF0d795E33CHE6/mirde+KGPngodhpwfKi6RWhdjiz1f2CkvRPNODm1ZEpvNYH6IwkWwnV9aEAn4prhkwbH5PH2VapjA==' | base64 --decode | keybase pgp decrypt
</code></pre>
Ele ira gerar uma linha abaixo com os valores de senha e secret descriptografados.

**Para os passos abaixo, somente se for criar novos ambientes.**

5 - Configurando o terraform,
Neste exemplo nao iremos utilizar workspace por se tratar de estrutura global

No repositório terraform, tera um arquivo chamado <pre><code>version.tf</code></pre>. Edite o arquivo e comente as seguintes linhas:

<pre><code>  
  # backend "s3" {
  #   bucket         = "s3-aws-llabs-trf-state-prd"
  #   key            = "createusers/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "dyndb-aws-llabs-trf-state-prd"
  #   encrypt        = true
  #   profile        = "default"
  # }
</code></pre>

Esse tópico salva o estado do terrafom num repositório no S3 na AWS. Mas ainda não configuramos ele ainda, então iremos salvar o estado do terraform e criação do workspace local e posterior salvamento dos dados. Segue:

* Execute o comando abaixo:
 <pre><code>Terraform init</code></pre>

Repare que a estrutura e dependências necessárias serão configuradas localmente. Após a criação dos recursos iremos redirecionar o arquivo terraform.state.

* Edite o arquivo gitignore e comente a seguinte linha:
<pre><code># *.tfvars</code></pre>
Se já estiver comentado, deixe como esta.
<pre><code></code></pre>

Para novas estruturas que serão modificadas basta avaliar bem oque esta alterando e se o planejamento informado está correto.

_Obs.: Nunca digite o comando terraform com o argumento apply antes de executar o plan para não arriscar implementar uma alteração errônea por acidente. Sempre avalie com terraform plan primeiramente_.

Para avaliar a infraestrutura que será criada, execute o seguinte código:
<pre><code>terraform plan</code></pre>

Após validação da infra a ser criada, execute o comando:
<pre><code>terraform apply</code></pre>

* Após criação da infraestrutura, valide na AWS se os recursos foram criados conforme esperado.
Nesse repositório, contem os códigos em terraform que parametriza as contas PRD e HML.

6 - Redirecionando o terraform.state.
Agora iremos redirecionar o terraform state para salvar o estado no bucket criado no repositório llabs_s3backend. 

* Comente novamente o arquivo <pre><code>version.tf</code></pre>. Edite o arquivo e comente as seguintes linhas deixando exatamente conforme o exemplo abaixo:

<pre><code>  
  backend "s3" {
    bucket         = "s3-aws-llabs-trf-state-prd"
    key            = "createusers/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dyndb-aws-llabs-trf-state-prd"
    encrypt        = true
    profile        = "default"
  }
</code></pre>

Nesse exemplo o bucket usado será o s3-aws-llabs-trf-state-prd.
O caminho a ser salvo o estado será uma pasta no buket ConfigHmlAccounts/terraform.tfstate
_Obs.: Todo ambiente criado em workspace, cria uma pasta no bucket chamada "env:/". Os Projetos que não foram criados utilizando workspaces (Default) será criado na raiz do bucket._
<img width="223" alt="image" src="https://github.com/user-attachments/assets/ee203375-bb89-4e81-935e-59693c6a552e">

* Execute novamente o comando:
<pre><code>Terraform init</code></pre>

Você terá um resultado com as seguintes informações informando que o estado do terraform foi migrado para o bucket S3.
<img width="451" alt="image" src="https://github.com/user-attachments/assets/7a5963b2-08fe-4655-b01c-8ae00abb841d">

Após digitar "Yes". Você tera o seguinte retorno informando que o estado do seu terraform foi migrado.
<img width="451" alt="image" src="https://github.com/user-attachments/assets/da3298fa-65af-4b65-b858-49799bfec4a6">
_Obs: Esta imagem foi tirada de outro repositório de exemplo, porem segue as mesmas regras!_

8 - Fim

Se você chegou até aqui, todos os passos foram configurados e recursos implementados corretamente.
Vamos para o próximo repositório para parametrização das contas PRD e HML.

Abraço. Be Good! :)
