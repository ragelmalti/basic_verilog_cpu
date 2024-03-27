# Basic Verilog CPU
## Processor report, made with diagrams.net
![CPU Diagram](ELEC2602-Project-Processor-Diagram.drawio.svg)
## Installation instructions
In order to be able to simulate the Verilog CPU, [you'll need to install Icarus Verilog](https://steveicarus.github.io/iverilog/usage/getting_started.html). Run `compile_project.sh` and then execute the `a.out` file, to create a file called `test_bench.vcd.` Using an application called [GTK Wave](https://github.com/gtkwave/gtkwave), you can open the `test_bench.vcd` file, to observe the CPU running a program in simulation:

There are 3 programs that I have written as ROM files: `ROM_p1.v`, `ROM_p2.v`, and `ROM_p3.v.` You can run any one of these programs, by commenting out the appropriate line in the `test_bench.v` file, and compiling again.
