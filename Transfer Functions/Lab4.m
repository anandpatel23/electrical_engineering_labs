%% Lab 4 - Transfer Function Analysis II
% Anand Patel & Timothy Koh
% Find the exact gain plot of any four of the six prelab circuits
%% Initialization
clear;
clc; 
close all;

%% Capacitor - Low Pass (a) 
s = tf('s');
H1 = ((2*10^7)/(s^2+12000*s+(2*10^7)));
zpk(H1)
zeroes = zero(H1)
poles = pole(H1)

% Values
% wn = 4472.14
% z = 1.34
freq = 100:1:1000000;
H1_frd = frd(H1,freq)
[H1_Resp, H1_Freq] = frdata(H1_frd, 'v')
MagH1_dB = 20*log10(abs(H1_Resp))
semilogx(H1_Freq, MagH1_dB)
figure(1)
grid on
title('Magnitude of response of H(dB) -> Capacitor - Low Pass (a)', 'fontsize', 16)
xlabel('Frequency, r/s','fontsize', 12)
ylabel('H, dB', 'fontsize', 12)

%% Capacitor - Low Pass (b) 
s = tf('s');
H2 = ((2*10^7)/(s^2+1200*s+(2*10^7)));
zpk(H2)
zeroes = zero(H2)
poles = pole(H2)

% Values
% wn = 4472.14
% z = 0.134
freq = 100:1:1000000;
H2_frd = frd(H2, freq)
[H2_Resp, H2_Freq] = frdata(H2_frd, 'v')
MagH2_dB = 20*log10(abs(H2_Resp))
semilogx(H2_Freq, MagH2_dB)
figure(1)
grid on
title('Magnitude of response of H(dB) -> Capacitor - Low Pass (b)', 'fontsize', 16)
xlabel('Frequency, r/s','fontsize', 12)
ylabel('H, dB', 'fontsize', 12)

%% Inductor - High Pass (a) 
s = tf('s');
H3 = ((s^2)/(s^2+12000*s+(2*10^7)));
zpk(H3)
zeroes = zero(H3)
poles = pole(H3)

% Values
% wn = 4472.14
% z = 1.34
freq = 100:1:1000000;
H3_frd = frd(H3,freq)
[H3_Resp, H3_Freq] = frdata(H3_frd, 'v')
MagH3_dB = 20*log10(abs(H3_Resp))
semilogx(H3_Freq, MagH3_dB)
figure(1)
grid on
title('Magnitude of response of H(dB) -> Inductor - High Pass (a)', 'fontsize', 16)
xlabel('Frequency, r/s', 'fontsize', 12)
ylabel('H, dB', 'fontsize', 12)

%% Inductor - High Pass (b) 
s = tf('s');
H4 = ((s^2)/(s^2+1200*s+(2*10^7)));
zpk(H4)
zeroes = zero(H4)
poles = pole(H4)

% Values
% wn = 4472.14
% z = 0.134
freq = 100:1:1000000;
H4_frd = frd(H4, freq)
[H4_Resp, H4_Freq] = frdata(H4_frd, 'v')
MagH4_dB = 20*log10(abs(H4_Resp))
semilogx(H4_Freq, MagH4_dB)
figure(1)
grid on
title('Magnitude of response of H(dB) -> Inductor - High Pass (b)', 'fontsize', 16)
xlabel('Frequency, r/s','fontsize', 12)
ylabel('H, dB', 'fontsize', 12)