
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	83 ec 20             	sub    $0x20,%esp
   c:	8b 7d 08             	mov    0x8(%ebp),%edi
   f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  int fd, i;
  char *pattern;

  if(argc <= 1){
  12:	83 ff 01             	cmp    $0x1,%edi
  15:	0f 8e 8c 00 00 00    	jle    a7 <main+0xa7>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  1b:	8b 53 04             	mov    0x4(%ebx),%edx
  1e:	89 54 24 1c          	mov    %edx,0x1c(%esp)

  if(argc <= 2){
  22:	83 ff 02             	cmp    $0x2,%edi
  25:	74 6b                	je     92 <main+0x92>
    }
  }
}

int
main(int argc, char *argv[])
  27:	83 c3 08             	add    $0x8,%ebx
  2a:	be 02 00 00 00       	mov    $0x2,%esi
  2f:	90                   	nop
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  37:	00 
  38:	8b 03                	mov    (%ebx),%eax
  3a:	89 04 24             	mov    %eax,(%esp)
  3d:	e8 96 04 00 00       	call   4d8 <open>
  42:	85 c0                	test   %eax,%eax
  44:	78 2d                	js     73 <main+0x73>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  46:	89 44 24 04          	mov    %eax,0x4(%esp)
  4a:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  4e:	89 14 24             	mov    %edx,(%esp)
  51:	89 44 24 18          	mov    %eax,0x18(%esp)
  55:	e8 86 01 00 00       	call   1e0 <grep>
    close(fd);
  5a:	8b 44 24 18          	mov    0x18(%esp),%eax
  5e:	89 04 24             	mov    %eax,(%esp)
  61:	e8 5a 04 00 00       	call   4c0 <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  66:	46                   	inc    %esi
  67:	83 c3 04             	add    $0x4,%ebx
  6a:	39 f7                	cmp    %esi,%edi
  6c:	7f c2                	jg     30 <main+0x30>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
  6e:	e8 25 04 00 00       	call   498 <exit>
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
  73:	8b 03                	mov    (%ebx),%eax
  75:	89 44 24 08          	mov    %eax,0x8(%esp)
  79:	c7 44 24 04 9c 08 00 	movl   $0x89c,0x4(%esp)
  80:	00 
  81:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  88:	e8 5b 05 00 00       	call   5e8 <printf>
      exit();
  8d:	e8 06 04 00 00       	call   498 <exit>
    exit();
  }
  pattern = argv[1];

  if(argc <= 2){
    grep(pattern, 0);
  92:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  99:	00 
  9a:	89 14 24             	mov    %edx,(%esp)
  9d:	e8 3e 01 00 00       	call   1e0 <grep>
    exit();
  a2:	e8 f1 03 00 00       	call   498 <exit>
{
  int fd, i;
  char *pattern;

  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
  a7:	c7 44 24 04 7c 08 00 	movl   $0x87c,0x4(%esp)
  ae:	00 
  af:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  b6:	e8 2d 05 00 00       	call   5e8 <printf>
    exit();
  bb:	e8 d8 03 00 00       	call   498 <exit>

000000c0 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	56                   	push   %esi
  c5:	53                   	push   %ebx
  c6:	83 ec 1c             	sub    $0x1c,%esp
  c9:	8b 75 08             	mov    0x8(%ebp),%esi
  cc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cf:	8b 5d 10             	mov    0x10(%ebp),%ebx
  d2:	66 90                	xchg   %ax,%ax
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  d4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  d8:	89 3c 24             	mov    %edi,(%esp)
  db:	e8 34 00 00 00       	call   114 <matchhere>
  e0:	85 c0                	test   %eax,%eax
  e2:	75 20                	jne    104 <matchstar+0x44>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  e4:	8a 03                	mov    (%ebx),%al
  e6:	84 c0                	test   %al,%al
  e8:	74 0d                	je     f7 <matchstar+0x37>
  ea:	43                   	inc    %ebx
  eb:	0f be c0             	movsbl %al,%eax
  ee:	39 f0                	cmp    %esi,%eax
  f0:	74 e2                	je     d4 <matchstar+0x14>
  f2:	83 fe 2e             	cmp    $0x2e,%esi
  f5:	74 dd                	je     d4 <matchstar+0x14>
  return 0;
  f7:	31 c0                	xor    %eax,%eax
}
  f9:	83 c4 1c             	add    $0x1c,%esp
  fc:	5b                   	pop    %ebx
  fd:	5e                   	pop    %esi
  fe:	5f                   	pop    %edi
  ff:	5d                   	pop    %ebp
 100:	c3                   	ret    
 101:	8d 76 00             	lea    0x0(%esi),%esi
// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
 104:	b8 01 00 00 00       	mov    $0x1,%eax
  }while(*text!='\0' && (*text++==c || c=='.'));
  return 0;
}
 109:	83 c4 1c             	add    $0x1c,%esp
 10c:	5b                   	pop    %ebx
 10d:	5e                   	pop    %esi
 10e:	5f                   	pop    %edi
 10f:	5d                   	pop    %ebp
 110:	c3                   	ret    
 111:	8d 76 00             	lea    0x0(%esi),%esi

