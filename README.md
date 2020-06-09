# Counter PC Example

The PC will increment until reaching *input* pc_stop value.

## Dependencies
* verilator (for linting)
* icarus (for simulation)
* gtkwave (for the vcd file)
* quartus (for FPGA synthesis)

## Lint
```
make lint
```

## Simulate
```
make sim
```

## FPGA synthesis
(All input and output ports are mapped as "virtual")
```
make project
```
