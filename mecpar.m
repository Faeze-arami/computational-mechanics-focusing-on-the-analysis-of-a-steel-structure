
% function mecpar: defines the mechanical parameters of the structure

function [dPar,slender,section_height]=mecpar(Leng_Elem,nElem)

% Matrix of the geometric and mechanical parameters of the beams dPar:
% the ne-th row of dPar collects the parameters for the ne-th beam:
%   - Young modulus of the material (E);
%   - area of the cross section (A);
%   - moment of inertia of the cross section (I);
% dPar(ne,:)=[E, A, I]
  dE=21*(10^7); %KN/m^2 %similar for the all structural steel elements

  %Chosen profile for the beams HEA 240
  dA_beam=76.84*(10^(-4)); %m^2 
  dI_beam=7763*(10^(-8)); %m^4
  i_beam=6*(10^(-2)); %m %minimum radius of gyration 
  height_beam=230*(10^(-3)); %m

  %Chosen profile for the inclined roof beams HEA 120
  dA_incl_roof_beam=25.34*(10^(-4)); %m^2 
  dI_incl_roof_beam=606.2*(10^(-8)); %m^4
  i_incl_roof_beam=3.02*(10^(-2)); %m %minimum radius of gyration
  height_incl_roof_beam=114*(10^(-3)); %m

  %Chosen profile for the columns HEB 160
  dA_column=54.25*(10^(-4)); %m^2 
  dI_column=2492*(10^(-8)); %m^4
  i_column=4.05*(10^(-2)); %m %minimum radius of gyration
  height_column=160*(10^(-3)); %m

  %Square tube profile for the truss members 70*2
  dA_truss=5.44*(10^(-4)); %m^2
  dI_truss=41.96*(10^(-8)); %m^4
  i_truss=2.78*(10^(-2)); %m %minimum radius of gyration
  height_truss=70*(10^(-3)); %m

  dPar=[dE, dA_column, dI_column;%1 
        dE, dA_column, dI_column;%2
        dE, dA_column, dI_column;%3
        dE, dA_column, dI_column;%4 
        dE, dA_column, dI_column;%5
        dE, dA_column, dI_column;%6
        dE, dA_column, dI_column;%7 
        dE, dA_column, dI_column;%8
        dE, dA_truss, dI_truss;%9
        dE, dA_beam, dI_beam;%10 
        dE, dA_beam, dI_beam;%11 
        dE, dA_beam, dI_beam;%12 
        dE, dA_truss, dI_truss;%13
        dE, dA_truss, dI_truss;%14 
        dE, dA_truss, dI_truss;%15
        dE, dA_truss, dI_truss;%16
        dE, dA_incl_roof_beam, dI_incl_roof_beam;%17
        dE, dA_incl_roof_beam, dI_incl_roof_beam;%18
        dE, dA_incl_roof_beam, dI_incl_roof_beam;];%19
    
      

 %Modified Part of the MATLAB CODE in order to find element slenderness
 slender=zeros(1,nElem);
 slender(1,1:8)=Leng_Elem(1,1:8)/i_column; %Column element slenderness
 slender(1,9)=Leng_Elem(1,9)/i_truss; %Truss element slenderness
 slender(1,10:12)=Leng_Elem(1,10:12)/i_beam; %Beam element slenderness
 slender(1,13:16)=Leng_Elem(1,13:16)/i_truss; %Truss element slenderness 
 slender(1,17:19)=Leng_Elem(1,17:19)/i_incl_roof_beam; %Inclined roof beams element slenderness
 

 %Height of each element to be used in the mod_HMstress.m -> in order to
 %get the distance of neutral axis from the top of cross sections

section_height=[height_column;%1
                height_column;%2
                height_column;%3
                height_column;%4
                height_column;%5
                height_column;%6
                height_column;%7
                height_column;%8
                height_truss;%9
                height_beam;%10
                height_beam;%11
                height_beam;%12
                height_truss;%13
                height_truss;%14
                height_truss;%15
                height_truss;%16
                height_incl_roof_beam;%17
                height_incl_roof_beam;%18
                height_incl_roof_beam;];%19
                
             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%