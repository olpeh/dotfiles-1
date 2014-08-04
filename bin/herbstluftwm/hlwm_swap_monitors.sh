hc() {
	herbstclient "$@"
}

mon_count=$(hc list_monitors | wc -l - | cut -d' ' -f1,1)
cur_mon=$(hc attr monitors.focus.index)

# wrap around monitors
if [[ $cur_mon == 0 && $1 == -1 ]]; then
	target_mon=$((mon_count - 1))
else
	target_mon=$((($cur_mon $1) % $mon_count))
fi

target_tag=$(hc attr monitors.$target_mon.tag)

echo $target_mon
hc use $target_tag
hc focus_monitor $target_mon
