 function gaussian_image = gaussian_noise(image,std_dev)
 
    gaussian_image=double(image)+std_dev*randn(size(image));%20 is the standard deviation

      
end