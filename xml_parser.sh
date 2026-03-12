#!/bin/bash

# Functie pentru citirea unui element dintr-un fisier XML
read_xml() {
    local file="$1"
    local element="$2"
    if grep -q "<$element>.*</$element>" "$file"; then
    	echo "Valoarea elementului <$element> este:"
        grep -oP "(?<=<$element>).*?(?=</$element>)" "$file" 
    else
    
    	if grep -q "<$element>" "$file"; then
    		echo "Elementul <$element> este parinte."
    	else
        	echo "Eroare: Elementul <$element> nu exista in fisierul $file."
        fi
    fi
}


# Functie pentru scrierea unui element intr-un fisier XML
write_xml() {
    local file="$1"
    local element="$2"
    local value="$3"
    
    local root_tag
    root_tag=$(head -n 1 "$file" | sed 's/[<>]//g')
    if grep -q "</$root_tag>" "$file"; then
        if grep -q "<$element>.*</$element>" "$file"; then
            sed -i "s|<$element>.*</$element>|<$element>$value</$element>|" "$file"
            echo "Elementul <$element> a fost actualizat"
        else
            sed -i "/<\/$root_tag>/i <$element>$value</$element>" "$file"
        echo "Elementul <$element> a fost adaugat"
        fi
    else
        echo "Eroare: Fisierul XML nu contine un element radacina valid"
    fi
}

# Meniu pentru utilizator
echo "XML - Parser Script"
echo "1: Citire element"
echo "2: Scriere element"
read -p "Alegeti o optiune (1/2): " option

case $option in
    1)
        read -p "Introduceti numele fisierului XML: " file
        read -p "Introduceti numele elementului cautat: " element
        read_xml "$file" "$element"
        ;;
    2)
        read -p "Introduceti numele fisierului XML: " file
        read -p "Introduceti numele elementului ce trebuie scris: " element
        read -p "Introduceti valoarea elementului: " value
        write_xml "$file" "$element" "$value"
        ;;
    *)
        echo "Optiune nevalida"
        ;;
esac
