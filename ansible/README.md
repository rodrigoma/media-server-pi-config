# Ansible Configuration for Raspberry Pi Media Server

## 🚀 Quick Start

### 1. Configurar o inventário

Edite o arquivo `inventory/hosts.yml` e configure o IP do seu Raspberry Pi:

```bash
vim inventory/hosts.yml
# Altere ansible_host para o IP correto
# Altere ansible_port se usar porta SSH customizada
```

### 2. Configurar variáveis sensíveis

Edite o arquivo `secrets.yml` com suas credenciais:

```bash
vim secrets.yml
# Configure todas as variáveis vault_*
```

### 3. Instalar dependências do Ansible

```bash
ansible-galaxy collection install -r requirements.yml
```

### 4. Testar conectividade

```bash
# Teste simples de ping
ansible all -m ping

# Playbook completo de teste
ansible-playbook playbooks/ping-test.yml
```

Se aparecer erro de autenticação SSH, você pode:

```bash
# Opção 1: Usar senha (será solicitada)
ansible-playbook playbooks/ping-test.yml --ask-pass

# Opção 2: Copiar sua chave SSH para o Pi
ssh-copy-id pi@<IP_DO_SEU_PI>
```

### 5. Encriptar secrets (opcional, mas recomendado)

```bash
# Encriptar o arquivo de secrets
ansible-vault encrypt secrets.yml

# Para executar playbooks com vault
ansible-playbook playbooks/ping-test.yml --ask-vault-pass

# Para editar secrets encriptados
ansible-vault edit secrets.yml
```

## 📁 Estrutura

```
ansible/
├── ansible.cfg              # Configuração do Ansible
├── requirements.yml         # Collections necessárias
├── secrets.yml              # Variáveis sensíveis (encriptar!)
├── inventory/
│   ├── hosts.yml           # Inventário de hosts
│   └── group_vars/
│       └── all.yml         # Variáveis globais
├── playbooks/
│   ├── ping-test.yml       # Teste de conectividade
│   ├── site.yml            # Playbook principal (a criar)
│   └── ...
├── roles/
│   ├── common/             # Configurações gerais (a criar)
│   ├── network/            # Rede (a criar)
│   └── ...
└── templates/              # Templates Jinja2
```

## 🔧 Comandos Úteis

```bash
# Ver inventário
ansible-inventory --list

# Testar conexão
ansible all -m ping

# Executar comando ad-hoc
ansible all -m shell -a "uptime"

# Verificar sintaxe
ansible-playbook playbooks/ping-test.yml --syntax-check

# Dry-run (não executa, só mostra o que faria)
ansible-playbook playbooks/ping-test.yml --check

# Modo verbose
ansible-playbook playbooks/ping-test.yml -v  # ou -vv, -vvv, -vvvv

# Listar tasks
ansible-playbook playbooks/ping-test.yml --list-tasks
```

## ⚠️ Importante

1. **NUNCA** commite `secrets.yml` sem encriptação
2. Sempre use `ansible-vault` para proteger credenciais
3. Faça backup do arquivo `.vault_pass` se usar senha de vault
4. Teste com `--check` antes de executar em produção

## 📊 Status das Fases

Consulte `../PLAN.md` para acompanhar o progresso da migração.

## 🔐 Gerenciamento de Secrets

### Criar arquivo vault password (opcional)

```bash
echo "sua_senha_forte_aqui" > .vault_pass
chmod 600 .vault_pass

# Adicione ao ansible.cfg:
# vault_password_file = .vault_pass
```

### Usar vault

```bash
# Criar arquivo encriptado
ansible-vault create secrets.yml

# Encriptar arquivo existente
ansible-vault encrypt secrets.yml

# Descriptografar
ansible-vault decrypt secrets.yml

# Editar sem descriptografar
ansible-vault edit secrets.yml

# Ver conteúdo sem editar
ansible-vault view secrets.yml

# Reencriptar com nova senha
ansible-vault rekey secrets.yml
```

## 🐛 Troubleshooting

### Erro: "Failed to connect to the host via ssh"
```bash
# Verifique se consegue conectar manualmente
ssh pi@<IP_DO_PI>

# Verifique a porta SSH
ssh -p <PORTA> pi@<IP_DO_PI>
```

### Erro: "Permission denied (publickey)"
```bash
# Use senha temporariamente
ansible-playbook playbooks/ping-test.yml --ask-pass

# Ou copie sua chave SSH
ssh-copy-id pi@<IP_DO_PI>
```

### Erro: "Timeout"
```bash
# Aumente o timeout no ansible.cfg
# timeout = 60
```

## 📚 Próximos Passos

Após validar a conectividade:
1. ✅ Fase 0 e 1 completadas
2. 🔜 Implementar Fase 2 (role: common)
3. 🔜 Implementar Fase 3 (variáveis com vault)
4. 🔜 Continuar conforme PLAN.md
