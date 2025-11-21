# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### Compare and contrast One Hot and Binary encodings
One Hot:
- Each state has its' own flip flop
- Exactly one flipflop is high at any time (one hot)
- Use more flip flops, less combinational logic
- Each next state transition leads to another flip flop, easier to debug

Binary:
- Each state = binary number of log2(n) flip flops. Ex: 5 states, 3 flip flops
- Much more compact design
- Next state / output logic is harder to manipulate decode (multi bit state vector logic)

Overall:
One Hot: more register count, more simple logic
Binary: less registers (more compact), more complex logic

### Which method did your team find easier, and why?
Our team found the one hot encodings easier as there is more direct mapping between states and flip flops, debugging is more straightforward and easier to follow, and easier to follow the
states with the diagrams. Each state corresponds to an LED, so the visualization of the machine moving through states via the LED's can be easier to understand and 
easier to follow along with.
The transition logic seems easier to grasp aswell, since the equations only fall mostly under AND / OR gate logic for the current state and the input logic.

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
On an FPGA, One-Hot and Binary encoding each have advantages depending on the design needs. One-Hot uses more flip-flops but keeps the next-state logic very small, 
which can help the FSM run at higher clock speeds. Binary encoding uses fewer flip-flops but requires more complex logic to decode and transition between states. Because of 
this trade-off, One-Hot is typically used when timing performance matters, while Binary is used when conserving hardware resources is the priority.
