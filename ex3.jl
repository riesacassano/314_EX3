# Problem 1, part A

using PyPlot;
el_capitan = imread("el-capitan.png");
imshow(el_capitan);

##
"""
extract_channels(filename)

This function takes an image file name ("filename"), loads it, displays it,
    extracts the red, blue, and green channels into separate variables and returns those variables.

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

## Problem 1, part B
"""
shift_red_up(filename, N)

This function takes an image file name ("filename") and number ("N").
    Shifts red channel on image circularly up by N pixels.
    Displays original image and shifted image side by side.
    Returns shifted image as an array.

= Args:

- arg1 (str): filename of image
- arg2 (int): number of pixels to shift by

= Returns:

- shifted_image (Array{Float32,3}): image shifted by specified number of pixels

"""
function shift_red_up(filename, N)
    original = imread(filename);
    R_channel = vcat(original[N+1:end,:,1], original[1:N,:,1]);
    shifted_image = cat(R_channel, original[:,:,2:end], dims = 3)

# display original and shifted image
    clf()
    subplot(1,2,1);
    imshow(original);
    title("original");
    axis("off");
    subplot(1,2,2);
    imshow(shifted_image);
    title("shifted");
    axis("off");

    return shifted_image
end

shift_red_up("el-capitan.png", 180);
