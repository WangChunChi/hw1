# Your Name <span style="color:red">(yout cs id)</span>

# Project 1 / Image Filtering and Hybrid Images

## Overview
The project is related to 1. spatial filtering 2. 2-D convolution 3. image padding In this project we used a Gaussian shaped filter as a mask in spatial domain. Before filtering, using 2-D convolution to compute the result. Otherwise, to avoid wrong calaulation on the edge pixel of input image, padding the original image with 0.


## Implementation
1.首先我們須將原本的圖片，擴增的大小為(filter size-1)/2，避免小數點的產生將其結果取floor。
convolution的部分，有gray scale、color image(RGB)，不過gray scale只需做一次與 filter convolution，但是color image裏頭的RGB需要分別convolution。
for迴圈第一層是我們所需的執行次數，底下兩層則處理convolution。


Code highlights

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

## Installation
* Other required packages.
NO!
* How to compile from source?
Run  proj1.m

### Results

<table border=1>
<tr>
<td>
<img src="placeholder.jpg" width="24%"/>
<img src="placeholder.jpg"  width="24%"/>
<img src="placeholder.jpg" width="24%"/>
<img src="placeholder.jpg" width="24%"/>
</td>
</tr>

<tr>
<td>
<img src="placeholder.jpg" width="24%"/>
<img src="placeholder.jpg"  width="24%"/>
<img src="placeholder.jpg" width="24%"/>
<img src="placeholder.jpg" width="24%"/>
</td>
</tr>

</table>