00000114 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	53                   	push   %ebx
 118:	83 ec 14             	sub    $0x14,%esp
 11b:	8b 55 08             	mov    0x8(%ebp),%edx
 11e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  if(re[0] == '\0')
 121:	8a 02                	mov    (%edx),%al
 123:	84 c0                	test   %al,%al
 125:	75 1c                	jne    143 <matchhere+0x2f>
 127:	eb 3f                	jmp    168 <matchhere+0x54>
 129:	8d 76 00             	lea    0x0(%esi),%esi
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 12c:	8a 19                	mov    (%ecx),%bl
 12e:	84 db                	test   %bl,%bl
 130:	74 2e                	je     160 <matchhere+0x4c>
 132:	3c 2e                	cmp    $0x2e,%al
 134:	74 04                	je     13a <matchhere+0x26>
 136:	38 d8                	cmp    %bl,%al
 138:	75 26                	jne    160 <matchhere+0x4c>
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
 13a:	8a 42 01             	mov    0x1(%edx),%al
 13d:	84 c0                	test   %al,%al
 13f:	74 27                	je     168 <matchhere+0x54>
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
 141:	41                   	inc    %ecx
 142:	42                   	inc    %edx
// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
 143:	8a 5a 01             	mov    0x1(%edx),%bl
 146:	80 fb 2a             	cmp    $0x2a,%bl
 149:	74 29                	je     174 <matchhere+0x60>
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
 14b:	3c 24                	cmp    $0x24,%al
 14d:	75 dd                	jne    12c <matchhere+0x18>
 14f:	84 db                	test   %bl,%bl
 151:	75 d9                	jne    12c <matchhere+0x18>
    return *text == '\0';
 153:	31 c0                	xor    %eax,%eax
 155:	80 39 00             	cmpb   $0x0,(%ecx)
 158:	0f 94 c0             	sete   %al
 15b:	eb 05                	jmp    162 <matchhere+0x4e>
 15d:	8d 76 00             	lea    0x0(%esi),%esi
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
 160:	31 c0                	xor    %eax,%eax
}
 162:	83 c4 14             	add    $0x14,%esp
 165:	5b                   	pop    %ebx
 166:	5d                   	pop    %ebp
 167:	c3                   	ret    

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
 168:	b8 01 00 00 00       	mov    $0x1,%eax
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
 16d:	83 c4 14             	add    $0x14,%esp
 170:	5b                   	pop    %ebx
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    
 173:	90                   	nop
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
 174:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 178:	83 c2 02             	add    $0x2,%edx
 17b:	89 54 24 04          	mov    %edx,0x4(%esp)
 17f:	0f be c0             	movsbl %al,%eax
 182:	89 04 24             	mov    %eax,(%esp)
 185:	e8 36 ff ff ff       	call   c0 <matchstar>
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
 18a:	83 c4 14             	add    $0x14,%esp
 18d:	5b                   	pop    %ebx
 18e:	5d                   	pop    %ebp
 18f:	c3                   	ret    

00000190 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	53                   	push   %ebx
 195:	83 ec 10             	sub    $0x10,%esp
 198:	8b 75 08             	mov    0x8(%ebp),%esi
 19b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
 19e:	80 3e 5e             	cmpb   $0x5e,(%esi)
 1a1:	74 2d                	je     1d0 <match+0x40>
 1a3:	90                   	nop
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
 1a4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 1a8:	89 34 24             	mov    %esi,(%esp)
 1ab:	e8 64 ff ff ff       	call   114 <matchhere>
 1b0:	85 c0                	test   %eax,%eax
 1b2:	75 10                	jne    1c4 <match+0x34>
      return 1;
  }while(*text++ != '\0');
 1b4:	8a 03                	mov    (%ebx),%al
 1b6:	43                   	inc    %ebx
 1b7:	84 c0                	test   %al,%al
 1b9:	75 e9                	jne    1a4 <match+0x14>
  return 0;
 1bb:	31 c0                	xor    %eax,%eax
}
 1bd:	83 c4 10             	add    $0x10,%esp
 1c0:	5b                   	pop    %ebx
 1c1:	5e                   	pop    %esi
 1c2:	5d                   	pop    %ebp
 1c3:	c3                   	ret    
{
  if(re[0] == '^')
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
 1c4:	b8 01 00 00 00       	mov    $0x1,%eax
  }while(*text++ != '\0');
  return 0;
}
 1c9:	83 c4 10             	add    $0x10,%esp
 1cc:	5b                   	pop    %ebx
 1cd:	5e                   	pop    %esi
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret    

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 1d0:	46                   	inc    %esi
 1d1:	89 75 08             	mov    %esi,0x8(%ebp)
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
  return 0;
}
 1d4:	83 c4 10             	add    $0x10,%esp
 1d7:	5b                   	pop    %ebx
 1d8:	5e                   	pop    %esi
 1d9:	5d                   	pop    %ebp

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 1da:	e9 35 ff ff ff       	jmp    114 <matchhere>
 1df:	90                   	nop

