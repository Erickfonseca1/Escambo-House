
# Escambo House

Escambo House é uma plataforma voltada para moradores de condomínios residenciais, permitindo a troca de serviços entre os usuários sem envolver dinheiro.

## Instalação e Configuração

### 1. Instalar as dependências

Execute o comando abaixo para instalar as dependências do projeto:

```bash
bundle install
```

### 2. Instalar as dependências do Yarn

Certifique-se de que o Yarn está instalado e, em seguida, execute:

```bash
yarn install
```

### 3. Corrigir possíveis problemas de instalação de pacotes

Caso algum pacote não seja instalado corretamente, execute os seguintes comandos:

```bash
rails assets:precompile
bin/importmap pin bootstrap
bin/importmap pin bootstrap-icons
```

### 4. Configurar o banco de dados

Crie o banco de dados, execute as migrações e preencha o banco com os dados de exemplo (seed):

```bash
rails db:create
rails db:migrate
rails db:seed
```

### 5. Executar o projeto

Para iniciar o servidor local, utilize o comando:

```bash
rails s
```

A aplicação estará disponível em [http://localhost:3000](http://localhost:3000).