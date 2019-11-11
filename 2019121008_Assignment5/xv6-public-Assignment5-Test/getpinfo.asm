
_getpinfo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "proc_stat.h"
// #include "defs.h"
#include "user.h"

int main(int argc , char* argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 40             	sub    $0x40,%esp
  if(argc != 2){
   9:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
   d:	74 19                	je     28 <main+0x28>
    printf(1,"Usage: getpinfo <pid>");
   f:	c7 44 24 04 34 06 00 	movl   $0x634,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 7d 03 00 00       	call   3a0 <printf>
    exit();
  23:	e8 28 02 00 00       	call   250 <exit>
    return 0;
  }
  int r;
  int pid = atoi(argv[1]);
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	8b 40 04             	mov    0x4(%eax),%eax
  2e:	89 04 24             	mov    %eax,(%esp)
  31:	e8 be 01 00 00       	call   1f4 <atoi>
  struct pstat Pstat;
  if((r = getpinfo(pid, &Pstat)) < 0)
  36:	8d 54 24 1c          	lea    0x1c(%esp),%edx
  3a:	89 54 24 04          	mov    %edx,0x4(%esp)
  3e:	89 04 24             	mov    %eax,(%esp)
  41:	e8 c2 02 00 00       	call   308 <getpinfo>
  46:	85 c0                	test   %eax,%eax
  48:	78 29                	js     73 <main+0x73>
  {
    printf(1,"Error!\n");
    exit();
    return 0;
  }
  printf(1,"Run time of process with pid %d is %d\n",Pstat.pid,Pstat.run_time);
  4a:	8b 44 24 20          	mov    0x20(%esp),%eax
  4e:	89 44 24 0c          	mov    %eax,0xc(%esp)
  52:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  56:	89 44 24 08          	mov    %eax,0x8(%esp)
  5a:	c7 44 24 04 54 06 00 	movl   $0x654,0x4(%esp)
  61:	00 
  62:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  69:	e8 32 03 00 00       	call   3a0 <printf>
  printf(1,"NOE in queue 1 of process with pid %d is %d\n",Pstat.pid,Pstat.ticks[1]);
  printf(1,"NOE in queue 2 of process with pid %d is %d\n",Pstat.pid,Pstat.ticks[2]);
  printf(1,"NOE in queue 3 of process with pid %d is %d\n",Pstat.pid,Pstat.ticks[3]);
  printf(1,"NOE in queue 4 of process with pid %d is %d\n",Pstat.pid,Pstat.ticks[4]);
  #endif
  exit();
  6e:	e8 dd 01 00 00       	call   250 <exit>
  int r;
  int pid = atoi(argv[1]);
  struct pstat Pstat;
  if((r = getpinfo(pid, &Pstat)) < 0)
  {
    printf(1,"Error!\n");
  73:	c7 44 24 04 4a 06 00 	movl   $0x64a,0x4(%esp)
  7a:	00 
  7b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  82:	e8 19 03 00 00       	call   3a0 <printf>
    exit();
  87:	e8 c4 01 00 00       	call   250 <exit>

0000008c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	53                   	push   %ebx
  90:	8b 45 08             	mov    0x8(%ebp),%eax
  93:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  96:	31 d2                	xor    %edx,%edx
  98:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  9b:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  9e:	42                   	inc    %edx
  9f:	84 c9                	test   %cl,%cl
  a1:	75 f5                	jne    98 <strcpy+0xc>
    ;
  return os;
}
  a3:	5b                   	pop    %ebx
  a4:	5d                   	pop    %ebp
  a5:	c3                   	ret    
  a6:	66 90                	xchg   %ax,%ax

000000a8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a8:	55                   	push   %ebp
  a9:	89 e5                	mov    %esp,%ebp
  ab:	56                   	push   %esi
  ac:	53                   	push   %ebx
  ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
  b0:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  b3:	8a 01                	mov    (%ecx),%al
  b5:	8a 1a                	mov    (%edx),%bl
  b7:	84 c0                	test   %al,%al
  b9:	74 1d                	je     d8 <strcmp+0x30>
  bb:	38 d8                	cmp    %bl,%al
  bd:	74 0c                	je     cb <strcmp+0x23>
  bf:	eb 23                	jmp    e4 <strcmp+0x3c>
  c1:	8d 76 00             	lea    0x0(%esi),%esi
  c4:	41                   	inc    %ecx
  c5:	38 d8                	cmp    %bl,%al
  c7:	75 1b                	jne    e4 <strcmp+0x3c>
    p++, q++;
  c9:	89 f2                	mov    %esi,%edx
  cb:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  ce:	8a 41 01             	mov    0x1(%ecx),%al
  d1:	8a 5a 01             	mov    0x1(%edx),%bl
  d4:	84 c0                	test   %al,%al
  d6:	75 ec                	jne    c4 <strcmp+0x1c>
  d8:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  da:	0f b6 db             	movzbl %bl,%ebx
  dd:	29 d8                	sub    %ebx,%eax
}
  df:	5b                   	pop    %ebx
  e0:	5e                   	pop    %esi
  e1:	5d                   	pop    %ebp
  e2:	c3                   	ret    
  e3:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e4:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e7:	0f b6 db             	movzbl %bl,%ebx
  ea:	29 d8                	sub    %ebx,%eax
}
  ec:	5b                   	pop    %ebx
  ed:	5e                   	pop    %esi
  ee:	5d                   	pop    %ebp
  ef:	c3                   	ret    

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 39 00             	cmpb   $0x0,(%ecx)
  f9:	74 10                	je     10b <strlen+0x1b>
  fb:	31 d2                	xor    %edx,%edx
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	42                   	inc    %edx
 101:	89 d0                	mov    %edx,%eax
 103:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 107:	75 f7                	jne    100 <strlen+0x10>
    ;
  return n;
}
 109:	5d                   	pop    %ebp
 10a:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 10b:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    
 10f:	90                   	nop

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	89 d7                	mov    %edx,%edi
 119:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11c:	8b 45 0c             	mov    0xc(%ebp),%eax
 11f:	fc                   	cld    
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	89 d0                	mov    %edx,%eax
 124:	5f                   	pop    %edi
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    
 127:	90                   	nop

