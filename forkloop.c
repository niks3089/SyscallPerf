#define _GNU_SOURCE
#include <stdio.h>
#include <sched.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdint.h>
#include<sys/wait.h>

#define NUM_CHILD_PROCESS 1000000

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
    int i;
    pid_t pids[NUM_CHILD_PROCESS];
	int status;
	pid_t pid;

    if (argc == 2) {
        set_cpu(atoi(argv[1]));
    }
    printf("Starting Forking\n");
    for(i = 0; i < NUM_CHILD_PROCESS; i++)
    {
		if ((pids[i] = fork()) < 0) {
			perror("fork");
			abort();
		} else if (pids[i] == 0) {
			exit(0);
		} else {
            pid = wait(&status);
        }
    }
}
