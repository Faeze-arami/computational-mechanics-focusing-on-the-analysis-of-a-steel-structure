
% function geotop: defines geometry and topology data

function [nInc,nElem,dXY,nNode,Leng_Elem,l1]=geotop

% Matrix of the nodal coordinates dXY:
% the n-th row in dXY collects the nodal coordinates of n-th node 
% dXY(n,:)=[x coordinate of n-th node, y coordinate of n-th node]
%223894 
ID_Number=[2 2 2 2 8 5]; 

% a=Matrico(1); b=Matrico(2); 

c=ID_Number(3); d=ID_Number(4); e=ID_Number(5); f=ID_Number(6);

h1=(2.9+0.05*d); h2=2.8; h3=1.4;
l1=(5.6+0.1*f); l2=(3.75-0.05*e); lc=1;
alfa=35*pi/180;


  dXY=[     l1+l2,           0;%1
            l1+l2,           h1;%2
            l1+l2,           h1+h2;%3
            l1,              0;%4  
            l1,              h1;%5
            l1,              h1+h2;%6
            l1,              h1+h2+h3;%7
            0,               0;%8
            0,               h1;%9
            0,               h1+h2;%10
            0,               h1+h2+h3;%11
            l1/2,            h1+h2+h3+(tan(alfa)*(l1/2));%12
            -lc,             h1+h2+h3-(tan(alfa)*lc)];%13

% Total number of nodes
  nNode=size(dXY,1);   

% Connection matrix nInc:
% the ne-th row of nInc contains the node numbers at the ne-th beam and the 
% corresponding dofs
% nInc(ne,:)=[n1, n2, n1u, n1v, n1f, n2u, n2v, n2f] 
  nInc=[1, 2, 1,2,3,4,5,6;%1
        2, 3, 4,5,6,7,8,9;%2
        4, 5, 10,11,12,13,14,15;%3
        5,6,13,14,15,16,17,18;%4
        6,7,16,17,18,19,20,21;%5
        8,9,22,23,24,25,26,27;%6
        9,10,25,26,27,28,29,30;%7
        10,11,28,29,30,31,32,33;%8
        5,2,13,14,46,4,5,43;%9
        6,3,16,17,51,7,8,49;%10
        9,5,25,26,27,13,14,15;%11
        10,6,28,29,30,16,17,18;%12
        5,1,13,14,45,1,2,40;%13
        4,2,10,11,41,4,5,42;%14
        6,2,16,17,50,4,5,44;%15
        5,3,13,14,47,7,8,48;%16
        12,7,34,35,36,19,20,21;%17
        11,12,31,32,33,34,35,36;%18
        13,11,37,38,39,31,32,33;];%19



% Total number of beams
  nElem=size(nInc,1);  

  % Calculation of Length of each element
  Leng_Elem=zeros(1,nElem);
  for nnn=1:nElem
      Leng_Elem(nnn)=sqrt((dXY(nInc(nnn,2),2)-dXY(nInc(nnn,1),2))^2+(dXY(nInc(nnn,2),1)-dXY(nInc(nnn,1),1))^2);
  end

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%