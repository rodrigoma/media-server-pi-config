# Config Raspberry Pi 5


## Passo-a-passo


### Fazer manualmente - Parte 1
1. Ter a ultima versao do `RaspberryPi Imager` instalado.
2. Colocar no SD-Card o `RaspberryPi OS Lite (64-bit)` usando o `RaspberryPi Imager`.
   1. Definir hostname.
   2. Habilitar SSH.
   3. Configurar WiFi SSID.
   4. Definir locale.
   5. Habilitar RaspberryPi Connect.
3. (Opcional/Alternativa) Alerar a porta do SSH.
   1. Instalar Paragon Software `extFS for Mac`.
   2. Montar o SD-Card
   3. Editar o arquivo `/etc/ssh/sshd_config` configurando a porta `XYZ`.
4. Ligar o RaspberryPi com o SD-Card e com o NVMe SSD usando o cabo fisico de rede.


### Via Ansible - Primeira Execusão com o IP dinamico (ver no roteador)
1. Obter os MAC Address do wifi e da ethernet
   1. Obter MAC Address do Ethernet: `cat /sys/class/net/eth0/address`.
   2. Obter MAC Address do Wi-Fi: `cat /sys/class/net/wlan0/address`.
2. Alterar porta do SSH.
   1. Editar o arquivo `/etc/ssh/sshd_config` configurando a porta `XYZ`.
3. Executar `sudo lsblk` para identificar o SD-Card e o NVMe.
4. Executar `sudo dd if=/dev/mmcblk0 of=/dev/nvme0n1 bs=4M status=progress.`
   1. Essa execusão pode demorar um bom tempo.
5. Executar `sudo shutdown now`


### Fazer manualmente - Parte 2
1. Configurar no roteador (Czar) os ips estaticos para o LAN e WAN, com base no MAC Address.
   1. IP Estatico Ethernet: `192.168.10.150`
   2. IP Estatico Wi-Fi: `192.168.10.151`
2. Remover o SD-Card.
3. Ligar novamente o `RaspberryPi`.
4. Usar `raspi-config` para expandir o tamanho da partição copiada, e usar o total do SSD
   1. Open the terminal.
   2. Run `sudo raspi-config`.
   3. Navigate to `Advanced Options` > `Expand Filesystem`.

Install zsh: `sudo apt-get install git`

### Customizar terminal (ZSH + OhMyZsh + Powerlevel10k)
1. Install zsh: `sudo apt-get update && sudo apt-get install zsh`
2. Tornar zsh default: `chsh -s $(which zsh)`
3. Install OhMyZsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
4. Install theme powerlevel10k: `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"`
5. Editar `nano ~/.zshrc`
   1. Ativar o theme: `ZSH_THEME="powerlevel10k/powerlevel10k"`
   2. Salvar
   3. adicionar load dos aliases
      ```
      if [ -f ~/.aliases ]; then
         . ~/.aliases
      fi
      ```
   4. `source ~/.zshrc`
6. Sair do terminar e entrar novamente, vai abrir o Assistente de Configuração.
7. Assistente de configuracao `p10k configure`
   1. Primeiras perguntas sao das fontes, reponder conforme aparece no prompt
   2. `Prompt Style` escolher opcao `3`
   3. `Character Set` escolher opcao `1 - Unicode`
   4. `Show current time?` escolher opcao `2 - 24-hour format`
   5. `Prompt Separators` escolher opcao `1 - Angled`
   6. `Prompt Heads` escolher opcao `2 - Blurred`
   7. `Prompt Tails` escolher opcao `5 Round`
   8. `Prompt Height` escolher a opcao `1 - One Line`
   9. `Prompt Spacing` escolher a opcao `1 - Compact`
   10. `Icons` escolher a opcao `2 Many icons`
   11. `Prompt Flow` escolher a opcao `1 - Consise`
   12. `Enable Transient Prompt` escolher a opcao `No`
   13. `Instant Prompt` mode escolher a opcao `1 - Verbose`

8. Importando historio do bash
```
cat ~/.bash_history | sed 's/^: [0-9]*:0;//' >> ~/.zsh_history
```

