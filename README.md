# Countdown-Display
A vending machine that will give candy and return change after user enters coins, which can be reset with a button

This is a design for an electronic vending machine which sells candy for 25 cents:
  The machine has a clock (Clk) signal and Reset (Rst) button such that when Reset = I, FSM goes back to an initial state.
  It accepts N (Nickel 5 cents), D (Dime IO cents) and Q (Quarter = 25 cents)
  It keeps track of the amount of money that the customer enters using the 6-bit output, Number, and at each state (when Candy is still 0), it displays the amount of money that it has received.
` It releases the candy by setting Candy = 1 and also returns the change through Number if the customer enters more than or equal to 25 cents.

Note:
Once the machine reaches the states that release the candy, it will stay at that state until the reset button is pushed. Once the reset button is pushed, the machine goes back to the initial state and
waits for the next purchase. In practice, the machine will release the candy, return the change (if any), and then go back to the initial state waiting for the next purchase by a customer.
