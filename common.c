#include <common.h>

int common_setup(int argc, char **argv)
{
    int cpu = -1;
    cpu_set_t  cpuset;

    /* Parse arguments */
    if (argc == 2) {
        cpu = strtol(argv[1], NULL, 10);
    }

    if (cpu >= 0 ) {
        CPU_ZERO(&cpuset);
        CPU_SET(cpu, &cpuset);
        if (sched_setaffinity(getpid(), sizeof(cpu_set_t), &cpuset) != 0) {
            printf("Faild to set CPU affinity\n");
            exit(1);
        }
    }
}

void common_analysis(uint64_t start_tick, uint64_t end_tick)
{
   uint64_t  cpu_cycles = end_tick - start_tick;
    printf(" Number of CPU cycles: %"PRIu64" \n", cpu_cycles);
}
