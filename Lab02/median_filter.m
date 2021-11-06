function medfil_image = median_filter(image, fsize)

    medfil_image = medfilt2(image, [fsize, fsize]);

end