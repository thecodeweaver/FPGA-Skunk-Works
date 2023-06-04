onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_stopwatch/clock
add wave -noupdate /tb_stopwatch/hold_count
add wave -noupdate /tb_stopwatch/reset
add wave -noupdate /tb_stopwatch/anode_signals
add wave -noupdate /tb_stopwatch/display_out
add wave -noupdate /tb_stopwatch/dut/clk
add wave -noupdate /tb_stopwatch/dut/hold_count_switch
add wave -noupdate /tb_stopwatch/dut/button_reset
add wave -noupdate /tb_stopwatch/dut/anode_signals
add wave -noupdate /tb_stopwatch/dut/display_out
add wave -noupdate /tb_stopwatch/dut/counter_clock
add wave -noupdate -radix decimal /tb_stopwatch/dut/minutes_bus
add wave -noupdate -radix decimal /tb_stopwatch/dut/seconds_bus
add wave -noupdate /tb_stopwatch/dut/divider/clock
add wave -noupdate /tb_stopwatch/dut/divider/new_clock
add wave -noupdate -radix decimal /tb_stopwatch/dut/divider/counter
add wave -noupdate /tb_stopwatch/dut/counter/clock
add wave -noupdate /tb_stopwatch/dut/counter/reset
add wave -noupdate /tb_stopwatch/dut/counter/hold_count
add wave -noupdate /tb_stopwatch/dut/counter/minutes
add wave -noupdate /tb_stopwatch/dut/counter/seconds
add wave -noupdate /tb_stopwatch/dut/display_driver/clock
add wave -noupdate /tb_stopwatch/dut/display_driver/reset
add wave -noupdate /tb_stopwatch/dut/display_driver/minutes
add wave -noupdate /tb_stopwatch/dut/display_driver/seconds
add wave -noupdate /tb_stopwatch/dut/display_driver/anode_signals
add wave -noupdate /tb_stopwatch/dut/display_driver/display_out
add wave -noupdate /tb_stopwatch/dut/display_driver/LED_BCD
add wave -noupdate /tb_stopwatch/dut/display_driver/refresh_counter
add wave -noupdate /tb_stopwatch/dut/display_driver/LED_activating_counter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {35566364446 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 244
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {35566364446 ps} {35566365449 ps}
