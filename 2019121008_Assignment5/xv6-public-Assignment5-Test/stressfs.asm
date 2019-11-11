
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	81 ec 30 02 00 00    	sub    $0x230,%esp
  int fd, i;
  char path[] = "stressfs0";
   f:	8d 9c 24 26 02 00 00 	lea    0x226(%esp),%ebx
  16:	be f9 06 00 00       	mov    $0x6f9,%esi
  1b:	b9 0a 00 00 00       	mov    $0xa,%ecx
  20:	89 df                	mov    %ebx,%edi
  22:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  char data[512];

  printf(1, "stressfs starting\n");
  24:	c7 44 24 04 d6 06 00 	movl   $0x6d6,0x4(%esp)
  2b:	00 
  2c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  33:	e8 0c 04 00 00       	call   444 <printf>
  memset(data, 'a', sizeof(data));
  38:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  3f:	00 
  40:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  47:	00 
  48:	8d 7c 24 26          	lea    0x26(%esp),%edi
  4c:	89 3c 24             	mov    %edi,(%esp)
  4f:	e8 60 01 00 00       	call   1b4 <memset>

  for(i = 0; i < 4; i++)
  54:	31 f6                	xor    %esi,%esi
    if(fork() > 0)
  56:	e8 91 02 00 00       	call   2ec <fork>
  5b:	85 c0                	test   %eax,%eax
  5d:	0f 8f c6 00 00 00    	jg     129 <main+0x129>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  63:	46                   	inc    %esi
  64:	83 fe 04             	cmp    $0x4,%esi
  67:	75 ed                	jne    56 <main+0x56>
  69:	b0 04                	mov    $0x4,%al
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
  6b:	89 74 24 08          	mov    %esi,0x8(%esp)
  6f:	c7 44 24 04 e9 06 00 	movl   $0x6e9,0x4(%esp)
  76:	00 
  77:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7e:	88 44 24 18          	mov    %al,0x18(%esp)
  82:	e8 bd 03 00 00       	call   444 <printf>

  path[8] += i;
  87:	8a 44 24 18          	mov    0x18(%esp),%al
  8b:	00 84 24 2e 02 00 00 	add    %al,0x22e(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  92:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  99:	00 
  9a:	89 1c 24             	mov    %ebx,(%esp)
  9d:	e8 92 02 00 00       	call   334 <open>
  a2:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  a6:	be 14 00 00 00       	mov    $0x14,%esi
  ab:	90                   	nop
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  ac:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  b3:	00 
  b4:	89 7c 24 04          	mov    %edi,0x4(%esp)
  b8:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  bc:	89 04 24             	mov    %eax,(%esp)
  bf:	e8 50 02 00 00       	call   314 <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
  c4:	4e                   	dec    %esi
  c5:	75 e5                	jne    ac <main+0xac>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
  c7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  cb:	89 04 24             	mov    %eax,(%esp)
  ce:	e8 49 02 00 00       	call   31c <close>

  printf(1, "read\n");
  d3:	c7 44 24 04 f3 06 00 	movl   $0x6f3,0x4(%esp)
  da:	00 
  db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e2:	e8 5d 03 00 00       	call   444 <printf>

  fd = open(path, O_RDONLY);
  e7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  ee:	00 
  ef:	89 1c 24             	mov    %ebx,(%esp)
  f2:	e8 3d 02 00 00       	call   334 <open>
  f7:	89 c6                	mov    %eax,%esi
  f9:	bb 14 00 00 00       	mov    $0x14,%ebx
  fe:	66 90                	xchg   %ax,%ax
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 100:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 107:	00 
 108:	89 7c 24 04          	mov    %edi,0x4(%esp)
 10c:	89 34 24             	mov    %esi,(%esp)
 10f:	e8 f8 01 00 00       	call   30c <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 114:	4b                   	dec    %ebx
 115:	75 e9                	jne    100 <main+0x100>
    read(fd, data, sizeof(data));
  close(fd);
 117:	89 34 24             	mov    %esi,(%esp)
 11a:	e8 fd 01 00 00       	call   31c <close>

  wait();
 11f:	e8 d8 01 00 00       	call   2fc <wait>

  exit();
 124:	e8 cb 01 00 00       	call   2f4 <exit>

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
    if(fork() > 0)
 129:	89 f0                	mov    %esi,%eax
 12b:	e9 3b ff ff ff       	jmp    6b <main+0x6b>

00000130 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 13a:	31 d2                	xor    %edx,%edx
 13c:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
 13f:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 142:	42                   	inc    %edx
 143:	84 c9                	test   %cl,%cl
 145:	75 f5                	jne    13c <strcpy+0xc>
    ;
  return os;
}
 147:	5b                   	pop    %ebx
 148:	5d                   	pop    %ebp
 149:	c3                   	ret    
 14a:	66 90                	xchg   %ax,%ax

