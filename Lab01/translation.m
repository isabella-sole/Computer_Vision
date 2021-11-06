 function translatedImage = translation(image,Xtransl,Ytransl)
 
     [rr,cc]=size(image);
     [X,Y]=meshgrid(1:cc,1:rr); %describes the domain of the image
     
     %inverse function
     Xt = X-Xtransl;
     Yt = Y-Ytransl;
     
     %linear interpolation
     translatedImage = griddata(X,Y,double(image),Xt,Yt,'linear');
     
end

