# Plano de Migração: Scripts Shell → Ansible

## 📋 Visão Geral

Este documento descreve o plano passo a passo para migrar as configurações do Raspberry Pi Media Server de scripts shell para Ansible, permitindo gerenciamento automatizado, idempotente e versionado.

---

## 🎯 Objetivos

- ✅ Automatizar todas as configurações usando Ansible
- ✅ Manter idempotência (executar múltiplas vezes sem efeitos colaterais)
- ✅ Facilitar manutenção e versionamento
- ✅ Permitir configuração de múltiplos Raspberry Pi com mesmas configurações
- ✅ Gerenciar variáveis sensíveis de forma segura (Ansible Vault)

---

## 📁 Estrutura do Projeto Ansible

```
media-server-pi-config/
├── ansible/
│   ├── inventory/
│   │   ├── hosts.yml              # Inventário de servidores
│   │   └── group_vars/
│   │       ├── all.yml            # Variáveis globais
│   │       └── raspberry_pi.yml   # Variáveis específicas do Pi
│   ├── roles/
│   │   ├── common/                # Configurações gerais
│   │   ├── network/               # IP estático, NO-IP
│   │   ├── storage/               # Montagem HDDs
│   │   ├── samba/                 # Compartilhamento de arquivos
│   │   ├── plex/                  # Plex Media Server
│   │   ├── docker/                # Docker + containers
│   │   └── backup/                # SqlBak
│   ├── playbooks/
│   │   ├── site.yml               # Playbook principal
│   │   ├── setup.yml              # Configuração inicial
│   │   ├── ping-test.yml          # Teste de conectividade
│   │   └── docker-apps.yml        # Apenas apps Docker
│   ├── ansible.cfg                # Configuração do Ansible
│   ├── requirements.yml           # Dependências externas
│   └── secrets.yml                # Variáveis sensíveis (encriptado)
├── scripts/                       # Scripts originais (manter como referência)
├── configs/                       # Configs originais (manter como referência)
└── README.md
```

---

## 🔄 Fases de Implementação

### **FASE 0: Preparação do Ambiente** ⚙️
**Status:** 🔴 Não iniciado  
**Estimativa:** 30 minutos

#### Checklist:
- [ ] Instalar Ansible na máquina de controle (seu computador)
- [ ] Criar estrutura de diretórios
- [ ] Configurar acesso SSH ao Raspberry Pi
- [ ] Documentar credenciais necessárias

#### Comandos:
```bash
# Instalar Ansible (macOS)
brew install ansible

# Criar estrutura
mkdir -p ansible/{inventory/{group_vars,host_vars},roles,playbooks}
```

---

### **FASE 1: Conectividade Básica** 🔌
**Status:** 🔴 Não iniciado  
**Estimativa:** 45 minutos

#### Objetivo:
Estabelecer conexão Ansible → Raspberry Pi e validar comunicação.

#### Checklist:
- [ ] Criar `ansible.cfg`
- [ ] Criar `inventory/hosts.yml`
- [ ] Configurar autenticação SSH (chave ou senha)
- [ ] Criar `playbooks/ping-test.yml`
- [ ] Executar primeiro ping bem-sucedido

#### Arquivos a criar:
1. **ansible/ansible.cfg**
2. **ansible/inventory/hosts.yml**
3. **ansible/playbooks/ping-test.yml**

#### Validação:
```bash
cd ansible
ansible all -m ping
ansible-playbook playbooks/ping-test.yml
```

---

### **FASE 2: Configurações Gerais (Role: common)** 🛠️
**Status:** 🔴 Não iniciado  
**Estimativa:** 1-2 horas

#### Objetivo:
Configurar timezone, aliases, SSH, expandir filesystem.

#### Equivalente aos scripts:
- `00_0_configs_geral.sh`
- `00_1_copy_scripts.sh`

#### Checklist:
- [ ] Criar role `common`
- [ ] Configurar timezone (America/Sao_Paulo)
- [ ] Criar aliases bash (ll)
- [ ] Expandir filesystem do SD card
- [ ] Configurar SSH (porta customizada, enable service)
- [ ] Configurar histórico bash ilimitado

