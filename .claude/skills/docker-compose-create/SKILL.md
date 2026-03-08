---
name: docker-compose-create
description: Creates a new docker-compose service for the media-server-pi-config repository. Use this skill whenever the user runs /docker-compose-create with a Docker image name, or asks to add a new service/container to the stack, create a compose file for a new container, or set up a new docker service in the Pi media server.
---

# Novo Serviço — Docker Compose Generator

This skill creates a complete `docker-compose.yml` for a new service in the Pi media server stack, based on research into the Docker image's documentation.

## Input

The user provides a Docker image reference as the argument, e.g.:
- `/novo-servico b4bz/homer:latest`
- `/novo-servico lscr.io/linuxserver/jellyfin:arm64v8-latest`
- `/novo-servico portainer/portainer-ce:latest`

## Step-by-step process

### 1. Derive the service name

Extract the service name from the image:
- `b4bz/homer:latest` → `homer`
- `lscr.io/linuxserver/transmission:arm64v8-latest` → `transmission`
- `portainer/portainer-ce:latest` → `portainer-ce`

### 2. Research the image

Fetch documentation to understand the service. **Do not ask the user — infer everything from docs.**

**For LinuxServer images** (`lscr.io/linuxserver/<name>`):
- Fetch `https://docs.linuxserver.io/images/docker-<name>/`
- Fetch `https://github.com/linuxserver/docker-<name>` (README for env vars and volumes)

**For other images** (e.g., `b4bz/homer`, `portainer/portainer-ce`):
- Fetch `https://hub.docker.com/r/<user>/<name>` (Description tab for usage)
- Search for the project's GitHub README if Docker Hub doesn't have enough detail

**What to extract:**
- **Exposed ports**: Which port serves the web UI (if any)?
- **Has web UI?**: Does the service expose a browsable interface? (yes → Traefik; no → skip Traefik labels)
- **Required volumes**: What paths does the container expect to be mounted?
- **Service-specific env vars**: Any vars beyond TZ/PUID/PGID that the image expects?

### 3. Generate the docker-compose.yml

Create `services/<name>/docker-compose.yml` in the repository root.

**Always include:**
```yaml
services:
  <name>:
    image: <full-image-reference>
    container_name: <name>
    hostname: <name>
    networks:
      - traefik
    labels:
      - sqlbak.stop.first=true
      - sqlbak.start.first=false
      - com.centurylinklabs.watchtower.enable=true
    environment:
      - TZ=America/Sao_Paulo
      - PUID=${USER_ID}
      - PGID=${GROUP_ID}
      # ... service-specific env vars
    volumes:
      # ... service-specific volumes (see volume mapping rules below)
    restart: unless-stopped

networks:
  traefik:
    external: true
    name: traefik
```

**If the service has a web UI** — add ports and Traefik labels:
```yaml
    ports:
      - <port>:<port>
    labels:
      - sqlbak.stop.first=true
      - sqlbak.start.first=false
      - com.centurylinklabs.watchtower.enable=true
      - traefik.enable=true
      - traefik.http.routers.<name>.rule=Host(`<name>.${MY_DOMAIN}`)
      - traefik.http.routers.<name>.entryPoints=websecure
      - traefik.http.routers.<name>.tls=true
      - traefik.http.routers.<name>.tls.certResolver=le
      - traefik.http.services.<name>.loadBalancer.server.port=<port>
```

**If the service has NO web UI** — no ports, no traefik labels beyond the sqlbak/watchtower ones.

**Volume mapping rules:**
- The base path for all service data is `/home/pi/centerMedia/SupportApps/<name>/`
- Map container paths to this base. Examples:
  - Container `/config` → `/home/pi/centerMedia/SupportApps/<name>/config:/config`
  - Container `/data` → `/home/pi/centerMedia/SupportApps/<name>/data:/data`
  - Container `/books` → `/home/pi/centerMedia/SupportApps/<name>/books:/books`
- Exception: system-level paths like `/var/run/docker.sock` stay as-is
- Docker will create the host directories automatically on first `docker compose up`

### 4. Create the git branch and open a PR

After writing the file, run these git commands:

```bash
git checkout -b compose/service-<name>
```

Then invoke the `/commit-push-pr` skill to handle the commit and PR. The PR should target the `main` branch. Suggest a commit message like:
`Add docker-compose for <name> service`

## Reference examples

### Service WITH web UI (komga — comic server on port 25600):
```yaml
services:
  komga:
    image: gotson/komga:latest
    container_name: komga
    hostname: komga
    networks:
      - traefik
    ports:
      - 25600:25600
    labels:
      - sqlbak.stop.first=true
      - sqlbak.start.first=false
      - com.centurylinklabs.watchtower.enable=true
      - traefik.enable=true
      - traefik.http.routers.komga.rule=Host(`komga.${MY_DOMAIN}`)
      - traefik.http.routers.komga.entryPoints=websecure
      - traefik.http.routers.komga.tls=true
      - traefik.http.routers.komga.tls.certResolver=le
      - traefik.http.services.komga.loadBalancer.server.port=25600
    environment:
      - TZ=America/Sao_Paulo
      - PUID=${USER_ID}
      - PGID=${GROUP_ID}
    volumes:
      - /home/pi/centerMedia/SupportApps/komga/config:/config
      - /home/pi/plexdrive/data:/data
    restart: unless-stopped

networks:
  traefik:
    external: true
    name: traefik
```

### Service WITHOUT web UI (watchtower — background auto-updater):
```yaml
services:
  watchtower:
    image: nickfedor/watchtower:armhf-latest
    container_name: watchtower
    hostname: watchtower
    networks:
      - traefik
    labels:
      - sqlbak.stop.first=false
      - sqlbak.start.first=true
      - com.centurylinklabs.watchtower.enable=true
    environment:
      - TZ=America/Sao_Paulo
      - PUID=${USER_ID}
      - PGID=${GROUP_ID}
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    restart: unless-stopped

networks:
  traefik:
    external: true
    name: traefik
```

## When to ask the user

Only ask if documentation is completely unavailable and you cannot infer the port or volumes from any source. In all other cases, make your best judgment and proceed.
