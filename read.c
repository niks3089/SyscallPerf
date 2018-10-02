#include <unistd.h>
#include <common.h>

int main(int argc, char **argv)
{
    uint64_t start_tick, end_tick, cpu_cycles;
    uint64_t loop_counter = LOOP_DEFAULT;
    int fd;
    char buf[512];

    common_setup(argc, argv);
	memset(buf, 0, SIZE);
	fd = open("/dev/sdb", O_RDWR | O_CREAT, 0700);
	lseek(fd, 0, SEEK_SET);

    start_tick = rdtsc();
    while (loop_counter--) {
        /* Run the syscall */
        if (read(fd, buf, 512) == 1) break; 
    }
    end_tick = rdtsc();
    common_analysis(start_tick, end_tick);
}
