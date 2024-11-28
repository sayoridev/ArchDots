#!/bin/bash

# Percorso al file temporaneo per il caching dei risultati
CACHE_FILE="/tmp/polybar_updates_count"

# Funzione per contare gli aggiornamenti
count_updates() {
    # Controllo aggiornamenti di pacman
    PACMAN_UPDATES=$(checkupdates 2>/dev/null | wc -l)

    # Controllo aggiornamenti di paru
    PARU_UPDATES=$(paru -Qu 2>/dev/null | wc -l)

    # Controllo aggiornamenti di flatpak
    FLATPAK_UPDATES=$(flatpak update --appstream 2>/dev/null > /dev/null && flatpak remote-ls --updates 2>/dev/null | wc -l)

    # Somma totale degli aggiornamenti
    TOTAL_UPDATES=$((PACMAN_UPDATES + PARU_UPDATES + FLATPAK_UPDATES))

    # Salva il risultato nel file cache
    echo "$TOTAL_UPDATES" > "$CACHE_FILE"
}

# Gestione click Polybar
case "$1" in
    --refresh)
        count_updates
        ;;
    --update)
        # Chiamata allo script di aggiornamento
        ~/.config/polybar/polybar-scripts/update_system.sh
        ;;
    *)
        # Se il file cache esiste, leggilo; altrimenti calcola
        if [[ -f "$CACHE_FILE" ]]; then
            cat "$CACHE_FILE"
        else
            count_updates
            cat "$CACHE_FILE"
        fi
        ;;
esac

