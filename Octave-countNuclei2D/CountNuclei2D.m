function CountNuclei2D(imagename)

if nargin<1
	printf('Usage : docker run -it -v "DIRECTORYWITHIMAGES:/data" tp81/octave-countnuclei2D /data/imagefile.tif')
end

% Load image processing package if in Octave
if exist('pkg')
    SW='OCTAVE';
    pkg load image
else
    SW='MATLAB';
end

% Read in the image
I = imread(imagename);

% Background subtract
I1 = I-imopen(I,strel('diamond',50));

% Otsu threshold (default)
I1b = im2bw(I1,graythresh(I1));

% Region properties
propnames = {'Area','EquivDiameter','EulerNumber','Extent','Perimeter','FilledArea','MaxIntensity','MinIntensity','MeanIntensity','Orientation','Eccentricity','MajorAxisLength','MinorAxisLength'};
props = regionprops(I1b,I1,propnames);

% Build table
tb=[]; for p=propnames; tb=[tb cat(1,props.(p{1}))]; end

% Save mask
imwrite(I1b,[imagename '-' SW '-mask.tif']);

% Output table
fd = fopen([imagename '-' SW '-analysis.csv'],'w');
fprintf(fd,'%s,',propnames{1:end-1}); fprintf(fd,'%s\n',propnames{end});
fprintf(fd,[repmat('%f,',1,length(propnames)-1) '%f\n'],tb');
fclose(fd);

fprintf('Done!\n')

 
