#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}
//BVK assignment 5 Q1
//Adding the sys-waitx call for loading parameters and calling waitx
//Just for reference:
//All about argptr that is used in the below function: Defined in syscall.h
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size n bytes.  Check that the pointer
// lies within the process address space.
//function syntax: int argptr(int n, char **pp, int size);
int
sys_waitx(void)
{

  int *run_time;       //For run time of the process
  int *wait_time;       //For wait time of the process

  if(argptr(0, (char**)&wait_time, sizeof(int)) < 0)
    return -1;

  if(argptr(1, (char**)&run_time, sizeof(int)) < 0)
    return -1;

  return waitx(wait_time, run_time);

}

int
sys_ps(void)
{
  ps();
  return 0;
}

int
sys_getpinfo(void)
{
  int pid;
  struct pstat *Pstat;
  if(argint(0,&pid) < 0 ){
    return -1;
  }

  if(argptr(1, (void*)&Pstat, sizeof(struct pstat *)) < 0){
    return -1;
  }

  return getpinfo(pid,Pstat);
}
int
sys_chprty(void)
{
  int pid, priority;
  if(argint(0,&pid) < 0){
    return -1;
  }
  if(argint(1,&priority) < 0){
    return -1;
  }
  return chprty(pid,priority);

}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}