00000128 <strchr>:

char*
strchr(const char *s, char c)
{
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
 12b:	8b 45 08             	mov    0x8(%ebp),%eax
 12e:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
 131:	8a 10                	mov    (%eax),%dl
 133:	84 d2                	test   %dl,%dl
 135:	75 0d                	jne    144 <strchr+0x1c>
 137:	eb 13                	jmp    14c <strchr+0x24>
 139:	8d 76 00             	lea    0x0(%esi),%esi
 13c:	8a 50 01             	mov    0x1(%eax),%dl
 13f:	84 d2                	test   %dl,%dl
 141:	74 09                	je     14c <strchr+0x24>
 143:	40                   	inc    %eax
    if(*s == c)
 144:	38 ca                	cmp    %cl,%dl
 146:	75 f4                	jne    13c <strchr+0x14>
      return (char*)s;
  return 0;
}
 148:	5d                   	pop    %ebp
 149:	c3                   	ret    
 14a:	66 90                	xchg   %ax,%ax
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 14c:	31 c0                	xor    %eax,%eax
}
 14e:	5d                   	pop    %ebp
 14f:	c3                   	ret    

00000150 <gets>:

char*
gets(char *buf, int max)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	56                   	push   %esi
 155:	53                   	push   %ebx
 156:	83 ec 2c             	sub    $0x2c,%esp
 159:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 15c:	31 f6                	xor    %esi,%esi
 15e:	eb 30                	jmp    190 <gets+0x40>
    cc = read(0, &c, 1);
 160:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 167:	00 
 168:	8d 45 e7             	lea    -0x19(%ebp),%eax
 16b:	89 44 24 04          	mov    %eax,0x4(%esp)
 16f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 176:	e8 ed 00 00 00       	call   268 <read>
    if(cc < 1)
 17b:	85 c0                	test   %eax,%eax
 17d:	7e 19                	jle    198 <gets+0x48>
      break;
    buf[i++] = c;
 17f:	8a 45 e7             	mov    -0x19(%ebp),%al
 182:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 186:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 188:	3c 0a                	cmp    $0xa,%al
 18a:	74 0c                	je     198 <gets+0x48>
 18c:	3c 0d                	cmp    $0xd,%al
 18e:	74 08                	je     198 <gets+0x48>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 190:	8d 5e 01             	lea    0x1(%esi),%ebx
 193:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 196:	7c c8                	jl     160 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 198:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 19c:	89 f8                	mov    %edi,%eax
 19e:	83 c4 2c             	add    $0x2c,%esp
 1a1:	5b                   	pop    %ebx
 1a2:	5e                   	pop    %esi
 1a3:	5f                   	pop    %edi
 1a4:	5d                   	pop    %ebp
 1a5:	c3                   	ret    
 1a6:	66 90                	xchg   %ax,%ax

