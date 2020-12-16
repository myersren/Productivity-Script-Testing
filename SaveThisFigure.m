function SaveThisFigure(FigureSaveDir,FigureName)

% SaveThisFigure Saves the current figure in the specified path and formats
%                the size of the figure to fit Rosa standards
%
%       FigureSaveDir - directory where the figure will be saved
%       FigureName - name of figure used to identify specific matlab plot
% 
%       Additional Required Scripts/Functions:
%       -   No additional scripts
%
%       Original script by Dr. Meghan Pryor, Ph.D., 201612
%       © 2017 Rosa & Co. LLC
%
%   See also SET, PRINT

%% Collect figure info
figInfo = get(gcf,'children');
plothandle = get(gca,'children');
%% Save Figure
if length(figInfo) == 1 || length(figInfo) == 2 % Single plot or double plot
    set(gcf,'PaperUnits','inches','PaperPosition',[0 0 7.2 7/2])
    print([FigureSaveDir FigureName],'-dpng','-r125')
else % Multiplot figure
    columnCount = 1;
    rowCount = 1;
    yPosition = figInfo(1).Position(2);
    for i = 2:length(figInfo)
        if yPosition ~= figInfo(i).Position(2);
            rowCount = rowCount + 1;
            yPosition = figInfo(i).Position(2);
        else
            columnCount = columnCount + 1;
        end 
    end
    % Set saved figure dimensions based on number of subplots
    % These are a best guess, may need to be tweaked based on what you need
    % [x-position y-position x-length y-length]
    print([FigureSaveDir FigureName],'-dpng','-r125')
    if columnCount == rowCount
        set(gcf,'PaperUnits','inches','PaperPosition',[0 0 8 8])
        print([FigureSaveDir FigureName],'-dpng','-r125')
    elseif columnCount > rowCount
        set(gcf,'PaperUnits','inches','PaperPosition',[0 0 8 6])
        print([FigureSaveDir FigureName],'-dpng','-r125')
    elseif columnCount < rowCount
        set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 8])
        print([FigureSaveDir FigureName],'-dpng','-r125')
    end
end