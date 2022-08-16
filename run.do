transcript on

vlib work


vlog "filepath"/crossbar.v
vlog "filepath"/arbiter.v
vlog "filepath"/crossbar_testbench.v

vsim -t 1ns -voptargs="+acc" crossbar_testbench






