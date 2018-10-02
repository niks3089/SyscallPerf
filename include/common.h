#ifndef COMMON_H
#define COMMON_H

#define _GNU_SOURCE
#include <stdarg.h>
#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <sched.h>
#include <stdlib.h>
#include <unistd.h>

#define LOOP_DEFAULT 10000000

static __inline__ uint64_t rdtsc(void)
{
	uint32_t hi, lo;
	__asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));
	return ( (uint64_t)lo)|( ((uint64_t)hi)<<32 );
}

int common_setup(int argc, char **argv);
void common_analysis(uint64_t start_tick, uint64_t end_tick);
#endif