0000014c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
 14f:	56                   	push   %esi
 150:	53                   	push   %ebx
 151:	8b 4d 08             	mov    0x8(%ebp),%ecx
 154:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 157:	8a 01                	mov    (%ecx),%al
 159:	8a 1a                	mov    (%edx),%bl
 15b:	84 c0                	test   %al,%al
 15d:	74 1d                	je     17c <strcmp+0x30>
 15f:	38 d8                	cmp    %bl,%al
 161:	74 0c                	je     16f <strcmp+0x23>
 163:	eb 23                	jmp    188 <strcmp+0x3c>
 165:	8d 76 00             	lea    0x0(%esi),%esi
 168:	41                   	inc    %ecx
 169:	38 d8                	cmp    %bl,%al
 16b:	75 1b                	jne    188 <strcmp+0x3c>
    p++, q++;
 16d:	89 f2                	mov    %esi,%edx
 16f:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 172:	8a 41 01             	mov    0x1(%ecx),%al
 175:	8a 5a 01             	mov    0x1(%edx),%bl
 178:	84 c0                	test   %al,%al
 17a:	75 ec                	jne    168 <strcmp+0x1c>
 17c:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 17e:	0f b6 db             	movzbl %bl,%ebx
 181:	29 d8                	sub    %ebx,%eax
}
 183:	5b                   	pop    %ebx
 184:	5e                   	pop    %esi
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 188:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 18b:	0f b6 db             	movzbl %bl,%ebx
 18e:	29 d8                	sub    %ebx,%eax
}
 190:	5b                   	pop    %ebx
 191:	5e                   	pop    %esi
 192:	5d                   	pop    %ebp
 193:	c3                   	ret    

00000194 <strlen>:

uint
strlen(const char *s)
{
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 19a:	80 39 00             	cmpb   $0x0,(%ecx)
 19d:	74 10                	je     1af <strlen+0x1b>
 19f:	31 d2                	xor    %edx,%edx
 1a1:	8d 76 00             	lea    0x0(%esi),%esi
 1a4:	42                   	inc    %edx
 1a5:	89 d0                	mov    %edx,%eax
 1a7:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1ab:	75 f7                	jne    1a4 <strlen+0x10>
    ;
  return n;
}
 1ad:	5d                   	pop    %ebp
 1ae:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 1af:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    
 1b3:	90                   	nop

000001b4 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	57                   	push   %edi
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1bb:	89 d7                	mov    %edx,%edi
 1bd:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c3:	fc                   	cld    
 1c4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c6:	89 d0                	mov    %edx,%eax
 1c8:	5f                   	pop    %edi
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    
 1cb:	90                   	nop

000001cc <strchr>:

char*
strchr(const char *s, char c)
{
 1cc:	55                   	push   %ebp
 1cd:	89 e5                	mov    %esp,%ebp
 1cf:	8b 45 08             	mov    0x8(%ebp),%eax
 1d2:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
 1d5:	8a 10                	mov    (%eax),%dl
 1d7:	84 d2                	test   %dl,%dl
 1d9:	75 0d                	jne    1e8 <strchr+0x1c>
 1db:	eb 13                	jmp    1f0 <strchr+0x24>
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	8a 50 01             	mov    0x1(%eax),%dl
 1e3:	84 d2                	test   %dl,%dl
 1e5:	74 09                	je     1f0 <strchr+0x24>
 1e7:	40                   	inc    %eax
    if(*s == c)
 1e8:	38 ca                	cmp    %cl,%dl
 1ea:	75 f4                	jne    1e0 <strchr+0x14>
      return (char*)s;
  return 0;
}
 1ec:	5d                   	pop    %ebp
 1ed:	c3                   	ret    
 1ee:	66 90                	xchg   %ax,%ax
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 1f0:	31 c0                	xor    %eax,%eax
}
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    

