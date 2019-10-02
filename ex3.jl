using PyPlot;
el_capitan = imread("el-capitan.png");
imshow(el_capitan);

##
"""
extract_channels(filename)

This function takes an image file name ("filename"), loads it, displays it, extracts the red, blue, and green channels into separate variables and returns those variables.

= Args:

- arg1 (str): filename of image

= Returns:

- R (Array{Float32,2}): matrix of values representing red channel of original image
- G (Array{Float32,2}): matrix of values representing green channel of original image
- B (Array{Float32,2}): matrix of values representing blue channel of original image
"""
function extract_channels(filename)
    image = imread(filename)
    imshow(image)
    R = image[:,:,1];
    G = image[:,:,2];
    B = image[:,:,3];
    return R, G, B
end

println("Reset with git reset --mixed")
(R, G, B) = extract_channels("el-capitan.png")
image2 = zeros(360,640,3);
image2[:,:,1] = G;
image2[:,:,2] = B;
image2[:,:,3] = R;
##
clf()
subplot(1,2,1);
imshow(el_capitan);
title("original");
axis("off");
subplot(1,2,2);
imshow(image2);
title("RGB -> GBR");
axis("off");
