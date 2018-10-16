#define _GNU_SOURCE
#include <stdio.h>
#include <sched.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdint.h>

void set_cpu(int cpu)
{
    cpu_set_t  cpuset;

     if (cpu >= 0) {
        CPU_ZERO(&cpuset);
        CPU_SET(cpu, &cpuset);
        if (sched_setaffinity(getpid(), sizeof(cpu_set_t), &cpuset) != 0) {
            printf("Faild to set CPU affinity\n");
            exit(1);
        } else {
            printf("Set cpu affinity on %d cpu\n", cpu);
        }
    }
}

int main(int argc, char **argv)
{
    if (argc == 2) {
        set_cpu(atoi(argv[1]));
    }
    printf("Starting busy loop\n");
    while (1);
}
