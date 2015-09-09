%% Initialization
clear all;
close all;
clc;

%% parase data from lab view frequency response vi
% file with data
file = importdata('data.txt','\t',5);
% separate columns
freq = file.data(:,1);
VPP1 = file.data(:,2);
VPP2 = file.data(:,3);
GAIN = file.data(:,4);
dBGain = file.data(:,5);

%% initialize values of circuit
R1 = 5000
theoreticalGain = -20
frequency_DB = 2800

% Filter resistance
filterResistance = -theoreticalGain*R1
capacitance = 1/(2*pi*filterResistance*frequency_DB)
R_F = ['Rf= ', num2str(filterResistance), ' Ohms'];
C1 = ['C= ', num2str(capacitance),' F'];

% display filter resistance and capacitance
disp(R_F)
disp(C1)

%% Measured Data Graphed - See Results Section 
semilogx(freq,dBGain)
hold on
timeFreq = logspace(1,6,100);
A = ((filterResistance/R1)./(sqrt(1+((2*pi*timeFreq*filterResistance*capacitance).^2))))';
logA = 20*log10(A);

% plot frequency of time and logX
plot(timeFreq,logA,'r')
xlabel('Frequency (Hz)')
ylabel('Gain (dB)')
title('Low Pass Filter of OpAmp of Ideal and Measured');
legend('Measured','Ideal');
grid on


%% Gain of Measured Data 
logFreq = log10(freq);
[p, s] = polyfit(logFreq(1:30),dBGain(1:30),1);
rSq = double(1 - (s.normr^2)/((length(logFreq(1:30)) - 1) * std(dBGain(1:30))^2))
sigma = double(p(1) * sqrt((1/rSq - 1)/(length(logFreq(1:30)) - 2)));

% Display Data
x = ['GAIN = ', num2str(p(2)), ' ± ', num2str(sigma), ' dB'];
disp(x)

%% use createFit Function - See Data in Log
createFit(logFreq, dBGain)



