
_chprty:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
// #include "defs.h"
// #include "ulib.h"
#include "user.h"

int main(int argc , char* argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	83 e4 f0             	and    $0xfffffff0,%esp
   8:	83 ec 10             	sub    $0x10,%esp
   b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(argc!=3)
   e:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
  12:	74 19                	je     2d <main+0x2d>
  {
    printf(1,"Usage: ps <pid> <priority no. (between 0 and 100)>\n");
  14:	c7 44 24 04 3c 06 00 	movl   $0x63c,0x4(%esp)
  1b:	00 
  1c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  23:	e8 80 03 00 00       	call   3a8 <printf>
      exit();
    }
    chprty(pid, priority);

  }
  exit();
  28:	e8 2b 02 00 00       	call   258 <exit>
  {
    printf(1,"Usage: ps <pid> <priority no. (between 0 and 100)>\n");
  }

  else{
    int pid = atoi(argv[1]);
  2d:	8b 43 04             	mov    0x4(%ebx),%eax
  30:	89 04 24             	mov    %eax,(%esp)
  33:	e8 c4 01 00 00       	call   1fc <atoi>
  38:	89 c6                	mov    %eax,%esi
    if(pid == 1 || pid == 2)
  3a:	8d 40 ff             	lea    -0x1(%eax),%eax
  3d:	83 f8 01             	cmp    $0x1,%eax
  40:	76 37                	jbe    79 <main+0x79>
    {
      printf(1,"Access Denied\n");
      exit();
    }
    int priority = atoi(argv[2]);
  42:	8b 43 08             	mov    0x8(%ebx),%eax
  45:	89 04 24             	mov    %eax,(%esp)
  48:	e8 af 01 00 00       	call   1fc <atoi>
    if(priority < 0 || priority > 100){
  4d:	83 f8 64             	cmp    $0x64,%eax
  50:	76 19                	jbe    6b <main+0x6b>
      printf(1,"Priority should range between 0 and 100\n");
  52:	c7 44 24 04 70 06 00 	movl   $0x670,0x4(%esp)
  59:	00 
  5a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  61:	e8 42 03 00 00       	call   3a8 <printf>
      exit();
  66:	e8 ed 01 00 00       	call   258 <exit>
    }
    chprty(pid, priority);
  6b:	89 44 24 04          	mov    %eax,0x4(%esp)
  6f:	89 34 24             	mov    %esi,(%esp)
  72:	e8 89 02 00 00       	call   300 <chprty>
  77:	eb af                	jmp    28 <main+0x28>

  else{
    int pid = atoi(argv[1]);
    if(pid == 1 || pid == 2)
    {
      printf(1,"Access Denied\n");
  79:	c7 44 24 04 9c 06 00 	movl   $0x69c,0x4(%esp)
  80:	00 
  81:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  88:	e8 1b 03 00 00       	call   3a8 <printf>
      exit();
  8d:	e8 c6 01 00 00       	call   258 <exit>
  92:	90                   	nop
  93:	90                   	nop

00000094 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	53                   	push   %ebx
  98:	8b 45 08             	mov    0x8(%ebp),%eax
  9b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  9e:	31 d2                	xor    %edx,%edx
  a0:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  a3:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  a6:	42                   	inc    %edx
  a7:	84 c9                	test   %cl,%cl
  a9:	75 f5                	jne    a0 <strcpy+0xc>
    ;
  return os;
}
  ab:	5b                   	pop    %ebx
  ac:	5d                   	pop    %ebp
  ad:	c3                   	ret    
  ae:	66 90                	xchg   %ax,%ax

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	56                   	push   %esi
  b4:	53                   	push   %ebx
  b5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  b8:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  bb:	8a 01                	mov    (%ecx),%al
  bd:	8a 1a                	mov    (%edx),%bl
  bf:	84 c0                	test   %al,%al
  c1:	74 1d                	je     e0 <strcmp+0x30>
  c3:	38 d8                	cmp    %bl,%al
  c5:	74 0c                	je     d3 <strcmp+0x23>
  c7:	eb 23                	jmp    ec <strcmp+0x3c>
  c9:	8d 76 00             	lea    0x0(%esi),%esi
  cc:	41                   	inc    %ecx
  cd:	38 d8                	cmp    %bl,%al
  cf:	75 1b                	jne    ec <strcmp+0x3c>
    p++, q++;
  d1:	89 f2                	mov    %esi,%edx
  d3:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d6:	8a 41 01             	mov    0x1(%ecx),%al
  d9:	8a 5a 01             	mov    0x1(%edx),%bl
  dc:	84 c0                	test   %al,%al
  de:	75 ec                	jne    cc <strcmp+0x1c>
  e0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e2:	0f b6 db             	movzbl %bl,%ebx
  e5:	29 d8                	sub    %ebx,%eax
}
  e7:	5b                   	pop    %ebx
  e8:	5e                   	pop    %esi
  e9:	5d                   	pop    %ebp
  ea:	c3                   	ret    
  eb:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  ec:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  ef:	0f b6 db             	movzbl %bl,%ebx
  f2:	29 d8                	sub    %ebx,%eax
}
  f4:	5b                   	pop    %ebx
  f5:	5e                   	pop    %esi
  f6:	5d                   	pop    %ebp
  f7:	c3                   	ret    

