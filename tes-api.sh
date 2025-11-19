#!/bin/bash

# Test script for TAXI-API

echo "### Chauffeurs ###"

echo "POST /chauffeurs - Créer un nouveau chauffeur"
curl -X POST -H "Content-Type: application/json" -d '{"nom": "Jeanmiche", "vehicule": "clio3", "immatriculation": "beaugossedu34", "statut": "disponible"}' http://localhost:8080/chauffeurs
echo "\n"

echo "GET /chauffeurs - Obtenir tous les chauffeurs"
curl http://localhost:8080/chauffeurs
echo "\n"

echo "GET /chauffeurs/{id} - Obtenir un chauffeur par son ID"
curl http://localhost:8080/chauffeurs/1
echo "\n"

echo "PUT /chauffeurs/{id} - Mettre à jour un chauffeur"
curl -X PUT -H "Content-Type: application/json" -d '{"nom": "Jeanmiche", "vehicule": "clio3", "immatriculation": "AB-123-CD", "statut": "indisponible"}' http://localhost:8080/chauffeurs/1
echo "\n"

echo "### Clients ###"

echo "POST /clients - Créer un nouveau client"
curl -X POST -H "Content-Type: application/json" -d '{"nom": "marine", "email": "marine@lecnam.local", "tel": "+0101010"}' http://localhost:8080/clients
echo "\n"

echo "GET /clients/{id} - Obtenir un client par son ID"
curl http://localhost:8080/clients/1
echo "\n"

echo "### Courses ###"

echo "POST /courses - Créer une nouvelle demande de course"
curl -X POST -H "Content-Type: application/json" -d '{"client": {"id": 1}, "pointDepart": "1 rue de la Paix", "pointArrivee": "10 rue de la Guerre"}' http://localhost:8080/courses
echo "\n"

echo "GET /courses - Obtenir toutes les courses"
curl http://localhost:8080/courses
echo "\n"

echo "GET /courses/{id} - Obtenir une course par son ID"
curl http://localhost:8080/courses/1
echo "\n"

echo "PUT /courses/{id} - Démarrer une course"
curl -X PUT -H "Content-Type: application/json" -d '{"status": "en_cours"}' http://localhost:8080/courses/1
echo "\n"

echo "PUT /courses/{id} - Terminer une course"
curl -X PUT -H "Content-Type: application/json" -d '{"status": "terminee"}' http://localhost:8080/courses/1
echo "\n"

echo "DELETE /courses/{id} - Annuler une course"
curl -X DELETE http://localhost:8080/courses/1
echo "\n"
