function [fitresult, gof] = createFit(logfreq, GAINdB)
%CREATEFIT(LOGFREQ,GAINDB)
%  Create a fit.
%
%  Data for 'Linear Fit' fit:
%      X Input : logfreq
%      Y Output: GAINdB
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.
%% Fit: 'Linear Fit'.
[xData, yData] = prepareCurveData( logfreq, GAINdB );

% Set up fittype and options.
ft = fittype( 'poly1' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46] );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Linear Fit' );
h = plot( fitresult, xData, yData, excludedPoints );
legend( h, 'GAINdB vs. logfreq', 'Excluded GAINdB vs. logfreq', 'Linear Fit', 'Location', 'NorthEast' );
% Label axes
xlabel logfreq
ylabel GAINdB
grid on