000000f8 <strlen>:

uint
strlen(const char *s)
{
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  fe:	80 39 00             	cmpb   $0x0,(%ecx)
 101:	74 10                	je     113 <strlen+0x1b>
 103:	31 d2                	xor    %edx,%edx
 105:	8d 76 00             	lea    0x0(%esi),%esi
 108:	42                   	inc    %edx
 109:	89 d0                	mov    %edx,%eax
 10b:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 10f:	75 f7                	jne    108 <strlen+0x10>
    ;
  return n;
}
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 113:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 115:	5d                   	pop    %ebp
 116:	c3                   	ret    
 117:	90                   	nop

00000118 <memset>:

void*
memset(void *dst, int c, uint n)
{
 118:	55                   	push   %ebp
 119:	89 e5                	mov    %esp,%ebp
 11b:	57                   	push   %edi
 11c:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 11f:	89 d7                	mov    %edx,%edi
 121:	8b 4d 10             	mov    0x10(%ebp),%ecx
 124:	8b 45 0c             	mov    0xc(%ebp),%eax
 127:	fc                   	cld    
 128:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 12a:	89 d0                	mov    %edx,%eax
 12c:	5f                   	pop    %edi
 12d:	5d                   	pop    %ebp
 12e:	c3                   	ret    
 12f:	90                   	nop

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 45 08             	mov    0x8(%ebp),%eax
 136:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
 139:	8a 10                	mov    (%eax),%dl
 13b:	84 d2                	test   %dl,%dl
 13d:	75 0d                	jne    14c <strchr+0x1c>
 13f:	eb 13                	jmp    154 <strchr+0x24>
 141:	8d 76 00             	lea    0x0(%esi),%esi
 144:	8a 50 01             	mov    0x1(%eax),%dl
 147:	84 d2                	test   %dl,%dl
 149:	74 09                	je     154 <strchr+0x24>
 14b:	40                   	inc    %eax
    if(*s == c)
 14c:	38 ca                	cmp    %cl,%dl
 14e:	75 f4                	jne    144 <strchr+0x14>
      return (char*)s;
  return 0;
}
 150:	5d                   	pop    %ebp
 151:	c3                   	ret    
 152:	66 90                	xchg   %ax,%ax
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 154:	31 c0                	xor    %eax,%eax
}
 156:	5d                   	pop    %ebp
 157:	c3                   	ret    

00000158 <gets>:

char*
gets(char *buf, int max)
{
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	57                   	push   %edi
 15c:	56                   	push   %esi
 15d:	53                   	push   %ebx
 15e:	83 ec 2c             	sub    $0x2c,%esp
 161:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 164:	31 f6                	xor    %esi,%esi
 166:	eb 30                	jmp    198 <gets+0x40>
    cc = read(0, &c, 1);
 168:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 16f:	00 
 170:	8d 45 e7             	lea    -0x19(%ebp),%eax
 173:	89 44 24 04          	mov    %eax,0x4(%esp)
 177:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 17e:	e8 ed 00 00 00       	call   270 <read>
    if(cc < 1)
 183:	85 c0                	test   %eax,%eax
 185:	7e 19                	jle    1a0 <gets+0x48>
      break;
    buf[i++] = c;
 187:	8a 45 e7             	mov    -0x19(%ebp),%al
 18a:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 18e:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 190:	3c 0a                	cmp    $0xa,%al
 192:	74 0c                	je     1a0 <gets+0x48>
 194:	3c 0d                	cmp    $0xd,%al
 196:	74 08                	je     1a0 <gets+0x48>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 198:	8d 5e 01             	lea    0x1(%esi),%ebx
 19b:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 19e:	7c c8                	jl     168 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1a0:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1a4:	89 f8                	mov    %edi,%eax
 1a6:	83 c4 2c             	add    $0x2c,%esp
 1a9:	5b                   	pop    %ebx
 1aa:	5e                   	pop    %esi
 1ab:	5f                   	pop    %edi
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
 1b5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1bf:	00 
 1c0:	8b 45 08             	mov    0x8(%ebp),%eax
 1c3:	89 04 24             	mov    %eax,(%esp)
 1c6:	e8 cd 00 00 00       	call   298 <open>
 1cb:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 1cd:	85 c0                	test   %eax,%eax
 1cf:	78 23                	js     1f4 <stat+0x44>
    return -1;
  r = fstat(fd, st);
 1d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d8:	89 1c 24             	mov    %ebx,(%esp)
 1db:	e8 d0 00 00 00       	call   2b0 <fstat>
 1e0:	89 c6                	mov    %eax,%esi
  close(fd);
 1e2:	89 1c 24             	mov    %ebx,(%esp)
 1e5:	e8 96 00 00 00       	call   280 <close>
  return r;
}
 1ea:	89 f0                	mov    %esi,%eax
 1ec:	83 c4 10             	add    $0x10,%esp
 1ef:	5b                   	pop    %ebx
 1f0:	5e                   	pop    %esi
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    
 1f3:	90                   	nop
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 1f4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1f9:	eb ef                	jmp    1ea <stat+0x3a>
 1fb:	90                   	nop

000001fc <atoi>:
  return r;
}

int
atoi(const char *s)
{
 1fc:	55                   	push   %ebp
 1fd:	89 e5                	mov    %esp,%ebp
 1ff:	53                   	push   %ebx
 200:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 203:	8a 11                	mov    (%ecx),%dl
 205:	8d 42 d0             	lea    -0x30(%edx),%eax
 208:	3c 09                	cmp    $0x9,%al
 20a:	b8 00 00 00 00       	mov    $0x0,%eax
 20f:	77 18                	ja     229 <atoi+0x2d>
 211:	8d 76 00             	lea    0x0(%esi),%esi
    n = n*10 + *s++ - '0';
 214:	8d 04 80             	lea    (%eax,%eax,4),%eax
 217:	0f be d2             	movsbl %dl,%edx
 21a:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 21e:	41                   	inc    %ecx
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 21f:	8a 11                	mov    (%ecx),%dl
 221:	8d 5a d0             	lea    -0x30(%edx),%ebx
 224:	80 fb 09             	cmp    $0x9,%bl
 227:	76 eb                	jbe    214 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 229:	5b                   	pop    %ebx
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    

0000022c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 22c:	55                   	push   %ebp
 22d:	89 e5                	mov    %esp,%ebp
 22f:	56                   	push   %esi
 230:	53                   	push   %ebx
 231:	8b 45 08             	mov    0x8(%ebp),%eax
 234:	8b 75 0c             	mov    0xc(%ebp),%esi
 237:	8b 5d 10             	mov    0x10(%ebp),%ebx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 23a:	85 db                	test   %ebx,%ebx
 23c:	7e 0d                	jle    24b <memmove+0x1f>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
 23e:	31 d2                	xor    %edx,%edx
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 240:	8a 0c 16             	mov    (%esi,%edx,1),%cl
 243:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 246:	42                   	inc    %edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 247:	39 da                	cmp    %ebx,%edx
 249:	75 f5                	jne    240 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
}
 24b:	5b                   	pop    %ebx
 24c:	5e                   	pop    %esi
 24d:	5d                   	pop    %ebp
 24e:	c3                   	ret    
 24f:	90                   	nop