000001e0 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
 1e5:	53                   	push   %ebx
 1e6:	83 ec 2c             	sub    $0x2c,%esp
 1e9:	8b 7d 08             	mov    0x8(%ebp),%edi
  int n, m;
  char *p, *q;

  m = 0;
 1ec:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1f3:	90                   	nop
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 1f4:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 1f9:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 1fc:	89 44 24 08          	mov    %eax,0x8(%esp)
 200:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 203:	05 80 0c 00 00       	add    $0xc80,%eax
 208:	89 44 24 04          	mov    %eax,0x4(%esp)
 20c:	8b 45 0c             	mov    0xc(%ebp),%eax
 20f:	89 04 24             	mov    %eax,(%esp)
 212:	e8 99 02 00 00       	call   4b0 <read>
 217:	85 c0                	test   %eax,%eax
 219:	0f 8e ad 00 00 00    	jle    2cc <grep+0xec>
    m += n;
 21f:	01 45 e4             	add    %eax,-0x1c(%ebp)
    buf[m] = '\0';
 222:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 225:	c6 80 80 0c 00 00 00 	movb   $0x0,0xc80(%eax)
    p = buf;
 22c:	be 80 0c 00 00       	mov    $0xc80,%esi
 231:	8d 76 00             	lea    0x0(%esi),%esi
    while((q = strchr(p, '\n')) != 0){
 234:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
 23b:	00 
 23c:	89 34 24             	mov    %esi,(%esp)
 23f:	e8 2c 01 00 00       	call   370 <strchr>
 244:	89 c3                	mov    %eax,%ebx
 246:	85 c0                	test   %eax,%eax
 248:	74 3a                	je     284 <grep+0xa4>
      *q = 0;
 24a:	c6 03 00             	movb   $0x0,(%ebx)
      if(match(pattern, p)){
 24d:	89 74 24 04          	mov    %esi,0x4(%esp)
 251:	89 3c 24             	mov    %edi,(%esp)
 254:	e8 37 ff ff ff       	call   190 <match>
 259:	85 c0                	test   %eax,%eax
 25b:	75 07                	jne    264 <grep+0x84>
 25d:	8d 73 01             	lea    0x1(%ebx),%esi
 260:	eb d2                	jmp    234 <grep+0x54>
 262:	66 90                	xchg   %ax,%ax
        *q = '\n';
 264:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 267:	43                   	inc    %ebx
 268:	89 d8                	mov    %ebx,%eax
 26a:	29 f0                	sub    %esi,%eax
 26c:	89 44 24 08          	mov    %eax,0x8(%esp)
 270:	89 74 24 04          	mov    %esi,0x4(%esp)
 274:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 27b:	e8 38 02 00 00       	call   4b8 <write>
 280:	89 de                	mov    %ebx,%esi
 282:	eb b0                	jmp    234 <grep+0x54>
      }
      p = q+1;
    }
    if(p == buf)
 284:	81 fe 80 0c 00 00    	cmp    $0xc80,%esi
 28a:	74 34                	je     2c0 <grep+0xe0>
      m = 0;
    if(m > 0){
 28c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 28f:	85 c0                	test   %eax,%eax
 291:	0f 8e 5d ff ff ff    	jle    1f4 <grep+0x14>
      m -= p - buf;
 297:	b8 80 0c 00 00       	mov    $0xc80,%eax
 29c:	29 f0                	sub    %esi,%eax
 29e:	01 45 e4             	add    %eax,-0x1c(%ebp)
      memmove(buf, p, m);
 2a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2a4:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a8:	89 74 24 04          	mov    %esi,0x4(%esp)
 2ac:	c7 04 24 80 0c 00 00 	movl   $0xc80,(%esp)
 2b3:	e8 b4 01 00 00       	call   46c <memmove>
 2b8:	e9 37 ff ff ff       	jmp    1f4 <grep+0x14>
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
      m = 0;
 2c0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 2c7:	e9 28 ff ff ff       	jmp    1f4 <grep+0x14>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
 2cc:	83 c4 2c             	add    $0x2c,%esp
 2cf:	5b                   	pop    %ebx
 2d0:	5e                   	pop    %esi
 2d1:	5f                   	pop    %edi
 2d2:	5d                   	pop    %ebp
 2d3:	c3                   	ret    

000002d4 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	53                   	push   %ebx
 2d8:	8b 45 08             	mov    0x8(%ebp),%eax
 2db:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2de:	31 d2                	xor    %edx,%edx
 2e0:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
 2e3:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2e6:	42                   	inc    %edx
 2e7:	84 c9                	test   %cl,%cl
 2e9:	75 f5                	jne    2e0 <strcpy+0xc>
    ;
  return os;
}
 2eb:	5b                   	pop    %ebx
 2ec:	5d                   	pop    %ebp
 2ed:	c3                   	ret    
 2ee:	66 90                	xchg   %ax,%ax

000002f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
 2f5:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2f8:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2fb:	8a 01                	mov    (%ecx),%al
 2fd:	8a 1a                	mov    (%edx),%bl
 2ff:	84 c0                	test   %al,%al
 301:	74 1d                	je     320 <strcmp+0x30>
 303:	38 d8                	cmp    %bl,%al
 305:	74 0c                	je     313 <strcmp+0x23>
 307:	eb 23                	jmp    32c <strcmp+0x3c>
 309:	8d 76 00             	lea    0x0(%esi),%esi
 30c:	41                   	inc    %ecx
 30d:	38 d8                	cmp    %bl,%al
 30f:	75 1b                	jne    32c <strcmp+0x3c>
    p++, q++;
 311:	89 f2                	mov    %esi,%edx
 313:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 316:	8a 41 01             	mov    0x1(%ecx),%al
 319:	8a 5a 01             	mov    0x1(%edx),%bl
 31c:	84 c0                	test   %al,%al
 31e:	75 ec                	jne    30c <strcmp+0x1c>
 320:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 322:	0f b6 db             	movzbl %bl,%ebx
 325:	29 d8                	sub    %ebx,%eax
}
 327:	5b                   	pop    %ebx
 328:	5e                   	pop    %esi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret    
 32b:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 32c:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 32f:	0f b6 db             	movzbl %bl,%ebx
 332:	29 d8                	sub    %ebx,%eax
}
 334:	5b                   	pop    %ebx
 335:	5e                   	pop    %esi
 336:	5d                   	pop    %ebp
 337:	c3                   	ret    

