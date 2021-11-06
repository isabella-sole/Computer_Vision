 function saltpepper_image = saltpepper_noise(image,noise_dens)
 
    %here we use maskinkg technique
    IN=double(image);
    [rr,cc]=size(IN);
    maxv=max(max(IN)); 
    indices=full(sprand(rr,cc,noise_dens));%0.2 is the noise density
    mask1=indices>0 & indices<0.5; 
    mask2=indices>=0.5;
    saltpepper_image= IN.*(~mask1) ; 
    saltpepper_image=saltpepper_image.*(~mask2)+maxv*mask2; 
 
end