000001f4 <gets>:

char*
gets(char *buf, int max)
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	57                   	push   %edi
 1f8:	56                   	push   %esi
 1f9:	53                   	push   %ebx
 1fa:	83 ec 2c             	sub    $0x2c,%esp
 1fd:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 200:	31 f6                	xor    %esi,%esi
 202:	eb 30                	jmp    234 <gets+0x40>
    cc = read(0, &c, 1);
 204:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 20b:	00 
 20c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 20f:	89 44 24 04          	mov    %eax,0x4(%esp)
 213:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 21a:	e8 ed 00 00 00       	call   30c <read>
    if(cc < 1)
 21f:	85 c0                	test   %eax,%eax
 221:	7e 19                	jle    23c <gets+0x48>
      break;
    buf[i++] = c;
 223:	8a 45 e7             	mov    -0x19(%ebp),%al
 226:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22a:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 22c:	3c 0a                	cmp    $0xa,%al
 22e:	74 0c                	je     23c <gets+0x48>
 230:	3c 0d                	cmp    $0xd,%al
 232:	74 08                	je     23c <gets+0x48>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 234:	8d 5e 01             	lea    0x1(%esi),%ebx
 237:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 23a:	7c c8                	jl     204 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 23c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 240:	89 f8                	mov    %edi,%eax
 242:	83 c4 2c             	add    $0x2c,%esp
 245:	5b                   	pop    %ebx
 246:	5e                   	pop    %esi
 247:	5f                   	pop    %edi
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    
 24a:	66 90                	xchg   %ax,%ax

0000024c <stat>:

int
stat(const char *n, struct stat *st)
{
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
 24f:	56                   	push   %esi
 250:	53                   	push   %ebx
 251:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 254:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 25b:	00 
 25c:	8b 45 08             	mov    0x8(%ebp),%eax
 25f:	89 04 24             	mov    %eax,(%esp)
 262:	e8 cd 00 00 00       	call   334 <open>
 267:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 269:	85 c0                	test   %eax,%eax
 26b:	78 23                	js     290 <stat+0x44>
    return -1;
  r = fstat(fd, st);
 26d:	8b 45 0c             	mov    0xc(%ebp),%eax
 270:	89 44 24 04          	mov    %eax,0x4(%esp)
 274:	89 1c 24             	mov    %ebx,(%esp)
 277:	e8 d0 00 00 00       	call   34c <fstat>
 27c:	89 c6                	mov    %eax,%esi
  close(fd);
 27e:	89 1c 24             	mov    %ebx,(%esp)
 281:	e8 96 00 00 00       	call   31c <close>
  return r;
}
 286:	89 f0                	mov    %esi,%eax
 288:	83 c4 10             	add    $0x10,%esp
 28b:	5b                   	pop    %ebx
 28c:	5e                   	pop    %esi
 28d:	5d                   	pop    %ebp
 28e:	c3                   	ret    
 28f:	90                   	nop
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 290:	be ff ff ff ff       	mov    $0xffffffff,%esi
 295:	eb ef                	jmp    286 <stat+0x3a>
 297:	90                   	nop