00000338 <strlen>:

uint
strlen(const char *s)
{
 338:	55                   	push   %ebp
 339:	89 e5                	mov    %esp,%ebp
 33b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 33e:	80 39 00             	cmpb   $0x0,(%ecx)
 341:	74 10                	je     353 <strlen+0x1b>
 343:	31 d2                	xor    %edx,%edx
 345:	8d 76 00             	lea    0x0(%esi),%esi
 348:	42                   	inc    %edx
 349:	89 d0                	mov    %edx,%eax
 34b:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 34f:	75 f7                	jne    348 <strlen+0x10>
    ;
  return n;
}
 351:	5d                   	pop    %ebp
 352:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 353:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 355:	5d                   	pop    %ebp
 356:	c3                   	ret    
 357:	90                   	nop

00000358 <memset>:

void*
memset(void *dst, int c, uint n)
{
 358:	55                   	push   %ebp
 359:	89 e5                	mov    %esp,%ebp
 35b:	57                   	push   %edi
 35c:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 35f:	89 d7                	mov    %edx,%edi
 361:	8b 4d 10             	mov    0x10(%ebp),%ecx
 364:	8b 45 0c             	mov    0xc(%ebp),%eax
 367:	fc                   	cld    
 368:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 36a:	89 d0                	mov    %edx,%eax
 36c:	5f                   	pop    %edi
 36d:	5d                   	pop    %ebp
 36e:	c3                   	ret    
 36f:	90                   	nop

00000370 <strchr>:

char*
strchr(const char *s, char c)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	8b 45 08             	mov    0x8(%ebp),%eax
 376:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
 379:	8a 10                	mov    (%eax),%dl
 37b:	84 d2                	test   %dl,%dl
 37d:	75 0d                	jne    38c <strchr+0x1c>
 37f:	eb 13                	jmp    394 <strchr+0x24>
 381:	8d 76 00             	lea    0x0(%esi),%esi
 384:	8a 50 01             	mov    0x1(%eax),%dl
 387:	84 d2                	test   %dl,%dl
 389:	74 09                	je     394 <strchr+0x24>
 38b:	40                   	inc    %eax
    if(*s == c)
 38c:	38 ca                	cmp    %cl,%dl
 38e:	75 f4                	jne    384 <strchr+0x14>
      return (char*)s;
  return 0;
}
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    
 392:	66 90                	xchg   %ax,%ax
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 394:	31 c0                	xor    %eax,%eax
}
 396:	5d                   	pop    %ebp
 397:	c3                   	ret    

00000398 <gets>:

char*
gets(char *buf, int max)
{
 398:	55                   	push   %ebp
 399:	89 e5                	mov    %esp,%ebp
 39b:	57                   	push   %edi
 39c:	56                   	push   %esi
 39d:	53                   	push   %ebx
 39e:	83 ec 2c             	sub    $0x2c,%esp
 3a1:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3a4:	31 f6                	xor    %esi,%esi
 3a6:	eb 30                	jmp    3d8 <gets+0x40>
    cc = read(0, &c, 1);
 3a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3af:	00 
 3b0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 3b7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3be:	e8 ed 00 00 00       	call   4b0 <read>
    if(cc < 1)
 3c3:	85 c0                	test   %eax,%eax
 3c5:	7e 19                	jle    3e0 <gets+0x48>
      break;
    buf[i++] = c;
 3c7:	8a 45 e7             	mov    -0x19(%ebp),%al
 3ca:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3ce:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 3d0:	3c 0a                	cmp    $0xa,%al
 3d2:	74 0c                	je     3e0 <gets+0x48>
 3d4:	3c 0d                	cmp    $0xd,%al
 3d6:	74 08                	je     3e0 <gets+0x48>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3d8:	8d 5e 01             	lea    0x1(%esi),%ebx
 3db:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3de:	7c c8                	jl     3a8 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 3e0:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3e4:	89 f8                	mov    %edi,%eax
 3e6:	83 c4 2c             	add    $0x2c,%esp
 3e9:	5b                   	pop    %ebx
 3ea:	5e                   	pop    %esi
 3eb:	5f                   	pop    %edi
 3ec:	5d                   	pop    %ebp
 3ed:	c3                   	ret    
 3ee:	66 90                	xchg   %ax,%ax

000003f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	56                   	push   %esi
 3f4:	53                   	push   %ebx
 3f5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3f8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 3ff:	00 
 400:	8b 45 08             	mov    0x8(%ebp),%eax
 403:	89 04 24             	mov    %eax,(%esp)
 406:	e8 cd 00 00 00       	call   4d8 <open>
 40b:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 40d:	85 c0                	test   %eax,%eax
 40f:	78 23                	js     434 <stat+0x44>
    return -1;
  r = fstat(fd, st);
 411:	8b 45 0c             	mov    0xc(%ebp),%eax
 414:	89 44 24 04          	mov    %eax,0x4(%esp)
 418:	89 1c 24             	mov    %ebx,(%esp)
 41b:	e8 d0 00 00 00       	call   4f0 <fstat>
 420:	89 c6                	mov    %eax,%esi
  close(fd);
 422:	89 1c 24             	mov    %ebx,(%esp)
 425:	e8 96 00 00 00       	call   4c0 <close>
  return r;
}
 42a:	89 f0                	mov    %esi,%eax
 42c:	83 c4 10             	add    $0x10,%esp
 42f:	5b                   	pop    %ebx
 430:	5e                   	pop    %esi
 431:	5d                   	pop    %ebp
 432:	c3                   	ret    
 433:	90                   	nop
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 434:	be ff ff ff ff       	mov    $0xffffffff,%esi
 439:	eb ef                	jmp    42a <stat+0x3a>
 43b:	90                   	nop

