clc;clear;close all;

vid=VideoReader('lf.mp4');

count = 0;

while hasFrame(vid)

    readFrame(vid);

    count = count+1;

 end

 disp(count);

BG=imread('img96.jpg');

 BG = rgb2gray(BG);

 figure,imshow(BG);

 %vid=VideoReader('lf.mp4');

 i=0; %for img

 f=0; %for flag

 while(true)

    i=i+1;

    if(i==count)

        break;

    end

    str=strcat('img',num2str(i));

    str=strcat(str,'.jpg');

    img=imread(str);

    I0=img;

    imshow(I0);

    img=rgb2gray(img);

    img=abs(BG-img);

    %my_image = im2double(img);

    %my_image = my_image(:,:,1);

    image_thresholded=zeros(size(img));

    image_thresholded(img>0.1)=255;

    I = image_thresholded;

    I = imfill(I,'holes');

    I = imfill(I);

    Iy=(I0(:,:,1)/2+I0(:,:,2)/2-I0(:,:,3))>70;

    I=I.*Iy; %binary multiplication(pixel by pixel)

    imshow(I);

    [x,y]=size(I);

    disp(x);

    sum=0;

    c=0;

    for m=1:1:x

        for n=1:1:y

            if (I(m,n)==255);

                sum=sum+m;

                c=c+1;

            end

        end

    end

    %disp(sum);

    %disp(c);

    sum=sum/c;

    disp(sum);

    if(sum>700)

        f=1;

        disp('lemon fall');

        break;

    end

 end

 if f==0

     disp('lemon not fall');

 end