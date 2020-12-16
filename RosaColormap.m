function colorinfo = RosaColormap(numlines)
% RosaColormap  creates an RGB matrix of specified size (numlines)
%               that is based on a specific set of colors set by rgbmat.
%
%       Original script by Dr. Meghan Pryor, Ph.D.
%
%       See also COLORMAP

rgbmat=[0/255 102/255 204/255  % Blue
        237/255 0/255 112/255  % Pink
        249/255 157/255 35/255  % Orange
        107/255 157/255 4/255 % Green
        ];
        %216/255 211/255 226/255 % Purple
[m n] = size(rgbmat);
% if m > numlines
%     numlines = m;
% end
x = linspace(0,255,m);
Rosa = interp1(x/255,rgbmat,linspace(0,1,numlines));
I = linspace(0,1,numlines);
%imagesc(I(ones(1,10),:)');
colorinfo=colormap(Rosa);