


function [pt p thres mx mn]=AutoThreshold(picpath,threshold)
p=dicomread(picpath);
pt=p(:,:,1);
h=fspecial('gaussian',3,std(double(pt(:))));
pt=imfilter(pt,h,'replicate');
mn=min(pt(:));
bwp=sobel(pt);

   mx=max(bwp(:));
   thres=mx+mn;

if nargin==1
    pt=pt<thres;
else
    pt=pt<threshold;
end
pt=medfilt2(pt);
end