#include "param.h"

// This is mainly defined for MLFQ Scheduling
struct ptstat
{
	int inuse[NPROC];	// To store whether a particular process is in use or not; --> 1 if in use and 0 if not
	int pid[NPROC];		// Just as it seems
	int priority[NPROC]; // Priority level of each process; -- Confined to 0-4 (Since our implementation deals with only 5 ques);
	int ticks[NPROC][5];	// To save the ticks of process in each queue
};