 function wavedImage = waving1(image)
 
     [rr,cc]=size(image);
     [X,Y]=meshgrid(1:cc,1:rr); %describes the domain of the image
     
     load data
     
     %inverse function
     Xt = X-XD;
     Yt = Y-YD;
     
     %linear interpolation
     wavedImage = griddata(X,Y,double(image),Xt,Yt,'linear');
     
end
