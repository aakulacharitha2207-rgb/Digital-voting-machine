# Digital Voting Machine (Verilog)

## Overview

A simple Digital Voting Machine (DVM) designed using Verilog HDL.

Three candidates are available:

- Candidate A
- Candidate B
- Candidate C

Each clock cycle accepts one vote.

The vote counters are 8-bit registers.

---

## Inputs

| Signal | Description |
|---------|-------------|
| clk | Clock |
| reset | Reset counters |
| vote_a | Vote for Candidate A |
| vote_b | Vote for Candidate B |
| vote_c | Vote for Candidate C |
| result | Disable voting and display result |

---

## Outputs

| Signal | Description |
|---------|-------------|
| count_a | Votes for Candidate A |
| count_b | Votes for Candidate B |
| count_c | Votes for Candidate C |

---

## Compile

```bash
iverilog -o voting src/voting_machine.v src/voting_machine_tb.v
```

Run

```bash
vvp voting
```

Waveform

```bash
gtkwave voting_machine.vcd
```

---

## Expected Result

Candidate A = 2

Candidate B = 2

Candidate C = 1