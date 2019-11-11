// Per-CPU state
struct cpu {
  uchar apicid;                // Local APIC ID
  struct context *scheduler;   // swtch() here to enter scheduler
  struct taskstate ts;         // Used by x86 to find stack for interrupt
  struct segdesc gdt[NSEGS];   // x86 global descriptor table
  volatile uint started;       // Has the CPU started?
  int ncli;                    // Depth of pushcli nesting.
  int intena;                  // Were interrupts enabled before pushcli?
  struct proc *proc;           // The process running on this cpu or null
};

extern struct cpu cpus[NCPU];
extern int ncpu;

//PAGEBREAK: 17
// Saved registers for kernel context switches.
// Don't need to save all the segment registers (%cs, etc),
// because they are constant across kernel contexts.
// Don't need to save %eax, %ecx, %edx, because the
// x86 convention is that the caller has saved them.
// Contexts are stored at the bottom of the stack they
// describe; the stack pointer is the address of the context.
// The layout of the context matches the layout of the stack in swtch.S
// at the "Switch stacks" comment. Switch doesn't save eip explicitly,
// but it is on the stack and allocproc() manipulates it.
struct context {
  uint edi;
  uint esi;
  uint ebx;
  uint ebp;
  uint eip;
};

enum procstate { UNUSED, EMBRYO, SLEEPING, RUNNABLE, RUNNING, ZOMBIE };

// Per-process state
struct proc {
  uint sz;                     // Size of process memory (bytes)
  pde_t* pgdir;                // Page table
  char *kstack;                // Bottom of kernel stack for this process
  enum procstate state;        // Process state
  int pid;                     // Process ID
  struct proc *parent;         // Parent process
  struct trapframe *tf;        // Trap frame for current syscall
  struct context *context;     // swtch() here to run process
  void *chan;                  // If non-zero, sleeping on chan
  int killed;                  // If non-zero, have been killed
  struct file *ofile[NOFILE];  // Open files
  struct inode *cwd;           // Current directory
  char name[16];               // Process name (debugging)
   int start_time;              // Process Start Time - waitx
   int end_time;                // Process End Time - waitx
   int run_time;                // Process Running Time - waitx
//   int io_time;                  // Process I/O Time - waitx
  int priority;                 // Priority for Priority Based Scheduler
  int last_response_time;       //For priority based scheduler -- Useful for implementing round robing abong processes of same priority;
  int qetime;
  // #ifdef MLFQ
  int cqueue;                    // Values ranging from 0 - 4 and is equal to -1 if queue is not assigned to the process;
  int qticks[5];                 // Stores the Number of ticks in each of the queues -->
  int noe;                      // Number of times the process has been executed.
  int wait_time;
  int entrance_time;
  // #endif‰
};

//BVK Commit -- IIIT Hyderabad Assignment 5 
#ifdef MLFQ
extern struct proc* q0[NPROC];      // Remember: NPROC is 64 as defined in 'param.h'
extern struct proc* q1[NPROC];
extern struct proc* q2[NPROC];
extern struct proc* q3[NPROC];
extern struct proc* q4[NPROC];

extern int pi0;
extern int pi1;
extern int pi2;
extern int pi3;
extern int pi4;

extern struct ptstat ptstat_var;
#endif
// Process memory is laid out contiguously, low addresses first:
//   text
//   original data and bss
//   fixed-size stack
//   expandable heap

void updateStats();