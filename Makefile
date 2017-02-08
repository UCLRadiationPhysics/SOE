Target  = image.exe
Objects = GammaEvent.o Vec3.o VoxelParam.o IntersectionParam.o

ROOTFLAGS = $(shell root-config --cflags) -O3
ROOTLIBS  = $(shell root-config --libs)

all:$(Target)

image.exe: image_reconstruction.cc $(Objects)
	g++ -o $@ image_reconstruction.cc $(Objects) $(ROOTFLAGS) $(ROOTLIBS)

GammaEvent.o: GammaEvent.cc GammaEvent.hh
	g++ -o $@ GammaEvent.cc -c $(ROOTFLAGS)

C3Vector.o: Vec3.cc Vec3.h
	g++ -o $@ Vec3.cc -c $(ROOTFLAGS)

VoxelParam.o: VoxelParam.cc VoxelParam.hh
	g++ -o $@ VoxelParam.cc -c $(ROOTFLAGS)

IntersectionParam.o: IntersectionParam.cc IntersectionParam.hh
	g++ -o $@ IntersectionParam.cc -c $(ROOTFLAGS)

clean:   
	rm ./*~ ./*.o ./*.exe




