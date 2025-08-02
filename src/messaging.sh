#!/usr/bin/env bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

msg_succ() {
  echo -e "${GREEN}✔ ${1}${NC}"
}

msg_alert() {
  echo -e "${YELLOW}➜ ${1}${NC}"
}

msg_error() {
  echo -e "${RED}✖ ${1}${NC}"
}

msg_info() {
  echo -e "${BLUE}ℹ ${1}${NC}"
}

msg_step() {
  echo -e "${YELLOW}--> Step ${1}/${2}: ${3}${NC}"
}

msg_title() {
  echo -e "${BLUE}=== ${1} ===${NC}"
}