0000043c <atoi>:
  return r;
}

int
atoi(const char *s)
{
 43c:	55                   	push   %ebp
 43d:	89 e5                	mov    %esp,%ebp
 43f:	53                   	push   %ebx
 440:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 443:	8a 11                	mov    (%ecx),%dl
 445:	8d 42 d0             	lea    -0x30(%edx),%eax
 448:	3c 09                	cmp    $0x9,%al
 44a:	b8 00 00 00 00       	mov    $0x0,%eax
 44f:	77 18                	ja     469 <atoi+0x2d>
 451:	8d 76 00             	lea    0x0(%esi),%esi
    n = n*10 + *s++ - '0';
 454:	8d 04 80             	lea    (%eax,%eax,4),%eax
 457:	0f be d2             	movsbl %dl,%edx
 45a:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 45e:	41                   	inc    %ecx
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 45f:	8a 11                	mov    (%ecx),%dl
 461:	8d 5a d0             	lea    -0x30(%edx),%ebx
 464:	80 fb 09             	cmp    $0x9,%bl
 467:	76 eb                	jbe    454 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 469:	5b                   	pop    %ebx
 46a:	5d                   	pop    %ebp
 46b:	c3                   	ret    

0000046c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 46c:	55                   	push   %ebp
 46d:	89 e5                	mov    %esp,%ebp
 46f:	56                   	push   %esi
 470:	53                   	push   %ebx
 471:	8b 45 08             	mov    0x8(%ebp),%eax
 474:	8b 75 0c             	mov    0xc(%ebp),%esi
 477:	8b 5d 10             	mov    0x10(%ebp),%ebx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 47a:	85 db                	test   %ebx,%ebx
 47c:	7e 0d                	jle    48b <memmove+0x1f>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
 47e:	31 d2                	xor    %edx,%edx
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 480:	8a 0c 16             	mov    (%esi,%edx,1),%cl
 483:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 486:	42                   	inc    %edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 487:	39 da                	cmp    %ebx,%edx
 489:	75 f5                	jne    480 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
}
 48b:	5b                   	pop    %ebx
 48c:	5e                   	pop    %esi
 48d:	5d                   	pop    %ebp
 48e:	c3                   	ret    
 48f:	90                   	nop

00000490 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 490:	b8 01 00 00 00       	mov    $0x1,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <exit>:
SYSCALL(exit)
 498:	b8 02 00 00 00       	mov    $0x2,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <wait>:
SYSCALL(wait)
 4a0:	b8 03 00 00 00       	mov    $0x3,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <pipe>:
SYSCALL(pipe)
 4a8:	b8 04 00 00 00       	mov    $0x4,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <read>:
SYSCALL(read)
 4b0:	b8 05 00 00 00       	mov    $0x5,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <write>:
SYSCALL(write)
 4b8:	b8 10 00 00 00       	mov    $0x10,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <close>:
SYSCALL(close)
 4c0:	b8 15 00 00 00       	mov    $0x15,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <kill>:
SYSCALL(kill)
 4c8:	b8 06 00 00 00       	mov    $0x6,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <exec>:
SYSCALL(exec)
 4d0:	b8 07 00 00 00       	mov    $0x7,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <open>:
SYSCALL(open)
 4d8:	b8 0f 00 00 00       	mov    $0xf,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <mknod>:
SYSCALL(mknod)
 4e0:	b8 11 00 00 00       	mov    $0x11,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <unlink>:
SYSCALL(unlink)
 4e8:	b8 12 00 00 00       	mov    $0x12,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <fstat>:
SYSCALL(fstat)
 4f0:	b8 08 00 00 00       	mov    $0x8,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <link>:
SYSCALL(link)
 4f8:	b8 13 00 00 00       	mov    $0x13,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <mkdir>:
SYSCALL(mkdir)
 500:	b8 14 00 00 00       	mov    $0x14,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <chdir>:
SYSCALL(chdir)
 508:	b8 09 00 00 00       	mov    $0x9,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <dup>:
SYSCALL(dup)
 510:	b8 0a 00 00 00       	mov    $0xa,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <getpid>:
SYSCALL(getpid)
 518:	b8 0b 00 00 00       	mov    $0xb,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <sbrk>:
SYSCALL(sbrk)
 520:	b8 0c 00 00 00       	mov    $0xc,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <sleep>:
SYSCALL(sleep)
 528:	b8 0d 00 00 00       	mov    $0xd,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <uptime>:
SYSCALL(uptime)
 530:	b8 0e 00 00 00       	mov    $0xe,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <waitx>:
SYSCALL(waitx)      //BVK Commit Assignment 5 Q1
 538:	b8 16 00 00 00       	mov    $0x16,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <chprty>:
SYSCALL(chprty)
 540:	b8 17 00 00 00       	mov    $0x17,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <ps>:
