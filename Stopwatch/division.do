onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_division/param_A
add wave -noupdate -radix unsigned /tb_division/param_B
add wave -noupdate -radix unsigned /tb_division/result
add wave -noupdate -radix unsigned /tb_division/i
add wave -noupdate /tb_division/test_OK
add wave -noupdate -radix decimal /tb_division/divide/divide
add wave -noupdate -radix unsigned /tb_division/divide/A
add wave -noupdate -radix unsigned /tb_division/divide/B
add wave -noupdate /tb_division/divide/a1
add wave -noupdate /tb_division/divide/b1
add wave -noupdate /tb_division/divide/p1
add wave -noupdate /tb_division/divide/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {294 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 219
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
WaveRestoreZoom {280 ps} {430 ps}
