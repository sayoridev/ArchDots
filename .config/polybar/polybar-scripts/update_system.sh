#!/bin/bash

# Apri un terminale per aggiornare i pacchetti
TERMINAL="kitty" # Sostituisci con il tuo terminale preferito, es. gnome-terminal, kitty, xterm, ecc.

$TERMINAL bash -c "echo 'Aggiornamento del sistema in corso...'; \
sudo pacman -Syu --noconfirm; \
paru -Syu --noconfirm; \
flatpak update -y; \
echo 'Aggiornamento completato. Premi Invio per chiudere.'; \
read"


