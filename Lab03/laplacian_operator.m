function Z = laplacian_operator(st_dev)

    %Standard deviation is related to spatial support NxN: N is the smallest odd integer greater than or equal to 6s
    sp=ceil(st_dev * 3); % Half length of kernel should be 3 times the standard deviation
    [X,Y]=meshgrid(-sp:sp); %sample the domain 
    Z=(1/(2*pi*st_dev^2))*((X.^2+Y.^2 -2*st_dev^2)/st_dev^4).*exp(-(X.^2+Y.^2)/(2*st_dev^2)); %laplacian gaussian formula 

    %this works on an image as a BAND PASS FILTER because it removes low and high frequency's values in order to remove noise 

end
