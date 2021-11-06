 function rotatedImage = rotation(image,angle)
 
     [rr,cc]=size(image);
     [X,Y]=meshgrid(1:cc,1:rr); %describes the domain of the image
     
     %change image's center to perform the rotation
     Xc=X-floor(cc/2);
     Yc=Y-floor(rr/2);
     
     %inverse function and repositioning the rotation center
     Xt = (Xc*cos(-angle)-Yc*sin(-angle))+floor(cc/2);
     Yt =(Xc*cos(-angle)+Yc*sin(-angle))+floor(rr/2);
     
     %linear interpolation
     rotatedImage = griddata(X,Y,double(image),Xt,Yt,'linear');
     
end