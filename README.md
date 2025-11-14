# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
The modulo counter divides the clock by 2 because the flipflops use the inverted output of the last flipflop, creating a small delay of 2 * N where N is the number of flipflops 

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
The ring counters output goes to all ones because when we attempt to reset the data at `8` we first have to flip through each of the T-Flip-Flops of which take roughly 1 clock cycle to solve. In this case we have 3 T-Flip-Flips so there is roughly a delay of 3 clock cycles. This delay is what results in us having all ones briefly on the first clock cycle since our reset command hasn't been sent.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?
100,000,000 / 1000 = 100,000
Log2(100000) = 16.61 
width = 17 bits
