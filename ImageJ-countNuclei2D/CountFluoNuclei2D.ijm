arg = getArgument();
print("Nuclear count with arguments:");
print(arg);

open(arg);
run("Subtract Background...", "rolling=50");
setAutoThreshold("Otsu dark");
run("Set Measurements...", "area mean standard modal min centroid center perimeter bounding fit shape feret's integrated median skewness kurtosis area_fraction stack limit redirect=None decimal=5");
run("Analyze Particles...", "size=10-Infinity display exclude include add");
roiManager("Combine");
run("Create Mask");
saveAs("TIFF",arg+"-mask.tif");
saveAs("Results", arg+"-Results.csv");
roiManager("Save", arg+"-RoiSet.zip");
print(nResults);

eval("script", "System.exit(0);");