000001a8 <stat>:

int
stat(const char *n, struct stat *st)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
 1ab:	56                   	push   %esi
 1ac:	53                   	push   %ebx
 1ad:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b7:	00 
 1b8:	8b 45 08             	mov    0x8(%ebp),%eax
 1bb:	89 04 24             	mov    %eax,(%esp)
 1be:	e8 cd 00 00 00       	call   290 <open>
 1c3:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 1c5:	85 c0                	test   %eax,%eax
 1c7:	78 23                	js     1ec <stat+0x44>
    return -1;
  r = fstat(fd, st);
 1c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d0:	89 1c 24             	mov    %ebx,(%esp)
 1d3:	e8 d0 00 00 00       	call   2a8 <fstat>
 1d8:	89 c6                	mov    %eax,%esi
  close(fd);
 1da:	89 1c 24             	mov    %ebx,(%esp)
 1dd:	e8 96 00 00 00       	call   278 <close>
  return r;
}
 1e2:	89 f0                	mov    %esi,%eax
 1e4:	83 c4 10             	add    $0x10,%esp
 1e7:	5b                   	pop    %ebx
 1e8:	5e                   	pop    %esi
 1e9:	5d                   	pop    %ebp
 1ea:	c3                   	ret    
 1eb:	90                   	nop
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 1ec:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1f1:	eb ef                	jmp    1e2 <stat+0x3a>
 1f3:	90                   	nop

000001f4 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	53                   	push   %ebx
 1f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1fb:	8a 11                	mov    (%ecx),%dl
 1fd:	8d 42 d0             	lea    -0x30(%edx),%eax
 200:	3c 09                	cmp    $0x9,%al
 202:	b8 00 00 00 00       	mov    $0x0,%eax
 207:	77 18                	ja     221 <atoi+0x2d>
 209:	8d 76 00             	lea    0x0(%esi),%esi
    n = n*10 + *s++ - '0';
 20c:	8d 04 80             	lea    (%eax,%eax,4),%eax
 20f:	0f be d2             	movsbl %dl,%edx
 212:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 216:	41                   	inc    %ecx
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 217:	8a 11                	mov    (%ecx),%dl
 219:	8d 5a d0             	lea    -0x30(%edx),%ebx
 21c:	80 fb 09             	cmp    $0x9,%bl
 21f:	76 eb                	jbe    20c <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 221:	5b                   	pop    %ebx
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    