9. Plugins
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
```

10. Ativar Plugins editando o arquivo `nano ~/.zshrc`
```
plugins=(
  git gh sudo extract systemd alias-finder 
  ssh docker docker-compose 
  zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search
)
```

11. Editar `nano ~/.p10k.zsh`
    1. Mostrar temperatura e RAM do Pi
    2. Localizar `POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS`
    3. Adicionar os itens abaixo
		```
		typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
		  ram                     # <--- ADICIONE ESTE
		  load                    # <--- ADICIONE ESTE (Carga do Sistema)
		  pi_temp                 # <--- ADICIONE ESTE (Temp do Pi)
		  # ... outros itens
		)
		```
    4. No final do arquivo adicionar
		```
       function prompt_pi_temp() {
         local temp=$(vcgencmd measure_temp | cut -d "=" -f2 | cut -d "'" -f1)
         p10k segment -f 208 -i $'\uf06d' -t "${temp}°C"
       }
       
       function instant_prompt_pi_temp() {
         prompt_pi_temp
       }
		```

12. Editar `nano ~/.aliases`
```
alias ll='ls -laXh --color -h --group-directories-first'

unalias dpsa 2>/dev/null
dpsa() {
   docker ps -a "$@" --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.RunningFor}}\t{{.Names}}" | \
   sed -E "s/(.*Up.*)/\x1b[32m&\x1b[0m/"
}

# Atalhos rápidos para o hardware do Pi
alias temp='vcgencmd measure_temp'
alias clock='vcgencmd measure_clock arm'
alias vcore='vcgencmd measure_volts core'
alias mem='free -h -t'
```

13. `source ~/.zshrc`
```
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
```

15. Configurar o git
    1. Gerar key `ssh-keygen -t ed25519 -C "your_email@example.com"`
    2. Copiar public key: `cat ~/.ssh/id_ed25519.pub`
    3. Colar a key no Github: `Settings > SSH and GPG keys > click New SSH key`
    4. `nano ~/.gitconfig`
         ```
         [core]
            autocrlf = input
         [user]
            email = your_email@example.com
            name = Your Name
         [credential]
            helper = cache --timeout=600
         ```

16. Install Node requer para alguns CLI
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
nvm install 24
```

16. Instal GitHub CLI
- Executar comandos abaixo
```
sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
```
- Fazer o processo de login `gh auth login`

17. Install Copilot CLI
- Executar comandos abaixo
```
curl -fsSL https://gh.io/copilot-install | bash
```
- Fazer o processo de login `copilot` e depois `/login`.

18. Install Gemini CLI
- Executar comandos abaixo
```
# Requer NodeJs
npm install -g @google/gemini-cli
```
- Fazer o processo de login ao executar `gemini`


19. Install Claude CLI
- Executar comandos abaixo
```
curl -fsSL https://claude.ai/install.sh | bash
```
- Fazer o processo de login ao executar `claude`


20. Install OpenClaw
- Executar comandos abaixo
```
https://docs.openclaw.ai/platforms/raspberry-pi
# Requer NodeJs
# Create 2GB swap file
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# Make permanent
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Optimize for low RAM (reduce swappiness)
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
#Install OpenClaw
curl -fsSL https://openclaw.ai/install.sh | bash
```
- Fazer o onboarding `openclaw onboard --install-daemon` se não abrir automaticamente.


### Via Ansible - Segunda Execusão com o porta e IP estatico configurado.
apt update
apt full-upgrade
rpi-update


---


## FONTES
- [https://jocke.no/2025/08/24/install-raspberry-pi-os-on-m-2-nvme-ssd-on-raspberry-pi-5/](https://jocke.no/2025/08/24/install-raspberry-pi-os-on-m-2-nvme-ssd-on-raspberry-pi-5/)
- [https://hackaday.io/project/199227-mini-pi-media-server](https://hackaday.io/project/199227-mini-pi-media-server)
- [https://gist.github.com/anthonyray/08f805138c2b37c2554b777ea96513f2](https://gist.github.com/anthonyray/08f805138c2b37c2554b777ea96513f2)


---


## ANOTACOES

#### OBS: COLOCAR NO SCRIPT pra liperar espaço

##### Programa para verificar que pastas estao gigante
- `ncdu /`

##### Limpa cache do apt
```
sudo apt clean
sudo apt autoclean
sudo apt autoremove
```

##### Limpa logs do systemd (mantém os últimos 100MB)
- `sudo journalctl --vacuum-size=100M` 


##### PESQUISAR
- linux como evitar que o arquivo syslog fique enorme?
