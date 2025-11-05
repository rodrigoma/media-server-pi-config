# 🔐 Guia de Preenchimento do secrets.yml

## 📋 Visão Geral

Este guia ajuda a preencher corretamente o arquivo `secrets.yml` com todas as credenciais necessárias.

## 🚀 Passo a Passo

### 1️⃣ Obter as credenciais do Raspberry Pi atual

Se o Raspberry Pi já está configurado, você pode obter as variáveis atuais:

```bash
# Conectar ao Raspberry Pi
ssh -p 2072 pi@192.168.10.100

# Ver as variáveis de ambiente configuradas
cat /etc/environment | grep -E "CHAT_ID|TELE_TOKEN|GOOGLE_DRIVE|SSH_PORT|SQLBAK|TRANSMISSION|WIFI"

# Ou verificar no .bashrc
cat ~/.bashrc | grep -E "CHAT_ID|TELE_TOKEN|GOOGLE_DRIVE|SSH_PORT|SQLBAK|TRANSMISSION|WIFI"
```

### 2️⃣ Editar o arquivo secrets.yml

```bash
cd /Users/montanha/git/media-server-pi-config/ansible

# Editar o arquivo
vim secrets.yml
# ou
nano secrets.yml
# ou
code secrets.yml
```

### 3️⃣ Preencher as variáveis

#### 🔌 SSH Port
```yaml
vault_ssh_port: 2072  # ✅ Já está configurado!
```

#### 📱 Telegram (para notificações)
```yaml
vault_telegram_chat_id: "123456789"  # Seu Chat ID do Telegram
vault_telegram_token: "1234567890:ABCdefGHIjklMNOpqrsTUVwxyz"  # Token do bot
vault_telegram_token_watchtower: "9876543210:ZYXwvuTSRqpoNMLkjiHGFedcBA"  # Token Watchtower
```

**Como obter:**
- Chat ID: Fale com [@userinfobot](https://t.me/userinfobot) no Telegram
- Bot Token: Fale com [@BotFather](https://t.me/BotFather) no Telegram

#### ☁️ Google Drive
```yaml
vault_google_drive_folder_id: "1a2b3c4d5e6f7g8h9i0j"
```

**Como obter:**
- Abra a pasta no Google Drive
- Copie o ID da URL: `https://drive.google.com/drive/folders/[ESTE_É_O_ID]`

#### 💾 SqlBak
```yaml
vault_sqlbak_token: "abc123def456ghi789"
```

**Como obter:**
- Acesse: https://sqlbak.com/dashboard
- Vá em Settings → API Token

#### 📥 Transmission (Cliente Torrent)
```yaml
vault_transmission_user: "admin"
vault_transmission_password: "SuaSenhaForte123!"
```

**Dica:** Use uma senha forte para segurança

#### 📡 WiFi
```yaml
vault_wifi_ssid: "MinhaRedeWiFi"
vault_wifi_password: "SenhaDoWiFi123"
```

### 4️⃣ Encriptar o arquivo

**IMPORTANTE:** Depois de preencher, **sempre** encripte o arquivo!

```bash
# Encriptar
ansible-vault encrypt secrets.yml

# Você será solicitado a criar uma senha
# ⚠️ GUARDE ESSA SENHA EM LOCAL SEGURO!
```

### 5️⃣ Verificar se está encriptado

```bash
# O arquivo deve começar com $ANSIBLE_VAULT
head -1 secrets.yml

# Deve mostrar algo como:
# $ANSIBLE_VAULT;1.1;AES256
```

## 🔧 Comandos Úteis

### Editar secrets encriptados
```bash
ansible-vault edit secrets.yml
```

### Ver conteúdo sem editar
```bash
ansible-vault view secrets.yml
```

### Descriptografar (temporariamente)
```bash
ansible-vault decrypt secrets.yml
# ⚠️ Lembre de encriptar novamente após editar!
```

### Mudar senha do vault
```bash
ansible-vault rekey secrets.yml
```

## 📝 Checklist de Validação

Antes de encriptar, certifique-se de que preencheu:

- [ ] `vault_ssh_port` → ✅ 2072
- [ ] `vault_telegram_chat_id` → Seu Chat ID
- [ ] `vault_telegram_token` → Token do bot principal
- [ ] `vault_telegram_token_watchtower` → Token do Watchtower
- [ ] `vault_google_drive_folder_id` → ID da pasta Google Drive
- [ ] `vault_sqlbak_token` → Token do SqlBak
- [ ] `vault_transmission_user` → Usuário do Transmission
- [ ] `vault_transmission_password` → Senha do Transmission
- [ ] `vault_wifi_ssid` → Nome da rede WiFi
- [ ] `vault_wifi_password` → Senha do WiFi

## ⚠️ Segurança

### ✅ O que fazer:
- ✅ Sempre encriptar `secrets.yml` antes de commitar
- ✅ Guardar a senha do vault em local seguro (gerenciador de senhas)
- ✅ Usar senhas fortes para todas as credenciais
- ✅ Adicionar `.vault_pass` ao `.gitignore` se usar arquivo de senha

### ❌ O que NÃO fazer:
- ❌ Commitar `secrets.yml` sem encriptação
- ❌ Compartilhar a senha do vault por e-mail/chat
- ❌ Usar senhas fracas
- ❌ Deixar credenciais em logs ou outputs do Ansible

## 🎯 Próximos Passos

Após configurar o `secrets.yml`:

```bash
# 1. Testar conectividade
ansible-playbook playbooks/ping-test.yml

# 2. Ver as variáveis carregadas (sem mostrar valores sensíveis)
ansible-inventory --list

# 3. Prosseguir para Fase 2 do PLAN.md
```

## 📚 Referências

- [Ansible Vault Documentation](https://docs.ansible.com/ansible/latest/user_guide/vault.html)
- [Mapeamento completo de variáveis](./secrets.yml) (ver comentários no arquivo)
