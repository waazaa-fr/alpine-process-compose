*alpine-process-compose*

Image Docker de base sous Alpine Linux avec process-compose pour lancer des processus en parallèle depuis le PID 0.

```bash
#!/bin/bash

# Déclaration du tableau des versions
versions=("3.18" "3.19" "3.20" "3.21")

# Parcourir chaque version du tableau
for VALEUR in "${versions[@]}"; do
    # Créer une copie du Dockerfile avec le suffixe de la version
    cp Dockerfile "Dockerfile-${VALEUR}"
    
    # Remplacer @@ALPINE_VERSION@@ par la version actuelle dans le fichier copié
    sed -i "s/@@ALPINE_VERSION@@/${VALEUR}/g" "Dockerfile-${VALEUR}"
    
    # Construire et pousser l'image avec docker buildx
    docker buildx build \
        -f "Dockerfile-${VALEUR}" \
        --platform linux/arm64,linux/amd64 \
        -t "alpine-process-compose:${VALEUR}" \
        --push .
done
```