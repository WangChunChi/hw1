function output = my_imfilter(image, filter)
% This function is intended to behave like the built in function imfilter()
% See 'help imfilter' or 'help conv2'. While terms like "filtering" and
% "convolution" might be used interchangeably, and they are indeed nearly
% the same thing, there is a difference:
% from 'help filter2'
%    2-D correlation is related to 2-D convolution by a 180 degree rotation
%    of the filter matrix.

% Your function should work for color images. Simply filter each color
% channel independently.

% Your function should work for filters of any width and height
% combination, as long as the width and height are odd (e.g. 1, 7, 9). This
% restriction makes it unambigious which pixel in the filter is the center
% pixel.

% Boundary handling can be tricky. The filter can't be centered on pixels
% at the image boundary without parts of the filter being out of bounds. If
% you look at 'help conv2' and 'help imfilter' you see that they have
% several options to deal with boundaries. You should simply recreate the
% default behavior of imfilter -- pad the input image with zeros, and
% return a filtered image which matches the input resolution. A better
% approach is to mirror the image content over the boundaries for padding.

% % Uncomment if you want to simply call imfilter so you can see the desired
% % behavior. When you write your actual solution, you can't use imfilter,
% % filter2, conv2, etc. Simply loop over all the pixels and do the actual
% % computation. It might be slow.
% output = imfilter(image, filter);

%% my coding

% Get the row and column's size of image
[intput_row, input_col] = size(image(:,:,1));
[fir_row, fir_col] = size(filter);
color_channel=size(image,3);

% Pad zeroing 
pad_row=floor((fir_row-1)/2);
pad_col=floor((fir_col-1)/2);
pad_image=padarray(image,[pad_row pad_col]);

%output initialization
output=zeros(input_row,input_col,color_channel);

%do convolution with filter
for k=1:color_channel
    for i=(pad_row+1):(pad_row+im_row)
        for j=(pad_col+1):(pad_col+im_col)
            output(i-pad_row,j-pad_col,k)= sum(sum(pad_image(i-pad_row:i+pad_row,j-pad_col:j+pad_col,k).*filter));
        end
    end
end

end
