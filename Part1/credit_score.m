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

figure(1);
plotmf(fuzzyFIS,'input',1,1000);
set(findall(gca,'Type','Line'),'LineWidth',3);

fuzzyFIS.Outputs(1).Name = 'Risk';
fuzzyFIS.Outputs(1).MembershipFunctions(1).Name = 'low';
fuzzyFIS.Outputs(1).MembershipFunctions(1).Type = 'trapmf';
fuzzyFIS.Outputs(1).MembershipFunctions(1).Parameters = [0 0 0.25 0.5];
fuzzyFIS.Outputs(1).MembershipFunctions(2).Name = 'medium';
fuzzyFIS.Outputs(1).MembershipFunctions(2).Type = 'trapmf';
fuzzyFIS.Outputs(1).MembershipFunctions(2).Parameters = [0.25 0.5 0.5 0.75];
fuzzyFIS.Outputs(1).MembershipFunctions(3).Name = 'high';
fuzzyFIS.Outputs(1).MembershipFunctions(3).Type = 'trapmf';
fuzzyFIS.Outputs(1).MembershipFunctions(3).Parameters = [0.5 0.75 1 1];

figure(2);
plotmf(fuzzyFIS,'output',1,1000);
set(findall(gca,'Type','Line'),'LineWidth',3);

rules = [...
    "If Credit_Score is bad then Risk is high";...
    "If Credit_Score is neutral then Risk is medium";...
    "If Credit_Score is good then Risk is low"...
    ];
fuzzyFIS = addRule(fuzzyFIS,rules);

options = gensurfOptions();
options.NumGridPoints = 900;

figure(3);
gensurf(fuzzyFIS,options);
set(findall(gca, 'Type','Line'),'LineWidth',3);
grid on;


    