#### Tarefas principais:
- Timezone
- Aliases
- SSH hardening
- Filesystem expansion
- Bash history

#### Validação:
```bash
ansible-playbook playbooks/site.yml --tags common
```

---

### **FASE 3: Gerenciamento de Variáveis Sensíveis** 🔐
**Status:** 🔴 Não iniciado  
**Estimativa:** 1 hora

#### Objetivo:
Substituir `export_vars.sh` por Ansible Vault.

#### Equivalente ao script:
- `export_vars.sh`

#### Checklist:
- [ ] Criar `secrets.yml` com Ansible Vault
- [ ] Definir todas as variáveis sensíveis
- [ ] Criar `group_vars/all.yml` para variáveis públicas
- [ ] Testar acesso às variáveis

#### Variáveis a gerenciar:
```yaml
# secrets.yml (encriptado)
chat_id: "..."
telegram_token: "..."
telegram_token_watchtower: "..."
google_drive_folder_id: "..."
ssh_port: "..."
sqlbak_token: "..."
transmission_user: "..."
transmission_password: "..."
wifi_ssid: "..."
wifi_password: "..."
```

#### Comandos:
```bash
# Criar arquivo encriptado
ansible-vault create ansible/secrets.yml

# Editar arquivo encriptado
ansible-vault edit ansible/secrets.yml

# Executar playbook com vault
ansible-playbook playbooks/site.yml --ask-vault-pass
```

---

### **FASE 4: Rede e Conectividade (Role: network)** 🌐
**Status:** 🔴 Não iniciado  
**Estimativa:** 2 horas

#### Objetivo:
Configurar IP estático e NO-IP.

#### Equivalente aos scripts:
- `01_config_static_ip.sh`
- `02_install_noip.sh`

#### Checklist:
- [ ] Criar role `network`
- [ ] Configurar IP estático (dhcpcd.conf)
- [ ] Configurar interfaces de rede
- [ ] Instalar e configurar NO-IP client
- [ ] Reiniciar serviços de rede (com handlers)

#### Tarefas principais:
- Backup de configurações originais
- Template dhcpcd.conf
- Template interfaces
- Instalação NO-IP
- Configuração NO-IP

#### Validação:
```bash
ansible-playbook playbooks/site.yml --tags network
# Verificar conectividade após mudança de IP
```

---

### **FASE 5: Armazenamento (Role: storage)** 💾
**Status:** 🔴 Não iniciado  
**Estimativa:** 1-2 horas

#### Objetivo:
Montar HDDs externos automaticamente.

#### Equivalente ao script:
- `03_mount_hdd.sh`

#### Checklist:
- [ ] Criar role `storage`
- [ ] Detectar discos disponíveis
- [ ] Criar pontos de montagem
- [ ] Configurar /etc/fstab
- [ ] Montar discos
- [ ] Configurar permissões

#### Tarefas principais:
- Instalar pacotes necessários (ntfs-3g, exfat-utils)
- Template fstab
- Criar diretórios de montagem
- Mount disks
- Set permissions

#### Validação:
```bash
ansible-playbook playbooks/site.yml --tags storage
# Verificar montagens: df -h
```

---

### **FASE 6: Compartilhamento Samba (Role: samba)** 📁
**Status:** 🔴 Não iniciado  
**Estimativa:** 1 hora

#### Objetivo:
Configurar compartilhamento de arquivos via Samba.

#### Equivalente ao script:
- `04_install_samba.sh`

#### Checklist:
- [ ] Criar role `samba`
- [ ] Instalar Samba
- [ ] Configurar smb.conf
- [ ] Criar usuários Samba
- [ ] Habilitar e iniciar serviço

#### Tarefas principais:
- Instalar samba
- Template smb.conf
- Criar usuários
- Restart service

#### Validação:
```bash
ansible-playbook playbooks/site.yml --tags samba
# Testar acesso: smbclient -L localhost
```