00000250 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 250:	b8 01 00 00 00       	mov    $0x1,%eax
 255:	cd 40                	int    $0x40
 257:	c3                   	ret    

00000258 <exit>:
SYSCALL(exit)
 258:	b8 02 00 00 00       	mov    $0x2,%eax
 25d:	cd 40                	int    $0x40
 25f:	c3                   	ret    

00000260 <wait>:
SYSCALL(wait)
 260:	b8 03 00 00 00       	mov    $0x3,%eax
 265:	cd 40                	int    $0x40
 267:	c3                   	ret    

00000268 <pipe>:
SYSCALL(pipe)
 268:	b8 04 00 00 00       	mov    $0x4,%eax
 26d:	cd 40                	int    $0x40
 26f:	c3                   	ret    

00000270 <read>:
SYSCALL(read)
 270:	b8 05 00 00 00       	mov    $0x5,%eax
 275:	cd 40                	int    $0x40
 277:	c3                   	ret    

00000278 <write>:
SYSCALL(write)
 278:	b8 10 00 00 00       	mov    $0x10,%eax
 27d:	cd 40                	int    $0x40
 27f:	c3                   	ret    

00000280 <close>:
SYSCALL(close)
 280:	b8 15 00 00 00       	mov    $0x15,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret    

00000288 <kill>:
SYSCALL(kill)
 288:	b8 06 00 00 00       	mov    $0x6,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <exec>:
SYSCALL(exec)
 290:	b8 07 00 00 00       	mov    $0x7,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <open>:
SYSCALL(open)
 298:	b8 0f 00 00 00       	mov    $0xf,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <mknod>:
SYSCALL(mknod)
 2a0:	b8 11 00 00 00       	mov    $0x11,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <unlink>:
SYSCALL(unlink)
 2a8:	b8 12 00 00 00       	mov    $0x12,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <fstat>:
SYSCALL(fstat)
 2b0:	b8 08 00 00 00       	mov    $0x8,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <link>:
SYSCALL(link)
 2b8:	b8 13 00 00 00       	mov    $0x13,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <mkdir>:
SYSCALL(mkdir)
 2c0:	b8 14 00 00 00       	mov    $0x14,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <chdir>:
SYSCALL(chdir)
 2c8:	b8 09 00 00 00       	mov    $0x9,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <dup>:
SYSCALL(dup)
 2d0:	b8 0a 00 00 00       	mov    $0xa,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <getpid>:
SYSCALL(getpid)
 2d8:	b8 0b 00 00 00       	mov    $0xb,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <sbrk>:
SYSCALL(sbrk)
 2e0:	b8 0c 00 00 00       	mov    $0xc,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <sleep>:
SYSCALL(sleep)
 2e8:	b8 0d 00 00 00       	mov    $0xd,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <uptime>:
SYSCALL(uptime)
 2f0:	b8 0e 00 00 00       	mov    $0xe,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <waitx>:
SYSCALL(waitx)      //BVK Commit Assignment 5 Q1
 2f8:	b8 16 00 00 00       	mov    $0x16,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <chprty>:
SYSCALL(chprty)
 300:	b8 17 00 00 00       	mov    $0x17,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <ps>:
SYSCALL(ps)
 308:	b8 18 00 00 00       	mov    $0x18,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <getpinfo>:
