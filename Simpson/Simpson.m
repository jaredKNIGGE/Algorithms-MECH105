function I = Simpson(x,y)
%Simpson uses the simpson 1/3 rule in order to make an estimation of the
%integral of a function using a specifc array of inputted data points. If
%there is an odd number of intervals then the function will use the
%trapazoidal rule for the last interval. 
%By: Jared Knigge
%Inputs:
%   x-a matrix of the x data points equally spaced 
%   y-a matrix of the y data points the same lenth as the x 
%Outputs:
%   I-the estimated value of the integral 
if nargin<2                         %makes sure two arguments are input
    error('both a X and Y matrix needed')
end
length_X=length(x);                 %finds the length of x array
length_Y=length(y);                 %finds the length of y array
spacing_X=diff(x);                  %finds the spacing between each x
Average_X=mean(spacing_X);          %finds the average of the ditances between each x to make sure they are equally spaced
Even_Odd=mod(length_X,2);           %finds if the amount of x values are odd or even in order to determine if trap rule is needed
Area=0;                             %makes area variable 
I=0;                                %makes I variable
if Average_X>=spacing_X+.00000001   %checks if average of spacing and the spacing are equal to see if intervals are evenly spaced
    error('your X array must be evenly spaced')
end
if length_X~=length_Y               %checks to make sure length of X and Y are same 
     error('the length of your X and Y array are not the same')
elseif length_X<3
    error('the length of your X and Y array must must greater then 3')
end
if Even_Odd==0                      %0=even number of inputs which equals odd number of segments so trap rule is needed
   warning('trap rule used for last interval')
    for i=1:2:length_X-2            
        Area=(x(3)-x(1))*((y(i)+4*y(i+1)+y(i+2))/6);
        I=I+Area;
    end
    Trap=(x(length_X)-x(length_X-1))*((y(length_X)+y(length_X-1))/2);
    I=I+Trap;
elseif Even_Odd==1                  %1=odd number of inputs which equals even number of segments so trap rule is not needed
    for i=1:2:length_X-2
        Area=(x(3)-x(1))*((y(i)+4*y(i+1)+y(i+2))/6);
        I=I+Area;
    end
end
disp(I)
end
