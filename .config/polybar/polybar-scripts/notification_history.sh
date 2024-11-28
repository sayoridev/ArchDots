#!/bin/bash

# Apre lo storico delle notifiche
if [ "$1" == "history" ]; then
    # Mostra lo storico delle notifiche (puoi usare dunst, journalctl o altro)
    notify-send "Notification History" "$(cat ~/.config/dunst/dunst.log | tail -n 10)"
fi

# Elimina tutte le notifiche
if [ "$1" == "clear" ]; then
    # Comando per eliminare tutte le notifiche, dipende da come gestisci le notifiche
    pkill dunst
    sleep 1
    dunst &
fi