SYSCALL(getpinfo)
 310:	b8 19 00 00 00       	mov    $0x19,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 318:	55                   	push   %ebp
 319:	89 e5                	mov    %esp,%ebp
 31b:	83 ec 28             	sub    $0x28,%esp
 31e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 321:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 328:	00 
 329:	8d 55 f4             	lea    -0xc(%ebp),%edx
 32c:	89 54 24 04          	mov    %edx,0x4(%esp)
 330:	89 04 24             	mov    %eax,(%esp)
 333:	e8 40 ff ff ff       	call   278 <write>
}
 338:	c9                   	leave  
 339:	c3                   	ret    
 33a:	66 90                	xchg   %ax,%ax

0000033c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 33c:	55                   	push   %ebp
 33d:	89 e5                	mov    %esp,%ebp
 33f:	57                   	push   %edi
 340:	56                   	push   %esi
 341:	53                   	push   %ebx
 342:	83 ec 1c             	sub    $0x1c,%esp
 345:	89 c6                	mov    %eax,%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 347:	89 d0                	mov    %edx,%eax
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 349:	8b 5d 08             	mov    0x8(%ebp),%ebx
 34c:	85 db                	test   %ebx,%ebx
 34e:	74 04                	je     354 <printint+0x18>
 350:	85 d2                	test   %edx,%edx
 352:	78 4a                	js     39e <printint+0x62>
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 354:	31 ff                	xor    %edi,%edi
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 356:	31 db                	xor    %ebx,%ebx
 358:	eb 04                	jmp    35e <printint+0x22>
 35a:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 35c:	89 d3                	mov    %edx,%ebx
 35e:	31 d2                	xor    %edx,%edx
 360:	f7 f1                	div    %ecx
 362:	8a 92 b2 06 00 00    	mov    0x6b2(%edx),%dl
 368:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
 36c:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
 36f:	85 c0                	test   %eax,%eax
 371:	75 e9                	jne    35c <printint+0x20>
  if(neg)
 373:	85 ff                	test   %edi,%edi
 375:	74 08                	je     37f <printint+0x43>
    buf[i++] = '-';
 377:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
 37c:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
 37f:	8d 5a ff             	lea    -0x1(%edx),%ebx
 382:	66 90                	xchg   %ax,%ax
    putc(fd, buf[i]);
 384:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 389:	89 f0                	mov    %esi,%eax
 38b:	e8 88 ff ff ff       	call   318 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 390:	4b                   	dec    %ebx
 391:	83 fb ff             	cmp    $0xffffffff,%ebx
 394:	75 ee                	jne    384 <printint+0x48>
    putc(fd, buf[i]);
}
 396:	83 c4 1c             	add    $0x1c,%esp
 399:	5b                   	pop    %ebx
 39a:	5e                   	pop    %esi
 39b:	5f                   	pop    %edi
 39c:	5d                   	pop    %ebp
 39d:	c3                   	ret    
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 39e:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 3a0:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
 3a5:	eb af                	jmp    356 <printint+0x1a>
 3a7:	90                   	nop

