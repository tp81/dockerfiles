// Parse the parameters
st = getArgument();
args = split(st,";")

if (args.length<3) {
	print("Arguments : <firstFile>;<firstChannel>;<secondFile>;<secondChannel>");
}

file1 = args[0];
ch1 = parseInt(args[1]);
file2 = args[2];
ch2 = parseInt(args[3]);

open(file1);
t = getTitle();
if (Stack.isHyperstack || is("composite")) {
	run("Duplicate...", "duplicate channels="+ch1);
} else {
	run("Duplicate...", "duplicate range="+ch1);
};
setAutoThreshold("Triangle dark");
setOption("BlackBackground", false);
run("Convert to Mask","method=Triangle");
close(t);
rename("CH1");
getRawStatistics(nPixels, mean);
print(mean);
A = nPixels * mean;

open(file2);
t = getTitle();
if (Stack.isHyperstack || is("composite")) {
	run("Duplicate...", "duplicate channels="+ch2);
} else {
	run("Duplicate...", "duplicate range="+ch2);
};
setAutoThreshold("Triangle dark");
setOption("BlackBackground", false);
run("Convert to Mask","method=Triangle");
close(t);
rename("CH2");
getRawStatistics(nPixels, mean);
B = nPixels * mean;

imageCalculator("AND create", "CH1","CH2");
getRawStatistics(nPixels, mean);
AnB = nPixels * mean;

M1 = AnB / A;
M2 = AnB / B;

print("{\n    file1:"+file1+",\n    file2:"+file2+",\n    ch1:"+ch1+",\n    ch2:"+ch2+",\n    A:"+A+",\n    B:"+B+",\n    AnB:"+AnB+",\n    M1:"+M1+",\n    M2:"+M2+"\n}");