00000224 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	56                   	push   %esi
 228:	53                   	push   %ebx
 229:	8b 45 08             	mov    0x8(%ebp),%eax
 22c:	8b 75 0c             	mov    0xc(%ebp),%esi
 22f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 232:	85 db                	test   %ebx,%ebx
 234:	7e 0d                	jle    243 <memmove+0x1f>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
 236:	31 d2                	xor    %edx,%edx
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 238:	8a 0c 16             	mov    (%esi,%edx,1),%cl
 23b:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 23e:	42                   	inc    %edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 23f:	39 da                	cmp    %ebx,%edx
 241:	75 f5                	jne    238 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
}
 243:	5b                   	pop    %ebx
 244:	5e                   	pop    %esi
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    
 247:	90                   	nop

00000248 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 248:	b8 01 00 00 00       	mov    $0x1,%eax
 24d:	cd 40                	int    $0x40
 24f:	c3                   	ret    

00000250 <exit>:
SYSCALL(exit)
 250:	b8 02 00 00 00       	mov    $0x2,%eax
 255:	cd 40                	int    $0x40
 257:	c3                   	ret    

00000258 <wait>:
SYSCALL(wait)
 258:	b8 03 00 00 00       	mov    $0x3,%eax
 25d:	cd 40                	int    $0x40
 25f:	c3                   	ret    

00000260 <pipe>:
SYSCALL(pipe)
 260:	b8 04 00 00 00       	mov    $0x4,%eax
 265:	cd 40                	int    $0x40
 267:	c3                   	ret    

00000268 <read>:
SYSCALL(read)
 268:	b8 05 00 00 00       	mov    $0x5,%eax
 26d:	cd 40                	int    $0x40
 26f:	c3                   	ret    

00000270 <write>:
SYSCALL(write)
 270:	b8 10 00 00 00       	mov    $0x10,%eax
 275:	cd 40                	int    $0x40
 277:	c3                   	ret    

00000278 <close>:
SYSCALL(close)
 278:	b8 15 00 00 00       	mov    $0x15,%eax
 27d:	cd 40                	int    $0x40
 27f:	c3                   	ret    

00000280 <kill>:
SYSCALL(kill)
 280:	b8 06 00 00 00       	mov    $0x6,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret    

00000288 <exec>:
SYSCALL(exec)
 288:	b8 07 00 00 00       	mov    $0x7,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <open>:
SYSCALL(open)
 290:	b8 0f 00 00 00       	mov    $0xf,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <mknod>:
SYSCALL(mknod)
 298:	b8 11 00 00 00       	mov    $0x11,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <unlink>:
SYSCALL(unlink)
 2a0:	b8 12 00 00 00       	mov    $0x12,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <fstat>:
SYSCALL(fstat)
 2a8:	b8 08 00 00 00       	mov    $0x8,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <link>:
SYSCALL(link)
 2b0:	b8 13 00 00 00       	mov    $0x13,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <mkdir>:
SYSCALL(mkdir)
 2b8:	b8 14 00 00 00       	mov    $0x14,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <chdir>:
SYSCALL(chdir)
 2c0:	b8 09 00 00 00       	mov    $0x9,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <dup>:
SYSCALL(dup)
 2c8:	b8 0a 00 00 00       	mov    $0xa,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <getpid>:
SYSCALL(getpid)
 2d0:	b8 0b 00 00 00       	mov    $0xb,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <sbrk>:
SYSCALL(sbrk)
 2d8:	b8 0c 00 00 00       	mov    $0xc,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <sleep>:
SYSCALL(sleep)
 2e0:	b8 0d 00 00 00       	mov    $0xd,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <uptime>:
SYSCALL(uptime)
 2e8:	b8 0e 00 00 00       	mov    $0xe,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <waitx>:
SYSCALL(waitx)      //BVK Commit Assignment 5 Q1
 2f0:	b8 16 00 00 00       	mov    $0x16,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <chprty>:
SYSCALL(chprty)
 2f8:	b8 17 00 00 00       	mov    $0x17,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <ps>:
SYSCALL(ps)
 300:	b8 18 00 00 00       	mov    $0x18,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <getpinfo>:
