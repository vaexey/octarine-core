TOP=top
TOPFILE=top.v
LINTFILE=.verilator/lint.vlt
WAVE_FILE=dist/wave.vcd

SRC_DIR=src
RTL_DIR=$(SRC_DIR)/rtl
TB_DIR=$(SRC_DIR)/tb
INCLUDE_DIR=$(SRC_DIR)/include
DIST_DIR=dist

VERILATOR=verilator
VERILATOR_FLAGS=$(LINTFILE) -I$(INCLUDE_DIR) -Mdir $(DIST_DIR) --assert --binary -Wall --trace --timing

RTL=$(wildcard $(RTL_DIR)/*.v)
RTL_TOP=$(RTL_DIR)/$(TOPFILE)

TB=$(wildcard $(TB_DIR)/*.sv)

tb:
	$(VERILATOR) $(RTL) $(TB) --top $(TOP) $(VERILATOR_FLAGS)
	-dist/V$(TOP)
	gtkwave $(WAVE_FILE)
	