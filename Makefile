SHELL=/bin/sh

#VK LIB= /nco/sib/wx12kk/lib/libg2tmpl.a
LIB="../../libg2tmpl.a"
#VK INCMOD=/nco/sib/wx12kk/lib/incmod/g2tmpl
INCMOD="../../incmod/g2tmpl"
FC=ifort
CC=icc
FFLAGS=-O3 -free -g -module $(INCMOD)
CFLAGS=-O3 -g  -DUNDERSCORE
AR      = ar
ARFLAGS =  

$(LIB): $(LIB)(process_4dot2.o) $(LIB)(grib2_all_tables_module.o) $(LIB)(gdtsec3.o)

$(LIB)(process_4dot2.o):	process_4dot2.c
	$(CC) -O3 -c $(CFLAGS) $<
	$(AR) $(ARFLAGS) -ruv $@ $*.o
	rm -f $*.o

.f.a:
	$(FC) -c $(FFLAGS) $<
	$(AR) $(ARFLAGS) -ruv $@ $*.o 
	rm -f $*.o

clean:
	rm -f process_4dot2.o

realclean:	clean
	rm -f test_* core
