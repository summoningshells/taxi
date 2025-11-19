# TAXI-API

API REST pour la gestion de courses de taxi.

![javacool](taxi-api.jpg)

## Installation

### Docker

Pour lancer l'application avec Docker, utilisez la commande suivante:

```bash
git clone
cd taxi-api
docker-compose up --build
```

L'application sera accessible via Nginx sur le port 80:
- API: `http://localhost/api/`
- Console d'administration: `http://localhost/admin/`
- Application web client: `http://localhost/`

### Sans Docker

Assurez-vous d'avoir Java et Maven installés. Pour lancer l'application, utilisez la commande suivante:

```bash
git clone
cd taxi-api
mvn spring-boot:run
```

## Script de test

```bash
chmod +x test-api.sh
./test-api.sh
```


## Routes de l'API

### Chauffeurs

*   **POST /chauffeurs** - Créer un nouveau chauffeur

    ```bash
    curl -X POST -H "Content-Type: application/json" -d '{"nom": "Jeanmiche", "vehicule": "clio3", "immatriculation": "beaugossedu34", "statut": "disponible"}' http://localhost/api/chauffeurs
    ```

*   **GET /chauffeurs** - Obtenir tous les chauffeurs

    ```bash
    curl http://localhost/api/chauffeurs
    ```

*   **GET /chauffeurs/{id}** - Obtenir un chauffeur par son ID

    ```bash
    curl http://localhost/api/chauffeurs/1
    ```

*   **PUT /chauffeurs/{id}** - Mettre à jour un chauffeur

    ```bash
    curl -X PUT -H "Content-Type: application/json" -d '{"nom": "Jeanmiche", "vehicule": "clio3", "immatriculation": "AB-123-CD", "statut": "indisponible"}' http://localhost/api/chauffeurs/1
    ```

### Clients

*   **POST /clients** - Créer un nouveau client

    ```bash
    curl -X POST -H "Content-Type: application/json" -d '{"nom": "marine", "email": "marine@lecnam.local", "tel": "+0101010"}' http://localhost/api/clients
    ```

*   **GET /clients/{id}** - Obtenir un client par son ID

    ```bash
    curl http://localhost/api/clients/1
    ```

### Courses

*   **POST /courses** - Créer une nouvelle demande de course

    ```bash
    curl -X POST -H "Content-Type: application/json" -d '{"client": {"id": 1}, "pointDepart": "1 rue de la Paix", "pointArrivee": "10 rue de la Guerre"}' http://localhost/api/courses
    ```

*   **GET /courses** - Obtenir toutes les courses

    ```bash
    curl http://localhost/api/courses
    ```

*   **GET /courses/{id}** - Obtenir une course par son ID

    ```bash
    curl http://localhost/api/courses/1
    ```

*   **PUT /courses/{id}** - Mettre à jour le statut d'une course

    *Démarrer une course:*

    ```bash
    curl -X PUT -H "Content-Type: application/json" -d '{"status": "en_cours"}' http://localhost/api/courses/1
    ```

    *Terminer une course:*

    ```bash
    curl -X PUT -H "Content-Type: application/json" -d '{"status": "terminee"}' http://localhost/api/courses/1
    ```

*   **DELETE /courses/{id}** - Annuler une course

    ```bash
    curl -X DELETE http://localhost/api/courses/1
    ```
