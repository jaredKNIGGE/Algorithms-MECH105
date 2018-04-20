# Function Definitions
## `falsePosition.m`
  This function is used for the purpose of approximating the roots of an equation using the false position method. The false position method finds the roots of an equation by braketting the root and using the equation:   
`newroot=x1-((x2-x1)f(x1))/(f(x2)-f(x1)) `  
  
**Inputs**     
- `func`:the function being evaluated    
- `xl`:the lower guess  
- `xu`:the upper guess    
- `es`:the desired relative error     
- `maxiter`:the maximum number of iterations desired 
  
**Outputs**     
- `root`:the estimated root location    
- `fx`:the function evaluated at the root location    
- `ea`:the approximate relative error     
- `iter`:how many iterations were preformed  
