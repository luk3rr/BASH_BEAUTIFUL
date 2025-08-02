# Bash Beautiful Messaging 🎨

Um conjunto simples de funções de shell para exibir mensagens coloridas e padronizadas (sucesso, alerta, erro, etc.) em seus scripts Bash ou Zsh.

---
## Instalação

Para instalar, execute o seguinte comando no seu terminal. Ele irá baixar as funções para sua máquina e configurar o seu ambiente automaticamente.

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/luk3rr/BASH_BEAUTIFUL/main/install.sh)"
```

### O que o instalador faz?
1.  Cria um diretório oculto `~/.bash-beautiful` na sua pasta de usuário.
2.  Baixa o arquivo de funções `messaging.sh` para dentro desse diretório.
3.  Adiciona uma variável de ambiente `BASH_BEAUTIFUL` aos seus arquivos `~/.bashrc` e `~/.zshrc`. Esta variável aponta para o caminho do script de funções.

Após a instalação, **reinicie seu terminal** ou execute `source ~/.bashrc` (ou `source ~/.zshrc`) para que a nova variável de ambiente seja carregada.

---
## Como Usar

Para usar as funções em qualquer um dos seus scripts, você só precisa "importar" o arquivo no início do seu script usando a variável `$BASH_BEAUTIFUL`.

#### Exemplo de Script (`meu_backup.sh`):

```bash
#!/usr/bin/env bash
source "$BASH_BEAUTIFUL"

msg_title "Iniciando Processo de Backup Semanal"

msg_step "1" "3" "Conectando ao banco de dados..."
msg_succ "Conexão estabelecida."

msg_step "2" "3" "Exportando tabelas..."
msg_alert "Tabela 'users' é grande, pode demorar."
msg_succ "Banco de dados exportado com sucesso."

msg_step "3" "3" "Compactando arquivo de backup..."
msg_error "Espaço em disco insuficiente. Backup falhou."

echo ""
msg_info "Processo finalizado com erros."
```

---
## Funções Disponíveis

* `msg_succ "Mensagem"`: Exibe uma mensagem de sucesso em verde (✔).
* `msg_alert "Mensagem"`: Exibe uma mensagem de alerta em amarelo (➜).
* `msg_error "Mensagem"`: Exibe uma mensagem de erro em vermelho (✖).
* `msg_info "Mensagem"`: Exibe uma mensagem informativa em azul (ℹ).
* `msg_step "1" "3" "Texto"`: Exibe uma mensagem de passo formatada (ex: `--> Step 1/3: Texto`).
* `msg_title "Texto"`: Exibe um título formatado (ex: `=== Texto ===`).