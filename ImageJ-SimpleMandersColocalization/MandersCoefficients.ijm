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

open(infile)
if (Stack.isHyperstack) {
	Stack.setChannel(ch1);
} else {
	setSlice(ch1);
};

setAutoThreshold("Triangle dark");

