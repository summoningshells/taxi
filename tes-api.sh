#!/bin/bash

# Test script for TAXI-API

echo "### Chauffeurs ###"

echo "POST /chauffeurs - Créer un nouveau chauffeur"
curl -X POST -H "Content-Type: application/json" -d '{"nom": "Jeanmiche", "vehicule": "clio3", "immatriculation": "beaugossedu34", "statut": "disponible"}' http://localhost/api/chauffeurs
echo "\n"

echo "GET /chauffeurs - Obtenir tous les chauffeurs"
curl http://localhost/api/chauffeurs
echo "\n"

echo "GET /chauffeurs/{id} - Obtenir un chauffeur par son ID"
curl http://localhost/api/chauffeurs/1
echo "\n"

echo "PUT /chauffeurs/{id} - Mettre à jour un chauffeur"
curl -X PUT -H "Content-Type: application/json" -d '{"nom": "Jeanmiche", "vehicule": "clio3", "immatriculation": "AB-123-CD", "statut": "indisponible"}' http://localhost/api/chauffeurs/1
echo "\n"

echo "### Clients ###"

echo "POST /clients - Créer un nouveau client"
curl -X POST -H "Content-Type: application/json" -d '{"nom": "marine", "email": "marine@lecnam.local", "tel": "+0101010"}' http://localhost/api/clients
echo "\n"

echo "GET /clients/{id} - Obtenir un client par son ID"
curl http://localhost/api/clients/1
echo "\n"

echo "### Courses ###"

echo "POST /courses - Créer une nouvelle demande de course"
curl -X POST -H "Content-Type: application/json" -d '{"client": {"id": 1}, "pointDepart": "1 rue de la Paix", "pointArrivee": "10 rue de la Guerre"}' http://localhost/api/courses
echo "\n"

echo "GET /courses - Obtenir toutes les courses"
curl http://localhost/api/courses
echo "\n"

echo "GET /courses/{id} - Obtenir une course par son ID"
curl http://localhost/api/courses/1
echo "\n"

echo "PUT /courses/{id} - Démarrer une course"
curl -X PUT -H "Content-Type: application/json" -d '{"status": "en_cours"}' http://localhost/api/courses/1
echo "\n"

echo "PUT /courses/{id} - Terminer une course"
curl -X PUT -H "Content-Type: application/json" -d '{"status": "terminee"}' http://localhost/api/courses/1
echo "\n"

echo "DELETE /courses/{id} - Annuler une course"
curl -X DELETE http://localhost/api/courses/1
echo "\n"
