function [L,U,P]=luFactor(A)
% luFactor takes a coefficient matrix and creates a lower triangular matrix
% and upper triangle matrix by means of Gauss elimination that can be used
% to find the values of the variables of the coefficient matrix
%By:Jared Knigge
%Inputs:
%   A-coefficient matrix
%Outputs:
%   L-lower triangular matrix
%   U-upper triangular matrix
%   P-pivot matrix
[r c]=size(A);       %finds the size of the matrix inputted inorder that # of rows and # of columns can be save as varibles
L=eye(r);            %creates a starting identity matrix for L
U=A;                 %makes U and A equal to start U
P=eye(r);            %makes a starting indentity matrix for P
if r==c;             %checks to make sure input matrix is square
   for k=1:r         %runs through each row
      [pivot d]=max(abs(A(k:r,k)));     %finds max of first column of matrix
       d=d+k-1;                         %takes max and adds k-1 for pivoting
       if d~=k                          %makes sure d is not equal to k so that pivoting is necessary
           original_row=U(k,:);         %saves orginal row in U matrix
           U(k,:)=U(d,:);               %switches rows
           U(d,:)=original_row;         %puts new row in place
           original_P_row=P(k,:);       %saves orginal row in P matrix
           P(k,:)=P(d,:);               %switches rows
           P(d,:)=original_P_row;       %puts new row in place
       end    
       for j=k+1:r                      %starts gauss elimination 
         L(j,k)=U(j,k)/U(k,k);          %makes multiplication factor and saves in L matrix
         U(j,:)=U(j,:)-L(j,k)*U(k,:);   %applies it to U matrix
       end
   end
elseif r==1&&c==1                       %checks to make sure input matrix is not 1x1
    error('square matrix needed to preform factorization')
else                                    %makes sure input matrix is square
    error('square matrix needed to preform factorization')
end


disp(L)
disp(U)
disp(P)
end