onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_modulus/param_A
add wave -noupdate -radix unsigned /tb_modulus/param_B
add wave -noupdate -radix unsigned /tb_modulus/result
add wave -noupdate -radix unsigned /tb_modulus/i
add wave -noupdate /tb_modulus/test_OK
add wave -noupdate -radix decimal /tb_modulus/modulus/modulus
add wave -noupdate -radix unsigned /tb_modulus/modulus/A
add wave -noupdate -radix unsigned /tb_modulus/modulus/B
add wave -noupdate /tb_modulus/modulus/a1
add wave -noupdate /tb_modulus/modulus/b1
add wave -noupdate /tb_modulus/modulus/p1
add wave -noupdate /tb_modulus/modulus/i
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