---

### **FASE 7: Plex Media Server (Role: plex)** 🎬
**Status:** 🔴 Não iniciado  
**Estimativa:** 1-2 horas

#### Objetivo:
Instalar e configurar Plex Media Server.

#### Equivalente ao script:
- `05_install_plex.sh`

#### Checklist:
- [ ] Criar role `plex`
- [ ] Adicionar repositório Plex
- [ ] Instalar plexmediaserver
- [ ] Configurar override.conf
- [ ] Configurar usuário de execução
- [ ] Desabilitar autostart (gerenciado manualmente)

#### Tarefas principais:
- Add GPG key
- Add repository
- Install plex
- Configure service override
- Set permissions

#### Validação:
```bash
ansible-playbook playbooks/site.yml --tags plex
# Verificar: systemctl status plexmediaserver
```

---

### **FASE 8: Docker e Containers (Role: docker)** 🐳
**Status:** 🔴 Não iniciado  
**Estimativa:** 3-4 horas

#### Objetivo:
Instalar Docker e configurar todos os containers.

#### Equivalente aos scripts:
- `06_0_install_docker.sh`
- `06_1_docker_run_sickchill.sh`
- `06_2_docker_run_mylar.sh`
- `06_3_docker_run_transmission.sh`
- `06_4_docker_run_pyload.sh`
- `06_5_docker_run_plexdrive.sh`
- `06_6_docker_run_komga.sh`
- `06_7_docker_run_wiznote.sh`
- `06_8_docker_run_watchtower.sh`
- `06_9_docker_run_reposilite.sh`
- `06_10_docker_run_apprise.sh`

#### Checklist:
- [ ] Criar role `docker`
- [ ] Instalar Docker
- [ ] Instalar docker-compose
- [ ] Criar diretórios de volumes
- [ ] Configurar cada container via docker_container module ou docker-compose

#### Containers a configurar:
1. **Transmission** (torrent client)
2. **Sickchill** (TV shows manager)
3. **Mylar** (comics manager)
4. **PyLoad** (download manager)
5. **Plexdrive** (Google Drive mount)
6. **Komga** (comics reader)
7. **WizNote** (notes)
8. **WatchTower** (auto-update containers)
9. **Reposilite** (maven repository)
10. **Apprise** (notifications)

#### Abordagem recomendada:
- Usar `community.docker.docker_container` module
- OU criar `docker-compose.yml` e usar `community.docker.docker_compose`

#### Validação:
```bash
ansible-playbook playbooks/site.yml --tags docker
# Verificar: docker ps -a
```

---

### **FASE 9: Backup SqlBak (Role: backup)** 💼
**Status:** 🔴 Não iniciado  
**Estimativa:** 1 hora

#### Objetivo:
Instalar e configurar SqlBak para backups.

#### Equivalente ao script:
- `07_install_sqlbak.sh`

#### Checklist:
- [ ] Criar role `backup`
- [ ] Instalar SqlBak
- [ ] Configurar token
- [ ] Copiar scripts de backup
- [ ] Configurar cron jobs

#### Tarefas principais:
- Download SqlBak
- Install
- Configure token
- Setup scripts

#### Validação:
```bash
ansible-playbook playbooks/site.yml --tags backup
# Verificar dashboard: https://sqlbak.com/dashboard
```

---

### **FASE 10: Scripts Auxiliares** 📜
**Status:** 🔴 Não iniciado  
**Estimativa:** 1 hora

#### Objetivo:
Portar scripts auxiliares para Ansible.

#### Scripts:
- `startup_services.sh`
- `wakeup_hdd.sh`
- `sql-bak_*` scripts

#### Checklist:
- [ ] Criar tasks para startup services
- [ ] Criar tasks para wakeup HDDs
- [ ] Integrar com cron/systemd timers

---

### **FASE 11: Testes e Validação** ✅
**Status:** 🔴 Não iniciado  
**Estimativa:** 2-3 horas

