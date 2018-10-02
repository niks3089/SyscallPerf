#include <unistd.h>
#include <common.h>

int main(int argc, char **argv)
{
    uint64_t start_tick, end_tick, cpu_cycles;
    uint64_t loop_counter = LOOP_DEFAULT;

    common_setup(argc, argv);

    start_tick = rdtsc();
    while (loop_counter--) {
        /* Run the syscall */
        getpid();
    }
    end_tick = rdtsc();
    common_analysis(start_tick, end_tick);
}
