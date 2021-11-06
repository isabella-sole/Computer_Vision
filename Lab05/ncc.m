% NCC
function [xoffSet, yoffSet, xmax, ymax] = ncc(Img, Window, n)
    t = cputime;
    

    c = normxcorr2(Window, Img); % Applaying NNC 
%   imagesc(c), colormap gray, title(['NNC with template of size ' num2str(n)])

    % Find the maximum value:
    [ypeak, xpeak] = find(c==max(c(:)));
    yoffSet = ypeak - size(Window, 1);
    xoffSet = xpeak - size(Window, 2);
    
    ymax = ypeak - size(Window, 1)/2;
    xmax = xpeak - size(Window, 2)/2;
    
    e = cputime - t; % Calculates computational time
    disp(['Computational time is ' num2str(e) ' s']);
end