#### Checklist:
- [ ] Testar playbook completo em Raspberry Pi limpo
- [ ] Validar idempotência (executar 2x sem mudanças)
- [ ] Testar cada role individualmente
- [ ] Validar todos os serviços funcionando
- [ ] Documentar problemas encontrados

#### Comandos de teste:
```bash
# Teste completo
ansible-playbook playbooks/site.yml --check  # dry-run
ansible-playbook playbooks/site.yml          # execução real
ansible-playbook playbooks/site.yml          # 2ª execução (deve ser idempotente)

# Teste por role
ansible-playbook playbooks/site.yml --tags common
ansible-playbook playbooks/site.yml --tags network
# etc...

# Teste com limite de hosts
ansible-playbook playbooks/site.yml --limit raspberry-pi-test
```

---

### **FASE 12: Documentação** 📚
**Status:** 🔴 Não iniciado  
**Estimativa:** 1-2 horas

#### Checklist:
- [ ] Atualizar README.md com instruções Ansible
- [ ] Documentar variáveis necessárias
- [ ] Criar guia de troubleshooting
- [ ] Documentar diferenças entre scripts shell e Ansible
- [ ] Criar exemplos de uso comum

---

## 🚀 Quick Start (após implementação)

### 1. Preparar ambiente
```bash
# Clonar repositório
git clone https://github.com/rodrigoma/media-server-pi-config.git
cd media-server-pi-config/ansible

# Instalar Ansible
brew install ansible  # macOS
# ou
sudo apt install ansible  # Linux

# Instalar collections necessárias
ansible-galaxy collection install -r requirements.yml
```

### 2. Configurar inventário
```bash
# Editar inventory/hosts.yml com IP do seu Raspberry Pi
vim inventory/hosts.yml

# Editar variáveis
vim inventory/group_vars/all.yml

# Criar/editar secrets
ansible-vault create secrets.yml
```

### 3. Testar conectividade
```bash
ansible all -m ping
ansible-playbook playbooks/ping-test.yml
```

### 4. Executar configuração completa
```bash
# Executar tudo
ansible-playbook playbooks/site.yml --ask-vault-pass

# Ou por etapas
ansible-playbook playbooks/setup.yml --ask-vault-pass        # Setup inicial
ansible-playbook playbooks/docker-apps.yml --ask-vault-pass  # Apenas Docker apps
```

---

## 📊 Progresso Geral

| Fase | Nome | Status | Progresso |
|------|------|--------|-----------|
| 0 | Preparação | 🔴 Não iniciado | 0% |
| 1 | Conectividade | 🔴 Não iniciado | 0% |
| 2 | Common | 🔴 Não iniciado | 0% |
| 3 | Variáveis | 🔴 Não iniciado | 0% |
| 4 | Network | 🔴 Não iniciado | 0% |
| 5 | Storage | 🔴 Não iniciado | 0% |
| 6 | Samba | 🔴 Não iniciado | 0% |
| 7 | Plex | 🔴 Não iniciado | 0% |
| 8 | Docker | 🔴 Não iniciado | 0% |
| 9 | Backup | 🔴 Não iniciado | 0% |
| 10 | Scripts | 🔴 Não iniciado | 0% |
| 11 | Testes | 🔴 Não iniciado | 0% |
| 12 | Docs | 🔴 Não iniciado | 0% |

**Progresso Total:** 0%

---

## 💡 Dicas Importantes

1. **Idempotência:** Sempre testar execução múltipla do mesmo playbook
2. **Tags:** Usar tags para executar partes específicas
3. **Check Mode:** Usar `--check` para dry-run antes de aplicar
4. **Backup:** Sempre fazer backup antes de mudanças críticas
5. **Versionamento:** Commitar cada fase concluída no git
6. **Secrets:** NUNCA commitar `secrets.yml` sem encriptação
7. **Teste Incremental:** Testar cada role antes de avançar

---

## 🔧 Comandos Úteis