00000298 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 298:	55                   	push   %ebp
 299:	89 e5                	mov    %esp,%ebp
 29b:	53                   	push   %ebx
 29c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 29f:	8a 11                	mov    (%ecx),%dl
 2a1:	8d 42 d0             	lea    -0x30(%edx),%eax
 2a4:	3c 09                	cmp    $0x9,%al
 2a6:	b8 00 00 00 00       	mov    $0x0,%eax
 2ab:	77 18                	ja     2c5 <atoi+0x2d>
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    n = n*10 + *s++ - '0';
 2b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2b3:	0f be d2             	movsbl %dl,%edx
 2b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 2ba:	41                   	inc    %ecx
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2bb:	8a 11                	mov    (%ecx),%dl
 2bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2c0:	80 fb 09             	cmp    $0x9,%bl
 2c3:	76 eb                	jbe    2b0 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 2c5:	5b                   	pop    %ebx
 2c6:	5d                   	pop    %ebp
 2c7:	c3                   	ret    

000002c8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2c8:	55                   	push   %ebp
 2c9:	89 e5                	mov    %esp,%ebp
 2cb:	56                   	push   %esi
 2cc:	53                   	push   %ebx
 2cd:	8b 45 08             	mov    0x8(%ebp),%eax
 2d0:	8b 75 0c             	mov    0xc(%ebp),%esi
 2d3:	8b 5d 10             	mov    0x10(%ebp),%ebx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2d6:	85 db                	test   %ebx,%ebx
 2d8:	7e 0d                	jle    2e7 <memmove+0x1f>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
 2da:	31 d2                	xor    %edx,%edx
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 2dc:	8a 0c 16             	mov    (%esi,%edx,1),%cl
 2df:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2e2:	42                   	inc    %edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2e3:	39 da                	cmp    %ebx,%edx
 2e5:	75 f5                	jne    2dc <memmove+0x14>
    *dst++ = *src++;
  return vdst;
}
 2e7:	5b                   	pop    %ebx
 2e8:	5e                   	pop    %esi
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret    
 2eb:	90                   	nop

000002ec <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ec:	b8 01 00 00 00       	mov    $0x1,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <exit>:
SYSCALL(exit)
 2f4:	b8 02 00 00 00       	mov    $0x2,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <wait>:
SYSCALL(wait)
 2fc:	b8 03 00 00 00       	mov    $0x3,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <pipe>:
SYSCALL(pipe)
 304:	b8 04 00 00 00       	mov    $0x4,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <read>:
SYSCALL(read)
 30c:	b8 05 00 00 00       	mov    $0x5,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <write>:
SYSCALL(write)
 314:	b8 10 00 00 00       	mov    $0x10,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <close>:
SYSCALL(close)
 31c:	b8 15 00 00 00       	mov    $0x15,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <kill>:
SYSCALL(kill)
 324:	b8 06 00 00 00       	mov    $0x6,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <exec>:
SYSCALL(exec)
 32c:	b8 07 00 00 00       	mov    $0x7,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <open>:
SYSCALL(open)
 334:	b8 0f 00 00 00       	mov    $0xf,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <mknod>:
SYSCALL(mknod)
 33c:	b8 11 00 00 00       	mov    $0x11,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <unlink>:
SYSCALL(unlink)
 344:	b8 12 00 00 00       	mov    $0x12,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <fstat>:
SYSCALL(fstat)
 34c:	b8 08 00 00 00       	mov    $0x8,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <link>:
SYSCALL(link)
 354:	b8 13 00 00 00       	mov    $0x13,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <mkdir>:
SYSCALL(mkdir)
 35c:	b8 14 00 00 00       	mov    $0x14,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <chdir>:
SYSCALL(chdir)
 364:	b8 09 00 00 00       	mov    $0x9,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <dup>:
SYSCALL(dup)
 36c:	b8 0a 00 00 00       	mov    $0xa,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <getpid>:
SYSCALL(getpid)
 374:	b8 0b 00 00 00       	mov    $0xb,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <sbrk>:
SYSCALL(sbrk)
 37c:	b8 0c 00 00 00       	mov    $0xc,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <sleep>:
SYSCALL(sleep)
 384:	b8 0d 00 00 00       	mov    $0xd,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <uptime>:
SYSCALL(uptime)
 38c:	b8 0e 00 00 00       	mov    $0xe,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <waitx>:
SYSCALL(waitx)      //BVK Commit Assignment 5 Q1
 394:	b8 16 00 00 00       	mov    $0x16,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <chprty>:
