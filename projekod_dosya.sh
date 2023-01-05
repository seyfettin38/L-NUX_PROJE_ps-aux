#!/bin/bash

while true; do
  # Kullanıcıdan bir süreç seçmesi için menü açalım.
  selected_process=$(ps aux | awk '{print  $2 "\n" $11}' | zenity --list --title "Süreç seç" --column "PID" --column "Süreçler" --width=800 --height=600)

  # Kullanıcı seçimi iptal ederse, döngüden çıkalım.
  if [ -z "$selected_process" ]; then
    break
  fi

  # Kullanıcının seçtiği sürecin PID numarasını ayıklayalım.
  pid=$(echo $selected_process | awk '{print $1}')
  process_name=$(echo $selected_process | awk '{print $2}')

  # Süreci öldürmeyi onaylaması için kullanıcıya bir kutu açalım.
  zenity --question --title "Süreci öldür" --text "Seçilen süreci öldürmek istediğinizden emin misiniz?\n PID: $pid" --ok-label="Evet" --cancel-label="Hayır" --width=100 --height=50

  # Kullanıcı "Evet" seçeneğini seçtiğinde süreci öldürmeyi onaylamaya davet edelim.
  if [ $? -eq 0 ]; then
    zenity --question --title "Süreci öldür" --text "Bu işlem kötü sonuçlar doğurabilir, yine de devam etmek istiyor musunuz?" --ok-label="Evet" --cancel-label="Hayır" --width=100 --height=50

    # Kullanıcı hala süreci öldürmeyi onaylarsa, süreci öldürelim.
    if [ $? -eq 0 ]; then
      kill "$pid"
      zenity --info --title "Süreci öldür" --text "Süreç öldürüldü" --width=400 --height=300
    else
      zenity --info --title "Süreci öldür" --text "Süreç öldürme işlemi iptal edildi" --width=400 --height=300
    fi
  else
    zenity --info --title "Süreci öldür" --text "Süreç öldürme işlemi iptal edildi" --width=400 --height=300
  fi
done