```bash
# Testar sintaxe
ansible-playbook playbooks/site.yml --syntax-check

# Dry-run
ansible-playbook playbooks/site.yml --check

# Ver tasks que serão executadas
ansible-playbook playbooks/site.yml --list-tasks

# Ver hosts afetados
ansible-playbook playbooks/site.yml --list-hosts

# Executar apenas uma role
ansible-playbook playbooks/site.yml --tags docker

# Modo verbose
ansible-playbook playbooks/site.yml -v   # -vv, -vvv, -vvvv para mais detalhes

# Limitar a hosts específicos
ansible-playbook playbooks/site.yml --limit raspberry-pi-01
```

---

## 📝 Notas de Implementação

### Diferenças Shell vs Ansible:

| Aspecto | Shell Scripts | Ansible |
|---------|---------------|---------|
| Execução | Imperativa | Declarativa |
| Idempotência | Manual | Automática |
| Variáveis | Environment vars | Inventory/Vault |
| Sequência | Linear | DAG com dependencies |
| Reuso | Difícil | Roles modulares |
| Testes | Manual | Built-in (--check) |

### Vantagens do Ansible:
- ✅ Idempotente por padrão
- ✅ Melhor gerenciamento de erros
- ✅ Rollback mais fácil
- ✅ Múltiplos hosts simultaneamente
- ✅ Secrets encriptados (Vault)
- ✅ Comunidade e módulos prontos

---

## 📅 Cronograma Estimado

**Dedicação:** 2-3 horas por sessão

| Dia | Fases | Tempo Estimado |
|-----|-------|----------------|
| 1 | Fases 0-1 | 1.5h |
| 2 | Fase 2 | 2h |
| 3 | Fases 3-4 | 3h |
| 4 | Fases 5-6 | 3h |
| 5 | Fase 7 | 2h |
| 6-7 | Fase 8 | 4h |
| 8 | Fases 9-10 | 2h |
| 9 | Fase 11 | 3h |
| 10 | Fase 12 | 2h |

**Total:** ~22-25 horas (10 sessões)

---

## ✅ Checklist Pré-Requisitos

Antes de começar, certifique-se de ter:

- [ ] Raspberry Pi acessível via rede
- [ ] Acesso SSH configurado
- [ ] Chave SSH ou senha do usuário pi
- [ ] IP do Raspberry Pi (estático ou atual)
- [ ] Todas as credenciais/tokens listados em `export_vars.sh`
- [ ] Ansible instalado na máquina de controle (>= 2.9)
- [ ] Git instalado
- [ ] Conexão à internet estável

---

## 🆘 Troubleshooting

### Problema: "Host key verification failed"
```bash
# Adicionar host ao known_hosts
ssh-keyscan -H <IP_DO_PI> >> ~/.ssh/known_hosts

# Ou desabilitar verificação (não recomendado para produção)
# No ansible.cfg: host_key_checking = False
```

### Problema: "Permission denied (publickey)"
```bash
# Usar senha temporariamente
ansible-playbook playbooks/site.yml --ask-pass

# Ou copiar chave SSH
ssh-copy-id pi@<IP_DO_PI>
```

### Problema: Ansible não encontrado
```bash
# Instalar via pip
pip3 install ansible

# Verificar instalação
ansible --version
```

---

## 🔄 Próximos Passos

Após completar este plano:
1. Considerar CI/CD para deploy automático
2. Adicionar monitoring (Prometheus/Grafana)
3. Implementar testes automatizados (Molecule)
4. Criar playbooks de rollback
5. Documentar disaster recovery

---

**Última atualização:** 2025-11-05  
**Versão do plano:** 1.0  
**Autor:** Assistant (baseado em scripts de rodrigoma)

---

## 📞 Referências

- [Ansible Documentation](https://docs.ansible.com/)
- [Ansible Galaxy](https://galaxy.ansible.com/)
- [Ansible Best Practices](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html)
- [Community Docker Collection](https://docs.ansible.com/ansible/latest/collections/community/docker/)
- [Repositório Original](https://github.com/rodrigoma/media-server-pi-config)
