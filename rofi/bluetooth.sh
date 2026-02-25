#!/usr/bin/env bash

macs_filter='s/Device \(\(\([0-9]\|[A-Z]\)\{2\}:\?\)\{6\}\) \(.*\)/\1/p'
name_filter='s/\tName: \(.*\)/\1/p'
connected_filter='s/\tConnected: \(.*\)/\1/p'
charge_filter='s/\tBattery percentage: \(0x\([0-9]\)*\).*/\1/p'
result_filter='s/\([A-Z]\|[a-z]\):.*/\1/p'

device_filter='s/Device: \(\(\([A-Z]\|[a-z]\|[0-9]\)* \?\)*\) :: \(Connected\|Disconnected\) (\(.*\))/\1,\4,\5/p'

function handle_device() {
  info_str=$(sed -n "$device_filter" <<< "$1")

  IFS="," read -r -a infos <<< "$info_str"

  name=${infos[0]}
  connection_status=${infos[1]}
  mac=${infos[2]}

  if [ "$connection_status" == "Connected" ]; then
    notify-send "Disconnecting from $name"
    bluetoothctl disconnect "$mac"
  else
    notify-send "Connecting to $name"
    bluetoothctl connect "$mac"
  fi
}

function get_prompts() {
  macs="$(bluetoothctl devices | sed -n "$macs_filter")"

  for mac in $macs; do
    info=$(bluetoothctl info "$mac")
    name="$(sed -n "$name_filter" <<< "$info")"
    connected=$(sed -n "$connected_filter" <<< "$info")

    if [ "$connected" == "yes" ]; then
      connection_str="Connected"
    else
      connection_str="Disconnected"
    fi

    echo "Device: $name :: $connection_str ($mac)"
  done
}

selected="$(get_prompts | rofi -dmenu)"

option="$(sed -n "$result_filter" <<< "$selected")"

case "$option" in
  "Device")
    handle_device "$selected"
    ;;
esac