SYSCALL(chprty)
 39c:	b8 17 00 00 00       	mov    $0x17,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <ps>:
SYSCALL(ps)
 3a4:	b8 18 00 00 00       	mov    $0x18,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <getpinfo>:
SYSCALL(getpinfo)
 3ac:	b8 19 00 00 00       	mov    $0x19,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	83 ec 28             	sub    $0x28,%esp
 3ba:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3bd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3c4:	00 
 3c5:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3c8:	89 54 24 04          	mov    %edx,0x4(%esp)
 3cc:	89 04 24             	mov    %eax,(%esp)
 3cf:	e8 40 ff ff ff       	call   314 <write>
}
 3d4:	c9                   	leave  
 3d5:	c3                   	ret    
 3d6:	66 90                	xchg   %ax,%ax

000003d8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3d8:	55                   	push   %ebp
 3d9:	89 e5                	mov    %esp,%ebp
 3db:	57                   	push   %edi
 3dc:	56                   	push   %esi
 3dd:	53                   	push   %ebx
 3de:	83 ec 1c             	sub    $0x1c,%esp
 3e1:	89 c6                	mov    %eax,%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3e3:	89 d0                	mov    %edx,%eax
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3e8:	85 db                	test   %ebx,%ebx
 3ea:	74 04                	je     3f0 <printint+0x18>
 3ec:	85 d2                	test   %edx,%edx
 3ee:	78 4a                	js     43a <printint+0x62>
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3f0:	31 ff                	xor    %edi,%edi
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 3f2:	31 db                	xor    %ebx,%ebx
 3f4:	eb 04                	jmp    3fa <printint+0x22>
 3f6:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 3f8:	89 d3                	mov    %edx,%ebx
 3fa:	31 d2                	xor    %edx,%edx
 3fc:	f7 f1                	div    %ecx
 3fe:	8a 92 0a 07 00 00    	mov    0x70a(%edx),%dl
 404:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
 408:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
 40b:	85 c0                	test   %eax,%eax
 40d:	75 e9                	jne    3f8 <printint+0x20>
  if(neg)
 40f:	85 ff                	test   %edi,%edi
 411:	74 08                	je     41b <printint+0x43>
    buf[i++] = '-';
 413:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
 418:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
 41b:	8d 5a ff             	lea    -0x1(%edx),%ebx
 41e:	66 90                	xchg   %ax,%ax
    putc(fd, buf[i]);
 420:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 425:	89 f0                	mov    %esi,%eax
 427:	e8 88 ff ff ff       	call   3b4 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 42c:	4b                   	dec    %ebx
 42d:	83 fb ff             	cmp    $0xffffffff,%ebx
 430:	75 ee                	jne    420 <printint+0x48>
    putc(fd, buf[i]);
}
 432:	83 c4 1c             	add    $0x1c,%esp
 435:	5b                   	pop    %ebx
 436:	5e                   	pop    %esi
 437:	5f                   	pop    %edi
 438:	5d                   	pop    %ebp
 439:	c3                   	ret    
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 43a:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 43c:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
 441:	eb af                	jmp    3f2 <printint+0x1a>
 443:	90                   	nop

