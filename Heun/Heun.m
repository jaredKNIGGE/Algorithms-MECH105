function [t,y]= Heun(dydt,tspan,yO,h,es,maxit)
%Heun implements the improved Euler's method/Heun method in order to find
%the numerical solution to a differential equation dydt over the span tspan
%with an intial condition yO, and step size h. Es and maxit are optional
%varibles and defult to es=.001 and maxit=50 is vaules are not specified,
%these variables refer to the stopping criterion for iterations involving
%the predictor-corrector. 
%By: Jared Knigge
%Inputs:
%   dydt-the differential equation
%   tspan-defines t interval
%   yO-intial condition
%   h-step size
%   es-desired error
%   maxit-maximum number of iterations
%Outputs:
%   t-t values
%   y-y values
if nargin<4             %makes sure that there is minimum of 4 inputs
    error ('at least 4 arguments required')
elseif nargin==4        %if exactly 4 inputs makes default for last two inputs
    es=.001;            %default error of .001%
    maxit=50;           %default maximum # of iterations to 50
elseif nargin==5        %if exactly 5 inputs makes default for maximum # of iterations
    maxit=50;
end
ea=100;                 %preallocates error for while loop
iter=0;                 %preallocates iterations for while loop
placement=2;            %preallocates placement for t and y matrices
t(1)=tspan(1);          %sets the first value of t matrix
y(1)=yO;                %sets the first value of y matrix
matrix=tspan(1):h:tspan(2);                 %makes matrix for the purpose of checking to see if step size is needed to be changed for last interval
for ti=(tspan(1)+h):h:tspan(end)            %(ti="t")makes values to be used for eulers and huens method equations
    predictor=yO+(ti*(dydt(ti,yO)));        %evaluates predictor value using eulers method
    right_slope=dydt(ti,predictor);         %calculates right slope
    left_slope=dydt(ti-h,yO);               %calculates left slope
    corrector=yO+(h/2)*(left_slope+right_slope); %calulates 1st corrector for error analysis
    while ea>es && maxit>iter               %runs loop until desired error or maximum # of iterations is met
          new_corrector=yO+(h/2)*((left_slope)+dydt(ti,corrector)); %approximates y value
          ea=abs(((new_corrector-corrector))/new_corrector*100);    %calculates error
          iter=iter+1;                                              %iteration count
          corrector=new_corrector;                                  %resets y value
    end
    yO=corrector;                           %resets YO value
    y(placement)=corrector;                 %places aprroximated y value in y matrix
    t(placement)=ti;                        %places corrosponding t value in t matrix
    ea=100;                                 %resets error
    iter=0;                                 %resets iterations
    placement=placement+1;                  %changes placement
end
%if loop checks if step size is needed to be changed for last interval and
%evaluates y value with the new step size
if matrix(end)~=tspan(end)                %uses preallocated matrices to see if last vaules are equal
   new_step=tspan(end)-matrix(end);       %calculates new step size
   ti=tspan(end);                         
   t1=ti+new_step;
   predictor=yO+(new_step*(dydt(ti,yO)));
   right_slope=dydt(t1,predictor);
   left_slope=dydt(ti,yO);
   corrector=yO+(new_step/2)*(left_slope+right_slope);
        while ea>es && maxit>iter
              new_corrector=yO+(new_step/2)*((left_slope)+dydt(t1,corrector));
              ea=abs(((new_corrector-corrector))/new_corrector*100);
              iter=iter+1;
              corrector=new_corrector;
        end
   y(placement)=corrector;
   t(placement)=ti;
end
plot(t,y,'b-s')                         %plots t and y values
xlabel('t')
ylabel('y')
title('Approximation of Differential Equation')
end