000003a8 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3a8:	55                   	push   %ebp
 3a9:	89 e5                	mov    %esp,%ebp
 3ab:	57                   	push   %edi
 3ac:	56                   	push   %esi
 3ad:	53                   	push   %ebx
 3ae:	83 ec 2c             	sub    $0x2c,%esp
 3b1:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3b4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3b7:	8a 0b                	mov    (%ebx),%cl
 3b9:	84 c9                	test   %cl,%cl
 3bb:	74 7b                	je     438 <printf+0x90>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3bd:	8d 45 10             	lea    0x10(%ebp),%eax
 3c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 3c3:	31 f6                	xor    %esi,%esi
 3c5:	eb 17                	jmp    3de <printf+0x36>
 3c7:	90                   	nop
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3c8:	83 f9 25             	cmp    $0x25,%ecx
 3cb:	74 73                	je     440 <printf+0x98>
        state = '%';
      } else {
        putc(fd, c);
 3cd:	0f be d1             	movsbl %cl,%edx
 3d0:	89 f8                	mov    %edi,%eax
 3d2:	e8 41 ff ff ff       	call   318 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 3d7:	43                   	inc    %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3d8:	8a 0b                	mov    (%ebx),%cl
 3da:	84 c9                	test   %cl,%cl
 3dc:	74 5a                	je     438 <printf+0x90>
    c = fmt[i] & 0xff;
 3de:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 3e1:	85 f6                	test   %esi,%esi
 3e3:	74 e3                	je     3c8 <printf+0x20>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 3e5:	83 fe 25             	cmp    $0x25,%esi
 3e8:	75 ed                	jne    3d7 <printf+0x2f>
      if(c == 'd'){
 3ea:	83 f9 64             	cmp    $0x64,%ecx
 3ed:	0f 84 c1 00 00 00    	je     4b4 <printf+0x10c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 3f3:	83 f9 78             	cmp    $0x78,%ecx
 3f6:	74 50                	je     448 <printf+0xa0>
 3f8:	83 f9 70             	cmp    $0x70,%ecx
 3fb:	74 4b                	je     448 <printf+0xa0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 3fd:	83 f9 73             	cmp    $0x73,%ecx
 400:	74 6a                	je     46c <printf+0xc4>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 402:	83 f9 63             	cmp    $0x63,%ecx
 405:	0f 84 91 00 00 00    	je     49c <printf+0xf4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
        putc(fd, c);
 40b:	ba 25 00 00 00       	mov    $0x25,%edx
 410:	89 f8                	mov    %edi,%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 412:	83 f9 25             	cmp    $0x25,%ecx
 415:	74 10                	je     427 <printf+0x7f>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 417:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 41a:	e8 f9 fe ff ff       	call   318 <putc>
        putc(fd, c);
 41f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 422:	0f be d1             	movsbl %cl,%edx
 425:	89 f8                	mov    %edi,%eax
 427:	e8 ec fe ff ff       	call   318 <putc>
      }
      state = 0;
 42c:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 42e:	43                   	inc    %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 42f:	8a 0b                	mov    (%ebx),%cl
 431:	84 c9                	test   %cl,%cl
 433:	75 a9                	jne    3de <printf+0x36>
 435:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 438:	83 c4 2c             	add    $0x2c,%esp
 43b:	5b                   	pop    %ebx
 43c:	5e                   	pop    %esi
 43d:	5f                   	pop    %edi
 43e:	5d                   	pop    %ebp
 43f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 440:	be 25 00 00 00       	mov    $0x25,%esi
 445:	eb 90                	jmp    3d7 <printf+0x2f>
 447:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 448:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 44f:	b9 10 00 00 00       	mov    $0x10,%ecx
 454:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 457:	8b 10                	mov    (%eax),%edx
 459:	89 f8                	mov    %edi,%eax
 45b:	e8 dc fe ff ff       	call   33c <printint>
        ap++;
 460:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 464:	31 f6                	xor    %esi,%esi
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 466:	e9 6c ff ff ff       	jmp    3d7 <printf+0x2f>
 46b:	90                   	nop
      } else if(c == 's'){
        s = (char*)*ap;
 46c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 46f:	8b 30                	mov    (%eax),%esi
        ap++;
 471:	83 c0 04             	add    $0x4,%eax
 474:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 477:	85 f6                	test   %esi,%esi
 479:	74 5a                	je     4d5 <printf+0x12d>
          s = "(null)";
        while(*s != 0){
 47b:	8a 16                	mov    (%esi),%dl
 47d:	84 d2                	test   %dl,%dl
 47f:	74 14                	je     495 <printf+0xed>
 481:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 484:	0f be d2             	movsbl %dl,%edx
 487:	89 f8                	mov    %edi,%eax
 489:	e8 8a fe ff ff       	call   318 <putc>
          s++;
 48e:	46                   	inc    %esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 48f:	8a 16                	mov    (%esi),%dl
 491:	84 d2                	test   %dl,%dl
 493:	75 ef                	jne    484 <printf+0xdc>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 495:	31 f6                	xor    %esi,%esi
 497:	e9 3b ff ff ff       	jmp    3d7 <printf+0x2f>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 49c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 49f:	0f be 10             	movsbl (%eax),%edx
 4a2:	89 f8                	mov    %edi,%eax
 4a4:	e8 6f fe ff ff       	call   318 <putc>
        ap++;
 4a9:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4ad:	31 f6                	xor    %esi,%esi
 4af:	e9 23 ff ff ff       	jmp    3d7 <printf+0x2f>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 4b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4bb:	b1 0a                	mov    $0xa,%cl
 4bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4c0:	8b 10                	mov    (%eax),%edx
 4c2:	89 f8                	mov    %edi,%eax
 4c4:	e8 73 fe ff ff       	call   33c <printint>
        ap++;
 4c9:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4cd:	66 31 f6             	xor    %si,%si
 4d0:	e9 02 ff ff ff       	jmp    3d7 <printf+0x2f>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 4d5:	be ab 06 00 00       	mov    $0x6ab,%esi
 4da:	eb 9f                	jmp    47b <printf+0xd3>

000004dc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 4dc:	55                   	push   %ebp
 4dd:	89 e5                	mov    %esp,%ebp
 4df:	57                   	push   %edi
 4e0:	56                   	push   %esi
 4e1:	53                   	push   %ebx
 4e2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 4e5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4e8:	a1 68 09 00 00       	mov    0x968,%eax
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
 4f0:	8b 10                	mov    (%eax),%edx
 4f2:	39 c8                	cmp    %ecx,%eax
 4f4:	73 04                	jae    4fa <free+0x1e>
 4f6:	39 d1                	cmp    %edx,%ecx
 4f8:	72 12                	jb     50c <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 4fa:	39 d0                	cmp    %edx,%eax
 4fc:	72 08                	jb     506 <free+0x2a>
 4fe:	39 c8                	cmp    %ecx,%eax
 500:	72 0a                	jb     50c <free+0x30>
 502:	39 d1                	cmp    %edx,%ecx
 504:	72 06                	jb     50c <free+0x30>
static Header base;
static Header *freep;

void
free(void *ap)
{
 506:	89 d0                	mov    %edx,%eax
 508:	eb e6                	jmp    4f0 <free+0x14>
 50a:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 50c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 50f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 512:	39 d7                	cmp    %edx,%edi
 514:	74 19                	je     52f <free+0x53>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 516:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 519:	8b 50 04             	mov    0x4(%eax),%edx
 51c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 51f:	39 f1                	cmp    %esi,%ecx
 521:	74 23                	je     546 <free+0x6a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 523:	89 08                	mov    %ecx,(%eax)
  freep = p;
 525:	a3 68 09 00 00       	mov    %eax,0x968
}
 52a:	5b                   	pop    %ebx
 52b:	5e                   	pop    %esi
 52c:	5f                   	pop    %edi
 52d:	5d                   	pop    %ebp
 52e:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 52f:	03 72 04             	add    0x4(%edx),%esi
 532:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 535:	8b 10                	mov    (%eax),%edx
 537:	8b 12                	mov    (%edx),%edx
 539:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 53c:	8b 50 04             	mov    0x4(%eax),%edx
 53f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 542:	39 f1                	cmp    %esi,%ecx
 544:	75 dd                	jne    523 <free+0x47>
    p->s.size += bp->s.size;
 546:	03 53 fc             	add    -0x4(%ebx),%edx
 549:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 54c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 54f:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 551:	a3 68 09 00 00       	mov    %eax,0x968
}
 556:	5b                   	pop    %ebx
 557:	5e                   	pop    %esi
 558:	5f                   	pop    %edi
 559:	5d                   	pop    %ebp
 55a:	c3                   	ret    
 55b:	90                   	nop

0000055c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 55c:	55                   	push   %ebp
 55d:	89 e5                	mov    %esp,%ebp
 55f:	57                   	push   %edi
 560:	56                   	push   %esi
 561:	53                   	push   %ebx
 562:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 565:	8b 5d 08             	mov    0x8(%ebp),%ebx
 568:	83 c3 07             	add    $0x7,%ebx
 56b:	c1 eb 03             	shr    $0x3,%ebx
 56e:	43                   	inc    %ebx
  if((prevp = freep) == 0){
 56f:	8b 0d 68 09 00 00    	mov    0x968,%ecx
 575:	85 c9                	test   %ecx,%ecx
 577:	0f 84 95 00 00 00    	je     612 <malloc+0xb6>
 57d:	8b 01                	mov    (%ecx),%eax
 57f:	8b 50 04             	mov    0x4(%eax),%edx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 582:	39 da                	cmp    %ebx,%edx
 584:	73 66                	jae    5ec <malloc+0x90>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 586:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
 58d:	eb 0c                	jmp    59b <malloc+0x3f>
 58f:	90                   	nop
    }
    if(p == freep)
 590:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 592:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 594:	8b 50 04             	mov    0x4(%eax),%edx
 597:	39 d3                	cmp    %edx,%ebx
 599:	76 51                	jbe    5ec <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 59b:	3b 05 68 09 00 00    	cmp    0x968,%eax
 5a1:	75 ed                	jne    590 <malloc+0x34>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 5a3:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 5a9:	76 35                	jbe    5e0 <malloc+0x84>
 5ab:	89 f8                	mov    %edi,%eax
 5ad:	89 de                	mov    %ebx,%esi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 5af:	89 04 24             	mov    %eax,(%esp)
 5b2:	e8 29 fd ff ff       	call   2e0 <sbrk>
  if(p == (char*)-1)
 5b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 5ba:	74 18                	je     5d4 <malloc+0x78>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5bc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 5bf:	83 c0 08             	add    $0x8,%eax
 5c2:	89 04 24             	mov    %eax,(%esp)
 5c5:	e8 12 ff ff ff       	call   4dc <free>
  return freep;
 5ca:	8b 0d 68 09 00 00    	mov    0x968,%ecx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 5d0:	85 c9                	test   %ecx,%ecx
 5d2:	75 be                	jne    592 <malloc+0x36>
        return 0;
 5d4:	31 c0                	xor    %eax,%eax
  }
}
 5d6:	83 c4 1c             	add    $0x1c,%esp
 5d9:	5b                   	pop    %ebx
 5da:	5e                   	pop    %esi
 5db:	5f                   	pop    %edi
 5dc:	5d                   	pop    %ebp
 5dd:	c3                   	ret    
 5de:	66 90                	xchg   %ax,%ax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 5e0:	b8 00 80 00 00       	mov    $0x8000,%eax
    nu = 4096;
 5e5:	be 00 10 00 00       	mov    $0x1000,%esi
 5ea:	eb c3                	jmp    5af <malloc+0x53>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 5ec:	39 d3                	cmp    %edx,%ebx
 5ee:	74 1c                	je     60c <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 5f0:	29 da                	sub    %ebx,%edx
 5f2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 5f5:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 5f8:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 5fb:	89 0d 68 09 00 00    	mov    %ecx,0x968
      return (void*)(p + 1);
 601:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 604:	83 c4 1c             	add    $0x1c,%esp
 607:	5b                   	pop    %ebx
 608:	5e                   	pop    %esi
 609:	5f                   	pop    %edi
 60a:	5d                   	pop    %ebp
 60b:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 60c:	8b 10                	mov    (%eax),%edx
 60e:	89 11                	mov    %edx,(%ecx)
 610:	eb e9                	jmp    5fb <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 612:	c7 05 68 09 00 00 6c 	movl   $0x96c,0x968
 619:	09 00 00 
 61c:	c7 05 6c 09 00 00 6c 	movl   $0x96c,0x96c
 623:	09 00 00 
    base.s.size = 0;
 626:	c7 05 70 09 00 00 00 	movl   $0x0,0x970
 62d:	00 00 00 
 630:	b8 6c 09 00 00       	mov    $0x96c,%eax
 635:	e9 4c ff ff ff       	jmp    586 <malloc+0x2a>
