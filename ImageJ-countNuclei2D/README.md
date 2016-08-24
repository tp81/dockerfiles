This small container is meant as a proof-of-concept for a simple object counter for 2D single channel images. It includes the following steps (see macro).

  1. Background subtraction (r=50px)
  2. Automatic Otsu thresholding 
  3. Mask saving as TIFF
  4. Results saving as ROI collection
  5. Results saving as comma-separated values (CSV)
  
### Usage

`docker run --rm tp81/imagej-countnuclei2d IMAGE_FILENAME`

This will spawn a new container, run ImageJ and call the macro `CountFluoNuclei2D.ijm`.

### Limitations

This is intended to be a proof-of-concept and as such has a few limitations:

 - it assumes the image is single channel, fluorescent (black background), single plane
 - the background subtraction is fixed at 50px
 - the minimum nuclei cutoff is fixed at 10px
 
 
