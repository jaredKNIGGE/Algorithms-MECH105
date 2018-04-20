# Function Definitions
## `Simpson.m`
  This function is used to approximate the intergral of a given equation by using the Simpson's 1/3 rule. The Simpson's 1/3 approximates the integral by taking an array of data points with an even number of equally spaced intervals and computes the integral by finding a second order polynomial that connects with the two points of the interval and finds the area underneath using the equation:    
`Area=(x(3)-x(1))*((y(i)+4*y(i+1)+y(i+2))/6)`    
  The algorithm does this for every interval and adds them together to approximate the integral. If the data points have a odd number of intervals the algorithm uses Simpson 1/3 for all of the intervals except the last. For the last interval the algorithm will then compute it using the trapazoidal rule. The equation used for that is:     
`Trap=(x(length_X)-x(length_X-1))*((y(length_X)+y(length_X-1))/2)`  
  
**Inputs**   
- `x`:an array of the x data points equally spaced  
- `y`:an array of the y data points equally spaced  
  
**Outputs**  
- `I`:the estimated value of the integral 
