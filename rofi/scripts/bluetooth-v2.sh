#!/usr/bin/env bash

macs_filter='s/Device \(\(\([0-9]\|[A-Z]\)\{2\}:\?\)\{6\}\) \(.*\)/\1/p'
name_filter='s/\tName: \(.*\)/\1/p'
connected_filter='s/\tConnected: \(.*\)/\1/p'
charge_filter='s/\tBattery Percentage: \(0x\([0-9]\)*\).*/\1/p'
result_filter='s/\([A-Z]\|[a-z]\):.*/\1/p'

function get_prompts() {
  macs="$(bluetoothctl devices | sed -n "$macs_filter")"

  for mac in $macs; do
    info=$(bluetoothctl info "$mac")
    echo "$info" > /tmp/mac-"$mac"
    name="$(sed -n "$name_filter" <<< "$info")"
    connected=$(sed -n "$connected_filter" <<< "$info")
    charge=$(printf "%d" $(sed -n "$charge_filter" <<< "$info"))

    if [ "$connected" == "yes" ]; then
      connection_str="Connected"
    else
      connection_str="Disconnected"
    fi

    printf "%s :: %s (%s)\0info\x1f%s,%s,%s\x1ficon\x1faudio-headset\n" \
    "$name" "$connection_str" "$charge%" "$name" "$connection_str" "$mac"
  done
}

function handle_device() {
  IFS="," read -r -a infos <<< "$ROFI_INFO"

  name=${infos[0]}
  connection_status=${infos[1]}
  mac=${infos[2]}


  if [ "$connection_status" == "Connected" ]; then
    notify-send "Disconnecting from $name"
    bluetoothctl disconnect "$mac" > /dev/null &
  else
    notify-send "Connecting to $name"
    bluetoothctl connect "$mac" > /dev/null &
  fi
}

if [ ! -z "$@" ]; then
  handle_device "$ROFI_INFO"
else
  echo -en "\0no-custom\x1ftrue\n"
  get_prompts
fi
