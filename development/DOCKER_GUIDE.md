# Docker Guide: Container Essentials

A quick reference for managing containers, images, and multi-container applications with Docker and Docker Compose.

## 1. Core Concepts
| Term           | Description                                      |
| :------------- | :----------------------------------------------- |
| **Image**      | A read-only template with instructions for creating a Docker container. |
| **Container**  | A runnable instance of an image.                 |
| **Dockerfile** | A text document containing all the commands to assemble an image. |
| **Volume**     | A persistent data store for containers.          |

## 2. Container Management
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `docker run <image>`   | Create and start a container from an image.      |
| `docker run -d <image>`| Run a container in the background (detached).    |
| `docker ps`            | List running containers.                         |
| `docker ps -a`         | List all containers (including stopped ones).    |
| `docker stop <id>`     | Stop a running container.                        |
| `docker rm <id>`       | Remove a stopped container.                      |
| `docker logs <id>`     | Fetch the logs of a container.                   |
| `docker exec -it <id> sh`| Open an interactive shell inside a container.  |

## 3. Image Operations
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `docker images`        | List all local images.                           |
| `docker pull <image>`  | Download an image from Docker Hub.               |
| `docker build -t <n> .`| Build an image from a Dockerfile in the current dir. |
| `docker rmi <image>`   | Remove a local image.                            |
| `docker tag <src> <dest>`| Create a tag that refers to a source image.    |

## 4. Docker Compose
Compose is a tool for defining and running multi-container Docker applications.

| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `docker-compose up`    | Create and start containers defined in `docker-compose.yml`. |
| `docker-compose up -d` | Start containers in the background.              |
| `docker-compose down`  | Stop and remove containers, networks, and images. |
| `docker-compose logs -f`| Follow log output for all services.             |
| `docker-compose restart`| Restart all services.                           |

## 5. Configuration (Dockerfile Basics)
Example of a simple `Dockerfile` for a Node.js app:
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]
```

## 6. Pro Tips & Gotchas
- **Cleanup Everything:** Use `docker system prune` to remove unused data (containers, networks, images). Add `-a` to remove all unused images.
- **Volume Persistence:** Data inside a container is lost when the container is removed. Always use **Volumes** (`-v /local:/remote`) for database storage.
- **Port Mapping:** Remember that `-p 8080:80` maps your **local** port 8080 to the **container's** port 80.
- **Lightweight Images:** Use "alpine" versions of images (e.g., `python:3.9-alpine`) to keep your image sizes small.
- **Zombie Containers:** If `docker ps` shows nothing but your app isn't starting, check `docker ps -a` for crashed containers that need to be removed.

---

## 🔗 See Also
- [Shell Basics](../terminal/SHELL_GUIDE.md): Essential for working inside containers.
- [Git Guide](GIT_GUIDE.md): Version control your Dockerfiles and Compose files.
