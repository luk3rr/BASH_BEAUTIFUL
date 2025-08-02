#!/usr/bin/env bash

set -e

FUNCTIONS_URL="https://raw.githubusercontent.com/luk3rr/BASH_BEAUTIFUL/main/src/messaging.sh"

INSTALL_DIR="$HOME/.bash-beautiful"
INSTALL_FILE="$INSTALL_DIR/messaging.sh"
VAR_NAME="BASH_BEAUTIFUL"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'
msg_succ() { echo -e "${GREEN}✔ ${1}${NC}"; }
msg_info() { echo -e "${BLUE}ℹ ${1}${NC}"; }

msg_info "Instalando Bash Beautiful Messaging..."

mkdir -p "$INSTALL_DIR"

echo "Baixando funções de '$FUNCTIONS_URL'..."
if curl -fsSL "$FUNCTIONS_URL" -o "$INSTALL_FILE"; then
  msg_succ "Funções salvas em '$INSTALL_FILE'"
else
  echo -e "${RED}✖ Falha ao baixar o script. Verifique a URL e sua conexão.${NC}"
  exit 1
fi

add_to_shell_config() {
  local config_file="$1"
  local line_to_add="export $VAR_NAME=\"$INSTALL_FILE\""

  if [ -f "$config_file" ]; then
    if ! grep -qF "$line_to_add" "$config_file"; then
      echo "Adicionando variável ao '$config_file'..."
      echo "" >> "$config_file"
      echo "# Carrega as funções do Bash Beautiful Messaging" >> "$config_file"
      echo "$line_to_add" >> "$config_file"
      msg_succ "Variável '$VAR_NAME' adicionada com sucesso."
    else
      msg_info "Variável '$VAR_NAME' já existe em '$config_file'."
    fi
  fi
}

add_to_shell_config "$HOME/.bashrc"
add_to_shell_config "$HOME/.zshrc"

echo ""
msg_succ "Instalação concluída!"
msg_info "Por favor, reinicie seu terminal ou execute 'source ~/.bashrc' (ou ~/.zshrc) para usar as funções."