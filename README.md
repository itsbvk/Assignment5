# Assignment 5

## Task 1:

#### Part a: 
`Add Waitx System Call`:
### Question - 1(a): 
1. As a part of this task, you're expected to extend the current proc structure and add new fields ctime, etime and rtime for creation time, end-time and total time respectively of a process. 
2. When a new process gets created the kernel code should update the process creation time and the run-time should get updated after every clock tick for the process. 
4. To extract this information from the kernel add a new system call which extends wait. The new call will be: 

    `int waitx(int* wtime, int* rtime)`
5. The two arguments are pointers to integers to which waitx will assign the total number of clock ticks during which process was waiting and total number of clock ticks when the process was running. 
6. The return values for waitx should be same as that of wait system-call. Create a test program which utilizes the waitx system call by creating a ‘time’ like command for the same.


   **Note: This can be used to implement your scheduler functions.

#### How is waitx implemented in this repository?

1. As mentioned the creation time, run time and end time have been added as fields to the proc structure.

2. Run time is extracted from trap function in `trap.c` and end time is updated everytime the process calls the exit function. i.e. end time is updated at the exit()
  function in `proc.c`
  
3. `Wait time` is calculated by the formulae:
    `wait time = end time - start time - run time`
    
4. Note that the I/O time is included in waiting time in this particular implementation.


5. To implement it as a system call, the following files were editted:


    * sysproc.c
    * user.h
    * defs.h
    * syscall.c
    * syscall.h
   
   
6. A file `time.c` is written to check the waitx file.

7. To test the function, run `time <command that is defined in xv6>` . 

    You will get the output of the command and the run and wait time of the command process.

#### Part b: `Add getpinfo System Call`:

### Question - 1(b): 

1. Create a new system call for this part: `​int getpinfo(struct proc_stat *)​`. 


2. This routine returns some basic information about each process: its process ID, total run time, how many times it has been chosen to run, which queue it is currently on 0, 1, 2, 3 or 4 (check Task 2 part c) and ticks received in each queue.


3. To do this, you will need to create the ​proc_stat​ struct :-

            struct proc_stat {
            
            int pid; // PID of each process
            
            float runtime; // Use suitable unit of time
            
            int num_run; // number of time the process is executed
            
            int current_queue; // current assigned queue
            
            int ticks[5]; // number of ticks each process has received at each of the 5 priority
            
            queue 
            
            };



#### How is getpinfo implemented in this repository?

1. As stated above, the struct defined above is defined in the file `proc_stat.h`

2. The same files that have been changed for waitx syscall have been changed here.

3. Run the ps command which has also been implemented as syscall to know the various pid's in the ptable

   at a given point and run the command `getpinfo <pid>`. Error handling has been done for this syscall.
   
   

## Scheduling Policies:

###  FCFS:

  1. The major change for FCFS Scheduler implementation is to remove yielding in trap.c. i.e.  

     we do not allow the CPU to pre-empt any process that is running.

  2. To run the xv6 processess on FCFS initiate xv6 with `make clean SCHEDULER=FCFS`

  3. FCFS is implemented by traversing the ptable and finding the process with least 

     creation time and running it without pre-emption.


### Priority Based Scheduling:

  1. Here we do let the cpu to pre-empt the processess.

  2. The process with the least priority number is the process with the highest priority. 

     i.e. a process with priority say, 0 is given higher preference than the process with 

     any priority > 0.

  3. The default prioroty of any process in the implementation is set to 60.

  4. To change the priority use the command `chprty <pid> <priority>` . Use ps command to help you get 

     the info for various processess that you want to change the priority.

  5. Make sure that the priority value is in the range [0,100] while changing the priority of a

     particular process.

  6. Priorities of Processess with pid 1, 2 are not allowed to be changed , because they correspond to 

     init and shell processess.
     
  7. To run the xv6 processess on FCFS initiate xv6 with `make clean SCHEDULER=PBS`


