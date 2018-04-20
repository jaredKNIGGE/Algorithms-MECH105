# Function Definitions
## `luFactor.m`  
  This function to create an upper and lower triangular matrix from a system of equations as well as a pivot matrix in order to keep track of pivoting. Through the use of Guass elimination the algorithm pivots the matrix if necessary and outputs all three matrices to be used for other applications. 
  
**Inputs**
- `A`:square coeffcient matrix 
  
**Ouputs**
- `L`:lower triangular matrix
- `U`:upper triangular matrix
- `P`:pivot matrix
