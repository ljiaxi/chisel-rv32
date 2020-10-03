DIRS = sim

all: sim/Cpu.v
	for d in $(DIRS); do make -C $$d; done

test:
	for d in $(DIRS); do make -C $$d test; done

sim/Cpu.v: src/main/scala/rv32/*.scala
	sbt 'run sim'

clean:
	for d in $(DIRS); do make -C $$d clean; done
	rm -rf project target test_run_dir sim/Cpu.*

.PHONY: all test clean
