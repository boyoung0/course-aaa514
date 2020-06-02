#!/bin/bash

GEM5_EXE=build/X86/gem5.opt
GEM5_CFG=configs/example/se.py

# Benchmark
OUT_DIR=res/403.gcc
BENCH_CMD=bench/403.gcc/gcc_base.i386
BENCH_OPT="bench/403.gcc/data-ref/166.i -o 166.s"
#

# GEM5 options
GEM5_OPT="--outdir=$OUT_DIR"

# CPU
CPU_TYPE=DerivO3CPU

# Cache
L1I_SIZE=32kB
L1D_SIZE=32kB
L2_SIZE=512kB

# Memory
MEM_SIZE=1GB

# Simultion options
FAST_FORWARD=1000000
SIM_INST=10000000

# Command generation
GEM5_CMD="$GEM5_EXE $GEM5_OPT $GEM5_CFG "
GEM5_CMD="$GEM5_CMD --cmd=$BENCH_CMD --options=\"$BENCH_OPT\" "
GEM5_CMD="$GEM5_CMD --cpu-type=$CPU_TYPE "
GEM5_CMD="$GEM5_CMD --mem-size=$MEM_SIZE "
GEM5_CMD="$GEM5_CMD --caches --l2cache --l1i_size=$L1I_SIZE --l1d_size=$L1D_SIZE --l2_size=$L2_SIZE "
#GEM5_CMD="$GEM5_CMD --fast-forward=$FAST_FORWARD "
GEM5_CMD="$GEM5_CMD --fast-forward=$FAST_FORWARD --maxinsts=$SIM_INST "

rm cmd.sh
touch cmd.sh
echo $GEM5_CMD >> cmd.sh
chmod +x cmd.sh
