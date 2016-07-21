FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y octave
RUN apt-get install -y graphicsmagick liboctave-dev make dialog less

RUN echo "pkg install -forge image" | octave

RUN echo "octave -qf CountNuclei2D.m \$*" > go.sh

COPY CountNuclei2D.m .

ENTRYPOINT ["bash","-x","go.sh"]