SYSCALL(ps)
 548:	b8 18 00 00 00       	mov    $0x18,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <getpinfo>:
SYSCALL(getpinfo)
 550:	b8 19 00 00 00       	mov    $0x19,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 558:	55                   	push   %ebp
 559:	89 e5                	mov    %esp,%ebp
 55b:	83 ec 28             	sub    $0x28,%esp
 55e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 561:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 568:	00 
 569:	8d 55 f4             	lea    -0xc(%ebp),%edx
 56c:	89 54 24 04          	mov    %edx,0x4(%esp)
 570:	89 04 24             	mov    %eax,(%esp)
 573:	e8 40 ff ff ff       	call   4b8 <write>
}
 578:	c9                   	leave  
 579:	c3                   	ret    
 57a:	66 90                	xchg   %ax,%ax

0000057c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 57c:	55                   	push   %ebp
 57d:	89 e5                	mov    %esp,%ebp
 57f:	57                   	push   %edi
 580:	56                   	push   %esi
 581:	53                   	push   %ebx
 582:	83 ec 1c             	sub    $0x1c,%esp
 585:	89 c6                	mov    %eax,%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 587:	89 d0                	mov    %edx,%eax
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 589:	8b 5d 08             	mov    0x8(%ebp),%ebx
 58c:	85 db                	test   %ebx,%ebx
 58e:	74 04                	je     594 <printint+0x18>
 590:	85 d2                	test   %edx,%edx
 592:	78 4a                	js     5de <printint+0x62>
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 594:	31 ff                	xor    %edi,%edi
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 596:	31 db                	xor    %ebx,%ebx
 598:	eb 04                	jmp    59e <printint+0x22>
 59a:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 59c:	89 d3                	mov    %edx,%ebx
 59e:	31 d2                	xor    %edx,%edx
 5a0:	f7 f1                	div    %ecx
 5a2:	8a 92 b9 08 00 00    	mov    0x8b9(%edx),%dl
 5a8:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
 5ac:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
 5af:	85 c0                	test   %eax,%eax
 5b1:	75 e9                	jne    59c <printint+0x20>
  if(neg)
 5b3:	85 ff                	test   %edi,%edi
 5b5:	74 08                	je     5bf <printint+0x43>
    buf[i++] = '-';
 5b7:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
 5bc:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
 5bf:	8d 5a ff             	lea    -0x1(%edx),%ebx
 5c2:	66 90                	xchg   %ax,%ax
    putc(fd, buf[i]);
 5c4:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5c9:	89 f0                	mov    %esi,%eax
 5cb:	e8 88 ff ff ff       	call   558 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5d0:	4b                   	dec    %ebx
 5d1:	83 fb ff             	cmp    $0xffffffff,%ebx
 5d4:	75 ee                	jne    5c4 <printint+0x48>
    putc(fd, buf[i]);
}
 5d6:	83 c4 1c             	add    $0x1c,%esp
 5d9:	5b                   	pop    %ebx
 5da:	5e                   	pop    %esi
 5db:	5f                   	pop    %edi
 5dc:	5d                   	pop    %ebp
 5dd:	c3                   	ret    
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5de:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 5e0:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
 5e5:	eb af                	jmp    596 <printint+0x1a>
 5e7:	90                   	nop