SYSCALL(getpinfo)
 308:	b8 19 00 00 00       	mov    $0x19,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	83 ec 28             	sub    $0x28,%esp
 316:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 319:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 320:	00 
 321:	8d 55 f4             	lea    -0xc(%ebp),%edx
 324:	89 54 24 04          	mov    %edx,0x4(%esp)
 328:	89 04 24             	mov    %eax,(%esp)
 32b:	e8 40 ff ff ff       	call   270 <write>
}
 330:	c9                   	leave  
 331:	c3                   	ret    
 332:	66 90                	xchg   %ax,%ax

00000334 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	57                   	push   %edi
 338:	56                   	push   %esi
 339:	53                   	push   %ebx
 33a:	83 ec 1c             	sub    $0x1c,%esp
 33d:	89 c6                	mov    %eax,%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 33f:	89 d0                	mov    %edx,%eax
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 341:	8b 5d 08             	mov    0x8(%ebp),%ebx
 344:	85 db                	test   %ebx,%ebx
 346:	74 04                	je     34c <printint+0x18>
 348:	85 d2                	test   %edx,%edx
 34a:	78 4a                	js     396 <printint+0x62>
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 34c:	31 ff                	xor    %edi,%edi
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 34e:	31 db                	xor    %ebx,%ebx
 350:	eb 04                	jmp    356 <printint+0x22>
 352:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 354:	89 d3                	mov    %edx,%ebx
 356:	31 d2                	xor    %edx,%edx
 358:	f7 f1                	div    %ecx
 35a:	8a 92 83 06 00 00    	mov    0x683(%edx),%dl
 360:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
 364:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
 367:	85 c0                	test   %eax,%eax
 369:	75 e9                	jne    354 <printint+0x20>
  if(neg)
 36b:	85 ff                	test   %edi,%edi
 36d:	74 08                	je     377 <printint+0x43>
    buf[i++] = '-';
 36f:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
 374:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
 377:	8d 5a ff             	lea    -0x1(%edx),%ebx
 37a:	66 90                	xchg   %ax,%ax
    putc(fd, buf[i]);
 37c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 381:	89 f0                	mov    %esi,%eax
 383:	e8 88 ff ff ff       	call   310 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 388:	4b                   	dec    %ebx
 389:	83 fb ff             	cmp    $0xffffffff,%ebx
 38c:	75 ee                	jne    37c <printint+0x48>
    putc(fd, buf[i]);
}
 38e:	83 c4 1c             	add    $0x1c,%esp
 391:	5b                   	pop    %ebx
 392:	5e                   	pop    %esi
 393:	5f                   	pop    %edi
 394:	5d                   	pop    %ebp
 395:	c3                   	ret    
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 396:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 398:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
 39d:	eb af                	jmp    34e <printint+0x1a>
 39f:	90                   	nop

