clear; close all; clc;

fuzzyFIS = mamfis(...
    'Name','Uses Binary MFs',...
    'NumInputs',1,'NumInputMFs',3,...
    'NumOutputs',1,'NumOutputMFs',3,...
    'AddRule','none'...
);

fuzzyFIS.Inputs(1).Name = 'Credit_Score';
fuzzyFIS.Inputs(1).Range = [300 850];
fuzzyFIS.Inputs(1).MembershipFunctions(1).Name = 'bad';
fuzzyFIS.Inputs(1).MembershipFunctions(1).Type = 'trapmf';
fuzzyFIS.Inputs(1).MembershipFunctions(1).Parameters = [300 300 550 650];
fuzzyFIS.Inputs(1).MembershipFunctions(2).Name = 'neutral';
fuzzyFIS.Inputs(1).MembershipFunctions(2).Type = 'trapmf';
fuzzyFIS.Inputs(1).MembershipFunctions(2).Parameters = [550 650 650 750];
fuzzyFIS.Inputs(1).MembershipFunctions(3).Name = 'good';
fuzzyFIS.Inputs(1).MembershipFunctions(3).Type = 'trapmf';
fuzzyFIS.Inputs(1).MembershipFunctions(3).Parameters = [650 750 850 850];

plotmf(fuzzyFIS,'input',1,1000);
set(findall(gca,'Type','Line'),'LineWidth',3);


