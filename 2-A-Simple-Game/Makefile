#
# Makefile for the Joy of ATS Part 2
#

# Coompilers
PATSCC = ${PATSHOME}/bin/patscc
PATSOPT = ${PATSHOME}/bin/pastopt

INCLUDE = -DATS_MEMALLOC_LIBC -latslib

# Routines for the two programs
hello: hello.dats
	$(PATSCC) -o $@ $<

guess: guess.dats
	$(PATSCC) $(INCLUDE) -o $@ $<

# Clean routines
clean:: ; @rm -f *~
clean:: ; @rm -f *_?ats.c
clean:: ; @rm -f *_?ats.o
clean:: ; @rm -f hello
clean:: ; @rm -f guess
