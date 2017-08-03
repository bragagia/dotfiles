#!/bin/bash
pac=$(checkupdates | wc -l)

check=$((pac))
if [[ "$check" != "0" ]]
then
    echo "$pac %{F#5b5b5b}%{F-} $aur"
fi
