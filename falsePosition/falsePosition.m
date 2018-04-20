function [root,fx,ea,iter]=falsePosition(func,xl,xu,es,maxiter)
% falsePosition evaliutes a function to finds its roots using the false
% position method
% By: Jared Knigge 
%Inputs:
%   func-the function being evaluated
%   xl-the lower guess
%   xu-the upper guess
%   es-the desired relative error (default of .0001)
%   maxiter-the number of iterations desired (default of 200)
%Outputs:
%   root-the estimated root location
%   fx-the function evalutated the root location
%   ea-the approximate relative error
%   iter-how many iterations were preformed 
f=func;             %defines the function as f
iter=0;             %starts the iteration count at 0
if nargin<3         %checks to make sure user inputs at least three arguments
    error('at least 3 arguments required')
elseif nargin<4     %sets defaults if user only inputs three arguments
    es=.0001;
    maxiter=200;
elseif nargin<5     %sets default if user only inputs four arguments
    maxiter=200;
end
ea=100;
oldguess=(abs(xu-xl))/2+xl;             %determines an 'old' value to use for error values
if sign(f(xl))~=sign(f(xu))   %checks to make sure sign of y values are opposite of each other 
    while ea>es && maxiter>iter %runs code as long as error is greater then desired and the number of iterations is less than number desired
        root=xu-(f(xu)*(xu-xl))/(f(xu)-f(xl)); %evaluates new root
        iter=iter+1;            %adds to iteration count
        ea=abs(((root-oldguess))/root*100);               %determines the error
        oldguess=root;
        if sign(f(root))~=sign(f(xu)) %checks to see if upper bracket is before or after new guess
            xl=root;       
        else 
            xu=root;
        end
    end
else
    error('upper and lower guess do not bracket the root')
end
fx=f(root);
fprintf('Root:%5.4f \n',root)     %displays root in numeric value
fprintf('Fx:%5.4f \n',fx)         %displays function at the root value  
fprintf('Error:%5.8f percent \n',ea)      %displays the error  
fprintf('Iterations:%1.0f \n',iter)  %displays the number of iterations
end
    
    
