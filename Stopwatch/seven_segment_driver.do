onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_seven_segment_driver/clock
add wave -noupdate /tb_seven_segment_driver/reset
add wave -noupdate -radix decimal /tb_seven_segment_driver/minutes
add wave -noupdate -radix decimal /tb_seven_segment_driver/seconds
add wave -noupdate /tb_seven_segment_driver/anode_signals
add wave -noupdate /tb_seven_segment_driver/display_out
add wave -noupdate /tb_seven_segment_driver/one_hz_clock_counter
add wave -noupdate /tb_seven_segment_driver/one_hz_clock
add wave -noupdate /tb_seven_segment_driver/dut/clock
add wave -noupdate /tb_seven_segment_driver/dut/reset
add wave -noupdate -radix decimal /tb_seven_segment_driver/dut/minutes
add wave -noupdate -radix decimal /tb_seven_segment_driver/dut/seconds
add wave -noupdate /tb_seven_segment_driver/dut/anode_signals
add wave -noupdate /tb_seven_segment_driver/dut/display_out
add wave -noupdate -radix decimal /tb_seven_segment_driver/dut/LED_BCD
add wave -noupdate /tb_seven_segment_driver/dut/refresh_counter
add wave -noupdate /tb_seven_segment_driver/dut/LED_activating_counter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 337
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
WaveRestoreZoom {0 ps} {785 ps}