000003a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	56                   	push   %esi
 3a5:	53                   	push   %ebx
 3a6:	83 ec 2c             	sub    $0x2c,%esp
 3a9:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3ac:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3af:	8a 0b                	mov    (%ebx),%cl
 3b1:	84 c9                	test   %cl,%cl
 3b3:	74 7b                	je     430 <printf+0x90>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3b5:	8d 45 10             	lea    0x10(%ebp),%eax
 3b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 3bb:	31 f6                	xor    %esi,%esi
 3bd:	eb 17                	jmp    3d6 <printf+0x36>
 3bf:	90                   	nop
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3c0:	83 f9 25             	cmp    $0x25,%ecx
 3c3:	74 73                	je     438 <printf+0x98>
        state = '%';
      } else {
        putc(fd, c);
 3c5:	0f be d1             	movsbl %cl,%edx
 3c8:	89 f8                	mov    %edi,%eax
 3ca:	e8 41 ff ff ff       	call   310 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 3cf:	43                   	inc    %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3d0:	8a 0b                	mov    (%ebx),%cl
 3d2:	84 c9                	test   %cl,%cl
 3d4:	74 5a                	je     430 <printf+0x90>
    c = fmt[i] & 0xff;
 3d6:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 3d9:	85 f6                	test   %esi,%esi
 3db:	74 e3                	je     3c0 <printf+0x20>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 3dd:	83 fe 25             	cmp    $0x25,%esi
 3e0:	75 ed                	jne    3cf <printf+0x2f>
      if(c == 'd'){
 3e2:	83 f9 64             	cmp    $0x64,%ecx
 3e5:	0f 84 c1 00 00 00    	je     4ac <printf+0x10c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 3eb:	83 f9 78             	cmp    $0x78,%ecx
 3ee:	74 50                	je     440 <printf+0xa0>
 3f0:	83 f9 70             	cmp    $0x70,%ecx
 3f3:	74 4b                	je     440 <printf+0xa0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 3f5:	83 f9 73             	cmp    $0x73,%ecx
 3f8:	74 6a                	je     464 <printf+0xc4>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 3fa:	83 f9 63             	cmp    $0x63,%ecx
 3fd:	0f 84 91 00 00 00    	je     494 <printf+0xf4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
        putc(fd, c);
 403:	ba 25 00 00 00       	mov    $0x25,%edx
 408:	89 f8                	mov    %edi,%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 40a:	83 f9 25             	cmp    $0x25,%ecx
 40d:	74 10                	je     41f <printf+0x7f>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 40f:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 412:	e8 f9 fe ff ff       	call   310 <putc>
        putc(fd, c);
 417:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 41a:	0f be d1             	movsbl %cl,%edx
 41d:	89 f8                	mov    %edi,%eax
 41f:	e8 ec fe ff ff       	call   310 <putc>
      }
      state = 0;
 424:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 426:	43                   	inc    %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 427:	8a 0b                	mov    (%ebx),%cl
 429:	84 c9                	test   %cl,%cl
 42b:	75 a9                	jne    3d6 <printf+0x36>
 42d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 430:	83 c4 2c             	add    $0x2c,%esp
 433:	5b                   	pop    %ebx
 434:	5e                   	pop    %esi
 435:	5f                   	pop    %edi
 436:	5d                   	pop    %ebp
 437:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 438:	be 25 00 00 00       	mov    $0x25,%esi
 43d:	eb 90                	jmp    3cf <printf+0x2f>
 43f:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 440:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 447:	b9 10 00 00 00       	mov    $0x10,%ecx
 44c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 44f:	8b 10                	mov    (%eax),%edx
 451:	89 f8                	mov    %edi,%eax
 453:	e8 dc fe ff ff       	call   334 <printint>
        ap++;
 458:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 45c:	31 f6                	xor    %esi,%esi
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 45e:	e9 6c ff ff ff       	jmp    3cf <printf+0x2f>
 463:	90                   	nop
      } else if(c == 's'){
        s = (char*)*ap;
 464:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 467:	8b 30                	mov    (%eax),%esi
        ap++;
 469:	83 c0 04             	add    $0x4,%eax
 46c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 46f:	85 f6                	test   %esi,%esi
 471:	74 5a                	je     4cd <printf+0x12d>
          s = "(null)";
        while(*s != 0){
 473:	8a 16                	mov    (%esi),%dl
 475:	84 d2                	test   %dl,%dl
 477:	74 14                	je     48d <printf+0xed>
 479:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 47c:	0f be d2             	movsbl %dl,%edx
 47f:	89 f8                	mov    %edi,%eax
 481:	e8 8a fe ff ff       	call   310 <putc>
          s++;
 486:	46                   	inc    %esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 487:	8a 16                	mov    (%esi),%dl
 489:	84 d2                	test   %dl,%dl
 48b:	75 ef                	jne    47c <printf+0xdc>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 48d:	31 f6                	xor    %esi,%esi
 48f:	e9 3b ff ff ff       	jmp    3cf <printf+0x2f>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 494:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 497:	0f be 10             	movsbl (%eax),%edx
 49a:	89 f8                	mov    %edi,%eax
 49c:	e8 6f fe ff ff       	call   310 <putc>
        ap++;
 4a1:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4a5:	31 f6                	xor    %esi,%esi
 4a7:	e9 23 ff ff ff       	jmp    3cf <printf+0x2f>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 4ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4b3:	b1 0a                	mov    $0xa,%cl
 4b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4b8:	8b 10                	mov    (%eax),%edx
 4ba:	89 f8                	mov    %edi,%eax
 4bc:	e8 73 fe ff ff       	call   334 <printint>
        ap++;
 4c1:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4c5:	66 31 f6             	xor    %si,%si
 4c8:	e9 02 ff ff ff       	jmp    3cf <printf+0x2f>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 4cd:	be 7c 06 00 00       	mov    $0x67c,%esi
 4d2:	eb 9f                	jmp    473 <printf+0xd3>

000004d4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	57                   	push   %edi
 4d8:	56                   	push   %esi
 4d9:	53                   	push   %ebx
 4da:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 4dd:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4e0:	a1 34 09 00 00       	mov    0x934,%eax
 4e5:	8d 76 00             	lea    0x0(%esi),%esi
 4e8:	8b 10                	mov    (%eax),%edx
 4ea:	39 c8                	cmp    %ecx,%eax
 4ec:	73 04                	jae    4f2 <free+0x1e>
 4ee:	39 d1                	cmp    %edx,%ecx
 4f0:	72 12                	jb     504 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 4f2:	39 d0                	cmp    %edx,%eax
 4f4:	72 08                	jb     4fe <free+0x2a>
 4f6:	39 c8                	cmp    %ecx,%eax
 4f8:	72 0a                	jb     504 <free+0x30>
 4fa:	39 d1                	cmp    %edx,%ecx
 4fc:	72 06                	jb     504 <free+0x30>
static Header base;
static Header *freep;

void
free(void *ap)
{
 4fe:	89 d0                	mov    %edx,%eax
 500:	eb e6                	jmp    4e8 <free+0x14>
 502:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 504:	8b 73 fc             	mov    -0x4(%ebx),%esi
 507:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 50a:	39 d7                	cmp    %edx,%edi
 50c:	74 19                	je     527 <free+0x53>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 50e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 511:	8b 50 04             	mov    0x4(%eax),%edx
 514:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 517:	39 f1                	cmp    %esi,%ecx
 519:	74 23                	je     53e <free+0x6a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 51b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 51d:	a3 34 09 00 00       	mov    %eax,0x934
}
 522:	5b                   	pop    %ebx
 523:	5e                   	pop    %esi
 524:	5f                   	pop    %edi
 525:	5d                   	pop    %ebp
 526:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 527:	03 72 04             	add    0x4(%edx),%esi
 52a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 52d:	8b 10                	mov    (%eax),%edx
 52f:	8b 12                	mov    (%edx),%edx
 531:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 534:	8b 50 04             	mov    0x4(%eax),%edx
 537:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 53a:	39 f1                	cmp    %esi,%ecx
 53c:	75 dd                	jne    51b <free+0x47>
    p->s.size += bp->s.size;
 53e:	03 53 fc             	add    -0x4(%ebx),%edx
 541:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 544:	8b 53 f8             	mov    -0x8(%ebx),%edx
 547:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 549:	a3 34 09 00 00       	mov    %eax,0x934
}
 54e:	5b                   	pop    %ebx
 54f:	5e                   	pop    %esi
 550:	5f                   	pop    %edi
 551:	5d                   	pop    %ebp
 552:	c3                   	ret    
 553:	90                   	nop

00000554 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 554:	55                   	push   %ebp
 555:	89 e5                	mov    %esp,%ebp
 557:	57                   	push   %edi
 558:	56                   	push   %esi
 559:	53                   	push   %ebx
 55a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 55d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 560:	83 c3 07             	add    $0x7,%ebx
 563:	c1 eb 03             	shr    $0x3,%ebx
 566:	43                   	inc    %ebx
  if((prevp = freep) == 0){
 567:	8b 0d 34 09 00 00    	mov    0x934,%ecx
 56d:	85 c9                	test   %ecx,%ecx
 56f:	0f 84 95 00 00 00    	je     60a <malloc+0xb6>
 575:	8b 01                	mov    (%ecx),%eax
 577:	8b 50 04             	mov    0x4(%eax),%edx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 57a:	39 da                	cmp    %ebx,%edx
 57c:	73 66                	jae    5e4 <malloc+0x90>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 57e:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
 585:	eb 0c                	jmp    593 <malloc+0x3f>
 587:	90                   	nop
    }
    if(p == freep)
 588:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 58a:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 58c:	8b 50 04             	mov    0x4(%eax),%edx
 58f:	39 d3                	cmp    %edx,%ebx
 591:	76 51                	jbe    5e4 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 593:	3b 05 34 09 00 00    	cmp    0x934,%eax
 599:	75 ed                	jne    588 <malloc+0x34>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 59b:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 5a1:	76 35                	jbe    5d8 <malloc+0x84>
 5a3:	89 f8                	mov    %edi,%eax
 5a5:	89 de                	mov    %ebx,%esi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 5a7:	89 04 24             	mov    %eax,(%esp)
 5aa:	e8 29 fd ff ff       	call   2d8 <sbrk>
  if(p == (char*)-1)
 5af:	83 f8 ff             	cmp    $0xffffffff,%eax
 5b2:	74 18                	je     5cc <malloc+0x78>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5b4:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 5b7:	83 c0 08             	add    $0x8,%eax
 5ba:	89 04 24             	mov    %eax,(%esp)
 5bd:	e8 12 ff ff ff       	call   4d4 <free>
  return freep;
 5c2:	8b 0d 34 09 00 00    	mov    0x934,%ecx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 5c8:	85 c9                	test   %ecx,%ecx
 5ca:	75 be                	jne    58a <malloc+0x36>
        return 0;
 5cc:	31 c0                	xor    %eax,%eax
  }
}
 5ce:	83 c4 1c             	add    $0x1c,%esp
 5d1:	5b                   	pop    %ebx
 5d2:	5e                   	pop    %esi
 5d3:	5f                   	pop    %edi
 5d4:	5d                   	pop    %ebp
 5d5:	c3                   	ret    
 5d6:	66 90                	xchg   %ax,%ax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 5d8:	b8 00 80 00 00       	mov    $0x8000,%eax
    nu = 4096;
 5dd:	be 00 10 00 00       	mov    $0x1000,%esi
 5e2:	eb c3                	jmp    5a7 <malloc+0x53>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 5e4:	39 d3                	cmp    %edx,%ebx
 5e6:	74 1c                	je     604 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 5e8:	29 da                	sub    %ebx,%edx
 5ea:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 5ed:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 5f0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 5f3:	89 0d 34 09 00 00    	mov    %ecx,0x934
      return (void*)(p + 1);
 5f9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 5fc:	83 c4 1c             	add    $0x1c,%esp
 5ff:	5b                   	pop    %ebx
 600:	5e                   	pop    %esi
 601:	5f                   	pop    %edi
 602:	5d                   	pop    %ebp
 603:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 604:	8b 10                	mov    (%eax),%edx
 606:	89 11                	mov    %edx,(%ecx)
 608:	eb e9                	jmp    5f3 <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 60a:	c7 05 34 09 00 00 38 	movl   $0x938,0x934
 611:	09 00 00 
 614:	c7 05 38 09 00 00 38 	movl   $0x938,0x938
 61b:	09 00 00 
    base.s.size = 0;
 61e:	c7 05 3c 09 00 00 00 	movl   $0x0,0x93c
 625:	00 00 00 
 628:	b8 38 09 00 00       	mov    $0x938,%eax
 62d:	e9 4c ff ff ff       	jmp    57e <malloc+0x2a>
