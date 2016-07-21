% Read command line arguments
arg_list = argv ();
printf ("Arguments : ")
for i = 1:nargin
  printf (" %s", arg_list{i});
endfor
printf ("\n");

if nargin<1
	printf("Usage : docker run -it tp81/octave-countnuclei2D imagefile.tif")
end

imagename = arg_list{1};

% Load image processing package
pkg load image

% Read in the image
I = imread(imagename);

% Background subtract
I1 = I-imopen(I,strel('diamond',50));

% Otsu threshold (default)
I1b = im2bw(I1,graythresh(I1));

% Region properties
propnames = {'Area','EquivDiameter','EulerNumber','Extent','Perimeter','FilledArea','MaxIntensity','MinIntensity','MeanIntensity','Orientation','Eccentricity','MajorAxisLength','MinorAxisLength'};
props = regionprops(I1b,propnames);

% Build table
tb=[]; for p=propnames; tb=[tb cat(1,props.(p{1}))]; end

% Save mask
imwrite(I1b,[imagename '-MATLAB-mask.tif']);

% Output table
fd = fopen([imagename '-MATLAB-analysis.csv'],'w');
fprintf(fd,'%s,',propnames{1:end-1}); fprintf(fd,'%s\n',propnames{end});
fprintf(fd,[repmat('%f,',1,length(propnames)-1) '%f\n'],tb')
fclose(fd);

printf("Done!\n")

 