00000444 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	57                   	push   %edi
 448:	56                   	push   %esi
 449:	53                   	push   %ebx
 44a:	83 ec 2c             	sub    $0x2c,%esp
 44d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 450:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 453:	8a 0b                	mov    (%ebx),%cl
 455:	84 c9                	test   %cl,%cl
 457:	74 7b                	je     4d4 <printf+0x90>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 459:	8d 45 10             	lea    0x10(%ebp),%eax
 45c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 45f:	31 f6                	xor    %esi,%esi
 461:	eb 17                	jmp    47a <printf+0x36>
 463:	90                   	nop
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 464:	83 f9 25             	cmp    $0x25,%ecx
 467:	74 73                	je     4dc <printf+0x98>
        state = '%';
      } else {
        putc(fd, c);
 469:	0f be d1             	movsbl %cl,%edx
 46c:	89 f8                	mov    %edi,%eax
 46e:	e8 41 ff ff ff       	call   3b4 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 473:	43                   	inc    %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 474:	8a 0b                	mov    (%ebx),%cl
 476:	84 c9                	test   %cl,%cl
 478:	74 5a                	je     4d4 <printf+0x90>
    c = fmt[i] & 0xff;
 47a:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 47d:	85 f6                	test   %esi,%esi
 47f:	74 e3                	je     464 <printf+0x20>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 481:	83 fe 25             	cmp    $0x25,%esi
 484:	75 ed                	jne    473 <printf+0x2f>
      if(c == 'd'){
 486:	83 f9 64             	cmp    $0x64,%ecx
 489:	0f 84 c1 00 00 00    	je     550 <printf+0x10c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 48f:	83 f9 78             	cmp    $0x78,%ecx
 492:	74 50                	je     4e4 <printf+0xa0>
 494:	83 f9 70             	cmp    $0x70,%ecx
 497:	74 4b                	je     4e4 <printf+0xa0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 499:	83 f9 73             	cmp    $0x73,%ecx
 49c:	74 6a                	je     508 <printf+0xc4>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 49e:	83 f9 63             	cmp    $0x63,%ecx
 4a1:	0f 84 91 00 00 00    	je     538 <printf+0xf4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
        putc(fd, c);
 4a7:	ba 25 00 00 00       	mov    $0x25,%edx
 4ac:	89 f8                	mov    %edi,%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4ae:	83 f9 25             	cmp    $0x25,%ecx
 4b1:	74 10                	je     4c3 <printf+0x7f>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 4b3:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 4b6:	e8 f9 fe ff ff       	call   3b4 <putc>
        putc(fd, c);
 4bb:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 4be:	0f be d1             	movsbl %cl,%edx
 4c1:	89 f8                	mov    %edi,%eax
 4c3:	e8 ec fe ff ff       	call   3b4 <putc>
      }
      state = 0;
 4c8:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4ca:	43                   	inc    %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4cb:	8a 0b                	mov    (%ebx),%cl
 4cd:	84 c9                	test   %cl,%cl
 4cf:	75 a9                	jne    47a <printf+0x36>
 4d1:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4d4:	83 c4 2c             	add    $0x2c,%esp
 4d7:	5b                   	pop    %ebx
 4d8:	5e                   	pop    %esi
 4d9:	5f                   	pop    %edi
 4da:	5d                   	pop    %ebp
 4db:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4dc:	be 25 00 00 00       	mov    $0x25,%esi
 4e1:	eb 90                	jmp    473 <printf+0x2f>
 4e3:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4e4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4eb:	b9 10 00 00 00       	mov    $0x10,%ecx
 4f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4f3:	8b 10                	mov    (%eax),%edx
 4f5:	89 f8                	mov    %edi,%eax
 4f7:	e8 dc fe ff ff       	call   3d8 <printint>
        ap++;
 4fc:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 500:	31 f6                	xor    %esi,%esi
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 502:	e9 6c ff ff ff       	jmp    473 <printf+0x2f>
 507:	90                   	nop
      } else if(c == 's'){
        s = (char*)*ap;
 508:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 50b:	8b 30                	mov    (%eax),%esi
        ap++;
 50d:	83 c0 04             	add    $0x4,%eax
 510:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 513:	85 f6                	test   %esi,%esi
 515:	74 5a                	je     571 <printf+0x12d>
          s = "(null)";
        while(*s != 0){
 517:	8a 16                	mov    (%esi),%dl
 519:	84 d2                	test   %dl,%dl
 51b:	74 14                	je     531 <printf+0xed>
 51d:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 520:	0f be d2             	movsbl %dl,%edx
 523:	89 f8                	mov    %edi,%eax
 525:	e8 8a fe ff ff       	call   3b4 <putc>
          s++;
 52a:	46                   	inc    %esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 52b:	8a 16                	mov    (%esi),%dl
 52d:	84 d2                	test   %dl,%dl
 52f:	75 ef                	jne    520 <printf+0xdc>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 531:	31 f6                	xor    %esi,%esi
 533:	e9 3b ff ff ff       	jmp    473 <printf+0x2f>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 538:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 53b:	0f be 10             	movsbl (%eax),%edx
 53e:	89 f8                	mov    %edi,%eax
 540:	e8 6f fe ff ff       	call   3b4 <putc>
        ap++;
 545:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 549:	31 f6                	xor    %esi,%esi
 54b:	e9 23 ff ff ff       	jmp    473 <printf+0x2f>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 550:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 557:	b1 0a                	mov    $0xa,%cl
 559:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 55c:	8b 10                	mov    (%eax),%edx
 55e:	89 f8                	mov    %edi,%eax
 560:	e8 73 fe ff ff       	call   3d8 <printint>
        ap++;
 565:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 569:	66 31 f6             	xor    %si,%si
 56c:	e9 02 ff ff ff       	jmp    473 <printf+0x2f>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 571:	be 03 07 00 00       	mov    $0x703,%esi
 576:	eb 9f                	jmp    517 <printf+0xd3>

00000578 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 578:	55                   	push   %ebp
 579:	89 e5                	mov    %esp,%ebp
 57b:	57                   	push   %edi
 57c:	56                   	push   %esi
 57d:	53                   	push   %ebx
 57e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 581:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 584:	a1 c0 09 00 00       	mov    0x9c0,%eax
 589:	8d 76 00             	lea    0x0(%esi),%esi
 58c:	8b 10                	mov    (%eax),%edx
 58e:	39 c8                	cmp    %ecx,%eax
 590:	73 04                	jae    596 <free+0x1e>
 592:	39 d1                	cmp    %edx,%ecx
 594:	72 12                	jb     5a8 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 596:	39 d0                	cmp    %edx,%eax
 598:	72 08                	jb     5a2 <free+0x2a>
 59a:	39 c8                	cmp    %ecx,%eax
 59c:	72 0a                	jb     5a8 <free+0x30>
 59e:	39 d1                	cmp    %edx,%ecx
 5a0:	72 06                	jb     5a8 <free+0x30>
static Header base;
static Header *freep;

void
free(void *ap)
{
 5a2:	89 d0                	mov    %edx,%eax
 5a4:	eb e6                	jmp    58c <free+0x14>
 5a6:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 5a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ae:	39 d7                	cmp    %edx,%edi
 5b0:	74 19                	je     5cb <free+0x53>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5b5:	8b 50 04             	mov    0x4(%eax),%edx
 5b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5bb:	39 f1                	cmp    %esi,%ecx
 5bd:	74 23                	je     5e2 <free+0x6a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5bf:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5c1:	a3 c0 09 00 00       	mov    %eax,0x9c0
}
 5c6:	5b                   	pop    %ebx
 5c7:	5e                   	pop    %esi
 5c8:	5f                   	pop    %edi
 5c9:	5d                   	pop    %ebp
 5ca:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 5cb:	03 72 04             	add    0x4(%edx),%esi
 5ce:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5d1:	8b 10                	mov    (%eax),%edx
 5d3:	8b 12                	mov    (%edx),%edx
 5d5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5d8:	8b 50 04             	mov    0x4(%eax),%edx
 5db:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5de:	39 f1                	cmp    %esi,%ecx
 5e0:	75 dd                	jne    5bf <free+0x47>
    p->s.size += bp->s.size;
 5e2:	03 53 fc             	add    -0x4(%ebx),%edx
 5e5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5e8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5eb:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 5ed:	a3 c0 09 00 00       	mov    %eax,0x9c0
}
 5f2:	5b                   	pop    %ebx
 5f3:	5e                   	pop    %esi
 5f4:	5f                   	pop    %edi
 5f5:	5d                   	pop    %ebp
 5f6:	c3                   	ret    
 5f7:	90                   	nop

000005f8 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 5f8:	55                   	push   %ebp
 5f9:	89 e5                	mov    %esp,%ebp
 5fb:	57                   	push   %edi
 5fc:	56                   	push   %esi
 5fd:	53                   	push   %ebx
 5fe:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 601:	8b 5d 08             	mov    0x8(%ebp),%ebx
 604:	83 c3 07             	add    $0x7,%ebx
 607:	c1 eb 03             	shr    $0x3,%ebx
 60a:	43                   	inc    %ebx
  if((prevp = freep) == 0){
 60b:	8b 0d c0 09 00 00    	mov    0x9c0,%ecx
 611:	85 c9                	test   %ecx,%ecx
 613:	0f 84 95 00 00 00    	je     6ae <malloc+0xb6>
 619:	8b 01                	mov    (%ecx),%eax
 61b:	8b 50 04             	mov    0x4(%eax),%edx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 61e:	39 da                	cmp    %ebx,%edx
 620:	73 66                	jae    688 <malloc+0x90>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 622:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
 629:	eb 0c                	jmp    637 <malloc+0x3f>
 62b:	90                   	nop
    }
    if(p == freep)
 62c:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 62e:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 630:	8b 50 04             	mov    0x4(%eax),%edx
 633:	39 d3                	cmp    %edx,%ebx
 635:	76 51                	jbe    688 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 637:	3b 05 c0 09 00 00    	cmp    0x9c0,%eax
 63d:	75 ed                	jne    62c <malloc+0x34>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 63f:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 645:	76 35                	jbe    67c <malloc+0x84>
 647:	89 f8                	mov    %edi,%eax
 649:	89 de                	mov    %ebx,%esi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 64b:	89 04 24             	mov    %eax,(%esp)
 64e:	e8 29 fd ff ff       	call   37c <sbrk>
  if(p == (char*)-1)
 653:	83 f8 ff             	cmp    $0xffffffff,%eax
 656:	74 18                	je     670 <malloc+0x78>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 658:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 65b:	83 c0 08             	add    $0x8,%eax
 65e:	89 04 24             	mov    %eax,(%esp)
 661:	e8 12 ff ff ff       	call   578 <free>
  return freep;
 666:	8b 0d c0 09 00 00    	mov    0x9c0,%ecx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 66c:	85 c9                	test   %ecx,%ecx
 66e:	75 be                	jne    62e <malloc+0x36>
        return 0;
 670:	31 c0                	xor    %eax,%eax
  }
}
 672:	83 c4 1c             	add    $0x1c,%esp
 675:	5b                   	pop    %ebx
 676:	5e                   	pop    %esi
 677:	5f                   	pop    %edi
 678:	5d                   	pop    %ebp
 679:	c3                   	ret    
 67a:	66 90                	xchg   %ax,%ax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 67c:	b8 00 80 00 00       	mov    $0x8000,%eax
    nu = 4096;
 681:	be 00 10 00 00       	mov    $0x1000,%esi
 686:	eb c3                	jmp    64b <malloc+0x53>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 688:	39 d3                	cmp    %edx,%ebx
 68a:	74 1c                	je     6a8 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 68c:	29 da                	sub    %ebx,%edx
 68e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 691:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 694:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 697:	89 0d c0 09 00 00    	mov    %ecx,0x9c0
      return (void*)(p + 1);
 69d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6a0:	83 c4 1c             	add    $0x1c,%esp
 6a3:	5b                   	pop    %ebx
 6a4:	5e                   	pop    %esi
 6a5:	5f                   	pop    %edi
 6a6:	5d                   	pop    %ebp
 6a7:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 6a8:	8b 10                	mov    (%eax),%edx
 6aa:	89 11                	mov    %edx,(%ecx)
 6ac:	eb e9                	jmp    697 <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 6ae:	c7 05 c0 09 00 00 c4 	movl   $0x9c4,0x9c0
 6b5:	09 00 00 
 6b8:	c7 05 c4 09 00 00 c4 	movl   $0x9c4,0x9c4
 6bf:	09 00 00 
    base.s.size = 0;
 6c2:	c7 05 c8 09 00 00 00 	movl   $0x0,0x9c8
 6c9:	00 00 00 
 6cc:	b8 c4 09 00 00       	mov    $0x9c4,%eax
 6d1:	e9 4c ff ff ff       	jmp    622 <malloc+0x2a>