000005e8 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5e8:	55                   	push   %ebp
 5e9:	89 e5                	mov    %esp,%ebp
 5eb:	57                   	push   %edi
 5ec:	56                   	push   %esi
 5ed:	53                   	push   %ebx
 5ee:	83 ec 2c             	sub    $0x2c,%esp
 5f1:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5f4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 5f7:	8a 0b                	mov    (%ebx),%cl
 5f9:	84 c9                	test   %cl,%cl
 5fb:	74 7b                	je     678 <printf+0x90>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5fd:	8d 45 10             	lea    0x10(%ebp),%eax
 600:	89 45 e4             	mov    %eax,-0x1c(%ebp)
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 603:	31 f6                	xor    %esi,%esi
 605:	eb 17                	jmp    61e <printf+0x36>
 607:	90                   	nop
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 608:	83 f9 25             	cmp    $0x25,%ecx
 60b:	74 73                	je     680 <printf+0x98>
        state = '%';
      } else {
        putc(fd, c);
 60d:	0f be d1             	movsbl %cl,%edx
 610:	89 f8                	mov    %edi,%eax
 612:	e8 41 ff ff ff       	call   558 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 617:	43                   	inc    %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 618:	8a 0b                	mov    (%ebx),%cl
 61a:	84 c9                	test   %cl,%cl
 61c:	74 5a                	je     678 <printf+0x90>
    c = fmt[i] & 0xff;
 61e:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 621:	85 f6                	test   %esi,%esi
 623:	74 e3                	je     608 <printf+0x20>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 625:	83 fe 25             	cmp    $0x25,%esi
 628:	75 ed                	jne    617 <printf+0x2f>
      if(c == 'd'){
 62a:	83 f9 64             	cmp    $0x64,%ecx
 62d:	0f 84 c1 00 00 00    	je     6f4 <printf+0x10c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 633:	83 f9 78             	cmp    $0x78,%ecx
 636:	74 50                	je     688 <printf+0xa0>
 638:	83 f9 70             	cmp    $0x70,%ecx
 63b:	74 4b                	je     688 <printf+0xa0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 63d:	83 f9 73             	cmp    $0x73,%ecx
 640:	74 6a                	je     6ac <printf+0xc4>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 642:	83 f9 63             	cmp    $0x63,%ecx
 645:	0f 84 91 00 00 00    	je     6dc <printf+0xf4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
        putc(fd, c);
 64b:	ba 25 00 00 00       	mov    $0x25,%edx
 650:	89 f8                	mov    %edi,%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 652:	83 f9 25             	cmp    $0x25,%ecx
 655:	74 10                	je     667 <printf+0x7f>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 657:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 65a:	e8 f9 fe ff ff       	call   558 <putc>
        putc(fd, c);
 65f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 662:	0f be d1             	movsbl %cl,%edx
 665:	89 f8                	mov    %edi,%eax
 667:	e8 ec fe ff ff       	call   558 <putc>
      }
      state = 0;
 66c:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 66e:	43                   	inc    %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 66f:	8a 0b                	mov    (%ebx),%cl
 671:	84 c9                	test   %cl,%cl
 673:	75 a9                	jne    61e <printf+0x36>
 675:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 678:	83 c4 2c             	add    $0x2c,%esp
 67b:	5b                   	pop    %ebx
 67c:	5e                   	pop    %esi
 67d:	5f                   	pop    %edi
 67e:	5d                   	pop    %ebp
 67f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 680:	be 25 00 00 00       	mov    $0x25,%esi
 685:	eb 90                	jmp    617 <printf+0x2f>
 687:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 688:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 68f:	b9 10 00 00 00       	mov    $0x10,%ecx
 694:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 697:	8b 10                	mov    (%eax),%edx
 699:	89 f8                	mov    %edi,%eax
 69b:	e8 dc fe ff ff       	call   57c <printint>
        ap++;
 6a0:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6a4:	31 f6                	xor    %esi,%esi
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 6a6:	e9 6c ff ff ff       	jmp    617 <printf+0x2f>
 6ab:	90                   	nop
      } else if(c == 's'){
        s = (char*)*ap;
 6ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6af:	8b 30                	mov    (%eax),%esi
        ap++;
 6b1:	83 c0 04             	add    $0x4,%eax
 6b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6b7:	85 f6                	test   %esi,%esi
 6b9:	74 5a                	je     715 <printf+0x12d>
          s = "(null)";
        while(*s != 0){
 6bb:	8a 16                	mov    (%esi),%dl
 6bd:	84 d2                	test   %dl,%dl
 6bf:	74 14                	je     6d5 <printf+0xed>
 6c1:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 6c4:	0f be d2             	movsbl %dl,%edx
 6c7:	89 f8                	mov    %edi,%eax
 6c9:	e8 8a fe ff ff       	call   558 <putc>
          s++;
 6ce:	46                   	inc    %esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6cf:	8a 16                	mov    (%esi),%dl
 6d1:	84 d2                	test   %dl,%dl
 6d3:	75 ef                	jne    6c4 <printf+0xdc>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6d5:	31 f6                	xor    %esi,%esi
 6d7:	e9 3b ff ff ff       	jmp    617 <printf+0x2f>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 6dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6df:	0f be 10             	movsbl (%eax),%edx
 6e2:	89 f8                	mov    %edi,%eax
 6e4:	e8 6f fe ff ff       	call   558 <putc>
        ap++;
 6e9:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6ed:	31 f6                	xor    %esi,%esi
 6ef:	e9 23 ff ff ff       	jmp    617 <printf+0x2f>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 6f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6fb:	b1 0a                	mov    $0xa,%cl
 6fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 700:	8b 10                	mov    (%eax),%edx
 702:	89 f8                	mov    %edi,%eax
 704:	e8 73 fe ff ff       	call   57c <printint>
        ap++;
 709:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 70d:	66 31 f6             	xor    %si,%si
 710:	e9 02 ff ff ff       	jmp    617 <printf+0x2f>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 715:	be b2 08 00 00       	mov    $0x8b2,%esi
 71a:	eb 9f                	jmp    6bb <printf+0xd3>

0000071c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 71c:	55                   	push   %ebp
 71d:	89 e5                	mov    %esp,%ebp
 71f:	57                   	push   %edi
 720:	56                   	push   %esi
 721:	53                   	push   %ebx
 722:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 725:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 728:	a1 60 0c 00 00       	mov    0xc60,%eax
 72d:	8d 76 00             	lea    0x0(%esi),%esi
 730:	8b 10                	mov    (%eax),%edx
 732:	39 c8                	cmp    %ecx,%eax
 734:	73 04                	jae    73a <free+0x1e>
 736:	39 d1                	cmp    %edx,%ecx
 738:	72 12                	jb     74c <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 73a:	39 d0                	cmp    %edx,%eax
 73c:	72 08                	jb     746 <free+0x2a>
 73e:	39 c8                	cmp    %ecx,%eax
 740:	72 0a                	jb     74c <free+0x30>
 742:	39 d1                	cmp    %edx,%ecx
 744:	72 06                	jb     74c <free+0x30>
static Header base;
static Header *freep;

void
free(void *ap)
{
 746:	89 d0                	mov    %edx,%eax
 748:	eb e6                	jmp    730 <free+0x14>
 74a:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 74c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 74f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 752:	39 d7                	cmp    %edx,%edi
 754:	74 19                	je     76f <free+0x53>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 756:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 759:	8b 50 04             	mov    0x4(%eax),%edx
 75c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 75f:	39 f1                	cmp    %esi,%ecx
 761:	74 23                	je     786 <free+0x6a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 763:	89 08                	mov    %ecx,(%eax)
  freep = p;
 765:	a3 60 0c 00 00       	mov    %eax,0xc60
}
 76a:	5b                   	pop    %ebx
 76b:	5e                   	pop    %esi
 76c:	5f                   	pop    %edi
 76d:	5d                   	pop    %ebp
 76e:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 76f:	03 72 04             	add    0x4(%edx),%esi
 772:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 775:	8b 10                	mov    (%eax),%edx
 777:	8b 12                	mov    (%edx),%edx
 779:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 77c:	8b 50 04             	mov    0x4(%eax),%edx
 77f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 782:	39 f1                	cmp    %esi,%ecx
 784:	75 dd                	jne    763 <free+0x47>
    p->s.size += bp->s.size;
 786:	03 53 fc             	add    -0x4(%ebx),%edx
 789:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 78c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 78f:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 791:	a3 60 0c 00 00       	mov    %eax,0xc60
}
 796:	5b                   	pop    %ebx
 797:	5e                   	pop    %esi
 798:	5f                   	pop    %edi
 799:	5d                   	pop    %ebp
 79a:	c3                   	ret    
 79b:	90                   	nop

0000079c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 79c:	55                   	push   %ebp
 79d:	89 e5                	mov    %esp,%ebp
 79f:	57                   	push   %edi
 7a0:	56                   	push   %esi
 7a1:	53                   	push   %ebx
 7a2:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7a8:	83 c3 07             	add    $0x7,%ebx
 7ab:	c1 eb 03             	shr    $0x3,%ebx
 7ae:	43                   	inc    %ebx
  if((prevp = freep) == 0){
 7af:	8b 0d 60 0c 00 00    	mov    0xc60,%ecx
 7b5:	85 c9                	test   %ecx,%ecx
 7b7:	0f 84 95 00 00 00    	je     852 <malloc+0xb6>
 7bd:	8b 01                	mov    (%ecx),%eax
 7bf:	8b 50 04             	mov    0x4(%eax),%edx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7c2:	39 da                	cmp    %ebx,%edx
 7c4:	73 66                	jae    82c <malloc+0x90>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 7c6:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
 7cd:	eb 0c                	jmp    7db <malloc+0x3f>
 7cf:	90                   	nop
    }
    if(p == freep)
 7d0:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d2:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 7d4:	8b 50 04             	mov    0x4(%eax),%edx
 7d7:	39 d3                	cmp    %edx,%ebx
 7d9:	76 51                	jbe    82c <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7db:	3b 05 60 0c 00 00    	cmp    0xc60,%eax
 7e1:	75 ed                	jne    7d0 <malloc+0x34>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 7e3:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 7e9:	76 35                	jbe    820 <malloc+0x84>
 7eb:	89 f8                	mov    %edi,%eax
 7ed:	89 de                	mov    %ebx,%esi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 7ef:	89 04 24             	mov    %eax,(%esp)
 7f2:	e8 29 fd ff ff       	call   520 <sbrk>
  if(p == (char*)-1)
 7f7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7fa:	74 18                	je     814 <malloc+0x78>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7fc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 7ff:	83 c0 08             	add    $0x8,%eax
 802:	89 04 24             	mov    %eax,(%esp)
 805:	e8 12 ff ff ff       	call   71c <free>
  return freep;
 80a:	8b 0d 60 0c 00 00    	mov    0xc60,%ecx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 810:	85 c9                	test   %ecx,%ecx
 812:	75 be                	jne    7d2 <malloc+0x36>
        return 0;
 814:	31 c0                	xor    %eax,%eax
  }
}
 816:	83 c4 1c             	add    $0x1c,%esp
 819:	5b                   	pop    %ebx
 81a:	5e                   	pop    %esi
 81b:	5f                   	pop    %edi
 81c:	5d                   	pop    %ebp
 81d:	c3                   	ret    
 81e:	66 90                	xchg   %ax,%ax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 820:	b8 00 80 00 00       	mov    $0x8000,%eax
    nu = 4096;
 825:	be 00 10 00 00       	mov    $0x1000,%esi
 82a:	eb c3                	jmp    7ef <malloc+0x53>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 82c:	39 d3                	cmp    %edx,%ebx
 82e:	74 1c                	je     84c <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 830:	29 da                	sub    %ebx,%edx
 832:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 835:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 838:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 83b:	89 0d 60 0c 00 00    	mov    %ecx,0xc60
      return (void*)(p + 1);
 841:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 844:	83 c4 1c             	add    $0x1c,%esp
 847:	5b                   	pop    %ebx
 848:	5e                   	pop    %esi
 849:	5f                   	pop    %edi
 84a:	5d                   	pop    %ebp
 84b:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 84c:	8b 10                	mov    (%eax),%edx
 84e:	89 11                	mov    %edx,(%ecx)
 850:	eb e9                	jmp    83b <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 852:	c7 05 60 0c 00 00 64 	movl   $0xc64,0xc60
 859:	0c 00 00 
 85c:	c7 05 64 0c 00 00 64 	movl   $0xc64,0xc64
 863:	0c 00 00 
    base.s.size = 0;
 866:	c7 05 68 0c 00 00 00 	movl   $0x0,0xc68
 86d:	00 00 00 
 870:	b8 64 0c 00 00       	mov    $0xc64,%eax
 875:	e9 4c ff ff ff       	jmp    7c6 <malloc+0x2a>
