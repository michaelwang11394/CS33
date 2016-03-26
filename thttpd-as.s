	.file	"thttpd.c"
	.text
.Ltext0:
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.section	.text.unlikely
.Ltext_cold0:
	.text
	.type	handle_hup, @function
handle_hup:
.LASANPC4:
.LFB4:
	.file 1 "thttpd.c"
	.loc 1 238 0
	.cfi_startproc
.LVL0:
	.loc 1 247 0
	movl	$1, got_hup(%rip)
	ret
	.cfi_endproc
.LFE4:
	.size	handle_hup, .-handle_hup
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.rodata
	.align 32
.LC1:
	.string	"  thttpd - %ld connections (%g/sec), %d max simultaneous, %lld bytes (%g/sec), %d httpd_conns allocated"
	.zero	56
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.type	thttpd_logstats, @function
thttpd_logstats:
.LASANPC35:
.LFB35:
	.loc 1 2179 0
	.cfi_startproc
.LVL1:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 2180 0
	testq	%rdi, %rdi
	jle	.L3
	.loc 1 2185 0
	movq	stats_bytes(%rip), %r8
	pxor	%xmm2, %xmm2
	.loc 1 2183 0
	movq	stats_connections(%rip), %rdx
	.loc 1 2181 0
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	movl	httpd_conn_count(%rip), %r9d
	.loc 1 2185 0
	cvtsi2ssq	%rdi, %xmm2
	.loc 1 2181 0
	movl	stats_simultaneous(%rip), %ecx
	movl	$.LC1, %esi
	movl	$6, %edi
.LVL2:
	cvtsi2ssq	%r8, %xmm1
	movl	$2, %eax
	cvtsi2ssq	%rdx, %xmm0
	divss	%xmm2, %xmm1
	divss	%xmm2, %xmm0
	cvtss2sd	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm0
	call	syslog
.LVL3:
.L3:
	.loc 1 2186 0
	movq	$0, stats_connections(%rip)
	.loc 1 2187 0
	movq	$0, stats_bytes(%rip)
	.loc 1 2188 0
	movl	$0, stats_simultaneous(%rip)
	.loc 1 2189 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE35:
	.size	thttpd_logstats, .-thttpd_logstats
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.rodata
	.align 32
.LC3:
	.string	"throttle #%d '%.80s' rate %ld greatly exceeding limit %ld; %d sending"
	.zero	58
	.align 32
.LC4:
	.string	"throttle #%d '%.80s' rate %ld exceeding limit %ld; %d sending"
	.zero	34
	.align 32
.LC5:
	.string	"throttle #%d '%.80s' rate %ld lower than minimum %ld; %d sending"
	.zero	63
	.section	.text.unlikely
.LCOLDB6:
	.text
.LHOTB6:
	.p2align 4,,15
	.type	update_throttles, @function
update_throttles:
.LASANPC25:
.LFB25:
	.loc 1 1933 0
	.cfi_startproc
.LVL4:
	.loc 1 1942 0
	movl	numthrottles(%rip), %r11d
	.loc 1 1933 0
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebx, %ebx
	movabsq	$6148914691236517206, %rbp
	.loc 1 1942 0
	testl	%r11d, %r11d
	jg	.L65
	jmp	.L26
.LVL5:
	.p2align 4,,10
	.p2align 3
.L93:
	.loc 1 1949 0
	leaq	(%r9,%r9), %rdx
	cmpq	%rdx, %r8
	.loc 1 1950 0
	movq	%rcx, %rdx
	.loc 1 1949 0
	jle	.L16
	.loc 1 1950 0
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L84
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	movq	(%rcx), %rcx
	movl	$5, %edi
	pushq	%rax
	.cfi_def_cfa_offset 48
	movl	%ebx, %edx
	xorl	%eax, %eax
	movl	$.LC3, %esi
	call	syslog
.LVL6:
	movq	%r12, %rcx
	addq	throttles(%rip), %rcx
	popq	%r9
	.cfi_def_cfa_offset 40
	popq	%r10
	.cfi_def_cfa_offset 32
	leaq	24(%rcx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L85
.L20:
	movq	24(%rcx), %r8
.L13:
	.loc 1 1954 0
	leaq	16(%rcx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L86
	movq	16(%rcx), %r9
	cmpq	%r8, %r9
	jle	.L22
	.loc 1 1954 0 is_stmt 0 discriminator 1
	leaq	40(%rcx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L23
	cmpb	$3, %al
	jle	.L87
.L23:
	movl	40(%rcx), %eax
	testl	%eax, %eax
	jne	.L88
.L22:
	.loc 1 1942 0 is_stmt 1 discriminator 2
	addl	$1, %ebx
.LVL7:
	cmpl	%ebx, numthrottles(%rip)
	jle	.L26
.LVL8:
.L65:
	.loc 1 1944 0
	movslq	%ebx, %rax
	leaq	(%rax,%rax,2), %r12
	salq	$4, %r12
	movq	%r12, %rcx
	addq	throttles(%rip), %rcx
	leaq	24(%rcx), %rdi
.LVL9:
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L89
	leaq	32(%rcx), %rdi
	movq	24(%rcx), %rax
	movq	%rdi, %rdx
	shrq	$3, %rdx
	addq	%rax, %rax
	cmpb	$0, 2147450880(%rdx)
	jne	.L90
	movq	32(%rcx), %rdx
	.loc 1 1947 0
	leaq	8(%rcx), %rdi
	.loc 1 1945 0
	movq	$0, 32(%rcx)
	.loc 1 1944 0
	movq	%rdx, %rsi
	shrq	$63, %rsi
	addq	%rsi, %rdx
	sarq	%rdx
	leaq	(%rdx,%rax), %rsi
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	.loc 1 1947 0
	movq	%rdi, %rax
	shrq	$3, %rax
	.loc 1 1944 0
	subq	%rsi, %rdx
	.loc 1 1947 0
	cmpb	$0, 2147450880(%rax)
	.loc 1 1944 0
	movq	%rdx, %r8
	movq	%rdx, 24(%rcx)
	.loc 1 1947 0
	jne	.L91
	movq	8(%rcx), %r9
	cmpq	%r9, %rdx
	jle	.L13
	.loc 1 1947 0 is_stmt 0 discriminator 1
	leaq	40(%rcx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L14
	cmpb	$3, %al
	jle	.L92
.L14:
	movl	40(%rcx), %eax
	testl	%eax, %eax
	jne	.L93
	.loc 1 1954 0 is_stmt 1
	leaq	16(%rcx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.L22
	call	__asan_report_load8
.LVL10:
	.p2align 4,,10
	.p2align 3
.L88:
	.loc 1 1956 0
	movq	%rcx, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L94
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	movq	(%rcx), %rcx
	movl	%ebx, %edx
	pushq	%rax
	.cfi_def_cfa_offset 48
	movl	$.LC5, %esi
	xorl	%eax, %eax
	movl	$5, %edi
	.loc 1 1942 0
	addl	$1, %ebx
.LVL11:
	.loc 1 1956 0
	call	syslog
.LVL12:
	.loc 1 1942 0
	cmpl	%ebx, numthrottles(%rip)
	.loc 1 1956 0
	popq	%rax
	.cfi_def_cfa_offset 40
	popq	%rdx
	.cfi_def_cfa_offset 32
	.loc 1 1942 0
	jg	.L65
.LVL13:
	.p2align 4,,10
	.p2align 3
.L26:
	.loc 1 1963 0
	movl	max_connects(%rip), %eax
	testl	%eax, %eax
	jle	.L6
	subl	$1, %eax
	movq	connects(%rip), %r9
	leaq	(%rax,%rax,8), %rax
	salq	$4, %rax
	leaq	64(%r9), %r8
	leaq	208(%r9,%rax), %rdi
.LVL14:
	jmp	.L29
.LVL15:
	.p2align 4,,10
	.p2align 3
.L32:
	addq	$144, %r8
	addq	$144, %r9
.LVL16:
	cmpq	%rdi, %r8
	je	.L6
.LVL17:
.L29:
	.loc 1 1966 0
	movq	%r9, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L27
	cmpb	$3, %al
	jle	.L95
.L27:
	movl	(%r9), %eax
	subl	$2, %eax
	cmpl	$1, %eax
	ja	.L32
	.loc 1 1968 0
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L96
	.loc 1 1969 0
	leaq	-8(%r8), %rdx
	.loc 1 1968 0
	movq	$-1, (%r8)
.LVL18:
	.loc 1 1969 0
	movq	%rdx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L31
	cmpb	$3, %al
	jle	.L97
.L31:
	movl	-8(%r8), %eax
	testl	%eax, %eax
	jle	.L32
	subl	$1, %eax
	movq	throttles(%rip), %r11
	leaq	-48(%r8), %rsi
	leaq	20(%r9,%rax,4), %r10
	movq	$-1, %rbx
	jmp	.L38
.LVL19:
	.p2align 4,,10
	.p2align 3
.L33:
	.loc 1 1972 0
	movslq	(%rsi), %rax
	leaq	(%rax,%rax,2), %rcx
	salq	$4, %rcx
	addq	%r11, %rcx
	leaq	8(%rcx), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L98
	leaq	40(%rcx), %rbp
	movq	8(%rcx), %rax
	movq	%rbp, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L35
	cmpb	$3, %dl
	jle	.L99
.L35:
	movslq	40(%rcx), %rcx
	cqto
	idivq	%rcx
.LVL20:
	.loc 1 1973 0
	cmpq	$-1, %rbx
	je	.L83
	.loc 1 1976 0
	cmpq	%rbx, %rax
	cmovg	%rbx, %rax
.LVL21:
.L83:
	addq	$4, %rsi
.LVL22:
	movq	%rax, (%r8)
.LVL23:
	.loc 1 1969 0
	cmpq	%r10, %rsi
	je	.L32
	movq	(%r8), %rbx
.L38:
	.loc 1 1971 0
	movq	%rsi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rsi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L33
	testb	%dl, %dl
	je	.L33
	movq	%rsi, %rdi
	call	__asan_report_load4
.LVL24:
	.p2align 4,,10
	.p2align 3
.L16:
	.loc 1 1952 0
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L100
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	movq	(%rcx), %rcx
	movl	$.LC4, %esi
	pushq	%rax
	.cfi_def_cfa_offset 48
	movl	$6, %edi
	xorl	%eax, %eax
	movl	%ebx, %edx
	call	syslog
.LVL25:
	movq	%r12, %rcx
	addq	throttles(%rip), %rcx
	popq	%rsi
	.cfi_def_cfa_offset 40
	popq	%r8
	.cfi_def_cfa_offset 32
	leaq	24(%rcx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.L20
	call	__asan_report_load8
.LVL26:
	.p2align 4,,10
	.p2align 3
.L6:
	.loc 1 1980 0
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.LVL27:
.L97:
	.cfi_restore_state
	.loc 1 1969 0
	movq	%rdx, %rdi
	call	__asan_report_load4
.LVL28:
.L96:
	.loc 1 1968 0
	movq	%r8, %rdi
	call	__asan_report_store8
.LVL29:
.L95:
	.loc 1 1966 0
	movq	%r9, %rdi
	call	__asan_report_load4
.LVL30:
.L100:
	.loc 1 1952 0
	movq	%rcx, %rdi
	call	__asan_report_load8
.LVL31:
.L94:
	.loc 1 1956 0
	movq	%rcx, %rdi
	call	__asan_report_load8
.LVL32:
.L87:
	.loc 1 1954 0
	call	__asan_report_load4
.LVL33:
.L86:
	call	__asan_report_load8
.LVL34:
.L85:
	call	__asan_report_load8
.LVL35:
.L84:
	.loc 1 1950 0
	movq	%rcx, %rdi
	call	__asan_report_load8
.LVL36:
.L92:
	.loc 1 1947 0
	call	__asan_report_load4
.LVL37:
.L91:
	call	__asan_report_load8
.LVL38:
.L90:
	.loc 1 1944 0
	call	__asan_report_load8
.LVL39:
.L89:
	call	__asan_report_load8
.LVL40:
.L99:
	.loc 1 1972 0
	movq	%rbp, %rdi
	call	__asan_report_load4
.LVL41:
.L98:
	movq	%rax, %rdi
	call	__asan_report_load8
.LVL42:
	.cfi_endproc
.LFE25:
	.size	update_throttles, .-update_throttles
	.section	.text.unlikely
.LCOLDE6:
	.text
.LHOTE6:
	.section	.rodata
	.align 32
.LC7:
	.string	"%s: no value required for %s option\n"
	.zero	59
	.section	.text.unlikely
.LCOLDB8:
	.text
.LHOTB8:
	.p2align 4,,15
	.type	no_value_required, @function
no_value_required:
.LASANPC14:
.LFB14:
	.loc 1 1207 0
	.cfi_startproc
.LVL43:
	.loc 1 1208 0
	testq	%rsi, %rsi
	jne	.L106
	rep ret
.L106:
	.loc 1 1207 0
	pushq	%rax
	.cfi_def_cfa_offset 16
	.loc 1 1210 0
	movl	$stderr, %eax
	movq	%rdi, %rcx
	shrq	$3, %rax
	movq	argv0(%rip), %rdx
	cmpb	$0, 2147450880(%rax)
	jne	.L107
.LVL44:
	movq	stderr(%rip), %rdi
	movl	$.LC7, %esi
.LVL45:
	xorl	%eax, %eax
	call	fprintf
.LVL46:
	.loc 1 1213 0
	call	__asan_handle_no_return
.LVL47:
	movl	$1, %edi
	call	exit
.LVL48:
.L107:
	.loc 1 1210 0
	movl	$stderr, %edi
	call	__asan_report_load8
.LVL49:
	.cfi_endproc
.LFE14:
	.size	no_value_required, .-no_value_required
	.section	.text.unlikely
.LCOLDE8:
	.text
.LHOTE8:
	.section	.rodata
	.align 32
.LC9:
	.string	"%s: value required for %s option\n"
	.zero	62
	.section	.text.unlikely
.LCOLDB10:
	.text
.LHOTB10:
	.p2align 4,,15
	.type	value_required, @function
value_required:
.LASANPC13:
.LFB13:
	.loc 1 1195 0
	.cfi_startproc
.LVL50:
	.loc 1 1196 0
	testq	%rsi, %rsi
	je	.L113
	rep ret
.L113:
	.loc 1 1195 0
	pushq	%rax
	.cfi_def_cfa_offset 16
	.loc 1 1198 0
	movl	$stderr, %eax
	movq	%rdi, %rcx
	shrq	$3, %rax
	movq	argv0(%rip), %rdx
	cmpb	$0, 2147450880(%rax)
	jne	.L114
.LVL51:
	movq	stderr(%rip), %rdi
	movl	$.LC9, %esi
.LVL52:
	xorl	%eax, %eax
	call	fprintf
.LVL53:
	.loc 1 1200 0
	call	__asan_handle_no_return
.LVL54:
	movl	$1, %edi
	call	exit
.LVL55:
.L114:
	.loc 1 1198 0
	movl	$stderr, %edi
	call	__asan_report_load8
.LVL56:
	.cfi_endproc
.LFE13:
	.size	value_required, .-value_required
	.section	.text.unlikely
.LCOLDE10:
	.text
.LHOTE10:
	.section	.rodata
	.align 32
.LC11:
	.string	"usage:  %s [-C configfile] [-p port] [-d dir] [-r|-nor] [-dd data_dir] [-s|-nos] [-v|-nov] [-g|-nog] [-u user] [-c cgipat] [-t throttles] [-h host] [-l logfile] [-i pidfile] [-T charset] [-P P3P] [-M maxage] [-V] [-D]\n"
	.zero	37
	.section	.text.unlikely
.LCOLDB12:
.LHOTB12:
	.type	usage, @function
usage:
.LASANPC11:
.LFB11:
	.loc 1 990 0
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	.loc 1 991 0
	movl	$stderr, %eax
	movq	argv0(%rip), %rdx
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.L116
	movl	$stderr, %edi
	call	__asan_report_load8
.LVL57:
.L116:
	movq	stderr(%rip), %rdi
	movl	$.LC11, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL58:
	.loc 1 994 0
	call	__asan_handle_no_return
.LVL59:
	movl	$1, %edi
	call	exit
.LVL60:
	.cfi_endproc
.LFE11:
	.size	usage, .-usage
.LCOLDE12:
.LHOTE12:
.LCOLDB13:
	.text
.LHOTB13:
	.p2align 4,,15
	.type	wakeup_connection, @function
wakeup_connection:
.LASANPC30:
.LFB30:
	.loc 1 2105 0
	.cfi_startproc
.LVL61:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 2108 0
	movq	%rsp, %rax
	.loc 1 2105 0
	movq	%rdi, (%rsp)
	.loc 1 2108 0
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L138
	movq	(%rsp), %rsi
.LVL62:
	.loc 1 2109 0
	leaq	96(%rsi), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L139
	.loc 1 2110 0
	movq	%rsi, %rax
	.loc 1 2109 0
	movq	$0, 96(%rsi)
	.loc 1 2110 0
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L121
	cmpb	$3, %al
	jle	.L140
.L121:
	cmpl	$3, (%rsi)
	je	.L141
	.loc 1 2115 0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L141:
	.cfi_restore_state
	.loc 1 2113 0
	leaq	8(%rsi), %rdi
	.loc 1 2112 0
	movl	$2, (%rsi)
	.loc 1 2113 0
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L142
	movq	8(%rsi), %rax
	leaq	704(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L124
	cmpb	$3, %dl
	jle	.L143
.L124:
	movl	704(%rax), %edi
	movl	$1, %edx
	call	fdwatch_add_fd
.LVL63:
	.loc 1 2115 0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL64:
.L140:
	.cfi_restore_state
	.loc 1 2110 0
	movq	%rsi, %rdi
	call	__asan_report_load4
.LVL65:
.L139:
	.loc 1 2109 0
	call	__asan_report_store8
.LVL66:
.L138:
	movq	%rsp, %rdi
	.loc 1 2108 0
	call	__asan_report_load8
.LVL67:
.L143:
	.loc 1 2113 0
	call	__asan_report_load4
.LVL68:
.L142:
	call	__asan_report_load8
.LVL69:
	.cfi_endproc
.LFE30:
	.size	wakeup_connection, .-wakeup_connection
	.section	.text.unlikely
.LCOLDE13:
	.text
.LHOTE13:
	.globl	__asan_stack_malloc_1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC14:
	.string	"1 32 16 2 tv "
	.section	.rodata
	.align 32
.LC15:
	.string	"up %ld seconds, stats for %ld seconds:"
	.zero	57
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4,,15
	.type	logstats, @function
logstats:
.LASANPC34:
.LFB34:
	.loc 1 2149 0
	.cfi_startproc
.LVL70:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsp, %rbp
	movq	%rsp, %r13
	testl	%eax, %eax
	jne	.L152
.LVL71:
.L144:
	.loc 1 2149 0
	movq	%rbp, %r12
	movq	$1102416563, 0(%rbp)
	movq	$.LC14, 8(%rbp)
	shrq	$3, %r12
	.loc 1 2154 0
	testq	%rbx, %rbx
	.loc 1 2149 0
	movq	$.LASANPC34, 16(%rbp)
	movl	$-235802127, 2147450880(%r12)
	movl	$-185335808, 2147450884(%r12)
	movl	$-202116109, 2147450888(%r12)
	.loc 1 2154 0
	je	.L153
.LVL72:
.L148:
	.loc 1 2159 0
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L154
	movq	(%rbx), %rax
.LVL73:
	.loc 1 2163 0
	movl	$1, %ecx
	.loc 1 2165 0
	movl	$.LC15, %esi
	movl	$6, %edi
	.loc 1 2160 0
	movq	%rax, %rdx
	.loc 1 2163 0
	movq	%rax, %rbx
.LVL74:
	.loc 1 2160 0
	subq	start_time(%rip), %rdx
.LVL75:
	.loc 1 2163 0
	subq	stats_time(%rip), %rbx
.LVL76:
	.loc 1 2164 0
	movq	%rax, stats_time(%rip)
	.loc 1 2163 0
	cmove	%rcx, %rbx
.LVL77:
	.loc 1 2165 0
	xorl	%eax, %eax
.LVL78:
	movq	%rbx, %rcx
	call	syslog
.LVL79:
	.loc 1 2168 0
	movq	%rbx, %rdi
	call	thttpd_logstats
.LVL80:
	.loc 1 2169 0
	movq	%rbx, %rdi
	call	httpd_logstats
.LVL81:
	.loc 1 2170 0
	movq	%rbx, %rdi
	call	mmc_logstats
.LVL82:
	.loc 1 2171 0
	movq	%rbx, %rdi
	call	fdwatch_logstats
.LVL83:
	.loc 1 2172 0
	movq	%rbx, %rdi
	call	tmr_logstats
.LVL84:
	.loc 1 2149 0
	cmpq	%rbp, %r13
	jne	.L155
	movq	$0, 2147450880(%r12)
	movl	$0, 2147450888(%r12)
.L146:
	.loc 1 2173 0
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL85:
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.LVL86:
	.p2align 4,,10
	.p2align 3
.L153:
	.cfi_restore_state
	.loc 1 2156 0
	leaq	32(%rbp), %rbx
.LVL87:
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	gettimeofday
.LVL88:
	jmp	.L148
.LVL89:
.L155:
	.loc 1 2149 0
	movabsq	$-723401728380766731, %rax
	movq	$1172321806, 0(%rbp)
	movl	$-168430091, 2147450888(%r12)
	movq	%rax, 2147450880(%r12)
	jmp	.L146
.LVL90:
.L152:
	movq	%rsp, %rsi
	movl	$96, %edi
	call	__asan_stack_malloc_1
.LVL91:
	movq	%rax, %rbp
	jmp	.L144
.L154:
	.loc 1 2159 0
	movq	%rbx, %rdi
	call	__asan_report_load8
.LVL92:
	.cfi_endproc
.LFE34:
	.size	logstats, .-logstats
	.section	.text.unlikely
.LCOLDE16:
	.text
.LHOTE16:
	.section	.text.unlikely
.LCOLDB17:
	.text
.LHOTB17:
	.p2align 4,,15
	.type	show_stats, @function
show_stats:
.LASANPC33:
.LFB33:
	.loc 1 2140 0
	.cfi_startproc
.LVL93:
	.loc 1 2141 0
	movq	%rsi, %rdi
.LVL94:
	jmp	logstats
.LVL95:
	.cfi_endproc
.LFE33:
	.size	show_stats, .-show_stats
	.section	.text.unlikely
.LCOLDE17:
	.text
.LHOTE17:
	.section	.text.unlikely
.LCOLDB18:
	.text
.LHOTB18:
	.p2align 4,,15
	.type	handle_usr2, @function
handle_usr2:
.LASANPC6:
.LFB6:
	.loc 1 282 0
	.cfi_startproc
.LVL96:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 283 0
	call	__errno_location
.LVL97:
	movq	%rax, %rbx
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rbx, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L158
	testb	%dl, %dl
	jne	.L173
.L158:
	.loc 1 290 0
	xorl	%edi, %edi
	.loc 1 283 0
	movl	(%rbx), %ebp
.LVL98:
	.loc 1 290 0
	call	logstats
.LVL99:
	.loc 1 293 0
	movq	%rbx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rbx, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L159
	testb	%dl, %dl
	jne	.L174
.L159:
	movl	%ebp, (%rbx)
	.loc 1 294 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL100:
	ret
.LVL101:
.L174:
	.cfi_restore_state
	.loc 1 293 0
	movq	%rbx, %rdi
	call	__asan_report_store4
.LVL102:
.L173:
	.loc 1 283 0
	movq	%rbx, %rdi
	call	__asan_report_load4
.LVL103:
	.cfi_endproc
.LFE6:
	.size	handle_usr2, .-handle_usr2
	.section	.text.unlikely
.LCOLDE18:
	.text
.LHOTE18:
	.section	.text.unlikely
.LCOLDB19:
	.text
.LHOTB19:
	.p2align 4,,15
	.type	occasional, @function
occasional:
.LASANPC32:
.LFB32:
	.loc 1 2130 0
	.cfi_startproc
.LVL104:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 2131 0
	movq	%rsi, %rdi
.LVL105:
	call	mmc_cleanup
.LVL106:
	.loc 1 2132 0
	call	tmr_cleanup
.LVL107:
	.loc 1 2133 0
	movl	$1, watchdog_flag(%rip)
	.loc 1 2134 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE32:
	.size	occasional, .-occasional
	.section	.text.unlikely
.LCOLDE19:
	.text
.LHOTE19:
	.section	.rodata
	.align 32
.LC20:
	.string	"/tmp"
	.zero	59
	.section	.text.unlikely
.LCOLDB21:
	.text
.LHOTB21:
	.p2align 4,,15
	.type	handle_alrm, @function
handle_alrm:
.LASANPC7:
.LFB7:
	.loc 1 300 0
	.cfi_startproc
.LVL108:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 301 0
	call	__errno_location
.LVL109:
	movq	%rax, %rbx
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rbx, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L178
	testb	%dl, %dl
	jne	.L194
.L178:
	.loc 1 304 0
	movl	watchdog_flag(%rip), %eax
	.loc 1 301 0
	movl	(%rbx), %ebp
.LVL110:
	.loc 1 304 0
	testl	%eax, %eax
	je	.L195
	.loc 1 318 0
	movl	$360, %edi
	.loc 1 311 0
	movl	$0, watchdog_flag(%rip)
	.loc 1 318 0
	call	alarm
.LVL111:
	.loc 1 321 0
	movq	%rbx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rbx, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L180
	testb	%dl, %dl
	jne	.L196
.L180:
	movl	%ebp, (%rbx)
	.loc 1 322 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL112:
	ret
.LVL113:
.L196:
	.cfi_restore_state
	.loc 1 321 0
	movq	%rbx, %rdi
	call	__asan_report_store4
.LVL114:
.L194:
	.loc 1 301 0
	movq	%rbx, %rdi
	call	__asan_report_load4
.LVL115:
.L195:
	.loc 1 307 0
	movl	$.LC20, %edi
	call	chdir
.LVL116:
	.loc 1 309 0
	call	__asan_handle_no_return
.LVL117:
	call	abort
.LVL118:
	.cfi_endproc
.LFE7:
	.size	handle_alrm, .-handle_alrm
	.section	.text.unlikely
.LCOLDE21:
	.text
.LHOTE21:
	.section	.rodata.str1.1
.LC22:
	.string	"1 32 4 6 status "
	.section	.rodata
	.align 32
.LC23:
	.string	"child wait - %m"
	.zero	48
	.section	.text.unlikely
.LCOLDB24:
	.text
.LHOTB24:
	.p2align 4,,15
	.type	handle_chld, @function
handle_chld:
.LASANPC3:
.LFB3:
	.loc 1 185 0
	.cfi_startproc
.LVL119:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	leaq	16(%rsp), %rbp
	testl	%eax, %eax
	jne	.L246
.LVL120:
.L197:
	.loc 1 185 0
	movq	%rbp, %r13
	movq	$1102416563, 0(%rbp)
	movq	$.LC22, 8(%rbp)
	shrq	$3, %r13
	movq	$.LASANPC3, 16(%rbp)
	leaq	96(%rbp), %r12
	movl	$-235802127, 2147450880(%r13)
	movl	$-185273340, 2147450884(%r13)
	movl	$-202116109, 2147450888(%r13)
	.loc 1 186 0
	call	__errno_location
.LVL121:
	movq	%rax, %rbx
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rbx, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L201
	testb	%dl, %dl
	jne	.L247
.L201:
	movl	(%rbx), %eax
	.loc 1 207 0
	movq	%rbx, %r15
	subq	$64, %r12
	.loc 1 224 0
	xorl	%r14d, %r14d
	.loc 1 207 0
	shrq	$3, %r15
	.loc 1 186 0
	movl	%eax, 12(%rsp)
.LVL122:
	.loc 1 207 0
	movq	%rbx, %rax
.LVL123:
	andl	$7, %eax
.LVL124:
	addl	$3, %eax
	movb	%al, 11(%rsp)
.LVL125:
	.p2align 4,,10
	.p2align 3
.L202:
	.loc 1 199 0
	movl	$1, %edx
	movq	%r12, %rsi
	movl	$-1, %edi
	call	waitpid
.LVL126:
	.loc 1 203 0
	testl	%eax, %eax
	je	.L207
	.loc 1 205 0
	js	.L248
	.loc 1 222 0
	movq	hs(%rip), %rdx
	testq	%rdx, %rdx
	je	.L202
	.loc 1 224 0
	leaq	36(%rdx), %rdi
	movq	%rdi, %rax
.LVL127:
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L208
	testb	%cl, %cl
	jne	.L249
.L208:
	movl	36(%rdx), %eax
	subl	$1, %eax
	cmovs	%r14d, %eax
	movl	%eax, 36(%rdx)
	jmp	.L202
.LVL128:
	.p2align 4,,10
	.p2align 3
.L248:
	.loc 1 207 0
	movzbl	2147450880(%r15), %eax
.LVL129:
	cmpb	%al, 11(%rsp)
	jl	.L205
	testb	%al, %al
	jne	.L250
.L205:
	movl	(%rbx), %eax
	cmpl	$4, %eax
	je	.L202
	cmpl	$11, %eax
	je	.L202
	.loc 1 212 0
	cmpl	$10, %eax
	je	.L207
	.loc 1 213 0
	movl	$.LC23, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.LVL130:
.L207:
	.loc 1 231 0
	movq	%rbx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rbx, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L211
	testb	%dl, %dl
	jne	.L251
.L211:
	movl	12(%rsp), %eax
	movl	%eax, (%rbx)
	.loc 1 185 0
	leaq	16(%rsp), %rax
	cmpq	%rbp, %rax
	jne	.L252
	movq	$0, 2147450880(%r13)
	movl	$0, 2147450888(%r13)
.LVL131:
.L199:
	.loc 1 232 0
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL132:
.L246:
	.cfi_restore_state
	.loc 1 185 0
	movq	%rbp, %rsi
	movl	$96, %edi
.LVL133:
	call	__asan_stack_malloc_1
.LVL134:
	movq	%rax, %rbp
	jmp	.L197
.LVL135:
.L252:
	movabsq	$-723401728380766731, %rax
	movq	$1172321806, 0(%rbp)
.LVL136:
	movl	$-168430091, 2147450888(%r13)
	movq	%rax, 2147450880(%r13)
	jmp	.L199
.LVL137:
.L251:
	.loc 1 231 0
	movq	%rbx, %rdi
	call	__asan_report_store4
.LVL138:
.L249:
	.loc 1 224 0
	call	__asan_report_load4
.LVL139:
.L250:
	.loc 1 207 0
	movq	%rbx, %rdi
	call	__asan_report_load4
.LVL140:
.L247:
	.loc 1 186 0
	movq	%rbx, %rdi
	call	__asan_report_load4
.LVL141:
	.cfi_endproc
.LFE3:
	.size	handle_chld, .-handle_chld
	.section	.text.unlikely
.LCOLDE24:
	.text
.LHOTE24:
	.section	.rodata
	.align 32
.LC25:
	.string	"out of memory copying a string"
	.zero	33
	.align 32
.LC26:
	.string	"%s: out of memory copying a string\n"
	.zero	60
	.section	.text.unlikely
.LCOLDB27:
	.text
.LHOTB27:
	.p2align 4,,15
	.type	e_strdup, @function
e_strdup:
.LASANPC15:
.LFB15:
	.loc 1 1220 0
	.cfi_startproc
.LVL142:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 1223 0
	call	strdup
.LVL143:
	.loc 1 1224 0
	testq	%rax, %rax
	je	.L257
	.loc 1 1231 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L257:
	.cfi_restore_state
	.loc 1 1226 0
	movl	$.LC25, %esi
	movl	$2, %edi
	call	syslog
.LVL144:
	.loc 1 1227 0
	movl	$stderr, %eax
	movq	argv0(%rip), %rdx
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L258
	movq	stderr(%rip), %rdi
	movl	$.LC26, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL145:
	.loc 1 1228 0
	call	__asan_handle_no_return
.LVL146:
	movl	$1, %edi
	call	exit
.LVL147:
.L258:
	.loc 1 1227 0
	movl	$stderr, %edi
	call	__asan_report_load8
.LVL148:
	.cfi_endproc
.LFE15:
	.size	e_strdup, .-e_strdup
	.section	.text.unlikely
.LCOLDE27:
	.text
.LHOTE27:
	.globl	__asan_stack_malloc_2
	.section	.rodata.str1.1
.LC28:
	.string	"1 32 100 4 line "
	.section	.rodata
	.align 32
.LC29:
	.string	"r"
	.zero	62
	.align 32
.LC30:
	.string	" \t\n\r"
	.zero	59
	.align 32
.LC31:
	.string	"debug"
	.zero	58
	.align 32
.LC32:
	.string	"port"
	.zero	59
	.align 32
.LC33:
	.string	"dir"
	.zero	60
	.align 32
.LC34:
	.string	"chroot"
	.zero	57
	.align 32
.LC35:
	.string	"nochroot"
	.zero	55
	.align 32
.LC36:
	.string	"data_dir"
	.zero	55
	.align 32
.LC37:
	.string	"symlink"
	.zero	56
	.align 32
.LC38:
	.string	"nosymlink"
	.zero	54
	.align 32
.LC39:
	.string	"symlinks"
	.zero	55
	.align 32
.LC40:
	.string	"nosymlinks"
	.zero	53
	.align 32
.LC41:
	.string	"user"
	.zero	59
	.align 32
.LC42:
	.string	"cgipat"
	.zero	57
	.align 32
.LC43:
	.string	"cgilimit"
	.zero	55
	.align 32
.LC44:
	.string	"urlpat"
	.zero	57
	.align 32
.LC45:
	.string	"noemptyreferers"
	.zero	48
	.align 32
.LC46:
	.string	"localpat"
	.zero	55
	.align 32
.LC47:
	.string	"throttles"
	.zero	54
	.align 32
.LC48:
	.string	"host"
	.zero	59
	.align 32
.LC49:
	.string	"logfile"
	.zero	56
	.align 32
.LC50:
	.string	"vhost"
	.zero	58
	.align 32
.LC51:
	.string	"novhost"
	.zero	56
	.align 32
.LC52:
	.string	"globalpasswd"
	.zero	51
	.align 32
.LC53:
	.string	"noglobalpasswd"
	.zero	49
	.align 32
.LC54:
	.string	"pidfile"
	.zero	56
	.align 32
.LC55:
	.string	"charset"
	.zero	56
	.align 32
.LC56:
	.string	"p3p"
	.zero	60
	.align 32
.LC57:
	.string	"max_age"
	.zero	56
	.align 32
.LC58:
	.string	"%s: unknown config option '%s'\n"
	.zero	32
	.section	.text.unlikely
.LCOLDB59:
	.text
.LHOTB59:
	.p2align 4,,15
	.type	read_config, @function
read_config:
.LASANPC12:
.LFB12:
	.loc 1 1000 0
	.cfi_startproc
.LVL149:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$216, %rsp
	.cfi_def_cfa_offset 272
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	leaq	16(%rsp), %r12
	testl	%eax, %eax
	jne	.L363
.LVL150:
.L259:
	.loc 1 1000 0
	movq	%r12, %r13
	movq	$1102416563, (%r12)
	movq	$.LC28, 8(%r12)
	shrq	$3, %r13
	movq	$.LASANPC12, 16(%r12)
	.loc 1 1008 0
	movl	$.LC29, %esi
	.loc 1 1000 0
	movl	$-235802127, 2147450880(%r13)
	movl	$-185273340, 2147450896(%r13)
	.loc 1 1008 0
	movq	%rbx, %rdi
	.loc 1 1000 0
	movl	$-202116109, 2147450900(%r13)
	.loc 1 1008 0
	call	fopen
.LVL151:
	.loc 1 1009 0
	testq	%rax, %rax
	.loc 1 1008 0
	movq	%rax, 8(%rsp)
.LVL152:
	.loc 1 1009 0
	je	.L359
	leaq	32(%r12), %rax
.LVL153:
	.loc 1 1031 0
	movabsq	$4294977024, %r14
	movq	%rax, (%rsp)
.LVL154:
.L263:
	.loc 1 1015 0
	movq	8(%rsp), %rdx
	movq	(%rsp), %rdi
	movl	$1000, %esi
	call	fgets
.LVL155:
	testq	%rax, %rax
	je	.L364
	.loc 1 1018 0
	movq	(%rsp), %rdi
	movl	$35, %esi
	call	strchr
.LVL156:
	testq	%rax, %rax
	je	.L264
	.loc 1 1019 0
	movq	%rax, %rdx
	movq	%rax, %rsi
	shrq	$3, %rdx
	andl	$7, %esi
	movzbl	2147450880(%rdx), %edx
	cmpb	%sil, %dl
	jg	.L265
	testb	%dl, %dl
	jne	.L365
.L265:
	movb	$0, (%rax)
.L264:
.LVL157:
	.loc 1 1023 0
	movq	(%rsp), %rbx
	movl	$.LC30, %esi
	movq	%rbx, %rdi
	call	strspn
.LVL158:
	leaq	(%rbx,%rax), %rbx
.LVL159:
	.loc 1 1026 0
	movq	%rbx, %rax
	movq	%rbx, %rdx
	shrq	$3, %rax
	andl	$7, %edx
	movzbl	2147450880(%rax), %eax
	cmpb	%dl, %al
	jg	.L266
	testb	%al, %al
	jne	.L366
	.p2align 4,,10
	.p2align 3
.L266:
	cmpb	$0, (%rbx)
	je	.L263
	.loc 1 1029 0
	movl	$.LC30, %esi
	movq	%rbx, %rdi
	call	strcspn
.LVL160:
	leaq	(%rbx,%rax), %r15
.LVL161:
	.loc 1 1031 0
	movq	%r15, %rax
	movq	%r15, %rsi
	shrq	$3, %rax
	andl	$7, %esi
	movzbl	2147450880(%rax), %eax
	cmpb	%sil, %al
	jg	.L268
	testb	%al, %al
	jne	.L367
.L268:
	movzbl	(%r15), %eax
	cmpb	$32, %al
	ja	.L269
	btq	%rax, %r14
	jnc	.L269
	movq	%r15, %rdi
.LVL162:
	.p2align 4,,10
	.p2align 3
.L272:
	.loc 1 1032 0
	movq	%rdi, %rax
	movq	%rdi, %rsi
	addq	$1, %r15
.LVL163:
	shrq	$3, %rax
	andl	$7, %esi
	movzbl	2147450880(%rax), %eax
	cmpb	%sil, %al
	jg	.L270
	testb	%al, %al
	jne	.L368
.L270:
	.loc 1 1031 0
	movq	%r15, %rax
	.loc 1 1032 0
	movb	$0, -1(%r15)
.LVL164:
	.loc 1 1031 0
	movq	%r15, %rsi
	shrq	$3, %rax
.LVL165:
	andl	$7, %esi
.LVL166:
	movzbl	2147450880(%rax), %eax
	cmpb	%sil, %al
	jg	.L271
	testb	%al, %al
	jne	.L369
.L271:
	movzbl	(%r15), %eax
	cmpb	$32, %al
	jbe	.L370
.L269:
.LVL167:
	.loc 1 1035 0
	movl	$61, %esi
	movq	%rbx, %rdi
	call	strchr
.LVL168:
	.loc 1 1036 0
	testq	%rax, %rax
	je	.L308
	.loc 1 1037 0
	movq	%rax, %rsi
	movq	%rax, %rdi
	leaq	1(%rax), %rbp
.LVL169:
	shrq	$3, %rsi
	andl	$7, %edi
	movzbl	2147450880(%rsi), %esi
	cmpb	%dil, %sil
	jg	.L274
	testb	%sil, %sil
	jne	.L371
.L274:
	movb	$0, (%rax)
.LVL170:
.L273:
	.loc 1 1039 0
	movl	$.LC31, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL171:
	testl	%eax, %eax
	je	.L372
	.loc 1 1044 0
	movl	$.LC32, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL172:
	testl	%eax, %eax
	je	.L373
	.loc 1 1049 0
	movl	$.LC33, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL173:
	testl	%eax, %eax
	je	.L374
	.loc 1 1054 0
	movl	$.LC34, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL174:
	testl	%eax, %eax
	je	.L375
	.loc 1 1060 0
	movl	$.LC35, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL175:
	testl	%eax, %eax
	je	.L376
	.loc 1 1066 0
	movl	$.LC36, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL176:
	testl	%eax, %eax
	je	.L377
	.loc 1 1071 0
	movl	$.LC37, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL177:
	testl	%eax, %eax
	je	.L361
	.loc 1 1076 0
	movl	$.LC38, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL178:
	testl	%eax, %eax
	je	.L362
	.loc 1 1081 0
	movl	$.LC39, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL179:
	testl	%eax, %eax
	je	.L361
	.loc 1 1086 0
	movl	$.LC40, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL180:
	testl	%eax, %eax
	je	.L362
	.loc 1 1091 0
	movl	$.LC41, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL181:
	testl	%eax, %eax
	je	.L378
	.loc 1 1096 0
	movl	$.LC42, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL182:
	testl	%eax, %eax
	je	.L379
	.loc 1 1101 0
	movl	$.LC43, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL183:
	testl	%eax, %eax
	je	.L380
	.loc 1 1106 0
	movl	$.LC44, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL184:
	testl	%eax, %eax
	je	.L381
	.loc 1 1111 0
	movl	$.LC45, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL185:
	testl	%eax, %eax
	je	.L382
	.loc 1 1116 0
	movl	$.LC46, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL186:
	testl	%eax, %eax
	je	.L383
	.loc 1 1121 0
	movl	$.LC47, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL187:
	testl	%eax, %eax
	je	.L384
	.loc 1 1126 0
	movl	$.LC48, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL188:
	testl	%eax, %eax
	je	.L385
	.loc 1 1131 0
	movl	$.LC49, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL189:
	testl	%eax, %eax
	je	.L386
	.loc 1 1136 0
	movl	$.LC50, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL190:
	testl	%eax, %eax
	je	.L387
	.loc 1 1141 0
	movl	$.LC51, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL191:
	testl	%eax, %eax
	je	.L388
	.loc 1 1146 0
	movl	$.LC52, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL192:
	testl	%eax, %eax
	je	.L389
	.loc 1 1151 0
	movl	$.LC53, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL193:
	testl	%eax, %eax
	je	.L390
	.loc 1 1156 0
	movl	$.LC54, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL194:
	testl	%eax, %eax
	je	.L391
	.loc 1 1161 0
	movl	$.LC55, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL195:
	testl	%eax, %eax
	je	.L392
	.loc 1 1166 0
	movl	$.LC56, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL196:
	testl	%eax, %eax
	je	.L393
	.loc 1 1171 0
	movl	$.LC57, %esi
	movq	%rbx, %rdi
	call	strcasecmp
.LVL197:
	testl	%eax, %eax
	jne	.L302
	.loc 1 1173 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL198:
	.loc 1 1174 0
	movq	%rbp, %rdi
	call	atoi
.LVL199:
	movl	%eax, max_age(%rip)
	.p2align 4,,10
	.p2align 3
.L276:
.LVL200:
	.loc 1 1185 0
	movl	$.LC30, %esi
	movq	%r15, %rdi
	call	strspn
.LVL201:
	leaq	(%r15,%rax), %rbx
.LVL202:
	.loc 1 1026 0
	movq	%rbx, %rax
	movq	%rbx, %rdx
	shrq	$3, %rax
	andl	$7, %edx
	movzbl	2147450880(%rax), %eax
	cmpb	%dl, %al
	jg	.L266
	testb	%al, %al
	je	.L266
	movq	%rbx, %rdi
	call	__asan_report_load1
.LVL203:
	.p2align 4,,10
	.p2align 3
.L370:
	.loc 1 1031 0
	btq	%rax, %r14
	movq	%r15, %rdi
	jc	.L272
.LVL204:
	jmp	.L269
.LVL205:
	.p2align 4,,10
	.p2align 3
.L372:
	.loc 1 1041 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	no_value_required
.LVL206:
	.loc 1 1042 0
	movl	$1, debug(%rip)
	jmp	.L276
.L373:
	.loc 1 1046 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL207:
	.loc 1 1047 0
	movq	%rbp, %rdi
	call	atoi
.LVL208:
	movw	%ax, port(%rip)
	jmp	.L276
.LVL209:
.L308:
	xorl	%ebp, %ebp
	jmp	.L273
.LVL210:
.L374:
	.loc 1 1051 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL211:
	.loc 1 1052 0
	movq	%rbp, %rdi
	call	e_strdup
.LVL212:
	movq	%rax, dir(%rip)
	jmp	.L276
.L375:
	.loc 1 1056 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	no_value_required
.LVL213:
	.loc 1 1057 0
	movl	$1, do_chroot(%rip)
	.loc 1 1058 0
	movl	$1, no_symlink_check(%rip)
	jmp	.L276
.L376:
	.loc 1 1062 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	no_value_required
.LVL214:
	.loc 1 1063 0
	movl	$0, do_chroot(%rip)
	.loc 1 1064 0
	movl	$0, no_symlink_check(%rip)
	jmp	.L276
.L361:
	.loc 1 1083 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	no_value_required
.LVL215:
	.loc 1 1084 0
	movl	$0, no_symlink_check(%rip)
	jmp	.L276
.L377:
	.loc 1 1068 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL216:
	.loc 1 1069 0
	movq	%rbp, %rdi
	call	e_strdup
.LVL217:
	movq	%rax, data_dir(%rip)
	jmp	.L276
.L362:
	.loc 1 1088 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	no_value_required
.LVL218:
	.loc 1 1089 0
	movl	$1, no_symlink_check(%rip)
	jmp	.L276
.L378:
	.loc 1 1093 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL219:
	.loc 1 1094 0
	movq	%rbp, %rdi
	call	e_strdup
.LVL220:
	movq	%rax, user(%rip)
	jmp	.L276
.L379:
	.loc 1 1098 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL221:
	.loc 1 1099 0
	movq	%rbp, %rdi
	call	e_strdup
.LVL222:
	movq	%rax, cgi_pattern(%rip)
	jmp	.L276
.L380:
	.loc 1 1103 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL223:
	.loc 1 1104 0
	movq	%rbp, %rdi
	call	atoi
.LVL224:
	movl	%eax, cgi_limit(%rip)
	jmp	.L276
.L381:
	.loc 1 1108 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL225:
	.loc 1 1109 0
	movq	%rbp, %rdi
	call	e_strdup
.LVL226:
	movq	%rax, url_pattern(%rip)
	jmp	.L276
.L383:
	.loc 1 1118 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL227:
	.loc 1 1119 0
	movq	%rbp, %rdi
	call	e_strdup
.LVL228:
	movq	%rax, local_pattern(%rip)
	jmp	.L276
.L382:
	.loc 1 1113 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	no_value_required
.LVL229:
	.loc 1 1114 0
	movl	$1, no_empty_referers(%rip)
	jmp	.L276
.LVL230:
.L364:
	.loc 1 1189 0
	movq	8(%rsp), %rdi
	call	fclose
.LVL231:
	.loc 1 1000 0
	leaq	16(%rsp), %rax
	cmpq	%r12, %rax
	jne	.L394
	movl	$0, 2147450880(%r13)
	movq	$0, 2147450896(%r13)
.LVL232:
.L261:
	.loc 1 1190 0
	addq	$216, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL233:
.L369:
	.cfi_restore_state
	.loc 1 1031 0
	movq	%r15, %rdi
	call	__asan_report_load1
.LVL234:
.L385:
	.loc 1 1128 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL235:
	.loc 1 1129 0
	movq	%rbp, %rdi
	call	e_strdup
.LVL236:
	movq	%rax, hostname(%rip)
	jmp	.L276
.L384:
	.loc 1 1123 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL237:
	.loc 1 1124 0
	movq	%rbp, %rdi
	call	e_strdup
.LVL238:
	movq	%rax, throttlefile(%rip)
	jmp	.L276
.L371:
	.loc 1 1037 0
	movq	%rax, %rdi
	call	__asan_report_store1
.LVL239:
.L394:
	.loc 1 1000 0
	movabsq	$-723401728380766731, %rax
	movq	$1172321806, (%r12)
.LVL240:
	movq	%rax, 2147450880(%r13)
	movq	%rax, 2147450888(%r13)
	movq	%rax, 2147450896(%r13)
	jmp	.L261
.LVL241:
.L368:
	.loc 1 1032 0
	call	__asan_report_store1
.LVL242:
.L359:
	.loc 1 1011 0
	movq	%rbx, %rdi
	call	perror
.LVL243:
	.loc 1 1012 0
	call	__asan_handle_no_return
.LVL244:
	movl	$1, %edi
	call	exit
.LVL245:
.L363:
	.loc 1 1000 0
	movq	%r12, %rsi
	movl	$192, %edi
	call	__asan_stack_malloc_2
.LVL246:
	movq	%rax, %r12
	jmp	.L259
.LVL247:
.L365:
	.loc 1 1019 0
	movq	%rax, %rdi
	call	__asan_report_store1
.LVL248:
.L366:
	.loc 1 1026 0
	movq	%rbx, %rdi
	call	__asan_report_load1
.LVL249:
.L367:
	.loc 1 1031 0
	movq	%r15, %rdi
	call	__asan_report_load1
.LVL250:
.L302:
	.loc 1 1178 0
	movl	$stderr, %eax
	movq	argv0(%rip), %rdx
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L395
	movq	stderr(%rip), %rdi
	movq	%rbx, %rcx
	movl	$.LC58, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL251:
	.loc 1 1180 0
	call	__asan_handle_no_return
.LVL252:
	movl	$1, %edi
	call	exit
.LVL253:
.L393:
	.loc 1 1168 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL254:
	.loc 1 1169 0
	movq	%rbp, %rdi
	call	e_strdup
.LVL255:
	movq	%rax, p3p(%rip)
	jmp	.L276
.L389:
	.loc 1 1148 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	no_value_required
.LVL256:
	.loc 1 1149 0
	movl	$1, do_global_passwd(%rip)
	jmp	.L276
.L388:
	.loc 1 1143 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	no_value_required
.LVL257:
	.loc 1 1144 0
	movl	$0, do_vhost(%rip)
	jmp	.L276
.L387:
	.loc 1 1138 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	no_value_required
.LVL258:
	.loc 1 1139 0
	movl	$1, do_vhost(%rip)
	jmp	.L276
.L386:
	.loc 1 1133 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL259:
	.loc 1 1134 0
	movq	%rbp, %rdi
	call	e_strdup
.LVL260:
	movq	%rax, logfile(%rip)
	jmp	.L276
.L391:
	.loc 1 1158 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL261:
	.loc 1 1159 0
	movq	%rbp, %rdi
	call	e_strdup
.LVL262:
	movq	%rax, pidfile(%rip)
	jmp	.L276
.L390:
	.loc 1 1153 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	no_value_required
.LVL263:
	.loc 1 1154 0
	movl	$0, do_global_passwd(%rip)
	jmp	.L276
.L392:
	.loc 1 1163 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	value_required
.LVL264:
	.loc 1 1164 0
	movq	%rbp, %rdi
	call	e_strdup
.LVL265:
	movq	%rax, charset(%rip)
	jmp	.L276
.L395:
	.loc 1 1178 0
	movl	$stderr, %edi
	call	__asan_report_load8
.LVL266:
	.cfi_endproc
.LFE12:
	.size	read_config, .-read_config
	.section	.text.unlikely
.LCOLDE59:
	.text
.LHOTE59:
	.section	.rodata
	.align 32
.LC60:
	.string	"nobody"
	.zero	57
	.align 32
.LC61:
	.string	"iso-8859-1"
	.zero	53
	.align 32
.LC62:
	.string	""
	.zero	63
	.align 32
.LC63:
	.string	"-V"
	.zero	61
	.align 32
.LC64:
	.string	"thttpd/2.27.0 Oct 3, 2014"
	.zero	38
	.align 32
.LC65:
	.string	"-C"
	.zero	61
	.align 32
.LC66:
	.string	"-p"
	.zero	61
	.align 32
.LC67:
	.string	"-d"
	.zero	61
	.align 32
.LC68:
	.string	"-r"
	.zero	61
	.align 32
.LC69:
	.string	"-nor"
	.zero	59
	.align 32
.LC70:
	.string	"-dd"
	.zero	60
	.align 32
.LC71:
	.string	"-s"
	.zero	61
	.align 32
.LC72:
	.string	"-nos"
	.zero	59
	.align 32
.LC73:
	.string	"-u"
	.zero	61
	.align 32
.LC74:
	.string	"-c"
	.zero	61
	.align 32
.LC75:
	.string	"-t"
	.zero	61
	.align 32
.LC76:
	.string	"-h"
	.zero	61
	.align 32
.LC77:
	.string	"-l"
	.zero	61
	.align 32
.LC78:
	.string	"-v"
	.zero	61
	.align 32
.LC79:
	.string	"-nov"
	.zero	59
	.align 32
.LC80:
	.string	"-g"
	.zero	61
	.align 32
.LC81:
	.string	"-nog"
	.zero	59
	.align 32
.LC82:
	.string	"-i"
	.zero	61
	.align 32
.LC83:
	.string	"-T"
	.zero	61
	.align 32
.LC84:
	.string	"-P"
	.zero	61
	.align 32
.LC85:
	.string	"-M"
	.zero	61
	.align 32
.LC86:
	.string	"-D"
	.zero	61
	.section	.text.unlikely
.LCOLDB87:
	.text
.LHOTB87:
	.p2align 4,,15
	.type	parse_args, @function
parse_args:
.LASANPC10:
.LFB10:
	.loc 1 837 0
	.cfi_startproc
.LVL267:
	.loc 1 841 0
	movl	$80, %eax
	.loc 1 883 0
	cmpl	$1, %edi
	.loc 1 837 0
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	.loc 1 840 0
	movl	$0, debug(%rip)
	.loc 1 837 0
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	.loc 1 841 0
	movw	%ax, port(%rip)
	.loc 1 837 0
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	.loc 1 842 0
	movq	$0, dir(%rip)
	.loc 1 837 0
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.loc 1 843 0
	movq	$0, data_dir(%rip)
	.loc 1 847 0
	movl	$0, do_chroot(%rip)
	.loc 1 849 0
	movl	$0, no_log(%rip)
	.loc 1 850 0
	movl	$0, no_symlink_check(%rip)
	.loc 1 854 0
	movl	$0, do_vhost(%rip)
	.loc 1 859 0
	movl	$0, do_global_passwd(%rip)
	.loc 1 864 0
	movq	$0, cgi_pattern(%rip)
	.loc 1 869 0
	movl	$0, cgi_limit(%rip)
	.loc 1 871 0
	movq	$0, url_pattern(%rip)
	.loc 1 872 0
	movl	$0, no_empty_referers(%rip)
	.loc 1 873 0
	movq	$0, local_pattern(%rip)
	.loc 1 874 0
	movq	$0, throttlefile(%rip)
	.loc 1 875 0
	movq	$0, hostname(%rip)
	.loc 1 876 0
	movq	$0, logfile(%rip)
	.loc 1 877 0
	movq	$0, pidfile(%rip)
	.loc 1 878 0
	movq	$.LC60, user(%rip)
	.loc 1 879 0
	movq	$.LC61, charset(%rip)
	.loc 1 880 0
	movq	$.LC62, p3p(%rip)
	.loc 1 881 0
	movl	$-1, max_age(%rip)
.LVL268:
	.loc 1 883 0
	jle	.L445
	leaq	8(%rsi), %rdi
.LVL269:
	movq	%rsi, %r13
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L470
	movq	8(%rsi), %rbx
	movq	%rbx, %rax
	movq	%rbx, %rdx
	shrq	$3, %rax
	andl	$7, %edx
	movzbl	2147450880(%rax), %eax
	cmpb	%dl, %al
	jg	.L399
	testb	%al, %al
	jne	.L471
.L399:
	cmpb	$45, (%rbx)
	jne	.L440
	movl	$1, %ebp
	jmp	.L443
.LVL270:
	.p2align 4,,10
	.p2align 3
.L477:
	.loc 1 890 0 discriminator 1
	leal	1(%rbp), %r14d
	cmpl	%r14d, %r12d
	jg	.L472
	.loc 1 895 0
	movl	$.LC66, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL271:
	testl	%eax, %eax
	je	.L407
.L406:
	.loc 1 900 0
	movl	$.LC67, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL272:
	testl	%eax, %eax
	jne	.L407
	.loc 1 900 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r12d
	jle	.L407
.LVL273:
	.loc 1 903 0 is_stmt 1
	movslq	%eax, %rdx
	leaq	0(%r13,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L473
	movq	(%rdi), %rdx
	movl	%eax, %ebp
	movq	%rdx, dir(%rip)
.LVL274:
.L405:
	.loc 1 981 0
	addl	$1, %ebp
.LVL275:
	.loc 1 883 0
	cmpl	%ebp, %r12d
	jle	.L397
.L479:
	.loc 1 883 0 is_stmt 0 discriminator 1
	movslq	%ebp, %rax
	leaq	0(%r13,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L474
	movq	(%rdi), %rbx
	movq	%rbx, %rax
	movq	%rbx, %rdx
	shrq	$3, %rax
	andl	$7, %edx
	movzbl	2147450880(%rax), %eax
	cmpb	%dl, %al
	jg	.L442
	testb	%al, %al
	jne	.L475
.L442:
	cmpb	$45, (%rbx)
	jne	.L440
.LVL276:
.L443:
	.loc 1 885 0 is_stmt 1
	movl	$.LC63, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL277:
	testl	%eax, %eax
	je	.L476
	.loc 1 890 0
	movl	$.LC65, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL278:
	testl	%eax, %eax
	je	.L477
	.loc 1 895 0
	movl	$.LC66, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL279:
	testl	%eax, %eax
	jne	.L406
	.loc 1 895 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %r14d
	cmpl	%r14d, %r12d
	jle	.L407
.LVL280:
	.loc 1 898 0 is_stmt 1
	movslq	%r14d, %rax
	leaq	0(%r13,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L478
	movq	(%rdi), %rdi
	movl	%r14d, %ebp
	.loc 1 981 0
	addl	$1, %ebp
	.loc 1 898 0
	call	atoi
.LVL281:
	.loc 1 883 0
	cmpl	%ebp, %r12d
	.loc 1 898 0
	movw	%ax, port(%rip)
	.loc 1 883 0
	jg	.L479
.LVL282:
.L397:
	.loc 1 983 0
	cmpl	%ebp, %r12d
	jne	.L440
	.loc 1 985 0
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
.LVL283:
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.LVL284:
	.p2align 4,,10
	.p2align 3
.L407:
	.cfi_restore_state
	.loc 1 905 0
	movl	$.LC68, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL285:
	testl	%eax, %eax
	jne	.L410
	.loc 1 907 0
	movl	$1, do_chroot(%rip)
	.loc 1 908 0
	movl	$1, no_symlink_check(%rip)
	jmp	.L405
	.p2align 4,,10
	.p2align 3
.L410:
	.loc 1 910 0
	movl	$.LC69, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL286:
	testl	%eax, %eax
	jne	.L411
	.loc 1 912 0
	movl	$0, do_chroot(%rip)
	.loc 1 913 0
	movl	$0, no_symlink_check(%rip)
	jmp	.L405
	.p2align 4,,10
	.p2align 3
.L472:
.LVL287:
	.loc 1 893 0
	movslq	%r14d, %rax
	leaq	0(%r13,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L480
	movq	(%rdi), %rdi
	movl	%r14d, %ebp
	call	read_config
.LVL288:
	jmp	.L405
.LVL289:
	.p2align 4,,10
	.p2align 3
.L411:
	.loc 1 915 0
	movl	$.LC70, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL290:
	testl	%eax, %eax
	jne	.L412
	.loc 1 915 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r12d
	jle	.L412
.LVL291:
	.loc 1 918 0 is_stmt 1
	movslq	%eax, %rdx
	leaq	0(%r13,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L481
	movq	(%rdi), %rdx
	movl	%eax, %ebp
	movq	%rdx, data_dir(%rip)
	jmp	.L405
.LVL292:
	.p2align 4,,10
	.p2align 3
.L412:
	.loc 1 920 0
	movl	$.LC71, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL293:
	testl	%eax, %eax
	jne	.L414
	.loc 1 921 0
	movl	$0, no_symlink_check(%rip)
	jmp	.L405
	.p2align 4,,10
	.p2align 3
.L414:
	.loc 1 922 0
	movl	$.LC72, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL294:
	testl	%eax, %eax
	je	.L482
	.loc 1 924 0
	movl	$.LC73, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL295:
	testl	%eax, %eax
	jne	.L416
	.loc 1 924 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r12d
	jle	.L416
.LVL296:
	.loc 1 927 0 is_stmt 1
	movslq	%eax, %rdx
	leaq	0(%r13,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L483
	movq	(%rdi), %rdx
	movl	%eax, %ebp
	movq	%rdx, user(%rip)
	jmp	.L405
.LVL297:
.L482:
	.loc 1 923 0
	movl	$1, no_symlink_check(%rip)
	jmp	.L405
.L416:
	.loc 1 929 0
	movl	$.LC74, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL298:
	testl	%eax, %eax
	jne	.L418
	.loc 1 929 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r12d
	jle	.L418
.LVL299:
	.loc 1 932 0 is_stmt 1
	movslq	%eax, %rdx
	leaq	0(%r13,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L484
	movq	(%rdi), %rdx
	movl	%eax, %ebp
	movq	%rdx, cgi_pattern(%rip)
	jmp	.L405
.LVL300:
.L418:
	.loc 1 934 0
	movl	$.LC75, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL301:
	testl	%eax, %eax
	je	.L485
	.loc 1 939 0
	movl	$.LC76, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL302:
	testl	%eax, %eax
	jne	.L423
	.loc 1 939 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r12d
	jle	.L424
.LVL303:
	.loc 1 942 0 is_stmt 1
	movslq	%eax, %rdx
	leaq	0(%r13,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L486
	movq	(%rdi), %rdx
	movl	%eax, %ebp
	movq	%rdx, hostname(%rip)
	jmp	.L405
.LVL304:
.L485:
	.loc 1 934 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r12d
	jle	.L421
.LVL305:
	.loc 1 937 0
	movslq	%eax, %rdx
	leaq	0(%r13,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L487
	movq	(%rdi), %rdx
	movl	%eax, %ebp
	movq	%rdx, throttlefile(%rip)
	jmp	.L405
.LVL306:
.L421:
	.loc 1 939 0
	movl	$.LC76, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL307:
	testl	%eax, %eax
	jne	.L423
.L424:
	.loc 1 949 0
	movl	$.LC78, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL308:
	testl	%eax, %eax
	jne	.L427
	.loc 1 950 0
	movl	$1, do_vhost(%rip)
	jmp	.L405
.L423:
	.loc 1 944 0
	movl	$.LC77, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL309:
	testl	%eax, %eax
	jne	.L424
	.loc 1 944 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r12d
	jle	.L424
.LVL310:
	.loc 1 947 0 is_stmt 1
	movslq	%eax, %rdx
	leaq	0(%r13,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L488
	movq	(%rdi), %rdx
	movl	%eax, %ebp
	movq	%rdx, logfile(%rip)
	jmp	.L405
.LVL311:
.L427:
	.loc 1 951 0
	movl	$.LC79, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL312:
	testl	%eax, %eax
	je	.L489
	.loc 1 953 0
	movl	$.LC80, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL313:
	testl	%eax, %eax
	jne	.L429
	.loc 1 954 0
	movl	$1, do_global_passwd(%rip)
	jmp	.L405
.L489:
	.loc 1 952 0
	movl	$0, do_vhost(%rip)
	jmp	.L405
.LVL314:
.L445:
	.loc 1 882 0
	movl	$1, %ebp
	jmp	.L397
.LVL315:
.L429:
	.loc 1 955 0
	movl	$.LC81, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL316:
	testl	%eax, %eax
	jne	.L430
	.loc 1 956 0
	movl	$0, do_global_passwd(%rip)
	jmp	.L405
.L476:
	.loc 1 887 0
	movl	$.LC64, %edi
	call	puts
.LVL317:
	.loc 1 888 0
	call	__asan_handle_no_return
.LVL318:
	xorl	%edi, %edi
	call	exit
.LVL319:
.L430:
	.loc 1 957 0
	movl	$.LC82, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL320:
	testl	%eax, %eax
	jne	.L431
	.loc 1 957 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r12d
	jle	.L431
.LVL321:
	.loc 1 960 0 is_stmt 1
	movslq	%eax, %rdx
	leaq	0(%r13,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L490
	movq	(%rdi), %rdx
	movl	%eax, %ebp
	movq	%rdx, pidfile(%rip)
	jmp	.L405
.LVL322:
.L431:
	.loc 1 962 0
	movl	$.LC83, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL323:
	testl	%eax, %eax
	jne	.L433
	.loc 1 962 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r12d
	jle	.L434
.LVL324:
	.loc 1 965 0 is_stmt 1
	movslq	%eax, %rdx
	leaq	0(%r13,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L491
	movq	(%rdi), %rdx
	movl	%eax, %ebp
	movq	%rdx, charset(%rip)
	jmp	.L405
.LVL325:
.L433:
	.loc 1 967 0
	movl	$.LC84, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL326:
	testl	%eax, %eax
	jne	.L436
	.loc 1 967 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r12d
	jle	.L437
.LVL327:
	.loc 1 970 0 is_stmt 1
	movslq	%eax, %rdx
	leaq	0(%r13,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L492
	movq	(%rdi), %rdx
	movl	%eax, %ebp
	movq	%rdx, p3p(%rip)
	jmp	.L405
.LVL328:
.L434:
	.loc 1 967 0
	movl	$.LC84, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL329:
	testl	%eax, %eax
	je	.L437
.L436:
	.loc 1 972 0
	movl	$.LC85, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL330:
	testl	%eax, %eax
	jne	.L437
	.loc 1 972 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %r14d
	cmpl	%r14d, %r12d
	jle	.L437
.LVL331:
	.loc 1 975 0 is_stmt 1
	movslq	%r14d, %rax
	leaq	0(%r13,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L493
	movq	(%rdi), %rdi
	movl	%r14d, %ebp
	call	atoi
.LVL332:
	movl	%eax, max_age(%rip)
	jmp	.L405
.LVL333:
.L437:
	.loc 1 977 0
	movl	$.LC86, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL334:
	testl	%eax, %eax
	jne	.L440
	.loc 1 978 0
	movl	$1, debug(%rip)
	jmp	.L405
.LVL335:
.L488:
	.loc 1 947 0
	call	__asan_report_load8
.LVL336:
.L483:
	.loc 1 927 0
	call	__asan_report_load8
.LVL337:
.L490:
	.loc 1 960 0
	call	__asan_report_load8
.LVL338:
.L493:
	.loc 1 975 0
	call	__asan_report_load8
.LVL339:
.L491:
	.loc 1 965 0
	call	__asan_report_load8
.LVL340:
.L492:
	.loc 1 970 0
	call	__asan_report_load8
.LVL341:
.L480:
	.loc 1 893 0
	call	__asan_report_load8
.LVL342:
.L478:
	.loc 1 898 0
	call	__asan_report_load8
.LVL343:
.L475:
	.loc 1 883 0
	movq	%rbx, %rdi
	call	__asan_report_load1
.LVL344:
.L471:
	movq	%rbx, %rdi
	call	__asan_report_load1
.LVL345:
.L486:
	.loc 1 942 0
	call	__asan_report_load8
.LVL346:
.L487:
	.loc 1 937 0
	call	__asan_report_load8
.LVL347:
.L484:
	.loc 1 932 0
	call	__asan_report_load8
.LVL348:
.L470:
	.loc 1 883 0
	call	__asan_report_load8
.LVL349:
.L440:
	.loc 1 980 0
	call	__asan_handle_no_return
.LVL350:
	call	usage
.LVL351:
.L474:
	.loc 1 883 0
	call	__asan_report_load8
.LVL352:
.L473:
	.loc 1 903 0
	call	__asan_report_load8
.LVL353:
.L481:
	.loc 1 918 0
	call	__asan_report_load8
.LVL354:
	.cfi_endproc
.LFE10:
	.size	parse_args, .-parse_args
	.section	.text.unlikely
.LCOLDE87:
	.text
.LHOTE87:
	.globl	__asan_stack_malloc_8
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC88:
	.string	"5 32 8 9 max_limit 96 8 9 min_limit 160 16 2 tv 224 5000 3 buf 5280 5000 7 pattern "
	.globl	__asan_stack_free_8
	.section	.rodata
	.align 32
.LC89:
	.string	"%.80s - %m"
	.zero	53
	.align 32
.LC90:
	.string	" %4900[^ \t] %ld-%ld"
	.zero	44
	.align 32
.LC91:
	.string	" %4900[^ \t] %ld"
	.zero	48
	.align 32
.LC92:
	.string	"unparsable line in %.80s - %.80s"
	.zero	63
	.align 32
.LC93:
	.string	"%s: unparsable line in %.80s - %.80s\n"
	.zero	58
	.align 32
.LC94:
	.string	"|/"
	.zero	61
	.align 32
.LC95:
	.string	"out of memory allocating a throttletab"
	.zero	57
	.align 32
.LC96:
	.string	"%s: out of memory allocating a throttletab\n"
	.zero	52
	.section	.text.unlikely
.LCOLDB97:
	.text
.LHOTB97:
	.p2align 4,,15
	.type	read_throttlefile, @function
read_throttlefile:
.LASANPC17:
.LFB17:
	.loc 1 1370 0
	.cfi_startproc
.LVL355:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$10392, %rsp
	.cfi_def_cfa_offset 10448
	movl	__asan_option_detect_stack_use_after_return(%rip), %edx
	leaq	48(%rsp), %rax
	movq	%rdi, 16(%rsp)
	testl	%edx, %edx
	movq	%rax, 24(%rsp)
	jne	.L577
.LVL356:
.L494:
	.loc 1 1370 0
	movq	24(%rsp), %rax
	.loc 1 1379 0
	movl	$.LC29, %esi
	.loc 1 1370 0
	movq	$1102416563, (%rax)
.LVL357:
	movq	$.LC88, 8(%rax)
	leaq	10336(%rax), %r14
	movq	$.LASANPC17, 16(%rax)
	.loc 1 1379 0
	movq	16(%rsp), %rdi
	.loc 1 1370 0
	shrq	$3, %rax
	movq	%rax, 32(%rsp)
	movl	$-235802127, 2147450880(%rax)
	movl	$-185273344, 2147450884(%rax)
	movl	$-218959118, 2147450888(%rax)
	movl	$-185273344, 2147450892(%rax)
	movl	$-218959118, 2147450896(%rax)
	movl	$-185335808, 2147450900(%rax)
	movl	$-218959118, 2147450904(%rax)
	movl	$-185273344, 2147451532(%rax)
	movl	$-218959118, 2147451536(%rax)
	movl	$-185273344, 2147452164(%rax)
	movl	$-202116109, 2147452168(%rax)
	.loc 1 1379 0
	call	fopen
.LVL358:
	.loc 1 1380 0
	testq	%rax, %rax
	.loc 1 1379 0
	movq	%rax, %rbp
.LVL359:
	.loc 1 1380 0
	je	.L578
	.loc 1 1387 0
	movq	24(%rsp), %rbx
	xorl	%esi, %esi
	leaq	160(%rbx), %rdi
	leaq	224(%rbx), %r15
	.loc 1 1408 0
	leaq	32(%rbx), %r12
	leaq	96(%rbx), %r13
	.loc 1 1387 0
	call	gettimeofday
.LVL360:
	movq	%rbx, %rax
	.loc 1 1408 0
	leaq	5280(%rbx), %rbx
	.loc 1 1424 0
	addq	$5281, %rax
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L499:
	.loc 1 1389 0
	movq	%rbp, %rdx
	movl	$5000, %esi
	movq	%r15, %rdi
	call	fgets
.LVL361:
	testq	%rax, %rax
	je	.L579
	.loc 1 1392 0
	movl	$35, %esi
	movq	%r15, %rdi
	call	strchr
.LVL362:
	.loc 1 1393 0
	testq	%rax, %rax
	je	.L500
	.loc 1 1394 0
	movq	%rax, %rdx
	movq	%rax, %rcx
	shrq	$3, %rdx
	andl	$7, %ecx
	movzbl	2147450880(%rdx), %edx
	cmpb	%cl, %dl
	jg	.L501
	testb	%dl, %dl
	jne	.L580
.L501:
	movb	$0, (%rax)
.L500:
	.loc 1 1397 0
	movq	%r15, %rdi
	call	strlen
.LVL363:
	.loc 1 1398 0
	cmpl	$0, %eax
	jle	.L502
	.loc 1 1399 0
	subl	$1, %eax
.LVL364:
	movslq	%eax, %rdx
	leaq	(%r15,%rdx), %rdi
	movq	%rdi, %rcx
	movq	%rdi, %rsi
	shrq	$3, %rcx
	andl	$7, %esi
	movzbl	2147450880(%rcx), %ecx
	cmpb	%sil, %cl
	jg	.L503
	testb	%cl, %cl
	jne	.L581
.L503:
	movzbl	-10112(%r14,%rdx), %ecx
	cmpb	$32, %cl
	jbe	.L582
.LVL365:
	.p2align 4,,10
	.p2align 3
.L504:
	.loc 1 1408 0
	xorl	%eax, %eax
	movq	%r12, %r8
	movq	%r13, %rcx
	movq	%rbx, %rdx
	movl	$.LC90, %esi
	movq	%r15, %rdi
	call	__isoc99_sscanf
.LVL366:
	cmpl	$3, %eax
	je	.L506
	.loc 1 1410 0
	xorl	%eax, %eax
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	$.LC91, %esi
	movq	%r15, %rdi
	call	__isoc99_sscanf
.LVL367:
	cmpl	$2, %eax
	jne	.L512
	.loc 1 1411 0
	movq	$0, -10240(%r14)
	.p2align 4,,10
	.p2align 3
.L506:
	.loc 1 1423 0
	cmpb	$47, -5056(%r14)
	jne	.L515
	jmp	.L583
.LVL368:
	.p2align 4,,10
	.p2align 3
.L516:
	.loc 1 1426 0
	leaq	2(%rax), %rsi
	leaq	1(%rax), %rdi
	call	strcpy
.LVL369:
.L515:
	.loc 1 1425 0
	movl	$.LC94, %esi
	movq	%rbx, %rdi
	call	strstr
.LVL370:
	testq	%rax, %rax
	jne	.L516
	.loc 1 1429 0
	movslq	numthrottles(%rip), %rcx
	movl	maxthrottles(%rip), %eax
.LVL371:
	cmpl	%eax, %ecx
	jl	.L517
	.loc 1 1431 0
	testl	%eax, %eax
	jne	.L518
	.loc 1 1434 0
	movl	$4800, %edi
	.loc 1 1433 0
	movl	$100, maxthrottles(%rip)
	.loc 1 1434 0
	call	malloc
.LVL372:
	movq	%rax, throttles(%rip)
.L519:
	.loc 1 1441 0
	testq	%rax, %rax
	je	.L520
	movslq	numthrottles(%rip), %rcx
.L521:
	.loc 1 1452 0
	leaq	(%rcx,%rcx,2), %rdx
	movq	%rbx, %rdi
	salq	$4, %rdx
	addq	%rax, %rdx
	movq	%rdx, 8(%rsp)
	call	e_strdup
.LVL373:
	movq	8(%rsp), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	cmpb	$0, 2147450880(%rcx)
	jne	.L584
	movq	%rax, (%rdx)
	.loc 1 1453 0
	movslq	numthrottles(%rip), %rax
	movq	-10304(%r14), %rcx
	movq	%rax, %rdx
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	addq	throttles(%rip), %rax
	leaq	8(%rax), %rdi
	movq	%rdi, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L585
	.loc 1 1454 0
	leaq	16(%rax), %rdi
	.loc 1 1453 0
	movq	%rcx, 8(%rax)
	.loc 1 1454 0
	movq	-10240(%r14), %rcx
	movq	%rdi, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L586
	.loc 1 1455 0
	leaq	24(%rax), %rdi
	.loc 1 1454 0
	movq	%rcx, 16(%rax)
	.loc 1 1455 0
	movq	%rdi, %rcx
	shrq	$3, %rcx
	cmpb	$0, 2147450880(%rcx)
	jne	.L587
	.loc 1 1456 0
	leaq	32(%rax), %rdi
	.loc 1 1455 0
	movq	$0, 24(%rax)
	.loc 1 1456 0
	movq	%rdi, %rcx
	shrq	$3, %rcx
	cmpb	$0, 2147450880(%rcx)
	jne	.L588
	.loc 1 1457 0
	leaq	40(%rax), %rdi
	.loc 1 1456 0
	movq	$0, 32(%rax)
	.loc 1 1457 0
	movq	%rdi, %rcx
	shrq	$3, %rcx
	movzbl	2147450880(%rcx), %ecx
	testb	%cl, %cl
	je	.L528
	cmpb	$3, %cl
	jle	.L589
.L528:
	movl	$0, 40(%rax)
	.loc 1 1459 0
	leal	1(%rdx), %eax
	movl	%eax, numthrottles(%rip)
	jmp	.L499
.LVL374:
	.p2align 4,,10
	.p2align 3
.L582:
	.loc 1 1400 0
	movabsq	$4294977024, %r8
.LVL375:
	.p2align 4,,10
	.p2align 3
.L576:
	btq	%rcx, %r8
	jnc	.L504
.LVL376:
	.loc 1 1401 0
	leaq	(%r15,%rdx), %rdi
	movq	%rdi, %rcx
	movq	%rdi, %rsi
	shrq	$3, %rcx
	andl	$7, %esi
	movzbl	2147450880(%rcx), %ecx
	cmpb	%sil, %cl
	jg	.L508
	testb	%cl, %cl
	jne	.L590
.L508:
	.loc 1 1398 0
	testl	%eax, %eax
	.loc 1 1401 0
	movb	$0, -10112(%r14,%rdx)
	.loc 1 1398 0
	je	.L499
	.loc 1 1399 0 discriminator 1
	subl	$1, %eax
.LVL377:
	movslq	%eax, %rdx
	leaq	(%r15,%rdx), %rdi
	movq	%rdi, %rcx
	movq	%rdi, %rsi
	shrq	$3, %rcx
	andl	$7, %esi
	movzbl	2147450880(%rcx), %ecx
	cmpb	%sil, %cl
	jg	.L510
	testb	%cl, %cl
	jne	.L591
.L510:
	movzbl	-10112(%r14,%rdx), %ecx
	cmpb	$32, %cl
	ja	.L504
	jmp	.L576
.LVL378:
.L518:
	.loc 1 1438 0
	addl	%eax, %eax
	.loc 1 1439 0
	movq	throttles(%rip), %rdi
	.loc 1 1438 0
	movl	%eax, maxthrottles(%rip)
	.loc 1 1439 0
	cltq
	leaq	(%rax,%rax,2), %rsi
	salq	$4, %rsi
	call	realloc
.LVL379:
	movq	%rax, throttles(%rip)
	jmp	.L519
.L512:
	.loc 1 1414 0
	movq	16(%rsp), %rdx
	xorl	%eax, %eax
	movq	%r15, %rcx
	movl	$.LC92, %esi
	movl	$2, %edi
	call	syslog
.LVL380:
	.loc 1 1416 0
	movl	$stderr, %eax
	movq	argv0(%rip), %rdx
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L592
	movq	16(%rsp), %rcx
	movq	stderr(%rip), %rdi
	movq	%r15, %r8
	movl	$.LC93, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL381:
	.loc 1 1419 0
	jmp	.L499
.L517:
	movq	throttles(%rip), %rax
	jmp	.L521
.L579:
	.loc 1 1461 0
	movq	%rbp, %rdi
	call	fclose
.LVL382:
	.loc 1 1370 0
	leaq	48(%rsp), %rax
	cmpq	24(%rsp), %rax
	jne	.L593
	movq	32(%rsp), %rax
	movq	$0, 2147450880(%rax)
	movq	$0, 2147450888(%rax)
	movq	$0, 2147450896(%rax)
	movl	$0, 2147450904(%rax)
	movq	$0, 2147451532(%rax)
	movq	$0, 2147452164(%rax)
.L496:
	.loc 1 1462 0
	addq	$10392, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL383:
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL384:
.L502:
	.cfi_restore_state
	.loc 1 1404 0
	jne	.L504
	jmp	.L499
.LVL385:
.L583:
	.loc 1 1424 0
	movq	40(%rsp), %rsi
	movq	%rbx, %rdi
	call	strcpy
.LVL386:
	jmp	.L515
.LVL387:
.L577:
	.loc 1 1370 0
	movq	%rax, %rsi
	movl	$10336, %edi
.LVL388:
	call	__asan_stack_malloc_8
.LVL389:
	movq	%rax, 24(%rsp)
	jmp	.L494
.LVL390:
.L593:
	movq	24(%rsp), %rax
	leaq	48(%rsp), %rdx
	movl	$10336, %esi
	movq	%rax, %rdi
	movq	$1172321806, (%rax)
	call	__asan_stack_free_8
.LVL391:
	jmp	.L496
.L592:
	.loc 1 1416 0
	movl	$stderr, %edi
	call	__asan_report_load8
.LVL392:
.L591:
	.loc 1 1399 0
	call	__asan_report_load1
.LVL393:
.L590:
	.loc 1 1401 0
	call	__asan_report_store1
.LVL394:
.L589:
	.loc 1 1457 0
	call	__asan_report_store4
.LVL395:
.L588:
	.loc 1 1456 0
	call	__asan_report_store8
.LVL396:
.L587:
	.loc 1 1455 0
	call	__asan_report_store8
.LVL397:
.L586:
	.loc 1 1454 0
	call	__asan_report_store8
.LVL398:
.L585:
	.loc 1 1453 0
	call	__asan_report_store8
.LVL399:
.L584:
	.loc 1 1452 0
	movq	%rdx, %rdi
	call	__asan_report_store8
.LVL400:
.L520:
	.loc 1 1443 0
	xorl	%eax, %eax
	movl	$.LC95, %esi
	movl	$2, %edi
	call	syslog
.LVL401:
	.loc 1 1444 0
	movl	$stderr, %eax
	movq	argv0(%rip), %rdx
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L594
	movq	stderr(%rip), %rdi
	movl	$.LC96, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL402:
	.loc 1 1447 0
	call	__asan_handle_no_return
.LVL403:
	movl	$1, %edi
	call	exit
.LVL404:
.L581:
	.loc 1 1399 0
	call	__asan_report_load1
.LVL405:
.L594:
	.loc 1 1444 0
	movl	$stderr, %edi
	call	__asan_report_load8
.LVL406:
.L580:
	.loc 1 1394 0
	movq	%rax, %rdi
	call	__asan_report_store1
.LVL407:
.L578:
	.loc 1 1382 0
	movq	16(%rsp), %rbx
	movl	$.LC89, %esi
	xorl	%eax, %eax
.LVL408:
	movl	$2, %edi
	movq	%rbx, %rdx
	call	syslog
.LVL409:
	.loc 1 1383 0
	movq	%rbx, %rdi
	call	perror
.LVL410:
	.loc 1 1384 0
	call	__asan_handle_no_return
.LVL411:
	movl	$1, %edi
	call	exit
.LVL412:
	.cfi_endproc
.LFE17:
	.size	read_throttlefile, .-read_throttlefile
	.section	.text.unlikely
.LCOLDE97:
	.text
.LHOTE97:
	.section	.rodata
	.align 32
.LC98:
	.string	"-"
	.zero	62
	.align 32
.LC99:
	.string	"re-opening logfile"
	.zero	45
	.align 32
.LC100:
	.string	"a"
	.zero	62
	.align 32
.LC101:
	.string	"re-opening %.80s - %m"
	.zero	42
	.section	.text.unlikely
.LCOLDB102:
	.text
.LHOTB102:
	.p2align 4,,15
	.type	re_open_logfile, @function
re_open_logfile:
.LASANPC8:
.LFB8:
	.loc 1 327 0
	.cfi_startproc
	.loc 1 331 0
	movl	no_log(%rip), %eax
	testl	%eax, %eax
	jne	.L608
	.loc 1 331 0 is_stmt 0 discriminator 1
	cmpq	$0, hs(%rip)
	je	.L608
	.loc 1 335 0 is_stmt 1
	movq	logfile(%rip), %rdi
	testq	%rdi, %rdi
	je	.L608
	.loc 1 327 0 discriminator 1
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.loc 1 335 0 discriminator 1
	movl	$.LC98, %esi
	.loc 1 327 0 discriminator 1
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 335 0 discriminator 1
	call	strcmp
.LVL413:
	testl	%eax, %eax
	jne	.L609
	.loc 1 348 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.L608:
	rep ret
	.p2align 4,,10
	.p2align 3
.L609:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	.loc 1 337 0
	xorl	%eax, %eax
	movl	$.LC99, %esi
	movl	$5, %edi
	call	syslog
.LVL414:
	.loc 1 338 0
	movq	logfile(%rip), %rdi
	movl	$.LC100, %esi
	call	fopen
.LVL415:
	.loc 1 339 0
	movq	logfile(%rip), %rbp
	.loc 1 338 0
	movq	%rax, %rbx
.LVL416:
	.loc 1 339 0
	movl	$384, %esi
	movq	%rbp, %rdi
	call	chmod
.LVL417:
	.loc 1 340 0
	testq	%rbx, %rbx
	je	.L599
	testl	%eax, %eax
	jne	.L599
	.loc 1 345 0
	movq	%rbx, %rdi
	call	fileno
.LVL418:
	movl	$2, %esi
	movl	%eax, %edi
	movl	$1, %edx
	xorl	%eax, %eax
	call	fcntl
.LVL419:
	.loc 1 346 0
	movq	hs(%rip), %rdi
	.loc 1 348 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	.loc 1 346 0
	movq	%rbx, %rsi
	.loc 1 348 0
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL420:
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	.loc 1 346 0
	jmp	httpd_set_logfp
.LVL421:
	.p2align 4,,10
	.p2align 3
.L599:
	.cfi_restore_state
	.loc 1 348 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	.loc 1 342 0
	movq	%rbp, %rdx
	movl	$.LC101, %esi
	.loc 1 348 0
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL422:
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	.loc 1 342 0
	movl	$2, %edi
	xorl	%eax, %eax
.LVL423:
	jmp	syslog
.LVL424:
	.cfi_endproc
.LFE8:
	.size	re_open_logfile, .-re_open_logfile
	.section	.text.unlikely
.LCOLDE102:
	.text
.LHOTE102:
	.section	.rodata
	.align 32
.LC103:
	.string	"too many connections!"
	.zero	42
	.align 32
.LC104:
	.string	"the connects free list is messed up"
	.zero	60
	.align 32
.LC105:
	.string	"out of memory allocating an httpd_conn"
	.zero	57
	.section	.text.unlikely
.LCOLDB106:
	.text
.LHOTB106:
	.p2align 4,,15
	.type	handle_newconnect, @function
handle_newconnect:
.LASANPC19:
.LFB19:
	.loc 1 1505 0
	.cfi_startproc
.LVL425:
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	.loc 1 1566 0
	movq	%rdi, %r13
	.loc 1 1505 0
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%esi, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbp
	.loc 1 1566 0
	shrq	$3, %r13
	.loc 1 1505 0
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movl	num_connects(%rip), %eax
.LVL426:
.L634:
	.loc 1 1516 0
	cmpl	%eax, max_connects(%rip)
	jle	.L686
	.loc 1 1527 0
	movslq	first_free_connect(%rip), %rax
	cmpl	$-1, %eax
	je	.L613
	.loc 1 1527 0 is_stmt 0 discriminator 1
	leaq	(%rax,%rax,8), %rbx
	salq	$4, %rbx
	addq	connects(%rip), %rbx
	movq	%rbx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L614
	cmpb	$3, %al
	jle	.L687
.L614:
	movl	(%rbx), %eax
	testl	%eax, %eax
	jne	.L613
.LVL427:
	.loc 1 1534 0 is_stmt 1
	leaq	8(%rbx), %r14
	movq	%r14, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L688
	movq	8(%rbx), %rdx
	testq	%rdx, %rdx
	je	.L689
.L617:
	.loc 1 1547 0
	movq	hs(%rip), %rdi
	movl	%r12d, %esi
	call	httpd_get_conn
.LVL428:
	testl	%eax, %eax
	je	.L621
	cmpl	$2, %eax
	je	.L636
	.loc 1 1560 0
	movq	%rbx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L622
	cmpb	$3, %al
	jle	.L690
.L622:
	.loc 1 1562 0
	leaq	4(%rbx), %rdi
	.loc 1 1560 0
	movl	$1, (%rbx)
	.loc 1 1562 0
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L623
	testb	%dl, %dl
	jne	.L691
.L623:
	.loc 1 1564 0
	addl	$1, num_connects(%rip)
.LVL429:
	.loc 1 1566 0
	cmpb	$0, 2147450880(%r13)
	.loc 1 1562 0
	movl	4(%rbx), %eax
	.loc 1 1563 0
	movl	$-1, 4(%rbx)
	.loc 1 1562 0
	movl	%eax, first_free_connect(%rip)
	.loc 1 1566 0
	jne	.L692
	leaq	88(%rbx), %rdi
	movq	0(%rbp), %rax
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L693
	.loc 1 1567 0
	leaq	96(%rbx), %rdi
	.loc 1 1566 0
	movq	%rax, 88(%rbx)
	.loc 1 1567 0
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L694
	.loc 1 1568 0
	leaq	104(%rbx), %rdi
	.loc 1 1567 0
	movq	$0, 96(%rbx)
	.loc 1 1568 0
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L695
	.loc 1 1569 0
	leaq	136(%rbx), %rdi
	.loc 1 1568 0
	movq	$0, 104(%rbx)
	.loc 1 1569 0
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L696
	.loc 1 1570 0
	leaq	56(%rbx), %rdi
	.loc 1 1569 0
	movq	$0, 136(%rbx)
	.loc 1 1570 0
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L629
	cmpb	$3, %al
	jle	.L697
.L629:
	.loc 1 1573 0
	movq	%r14, %rax
	.loc 1 1570 0
	movl	$0, 56(%rbx)
	.loc 1 1573 0
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L698
	movq	8(%rbx), %rax
	leaq	704(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L631
	cmpb	$3, %dl
	jle	.L699
.L631:
	movl	704(%rax), %edi
	call	httpd_set_ndelay
.LVL430:
	.loc 1 1575 0
	movq	%r14, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L700
	movq	8(%rbx), %rax
	leaq	704(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L633
	cmpb	$3, %dl
	jle	.L701
.L633:
	movl	704(%rax), %edi
	xorl	%edx, %edx
	movq	%rbx, %rsi
	call	fdwatch_add_fd
.LVL431:
	.loc 1 1577 0
	addq	$1, stats_connections(%rip)
	.loc 1 1578 0
	movl	num_connects(%rip), %eax
	cmpl	stats_simultaneous(%rip), %eax
	jle	.L634
	.loc 1 1579 0
	movl	%eax, stats_simultaneous(%rip)
	jmp	.L634
.LVL432:
	.p2align 4,,10
	.p2align 3
.L636:
	.loc 1 1558 0
	movl	$1, %eax
.LVL433:
.L612:
	.loc 1 1581 0
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
.LVL434:
	popq	%r12
	.cfi_def_cfa_offset 24
.LVL435:
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.LVL436:
	.p2align 4,,10
	.p2align 3
.L621:
	.cfi_restore_state
	.loc 1 1553 0
	movq	%rbp, %rdi
	movl	%eax, 12(%rsp)
	call	tmr_run
.LVL437:
	.loc 1 1554 0
	movl	12(%rsp), %eax
	.loc 1 1581 0
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
.LVL438:
	popq	%rbp
	.cfi_def_cfa_offset 32
.LVL439:
	popq	%r12
	.cfi_def_cfa_offset 24
.LVL440:
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
.LVL441:
	ret
.LVL442:
	.p2align 4,,10
	.p2align 3
.L689:
	.cfi_restore_state
	.loc 1 1536 0
	movl	$720, %edi
	call	malloc
.LVL443:
	.loc 1 1537 0
	testq	%rax, %rax
	.loc 1 1536 0
	movq	%rax, 8(%rbx)
	.loc 1 1537 0
	je	.L702
	.loc 1 1542 0
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L619
	cmpb	$3, %dl
	jle	.L703
.L619:
	movl	$0, (%rax)
	.loc 1 1543 0
	addl	$1, httpd_conn_count(%rip)
	movq	%rax, %rdx
	jmp	.L617
.L703:
	.loc 1 1542 0
	movq	%rax, %rdi
	call	__asan_report_store4
.LVL444:
	.p2align 4,,10
	.p2align 3
.L686:
	.loc 1 1522 0
	xorl	%eax, %eax
	movl	$.LC103, %esi
	movl	$4, %edi
	call	syslog
.LVL445:
	.loc 1 1523 0
	movq	%rbp, %rdi
	call	tmr_run
.LVL446:
	.loc 1 1524 0
	xorl	%eax, %eax
	jmp	.L612
.L613:
	.loc 1 1529 0
	movl	$2, %edi
	movl	$.LC104, %esi
	xorl	%eax, %eax
	call	syslog
.LVL447:
	.loc 1 1530 0
	call	__asan_handle_no_return
.LVL448:
	movl	$1, %edi
	call	exit
.LVL449:
.L702:
	.loc 1 1539 0
	movl	$2, %edi
	movl	$.LC105, %esi
	call	syslog
.LVL450:
	.loc 1 1540 0
	call	__asan_handle_no_return
.LVL451:
	movl	$1, %edi
	call	exit
.LVL452:
.L694:
	.loc 1 1567 0
	call	__asan_report_store8
.LVL453:
.L687:
	.loc 1 1527 0
	movq	%rbx, %rdi
	call	__asan_report_load4
.LVL454:
.L691:
	.loc 1 1562 0
	call	__asan_report_load4
.LVL455:
.L692:
	.loc 1 1566 0
	movq	%rbp, %rdi
	call	__asan_report_load8
.LVL456:
.L693:
	call	__asan_report_store8
.LVL457:
.L688:
	.loc 1 1534 0
	movq	%r14, %rdi
	call	__asan_report_load8
.LVL458:
.L695:
	.loc 1 1568 0
	call	__asan_report_store8
.LVL459:
.L696:
	.loc 1 1569 0
	call	__asan_report_store8
.LVL460:
.L697:
	.loc 1 1570 0
	call	__asan_report_store4
.LVL461:
.L698:
	.loc 1 1573 0
	movq	%r14, %rdi
	call	__asan_report_load8
.LVL462:
.L699:
	call	__asan_report_load4
.LVL463:
.L700:
	.loc 1 1575 0
	movq	%r14, %rdi
	call	__asan_report_load8
.LVL464:
.L701:
	call	__asan_report_load4
.LVL465:
.L690:
	.loc 1 1560 0
	movq	%rbx, %rdi
	call	__asan_report_store4
.LVL466:
	.cfi_endproc
.LFE19:
	.size	handle_newconnect, .-handle_newconnect
	.section	.text.unlikely
.LCOLDE106:
	.text
.LHOTE106:
	.section	.rodata
	.align 32
.LC107:
	.string	"throttle sending count was negative - shouldn't happen!"
	.zero	40
	.section	.text.unlikely
.LCOLDB108:
	.text
.LHOTB108:
	.p2align 4,,15
	.type	check_throttles, @function
check_throttles:
.LASANPC23:
.LFB23:
	.loc 1 1883 0
	.cfi_startproc
.LVL467:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	.loc 1 1887 0
	leaq	56(%rdi), %rax
	.loc 1 1883 0
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.loc 1 1887 0
	movq	%rax, 16(%rsp)
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L705
	cmpb	$3, %al
	jle	.L786
.L705:
	.loc 1 1888 0
	leaq	72(%rbx), %rax
	.loc 1 1887 0
	movl	$0, 56(%rbx)
	.loc 1 1888 0
	movq	%rax, 32(%rsp)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L787
	leaq	64(%rbx), %rcx
	movq	$-1, 72(%rbx)
	movq	%rcx, %r13
	movq	%rcx, 24(%rsp)
	shrq	$3, %r13
	cmpb	$0, 2147450880(%r13)
	jne	.L788
	.loc 1 1889 0
	movl	numthrottles(%rip), %edx
	leaq	8(%rbx), %rcx
	xorl	%r14d, %r14d
	.loc 1 1888 0
	movq	$-1, 64(%rbx)
.LVL468:
	movq	%rcx, 40(%rsp)
	.loc 1 1889 0
	testl	%edx, %edx
	jle	.L731
	.loc 1 1904 0
	movq	16(%rsp), %rbp
	.loc 1 1891 0
	leaq	8(%rbx), %r12
	.loc 1 1912 0
	movq	%rax, 8(%rsp)
	.loc 1 1891 0
	shrq	$3, %r12
	.loc 1 1904 0
	shrq	$3, %rbp
	jmp	.L766
.LVL469:
	.p2align 4,,10
	.p2align 3
.L802:
	addl	$1, %ecx
	movslq	%ecx, %r11
.L719:
	movzbl	2147450880(%rbp), %edx
	testb	%dl, %dl
	je	.L723
	cmpb	$3, %dl
	jle	.L789
.L723:
	movslq	56(%rbx), %rdx
	leal	1(%rdx), %r8d
	leaq	16(%rbx,%rdx,4), %r10
	movl	%r8d, 56(%rbx)
	movq	%r10, %r8
	shrq	$3, %r8
	movzbl	2147450880(%r8), %r15d
	movq	%r10, %r8
	andl	$7, %r8d
	addl	$3, %r8d
	cmpb	%r15b, %r8b
	jl	.L724
	testb	%r15b, %r15b
	jne	.L790
.L724:
	movl	%r14d, 16(%rbx,%rdx,4)
	.loc 1 1905 0
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L725
	cmpb	$3, %dl
	jle	.L791
.L725:
	.loc 1 1906 0
	cqto
	.loc 1 1905 0
	movl	%ecx, 40(%rsi)
	.loc 1 1906 0
	idivq	%r11
.LVL470:
	.loc 1 1907 0
	cmpb	$0, 2147450880(%r13)
	jne	.L792
	movq	64(%rbx), %rdx
	cmpq	$-1, %rdx
	je	.L784
	.loc 1 1910 0
	cmpq	%rdx, %rax
	cmovg	%rdx, %rax
.LVL471:
.L784:
	movq	%rax, 64(%rbx)
.LVL472:
	.loc 1 1912 0
	movq	8(%rsp), %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L793
	movq	72(%rbx), %rax
	cmpq	$-1, %rax
	je	.L785
	.loc 1 1915 0
	cmpq	%r9, %rax
	cmovge	%rax, %r9
.L785:
	movq	%r9, 72(%rbx)
.LVL473:
.L713:
	.loc 1 1890 0
	addl	$1, %r14d
.LVL474:
	.loc 1 1889 0
	cmpl	%r14d, numthrottles(%rip)
	jle	.L731
	.loc 1 1889 0 is_stmt 0 discriminator 2
	movzbl	2147450880(%rbp), %eax
	testb	%al, %al
	je	.L732
	cmpb	$3, %al
	jle	.L794
.L732:
	cmpl	$9, 56(%rbx)
	jg	.L731
.LVL475:
.L766:
	.loc 1 1891 0 is_stmt 1
	cmpb	$0, 2147450880(%r12)
	jne	.L795
	movq	8(%rbx), %rax
	leaq	240(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L796
	movq	240(%rax), %rsi
	movslq	%r14d, %rax
	leaq	(%rax,%rax,2), %r15
	salq	$4, %r15
	movq	%r15, %rdi
	addq	throttles(%rip), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L797
	movq	(%rdi), %rdi
	call	match
.LVL476:
	testl	%eax, %eax
	je	.L713
	.loc 1 1894 0
	movq	%r15, %rsi
	addq	throttles(%rip), %rsi
	leaq	24(%rsi), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L798
	leaq	8(%rsi), %rdi
	movq	24(%rsi), %rdx
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L799
	movq	8(%rsi), %rax
	leaq	(%rax,%rax), %rcx
	cmpq	%rcx, %rdx
	jg	.L735
	.loc 1 1897 0
	leaq	16(%rsi), %rdi
	movq	%rdi, %rcx
	shrq	$3, %rcx
	cmpb	$0, 2147450880(%rcx)
	jne	.L800
	movq	16(%rsi), %r9
	cmpq	%r9, %rdx
	jl	.L735
	.loc 1 1899 0
	leaq	40(%rsi), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L717
	cmpb	$3, %dl
	jle	.L801
.L717:
	movl	40(%rsi), %ecx
	testl	%ecx, %ecx
	jns	.L802
	.loc 1 1901 0
	xorl	%eax, %eax
	movl	$.LC107, %esi
	movl	$3, %edi
	call	syslog
.LVL477:
	.loc 1 1902 0
	movq	%r15, %rsi
	addq	throttles(%rip), %rsi
	leaq	40(%rsi), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L720
	cmpb	$3, %al
	jle	.L803
.L720:
	leaq	8(%rsi), %rax
	movl	$0, 40(%rsi)
	movq	%rax, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L804
	leaq	16(%rsi), %rcx
	movq	8(%rsi), %rax
	movq	%rcx, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L805
	movq	16(%rsi), %r9
	movl	$1, %r11d
	movl	$1, %ecx
	jmp	.L719
.LVL478:
	.p2align 4,,10
	.p2align 3
.L731:
	.loc 1 1918 0
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	.loc 1 1917 0
	movl	$1, %eax
	.loc 1 1918 0
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL479:
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL480:
	.p2align 4,,10
	.p2align 3
.L735:
	.cfi_restore_state
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	.loc 1 1895 0
	xorl	%eax, %eax
	.loc 1 1918 0
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL481:
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL482:
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL483:
.L803:
	.cfi_restore_state
	.loc 1 1902 0
	call	__asan_report_store4
.LVL484:
.L793:
	.loc 1 1912 0
	movq	32(%rsp), %rdi
	call	__asan_report_load8
.LVL485:
.L792:
	.loc 1 1907 0
	movq	24(%rsp), %rdi
	call	__asan_report_load8
.LVL486:
.L794:
	.loc 1 1889 0
	movq	16(%rsp), %rdi
	call	__asan_report_load4
.LVL487:
.L800:
	.loc 1 1897 0
	call	__asan_report_load8
.LVL488:
.L799:
	.loc 1 1894 0
	call	__asan_report_load8
.LVL489:
.L798:
	call	__asan_report_load8
.LVL490:
.L791:
	.loc 1 1905 0
	call	__asan_report_store4
.LVL491:
.L790:
	.loc 1 1904 0
	movq	%r10, %rdi
	call	__asan_report_store4
.LVL492:
.L789:
	movq	16(%rsp), %rdi
	call	__asan_report_load4
.LVL493:
.L801:
	.loc 1 1899 0
	call	__asan_report_load4
.LVL494:
.L797:
	.loc 1 1891 0
	call	__asan_report_load8
.LVL495:
.L796:
	call	__asan_report_load8
.LVL496:
.L795:
	movq	40(%rsp), %rdi
	call	__asan_report_load8
.LVL497:
.L788:
	.loc 1 1888 0
	movq	%rcx, %rdi
	call	__asan_report_store8
.LVL498:
.L787:
	movq	32(%rsp), %rdi
	call	__asan_report_store8
.LVL499:
.L786:
	.loc 1 1887 0
	movq	16(%rsp), %rdi
	call	__asan_report_store4
.LVL500:
.L805:
	movq	%rcx, %rdi
	call	__asan_report_load8
.LVL501:
.L804:
	movq	%rax, %rdi
	call	__asan_report_load8
.LVL502:
	.cfi_endproc
.LFE23:
	.size	check_throttles, .-check_throttles
	.section	.text.unlikely
.LCOLDE108:
	.text
.LHOTE108:
	.section	.text.unlikely
.LCOLDB109:
	.text
.LHOTB109:
	.p2align 4,,15
	.type	shut_down, @function
shut_down:
.LASANPC18:
.LFB18:
	.loc 1 1467 0
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movl	__asan_option_detect_stack_use_after_return(%rip), %esi
	leaq	16(%rsp), %r12
	testl	%esi, %esi
	jne	.L860
.L806:
	.loc 1 1471 0
	leaq	32(%r12), %rbx
	.loc 1 1467 0
	movq	%r12, %r13
	movq	$1102416563, (%r12)
	shrq	$3, %r13
	movq	$.LC14, 8(%r12)
	movq	$.LASANPC18, 16(%r12)
	.loc 1 1471 0
	xorl	%esi, %esi
	movq	%rbx, %rdi
	.loc 1 1467 0
	movl	$-235802127, 2147450880(%r13)
	movl	$-185335808, 2147450884(%r13)
	movl	$-202116109, 2147450888(%r13)
	.loc 1 1473 0
	xorl	%ebp, %ebp
	.loc 1 1471 0
	call	gettimeofday
.LVL503:
	.loc 1 1472 0
	movq	%rbx, %rdi
	call	logstats
.LVL504:
	.loc 1 1473 0
	movl	max_connects(%rip), %ecx
	.loc 1 1476 0
	movq	%rbx, 8(%rsp)
	.loc 1 1473 0
	testl	%ecx, %ecx
	jg	.L847
	jmp	.L821
.LVL505:
	.p2align 4,,10
	.p2align 3
.L814:
	.loc 1 1477 0
	leaq	8(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L861
	movq	8(%rax), %rdi
	testq	%rdi, %rdi
	je	.L817
	.loc 1 1479 0
	call	httpd_destroy_conn
.LVL506:
	.loc 1 1480 0
	addq	connects(%rip), %rbx
	leaq	8(%rbx), %r15
	movq	%r15, %r14
	shrq	$3, %r14
	cmpb	$0, 2147450880(%r14)
	jne	.L862
	movq	8(%rbx), %rdi
	call	free
.LVL507:
	.loc 1 1481 0
	subl	$1, httpd_conn_count(%rip)
	.loc 1 1482 0
	cmpb	$0, 2147450880(%r14)
	jne	.L863
	movq	$0, 8(%rbx)
.L817:
	.loc 1 1473 0 discriminator 2
	addl	$1, %ebp
.LVL508:
	cmpl	%ebp, max_connects(%rip)
	jle	.L821
.LVL509:
.L847:
	.loc 1 1475 0
	movslq	%ebp, %rax
	leaq	(%rax,%rax,8), %rbx
	salq	$4, %rbx
	movq	%rbx, %rax
	addq	connects(%rip), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L813
	cmpb	$3, %dl
	jle	.L864
.L813:
	movl	(%rax), %edx
	testl	%edx, %edx
	je	.L814
	.loc 1 1476 0
	leaq	8(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L865
	movq	8(%rax), %rdi
	movq	8(%rsp), %rsi
	call	httpd_close_conn
.LVL510:
	movq	%rbx, %rax
	addq	connects(%rip), %rax
	jmp	.L814
.LVL511:
	.p2align 4,,10
	.p2align 3
.L821:
	.loc 1 1485 0
	movq	hs(%rip), %rbx
	testq	%rbx, %rbx
	je	.L812
.LVL512:
.LBB2:
	.loc 1 1489 0
	leaq	72(%rbx), %rdi
	.loc 1 1488 0
	movq	$0, hs(%rip)
	.loc 1 1489 0
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L822
	cmpb	$3, %al
	jle	.L866
.L822:
	movl	72(%rbx), %edi
	cmpl	$-1, %edi
	je	.L823
	.loc 1 1490 0
	call	fdwatch_del_fd
.LVL513:
.L823:
	.loc 1 1491 0
	leaq	76(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L824
	testb	%dl, %dl
	jne	.L867
.L824:
	movl	76(%rbx), %edi
	cmpl	$-1, %edi
	je	.L825
	.loc 1 1492 0
	call	fdwatch_del_fd
.LVL514:
.L825:
	.loc 1 1493 0
	movq	%rbx, %rdi
	call	httpd_terminate
.LVL515:
.L812:
.LBE2:
	.loc 1 1495 0
	call	mmc_destroy
.LVL516:
	.loc 1 1496 0
	call	tmr_destroy
.LVL517:
	.loc 1 1497 0
	movq	connects(%rip), %rdi
	call	free
.LVL518:
	.loc 1 1498 0
	movq	throttles(%rip), %rdi
	testq	%rdi, %rdi
	je	.L809
	.loc 1 1499 0
	call	free
.LVL519:
.L809:
	.loc 1 1467 0
	leaq	16(%rsp), %rax
	cmpq	%r12, %rax
	jne	.L868
	movq	$0, 2147450880(%r13)
	movl	$0, 2147450888(%r13)
.L808:
	.loc 1 1500 0
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL520:
.L867:
	.cfi_restore_state
.LBB3:
	.loc 1 1491 0
	call	__asan_report_load4
.LVL521:
.L866:
	.loc 1 1489 0
	call	__asan_report_load4
.LVL522:
.L865:
.LBE3:
	.loc 1 1476 0
	call	__asan_report_load8
.LVL523:
.L863:
	.loc 1 1482 0
	movq	%r15, %rdi
	call	__asan_report_store8
.LVL524:
.L862:
	.loc 1 1480 0
	movq	%r15, %rdi
	call	__asan_report_load8
.LVL525:
.L861:
	.loc 1 1477 0
	call	__asan_report_load8
.LVL526:
.L864:
	.loc 1 1475 0
	movq	%rax, %rdi
	call	__asan_report_load4
.LVL527:
.L860:
	.loc 1 1467 0
	movq	%r12, %rsi
	movl	$96, %edi
	call	__asan_stack_malloc_1
.LVL528:
	movq	%rax, %r12
	jmp	.L806
.L868:
	movabsq	$-723401728380766731, %rax
	movq	$1172321806, (%r12)
	movl	$-168430091, 2147450888(%r13)
	movq	%rax, 2147450880(%r13)
	jmp	.L808
	.cfi_endproc
.LFE18:
	.size	shut_down, .-shut_down
	.section	.text.unlikely
.LCOLDE109:
	.text
.LHOTE109:
	.section	.rodata
	.align 32
.LC110:
	.string	"exiting"
	.zero	56
	.section	.text.unlikely
.LCOLDB111:
	.text
.LHOTB111:
	.p2align 4,,15
	.type	handle_usr1, @function
handle_usr1:
.LASANPC5:
.LFB5:
	.loc 1 257 0
	.cfi_startproc
.LVL529:
	.loc 1 260 0
	movl	num_connects(%rip), %edx
	testl	%edx, %edx
	je	.L872
	.loc 1 273 0
	movl	$1, got_usr1(%rip)
	ret
.L872:
	.loc 1 257 0
	pushq	%rax
	.cfi_def_cfa_offset 16
	.loc 1 266 0
	call	shut_down
.LVL530:
	.loc 1 267 0
	movl	$5, %edi
	movl	$.LC110, %esi
	xorl	%eax, %eax
	call	syslog
.LVL531:
	.loc 1 268 0
	call	closelog
.LVL532:
	.loc 1 269 0
	call	__asan_handle_no_return
.LVL533:
	xorl	%edi, %edi
	call	exit
.LVL534:
	.cfi_endproc
.LFE5:
	.size	handle_usr1, .-handle_usr1
	.section	.text.unlikely
.LCOLDE111:
	.text
.LHOTE111:
	.section	.rodata
	.align 32
.LC112:
	.string	"exiting due to signal %d"
	.zero	39
	.section	.text.unlikely
.LCOLDB113:
	.text
.LHOTB113:
	.p2align 4,,15
	.type	handle_term, @function
handle_term:
.LASANPC2:
.LFB2:
	.loc 1 172 0
	.cfi_startproc
.LVL535:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 172 0
	movl	%edi, %ebx
	.loc 1 175 0
	call	shut_down
.LVL536:
	.loc 1 176 0
	movl	$5, %edi
	movl	%ebx, %edx
	movl	$.LC112, %esi
	xorl	%eax, %eax
	call	syslog
.LVL537:
	.loc 1 177 0
	call	closelog
.LVL538:
	.loc 1 178 0
	call	__asan_handle_no_return
.LVL539:
	movl	$1, %edi
	call	exit
.LVL540:
	.cfi_endproc
.LFE2:
	.size	handle_term, .-handle_term
	.section	.text.unlikely
.LCOLDE113:
	.text
.LHOTE113:
	.section	.text.unlikely
.LCOLDB114:
	.text
.LHOTB114:
	.p2align 4,,15
	.type	clear_throttles.isra.0, @function
clear_throttles.isra.0:
.LASANPC36:
.LFB36:
	.loc 1 1922 0
	.cfi_startproc
.LVL541:
	.loc 1 1926 0
	leaq	56(%rdi), %rdx
	.loc 1 1922 0
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 1926 0
	movq	%rdx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L876
	cmpb	$3, %al
	jle	.L902
.L876:
	movl	56(%rdi), %eax
	testl	%eax, %eax
	jle	.L875
	subl	$1, %eax
	movq	throttles(%rip), %r8
	leaq	16(%rdi), %rdx
	leaq	20(%rdi,%rax,4), %rsi
.LVL542:
	.p2align 4,,10
	.p2align 3
.L880:
	.loc 1 1927 0
	movq	%rdx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%rdx, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L878
	testb	%cl, %cl
	jne	.L903
.L878:
	movslq	(%rdx), %rax
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	addq	%r8, %rax
	leaq	40(%rax), %rdi
	movq	%rdi, %rcx
	shrq	$3, %rcx
	movzbl	2147450880(%rcx), %ecx
	testb	%cl, %cl
	je	.L879
	cmpb	$3, %cl
	jle	.L904
.L879:
	addq	$4, %rdx
	subl	$1, 40(%rax)
	.loc 1 1926 0
	cmpq	%rsi, %rdx
	jne	.L880
.L875:
	.loc 1 1928 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL543:
.L902:
	.cfi_restore_state
	.loc 1 1926 0
	movq	%rdx, %rdi
.LVL544:
	call	__asan_report_load4
.LVL545:
.L904:
	.loc 1 1927 0
	call	__asan_report_load4
.LVL546:
.L903:
	movq	%rdx, %rdi
	call	__asan_report_load4
.LVL547:
	.cfi_endproc
.LFE36:
	.size	clear_throttles.isra.0, .-clear_throttles.isra.0
	.section	.text.unlikely
.LCOLDE114:
	.text
.LHOTE114:
	.section	.text.unlikely
.LCOLDB115:
	.text
.LHOTB115:
	.p2align 4,,15
	.type	really_clear_connection, @function
really_clear_connection:
.LASANPC28:
.LFB28:
	.loc 1 2048 0
	.cfi_startproc
.LVL548:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	.loc 1 2049 0
	leaq	8(%rdi), %rbp
	.loc 1 2048 0
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.loc 1 2049 0
	movq	%rbp, %rax
	shrq	$3, %rax
	.loc 1 2048 0
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 2049 0
	cmpb	$0, 2147450880(%rax)
	jne	.L945
	movq	%rdi, %rbx
	movq	8(%rdi), %rdi
.LVL549:
	leaq	200(%rdi), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L946
	movq	200(%rdi), %rax
	addq	%rax, stats_bytes(%rip)
	.loc 1 2050 0
	movq	%rbx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L908
	cmpb	$3, %al
	jle	.L947
.L908:
	cmpl	$3, (%rbx)
	je	.L909
	.loc 1 2051 0
	leaq	704(%rdi), %rdx
	movq	%rdx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L910
	cmpb	$3, %al
	jle	.L948
.L910:
	movl	704(%rdi), %edi
	movq	%rsi, 8(%rsp)
	call	fdwatch_del_fd
.LVL550:
	movq	%rbp, %rax
	movq	8(%rsp), %rsi
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L949
	movq	8(%rbx), %rdi
.LVL551:
.L909:
	.loc 1 2054 0
	leaq	104(%rbx), %r12
	.loc 1 2052 0
	call	httpd_close_conn
.LVL552:
	.loc 1 2054 0
	movq	%r12, %rbp
	.loc 1 2053 0
	movq	%rbx, %rdi
	.loc 1 2054 0
	shrq	$3, %rbp
	.loc 1 2053 0
	call	clear_throttles.isra.0
.LVL553:
	.loc 1 2054 0
	cmpb	$0, 2147450880(%rbp)
	jne	.L950
	movq	104(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L913
	.loc 1 2056 0
	call	tmr_cancel
.LVL554:
	.loc 1 2057 0
	cmpb	$0, 2147450880(%rbp)
	jne	.L951
	movq	$0, 104(%rbx)
.L913:
	.loc 1 2059 0
	movq	%rbx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L915
	cmpb	$3, %al
	jle	.L952
.L915:
	.loc 1 2060 0
	leaq	4(%rbx), %rdi
	.loc 1 2059 0
	movl	$0, (%rbx)
	.loc 1 2060 0
	movl	first_free_connect(%rip), %ecx
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L916
	testb	%dl, %dl
	jne	.L953
.L916:
	movl	%ecx, 4(%rbx)
	.loc 1 2061 0
	subq	connects(%rip), %rbx
.LVL555:
	movabsq	$-8198552921648689607, %rax
	.loc 1 2062 0
	subl	$1, num_connects(%rip)
	.loc 1 2061 0
	sarq	$4, %rbx
	imulq	%rax, %rbx
	movl	%ebx, first_free_connect(%rip)
	.loc 1 2063 0
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL556:
	ret
.LVL557:
.L947:
	.cfi_restore_state
	.loc 1 2050 0
	movq	%rbx, %rdi
	call	__asan_report_load4
.LVL558:
.L953:
	.loc 1 2060 0
	call	__asan_report_store4
.LVL559:
.L952:
	.loc 1 2059 0
	movq	%rbx, %rdi
	call	__asan_report_store4
.LVL560:
.L948:
	.loc 1 2051 0
	movq	%rdx, %rdi
	call	__asan_report_load4
.LVL561:
.L949:
	movq	%rbp, %rdi
	call	__asan_report_load8
.LVL562:
.L945:
	.loc 1 2049 0
	movq	%rbp, %rdi
.LVL563:
	call	__asan_report_load8
.LVL564:
.L950:
	.loc 1 2054 0
	movq	%r12, %rdi
	call	__asan_report_load8
.LVL565:
.L951:
	.loc 1 2057 0
	movq	%r12, %rdi
	call	__asan_report_store8
.LVL566:
.L946:
	.loc 1 2049 0
	movq	%rax, %rdi
	call	__asan_report_load8
.LVL567:
	.cfi_endproc
.LFE28:
	.size	really_clear_connection, .-really_clear_connection
	.section	.text.unlikely
.LCOLDE115:
	.text
.LHOTE115:
	.section	.rodata
	.align 32
.LC116:
	.string	"replacing non-null linger_timer!"
	.zero	63
	.align 32
.LC117:
	.string	"tmr_create(linger_clear_connection) failed"
	.zero	53
	.section	.text.unlikely
.LCOLDB118:
	.text
.LHOTB118:
	.p2align 4,,15
	.type	clear_connection, @function
clear_connection:
.LASANPC27:
.LFB27:
	.loc 1 1996 0
	.cfi_startproc
.LVL568:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	.loc 1 1999 0
	leaq	96(%rdi), %r13
	.loc 1 1996 0
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	.loc 1 1999 0
	movq	%r13, %rbp
	shrq	$3, %rbp
	.loc 1 1996 0
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 1999 0
	cmpb	$0, 2147450880(%rbp)
	jne	.L1027
	movq	%rdi, %rbx
	movq	96(%rdi), %rdi
.LVL569:
	movq	%rsi, %r12
	testq	%rdi, %rdi
	je	.L956
	.loc 1 2001 0
	call	tmr_cancel
.LVL570:
	.loc 1 2002 0
	cmpb	$0, 2147450880(%rbp)
	jne	.L1028
	movq	$0, 96(%rbx)
.L956:
	.loc 1 2016 0
	movq	%rbx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L958
	cmpb	$3, %al
	jle	.L1029
.L958:
	movl	(%rbx), %ecx
	cmpl	$4, %ecx
	je	.L1030
	.loc 1 2023 0
	leaq	8(%rbx), %rbp
	movq	%rbp, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1031
	movq	8(%rbx), %rax
	leaq	556(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %esi
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%sil, %dl
	jl	.L966
	testb	%sil, %sil
	jne	.L1032
.L966:
	movl	556(%rax), %edx
	testl	%edx, %edx
	je	.L964
	.loc 1 2025 0
	cmpl	$3, %ecx
	je	.L967
	.loc 1 2026 0
	leaq	704(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L968
	cmpb	$3, %dl
	jle	.L1033
.L968:
	movl	704(%rax), %edi
	call	fdwatch_del_fd
.LVL571:
	movq	%rbp, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1034
	movq	8(%rbx), %rax
.L967:
	.loc 1 2027 0
	movq	%rbx, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L970
	cmpb	$3, %dl
	jle	.L1035
.L970:
	.loc 1 2028 0
	leaq	704(%rax), %rdi
	.loc 1 2027 0
	movl	$4, (%rbx)
	.loc 1 2028 0
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L971
	cmpb	$3, %dl
	jle	.L1036
.L971:
	movl	704(%rax), %edi
	movl	$1, %esi
	call	shutdown
.LVL572:
	.loc 1 2029 0
	movq	%rbp, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1037
	movq	8(%rbx), %rax
	leaq	704(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L973
	cmpb	$3, %dl
	jle	.L1038
.L973:
	movl	704(%rax), %edi
	.loc 1 2031 0
	leaq	104(%rbx), %rbp
	.loc 1 2029 0
	xorl	%edx, %edx
	movq	%rbx, %rsi
	call	fdwatch_add_fd
.LVL573:
	.loc 1 2031 0
	movq	%rbp, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1039
	cmpq	$0, 104(%rbx)
	je	.L975
	.loc 1 2032 0
	movl	$.LC116, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.LVL574:
.L975:
	.loc 1 2033 0
	xorl	%r8d, %r8d
	movq	%rbx, %rdx
	movl	$500, %ecx
	movl	$linger_clear_connection, %esi
	movq	%r12, %rdi
	call	tmr_create
.LVL575:
	movq	%rbp, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1040
	.loc 1 2035 0
	testq	%rax, %rax
	.loc 1 2033 0
	movq	%rax, 104(%rbx)
	.loc 1 2035 0
	je	.L1041
	.loc 1 2043 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL576:
	popq	%rbp
	.cfi_def_cfa_offset 24
.LVL577:
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL578:
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL579:
	ret
.LVL580:
	.p2align 4,,10
	.p2align 3
.L1030:
	.cfi_restore_state
	.loc 1 2019 0
	leaq	104(%rbx), %r13
	movq	%r13, %rbp
	shrq	$3, %rbp
	cmpb	$0, 2147450880(%rbp)
	jne	.L1042
	movq	104(%rbx), %rdi
	call	tmr_cancel
.LVL581:
	.loc 1 2020 0
	cmpb	$0, 2147450880(%rbp)
	jne	.L1043
	.loc 1 2021 0
	leaq	8(%rbx), %rdi
	.loc 1 2020 0
	movq	$0, 104(%rbx)
	.loc 1 2021 0
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1044
	movq	8(%rbx), %rdx
	leaq	556(%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L963
	testb	%cl, %cl
	jne	.L1045
.L963:
	movl	$0, 556(%rdx)
.L964:
	.loc 1 2043 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	.loc 1 2042 0
	movq	%r12, %rsi
	movq	%rbx, %rdi
	.loc 1 2043 0
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL582:
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL583:
	popq	%r13
	.cfi_def_cfa_offset 8
	.loc 1 2042 0
	jmp	really_clear_connection
.LVL584:
.L1029:
	.cfi_restore_state
	.loc 1 2016 0
	movq	%rbx, %rdi
	call	__asan_report_load4
.LVL585:
.L1038:
	.loc 1 2029 0
	call	__asan_report_load4
.LVL586:
.L1036:
	.loc 1 2028 0
	call	__asan_report_load4
.LVL587:
.L1035:
	.loc 1 2027 0
	movq	%rbx, %rdi
	call	__asan_report_store4
.LVL588:
.L1032:
	.loc 1 2023 0
	call	__asan_report_load4
.LVL589:
.L1033:
	.loc 1 2026 0
	call	__asan_report_load4
.LVL590:
.L1041:
	.loc 1 2037 0
	movl	$2, %edi
	movl	$.LC117, %esi
	call	syslog
.LVL591:
	.loc 1 2038 0
	call	__asan_handle_no_return
.LVL592:
	movl	$1, %edi
	call	exit
.LVL593:
.L1039:
	.loc 1 2031 0
	movq	%rbp, %rdi
	call	__asan_report_load8
.LVL594:
.L1027:
	.loc 1 1999 0
	movq	%r13, %rdi
.LVL595:
	call	__asan_report_load8
.LVL596:
.L1034:
	movq	%rbp, %rdi
	call	__asan_report_load8
.LVL597:
.L1045:
	.loc 1 2021 0
	call	__asan_report_store4
.LVL598:
.L1044:
	call	__asan_report_load8
.LVL599:
.L1043:
	.loc 1 2020 0
	movq	%r13, %rdi
	call	__asan_report_store8
.LVL600:
.L1042:
	.loc 1 2019 0
	movq	%r13, %rdi
	call	__asan_report_load8
.LVL601:
.L1031:
	.loc 1 2023 0
	movq	%rbp, %rdi
	call	__asan_report_load8
.LVL602:
.L1037:
	.loc 1 2029 0
	movq	%rbp, %rdi
	call	__asan_report_load8
.LVL603:
.L1040:
	.loc 1 2033 0
	movq	%rbp, %rdi
	call	__asan_report_store8
.LVL604:
.L1028:
	.loc 1 2002 0
	movq	%r13, %rdi
	call	__asan_report_store8
.LVL605:
	.cfi_endproc
.LFE27:
	.size	clear_connection, .-clear_connection
	.section	.text.unlikely
.LCOLDE118:
	.text
.LHOTE118:
	.section	.text.unlikely
.LCOLDB119:
	.text
.LHOTB119:
	.p2align 4,,15
	.type	finish_connection, @function
finish_connection:
.LASANPC26:
.LFB26:
	.loc 1 1985 0
	.cfi_startproc
.LVL606:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	.loc 1 1987 0
	addq	$8, %rdi
.LVL607:
	movq	%rdi, %rax
	.loc 1 1985 0
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 1987 0
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1049
	movq	8(%rbx), %rdi
	movq	%rsi, %rbp
	call	httpd_write_response
.LVL608:
	.loc 1 1991 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	.loc 1 1990 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	.loc 1 1991 0
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL609:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL610:
	.loc 1 1990 0
	jmp	clear_connection
.LVL611:
.L1049:
	.cfi_restore_state
	.loc 1 1987 0
	call	__asan_report_load8
.LVL612:
	.cfi_endproc
.LFE26:
	.size	finish_connection, .-finish_connection
	.section	.text.unlikely
.LCOLDE119:
	.text
.LHOTE119:
	.section	.text.unlikely
.LCOLDB120:
	.text
.LHOTB120:
	.p2align 4,,15
	.type	handle_read, @function
handle_read:
.LASANPC20:
.LFB20:
	.loc 1 1586 0
	.cfi_startproc
.LVL613:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	.loc 1 1589 0
	addq	$8, %rdi
.LVL614:
	.loc 1 1586 0
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	.loc 1 1589 0
	movq	%rdi, %rax
	shrq	$3, %rax
	.loc 1 1586 0
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.loc 1 1589 0
	cmpb	$0, 2147450880(%rax)
	jne	.L1170
	movq	8(%rbp), %rbx
.LVL615:
	.loc 1 1592 0
	leaq	160(%rbx), %r13
	movq	%r13, %r15
	shrq	$3, %r15
	cmpb	$0, 2147450880(%r15)
	jne	.L1171
	leaq	152(%rbx), %r14
	movq	%rsi, %r12
	movq	160(%rbx), %rsi
.LVL616:
	movq	%r14, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1172
	movq	152(%rbx), %rdx
	leaq	144(%rbx), %rcx
	cmpq	%rdx, %rsi
	jb	.L1054
	.loc 1 1594 0
	cmpq	$5000, %rdx
	jbe	.L1055
	.loc 1 1596 0
	movl	$httpd_err400form, %eax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1173
	movl	$httpd_err400title, %eax
	movq	httpd_err400form(%rip), %r8
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1174
.L1076:
	.loc 1 1637 0
	movq	httpd_err400title(%rip), %rdx
	movl	$.LC62, %r9d
	movl	$400, %esi
	movq	%r9, %rcx
	movq	%rbx, %rdi
	call	httpd_send_err
.LVL617:
.L1169:
	.loc 1 1703 0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	.loc 1 1654 0
	movq	%r12, %rsi
	movq	%rbp, %rdi
	.loc 1 1703 0
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL618:
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL619:
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL620:
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL621:
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	.loc 1 1654 0
	jmp	finish_connection
.LVL622:
	.p2align 4,,10
	.p2align 3
.L1055:
	.cfi_restore_state
	.loc 1 1600 0
	leaq	144(%rbx), %rcx
	addq	$1000, %rdx
	movq	%r14, %rsi
	movq	%rax, 8(%rsp)
	movq	%rcx, %rdi
	movq	%rcx, (%rsp)
	call	httpd_realloc_str
.LVL623:
	movq	8(%rsp), %rax
	movq	(%rsp), %rcx
	cmpb	$0, 2147450880(%rax)
	jne	.L1175
	cmpb	$0, 2147450880(%r15)
	movq	152(%rbx), %rdx
	jne	.L1176
	movq	160(%rbx), %rsi
.L1054:
	.loc 1 1606 0
	movq	%rcx, %rax
	.loc 1 1605 0
	subq	%rsi, %rdx
	.loc 1 1606 0
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1177
	.loc 1 1605 0
	leaq	704(%rbx), %r14
	addq	144(%rbx), %rsi
	movq	%r14, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1061
	cmpb	$3, %al
	jle	.L1178
.L1061:
	movl	704(%rbx), %edi
	call	read
.LVL624:
	.loc 1 1608 0
	testl	%eax, %eax
	je	.L1179
	.loc 1 1614 0
	js	.L1180
	.loc 1 1628 0
	movq	%r13, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1181
	cltq
	addq	%rax, 160(%rbx)
	.loc 1 1629 0
	movq	%r12, %rax
.LVL625:
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1182
	leaq	88(%rbp), %rdi
	movq	(%r12), %rax
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1183
	movq	%rax, 88(%rbp)
	.loc 1 1632 0
	movq	%rbx, %rdi
	call	httpd_got_request
.LVL626:
	testl	%eax, %eax
	je	.L1050
	cmpl	$2, %eax
	jne	.L1167
	.loc 1 1637 0
	movl	$httpd_err400form, %eax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1184
	movl	$httpd_err400title, %eax
	movq	httpd_err400form(%rip), %r8
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.L1076
	movl	$httpd_err400title, %edi
	call	__asan_report_load8
.LVL627:
	.p2align 4,,10
	.p2align 3
.L1180:
	.loc 1 1621 0
	call	__errno_location
.LVL628:
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%rax, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L1066
	testb	%cl, %cl
	jne	.L1185
.L1066:
	movl	(%rax), %eax
	cmpl	$4, %eax
	jne	.L1186
.L1050:
	.loc 1 1703 0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL629:
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL630:
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL631:
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL632:
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL633:
	.p2align 4,,10
	.p2align 3
.L1179:
	.cfi_restore_state
	.loc 1 1610 0
	movl	$httpd_err400form, %eax
.LVL634:
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1187
	movl	$httpd_err400title, %eax
	movq	httpd_err400form(%rip), %r8
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.L1076
	movl	$httpd_err400title, %edi
	call	__asan_report_load8
.LVL635:
	.p2align 4,,10
	.p2align 3
.L1186:
	.loc 1 1621 0
	cmpl	$11, %eax
	je	.L1050
	.loc 1 1623 0
	movl	$httpd_err400form, %eax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1188
	movl	$httpd_err400title, %eax
	movq	httpd_err400form(%rip), %r8
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	je	.L1076
	movl	$httpd_err400title, %edi
	call	__asan_report_load8
.LVL636:
	.p2align 4,,10
	.p2align 3
.L1167:
	.loc 1 1643 0
	movq	%rbx, %rdi
	call	httpd_parse_request
.LVL637:
	testl	%eax, %eax
	js	.L1169
	.loc 1 1650 0
	movq	%rbp, %rdi
	call	check_throttles
.LVL638:
	testl	%eax, %eax
	je	.L1189
	.loc 1 1659 0
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	httpd_start_request
.LVL639:
	testl	%eax, %eax
	js	.L1169
	.loc 1 1667 0
	leaq	528(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1083
	cmpb	$3, %al
	jle	.L1190
.L1083:
	movl	528(%rbx), %eax
	testl	%eax, %eax
	je	.L1084
	.loc 1 1669 0
	leaq	536(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1191
	leaq	136(%rbp), %rdi
	movq	536(%rbx), %rax
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1192
	.loc 1 1670 0
	leaq	544(%rbx), %rdi
	.loc 1 1669 0
	movq	%rax, 136(%rbp)
	.loc 1 1670 0
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1193
	leaq	128(%rbp), %rdi
	movq	544(%rbx), %rax
	movq	%rdi, %rdx
	shrq	$3, %rdx
	addq	$1, %rax
	cmpb	$0, 2147450880(%rdx)
	jne	.L1194
.L1093:
	.loc 1 1675 0
	movq	%rax, 128(%rbp)
.L1089:
	.loc 1 1678 0
	leaq	712(%rbx), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1195
	cmpq	$0, 712(%rbx)
	je	.L1196
	.loc 1 1688 0
	leaq	136(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1197
	movq	%rdi, %rdx
	movq	136(%rbp), %rax
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1198
	cmpq	128(%rbp), %rax
	jge	.L1169
	.loc 1 1696 0
	movq	%rbp, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1107
	cmpb	$3, %al
	jle	.L1199
.L1107:
	.loc 1 1697 0
	movq	%r12, %rax
	.loc 1 1696 0
	movl	$2, 0(%rbp)
	.loc 1 1697 0
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1200
	leaq	80(%rbp), %rdi
	movq	(%r12), %rax
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1201
	.loc 1 1698 0
	leaq	112(%rbp), %rdi
	.loc 1 1697 0
	movq	%rax, 80(%rbp)
	.loc 1 1698 0
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1202
	.loc 1 1701 0
	movq	%r14, %rax
	.loc 1 1698 0
	movq	$0, 112(%rbp)
.LVL640:
	.loc 1 1701 0
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1111
	cmpb	$3, %al
	jle	.L1203
.L1111:
	movl	704(%rbx), %edi
	call	fdwatch_del_fd
.LVL641:
	.loc 1 1702 0
	movq	%r14, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1112
	cmpb	$3, %al
	jle	.L1204
.L1112:
	movl	704(%rbx), %edi
	.loc 1 1703 0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	.loc 1 1702 0
	movq	%rbp, %rsi
	.loc 1 1703 0
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL642:
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL643:
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL644:
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL645:
	popq	%r15
	.cfi_def_cfa_offset 8
	.loc 1 1702 0
	movl	$1, %edx
	jmp	fdwatch_add_fd
.LVL646:
	.p2align 4,,10
	.p2align 3
.L1189:
	.cfi_restore_state
	.loc 1 1652 0
	leaq	208(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1205
	movl	$httpd_err503form, %eax
	movq	208(%rbx), %r9
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1206
	movl	$httpd_err503title, %eax
	movq	httpd_err503form(%rip), %r8
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1207
	movq	httpd_err503title(%rip), %rdx
	movl	$.LC62, %ecx
	movl	$503, %esi
	movq	%rbx, %rdi
	call	httpd_send_err
.LVL647:
	jmp	.L1169
.L1178:
	.loc 1 1605 0
	movq	%r14, %rdi
	call	__asan_report_load4
.LVL648:
.L1185:
	.loc 1 1621 0
	movq	%rax, %rdi
	call	__asan_report_load4
.LVL649:
	.p2align 4,,10
	.p2align 3
.L1084:
	.loc 1 1672 0
	leaq	192(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1208
	movq	192(%rbx), %rax
	.loc 1 1673 0
	leaq	128(%rbp), %rdi
	.loc 1 1672 0
	testq	%rax, %rax
	js	.L1209
	.loc 1 1675 0
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	je	.L1093
	call	__asan_report_store8
.LVL650:
	.p2align 4,,10
	.p2align 3
.L1196:
.LBB4:
	.loc 1 1682 0 discriminator 1
	leaq	56(%rbp), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1096
	cmpb	$3, %al
	jle	.L1210
.L1096:
	movl	56(%rbp), %eax
	testl	%eax, %eax
	jle	.L1211
	leaq	200(%rbx), %rdi
	movq	throttles(%rip), %r8
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1212
	subl	$1, %eax
	movq	200(%rbx), %rsi
	leaq	16(%rbp), %rdi
	leaq	20(%rbp,%rax,4), %r9
.LVL651:
	.p2align 4,,10
	.p2align 3
.L1103:
	.loc 1 1683 0 discriminator 3
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L1101
	testb	%dl, %dl
	jne	.L1213
.L1101:
	movslq	(%rdi), %rax
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	addq	%r8, %rax
	leaq	32(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	cmpb	$0, 2147450880(%rcx)
	jne	.L1214
	addq	$4, %rdi
	addq	%rsi, 32(%rax)
	.loc 1 1682 0 discriminator 3
	cmpq	%r9, %rdi
	jne	.L1103
.L1099:
	.loc 1 1684 0
	leaq	136(%rbp), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1215
	movq	%rsi, 136(%rbp)
	jmp	.L1169
.L1209:
.LBE4:
	.loc 1 1673 0
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1216
	movq	$0, 128(%rbp)
	jmp	.L1089
.LVL652:
.L1211:
	leaq	200(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1217
	movq	200(%rbx), %rsi
	jmp	.L1099
.LVL653:
.L1184:
	.loc 1 1637 0
	movl	$httpd_err400form, %edi
	call	__asan_report_load8
.LVL654:
.L1214:
.LBB5:
	.loc 1 1683 0
	movq	%rdx, %rdi
	call	__asan_report_load8
.LVL655:
.L1212:
	call	__asan_report_load8
.LVL656:
.L1213:
	call	__asan_report_load4
.LVL657:
.L1216:
.LBE5:
	.loc 1 1673 0
	call	__asan_report_store8
.LVL658:
.L1197:
	.loc 1 1688 0
	movq	%rax, %rdi
	call	__asan_report_load8
.LVL659:
.L1210:
.LBB6:
	.loc 1 1682 0
	call	__asan_report_load4
.LVL660:
.L1217:
	call	__asan_report_load8
.LVL661:
.L1207:
.LBE6:
	.loc 1 1652 0
	movl	$httpd_err503title, %edi
	call	__asan_report_load8
.LVL662:
.L1206:
	movl	$httpd_err503form, %edi
	call	__asan_report_load8
.LVL663:
.L1205:
	call	__asan_report_load8
.LVL664:
.L1187:
	.loc 1 1610 0
	movl	$httpd_err400form, %edi
	call	__asan_report_load8
.LVL665:
.L1171:
	.loc 1 1592 0
	movq	%r13, %rdi
	call	__asan_report_load8
.LVL666:
.L1170:
	.loc 1 1589 0
	call	__asan_report_load8
.LVL667:
.L1181:
	.loc 1 1628 0
	movq	%r13, %rdi
	call	__asan_report_load8
.LVL668:
.L1182:
	.loc 1 1629 0
	movq	%r12, %rdi
	call	__asan_report_load8
.LVL669:
.L1175:
	movq	%r14, %rdi
	call	__asan_report_load8
.LVL670:
.L1176:
	movq	%r13, %rdi
	call	__asan_report_load8
.LVL671:
.L1173:
	.loc 1 1596 0
	movl	$httpd_err400form, %edi
	call	__asan_report_load8
.LVL672:
.L1174:
	movl	$httpd_err400title, %edi
	call	__asan_report_load8
.LVL673:
.L1177:
	.loc 1 1606 0
	movq	%rcx, %rdi
	call	__asan_report_load8
.LVL674:
.L1172:
	.loc 1 1592 0
	movq	%r14, %rdi
	call	__asan_report_load8
.LVL675:
.L1183:
	.loc 1 1629 0
	call	__asan_report_store8
.LVL676:
.L1188:
	.loc 1 1623 0
	movl	$httpd_err400form, %edi
	call	__asan_report_load8
.LVL677:
.L1191:
	.loc 1 1669 0
	call	__asan_report_load8
.LVL678:
.L1190:
	.loc 1 1667 0
	call	__asan_report_load4
.LVL679:
.L1199:
	.loc 1 1696 0
	movq	%rbp, %rdi
	call	__asan_report_store4
.LVL680:
.L1201:
	.loc 1 1697 0
	call	__asan_report_store8
.LVL681:
.L1200:
	movq	%r12, %rdi
	call	__asan_report_load8
.LVL682:
.L1202:
	.loc 1 1698 0
	call	__asan_report_store8
.LVL683:
.L1204:
	.loc 1 1702 0
	movq	%r14, %rdi
	call	__asan_report_load4
.LVL684:
.L1195:
	.loc 1 1678 0
	movq	%rax, %rdi
	call	__asan_report_load8
.LVL685:
.L1194:
	.loc 1 1670 0
	call	__asan_report_store8
.LVL686:
.L1193:
	call	__asan_report_load8
.LVL687:
.L1192:
	.loc 1 1669 0
	call	__asan_report_store8
.LVL688:
.L1198:
	.loc 1 1688 0
	call	__asan_report_load8
.LVL689:
.L1203:
	.loc 1 1701 0
	movq	%r14, %rdi
	call	__asan_report_load4
.LVL690:
.L1208:
	.loc 1 1672 0
	call	__asan_report_load8
.LVL691:
.L1215:
.LBB7:
	.loc 1 1684 0
	call	__asan_report_store8
.LVL692:
.LBE7:
	.cfi_endproc
.LFE20:
	.size	handle_read, .-handle_read
	.section	.text.unlikely
.LCOLDE120:
	.text
.LHOTE120:
	.section	.rodata
	.align 32
.LC121:
	.string	"%.80s connection timed out reading"
	.zero	61
	.align 32
.LC122:
	.string	"%.80s connection timed out sending"
	.zero	61
	.section	.text.unlikely
.LCOLDB123:
	.text
.LHOTB123:
	.p2align 4,,15
	.type	idle, @function
idle:
.LASANPC29:
.LFB29:
	.loc 1 2068 0
	.cfi_startproc
.LVL693:
	.loc 1 2072 0
	movl	max_connects(%rip), %eax
	testl	%eax, %eax
	jle	.L1248
	.loc 1 2068 0
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	.loc 1 2078 0
	movq	%rsi, %r15
	.loc 1 2068 0
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	.loc 1 2083 0
	movl	$httpd_err408form, %r12d
	.loc 1 2068 0
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	.loc 1 2083 0
	shrq	$3, %r12
	xorl	%ebp, %ebp
	movq	%rsi, %r14
	.loc 1 2078 0
	shrq	$3, %r15
	.loc 1 2068 0
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.loc 1 2083 0
	movq	%r12, 8(%rsp)
	jmp	.L1241
.LVL694:
	.p2align 4,,10
	.p2align 3
.L1254:
	.loc 1 2075 0
	jl	.L1221
	cmpl	$3, %eax
	jg	.L1221
	.loc 1 2090 0
	cmpb	$0, 2147450880(%r15)
	jne	.L1249
	leaq	88(%rbx), %rdi
.LVL695:
	movq	(%r14), %rax
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1250
	subq	88(%rbx), %rax
	cmpq	$299, %rax
	jg	.L1251
.LVL696:
.L1221:
	.loc 1 2072 0 discriminator 2
	addl	$1, %ebp
.LVL697:
	cmpl	%ebp, max_connects(%rip)
	jle	.L1252
.LVL698:
.L1241:
	.loc 1 2074 0
	movslq	%ebp, %rax
	leaq	(%rax,%rax,8), %rbx
	salq	$4, %rbx
	addq	connects(%rip), %rbx
.LVL699:
	.loc 1 2075 0
	movq	%rbx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1220
	cmpb	$3, %al
	jle	.L1253
.L1220:
	movl	(%rbx), %eax
	cmpl	$1, %eax
	jne	.L1254
	.loc 1 2078 0
	cmpb	$0, 2147450880(%r15)
	jne	.L1255
	leaq	88(%rbx), %rdi
.LVL700:
	movq	(%r14), %rax
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1256
	subq	88(%rbx), %rax
	cmpq	$59, %rax
	jle	.L1221
	.loc 1 2082 0
	leaq	8(%rbx), %r13
	movq	%r13, %r12
	shrq	$3, %r12
	cmpb	$0, 2147450880(%r12)
	jne	.L1257
	.loc 1 2080 0
	movq	8(%rbx), %rax
	leaq	16(%rax), %rdi
	call	httpd_ntoa
.LVL701:
	movl	$.LC121, %esi
	movq	%rax, %rdx
	movl	$6, %edi
	xorl	%eax, %eax
	call	syslog
.LVL702:
	.loc 1 2083 0
	movq	8(%rsp), %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1258
	movl	$httpd_err408title, %eax
	movq	httpd_err408form(%rip), %r8
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1259
	cmpb	$0, 2147450880(%r12)
	movq	httpd_err408title(%rip), %rdx
	jne	.L1260
	movq	8(%rbx), %rdi
	movl	$.LC62, %r9d
	movl	$408, %esi
	movq	%r9, %rcx
	.loc 1 2072 0
	addl	$1, %ebp
.LVL703:
	.loc 1 2083 0
	call	httpd_send_err
.LVL704:
	.loc 1 2085 0
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	finish_connection
.LVL705:
	.loc 1 2072 0
	cmpl	%ebp, max_connects(%rip)
	jg	.L1241
.LVL706:
	.p2align 4,,10
	.p2align 3
.L1252:
	.loc 1 2100 0
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
.LVL707:
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
.LVL708:
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
.LVL709:
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
.L1248:
	rep ret
.LVL710:
	.p2align 4,,10
	.p2align 3
.L1251:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	.loc 1 2094 0
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1261
	.loc 1 2092 0
	movq	8(%rbx), %rax
	leaq	16(%rax), %rdi
	call	httpd_ntoa
.LVL711:
	movl	$.LC122, %esi
	movq	%rax, %rdx
	movl	$6, %edi
	xorl	%eax, %eax
	call	syslog
.LVL712:
	.loc 1 2095 0
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	clear_connection
.LVL713:
	jmp	.L1221
.LVL714:
.L1253:
	.loc 1 2075 0
	movq	%rbx, %rdi
.LVL715:
	call	__asan_report_load4
.LVL716:
.L1261:
	.loc 1 2094 0
	call	__asan_report_load8
.LVL717:
.L1260:
	.loc 1 2083 0
	movq	%r13, %rdi
	call	__asan_report_load8
.LVL718:
.L1259:
	movl	$httpd_err408title, %edi
	call	__asan_report_load8
.LVL719:
.L1258:
	movl	$httpd_err408form, %edi
	call	__asan_report_load8
.LVL720:
.L1257:
	.loc 1 2082 0
	movq	%r13, %rdi
	call	__asan_report_load8
.LVL721:
.L1256:
	.loc 1 2078 0
	call	__asan_report_load8
.LVL722:
.L1255:
	movq	%r14, %rdi
.LVL723:
	call	__asan_report_load8
.LVL724:
.L1250:
	.loc 1 2090 0
	call	__asan_report_load8
.LVL725:
.L1249:
	movq	%r14, %rdi
.LVL726:
	call	__asan_report_load8
.LVL727:
	.cfi_endproc
.LFE29:
	.size	idle, .-idle
	.section	.text.unlikely
.LCOLDE123:
	.text
.LHOTE123:
	.section	.rodata.str1.1
.LC124:
	.string	"1 32 32 2 iv "
	.section	.rodata
	.align 32
.LC125:
	.string	"replacing non-null wakeup_timer!"
	.zero	63
	.align 32
.LC126:
	.string	"tmr_create(wakeup_connection) failed"
	.zero	59
	.align 32
.LC127:
	.string	"write - %m sending %.80s"
	.zero	39
	.section	.text.unlikely
.LCOLDB128:
	.text
.LHOTB128:
	.p2align 4,,15
	.type	handle_send, @function
handle_send:
.LASANPC21:
.LFB21:
	.loc 1 1708 0
	.cfi_startproc
.LVL728:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsi, 8(%rsp)
	leaq	48(%rsp), %r14
	testl	%eax, %eax
	jne	.L1417
.LVL729:
.L1262:
	.loc 1 1713 0
	leaq	8(%rbp), %r12
	.loc 1 1708 0
	movq	%r14, %rbx
	movq	$1102416563, (%r14)
.LVL730:
	shrq	$3, %rbx
	movq	$.LC124, 8(%r14)
	movq	$.LASANPC21, 16(%r14)
	.loc 1 1713 0
	movq	%r12, %rax
	.loc 1 1708 0
	movl	$-235802127, 2147450880(%rbx)
	movl	$-202116109, 2147450888(%rbx)
	.loc 1 1713 0
	shrq	$3, %rax
	.loc 1 1708 0
	leaq	96(%r14), %rsi
	.loc 1 1713 0
	cmpb	$0, 2147450880(%rax)
	jne	.L1418
	.loc 1 1716 0
	leaq	64(%rbp), %rax
	.loc 1 1713 0
	movq	8(%rbp), %rcx
.LVL731:
	.loc 1 1716 0
	movq	%rax, 24(%rsp)
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1419
	movq	64(%rbp), %rdx
	.loc 1 1717 0
	movl	$1000000000, %eax
	.loc 1 1716 0
	cmpq	$-1, %rdx
	je	.L1268
	.loc 1 1719 0
	leaq	3(%rdx), %rax
	testq	%rdx, %rdx
	cmovns	%rdx, %rax
	sarq	$2, %rax
.LVL732:
.L1268:
	.loc 1 1722 0
	leaq	472(%rcx), %r8
	movq	%r8, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1420
	movq	472(%rcx), %rdx
	testq	%rdx, %rdx
	jne	.L1270
	.loc 1 1727 0
	leaq	128(%rbp), %r13
	movq	%r13, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1421
	leaq	136(%rbp), %r15
	movq	128(%rbp), %rdx
	movq	%r15, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L1422
	movq	136(%rbp), %rsi
	.loc 1 1726 0
	leaq	712(%rcx), %rdi
	.loc 1 1725 0
	subq	%rsi, %rdx
	cmpq	%rax, %rdx
	cmova	%rax, %rdx
	.loc 1 1726 0
	movq	%rdi, %rax
.LVL733:
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1423
	.loc 1 1725 0
	leaq	704(%rcx), %rax
	addq	712(%rcx), %rsi
	movq	%rax, 16(%rsp)
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edi
	testb	%dil, %dil
	je	.L1274
	cmpb	$3, %dil
	jle	.L1424
.L1274:
	movl	704(%rcx), %edi
	movq	%r8, 40(%rsp)
	movq	%rcx, 32(%rsp)
	call	write
.LVL734:
	.loc 1 1743 0
	testl	%eax, %eax
	movq	32(%rsp), %rcx
	movq	40(%rsp), %r8
	js	.L1425
.LVL735:
.L1281:
	.loc 1 1746 0
	je	.L1285
	.loc 1 1795 0
	movq	8(%rsp), %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1426
	movq	8(%rsp), %rsi
	leaq	88(%rbp), %rdi
	movq	(%rsi), %rdx
	movq	%rdi, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L1427
	movq	%rdx, 88(%rbp)
	.loc 1 1797 0
	movq	%r8, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1428
	movq	472(%rcx), %rdx
	testq	%rdx, %rdx
	je	.L1415
	.loc 1 1800 0
	movslq	%eax, %rsi
	cmpq	%rsi, %rdx
	ja	.L1429
	.loc 1 1811 0
	subl	%edx, %eax
.LVL736:
	.loc 1 1812 0
	movq	$0, 472(%rcx)
.L1415:
	movslq	%eax, %rdx
.LVL737:
.L1302:
	.loc 1 1816 0
	movq	%r15, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1430
	.loc 1 1817 0
	movq	%r12, %rax
	.loc 1 1816 0
	movq	%rdx, %r10
	addq	136(%rbp), %r10
	.loc 1 1817 0
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	.loc 1 1816 0
	movq	%r10, 136(%rbp)
	.loc 1 1817 0
	jne	.L1431
	movq	8(%rbp), %rax
	leaq	200(%rax), %rdi
	movq	%rdi, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L1432
	movq	%rdx, %r9
	addq	200(%rax), %r9
	.loc 1 1818 0
	leaq	56(%rbp), %rdi
	.loc 1 1817 0
	movq	%r9, 200(%rax)
.LVL738:
	.loc 1 1818 0
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1308
	cmpb	$3, %al
	jle	.L1433
.L1308:
	movl	56(%rbp), %eax
	testl	%eax, %eax
	jle	.L1316
	subl	$1, %eax
	movq	throttles(%rip), %r15
	leaq	16(%rbp), %rdi
	leaq	20(%rbp,%rax,4), %r11
.LVL739:
	.p2align 4,,10
	.p2align 3
.L1315:
	.loc 1 1819 0 discriminator 3
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %esi
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%sil, %al
	jl	.L1313
	testb	%sil, %sil
	jne	.L1434
.L1313:
	movslq	(%rdi), %rax
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	addq	%r15, %rax
	leaq	32(%rax), %rsi
	movq	%rsi, %r8
	shrq	$3, %r8
	cmpb	$0, 2147450880(%r8)
	jne	.L1435
	addq	$4, %rdi
	addq	%rdx, 32(%rax)
	.loc 1 1818 0 discriminator 3
	cmpq	%r11, %rdi
	jne	.L1315
.L1316:
	.loc 1 1822 0
	movq	%r13, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1436
	cmpq	128(%rbp), %r10
	jge	.L1437
	.loc 1 1830 0
	leaq	112(%rbp), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1438
	movq	112(%rbp), %rax
	cmpq	$100, %rax
	jg	.L1439
.L1318:
	.loc 1 1834 0
	movq	24(%rsp), %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1440
	movq	64(%rbp), %rsi
	cmpq	$-1, %rsi
	je	.L1265
	.loc 1 1836 0
	movq	8(%rsp), %rax
	leaq	80(%rbp), %rdi
	movq	(%rax), %r13
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1441
.LVL740:
	.loc 1 1838 0
	subq	80(%rbp), %r13
.LVL741:
	movl	$1, %eax
	cmove	%rax, %r13
.LVL742:
	.loc 1 1839 0
	movq	%r9, %rax
	cqto
	idivq	%r13
	cmpq	%rax, %rsi
	jge	.L1265
	.loc 1 1841 0
	movq	%rbp, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1323
	cmpb	$3, %al
	jg	.L1323
	movq	%rbp, %rdi
	call	__asan_report_store4
.LVL743:
	.p2align 4,,10
	.p2align 3
.L1270:
.LBB8:
	.loc 1 1736 0
	leaq	368(%rcx), %rdi
	movq	%rdi, %r11
	shrq	$3, %r11
	cmpb	$0, 2147450880(%r11)
	jne	.L1442
	movq	368(%rcx), %rdi
	.loc 1 1737 0
	movq	%rdx, -56(%rsi)
	.loc 1 1736 0
	movq	%rdi, -64(%rsi)
	.loc 1 1738 0
	leaq	712(%rcx), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1443
	leaq	136(%rbp), %r15
	movq	712(%rcx), %rdx
	movq	%r15, %rdi
	shrq	$3, %rdi
	cmpb	$0, 2147450880(%rdi)
	jne	.L1444
	movq	136(%rbp), %rdi
	.loc 1 1739 0
	leaq	128(%rbp), %r13
	.loc 1 1738 0
	addq	%rdi, %rdx
	movq	%rdx, -48(%rsi)
	.loc 1 1739 0
	movq	%r13, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1445
	movq	128(%rbp), %rdx
	subq	%rdi, %rdx
	cmpq	%rax, %rdx
	cmova	%rax, %rdx
	.loc 1 1740 0
	leaq	704(%rcx), %rax
.LVL744:
	.loc 1 1739 0
	movq	%rdx, -40(%rsi)
	.loc 1 1740 0
	movq	%rax, 16(%rsp)
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1280
	cmpb	$3, %al
	jle	.L1446
.L1280:
	movl	704(%rcx), %edi
	subq	$64, %rsi
	movl	$2, %edx
	movq	%r8, 40(%rsp)
	movq	%rcx, 32(%rsp)
	call	writev
.LVL745:
.LBE8:
	.loc 1 1743 0
	testl	%eax, %eax
.LBB9:
	.loc 1 1740 0
	movq	40(%rsp), %r8
	movq	32(%rsp), %rcx
.LVL746:
.LBE9:
	.loc 1 1743 0
	jns	.L1281
.LVL747:
.L1425:
	movq	%rcx, 24(%rsp)
	.loc 1 1743 0 is_stmt 0 discriminator 1
	call	__errno_location
.LVL748:
	movq	%rax, %rdx
	movq	24(%rsp), %rcx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %esi
	movq	%rax, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%sil, %dl
	jl	.L1282
	testb	%sil, %sil
	jne	.L1447
.L1282:
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L1265
	.loc 1 1747 0 is_stmt 1
	cmpl	$11, %eax
	je	.L1285
	.loc 1 1788 0
	cmpl	$32, %eax
	setne	%sil
	cmpl	$22, %eax
	setne	%dl
	testb	%dl, %sil
	je	.L1295
	cmpl	$104, %eax
	je	.L1295
	.loc 1 1789 0
	leaq	208(%rcx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1448
	movq	208(%rcx), %rdx
	movl	$.LC127, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.LVL749:
.L1295:
	.loc 1 1790 0
	movq	8(%rsp), %rsi
	movq	%rbp, %rdi
	call	clear_connection
.LVL750:
	.loc 1 1791 0
	jmp	.L1265
	.p2align 4,,10
	.p2align 3
.L1285:
	.loc 1 1759 0
	leaq	112(%rbp), %r12
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1449
	.loc 1 1760 0
	movq	%rbp, %rax
	.loc 1 1759 0
	addq	$100, 112(%rbp)
	.loc 1 1760 0
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1289
	cmpb	$3, %al
	jle	.L1450
.L1289:
	.loc 1 1761 0
	movq	16(%rsp), %rax
	.loc 1 1760 0
	movl	$3, 0(%rbp)
	.loc 1 1761 0
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1290
	cmpb	$3, %al
	jle	.L1451
.L1290:
	movl	704(%rcx), %edi
	.loc 1 1763 0
	leaq	96(%rbp), %r13
	.loc 1 1761 0
	call	fdwatch_del_fd
.LVL751:
	.loc 1 1763 0
	movq	%r13, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1452
	cmpq	$0, 96(%rbp)
	je	.L1292
	.loc 1 1764 0
	movl	$.LC125, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.LVL752:
.L1292:
	.loc 1 1765 0
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1453
	movq	112(%rbp), %rcx
	movq	8(%rsp), %rdi
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movl	$wakeup_connection, %esi
	call	tmr_create
.LVL753:
	movq	%r13, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1454
.LVL754:
.L1294:
	.loc 1 1767 0
	testq	%rax, %rax
	.loc 1 1765 0
	movq	%rax, 96(%rbp)
	.loc 1 1767 0
	je	.L1455
.L1265:
	.loc 1 1708 0
	leaq	48(%rsp), %rax
	cmpq	%r14, %rax
	jne	.L1456
	movl	$0, 2147450880(%rbx)
	movl	$0, 2147450888(%rbx)
.L1264:
	.loc 1 1861 0
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL755:
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL756:
	.p2align 4,,10
	.p2align 3
.L1439:
	.cfi_restore_state
	.loc 1 1831 0
	subq	$100, %rax
	movq	%rax, 112(%rbp)
	jmp	.L1318
.LVL757:
	.p2align 4,,10
	.p2align 3
.L1429:
.LBB10:
	.loc 1 1804 0
	leaq	368(%rcx), %rdi
	subl	%eax, %edx
.LVL758:
	movslq	%edx, %r8
	movq	%rdi, %rax
.LVL759:
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1457
	movq	368(%rcx), %rdi
	movq	%r8, %rdx
	movq	%rcx, 40(%rsp)
	movq	%r8, 32(%rsp)
.LVL760:
	addq	%rdi, %rsi
.LVL761:
	call	memmove
.LVL762:
	.loc 1 1805 0
	movq	32(%rsp), %r8
	movq	40(%rsp), %rcx
.LBE10:
	xorl	%edx, %edx
.LBB11:
	movq	%r8, 472(%rcx)
.LVL763:
.LBE11:
	jmp	.L1302
.LVL764:
	.p2align 4,,10
	.p2align 3
.L1323:
	.loc 1 1842 0
	movq	16(%rsp), %rax
	.loc 1 1841 0
	movl	$3, 0(%rbp)
	.loc 1 1842 0
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1324
	cmpb	$3, %al
	jg	.L1324
	movq	16(%rsp), %rdi
	call	__asan_report_load4
.LVL765:
	.p2align 4,,10
	.p2align 3
.L1324:
	movl	704(%rcx), %edi
	call	fdwatch_del_fd
.LVL766:
	.loc 1 1846 0
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1458
	movq	8(%rbp), %rax
	leaq	200(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1459
	movq	24(%rsp), %rdx
	movq	200(%rax), %rax
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1460
	cqto
	.loc 1 1848 0
	leaq	96(%rbp), %r12
	.loc 1 1846 0
	idivq	64(%rbp)
	subl	%r13d, %eax
	movslq	%eax, %r13
.LVL767:
	.loc 1 1848 0
	movq	%r12, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1461
	cmpq	$0, 96(%rbp)
	je	.L1329
	.loc 1 1849 0
	movl	$.LC125, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.LVL768:
.L1329:
	.loc 1 1850 0
	testl	%r13d, %r13d
	movl	$500, %ecx
	jle	.L1330
	.loc 1 1850 0 is_stmt 0 discriminator 1
	imulq	$1000, %r13, %rcx
.L1330:
	.loc 1 1850 0 discriminator 4
	movq	8(%rsp), %rdi
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	movl	$wakeup_connection, %esi
	call	tmr_create
.LVL769:
	movq	%r12, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	je	.L1294
	.loc 1 1850 0
	movq	%r12, %rdi
	call	__asan_report_store8
.LVL770:
	.p2align 4,,10
	.p2align 3
.L1437:
	.loc 1 1825 0 is_stmt 1
	movq	8(%rsp), %rsi
	movq	%rbp, %rdi
	call	finish_connection
.LVL771:
	.loc 1 1826 0
	jmp	.L1265
.LVL772:
.L1417:
	.loc 1 1708 0
	movq	%r14, %rsi
.LVL773:
	movl	$96, %edi
.LVL774:
	call	__asan_stack_malloc_1
.LVL775:
	movq	%rax, %r14
	jmp	.L1262
.LVL776:
.L1456:
	movabsq	$-723401728380766731, %rax
	movq	$1172321806, (%r14)
	movl	$-168430091, 2147450888(%rbx)
	movq	%rax, 2147450880(%rbx)
	jmp	.L1264
.LVL777:
.L1457:
.LBB12:
	.loc 1 1804 0
	call	__asan_report_load8
.LVL778:
.L1444:
.LBE12:
.LBB13:
	.loc 1 1738 0
	movq	%r15, %rdi
	call	__asan_report_load8
.LVL779:
.L1451:
.LBE13:
	.loc 1 1761 0
	movq	16(%rsp), %rdi
	call	__asan_report_load4
.LVL780:
.L1448:
	.loc 1 1789 0
	call	__asan_report_load8
.LVL781:
.L1443:
.LBB14:
	.loc 1 1738 0
	call	__asan_report_load8
.LVL782:
.L1442:
	.loc 1 1736 0
	call	__asan_report_load8
.LVL783:
.L1426:
.LBE14:
	.loc 1 1795 0
	movq	8(%rsp), %rdi
	call	__asan_report_load8
.LVL784:
.L1427:
	call	__asan_report_store8
.LVL785:
.L1431:
	.loc 1 1817 0
	movq	%r12, %rdi
	call	__asan_report_load8
.LVL786:
.L1447:
	.loc 1 1743 0
	movq	%rax, %rdi
	call	__asan_report_load4
.LVL787:
.L1450:
	.loc 1 1760 0
	movq	%rbp, %rdi
	call	__asan_report_store4
.LVL788:
.L1461:
	.loc 1 1848 0
	movq	%r12, %rdi
	call	__asan_report_load8
.LVL789:
.L1460:
	.loc 1 1846 0
	movq	24(%rsp), %rdi
	call	__asan_report_load8
.LVL790:
.L1459:
	call	__asan_report_load8
.LVL791:
.L1458:
	movq	%r12, %rdi
	call	__asan_report_load8
.LVL792:
.L1449:
	.loc 1 1759 0
	movq	%r12, %rdi
	call	__asan_report_load8
.LVL793:
.L1436:
	.loc 1 1822 0
	movq	%r13, %rdi
	call	__asan_report_load8
.LVL794:
.L1452:
	.loc 1 1763 0
	movq	%r13, %rdi
	call	__asan_report_load8
.LVL795:
.L1432:
	.loc 1 1817 0
	call	__asan_report_load8
.LVL796:
.L1433:
	.loc 1 1818 0
	call	__asan_report_load4
.LVL797:
.L1434:
	.loc 1 1819 0
	call	__asan_report_load4
.LVL798:
.L1435:
	movq	%rsi, %rdi
	call	__asan_report_load8
.LVL799:
.L1430:
	.loc 1 1816 0
	movq	%r15, %rdi
	call	__asan_report_load8
.LVL800:
.L1428:
	.loc 1 1797 0
	movq	%r8, %rdi
	call	__asan_report_load8
.LVL801:
.L1424:
	.loc 1 1725 0
	movq	16(%rsp), %rdi
	call	__asan_report_load4
.LVL802:
.L1446:
.LBB15:
	.loc 1 1740 0
	movq	16(%rsp), %rdi
	call	__asan_report_load4
.LVL803:
.L1422:
.LBE15:
	.loc 1 1727 0
	movq	%r15, %rdi
	call	__asan_report_load8
.LVL804:
.L1421:
	movq	%r13, %rdi
	call	__asan_report_load8
.LVL805:
.L1420:
	.loc 1 1722 0
	movq	%r8, %rdi
	call	__asan_report_load8
.LVL806:
.L1445:
.LBB16:
	.loc 1 1739 0
	movq	%r13, %rdi
	call	__asan_report_load8
.LVL807:
.L1418:
.LBE16:
	.loc 1 1713 0
	movq	%r12, %rdi
	call	__asan_report_load8
.LVL808:
.L1423:
	.loc 1 1726 0
	call	__asan_report_load8
.LVL809:
.L1419:
	.loc 1 1716 0
	movq	24(%rsp), %rdi
	call	__asan_report_load8
.LVL810:
.L1455:
	.loc 1 1769 0
	movl	$2, %edi
	movl	$.LC126, %esi
	xorl	%eax, %eax
	call	syslog
.LVL811:
	.loc 1 1770 0
	call	__asan_handle_no_return
.LVL812:
	movl	$1, %edi
	call	exit
.LVL813:
.L1453:
	.loc 1 1765 0
	movq	%r12, %rdi
	call	__asan_report_load8
.LVL814:
.L1454:
	movq	%r13, %rdi
	call	__asan_report_store8
.LVL815:
.L1440:
	.loc 1 1834 0
	movq	24(%rsp), %rdi
	call	__asan_report_load8
.LVL816:
.L1441:
	.loc 1 1836 0
	call	__asan_report_load8
.LVL817:
.L1438:
	.loc 1 1830 0
	call	__asan_report_load8
.LVL818:
	.cfi_endproc
.LFE21:
	.size	handle_send, .-handle_send
	.section	.text.unlikely
.LCOLDE128:
	.text
.LHOTE128:
	.section	.text.unlikely
.LCOLDB129:
	.text
.LHOTB129:
	.p2align 4,,15
	.type	linger_clear_connection, @function
linger_clear_connection:
.LASANPC31:
.LFB31:
	.loc 1 2119 0
	.cfi_startproc
.LVL819:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 2122 0
	movq	%rsp, %rax
	.loc 1 2119 0
	movq	%rdi, (%rsp)
	.loc 1 2122 0
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1466
	movq	(%rsp), %rdi
.LVL820:
	.loc 1 2123 0
	leaq	104(%rdi), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1467
	movq	$0, 104(%rdi)
	.loc 1 2124 0
	call	really_clear_connection
.LVL821:
	.loc 1 2125 0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL822:
.L1466:
	.cfi_restore_state
	movq	%rsp, %rdi
	.loc 1 2122 0
	call	__asan_report_load8
.LVL823:
.L1467:
	.loc 1 2123 0
	movq	%rax, %rdi
.LVL824:
	call	__asan_report_store8
.LVL825:
	.cfi_endproc
.LFE31:
	.size	linger_clear_connection, .-linger_clear_connection
	.section	.text.unlikely
.LCOLDE129:
	.text
.LHOTE129:
	.globl	__asan_stack_malloc_7
	.section	.rodata.str1.1
.LC130:
	.string	"1 32 4096 3 buf "
	.globl	__asan_stack_free_7
	.section	.text.unlikely
.LCOLDB131:
	.text
.LHOTB131:
	.p2align 4,,15
	.type	handle_linger, @function
handle_linger:
.LASANPC22:
.LFB22:
	.loc 1 1866 0
	.cfi_startproc
.LVL826:
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r14
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %r13
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$4160, %rsp
	.cfi_def_cfa_offset 4208
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsp, %rbx
	movq	%rsp, %r12
	testl	%eax, %eax
	jne	.L1493
.LVL827:
.L1468:
	.loc 1 1873 0
	leaq	8(%r14), %rdi
	.loc 1 1866 0
	movq	%rbx, %rbp
	movq	$1102416563, (%rbx)
	shrq	$3, %rbp
	movq	$.LC130, 8(%rbx)
	movq	$.LASANPC22, 16(%rbx)
	.loc 1 1873 0
	movq	%rdi, %rax
	.loc 1 1866 0
	movl	$-235802127, 2147450880(%rbp)
	movl	$-202116109, 2147451396(%rbp)
	.loc 1 1873 0
	shrq	$3, %rax
	.loc 1 1866 0
	leaq	4160(%rbx), %rsi
	.loc 1 1873 0
	cmpb	$0, 2147450880(%rax)
	jne	.L1494
	movq	8(%r14), %rax
	leaq	704(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L1473
	cmpb	$3, %dl
	jle	.L1495
.L1473:
	movl	704(%rax), %edi
	subq	$4128, %rsi
	movl	$4096, %edx
	call	read
.LVL828:
	.loc 1 1874 0
	testl	%eax, %eax
	js	.L1496
	.loc 1 1876 0
	je	.L1478
.LVL829:
.L1471:
	.loc 1 1866 0
	cmpq	%rbx, %r12
	jne	.L1497
	movl	$0, 2147450880(%rbp)
	movl	$0, 2147451396(%rbp)
.L1470:
	.loc 1 1878 0
	addq	$4160, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
.LVL830:
	popq	%r14
	.cfi_def_cfa_offset 8
.LVL831:
	ret
.LVL832:
	.p2align 4,,10
	.p2align 3
.L1496:
	.cfi_restore_state
	.loc 1 1874 0 discriminator 1
	call	__errno_location
.LVL833:
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%rax, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L1475
	testb	%cl, %cl
	jne	.L1498
.L1475:
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L1471
	cmpl	$11, %eax
	je	.L1471
.L1478:
	.loc 1 1877 0
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	really_clear_connection
.LVL834:
	jmp	.L1471
.L1495:
	.loc 1 1873 0
	call	__asan_report_load4
.LVL835:
.L1498:
	.loc 1 1874 0
	movq	%rax, %rdi
	call	__asan_report_load4
.LVL836:
.L1493:
	.loc 1 1866 0
	movq	%rsp, %rsi
.LVL837:
	movl	$4160, %edi
.LVL838:
	call	__asan_stack_malloc_7
.LVL839:
	movq	%rax, %rbx
	jmp	.L1468
.L1497:
	movq	$1172321806, (%rbx)
	movq	%r12, %rdx
	movl	$4160, %esi
	movq	%rbx, %rdi
	call	__asan_stack_free_7
.LVL840:
	jmp	.L1470
.L1494:
	.loc 1 1873 0
	call	__asan_report_load8
.LVL841:
	.cfi_endproc
.LFE22:
	.size	handle_linger, .-handle_linger
	.section	.text.unlikely
.LCOLDE131:
	.text
.LHOTE131:
	.section	.rodata.str1.8
	.align 8
.LC132:
	.string	"3 32 8 2 ai 96 10 7 portstr 160 48 5 hints "
	.section	.rodata
	.align 32
.LC133:
	.string	"%d"
	.zero	61
	.align 32
.LC134:
	.string	"getaddrinfo %.80s - %.80s"
	.zero	38
	.align 32
.LC135:
	.string	"%s: getaddrinfo %s - %s\n"
	.zero	39
	.align 32
.LC136:
	.string	"%.80s - sockaddr too small (%lu < %lu)"
	.zero	57
	.section	.text.unlikely
.LCOLDB137:
	.text
.LHOTB137:
	.p2align 4,,15
	.type	lookup_hostname.constprop.1, @function
lookup_hostname.constprop.1:
.LASANPC37:
.LFB37:
	.loc 1 1235 0
	.cfi_startproc
.LVL842:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %r12
	subq	$296, %rsp
	.cfi_def_cfa_offset 352
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rdi, 8(%rsp)
	movq	%rdx, 16(%rsp)
	leaq	32(%rsp), %rbx
	testl	%eax, %eax
	jne	.L1574
.LVL843:
.L1499:
	.loc 1 1247 0
	leaq	160(%rbx), %r10
	.loc 1 1235 0
	movq	%rbx, %r15
	movq	$1102416563, (%rbx)
.LVL844:
	shrq	$3, %r15
	movq	$.LC132, 8(%rbx)
	movq	$.LASANPC37, 16(%rbx)
	.loc 1 1247 0
	movq	%r10, %rdi
	xorl	%esi, %esi
	.loc 1 1235 0
	movl	$-235802127, 2147450880(%r15)
	movl	$-185273344, 2147450884(%r15)
	movl	$-218959118, 2147450888(%r15)
	.loc 1 1247 0
	movl	$48, %edx
	.loc 1 1235 0
	movl	$-185335296, 2147450892(%r15)
	movl	$-218959118, 2147450896(%r15)
	.loc 1 1251 0
	leaq	96(%rbx), %r14
	.loc 1 1235 0
	movl	$-185335808, 2147450904(%r15)
	movl	$-202116109, 2147450908(%r15)
	leaq	256(%rbx), %rbp
	.loc 1 1247 0
	movq	%r10, 24(%rsp)
	call	memset
.LVL845:
	.loc 1 1251 0
	movzwl	port(%rip), %ecx
	movq	%r14, %rdi
	movl	$.LC133, %edx
	movl	$10, %esi
	xorl	%eax, %eax
	.loc 1 1249 0
	movl	$1, -96(%rbp)
	.loc 1 1250 0
	movl	$1, -88(%rbp)
	.loc 1 1251 0
	call	snprintf
.LVL846:
	.loc 1 1252 0
	movq	24(%rsp), %r10
	movq	hostname(%rip), %rdi
	leaq	32(%rbx), %rcx
	movq	%r14, %rsi
	movq	%r10, %rdx
	call	getaddrinfo
.LVL847:
	testl	%eax, %eax
	movl	%eax, %r14d
.LVL848:
	jne	.L1575
.LVL849:
	.loc 1 1266 0
	movq	-224(%rbp), %rax
.LVL850:
	testq	%rax, %rax
	je	.L1505
	xorl	%r14d, %r14d
.LVL851:
	xorl	%r10d, %r10d
	jmp	.L1511
.LVL852:
	.p2align 4,,10
	.p2align 3
.L1579:
	.loc 1 1268 0
	cmpl	$10, %edx
	jne	.L1507
	.loc 1 1271 0
	testq	%r10, %r10
	cmove	%rax, %r10
.LVL853:
.L1507:
	.loc 1 1266 0
	leaq	40(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L1576
	movq	40(%rax), %rax
.LVL854:
	testq	%rax, %rax
	je	.L1577
.LVL855:
.L1511:
	.loc 1 1268 0
	leaq	4(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %esi
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%sil, %dl
	jl	.L1506
	testb	%sil, %sil
	jne	.L1578
.L1506:
	movl	4(%rax), %edx
	cmpl	$2, %edx
	jne	.L1579
	.loc 1 1275 0
	testq	%r14, %r14
	cmove	%rax, %r14
.LVL856:
	jmp	.L1507
.LVL857:
	.p2align 4,,10
	.p2align 3
.L1577:
	.loc 1 1281 0
	testq	%r10, %r10
	je	.L1580
	.loc 1 1285 0
	leaq	16(%r10), %rdi
	movq	%rdi, %rax
.LVL858:
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1515
	cmpb	$3, %al
	jle	.L1581
.L1515:
	movl	16(%r10), %r8d
	cmpq	$128, %r8
	ja	.L1573
	.loc 1 1293 0
	movq	16(%rsp), %rdi
	movl	$128, %edx
	xorl	%esi, %esi
	movq	%r10, 24(%rsp)
	call	memset
.LVL859:
	.loc 1 1294 0
	movq	24(%rsp), %r10
	leaq	24(%r10), %rdi
	movl	16(%r10), %edx
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1582
	movq	24(%r10), %rsi
	movq	16(%rsp), %rdi
	call	memmove
.LVL860:
	.loc 1 1295 0
	movq	%r13, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%r13, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L1518
	testb	%dl, %dl
	jne	.L1583
.L1518:
	movl	$1, 0(%r13)
.LVL861:
.L1514:
	.loc 1 1298 0
	testq	%r14, %r14
	je	.L1584
	.loc 1 1302 0
	leaq	16(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1522
	cmpb	$3, %al
	jle	.L1585
.L1522:
	movl	16(%r14), %r8d
	cmpq	$128, %r8
	ja	.L1573
	.loc 1 1310 0
	movq	8(%rsp), %rdi
	movl	$128, %edx
	xorl	%esi, %esi
	call	memset
.LVL862:
	.loc 1 1311 0
	leaq	24(%r14), %rdi
	movl	16(%r14), %edx
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1586
	movq	24(%r14), %rsi
	movq	8(%rsp), %rdi
	call	memmove
.LVL863:
	.loc 1 1312 0
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%r12, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L1525
	testb	%dl, %dl
	jne	.L1587
.L1525:
	movl	$1, (%r12)
.L1521:
	.loc 1 1315 0
	movq	-224(%rbp), %rdi
	call	freeaddrinfo
.LVL864:
	.loc 1 1235 0
	leaq	32(%rsp), %rax
	cmpq	%rbx, %rax
	jne	.L1588
	movq	$0, 2147450880(%r15)
	movq	$0, 2147450888(%r15)
	movl	$0, 2147450896(%r15)
	movq	$0, 2147450904(%r15)
.L1501:
	.loc 1 1365 0
	addq	$296, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL865:
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL866:
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL867:
.L1580:
	.cfi_restore_state
	.loc 1 1281 0
	movq	%r14, %rax
.LVL868:
.L1505:
	.loc 1 1282 0
	movq	%r13, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%r13, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L1513
	testb	%cl, %cl
	jne	.L1589
.L1513:
	movl	$0, 0(%r13)
	movq	%rax, %r14
	jmp	.L1514
.L1584:
	.loc 1 1299 0
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%r12, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L1520
	testb	%dl, %dl
	jne	.L1590
.L1520:
	movl	$0, (%r12)
	jmp	.L1521
.L1589:
	.loc 1 1282 0
	movq	%r13, %rdi
	call	__asan_report_store4
.LVL869:
.L1574:
	.loc 1 1235 0
	movq	%rbx, %rsi
.LVL870:
	movl	$256, %edi
.LVL871:
	call	__asan_stack_malloc_2
.LVL872:
	movq	%rax, %rbx
	jmp	.L1499
.LVL873:
.L1588:
	movabsq	$-723401728380766731, %rax
	movq	$1172321806, (%rbx)
	movq	%rax, 2147450880(%r15)
	movq	%rax, 2147450888(%r15)
	movq	%rax, 2147450896(%r15)
	movq	%rax, 2147450904(%r15)
	jmp	.L1501
.LVL874:
.L1576:
	.loc 1 1266 0
	call	__asan_report_load8
.LVL875:
.L1578:
	.loc 1 1268 0
	call	__asan_report_load4
.LVL876:
.L1586:
	.loc 1 1311 0
	call	__asan_report_load8
.LVL877:
.L1575:
	.loc 1 1254 0
	movl	%eax, %edi
	call	gai_strerror
.LVL878:
	movq	hostname(%rip), %rdx
	movq	%rax, %rcx
	movl	$.LC134, %esi
	xorl	%eax, %eax
	movl	$2, %edi
	call	syslog
.LVL879:
	.loc 1 1257 0
	movl	%r14d, %edi
	call	gai_strerror
.LVL880:
	movl	$stderr, %esi
	movq	%rax, %r8
	movq	hostname(%rip), %rcx
	shrq	$3, %rsi
	movq	argv0(%rip), %rdx
	cmpb	$0, 2147450880(%rsi)
	jne	.L1591
	movq	stderr(%rip), %rdi
	movl	$.LC135, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL881:
	.loc 1 1260 0
	call	__asan_handle_no_return
.LVL882:
	movl	$1, %edi
	call	exit
.LVL883:
.L1583:
	.loc 1 1295 0
	movq	%r13, %rdi
	call	__asan_report_store4
.LVL884:
.L1591:
	.loc 1 1257 0
	movl	$stderr, %edi
	call	__asan_report_load8
.LVL885:
.L1581:
	.loc 1 1285 0
	call	__asan_report_load4
.LVL886:
.L1582:
	.loc 1 1294 0
	call	__asan_report_load8
.LVL887:
.L1573:
	.loc 1 1304 0
	movq	hostname(%rip), %rdx
	movl	$2, %edi
	movl	$128, %ecx
	movl	$.LC136, %esi
	xorl	%eax, %eax
	call	syslog
.LVL888:
	.loc 1 1308 0
	call	__asan_handle_no_return
.LVL889:
	movl	$1, %edi
	call	exit
.LVL890:
.L1587:
	.loc 1 1312 0
	movq	%r12, %rdi
	call	__asan_report_store4
.LVL891:
.L1585:
	.loc 1 1302 0
	call	__asan_report_load4
.LVL892:
.L1590:
	.loc 1 1299 0
	movq	%r12, %rdi
	call	__asan_report_store4
.LVL893:
	.cfi_endproc
.LFE37:
	.size	lookup_hostname.constprop.1, .-lookup_hostname.constprop.1
	.section	.text.unlikely
.LCOLDE137:
	.text
.LHOTE137:
	.section	.rodata.str1.8
	.align 8
.LC138:
	.string	"6 32 4 5 gotv4 96 4 5 gotv6 160 16 2 tv 224 128 3 sa4 384 128 3 sa6 544 4097 3 cwd "
	.section	.rodata
	.align 32
.LC139:
	.string	"can't find any valid address"
	.zero	35
	.align 32
.LC140:
	.string	"%s: can't find any valid address\n"
	.zero	62
	.align 32
.LC141:
	.string	"unknown user - '%.80s'"
	.zero	41
	.align 32
.LC142:
	.string	"%s: unknown user - '%s'\n"
	.zero	39
	.align 32
.LC143:
	.string	"/dev/null"
	.zero	54
	.align 32
.LC144:
	.string	"logfile is not an absolute path, you may not be able to re-open it"
	.zero	61
	.align 32
.LC145:
	.string	"%s: logfile is not an absolute path, you may not be able to re-open it\n"
	.zero	56
	.align 32
.LC146:
	.string	"fchown logfile - %m"
	.zero	44
	.align 32
.LC147:
	.string	"fchown logfile"
	.zero	49
	.align 32
.LC148:
	.string	"chdir - %m"
	.zero	53
	.align 32
.LC149:
	.string	"chdir"
	.zero	58
	.align 32
.LC150:
	.string	"/"
	.zero	62
	.align 32
.LC151:
	.string	"daemon - %m"
	.zero	52
	.align 32
.LC152:
	.string	"w"
	.zero	62
	.align 32
.LC153:
	.string	"%d\n"
	.zero	60
	.align 32
.LC154:
	.string	"fdwatch initialization failure"
	.zero	33
	.align 32
.LC155:
	.string	"chroot - %m"
	.zero	52
	.align 32
.LC156:
	.string	"logfile is not within the chroot tree, you will not be able to re-open it"
	.zero	54
	.align 32
.LC157:
	.string	"%s: logfile is not within the chroot tree, you will not be able to re-open it\n"
	.zero	49
	.align 32
.LC158:
	.string	"chroot chdir - %m"
	.zero	46
	.align 32
.LC159:
	.string	"chroot chdir"
	.zero	51
	.align 32
.LC160:
	.string	"data_dir chdir - %m"
	.zero	44
	.align 32
.LC161:
	.string	"data_dir chdir"
	.zero	49
	.align 32
.LC162:
	.string	"tmr_create(occasional) failed"
	.zero	34
	.align 32
.LC163:
	.string	"tmr_create(idle) failed"
	.zero	40
	.align 32
.LC164:
	.string	"tmr_create(update_throttles) failed"
	.zero	60
	.align 32
.LC165:
	.string	"tmr_create(show_stats) failed"
	.zero	34
	.align 32
.LC166:
	.string	"setgroups - %m"
	.zero	49
	.align 32
.LC167:
	.string	"setgid - %m"
	.zero	52
	.align 32
.LC168:
	.string	"initgroups - %m"
	.zero	48
	.align 32
.LC169:
	.string	"setuid - %m"
	.zero	52
	.align 32
.LC170:
	.string	"started as root without requesting chroot(), warning only"
	.zero	38
	.align 32
.LC171:
	.string	"out of memory allocating a connecttab"
	.zero	58
	.align 32
.LC172:
	.string	"fdwatch - %m"
	.zero	51
	.section	.text.unlikely
.LCOLDB173:
	.section	.text.startup,"ax",@progbits
.LHOTB173:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LASANPC9:
.LFB9:
	.loc 1 353 0
	.cfi_startproc
.LVL894:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$4728, %rsp
	.cfi_def_cfa_offset 4784
	movl	__asan_option_detect_stack_use_after_return(%rip), %esi
.LVL895:
	leaq	16(%rsp), %rbx
	testl	%esi, %esi
	jne	.L1867
.LVL896:
.L1592:
	.loc 1 353 0
	movq	%rbx, %rax
	movq	$1102416563, (%rbx)
	movq	$.LC138, 8(%rbx)
	shrq	$3, %rax
	movq	$.LASANPC9, 16(%rbx)
	leaq	4704(%rbx), %rbp
	movl	$-235802127, 2147450880(%rax)
	movl	$-185273340, 2147450884(%rax)
	movl	$-218959118, 2147450888(%rax)
	movl	$-185273340, 2147450892(%rax)
	movl	$-218959118, 2147450896(%rax)
	movl	$-185335808, 2147450900(%rax)
	movl	$-218959118, 2147450904(%rax)
	movl	$-218959118, 2147450924(%rax)
	movl	$-218959118, 2147450944(%rax)
	movl	$-185273343, 2147451460(%rax)
	movl	$-202116109, 2147451464(%rax)
	.loc 1 370 0
	movq	%r13, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1868
	movq	0(%r13), %r12
	.loc 1 372 0
	movl	$47, %esi
	movq	%r12, %rdi
	.loc 1 370 0
	movq	%r12, argv0(%rip)
	.loc 1 372 0
	call	strrchr
.LVL897:
	.loc 1 374 0
	leaq	1(%rax), %rdx
	testq	%rax, %rax
	.loc 1 377 0
	movl	$9, %esi
	.loc 1 374 0
	cmovne	%rdx, %r12
.LVL898:
	.loc 1 377 0
	movl	$24, %edx
	movq	%r12, %rdi
	call	openlog
.LVL899:
	.loc 1 380 0
	movq	%r13, %rsi
	movl	%r14d, %edi
	.loc 1 386 0
	leaq	384(%rbx), %r13
.LVL900:
	.loc 1 380 0
	call	parse_args
.LVL901:
	.loc 1 383 0
	call	tzset
.LVL902:
	.loc 1 386 0
	leaq	96(%rbx), %rcx
	leaq	32(%rbx), %rsi
	addq	$224, %rbx
	movq	%r13, %rdx
	movq	%rbx, %rdi
	call	lookup_hostname.constprop.1
.LVL903:
	.loc 1 387 0
	movl	-4672(%rbp), %ecx
	testl	%ecx, %ecx
	jne	.L1598
	.loc 1 387 0 is_stmt 0 discriminator 1
	cmpl	$0, -4608(%rbp)
	je	.L1869
.L1598:
	.loc 1 398 0 is_stmt 1
	movq	throttlefile(%rip), %rdi
	.loc 1 395 0
	movl	$0, numthrottles(%rip)
	.loc 1 396 0
	movl	$0, maxthrottles(%rip)
	.loc 1 397 0
	movq	$0, throttles(%rip)
	.loc 1 398 0
	testq	%rdi, %rdi
	je	.L1600
	.loc 1 399 0
	call	read_throttlefile
.LVL904:
.L1600:
	.loc 1 404 0
	call	getuid
.LVL905:
	testl	%eax, %eax
	.loc 1 357 0
	movl	$32767, (%rsp)
	.loc 1 356 0
	movl	$32767, 4(%rsp)
	.loc 1 404 0
	je	.L1870
.LVL906:
.L1601:
	.loc 1 418 0
	movq	logfile(%rip), %r12
.LVL907:
	testq	%r12, %r12
	je	.L1696
	.loc 1 420 0
	movl	$.LC143, %esi
	movq	%r12, %rdi
	call	strcmp
.LVL908:
	testl	%eax, %eax
	je	.L1871
	.loc 1 425 0
	movl	$.LC98, %esi
	movq	%r12, %rdi
	call	strcmp
.LVL909:
	testl	%eax, %eax
	jne	.L1608
	.loc 1 426 0
	movl	$stdout, %eax
	movq	stdout(%rip), %r15
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1872
.L1606:
.LVL910:
	.loc 1 460 0
	movq	dir(%rip), %rdi
	testq	%rdi, %rdi
	je	.L1615
	.loc 1 462 0
	call	chdir
.LVL911:
	testl	%eax, %eax
	js	.L1873
.L1615:
	.loc 1 486 0
	leaq	-4160(%rbp), %r12
	movl	$4096, %esi
	movq	%r12, %rdi
	call	getcwd
.LVL912:
	.loc 1 487 0
	movq	%r12, %rdi
	call	strlen
.LVL913:
	leaq	-1(%rax), %rdx
	leaq	(%r12,%rdx), %rdi
	movq	%rdi, %rcx
	movq	%rdi, %rsi
	shrq	$3, %rcx
	andl	$7, %esi
	movzbl	2147450880(%rcx), %ecx
	cmpb	%sil, %cl
	jg	.L1616
	testb	%cl, %cl
	jne	.L1874
.L1616:
	cmpb	$47, -4160(%rdx,%rbp)
	je	.L1617
	.loc 1 488 0
	leaq	(%r12,%rax), %rdi
	movl	$2, %edx
	movl	$.LC150, %esi
	call	memcpy
.LVL914:
.L1617:
	.loc 1 490 0
	movl	debug(%rip), %edx
	testl	%edx, %edx
	jne	.L1618
	.loc 1 495 0
	movl	$stdin, %eax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1875
	movq	stdin(%rip), %rdi
	call	fclose
.LVL915:
	.loc 1 496 0
	movl	$stdout, %eax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1876
	movq	stdout(%rip), %rdi
	cmpq	%rdi, %r15
	je	.L1621
	.loc 1 497 0
	call	fclose
.LVL916:
.L1621:
	.loc 1 498 0
	movl	$stderr, %eax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1877
	movq	stderr(%rip), %rdi
	call	fclose
.LVL917:
	.loc 1 502 0
	movl	$1, %esi
	movl	$1, %edi
	call	daemon
.LVL918:
	testl	%eax, %eax
	.loc 1 504 0
	movl	$.LC151, %esi
	.loc 1 502 0
	js	.L1863
.L1623:
	.loc 1 533 0
	movq	pidfile(%rip), %rdi
	testq	%rdi, %rdi
	je	.L1624
.LBB17:
	.loc 1 536 0
	movl	$.LC152, %esi
	call	fopen
.LVL919:
	.loc 1 537 0
	testq	%rax, %rax
	.loc 1 536 0
	movq	%rax, %r14
.LVL920:
	.loc 1 537 0
	je	.L1878
	.loc 1 542 0
	call	getpid
.LVL921:
	movq	%r14, %rdi
	movl	%eax, %edx
	movl	$.LC153, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL922:
	.loc 1 543 0
	movq	%r14, %rdi
	call	fclose
.LVL923:
.L1624:
.LBE17:
	.loc 1 549 0
	call	fdwatch_get_nfiles
.LVL924:
	.loc 1 550 0
	testl	%eax, %eax
	.loc 1 549 0
	movl	%eax, max_connects(%rip)
	.loc 1 550 0
	js	.L1879
	.loc 1 555 0
	subl	$10, %eax
	.loc 1 558 0
	cmpl	$0, do_chroot(%rip)
	.loc 1 555 0
	movl	%eax, max_connects(%rip)
	.loc 1 558 0
	jne	.L1880
.L1627:
	.loc 1 598 0
	movq	data_dir(%rip), %rdi
	testq	%rdi, %rdi
	je	.L1632
	.loc 1 600 0
	call	chdir
.LVL925:
	testl	%eax, %eax
	js	.L1881
.L1632:
	.loc 1 610 0
	movl	$handle_term, %esi
	movl	$15, %edi
	xorl	%eax, %eax
	call	sigset
.LVL926:
	.loc 1 611 0
	movl	$handle_term, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	sigset
.LVL927:
	.loc 1 612 0
	movl	$handle_chld, %esi
	movl	$17, %edi
	xorl	%eax, %eax
	call	sigset
.LVL928:
	.loc 1 613 0
	movl	$1, %esi
	movl	$13, %edi
	xorl	%eax, %eax
	call	sigset
.LVL929:
	.loc 1 614 0
	movl	$handle_hup, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	sigset
.LVL930:
	.loc 1 615 0
	movl	$handle_usr1, %esi
	movl	$10, %edi
	xorl	%eax, %eax
	call	sigset
.LVL931:
	.loc 1 616 0
	movl	$handle_usr2, %esi
	movl	$12, %edi
	xorl	%eax, %eax
	call	sigset
.LVL932:
	.loc 1 617 0
	movl	$handle_alrm, %esi
	movl	$14, %edi
	xorl	%eax, %eax
	call	sigset
.LVL933:
	.loc 1 631 0
	movl	$360, %edi
	.loc 1 628 0
	movl	$0, got_hup(%rip)
	.loc 1 629 0
	movl	$0, got_usr1(%rip)
	.loc 1 630 0
	movl	$0, watchdog_flag(%rip)
	.loc 1 631 0
	call	alarm
.LVL934:
	.loc 1 634 0
	call	tmr_init
.LVL935:
	.loc 1 639 0
	xorl	%esi, %esi
	cmpl	$0, -4608(%rbp)
	movl	no_empty_referers(%rip), %eax
	movq	%r13, %rdx
	movzwl	port(%rip), %ecx
	movl	cgi_limit(%rip), %r9d
	movq	cgi_pattern(%rip), %r8
	movq	hostname(%rip), %rdi
	cmove	%rsi, %rdx
	cmpl	$0, -4672(%rbp)
	pushq	%rax
	.cfi_def_cfa_offset 4792
.LVL936:
	movl	do_global_passwd(%rip), %eax
	pushq	local_pattern(%rip)
	.cfi_def_cfa_offset 4800
	pushq	url_pattern(%rip)
	.cfi_def_cfa_offset 4808
	pushq	%rax
	.cfi_def_cfa_offset 4816
	movl	do_vhost(%rip), %eax
	cmovne	%rbx, %rsi
	pushq	%rax
	.cfi_def_cfa_offset 4824
	movl	no_symlink_check(%rip), %eax
	pushq	%rax
	.cfi_def_cfa_offset 4832
	movl	no_log(%rip), %eax
	pushq	%r15
	.cfi_def_cfa_offset 4840
	pushq	%rax
	.cfi_def_cfa_offset 4848
	movl	max_age(%rip), %eax
	pushq	%r12
	.cfi_def_cfa_offset 4856
	pushq	%rax
	.cfi_def_cfa_offset 4864
	pushq	p3p(%rip)
	.cfi_def_cfa_offset 4872
	pushq	charset(%rip)
	.cfi_def_cfa_offset 4880
	call	httpd_initialize
.LVL937:
	.loc 1 645 0
	addq	$96, %rsp
	.cfi_def_cfa_offset 4784
.LVL938:
	testq	%rax, %rax
	.loc 1 639 0
	movq	%rax, hs(%rip)
	.loc 1 645 0
	je	.L1864
	.loc 1 649 0
	movq	JunkClientData(%rip), %rdx
	movl	$occasional, %esi
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$120000, %ecx
	call	tmr_create
.LVL939:
	testq	%rax, %rax
	.loc 1 651 0
	movl	$.LC162, %esi
	.loc 1 649 0
	je	.L1865
	.loc 1 655 0
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$5000, %ecx
	movl	$idle, %esi
	call	tmr_create
.LVL940:
	testq	%rax, %rax
	je	.L1882
	.loc 1 660 0
	cmpl	$0, numthrottles(%rip)
	jle	.L1638
	.loc 1 663 0
	movq	JunkClientData(%rip), %rdx
	movl	$update_throttles, %esi
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$2000, %ecx
	call	tmr_create
.LVL941:
	testq	%rax, %rax
	.loc 1 665 0
	movl	$.LC164, %esi
	.loc 1 663 0
	je	.L1865
.L1638:
	.loc 1 671 0
	movq	JunkClientData(%rip), %rdx
	movl	$show_stats, %esi
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$3600000, %ecx
	call	tmr_create
.LVL942:
	testq	%rax, %rax
	.loc 1 673 0
	movl	$.LC165, %esi
	.loc 1 671 0
	je	.L1865
	.loc 1 677 0
	xorl	%edi, %edi
	call	time
.LVL943:
	.loc 1 678 0
	movq	$0, stats_connections(%rip)
	.loc 1 677 0
	movq	%rax, stats_time(%rip)
	movq	%rax, start_time(%rip)
	.loc 1 679 0
	movq	$0, stats_bytes(%rip)
	.loc 1 680 0
	movl	$0, stats_simultaneous(%rip)
	.loc 1 683 0
	call	getuid
.LVL944:
	testl	%eax, %eax
	je	.L1883
.L1641:
	.loc 1 718 0
	movslq	max_connects(%rip), %r12
	movq	%r12, %rbx
	imulq	$144, %r12, %r12
	movq	%r12, %rdi
	call	malloc
.LVL945:
	.loc 1 719 0
	testq	%rax, %rax
	.loc 1 718 0
	movq	%rax, connects(%rip)
	.loc 1 719 0
	je	.L1647
.LVL946:
	.loc 1 724 0 discriminator 1
	xorl	%ecx, %ecx
	testl	%ebx, %ebx
	movq	%rax, %rdx
	jle	.L1656
.LVL947:
	.p2align 4,,10
	.p2align 3
.L1807:
	.loc 1 726 0 discriminator 3
	movq	%rdx, %rsi
	shrq	$3, %rsi
	movzbl	2147450880(%rsi), %esi
	testb	%sil, %sil
	je	.L1652
	cmpb	$3, %sil
	jle	.L1884
.L1652:
	.loc 1 727 0 discriminator 3
	leaq	4(%rdx), %rdi
	addl	$1, %ecx
.LVL948:
	.loc 1 726 0 discriminator 3
	movl	$0, (%rdx)
	.loc 1 727 0 discriminator 3
	movq	%rdi, %rsi
	shrq	$3, %rsi
	movzbl	2147450880(%rsi), %r8d
	movq	%rdi, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%r8b, %sil
	jl	.L1653
	testb	%r8b, %r8b
	jne	.L1885
.L1653:
	.loc 1 728 0 discriminator 3
	leaq	8(%rdx), %rdi
	.loc 1 727 0 discriminator 3
	movl	%ecx, 4(%rdx)
	.loc 1 728 0 discriminator 3
	movq	%rdi, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L1886
	movq	$0, 8(%rdx)
.LVL949:
	addq	$144, %rdx
	.loc 1 724 0 discriminator 3
	cmpl	%ecx, %ebx
	jne	.L1807
.LVL950:
.L1656:
	.loc 1 730 0
	leaq	-144(%rax,%r12), %rdx
	leaq	4(%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L1649
	testb	%cl, %cl
	jne	.L1887
.L1649:
	.loc 1 735 0
	movq	hs(%rip), %rax
	.loc 1 730 0
	movl	$-1, 4(%rdx)
	.loc 1 731 0
	movl	$0, first_free_connect(%rip)
	.loc 1 732 0
	movl	$0, num_connects(%rip)
	.loc 1 733 0
	movl	$0, httpd_conn_count(%rip)
	.loc 1 735 0
	testq	%rax, %rax
	je	.L1657
	.loc 1 737 0
	leaq	72(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L1658
	cmpb	$3, %dl
	jle	.L1888
.L1658:
	movl	72(%rax), %edi
	cmpl	$-1, %edi
	je	.L1659
	.loc 1 738 0
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	fdwatch_add_fd
.LVL951:
	movq	hs(%rip), %rax
.L1659:
	.loc 1 739 0
	leaq	76(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L1660
	testb	%cl, %cl
	jne	.L1889
.L1660:
	movl	76(%rax), %edi
	cmpl	$-1, %edi
	je	.L1657
	.loc 1 740 0
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	fdwatch_add_fd
.LVL952:
.L1657:
	.loc 1 744 0
	subq	$4544, %rbp
	movq	%rbp, %rdi
	call	tmr_prepare_timeval
.LVL953:
	.p2align 4,,10
	.p2align 3
.L1661:
	.loc 1 745 0
	movl	terminate(%rip), %eax
	testl	%eax, %eax
	je	.L1694
	.loc 1 745 0 is_stmt 0 discriminator 1
	cmpl	$0, num_connects(%rip)
	jle	.L1890
.L1694:
	.loc 1 748 0 is_stmt 1
	movl	got_hup(%rip), %eax
	testl	%eax, %eax
	jne	.L1891
.L1662:
	.loc 1 755 0
	movq	%rbp, %rdi
	call	tmr_mstimeout
.LVL954:
	movq	%rax, %rdi
	call	fdwatch
.LVL955:
	.loc 1 756 0
	testl	%eax, %eax
	.loc 1 755 0
	movl	%eax, %ebx
.LVL956:
	.loc 1 756 0
	js	.L1892
	.loc 1 763 0
	movq	%rbp, %rdi
	call	tmr_prepare_timeval
.LVL957:
	.loc 1 765 0
	testl	%ebx, %ebx
	je	.L1893
	.loc 1 773 0
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L1680
	.loc 1 773 0 is_stmt 0 discriminator 1
	leaq	76(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L1671
	testb	%cl, %cl
	jne	.L1894
.L1671:
	movl	76(%rax), %edi
	cmpl	$-1, %edi
	je	.L1672
	.loc 1 774 0 is_stmt 1 discriminator 2
	call	fdwatch_check_fd
.LVL958:
	.loc 1 773 0 discriminator 2
	testl	%eax, %eax
	jne	.L1673
.L1677:
	.loc 1 783 0
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L1680
.L1672:
	.loc 1 783 0 is_stmt 0 discriminator 1
	leaq	72(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L1678
	cmpb	$3, %dl
	jle	.L1895
.L1678:
	movl	72(%rax), %edi
	cmpl	$-1, %edi
	je	.L1680
	.loc 1 784 0 is_stmt 1 discriminator 2
	call	fdwatch_check_fd
.LVL959:
	.loc 1 783 0 discriminator 2
	testl	%eax, %eax
	jne	.L1896
.LVL960:
	.p2align 4,,10
	.p2align 3
.L1680:
	.loc 1 795 0
	call	fdwatch_get_next_client_data
.LVL961:
	cmpq	$-1, %rax
	movq	%rax, %rbx
.LVL962:
	je	.L1897
	.loc 1 797 0
	testq	%rbx, %rbx
	je	.L1680
	.loc 1 799 0
	leaq	8(%rbx), %rdi
	movq	%rdi, %rax
.LVL963:
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1898
	movq	8(%rbx), %rax
.LVL964:
	.loc 1 800 0
	leaq	704(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L1682
	cmpb	$3, %dl
	jle	.L1899
.L1682:
	movl	704(%rax), %edi
	call	fdwatch_check_fd
.LVL965:
	testl	%eax, %eax
	je	.L1900
	.loc 1 804 0
	movq	%rbx, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L1685
	cmpb	$3, %al
	jle	.L1901
.L1685:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	je	.L1686
	cmpl	$4, %eax
	je	.L1687
	cmpl	$1, %eax
	jne	.L1680
	.loc 1 806 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	handle_read
.LVL966:
	jmp	.L1680
.LVL967:
.L1871:
	.loc 1 422 0
	movl	$1, no_log(%rip)
.LVL968:
	.loc 1 423 0
	xorl	%r15d, %r15d
	jmp	.L1606
.LVL969:
.L1892:
	.loc 1 758 0
	call	__errno_location
.LVL970:
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%rax, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L1664
	testb	%cl, %cl
	jne	.L1902
.L1664:
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L1661
	cmpl	$11, %eax
	je	.L1661
	.loc 1 760 0
	movl	$.LC172, %esi
	movl	$3, %edi
.LVL971:
.L1866:
	.loc 1 552 0
	xorl	%eax, %eax
	call	syslog
.LVL972:
.L1864:
	.loc 1 553 0
	call	__asan_handle_no_return
.LVL973:
	movl	$1, %edi
	call	exit
.LVL974:
.L1618:
	.loc 1 529 0
	call	setsid
.LVL975:
	jmp	.L1623
.LVL976:
.L1870:
	.loc 1 406 0
	movq	user(%rip), %rdi
	call	getpwnam
.LVL977:
	.loc 1 407 0
	testq	%rax, %rax
	je	.L1903
	.loc 1 413 0
	leaq	16(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L1604
	cmpb	$3, %dl
	jle	.L1904
.L1604:
	.loc 1 414 0
	leaq	20(%rax), %rdi
	.loc 1 413 0
	movl	16(%rax), %ecx
	.loc 1 414 0
	movq	%rdi, %rdx
	shrq	$3, %rdx
	.loc 1 413 0
	movl	%ecx, 4(%rsp)
.LVL978:
	.loc 1 414 0
	movzbl	2147450880(%rdx), %ecx
.LVL979:
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L1605
	testb	%cl, %cl
	jne	.L1905
.L1605:
	movl	20(%rax), %eax
.LVL980:
	movl	%eax, (%rsp)
.LVL981:
	jmp	.L1601
.LVL982:
.L1869:
	.loc 1 389 0
	xorl	%eax, %eax
	movl	$.LC139, %esi
	movl	$3, %edi
	call	syslog
.LVL983:
	.loc 1 390 0
	movl	$stderr, %eax
	movq	argv0(%rip), %rdx
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1906
	movq	stderr(%rip), %rdi
	movl	$.LC140, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL984:
	.loc 1 391 0
	call	__asan_handle_no_return
.LVL985:
	movl	$1, %edi
	call	exit
.LVL986:
.L1883:
	.loc 1 686 0
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	setgroups
.LVL987:
	testl	%eax, %eax
	.loc 1 688 0
	movl	$.LC166, %esi
	.loc 1 686 0
	js	.L1863
	.loc 1 692 0
	movl	(%rsp), %edi
	call	setgid
.LVL988:
	testl	%eax, %eax
	.loc 1 694 0
	movl	$.LC167, %esi
	.loc 1 692 0
	js	.L1863
	.loc 1 698 0
	movl	(%rsp), %esi
	movq	user(%rip), %rdi
	call	initgroups
.LVL989:
	testl	%eax, %eax
	js	.L1907
.L1644:
	.loc 1 705 0
	movl	4(%rsp), %edi
	call	setuid
.LVL990:
	testl	%eax, %eax
	.loc 1 707 0
	movl	$.LC169, %esi
	.loc 1 705 0
	js	.L1863
	.loc 1 711 0
	cmpl	$0, do_chroot(%rip)
	jne	.L1641
	.loc 1 712 0
	movl	$.LC170, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	syslog
.LVL991:
	jmp	.L1641
.L1882:
	.loc 1 657 0
	movl	$.LC163, %esi
.L1865:
	movl	$2, %edi
	call	syslog
.LVL992:
	.loc 1 658 0
	call	__asan_handle_no_return
.LVL993:
	movl	$1, %edi
	call	exit
.LVL994:
.L1900:
	.loc 1 802 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	clear_connection
.LVL995:
	jmp	.L1680
.L1686:
	.loc 1 807 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	handle_send
.LVL996:
	jmp	.L1680
.L1687:
	.loc 1 808 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	handle_linger
.LVL997:
	jmp	.L1680
.LVL998:
.L1897:
	.loc 1 811 0
	movq	%rbp, %rdi
	call	tmr_run
.LVL999:
	.loc 1 813 0
	movl	got_usr1(%rip), %eax
	testl	%eax, %eax
	je	.L1661
	.loc 1 813 0 is_stmt 0 discriminator 1
	cmpl	$0, terminate(%rip)
	jne	.L1661
	.loc 1 816 0 is_stmt 1
	movq	hs(%rip), %rax
	.loc 1 815 0
	movl	$1, terminate(%rip)
	.loc 1 816 0
	testq	%rax, %rax
	je	.L1661
	.loc 1 818 0
	leaq	72(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L1690
	cmpb	$3, %dl
	jg	.L1690
	call	__asan_report_load4
.LVL1000:
.L1690:
	movl	72(%rax), %edi
	cmpl	$-1, %edi
	je	.L1691
	.loc 1 819 0
	call	fdwatch_del_fd
.LVL1001:
	movq	hs(%rip), %rax
.L1691:
	.loc 1 820 0
	leaq	76(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L1692
	testb	%cl, %cl
	je	.L1692
	call	__asan_report_load4
.LVL1002:
.L1692:
	movl	76(%rax), %edi
	cmpl	$-1, %edi
	je	.L1693
	.loc 1 821 0
	call	fdwatch_del_fd
.LVL1003:
.L1693:
	.loc 1 822 0
	movq	hs(%rip), %rdi
	call	httpd_unlisten
.LVL1004:
	jmp	.L1661
.LVL1005:
.L1891:
	.loc 1 750 0
	call	re_open_logfile
.LVL1006:
	.loc 1 751 0
	movl	$0, got_hup(%rip)
	jmp	.L1662
.L1879:
	.loc 1 552 0
	movl	$.LC154, %esi
.L1863:
	movl	$2, %edi
	jmp	.L1866
.LVL1007:
.L1893:
	.loc 1 768 0
	movq	%rbp, %rdi
	call	tmr_run
.LVL1008:
	.loc 1 769 0
	jmp	.L1661
.LVL1009:
.L1880:
	.loc 1 560 0
	movq	%r12, %rdi
	call	chroot
.LVL1010:
	testl	%eax, %eax
	js	.L1908
	.loc 1 571 0
	movq	logfile(%rip), %r14
	testq	%r14, %r14
	je	.L1629
	.loc 1 571 0 is_stmt 0 discriminator 1
	movl	$.LC98, %esi
	movq	%r14, %rdi
	call	strcmp
.LVL1011:
	testl	%eax, %eax
	je	.L1629
	.loc 1 573 0 is_stmt 1
	movq	%r12, %rdi
	call	strlen
.LVL1012:
	movq	%r12, %rsi
	movq	%rax, %rdx
	movq	%r14, %rdi
	movq	%rax, 8(%rsp)
	call	strncmp
.LVL1013:
	testl	%eax, %eax
	je	.L1909
	.loc 1 583 0
	xorl	%eax, %eax
	movl	$.LC156, %esi
	movl	$4, %edi
	call	syslog
.LVL1014:
	.loc 1 584 0
	movl	$stderr, %eax
	movq	argv0(%rip), %rdx
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1910
	movq	stderr(%rip), %rdi
	movl	$.LC157, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL1015:
.L1629:
	.loc 1 587 0
	movl	$2, %edx
	movl	$.LC150, %esi
	movq	%r12, %rdi
	call	memcpy
.LVL1016:
	.loc 1 589 0
	movq	%r12, %rdi
	call	chdir
.LVL1017:
	testl	%eax, %eax
	jns	.L1627
	.loc 1 591 0
	movl	$.LC158, %esi
	xorl	%eax, %eax
	movl	$2, %edi
	call	syslog
.LVL1018:
	.loc 1 592 0
	movl	$.LC159, %edi
	call	perror
.LVL1019:
	.loc 1 593 0
	call	__asan_handle_no_return
.LVL1020:
	movl	$1, %edi
	call	exit
.LVL1021:
.L1696:
	.loc 1 457 0
	xorl	%r15d, %r15d
	jmp	.L1606
.L1608:
	.loc 1 429 0
	movq	%r12, %rdi
	movl	$.LC100, %esi
	call	fopen
.LVL1022:
	.loc 1 430 0
	movq	logfile(%rip), %r12
	.loc 1 429 0
	movq	%rax, %r15
.LVL1023:
	.loc 1 430 0
	movl	$384, %esi
	movq	%r12, %rdi
	call	chmod
.LVL1024:
	.loc 1 431 0
	testq	%r15, %r15
	je	.L1699
	testl	%eax, %eax
	jne	.L1699
	.loc 1 437 0
	movq	%r12, %rax
.LVL1025:
	movq	%r12, %rdx
	shrq	$3, %rax
	andl	$7, %edx
	movzbl	2147450880(%rax), %eax
	cmpb	%dl, %al
	jg	.L1612
	testb	%al, %al
	je	.L1612
	movq	%r12, %rdi
	call	__asan_report_load1
.LVL1026:
.L1612:
	cmpb	$47, (%r12)
	je	.L1613
	.loc 1 439 0
	xorl	%eax, %eax
	movl	$.LC144, %esi
	movl	$4, %edi
	call	syslog
.LVL1027:
	.loc 1 440 0
	movl	$stderr, %eax
	movq	argv0(%rip), %rdx
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1911
	movq	stderr(%rip), %rdi
	movl	$.LC145, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL1028:
.L1613:
	.loc 1 442 0
	movq	%r15, %rdi
	call	fileno
.LVL1029:
	movl	$1, %edx
	movl	%eax, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	call	fcntl
.LVL1030:
	.loc 1 443 0
	call	getuid
.LVL1031:
	testl	%eax, %eax
	jne	.L1606
	.loc 1 448 0
	movq	%r15, %rdi
	call	fileno
.LVL1032:
	movl	(%rsp), %edx
	movl	4(%rsp), %esi
	movl	%eax, %edi
	call	fchown
.LVL1033:
	testl	%eax, %eax
	jns	.L1606
	.loc 1 450 0
	movl	$.LC146, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	syslog
.LVL1034:
	.loc 1 451 0
	movl	$.LC147, %edi
	call	perror
.LVL1035:
	jmp	.L1606
.L1873:
	.loc 1 464 0
	movl	$.LC148, %esi
	xorl	%eax, %eax
	movl	$2, %edi
	call	syslog
.LVL1036:
	.loc 1 465 0
	movl	$.LC149, %edi
	call	perror
.LVL1037:
	.loc 1 466 0
	call	__asan_handle_no_return
.LVL1038:
	movl	$1, %edi
	call	exit
.LVL1039:
.L1878:
.LBB18:
	.loc 1 539 0
	movq	pidfile(%rip), %rdx
	movl	$2, %edi
	movl	$.LC89, %esi
	xorl	%eax, %eax
.LVL1040:
	call	syslog
.LVL1041:
	.loc 1 540 0
	call	__asan_handle_no_return
.LVL1042:
	movl	$1, %edi
	call	exit
.LVL1043:
.L1881:
.LBE18:
	.loc 1 602 0
	movl	$.LC160, %esi
	xorl	%eax, %eax
	movl	$2, %edi
	call	syslog
.LVL1044:
	.loc 1 603 0
	movl	$.LC161, %edi
	call	perror
.LVL1045:
	.loc 1 604 0
	call	__asan_handle_no_return
.LVL1046:
	movl	$1, %edi
	call	exit
.LVL1047:
.L1909:
	.loc 1 575 0
	movq	8(%rsp), %rcx
	movq	%r14, %rdi
	leaq	-1(%r14,%rcx), %rsi
	call	strcpy
.LVL1048:
	jmp	.L1629
.LVL1049:
.L1673:
	.loc 1 776 0
	movq	hs(%rip), %rdx
	leaq	76(%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L1675
	testb	%cl, %cl
	jne	.L1912
.L1675:
	movl	76(%rdx), %esi
	movq	%rbp, %rdi
	call	handle_newconnect
.LVL1050:
	testl	%eax, %eax
	jne	.L1661
	jmp	.L1677
.L1896:
	.loc 1 786 0
	movq	hs(%rip), %rax
	leaq	72(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L1679
	cmpb	$3, %dl
	jle	.L1913
.L1679:
	movl	72(%rax), %esi
	movq	%rbp, %rdi
	call	handle_newconnect
.LVL1051:
	testl	%eax, %eax
	jne	.L1661
	jmp	.L1680
.LVL1052:
.L1699:
	.loc 1 433 0
	movq	%r12, %rdx
	movl	$.LC89, %esi
	xorl	%eax, %eax
.LVL1053:
	movl	$2, %edi
	call	syslog
.LVL1054:
	.loc 1 434 0
	movq	logfile(%rip), %rdi
	call	perror
.LVL1055:
	.loc 1 435 0
	call	__asan_handle_no_return
.LVL1056:
	movl	$1, %edi
	call	exit
.LVL1057:
.L1890:
	.loc 1 828 0
	call	shut_down
.LVL1058:
	.loc 1 829 0
	movl	$5, %edi
	movl	$.LC110, %esi
	xorl	%eax, %eax
	call	syslog
.LVL1059:
	.loc 1 830 0
	call	closelog
.LVL1060:
	.loc 1 831 0
	call	__asan_handle_no_return
.LVL1061:
	xorl	%edi, %edi
	call	exit
.LVL1062:
.L1908:
	.loc 1 562 0
	movl	$.LC155, %esi
	xorl	%eax, %eax
	movl	$2, %edi
	call	syslog
.LVL1063:
	.loc 1 563 0
	movl	$.LC34, %edi
	call	perror
.LVL1064:
	.loc 1 564 0
	call	__asan_handle_no_return
.LVL1065:
	movl	$1, %edi
	call	exit
.LVL1066:
.L1903:
	.loc 1 409 0
	movq	user(%rip), %rdx
	movl	$.LC141, %esi
	movl	$2, %edi
	call	syslog
.LVL1067:
	.loc 1 410 0
	movl	$stderr, %eax
	movq	user(%rip), %rcx
	movq	argv0(%rip), %rdx
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L1914
	movq	stderr(%rip), %rdi
	movl	$.LC142, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL1068:
	.loc 1 411 0
	call	__asan_handle_no_return
.LVL1069:
	movl	$1, %edi
	call	exit
.LVL1070:
.L1647:
	.loc 1 721 0
	movl	$.LC171, %esi
	jmp	.L1863
.L1907:
	.loc 1 699 0
	movl	$.LC168, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	syslog
.LVL1071:
	jmp	.L1644
.LVL1072:
.L1867:
	.loc 1 353 0
	movq	%rbx, %rsi
	movl	$4704, %edi
.LVL1073:
	call	__asan_stack_malloc_7
.LVL1074:
	movq	%rax, %rbx
	jmp	.L1592
.LVL1075:
.L1895:
	.loc 1 783 0
	call	__asan_report_load4
.LVL1076:
.L1911:
	.loc 1 440 0
	movl	$stderr, %edi
	call	__asan_report_load8
.LVL1077:
.L1889:
	.loc 1 739 0
	call	__asan_report_load4
.LVL1078:
.L1888:
	.loc 1 737 0
	call	__asan_report_load4
.LVL1079:
.L1887:
	.loc 1 730 0
	call	__asan_report_store4
.LVL1080:
.L1886:
	.loc 1 728 0
	call	__asan_report_store8
.LVL1081:
.L1912:
	.loc 1 776 0
	call	__asan_report_load4
.LVL1082:
.L1898:
	.loc 1 799 0
	call	__asan_report_load8
.LVL1083:
.L1901:
	.loc 1 804 0
	movq	%rbx, %rdi
	call	__asan_report_load4
.LVL1084:
.L1899:
	.loc 1 800 0
	call	__asan_report_load4
.LVL1085:
.L1894:
	.loc 1 773 0
	call	__asan_report_load4
.LVL1086:
.L1913:
	.loc 1 786 0
	call	__asan_report_load4
.LVL1087:
.L1902:
	.loc 1 758 0
	movq	%rax, %rdi
	call	__asan_report_load4
.LVL1088:
.L1910:
	.loc 1 584 0
	movl	$stderr, %edi
	call	__asan_report_load8
.LVL1089:
.L1874:
	.loc 1 487 0
	call	__asan_report_load1
.LVL1090:
.L1872:
	.loc 1 426 0
	movl	$stdout, %edi
	call	__asan_report_load8
.LVL1091:
.L1868:
	.loc 1 370 0
	movq	%r13, %rdi
	call	__asan_report_load8
.LVL1092:
.L1877:
	.loc 1 498 0
	movl	$stderr, %edi
	call	__asan_report_load8
.LVL1093:
.L1905:
	.loc 1 414 0
	call	__asan_report_load4
.LVL1094:
.L1906:
	.loc 1 390 0
	movl	$stderr, %edi
	call	__asan_report_load8
.LVL1095:
.L1875:
	.loc 1 495 0
	movl	$stdin, %edi
	call	__asan_report_load8
.LVL1096:
.L1876:
	.loc 1 496 0
	movl	$stdout, %edi
	call	__asan_report_load8
.LVL1097:
.L1885:
	.loc 1 727 0
	call	__asan_report_store4
.LVL1098:
.L1884:
	.loc 1 726 0
	movq	%rdx, %rdi
	call	__asan_report_store4
.LVL1099:
.L1904:
	.loc 1 413 0
	call	__asan_report_load4
.LVL1100:
.L1914:
	.loc 1 410 0
	movl	$stderr, %edi
	call	__asan_report_load8
.LVL1101:
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE173:
	.section	.text.startup
.LHOTE173:
	.bss
	.align 32
	.type	watchdog_flag, @object
	.size	watchdog_flag, 4
watchdog_flag:
	.zero	64
	.align 32
	.type	got_usr1, @object
	.size	got_usr1, 4
got_usr1:
	.zero	64
	.align 32
	.type	got_hup, @object
	.size	got_hup, 4
got_hup:
	.zero	64
	.comm	stats_simultaneous,4,4
	.comm	stats_bytes,8,8
	.comm	stats_connections,8,8
	.comm	stats_time,8,8
	.comm	start_time,8,8
	.globl	terminate
	.align 32
	.type	terminate, @object
	.size	terminate, 4
terminate:
	.zero	64
	.align 32
	.type	hs, @object
	.size	hs, 8
hs:
	.zero	64
	.align 32
	.type	httpd_conn_count, @object
	.size	httpd_conn_count, 4
httpd_conn_count:
	.zero	64
	.align 32
	.type	first_free_connect, @object
	.size	first_free_connect, 4
first_free_connect:
	.zero	64
	.align 32
	.type	max_connects, @object
	.size	max_connects, 4
max_connects:
	.zero	64
	.align 32
	.type	num_connects, @object
	.size	num_connects, 4
num_connects:
	.zero	64
	.align 32
	.type	connects, @object
	.size	connects, 8
connects:
	.zero	64
	.align 32
	.type	maxthrottles, @object
	.size	maxthrottles, 4
maxthrottles:
	.zero	64
	.align 32
	.type	numthrottles, @object
	.size	numthrottles, 4
numthrottles:
	.zero	64
	.align 32
	.type	throttles, @object
	.size	throttles, 8
throttles:
	.zero	64
	.align 32
	.type	max_age, @object
	.size	max_age, 4
max_age:
	.zero	64
	.align 32
	.type	p3p, @object
	.size	p3p, 8
p3p:
	.zero	64
	.align 32
	.type	charset, @object
	.size	charset, 8
charset:
	.zero	64
	.align 32
	.type	user, @object
	.size	user, 8
user:
	.zero	64
	.align 32
	.type	pidfile, @object
	.size	pidfile, 8
pidfile:
	.zero	64
	.align 32
	.type	hostname, @object
	.size	hostname, 8
hostname:
	.zero	64
	.align 32
	.type	throttlefile, @object
	.size	throttlefile, 8
throttlefile:
	.zero	64
	.align 32
	.type	logfile, @object
	.size	logfile, 8
logfile:
	.zero	64
	.align 32
	.type	local_pattern, @object
	.size	local_pattern, 8
local_pattern:
	.zero	64
	.align 32
	.type	no_empty_referers, @object
	.size	no_empty_referers, 4
no_empty_referers:
	.zero	64
	.align 32
	.type	url_pattern, @object
	.size	url_pattern, 8
url_pattern:
	.zero	64
	.align 32
	.type	cgi_limit, @object
	.size	cgi_limit, 4
cgi_limit:
	.zero	64
	.align 32
	.type	cgi_pattern, @object
	.size	cgi_pattern, 8
cgi_pattern:
	.zero	64
	.align 32
	.type	do_global_passwd, @object
	.size	do_global_passwd, 4
do_global_passwd:
	.zero	64
	.align 32
	.type	do_vhost, @object
	.size	do_vhost, 4
do_vhost:
	.zero	64
	.align 32
	.type	no_symlink_check, @object
	.size	no_symlink_check, 4
no_symlink_check:
	.zero	64
	.align 32
	.type	no_log, @object
	.size	no_log, 4
no_log:
	.zero	64
	.align 32
	.type	do_chroot, @object
	.size	do_chroot, 4
do_chroot:
	.zero	64
	.align 32
	.type	data_dir, @object
	.size	data_dir, 8
data_dir:
	.zero	64
	.align 32
	.type	dir, @object
	.size	dir, 8
dir:
	.zero	64
	.align 32
	.type	port, @object
	.size	port, 2
port:
	.zero	64
	.align 32
	.type	debug, @object
	.size	debug, 4
debug:
	.zero	64
	.align 32
	.type	argv0, @object
	.size	argv0, 8
argv0:
	.zero	64
	.section	.rodata.str1.1
.LC174:
	.string	"thttpd.c"
	.data
	.align 16
	.type	.LASANLOC1, @object
	.size	.LASANLOC1, 16
.LASANLOC1:
	.quad	.LC174
	.long	135
	.long	40
	.align 16
	.type	.LASANLOC2, @object
	.size	.LASANLOC2, 16
.LASANLOC2:
	.quad	.LC174
	.long	135
	.long	30
	.align 16
	.type	.LASANLOC3, @object
	.size	.LASANLOC3, 16
.LASANLOC3:
	.quad	.LC174
	.long	135
	.long	21
	.align 16
	.type	.LASANLOC4, @object
	.size	.LASANLOC4, 16
.LASANLOC4:
	.quad	.LC174
	.long	129
	.long	5
	.align 16
	.type	.LASANLOC5, @object
	.size	.LASANLOC5, 16
.LASANLOC5:
	.quad	.LC174
	.long	128
	.long	22
	.align 16
	.type	.LASANLOC6, @object
	.size	.LASANLOC6, 16
.LASANLOC6:
	.quad	.LC174
	.long	118
	.long	12
	.align 16
	.type	.LASANLOC7, @object
	.size	.LASANLOC7, 16
.LASANLOC7:
	.quad	.LC174
	.long	117
	.long	40
	.align 16
	.type	.LASANLOC8, @object
	.size	.LASANLOC8, 16
.LASANLOC8:
	.quad	.LC174
	.long	117
	.long	26
	.align 16
	.type	.LASANLOC9, @object
	.size	.LASANLOC9, 16
.LASANLOC9:
	.quad	.LC174
	.long	117
	.long	12
	.align 16
	.type	.LASANLOC10, @object
	.size	.LASANLOC10, 16
.LASANLOC10:
	.quad	.LC174
	.long	116
	.long	20
	.align 16
	.type	.LASANLOC11, @object
	.size	.LASANLOC11, 16
.LASANLOC11:
	.quad	.LC174
	.long	96
	.long	26
	.align 16
	.type	.LASANLOC12, @object
	.size	.LASANLOC12, 16
.LASANLOC12:
	.quad	.LC174
	.long	96
	.long	12
	.align 16
	.type	.LASANLOC13, @object
	.size	.LASANLOC13, 16
.LASANLOC13:
	.quad	.LC174
	.long	95
	.long	21
	.align 16
	.type	.LASANLOC14, @object
	.size	.LASANLOC14, 16
.LASANLOC14:
	.quad	.LC174
	.long	85
	.long	12
	.align 16
	.type	.LASANLOC15, @object
	.size	.LASANLOC15, 16
.LASANLOC15:
	.quad	.LC174
	.long	84
	.long	14
	.align 16
	.type	.LASANLOC16, @object
	.size	.LASANLOC16, 16
.LASANLOC16:
	.quad	.LC174
	.long	83
	.long	14
	.align 16
	.type	.LASANLOC17, @object
	.size	.LASANLOC17, 16
.LASANLOC17:
	.quad	.LC174
	.long	82
	.long	14
	.align 16
	.type	.LASANLOC18, @object
	.size	.LASANLOC18, 16
.LASANLOC18:
	.quad	.LC174
	.long	81
	.long	14
	.align 16
	.type	.LASANLOC19, @object
	.size	.LASANLOC19, 16
.LASANLOC19:
	.quad	.LC174
	.long	80
	.long	14
	.align 16
	.type	.LASANLOC20, @object
	.size	.LASANLOC20, 16
.LASANLOC20:
	.quad	.LC174
	.long	79
	.long	14
	.align 16
	.type	.LASANLOC21, @object
	.size	.LASANLOC21, 16
.LASANLOC21:
	.quad	.LC174
	.long	78
	.long	14
	.align 16
	.type	.LASANLOC22, @object
	.size	.LASANLOC22, 16
.LASANLOC22:
	.quad	.LC174
	.long	77
	.long	14
	.align 16
	.type	.LASANLOC23, @object
	.size	.LASANLOC23, 16
.LASANLOC23:
	.quad	.LC174
	.long	76
	.long	12
	.align 16
	.type	.LASANLOC24, @object
	.size	.LASANLOC24, 16
.LASANLOC24:
	.quad	.LC174
	.long	75
	.long	14
	.align 16
	.type	.LASANLOC25, @object
	.size	.LASANLOC25, 16
.LASANLOC25:
	.quad	.LC174
	.long	74
	.long	12
	.align 16
	.type	.LASANLOC26, @object
	.size	.LASANLOC26, 16
.LASANLOC26:
	.quad	.LC174
	.long	73
	.long	14
	.align 16
	.type	.LASANLOC27, @object
	.size	.LASANLOC27, 16
.LASANLOC27:
	.quad	.LC174
	.long	72
	.long	59
	.align 16
	.type	.LASANLOC28, @object
	.size	.LASANLOC28, 16
.LASANLOC28:
	.quad	.LC174
	.long	72
	.long	49
	.align 16
	.type	.LASANLOC29, @object
	.size	.LASANLOC29, 16
.LASANLOC29:
	.quad	.LC174
	.long	72
	.long	31
	.align 16
	.type	.LASANLOC30, @object
	.size	.LASANLOC30, 16
.LASANLOC30:
	.quad	.LC174
	.long	72
	.long	23
	.align 16
	.type	.LASANLOC31, @object
	.size	.LASANLOC31, 16
.LASANLOC31:
	.quad	.LC174
	.long	72
	.long	12
	.align 16
	.type	.LASANLOC32, @object
	.size	.LASANLOC32, 16
.LASANLOC32:
	.quad	.LC174
	.long	71
	.long	14
	.align 16
	.type	.LASANLOC33, @object
	.size	.LASANLOC33, 16
.LASANLOC33:
	.quad	.LC174
	.long	70
	.long	14
	.align 16
	.type	.LASANLOC34, @object
	.size	.LASANLOC34, 16
.LASANLOC34:
	.quad	.LC174
	.long	69
	.long	23
	.align 16
	.type	.LASANLOC35, @object
	.size	.LASANLOC35, 16
.LASANLOC35:
	.quad	.LC174
	.long	68
	.long	12
	.align 16
	.type	.LASANLOC36, @object
	.size	.LASANLOC36, 16
.LASANLOC36:
	.quad	.LC174
	.long	67
	.long	14
	.section	.rodata.str1.1
.LC175:
	.string	"watchdog_flag"
.LC176:
	.string	"got_usr1"
.LC177:
	.string	"got_hup"
.LC178:
	.string	"terminate"
.LC179:
	.string	"hs"
.LC180:
	.string	"httpd_conn_count"
.LC181:
	.string	"first_free_connect"
.LC182:
	.string	"max_connects"
.LC183:
	.string	"num_connects"
.LC184:
	.string	"connects"
.LC185:
	.string	"maxthrottles"
.LC186:
	.string	"numthrottles"
.LC187:
	.string	"hostname"
.LC188:
	.string	"throttlefile"
.LC189:
	.string	"local_pattern"
.LC190:
	.string	"no_empty_referers"
.LC191:
	.string	"url_pattern"
.LC192:
	.string	"cgi_limit"
.LC193:
	.string	"cgi_pattern"
.LC194:
	.string	"do_global_passwd"
.LC195:
	.string	"do_vhost"
.LC196:
	.string	"no_symlink_check"
.LC197:
	.string	"no_log"
.LC198:
	.string	"do_chroot"
.LC199:
	.string	"argv0"
.LC200:
	.string	"*.LC122"
.LC201:
	.string	"*.LC148"
.LC202:
	.string	"*.LC52"
.LC203:
	.string	"*.LC99"
.LC204:
	.string	"*.LC168"
.LC205:
	.string	"*.LC94"
.LC206:
	.string	"*.LC95"
.LC207:
	.string	"*.LC3"
.LC208:
	.string	"*.LC160"
.LC209:
	.string	"*.LC163"
.LC210:
	.string	"*.LC83"
.LC211:
	.string	"*.LC48"
.LC212:
	.string	"*.LC74"
.LC213:
	.string	"*.LC91"
.LC214:
	.string	"*.LC76"
.LC215:
	.string	"*.LC98"
.LC216:
	.string	"*.LC68"
.LC217:
	.string	"*.LC155"
.LC218:
	.string	"*.LC161"
.LC219:
	.string	"*.LC49"
.LC220:
	.string	"*.LC34"
.LC221:
	.string	"*.LC45"
.LC222:
	.string	"*.LC167"
.LC223:
	.string	"*.LC69"
.LC224:
	.string	"*.LC58"
.LC225:
	.string	"*.LC134"
.LC226:
	.string	"*.LC42"
.LC227:
	.string	"*.LC11"
.LC228:
	.string	"*.LC5"
.LC229:
	.string	"*.LC139"
.LC230:
	.string	"*.LC136"
.LC231:
	.string	"*.LC90"
.LC232:
	.string	"*.LC92"
.LC233:
	.string	"*.LC147"
.LC234:
	.string	"*.LC44"
.LC235:
	.string	"*.LC53"
.LC236:
	.string	"*.LC63"
.LC237:
	.string	"*.LC70"
.LC238:
	.string	"*.LC54"
.LC239:
	.string	"*.LC150"
.LC240:
	.string	"*.LC75"
.LC241:
	.string	"*.LC43"
.LC242:
	.string	"*.LC1"
.LC243:
	.string	"*.LC100"
.LC244:
	.string	"*.LC169"
.LC245:
	.string	"*.LC153"
.LC246:
	.string	"*.LC23"
.LC247:
	.string	"*.LC60"
.LC248:
	.string	"*.LC61"
.LC249:
	.string	"*.LC133"
.LC250:
	.string	"*.LC159"
.LC251:
	.string	"*.LC56"
.LC252:
	.string	"*.LC126"
.LC253:
	.string	"*.LC32"
.LC254:
	.string	"*.LC38"
.LC255:
	.string	"*.LC158"
.LC256:
	.string	"*.LC141"
.LC257:
	.string	"*.LC142"
.LC258:
	.string	"*.LC172"
.LC259:
	.string	"*.LC33"
.LC260:
	.string	"*.LC64"
.LC261:
	.string	"*.LC86"
.LC262:
	.string	"*.LC105"
.LC263:
	.string	"*.LC80"
.LC264:
	.string	"*.LC77"
.LC265:
	.string	"*.LC78"
.LC266:
	.string	"*.LC145"
.LC267:
	.string	"*.LC29"
.LC268:
	.string	"*.LC152"
.LC269:
	.string	"*.LC151"
.LC270:
	.string	"*.LC93"
.LC271:
	.string	"*.LC154"
.LC272:
	.string	"*.LC7"
.LC273:
	.string	"*.LC156"
.LC274:
	.string	"*.LC30"
.LC275:
	.string	"*.LC81"
.LC276:
	.string	"*.LC35"
.LC277:
	.string	"*.LC55"
.LC278:
	.string	"*.LC79"
.LC279:
	.string	"*.LC39"
.LC280:
	.string	"*.LC101"
.LC281:
	.string	"*.LC46"
.LC282:
	.string	"*.LC62"
.LC283:
	.string	"*.LC149"
.LC284:
	.string	"*.LC157"
.LC285:
	.string	"*.LC135"
.LC286:
	.string	"*.LC127"
.LC287:
	.string	"*.LC170"
.LC288:
	.string	"*.LC121"
.LC289:
	.string	"*.LC89"
.LC290:
	.string	"*.LC15"
.LC291:
	.string	"*.LC165"
.LC292:
	.string	"*.LC84"
.LC293:
	.string	"*.LC96"
.LC294:
	.string	"*.LC67"
.LC295:
	.string	"*.LC82"
.LC296:
	.string	"*.LC71"
.LC297:
	.string	"*.LC166"
.LC298:
	.string	"*.LC107"
.LC299:
	.string	"*.LC171"
.LC300:
	.string	"*.LC4"
.LC301:
	.string	"*.LC116"
.LC302:
	.string	"*.LC9"
.LC303:
	.string	"*.LC117"
.LC304:
	.string	"*.LC164"
.LC305:
	.string	"*.LC125"
.LC306:
	.string	"*.LC110"
.LC307:
	.string	"*.LC36"
.LC308:
	.string	"*.LC72"
.LC309:
	.string	"*.LC20"
.LC310:
	.string	"*.LC146"
.LC311:
	.string	"*.LC143"
.LC312:
	.string	"*.LC103"
.LC313:
	.string	"*.LC47"
.LC314:
	.string	"*.LC162"
.LC315:
	.string	"*.LC57"
.LC316:
	.string	"*.LC40"
.LC317:
	.string	"*.LC104"
.LC318:
	.string	"*.LC112"
.LC319:
	.string	"*.LC65"
.LC320:
	.string	"*.LC85"
.LC321:
	.string	"*.LC51"
.LC322:
	.string	"*.LC66"
.LC323:
	.string	"*.LC73"
.LC324:
	.string	"*.LC50"
.LC325:
	.string	"*.LC41"
.LC326:
	.string	"*.LC25"
.LC327:
	.string	"*.LC26"
.LC328:
	.string	"*.LC140"
.LC329:
	.string	"*.LC37"
.LC330:
	.string	"*.LC144"
.LC331:
	.string	"*.LC31"
	.data
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 9408
.LASAN0:
	.quad	watchdog_flag
	.quad	4
	.quad	64
	.quad	.LC175
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC1
	.quad	got_usr1
	.quad	4
	.quad	64
	.quad	.LC176
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC2
	.quad	got_hup
	.quad	4
	.quad	64
	.quad	.LC177
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC3
	.quad	terminate
	.quad	4
	.quad	64
	.quad	.LC178
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC4
	.quad	hs
	.quad	8
	.quad	64
	.quad	.LC179
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC5
	.quad	httpd_conn_count
	.quad	4
	.quad	64
	.quad	.LC180
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC6
	.quad	first_free_connect
	.quad	4
	.quad	64
	.quad	.LC181
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC7
	.quad	max_connects
	.quad	4
	.quad	64
	.quad	.LC182
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC8
	.quad	num_connects
	.quad	4
	.quad	64
	.quad	.LC183
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC9
	.quad	connects
	.quad	8
	.quad	64
	.quad	.LC184
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC10
	.quad	maxthrottles
	.quad	4
	.quad	64
	.quad	.LC185
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC11
	.quad	numthrottles
	.quad	4
	.quad	64
	.quad	.LC186
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC12
	.quad	throttles
	.quad	8
	.quad	64
	.quad	.LC47
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC13
	.quad	max_age
	.quad	4
	.quad	64
	.quad	.LC57
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC14
	.quad	p3p
	.quad	8
	.quad	64
	.quad	.LC56
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC15
	.quad	charset
	.quad	8
	.quad	64
	.quad	.LC55
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC16
	.quad	user
	.quad	8
	.quad	64
	.quad	.LC41
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC17
	.quad	pidfile
	.quad	8
	.quad	64
	.quad	.LC54
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC18
	.quad	hostname
	.quad	8
	.quad	64
	.quad	.LC187
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC19
	.quad	throttlefile
	.quad	8
	.quad	64
	.quad	.LC188
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC20
	.quad	logfile
	.quad	8
	.quad	64
	.quad	.LC49
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC21
	.quad	local_pattern
	.quad	8
	.quad	64
	.quad	.LC189
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC22
	.quad	no_empty_referers
	.quad	4
	.quad	64
	.quad	.LC190
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC23
	.quad	url_pattern
	.quad	8
	.quad	64
	.quad	.LC191
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC24
	.quad	cgi_limit
	.quad	4
	.quad	64
	.quad	.LC192
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC25
	.quad	cgi_pattern
	.quad	8
	.quad	64
	.quad	.LC193
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC26
	.quad	do_global_passwd
	.quad	4
	.quad	64
	.quad	.LC194
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC27
	.quad	do_vhost
	.quad	4
	.quad	64
	.quad	.LC195
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC28
	.quad	no_symlink_check
	.quad	4
	.quad	64
	.quad	.LC196
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC29
	.quad	no_log
	.quad	4
	.quad	64
	.quad	.LC197
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC30
	.quad	do_chroot
	.quad	4
	.quad	64
	.quad	.LC198
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC31
	.quad	data_dir
	.quad	8
	.quad	64
	.quad	.LC36
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC32
	.quad	dir
	.quad	8
	.quad	64
	.quad	.LC33
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC33
	.quad	port
	.quad	2
	.quad	64
	.quad	.LC32
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC34
	.quad	debug
	.quad	4
	.quad	64
	.quad	.LC31
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC35
	.quad	argv0
	.quad	8
	.quad	64
	.quad	.LC199
	.quad	.LC174
	.quad	0
	.quad	.LASANLOC36
	.quad	.LC122
	.quad	35
	.quad	96
	.quad	.LC200
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC148
	.quad	11
	.quad	64
	.quad	.LC201
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC52
	.quad	13
	.quad	64
	.quad	.LC202
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC99
	.quad	19
	.quad	64
	.quad	.LC203
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC168
	.quad	16
	.quad	64
	.quad	.LC204
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC94
	.quad	3
	.quad	64
	.quad	.LC205
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC95
	.quad	39
	.quad	96
	.quad	.LC206
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC3
	.quad	70
	.quad	128
	.quad	.LC207
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC160
	.quad	20
	.quad	64
	.quad	.LC208
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC163
	.quad	24
	.quad	64
	.quad	.LC209
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC83
	.quad	3
	.quad	64
	.quad	.LC210
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC48
	.quad	5
	.quad	64
	.quad	.LC211
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC74
	.quad	3
	.quad	64
	.quad	.LC212
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC91
	.quad	16
	.quad	64
	.quad	.LC213
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC76
	.quad	3
	.quad	64
	.quad	.LC214
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC98
	.quad	2
	.quad	64
	.quad	.LC215
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC68
	.quad	3
	.quad	64
	.quad	.LC216
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC155
	.quad	12
	.quad	64
	.quad	.LC217
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC161
	.quad	15
	.quad	64
	.quad	.LC218
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC49
	.quad	8
	.quad	64
	.quad	.LC219
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC34
	.quad	7
	.quad	64
	.quad	.LC220
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC45
	.quad	16
	.quad	64
	.quad	.LC221
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC167
	.quad	12
	.quad	64
	.quad	.LC222
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC69
	.quad	5
	.quad	64
	.quad	.LC223
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC58
	.quad	32
	.quad	64
	.quad	.LC224
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC134
	.quad	26
	.quad	64
	.quad	.LC225
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC42
	.quad	7
	.quad	64
	.quad	.LC226
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC11
	.quad	219
	.quad	256
	.quad	.LC227
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC5
	.quad	65
	.quad	128
	.quad	.LC228
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC139
	.quad	29
	.quad	64
	.quad	.LC229
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC136
	.quad	39
	.quad	96
	.quad	.LC230
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC90
	.quad	20
	.quad	64
	.quad	.LC231
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC92
	.quad	33
	.quad	96
	.quad	.LC232
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC147
	.quad	15
	.quad	64
	.quad	.LC233
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC44
	.quad	7
	.quad	64
	.quad	.LC234
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC53
	.quad	15
	.quad	64
	.quad	.LC235
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC63
	.quad	3
	.quad	64
	.quad	.LC236
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC70
	.quad	4
	.quad	64
	.quad	.LC237
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC54
	.quad	8
	.quad	64
	.quad	.LC238
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC150
	.quad	2
	.quad	64
	.quad	.LC239
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC75
	.quad	3
	.quad	64
	.quad	.LC240
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC43
	.quad	9
	.quad	64
	.quad	.LC241
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC1
	.quad	104
	.quad	160
	.quad	.LC242
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC100
	.quad	2
	.quad	64
	.quad	.LC243
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC169
	.quad	12
	.quad	64
	.quad	.LC244
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC153
	.quad	4
	.quad	64
	.quad	.LC245
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC23
	.quad	16
	.quad	64
	.quad	.LC246
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC60
	.quad	7
	.quad	64
	.quad	.LC247
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC61
	.quad	11
	.quad	64
	.quad	.LC248
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC133
	.quad	3
	.quad	64
	.quad	.LC249
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC159
	.quad	13
	.quad	64
	.quad	.LC250
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC56
	.quad	4
	.quad	64
	.quad	.LC251
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC126
	.quad	37
	.quad	96
	.quad	.LC252
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC32
	.quad	5
	.quad	64
	.quad	.LC253
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC38
	.quad	10
	.quad	64
	.quad	.LC254
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC158
	.quad	18
	.quad	64
	.quad	.LC255
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC141
	.quad	23
	.quad	64
	.quad	.LC256
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC142
	.quad	25
	.quad	64
	.quad	.LC257
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC172
	.quad	13
	.quad	64
	.quad	.LC258
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC33
	.quad	4
	.quad	64
	.quad	.LC259
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC64
	.quad	26
	.quad	64
	.quad	.LC260
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC86
	.quad	3
	.quad	64
	.quad	.LC261
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC105
	.quad	39
	.quad	96
	.quad	.LC262
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC80
	.quad	3
	.quad	64
	.quad	.LC263
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC77
	.quad	3
	.quad	64
	.quad	.LC264
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC78
	.quad	3
	.quad	64
	.quad	.LC265
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC145
	.quad	72
	.quad	128
	.quad	.LC266
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC29
	.quad	2
	.quad	64
	.quad	.LC267
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC152
	.quad	2
	.quad	64
	.quad	.LC268
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC151
	.quad	12
	.quad	64
	.quad	.LC269
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC93
	.quad	38
	.quad	96
	.quad	.LC270
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC154
	.quad	31
	.quad	64
	.quad	.LC271
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC7
	.quad	37
	.quad	96
	.quad	.LC272
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC156
	.quad	74
	.quad	128
	.quad	.LC273
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC30
	.quad	5
	.quad	64
	.quad	.LC274
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC81
	.quad	5
	.quad	64
	.quad	.LC275
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC35
	.quad	9
	.quad	64
	.quad	.LC276
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC55
	.quad	8
	.quad	64
	.quad	.LC277
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC79
	.quad	5
	.quad	64
	.quad	.LC278
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC39
	.quad	9
	.quad	64
	.quad	.LC279
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC101
	.quad	22
	.quad	64
	.quad	.LC280
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC46
	.quad	9
	.quad	64
	.quad	.LC281
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC62
	.quad	1
	.quad	64
	.quad	.LC282
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC149
	.quad	6
	.quad	64
	.quad	.LC283
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC157
	.quad	79
	.quad	128
	.quad	.LC284
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC135
	.quad	25
	.quad	64
	.quad	.LC285
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC127
	.quad	25
	.quad	64
	.quad	.LC286
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC170
	.quad	58
	.quad	96
	.quad	.LC287
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC121
	.quad	35
	.quad	96
	.quad	.LC288
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC89
	.quad	11
	.quad	64
	.quad	.LC289
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC15
	.quad	39
	.quad	96
	.quad	.LC290
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC165
	.quad	30
	.quad	64
	.quad	.LC291
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC84
	.quad	3
	.quad	64
	.quad	.LC292
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC96
	.quad	44
	.quad	96
	.quad	.LC293
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC67
	.quad	3
	.quad	64
	.quad	.LC294
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC82
	.quad	3
	.quad	64
	.quad	.LC295
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC71
	.quad	3
	.quad	64
	.quad	.LC296
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC166
	.quad	15
	.quad	64
	.quad	.LC297
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC107
	.quad	56
	.quad	96
	.quad	.LC298
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC171
	.quad	38
	.quad	96
	.quad	.LC299
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC4
	.quad	62
	.quad	96
	.quad	.LC300
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC116
	.quad	33
	.quad	96
	.quad	.LC301
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC9
	.quad	34
	.quad	96
	.quad	.LC302
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC117
	.quad	43
	.quad	96
	.quad	.LC303
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC164
	.quad	36
	.quad	96
	.quad	.LC304
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC125
	.quad	33
	.quad	96
	.quad	.LC305
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC110
	.quad	8
	.quad	64
	.quad	.LC306
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC36
	.quad	9
	.quad	64
	.quad	.LC307
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC72
	.quad	5
	.quad	64
	.quad	.LC308
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC20
	.quad	5
	.quad	64
	.quad	.LC309
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC146
	.quad	20
	.quad	64
	.quad	.LC310
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC143
	.quad	10
	.quad	64
	.quad	.LC311
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC103
	.quad	22
	.quad	64
	.quad	.LC312
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC47
	.quad	10
	.quad	64
	.quad	.LC313
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC162
	.quad	30
	.quad	64
	.quad	.LC314
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC57
	.quad	8
	.quad	64
	.quad	.LC315
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC40
	.quad	11
	.quad	64
	.quad	.LC316
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC104
	.quad	36
	.quad	96
	.quad	.LC317
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC112
	.quad	25
	.quad	64
	.quad	.LC318
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC65
	.quad	3
	.quad	64
	.quad	.LC319
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC85
	.quad	3
	.quad	64
	.quad	.LC320
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC51
	.quad	8
	.quad	64
	.quad	.LC321
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC66
	.quad	3
	.quad	64
	.quad	.LC322
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC73
	.quad	3
	.quad	64
	.quad	.LC323
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC50
	.quad	6
	.quad	64
	.quad	.LC324
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC41
	.quad	5
	.quad	64
	.quad	.LC325
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC25
	.quad	31
	.quad	64
	.quad	.LC326
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC26
	.quad	36
	.quad	96
	.quad	.LC327
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC140
	.quad	34
	.quad	96
	.quad	.LC328
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC37
	.quad	8
	.quad	64
	.quad	.LC329
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC144
	.quad	67
	.quad	128
	.quad	.LC330
	.quad	.LC174
	.quad	0
	.quad	0
	.quad	.LC31
	.quad	6
	.quad	64
	.quad	.LC331
	.quad	.LC174
	.quad	0
	.quad	0
	.section	.text.unlikely
.LCOLDB332:
	.section	.text.exit,"ax",@progbits
.LHOTB332:
	.p2align 4,,15
	.type	_GLOBAL__sub_D_00099_0_terminate, @function
_GLOBAL__sub_D_00099_0_terminate:
.LFB38:
	.loc 1 2189 0
	.cfi_startproc
	.loc 1 2189 0
	movl	$168, %esi
	movl	$.LASAN0, %edi
	jmp	__asan_unregister_globals
.LVL1102:
	.cfi_endproc
.LFE38:
	.size	_GLOBAL__sub_D_00099_0_terminate, .-_GLOBAL__sub_D_00099_0_terminate
	.section	.text.unlikely
.LCOLDE332:
	.section	.text.exit
.LHOTE332:
	.section	.fini_array.00099,"aw"
	.align 8
	.quad	_GLOBAL__sub_D_00099_0_terminate
	.section	.text.unlikely
.LCOLDB333:
	.section	.text.startup
.LHOTB333:
	.p2align 4,,15
	.type	_GLOBAL__sub_I_00099_1_terminate, @function
_GLOBAL__sub_I_00099_1_terminate:
.LFB39:
	.loc 1 2189 0
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 2189 0
	call	__asan_init_v4
.LVL1103:
	movl	$168, %esi
	movl	$.LASAN0, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__asan_register_globals
.LVL1104:
	.cfi_endproc
.LFE39:
	.size	_GLOBAL__sub_I_00099_1_terminate, .-_GLOBAL__sub_I_00099_1_terminate
	.section	.text.unlikely
.LCOLDE333:
	.section	.text.startup
.LHOTE333:
	.section	.init_array.00099,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_00099_1_terminate
	.text
.Letext0:
	.section	.text.unlikely
.Letext_cold0:
	.file 2 "/usr/include/bits/types.h"
	.file 3 "/usr/include/sys/types.h"
	.file 4 "/usr/include/time.h"
	.file 5 "/usr/local/cs/gcc-5.2.0/lib/gcc/x86_64-unknown-linux-gnu/5.2.0/include/stddef.h"
	.file 6 "/usr/include/bits/time.h"
	.file 7 "/usr/include/signal.h"
	.file 8 "/usr/include/bits/stat.h"
	.file 9 "/usr/include/bits/uio.h"
	.file 10 "/usr/include/pwd.h"
	.file 11 "/usr/include/stdio.h"
	.file 12 "/usr/include/libio.h"
	.file 13 "/usr/include/unistd.h"
	.file 14 "/usr/include/sys/time.h"
	.file 15 "/usr/include/bits/sockaddr.h"
	.file 16 "/usr/include/bits/socket.h"
	.file 17 "/usr/include/stdint.h"
	.file 18 "/usr/include/netinet/in.h"
	.file 19 "/usr/include/netdb.h"
	.file 20 "./libhttpd.h"
	.file 21 "./timers.h"
	.file 22 "<built-in>"
	.file 23 "/usr/include/sys/syslog.h"
	.file 24 "/usr/include/stdlib.h"
	.file 25 "./fdwatch.h"
	.file 26 "./mmc.h"
	.file 27 "/usr/include/bits/errno.h"
	.file 28 "/usr/include/sys/wait.h"
	.file 29 "/usr/include/string.h"
	.file 30 "/usr/include/sys/stat.h"
	.file 31 "/usr/include/fcntl.h"
	.file 32 "./match.h"
	.file 33 "/usr/include/sys/socket.h"
	.file 34 "/usr/include/sys/uio.h"
	.file 35 "/usr/include/grp.h"
	.file 36 "/usr/include/bits/socket_type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x6647
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF502
	.byte	0xc
	.long	.LASF503
	.long	.LASF504
	.long	.Ldebug_ranges0+0x160
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF7
	.byte	0x2
	.byte	0x85
	.long	0x3e
	.uleb128 0x4
	.long	.LASF8
	.byte	0x2
	.byte	0x86
	.long	0x37
	.uleb128 0x4
	.long	.LASF9
	.byte	0x2
	.byte	0x87
	.long	0x37
	.uleb128 0x4
	.long	.LASF10
	.byte	0x2
	.byte	0x88
	.long	0x3e
	.uleb128 0x4
	.long	.LASF11
	.byte	0x2
	.byte	0x8a
	.long	0x37
	.uleb128 0x4
	.long	.LASF12
	.byte	0x2
	.byte	0x8b
	.long	0x3e
	.uleb128 0x4
	.long	.LASF13
	.byte	0x2
	.byte	0x8c
	.long	0x5a
	.uleb128 0x4
	.long	.LASF14
	.byte	0x2
	.byte	0x8d
	.long	0x5a
	.uleb128 0x4
	.long	.LASF15
	.byte	0x2
	.byte	0x8e
	.long	0x53
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF16
	.uleb128 0x4
	.long	.LASF17
	.byte	0x2
	.byte	0x94
	.long	0x5a
	.uleb128 0x4
	.long	.LASF18
	.byte	0x2
	.byte	0x96
	.long	0x5a
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x4
	.long	.LASF19
	.byte	0x2
	.byte	0xa2
	.long	0x5a
	.uleb128 0x4
	.long	.LASF20
	.byte	0x2
	.byte	0xa7
	.long	0x5a
	.uleb128 0x4
	.long	.LASF21
	.byte	0x2
	.byte	0xb8
	.long	0x5a
	.uleb128 0x6
	.byte	0x8
	.long	0x10a
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF22
	.uleb128 0x4
	.long	.LASF23
	.byte	0x2
	.byte	0xc6
	.long	0x37
	.uleb128 0x4
	.long	.LASF24
	.byte	0x3
	.byte	0x41
	.long	0x77
	.uleb128 0x4
	.long	.LASF25
	.byte	0x3
	.byte	0x50
	.long	0x6c
	.uleb128 0x4
	.long	.LASF26
	.byte	0x3
	.byte	0x56
	.long	0xa3
	.uleb128 0x4
	.long	.LASF27
	.byte	0x3
	.byte	0x62
	.long	0xb9
	.uleb128 0x4
	.long	.LASF28
	.byte	0x4
	.byte	0x4b
	.long	0xcb
	.uleb128 0x4
	.long	.LASF29
	.byte	0x5
	.byte	0xd8
	.long	0x3e
	.uleb128 0x4
	.long	.LASF30
	.byte	0x3
	.byte	0xc5
	.long	0x5a
	.uleb128 0x7
	.long	.LASF33
	.byte	0x10
	.byte	0x4
	.byte	0x78
	.long	0x18e
	.uleb128 0x8
	.long	.LASF31
	.byte	0x4
	.byte	0x7a
	.long	0xcb
	.byte	0
	.uleb128 0x8
	.long	.LASF32
	.byte	0x4
	.byte	0x7b
	.long	0xf9
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.long	.LASF34
	.byte	0x10
	.byte	0x6
	.byte	0x1e
	.long	0x1b3
	.uleb128 0x8
	.long	.LASF31
	.byte	0x6
	.byte	0x20
	.long	0xcb
	.byte	0
	.uleb128 0x8
	.long	.LASF35
	.byte	0x6
	.byte	0x21
	.long	0xd6
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF36
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF37
	.uleb128 0x9
	.long	0x53
	.uleb128 0x4
	.long	.LASF38
	.byte	0x7
	.byte	0x55
	.long	0x1d1
	.uleb128 0x6
	.byte	0x8
	.long	0x1d7
	.uleb128 0xa
	.long	0x1e2
	.uleb128 0xb
	.long	0x53
	.byte	0
	.uleb128 0x7
	.long	.LASF39
	.byte	0x90
	.byte	0x8
	.byte	0x2e
	.long	0x2a3
	.uleb128 0x8
	.long	.LASF40
	.byte	0x8
	.byte	0x30
	.long	0x61
	.byte	0
	.uleb128 0x8
	.long	.LASF41
	.byte	0x8
	.byte	0x35
	.long	0x82
	.byte	0x8
	.uleb128 0x8
	.long	.LASF42
	.byte	0x8
	.byte	0x3d
	.long	0x98
	.byte	0x10
	.uleb128 0x8
	.long	.LASF43
	.byte	0x8
	.byte	0x3e
	.long	0x8d
	.byte	0x18
	.uleb128 0x8
	.long	.LASF44
	.byte	0x8
	.byte	0x40
	.long	0x6c
	.byte	0x1c
	.uleb128 0x8
	.long	.LASF45
	.byte	0x8
	.byte	0x41
	.long	0x77
	.byte	0x20
	.uleb128 0x8
	.long	.LASF46
	.byte	0x8
	.byte	0x43
	.long	0x53
	.byte	0x24
	.uleb128 0x8
	.long	.LASF47
	.byte	0x8
	.byte	0x45
	.long	0x61
	.byte	0x28
	.uleb128 0x8
	.long	.LASF48
	.byte	0x8
	.byte	0x4a
	.long	0xa3
	.byte	0x30
	.uleb128 0x8
	.long	.LASF49
	.byte	0x8
	.byte	0x4e
	.long	0xe3
	.byte	0x38
	.uleb128 0x8
	.long	.LASF50
	.byte	0x8
	.byte	0x50
	.long	0xee
	.byte	0x40
	.uleb128 0x8
	.long	.LASF51
	.byte	0x8
	.byte	0x5b
	.long	0x169
	.byte	0x48
	.uleb128 0x8
	.long	.LASF52
	.byte	0x8
	.byte	0x5c
	.long	0x169
	.byte	0x58
	.uleb128 0x8
	.long	.LASF53
	.byte	0x8
	.byte	0x5d
	.long	0x169
	.byte	0x68
	.uleb128 0x8
	.long	.LASF54
	.byte	0x8
	.byte	0x6a
	.long	0x2a3
	.byte	0x78
	.byte	0
	.uleb128 0xc
	.long	0xf9
	.long	0x2b3
	.uleb128 0xd
	.long	0xc4
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x53
	.uleb128 0x7
	.long	.LASF55
	.byte	0x10
	.byte	0x9
	.byte	0x2b
	.long	0x2de
	.uleb128 0x8
	.long	.LASF56
	.byte	0x9
	.byte	0x2d
	.long	0xe1
	.byte	0
	.uleb128 0x8
	.long	.LASF57
	.byte	0x9
	.byte	0x2e
	.long	0x153
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.long	.LASF58
	.byte	0x30
	.byte	0xa
	.byte	0x32
	.long	0x33f
	.uleb128 0x8
	.long	.LASF59
	.byte	0xa
	.byte	0x34
	.long	0x104
	.byte	0
	.uleb128 0x8
	.long	.LASF60
	.byte	0xa
	.byte	0x35
	.long	0x104
	.byte	0x8
	.uleb128 0x8
	.long	.LASF61
	.byte	0xa
	.byte	0x36
	.long	0x6c
	.byte	0x10
	.uleb128 0x8
	.long	.LASF62
	.byte	0xa
	.byte	0x37
	.long	0x77
	.byte	0x14
	.uleb128 0x8
	.long	.LASF63
	.byte	0xa
	.byte	0x38
	.long	0x104
	.byte	0x18
	.uleb128 0x8
	.long	.LASF64
	.byte	0xa
	.byte	0x39
	.long	0x104
	.byte	0x20
	.uleb128 0x8
	.long	.LASF65
	.byte	0xa
	.byte	0x3a
	.long	0x104
	.byte	0x28
	.byte	0
	.uleb128 0x4
	.long	.LASF66
	.byte	0xb
	.byte	0x30
	.long	0x34a
	.uleb128 0x7
	.long	.LASF67
	.byte	0xd8
	.byte	0xc
	.byte	0xf6
	.long	0x4cb
	.uleb128 0x8
	.long	.LASF68
	.byte	0xc
	.byte	0xf7
	.long	0x53
	.byte	0
	.uleb128 0x8
	.long	.LASF69
	.byte	0xc
	.byte	0xfc
	.long	0x104
	.byte	0x8
	.uleb128 0x8
	.long	.LASF70
	.byte	0xc
	.byte	0xfd
	.long	0x104
	.byte	0x10
	.uleb128 0x8
	.long	.LASF71
	.byte	0xc
	.byte	0xfe
	.long	0x104
	.byte	0x18
	.uleb128 0x8
	.long	.LASF72
	.byte	0xc
	.byte	0xff
	.long	0x104
	.byte	0x20
	.uleb128 0xe
	.long	.LASF73
	.byte	0xc
	.value	0x100
	.long	0x104
	.byte	0x28
	.uleb128 0xe
	.long	.LASF74
	.byte	0xc
	.value	0x101
	.long	0x104
	.byte	0x30
	.uleb128 0xe
	.long	.LASF75
	.byte	0xc
	.value	0x102
	.long	0x104
	.byte	0x38
	.uleb128 0xe
	.long	.LASF76
	.byte	0xc
	.value	0x103
	.long	0x104
	.byte	0x40
	.uleb128 0xe
	.long	.LASF77
	.byte	0xc
	.value	0x105
	.long	0x104
	.byte	0x48
	.uleb128 0xe
	.long	.LASF78
	.byte	0xc
	.value	0x106
	.long	0x104
	.byte	0x50
	.uleb128 0xe
	.long	.LASF79
	.byte	0xc
	.value	0x107
	.long	0x104
	.byte	0x58
	.uleb128 0xe
	.long	.LASF80
	.byte	0xc
	.value	0x109
	.long	0x509
	.byte	0x60
	.uleb128 0xe
	.long	.LASF81
	.byte	0xc
	.value	0x10b
	.long	0x50f
	.byte	0x68
	.uleb128 0xe
	.long	.LASF82
	.byte	0xc
	.value	0x10d
	.long	0x53
	.byte	0x70
	.uleb128 0xe
	.long	.LASF83
	.byte	0xc
	.value	0x111
	.long	0x53
	.byte	0x74
	.uleb128 0xe
	.long	.LASF84
	.byte	0xc
	.value	0x113
	.long	0xa3
	.byte	0x78
	.uleb128 0xe
	.long	.LASF85
	.byte	0xc
	.value	0x117
	.long	0x30
	.byte	0x80
	.uleb128 0xe
	.long	.LASF86
	.byte	0xc
	.value	0x118
	.long	0x45
	.byte	0x82
	.uleb128 0xe
	.long	.LASF87
	.byte	0xc
	.value	0x119
	.long	0x515
	.byte	0x83
	.uleb128 0xe
	.long	.LASF88
	.byte	0xc
	.value	0x11d
	.long	0x525
	.byte	0x88
	.uleb128 0xe
	.long	.LASF89
	.byte	0xc
	.value	0x126
	.long	0xae
	.byte	0x90
	.uleb128 0xe
	.long	.LASF90
	.byte	0xc
	.value	0x12f
	.long	0xe1
	.byte	0x98
	.uleb128 0xe
	.long	.LASF91
	.byte	0xc
	.value	0x130
	.long	0xe1
	.byte	0xa0
	.uleb128 0xe
	.long	.LASF92
	.byte	0xc
	.value	0x131
	.long	0xe1
	.byte	0xa8
	.uleb128 0xe
	.long	.LASF93
	.byte	0xc
	.value	0x132
	.long	0xe1
	.byte	0xb0
	.uleb128 0xe
	.long	.LASF94
	.byte	0xc
	.value	0x133
	.long	0x153
	.byte	0xb8
	.uleb128 0xe
	.long	.LASF95
	.byte	0xc
	.value	0x135
	.long	0x53
	.byte	0xc0
	.uleb128 0xe
	.long	.LASF96
	.byte	0xc
	.value	0x137
	.long	0x52b
	.byte	0xc4
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x104
	.uleb128 0xf
	.long	.LASF505
	.byte	0xc
	.byte	0x9b
	.uleb128 0x7
	.long	.LASF97
	.byte	0x18
	.byte	0xc
	.byte	0xa1
	.long	0x509
	.uleb128 0x8
	.long	.LASF98
	.byte	0xc
	.byte	0xa2
	.long	0x509
	.byte	0
	.uleb128 0x8
	.long	.LASF99
	.byte	0xc
	.byte	0xa3
	.long	0x50f
	.byte	0x8
	.uleb128 0x8
	.long	.LASF100
	.byte	0xc
	.byte	0xa7
	.long	0x53
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x4d8
	.uleb128 0x6
	.byte	0x8
	.long	0x34a
	.uleb128 0xc
	.long	0x10a
	.long	0x525
	.uleb128 0xd
	.long	0xc4
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x4d1
	.uleb128 0xc
	.long	0x10a
	.long	0x53b
	.uleb128 0xd
	.long	0xc4
	.byte	0x13
	.byte	0
	.uleb128 0x10
	.long	0x53
	.uleb128 0x11
	.long	.LASF101
	.byte	0xd
	.value	0x112
	.long	0x111
	.uleb128 0x7
	.long	.LASF102
	.byte	0x8
	.byte	0xe
	.byte	0x38
	.long	0x571
	.uleb128 0x8
	.long	.LASF103
	.byte	0xe
	.byte	0x3a
	.long	0x53
	.byte	0
	.uleb128 0x8
	.long	.LASF104
	.byte	0xe
	.byte	0x3b
	.long	0x53
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x54c
	.uleb128 0x12
	.long	0x571
	.uleb128 0x13
	.long	.LASF506
	.byte	0x4
	.long	0x37
	.byte	0x24
	.byte	0x18
	.long	0x5c7
	.uleb128 0x14
	.long	.LASF105
	.byte	0x1
	.uleb128 0x14
	.long	.LASF106
	.byte	0x2
	.uleb128 0x14
	.long	.LASF107
	.byte	0x3
	.uleb128 0x14
	.long	.LASF108
	.byte	0x4
	.uleb128 0x14
	.long	.LASF109
	.byte	0x5
	.uleb128 0x14
	.long	.LASF110
	.byte	0x6
	.uleb128 0x14
	.long	.LASF111
	.byte	0xa
	.uleb128 0x15
	.long	.LASF112
	.long	0x80000
	.uleb128 0x16
	.long	.LASF113
	.value	0x800
	.byte	0
	.uleb128 0x4
	.long	.LASF114
	.byte	0xf
	.byte	0x1c
	.long	0x30
	.uleb128 0x7
	.long	.LASF115
	.byte	0x10
	.byte	0x10
	.byte	0x94
	.long	0x5f7
	.uleb128 0x8
	.long	.LASF116
	.byte	0x10
	.byte	0x96
	.long	0x5c7
	.byte	0
	.uleb128 0x8
	.long	.LASF117
	.byte	0x10
	.byte	0x97
	.long	0x5f7
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.long	0x10a
	.long	0x607
	.uleb128 0xd
	.long	0xc4
	.byte	0xd
	.byte	0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x80
	.byte	0x10
	.byte	0xa1
	.long	0x638
	.uleb128 0x8
	.long	.LASF119
	.byte	0x10
	.byte	0xa3
	.long	0x5c7
	.byte	0
	.uleb128 0x8
	.long	.LASF120
	.byte	0x10
	.byte	0xa4
	.long	0x3e
	.byte	0x8
	.uleb128 0x8
	.long	.LASF121
	.byte	0x10
	.byte	0xa5
	.long	0x638
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.long	0x10a
	.long	0x648
	.uleb128 0xd
	.long	0xc4
	.byte	0x6f
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.long	0x37
	.byte	0x21
	.byte	0x36
	.long	0x667
	.uleb128 0x14
	.long	.LASF122
	.byte	0
	.uleb128 0x14
	.long	.LASF123
	.byte	0x1
	.uleb128 0x14
	.long	.LASF124
	.byte	0x2
	.byte	0
	.uleb128 0x4
	.long	.LASF125
	.byte	0x11
	.byte	0x30
	.long	0x29
	.uleb128 0x4
	.long	.LASF126
	.byte	0x11
	.byte	0x31
	.long	0x30
	.uleb128 0x4
	.long	.LASF127
	.byte	0x11
	.byte	0x33
	.long	0x37
	.uleb128 0x4
	.long	.LASF128
	.byte	0x12
	.byte	0x60
	.long	0x672
	.uleb128 0x4
	.long	.LASF129
	.byte	0x12
	.byte	0x8c
	.long	0x67d
	.uleb128 0x7
	.long	.LASF130
	.byte	0x4
	.byte	0x12
	.byte	0x8d
	.long	0x6b7
	.uleb128 0x8
	.long	.LASF131
	.byte	0x12
	.byte	0x8f
	.long	0x693
	.byte	0
	.byte	0
	.uleb128 0x18
	.byte	0x10
	.byte	0x12
	.byte	0xc7
	.long	0x6e1
	.uleb128 0x19
	.long	.LASF132
	.byte	0x12
	.byte	0xc9
	.long	0x6e1
	.uleb128 0x19
	.long	.LASF133
	.byte	0x12
	.byte	0xcb
	.long	0x6f1
	.uleb128 0x19
	.long	.LASF134
	.byte	0x12
	.byte	0xcc
	.long	0x701
	.byte	0
	.uleb128 0xc
	.long	0x667
	.long	0x6f1
	.uleb128 0xd
	.long	0xc4
	.byte	0xf
	.byte	0
	.uleb128 0xc
	.long	0x672
	.long	0x701
	.uleb128 0xd
	.long	0xc4
	.byte	0x7
	.byte	0
	.uleb128 0xc
	.long	0x67d
	.long	0x711
	.uleb128 0xd
	.long	0xc4
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	.LASF135
	.byte	0x10
	.byte	0x12
	.byte	0xc5
	.long	0x72a
	.uleb128 0x8
	.long	.LASF136
	.byte	0x12
	.byte	0xce
	.long	0x6b7
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF137
	.byte	0x10
	.byte	0x12
	.byte	0xe0
	.long	0x767
	.uleb128 0x8
	.long	.LASF138
	.byte	0x12
	.byte	0xe2
	.long	0x5c7
	.byte	0
	.uleb128 0x8
	.long	.LASF139
	.byte	0x12
	.byte	0xe3
	.long	0x688
	.byte	0x2
	.uleb128 0x8
	.long	.LASF140
	.byte	0x12
	.byte	0xe4
	.long	0x69e
	.byte	0x4
	.uleb128 0x8
	.long	.LASF141
	.byte	0x12
	.byte	0xe7
	.long	0x767
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.long	0x29
	.long	0x777
	.uleb128 0xd
	.long	0xc4
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	.LASF142
	.byte	0x1c
	.byte	0x12
	.byte	0xee
	.long	0x7c0
	.uleb128 0x8
	.long	.LASF143
	.byte	0x12
	.byte	0xf0
	.long	0x5c7
	.byte	0
	.uleb128 0x8
	.long	.LASF144
	.byte	0x12
	.byte	0xf1
	.long	0x688
	.byte	0x2
	.uleb128 0x8
	.long	.LASF145
	.byte	0x12
	.byte	0xf2
	.long	0x67d
	.byte	0x4
	.uleb128 0x8
	.long	.LASF146
	.byte	0x12
	.byte	0xf3
	.long	0x711
	.byte	0x8
	.uleb128 0x8
	.long	.LASF147
	.byte	0x12
	.byte	0xf4
	.long	0x67d
	.byte	0x18
	.byte	0
	.uleb128 0x1a
	.long	.LASF148
	.byte	0x30
	.byte	0x13
	.value	0x237
	.long	0x836
	.uleb128 0xe
	.long	.LASF149
	.byte	0x13
	.value	0x239
	.long	0x53
	.byte	0
	.uleb128 0xe
	.long	.LASF150
	.byte	0x13
	.value	0x23a
	.long	0x53
	.byte	0x4
	.uleb128 0xe
	.long	.LASF151
	.byte	0x13
	.value	0x23b
	.long	0x53
	.byte	0x8
	.uleb128 0xe
	.long	.LASF152
	.byte	0x13
	.value	0x23c
	.long	0x53
	.byte	0xc
	.uleb128 0xe
	.long	.LASF153
	.byte	0x13
	.value	0x23d
	.long	0x540
	.byte	0x10
	.uleb128 0xe
	.long	.LASF154
	.byte	0x13
	.value	0x23e
	.long	0x836
	.byte	0x18
	.uleb128 0xe
	.long	.LASF155
	.byte	0x13
	.value	0x23f
	.long	0x104
	.byte	0x20
	.uleb128 0xe
	.long	.LASF156
	.byte	0x13
	.value	0x240
	.long	0x83c
	.byte	0x28
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x5d2
	.uleb128 0x6
	.byte	0x8
	.long	0x7c0
	.uleb128 0x18
	.byte	0x80
	.byte	0x14
	.byte	0x3b
	.long	0x876
	.uleb128 0x1b
	.string	"sa"
	.byte	0x14
	.byte	0x3c
	.long	0x5d2
	.uleb128 0x19
	.long	.LASF157
	.byte	0x14
	.byte	0x3d
	.long	0x72a
	.uleb128 0x19
	.long	.LASF158
	.byte	0x14
	.byte	0x3f
	.long	0x777
	.uleb128 0x19
	.long	.LASF159
	.byte	0x14
	.byte	0x40
	.long	0x607
	.byte	0
	.uleb128 0x4
	.long	.LASF160
	.byte	0x14
	.byte	0x42
	.long	0x842
	.uleb128 0x1c
	.byte	0x88
	.byte	0x14
	.byte	0x45
	.long	0x97a
	.uleb128 0x8
	.long	.LASF161
	.byte	0x14
	.byte	0x46
	.long	0x104
	.byte	0
	.uleb128 0x8
	.long	.LASF162
	.byte	0x14
	.byte	0x47
	.long	0x104
	.byte	0x8
	.uleb128 0x8
	.long	.LASF163
	.byte	0x14
	.byte	0x48
	.long	0x30
	.byte	0x10
	.uleb128 0x8
	.long	.LASF164
	.byte	0x14
	.byte	0x49
	.long	0x104
	.byte	0x18
	.uleb128 0x8
	.long	.LASF165
	.byte	0x14
	.byte	0x4a
	.long	0x53
	.byte	0x20
	.uleb128 0x8
	.long	.LASF166
	.byte	0x14
	.byte	0x4a
	.long	0x53
	.byte	0x24
	.uleb128 0x8
	.long	.LASF167
	.byte	0x14
	.byte	0x4b
	.long	0x104
	.byte	0x28
	.uleb128 0x1d
	.string	"p3p"
	.byte	0x14
	.byte	0x4c
	.long	0x104
	.byte	0x30
	.uleb128 0x8
	.long	.LASF168
	.byte	0x14
	.byte	0x4d
	.long	0x53
	.byte	0x38
	.uleb128 0x1d
	.string	"cwd"
	.byte	0x14
	.byte	0x4e
	.long	0x104
	.byte	0x40
	.uleb128 0x8
	.long	.LASF169
	.byte	0x14
	.byte	0x4f
	.long	0x53
	.byte	0x48
	.uleb128 0x8
	.long	.LASF170
	.byte	0x14
	.byte	0x4f
	.long	0x53
	.byte	0x4c
	.uleb128 0x8
	.long	.LASF171
	.byte	0x14
	.byte	0x50
	.long	0x53
	.byte	0x50
	.uleb128 0x8
	.long	.LASF172
	.byte	0x14
	.byte	0x51
	.long	0x97a
	.byte	0x58
	.uleb128 0x8
	.long	.LASF173
	.byte	0x14
	.byte	0x52
	.long	0x53
	.byte	0x60
	.uleb128 0x8
	.long	.LASF174
	.byte	0x14
	.byte	0x53
	.long	0x53
	.byte	0x64
	.uleb128 0x8
	.long	.LASF175
	.byte	0x14
	.byte	0x54
	.long	0x53
	.byte	0x68
	.uleb128 0x8
	.long	.LASF176
	.byte	0x14
	.byte	0x55
	.long	0x104
	.byte	0x70
	.uleb128 0x8
	.long	.LASF177
	.byte	0x14
	.byte	0x56
	.long	0x104
	.byte	0x78
	.uleb128 0x8
	.long	.LASF178
	.byte	0x14
	.byte	0x57
	.long	0x53
	.byte	0x80
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x33f
	.uleb128 0x4
	.long	.LASF179
	.byte	0x14
	.byte	0x58
	.long	0x881
	.uleb128 0x1e
	.value	0x2d0
	.byte	0x14
	.byte	0x5b
	.long	0xca7
	.uleb128 0x8
	.long	.LASF180
	.byte	0x14
	.byte	0x5c
	.long	0x53
	.byte	0
	.uleb128 0x1d
	.string	"hs"
	.byte	0x14
	.byte	0x5d
	.long	0xca7
	.byte	0x8
	.uleb128 0x8
	.long	.LASF181
	.byte	0x14
	.byte	0x5e
	.long	0x876
	.byte	0x10
	.uleb128 0x8
	.long	.LASF182
	.byte	0x14
	.byte	0x5f
	.long	0x104
	.byte	0x90
	.uleb128 0x8
	.long	.LASF183
	.byte	0x14
	.byte	0x60
	.long	0x153
	.byte	0x98
	.uleb128 0x8
	.long	.LASF184
	.byte	0x14
	.byte	0x60
	.long	0x153
	.byte	0xa0
	.uleb128 0x8
	.long	.LASF185
	.byte	0x14
	.byte	0x60
	.long	0x153
	.byte	0xa8
	.uleb128 0x8
	.long	.LASF186
	.byte	0x14
	.byte	0x61
	.long	0x53
	.byte	0xb0
	.uleb128 0x8
	.long	.LASF187
	.byte	0x14
	.byte	0x62
	.long	0x53
	.byte	0xb4
	.uleb128 0x8
	.long	.LASF188
	.byte	0x14
	.byte	0x63
	.long	0x53
	.byte	0xb8
	.uleb128 0x8
	.long	.LASF189
	.byte	0x14
	.byte	0x64
	.long	0x132
	.byte	0xc0
	.uleb128 0x8
	.long	.LASF190
	.byte	0x14
	.byte	0x65
	.long	0x132
	.byte	0xc8
	.uleb128 0x8
	.long	.LASF191
	.byte	0x14
	.byte	0x66
	.long	0x104
	.byte	0xd0
	.uleb128 0x8
	.long	.LASF192
	.byte	0x14
	.byte	0x67
	.long	0x104
	.byte	0xd8
	.uleb128 0x8
	.long	.LASF193
	.byte	0x14
	.byte	0x68
	.long	0x104
	.byte	0xe0
	.uleb128 0x8
	.long	.LASF194
	.byte	0x14
	.byte	0x69
	.long	0x104
	.byte	0xe8
	.uleb128 0x8
	.long	.LASF195
	.byte	0x14
	.byte	0x6a
	.long	0x104
	.byte	0xf0
	.uleb128 0x8
	.long	.LASF196
	.byte	0x14
	.byte	0x6b
	.long	0x104
	.byte	0xf8
	.uleb128 0x1f
	.long	.LASF197
	.byte	0x14
	.byte	0x6c
	.long	0x104
	.value	0x100
	.uleb128 0x1f
	.long	.LASF198
	.byte	0x14
	.byte	0x6d
	.long	0x104
	.value	0x108
	.uleb128 0x1f
	.long	.LASF199
	.byte	0x14
	.byte	0x6e
	.long	0x104
	.value	0x110
	.uleb128 0x1f
	.long	.LASF200
	.byte	0x14
	.byte	0x6f
	.long	0x104
	.value	0x118
	.uleb128 0x1f
	.long	.LASF201
	.byte	0x14
	.byte	0x70
	.long	0x104
	.value	0x120
	.uleb128 0x1f
	.long	.LASF202
	.byte	0x14
	.byte	0x71
	.long	0x104
	.value	0x128
	.uleb128 0x1f
	.long	.LASF203
	.byte	0x14
	.byte	0x72
	.long	0x104
	.value	0x130
	.uleb128 0x1f
	.long	.LASF204
	.byte	0x14
	.byte	0x73
	.long	0x104
	.value	0x138
	.uleb128 0x1f
	.long	.LASF205
	.byte	0x14
	.byte	0x74
	.long	0x104
	.value	0x140
	.uleb128 0x1f
	.long	.LASF206
	.byte	0x14
	.byte	0x75
	.long	0x104
	.value	0x148
	.uleb128 0x1f
	.long	.LASF207
	.byte	0x14
	.byte	0x76
	.long	0x104
	.value	0x150
	.uleb128 0x1f
	.long	.LASF208
	.byte	0x14
	.byte	0x77
	.long	0x104
	.value	0x158
	.uleb128 0x1f
	.long	.LASF209
	.byte	0x14
	.byte	0x78
	.long	0x104
	.value	0x160
	.uleb128 0x1f
	.long	.LASF210
	.byte	0x14
	.byte	0x79
	.long	0x104
	.value	0x168
	.uleb128 0x1f
	.long	.LASF211
	.byte	0x14
	.byte	0x7a
	.long	0x104
	.value	0x170
	.uleb128 0x1f
	.long	.LASF212
	.byte	0x14
	.byte	0x7b
	.long	0x153
	.value	0x178
	.uleb128 0x1f
	.long	.LASF213
	.byte	0x14
	.byte	0x7b
	.long	0x153
	.value	0x180
	.uleb128 0x1f
	.long	.LASF214
	.byte	0x14
	.byte	0x7b
	.long	0x153
	.value	0x188
	.uleb128 0x1f
	.long	.LASF215
	.byte	0x14
	.byte	0x7b
	.long	0x153
	.value	0x190
	.uleb128 0x1f
	.long	.LASF216
	.byte	0x14
	.byte	0x7c
	.long	0x153
	.value	0x198
	.uleb128 0x1f
	.long	.LASF217
	.byte	0x14
	.byte	0x7c
	.long	0x153
	.value	0x1a0
	.uleb128 0x1f
	.long	.LASF218
	.byte	0x14
	.byte	0x7c
	.long	0x153
	.value	0x1a8
	.uleb128 0x1f
	.long	.LASF219
	.byte	0x14
	.byte	0x7c
	.long	0x153
	.value	0x1b0
	.uleb128 0x1f
	.long	.LASF220
	.byte	0x14
	.byte	0x7c
	.long	0x153
	.value	0x1b8
	.uleb128 0x1f
	.long	.LASF221
	.byte	0x14
	.byte	0x7c
	.long	0x153
	.value	0x1c0
	.uleb128 0x1f
	.long	.LASF222
	.byte	0x14
	.byte	0x7d
	.long	0x153
	.value	0x1c8
	.uleb128 0x1f
	.long	.LASF223
	.byte	0x14
	.byte	0x7d
	.long	0x153
	.value	0x1d0
	.uleb128 0x1f
	.long	.LASF224
	.byte	0x14
	.byte	0x82
	.long	0x153
	.value	0x1d8
	.uleb128 0x1f
	.long	.LASF225
	.byte	0x14
	.byte	0x83
	.long	0x148
	.value	0x1e0
	.uleb128 0x1f
	.long	.LASF226
	.byte	0x14
	.byte	0x83
	.long	0x148
	.value	0x1e8
	.uleb128 0x1f
	.long	.LASF227
	.byte	0x14
	.byte	0x84
	.long	0x153
	.value	0x1f0
	.uleb128 0x1f
	.long	.LASF228
	.byte	0x14
	.byte	0x85
	.long	0x104
	.value	0x1f8
	.uleb128 0x1f
	.long	.LASF229
	.byte	0x14
	.byte	0x86
	.long	0x104
	.value	0x200
	.uleb128 0x1f
	.long	.LASF230
	.byte	0x14
	.byte	0x87
	.long	0x53
	.value	0x208
	.uleb128 0x1f
	.long	.LASF231
	.byte	0x14
	.byte	0x88
	.long	0x53
	.value	0x20c
	.uleb128 0x1f
	.long	.LASF232
	.byte	0x14
	.byte	0x89
	.long	0x53
	.value	0x210
	.uleb128 0x1f
	.long	.LASF233
	.byte	0x14
	.byte	0x8a
	.long	0x53
	.value	0x214
	.uleb128 0x1f
	.long	.LASF234
	.byte	0x14
	.byte	0x8b
	.long	0x132
	.value	0x218
	.uleb128 0x1f
	.long	.LASF235
	.byte	0x14
	.byte	0x8b
	.long	0x132
	.value	0x220
	.uleb128 0x1f
	.long	.LASF236
	.byte	0x14
	.byte	0x8c
	.long	0x53
	.value	0x228
	.uleb128 0x1f
	.long	.LASF237
	.byte	0x14
	.byte	0x8d
	.long	0x53
	.value	0x22c
	.uleb128 0x20
	.string	"sb"
	.byte	0x14
	.byte	0x8e
	.long	0x1e2
	.value	0x230
	.uleb128 0x1f
	.long	.LASF238
	.byte	0x14
	.byte	0x8f
	.long	0x53
	.value	0x2c0
	.uleb128 0x1f
	.long	.LASF239
	.byte	0x14
	.byte	0x90
	.long	0x104
	.value	0x2c8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x980
	.uleb128 0x4
	.long	.LASF240
	.byte	0x14
	.byte	0x91
	.long	0x98b
	.uleb128 0x18
	.byte	0x8
	.byte	0x15
	.byte	0x2a
	.long	0xcdc
	.uleb128 0x1b
	.string	"p"
	.byte	0x15
	.byte	0x2b
	.long	0xe1
	.uleb128 0x1b
	.string	"i"
	.byte	0x15
	.byte	0x2c
	.long	0x53
	.uleb128 0x1b
	.string	"l"
	.byte	0x15
	.byte	0x2d
	.long	0x5a
	.byte	0
	.uleb128 0x4
	.long	.LASF241
	.byte	0x15
	.byte	0x2e
	.long	0xcb8
	.uleb128 0x4
	.long	.LASF242
	.byte	0x15
	.byte	0x36
	.long	0xcf2
	.uleb128 0xa
	.long	0xd02
	.uleb128 0xb
	.long	0xcdc
	.uleb128 0xb
	.long	0xd02
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x18e
	.uleb128 0x7
	.long	.LASF243
	.byte	0x48
	.byte	0x15
	.byte	0x39
	.long	0xd75
	.uleb128 0x8
	.long	.LASF244
	.byte	0x15
	.byte	0x3a
	.long	0xd75
	.byte	0
	.uleb128 0x8
	.long	.LASF245
	.byte	0x15
	.byte	0x3b
	.long	0xcdc
	.byte	0x8
	.uleb128 0x8
	.long	.LASF246
	.byte	0x15
	.byte	0x3c
	.long	0x5a
	.byte	0x10
	.uleb128 0x8
	.long	.LASF247
	.byte	0x15
	.byte	0x3d
	.long	0x53
	.byte	0x18
	.uleb128 0x8
	.long	.LASF248
	.byte	0x15
	.byte	0x3e
	.long	0x18e
	.byte	0x20
	.uleb128 0x8
	.long	.LASF249
	.byte	0x15
	.byte	0x3f
	.long	0xd7b
	.byte	0x30
	.uleb128 0x8
	.long	.LASF250
	.byte	0x15
	.byte	0x40
	.long	0xd7b
	.byte	0x38
	.uleb128 0x8
	.long	.LASF251
	.byte	0x15
	.byte	0x41
	.long	0x53
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xce7
	.uleb128 0x6
	.byte	0x8
	.long	0xd08
	.uleb128 0x4
	.long	.LASF252
	.byte	0x15
	.byte	0x42
	.long	0xd08
	.uleb128 0x1c
	.byte	0x30
	.byte	0x1
	.byte	0x58
	.long	0xddd
	.uleb128 0x8
	.long	.LASF253
	.byte	0x1
	.byte	0x59
	.long	0x104
	.byte	0
	.uleb128 0x8
	.long	.LASF254
	.byte	0x1
	.byte	0x5a
	.long	0x5a
	.byte	0x8
	.uleb128 0x8
	.long	.LASF255
	.byte	0x1
	.byte	0x5a
	.long	0x5a
	.byte	0x10
	.uleb128 0x8
	.long	.LASF256
	.byte	0x1
	.byte	0x5b
	.long	0x5a
	.byte	0x18
	.uleb128 0x8
	.long	.LASF257
	.byte	0x1
	.byte	0x5c
	.long	0x132
	.byte	0x20
	.uleb128 0x8
	.long	.LASF258
	.byte	0x1
	.byte	0x5d
	.long	0x53
	.byte	0x28
	.byte	0
	.uleb128 0x4
	.long	.LASF259
	.byte	0x1
	.byte	0x5e
	.long	0xd8c
	.uleb128 0x1c
	.byte	0x90
	.byte	0x1
	.byte	0x65
	.long	0xea4
	.uleb128 0x8
	.long	.LASF260
	.byte	0x1
	.byte	0x66
	.long	0x53
	.byte	0
	.uleb128 0x8
	.long	.LASF261
	.byte	0x1
	.byte	0x67
	.long	0x53
	.byte	0x4
	.uleb128 0x1d
	.string	"hc"
	.byte	0x1
	.byte	0x68
	.long	0xea4
	.byte	0x8
	.uleb128 0x8
	.long	.LASF262
	.byte	0x1
	.byte	0x69
	.long	0xeaa
	.byte	0x10
	.uleb128 0x8
	.long	.LASF263
	.byte	0x1
	.byte	0x6a
	.long	0x53
	.byte	0x38
	.uleb128 0x8
	.long	.LASF254
	.byte	0x1
	.byte	0x6b
	.long	0x5a
	.byte	0x40
	.uleb128 0x8
	.long	.LASF255
	.byte	0x1
	.byte	0x6b
	.long	0x5a
	.byte	0x48
	.uleb128 0x8
	.long	.LASF264
	.byte	0x1
	.byte	0x6c
	.long	0x148
	.byte	0x50
	.uleb128 0x8
	.long	.LASF265
	.byte	0x1
	.byte	0x6c
	.long	0x148
	.byte	0x58
	.uleb128 0x8
	.long	.LASF266
	.byte	0x1
	.byte	0x6d
	.long	0xeba
	.byte	0x60
	.uleb128 0x8
	.long	.LASF267
	.byte	0x1
	.byte	0x6e
	.long	0xeba
	.byte	0x68
	.uleb128 0x8
	.long	.LASF268
	.byte	0x1
	.byte	0x6f
	.long	0x5a
	.byte	0x70
	.uleb128 0x8
	.long	.LASF269
	.byte	0x1
	.byte	0x70
	.long	0x132
	.byte	0x78
	.uleb128 0x8
	.long	.LASF270
	.byte	0x1
	.byte	0x71
	.long	0x132
	.byte	0x80
	.uleb128 0x8
	.long	.LASF271
	.byte	0x1
	.byte	0x72
	.long	0x132
	.byte	0x88
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xcad
	.uleb128 0xc
	.long	0x53
	.long	0xeba
	.uleb128 0xd
	.long	0xc4
	.byte	0x9
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xd81
	.uleb128 0x4
	.long	.LASF272
	.byte	0x1
	.byte	0x73
	.long	0xde8
	.uleb128 0x21
	.long	.LASF273
	.byte	0x1
	.value	0x782
	.byte	0
	.long	0xefb
	.uleb128 0x22
	.string	"c"
	.byte	0x1
	.value	0x782
	.long	0xefb
	.uleb128 0x22
	.string	"tvP"
	.byte	0x1
	.value	0x782
	.long	0xd02
	.uleb128 0x23
	.long	.LASF281
	.byte	0x1
	.value	0x784
	.long	0x53
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xec0
	.uleb128 0x21
	.long	.LASF274
	.byte	0x1
	.value	0x4d3
	.byte	0x1
	.long	0xfaa
	.uleb128 0x24
	.long	.LASF275
	.byte	0x1
	.value	0x4d3
	.long	0xfaa
	.uleb128 0x24
	.long	.LASF276
	.byte	0x1
	.value	0x4d3
	.long	0x153
	.uleb128 0x24
	.long	.LASF277
	.byte	0x1
	.value	0x4d3
	.long	0x2b3
	.uleb128 0x24
	.long	.LASF278
	.byte	0x1
	.value	0x4d3
	.long	0xfaa
	.uleb128 0x24
	.long	.LASF279
	.byte	0x1
	.value	0x4d3
	.long	0x153
	.uleb128 0x24
	.long	.LASF280
	.byte	0x1
	.value	0x4d3
	.long	0x2b3
	.uleb128 0x23
	.long	.LASF282
	.byte	0x1
	.value	0x4d7
	.long	0x7c0
	.uleb128 0x23
	.long	.LASF283
	.byte	0x1
	.value	0x4d8
	.long	0xfb0
	.uleb128 0x23
	.long	.LASF284
	.byte	0x1
	.value	0x4d9
	.long	0x53
	.uleb128 0x25
	.string	"ai"
	.byte	0x1
	.value	0x4da
	.long	0x83c
	.uleb128 0x25
	.string	"ai2"
	.byte	0x1
	.value	0x4db
	.long	0x83c
	.uleb128 0x23
	.long	.LASF285
	.byte	0x1
	.value	0x4dc
	.long	0x83c
	.uleb128 0x23
	.long	.LASF286
	.byte	0x1
	.value	0x4dd
	.long	0x83c
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x876
	.uleb128 0xc
	.long	0x10a
	.long	0xfc0
	.uleb128 0xd
	.long	0xc4
	.byte	0x9
	.byte	0
	.uleb128 0x26
	.long	.LASF288
	.byte	0x1
	.byte	0xed
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0xff6
	.uleb128 0x27
	.string	"sig"
	.byte	0x1
	.byte	0xed
	.long	0x53
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x28
	.long	.LASF287
	.byte	0x1
	.byte	0xef
	.long	0x53b
	.byte	0
	.uleb128 0x29
	.long	.LASF289
	.byte	0x1
	.value	0x882
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0x1045
	.uleb128 0x2a
	.long	.LASF290
	.byte	0x1
	.value	0x882
	.long	0x5a
	.long	.LLST0
	.uleb128 0x2b
	.quad	.LVL3
	.long	0x6153
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x36
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF291
	.byte	0x1
	.value	0x78c
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x1243
	.uleb128 0x2a
	.long	.LASF245
	.byte	0x1
	.value	0x78c
	.long	0xcdc
	.long	.LLST1
	.uleb128 0x2a
	.long	.LASF292
	.byte	0x1
	.value	0x78c
	.long	0xd02
	.long	.LLST2
	.uleb128 0x2d
	.long	.LASF293
	.byte	0x1
	.value	0x78e
	.long	0x53
	.long	.LLST3
	.uleb128 0x2d
	.long	.LASF281
	.byte	0x1
	.value	0x78e
	.long	0x53
	.long	.LLST4
	.uleb128 0x2d
	.long	.LASF294
	.byte	0x1
	.value	0x78f
	.long	0x53
	.long	.LLST5
	.uleb128 0x2e
	.string	"c"
	.byte	0x1
	.value	0x790
	.long	0xefb
	.long	.LLST6
	.uleb128 0x2e
	.string	"l"
	.byte	0x1
	.value	0x791
	.long	0x5a
	.long	.LLST7
	.uleb128 0x2f
	.quad	.LVL6
	.long	0x6153
	.long	0x10f9
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x35
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL10
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL12
	.long	0x6153
	.long	0x1130
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x35
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x73
	.sleb128 -1
	.byte	0
	.uleb128 0x30
	.quad	.LVL24
	.long	0x616d
	.uleb128 0x2f
	.quad	.LVL25
	.long	0x6153
	.long	0x1167
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x36
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL26
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL28
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL29
	.long	0x617c
	.uleb128 0x30
	.quad	.LVL30
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL31
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL32
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL33
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL34
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL35
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL36
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL37
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL38
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL39
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL40
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL41
	.long	0x616d
	.long	0x1235
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL42
	.long	0x615e
	.byte	0
	.uleb128 0x29
	.long	.LASF295
	.byte	0x1
	.value	0x4b6
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x12d9
	.uleb128 0x2a
	.long	.LASF296
	.byte	0x1
	.value	0x4b6
	.long	0x104
	.long	.LLST8
	.uleb128 0x2a
	.long	.LASF297
	.byte	0x1
	.value	0x4b6
	.long	0x104
	.long	.LLST9
	.uleb128 0x2f
	.quad	.LVL46
	.long	0x618b
	.long	0x12a7
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x30
	.quad	.LVL47
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL48
	.long	0x61a6
	.long	0x12cb
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL49
	.long	0x615e
	.byte	0
	.uleb128 0x29
	.long	.LASF298
	.byte	0x1
	.value	0x4aa
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x136f
	.uleb128 0x2a
	.long	.LASF296
	.byte	0x1
	.value	0x4aa
	.long	0x104
	.long	.LLST10
	.uleb128 0x2a
	.long	.LASF297
	.byte	0x1
	.value	0x4aa
	.long	0x104
	.long	.LLST11
	.uleb128 0x2f
	.quad	.LVL53
	.long	0x618b
	.long	0x133d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x30
	.quad	.LVL54
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL55
	.long	0x61a6
	.long	0x1361
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL56
	.long	0x615e
	.byte	0
	.uleb128 0x31
	.long	.LASF308
	.byte	0x1
	.value	0x3dd
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x13da
	.uleb128 0x30
	.quad	.LVL57
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL58
	.long	0x618b
	.long	0x13b9
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.byte	0
	.uleb128 0x30
	.quad	.LVL59
	.long	0x6197
	.uleb128 0x2b
	.quad	.LVL60
	.long	0x61a6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF299
	.byte	0x1
	.value	0x838
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0x1489
	.uleb128 0x32
	.long	.LASF245
	.byte	0x1
	.value	0x838
	.long	0xcdc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2a
	.long	.LASF292
	.byte	0x1
	.value	0x838
	.long	0xd02
	.long	.LLST12
	.uleb128 0x2e
	.string	"c"
	.byte	0x1
	.value	0x83a
	.long	0xefb
	.long	.LLST13
	.uleb128 0x2f
	.quad	.LVL63
	.long	0x61b2
	.long	0x143c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL65
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL66
	.long	0x617c
	.uleb128 0x2f
	.quad	.LVL67
	.long	0x615e
	.long	0x146e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL68
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL69
	.long	0x615e
	.byte	0
	.uleb128 0x33
	.long	.LASF300
	.byte	0x1
	.value	0x864
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.long	0x15c6
	.uleb128 0x2a
	.long	.LASF292
	.byte	0x1
	.value	0x864
	.long	0xd02
	.long	.LLST14
	.uleb128 0x25
	.string	"tv"
	.byte	0x1
	.value	0x866
	.long	0x18e
	.uleb128 0x2e
	.string	"now"
	.byte	0x1
	.value	0x867
	.long	0x148
	.long	.LLST15
	.uleb128 0x2d
	.long	.LASF301
	.byte	0x1
	.value	0x868
	.long	0x5a
	.long	.LLST16
	.uleb128 0x2d
	.long	.LASF302
	.byte	0x1
	.value	0x868
	.long	0x5a
	.long	.LLST17
	.uleb128 0x2f
	.quad	.LVL79
	.long	0x6153
	.long	0x151c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x36
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC15
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL80
	.long	0xff6
	.long	0x1534
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL81
	.long	0x61bd
	.long	0x154c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL82
	.long	0x61c9
	.long	0x1564
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL83
	.long	0x61d4
	.long	0x157c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL84
	.long	0x61df
	.long	0x1594
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL88
	.long	0x61ea
	.long	0x15b1
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2b
	.quad	.LVL92
	.long	0x615e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF303
	.byte	0x1
	.value	0x85b
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.long	0x161a
	.uleb128 0x2a
	.long	.LASF245
	.byte	0x1
	.value	0x85b
	.long	0xcdc
	.long	.LLST18
	.uleb128 0x2a
	.long	.LASF292
	.byte	0x1
	.value	0x85b
	.long	0xd02
	.long	.LLST19
	.uleb128 0x34
	.quad	.LVL95
	.long	0x1489
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF304
	.byte	0x1
	.value	0x119
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x16a9
	.uleb128 0x35
	.string	"sig"
	.byte	0x1
	.value	0x119
	.long	0x53
	.long	.LLST20
	.uleb128 0x2d
	.long	.LASF287
	.byte	0x1
	.value	0x11b
	.long	0x53b
	.long	.LLST21
	.uleb128 0x30
	.quad	.LVL97
	.long	0x61f5
	.uleb128 0x2f
	.quad	.LVL99
	.long	0x1489
	.long	0x167c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL102
	.long	0x6200
	.long	0x1694
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2b
	.quad	.LVL103
	.long	0x616d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF305
	.byte	0x1
	.value	0x851
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0x170e
	.uleb128 0x2a
	.long	.LASF245
	.byte	0x1
	.value	0x851
	.long	0xcdc
	.long	.LLST22
	.uleb128 0x2a
	.long	.LASF292
	.byte	0x1
	.value	0x851
	.long	0xd02
	.long	.LLST23
	.uleb128 0x2f
	.quad	.LVL106
	.long	0x620f
	.long	0x1700
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x30
	.quad	.LVL107
	.long	0x621a
	.byte	0
	.uleb128 0x29
	.long	.LASF306
	.byte	0x1
	.value	0x12b
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x17dc
	.uleb128 0x35
	.string	"sig"
	.byte	0x1
	.value	0x12b
	.long	0x53
	.long	.LLST24
	.uleb128 0x2d
	.long	.LASF287
	.byte	0x1
	.value	0x12d
	.long	0x53b
	.long	.LLST25
	.uleb128 0x30
	.quad	.LVL109
	.long	0x61f5
	.uleb128 0x2f
	.quad	.LVL111
	.long	0x6225
	.long	0x1772
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xa
	.value	0x168
	.byte	0
	.uleb128 0x2f
	.quad	.LVL114
	.long	0x6200
	.long	0x178a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL115
	.long	0x616d
	.long	0x17a2
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL116
	.long	0x6231
	.long	0x17c1
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC20
	.byte	0
	.uleb128 0x30
	.quad	.LVL117
	.long	0x6197
	.uleb128 0x30
	.quad	.LVL118
	.long	0x623d
	.byte	0
	.uleb128 0x36
	.long	.LASF307
	.byte	0x1
	.byte	0xb8
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x18d7
	.uleb128 0x37
	.string	"sig"
	.byte	0x1
	.byte	0xb8
	.long	0x53
	.long	.LLST26
	.uleb128 0x38
	.long	.LASF287
	.byte	0x1
	.byte	0xba
	.long	0x53b
	.long	.LLST27
	.uleb128 0x39
	.string	"pid"
	.byte	0x1
	.byte	0xbb
	.long	0x13d
	.long	.LLST28
	.uleb128 0x28
	.long	.LASF188
	.byte	0x1
	.byte	0xbc
	.long	0x53
	.uleb128 0x30
	.quad	.LVL121
	.long	0x61f5
	.uleb128 0x2f
	.quad	.LVL126
	.long	0x6249
	.long	0x1861
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x9
	.byte	0xff
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL130
	.long	0x6153
	.long	0x1885
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC23
	.byte	0
	.uleb128 0x2f
	.quad	.LVL138
	.long	0x6200
	.long	0x189d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL139
	.long	0x616d
	.uleb128 0x2f
	.quad	.LVL140
	.long	0x616d
	.long	0x18c2
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2b
	.quad	.LVL141
	.long	0x616d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x3a
	.long	.LASF309
	.byte	0x1
	.value	0x4c3
	.long	0x104
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x19a7
	.uleb128 0x2a
	.long	.LASF310
	.byte	0x1
	.value	0x4c3
	.long	0x104
	.long	.LLST29
	.uleb128 0x2d
	.long	.LASF311
	.byte	0x1
	.value	0x4c5
	.long	0x104
	.long	.LLST30
	.uleb128 0x2f
	.quad	.LVL143
	.long	0x6254
	.long	0x1932
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x2f
	.quad	.LVL144
	.long	0x6153
	.long	0x1956
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC25
	.byte	0
	.uleb128 0x2f
	.quad	.LVL145
	.long	0x618b
	.long	0x1975
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC26
	.byte	0
	.uleb128 0x30
	.quad	.LVL146
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL147
	.long	0x61a6
	.long	0x1999
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL148
	.long	0x615e
	.byte	0
	.uleb128 0x33
	.long	.LASF312
	.byte	0x1
	.value	0x3e7
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x24a4
	.uleb128 0x2a
	.long	.LASF313
	.byte	0x1
	.value	0x3e7
	.long	0x104
	.long	.LLST31
	.uleb128 0x2e
	.string	"fp"
	.byte	0x1
	.value	0x3e9
	.long	0x97a
	.long	.LLST32
	.uleb128 0x23
	.long	.LASF314
	.byte	0x1
	.value	0x3ea
	.long	0x24a4
	.uleb128 0x2e
	.string	"cp"
	.byte	0x1
	.value	0x3eb
	.long	0x104
	.long	.LLST33
	.uleb128 0x2e
	.string	"cp2"
	.byte	0x1
	.value	0x3ec
	.long	0x104
	.long	.LLST34
	.uleb128 0x2d
	.long	.LASF296
	.byte	0x1
	.value	0x3ed
	.long	0x104
	.long	.LLST35
	.uleb128 0x2d
	.long	.LASF297
	.byte	0x1
	.value	0x3ee
	.long	0x104
	.long	.LLST36
	.uleb128 0x2f
	.quad	.LVL151
	.long	0x625f
	.long	0x1a54
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC29
	.byte	0
	.uleb128 0x2f
	.quad	.LVL155
	.long	0x626b
	.long	0x1a7c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x77
	.sleb128 0
	.byte	0x6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.value	0x3e8
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x91
	.sleb128 -264
	.byte	0x6
	.byte	0
	.uleb128 0x2f
	.quad	.LVL156
	.long	0x6277
	.long	0x1a9b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x77
	.sleb128 0
	.byte	0x6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x23
	.byte	0
	.uleb128 0x2f
	.quad	.LVL158
	.long	0x6282
	.long	0x1ac0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL160
	.long	0x628e
	.long	0x1ae5
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL168
	.long	0x6277
	.long	0x1b03
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x3d
	.byte	0
	.uleb128 0x2f
	.quad	.LVL171
	.long	0x629a
	.long	0x1b28
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL172
	.long	0x629a
	.long	0x1b4d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC32
	.byte	0
	.uleb128 0x2f
	.quad	.LVL173
	.long	0x629a
	.long	0x1b72
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC33
	.byte	0
	.uleb128 0x2f
	.quad	.LVL174
	.long	0x629a
	.long	0x1b97
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC34
	.byte	0
	.uleb128 0x2f
	.quad	.LVL175
	.long	0x629a
	.long	0x1bbc
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC35
	.byte	0
	.uleb128 0x2f
	.quad	.LVL176
	.long	0x629a
	.long	0x1be1
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC36
	.byte	0
	.uleb128 0x2f
	.quad	.LVL177
	.long	0x629a
	.long	0x1c06
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC37
	.byte	0
	.uleb128 0x2f
	.quad	.LVL178
	.long	0x629a
	.long	0x1c2b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC38
	.byte	0
	.uleb128 0x2f
	.quad	.LVL179
	.long	0x629a
	.long	0x1c50
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC39
	.byte	0
	.uleb128 0x2f
	.quad	.LVL180
	.long	0x629a
	.long	0x1c75
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC40
	.byte	0
	.uleb128 0x2f
	.quad	.LVL181
	.long	0x629a
	.long	0x1c9a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC41
	.byte	0
	.uleb128 0x2f
	.quad	.LVL182
	.long	0x629a
	.long	0x1cbf
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC42
	.byte	0
	.uleb128 0x2f
	.quad	.LVL183
	.long	0x629a
	.long	0x1ce4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC43
	.byte	0
	.uleb128 0x2f
	.quad	.LVL184
	.long	0x629a
	.long	0x1d09
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC44
	.byte	0
	.uleb128 0x2f
	.quad	.LVL185
	.long	0x629a
	.long	0x1d2e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC45
	.byte	0
	.uleb128 0x2f
	.quad	.LVL186
	.long	0x629a
	.long	0x1d53
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC46
	.byte	0
	.uleb128 0x2f
	.quad	.LVL187
	.long	0x629a
	.long	0x1d78
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC47
	.byte	0
	.uleb128 0x2f
	.quad	.LVL188
	.long	0x629a
	.long	0x1d9d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC48
	.byte	0
	.uleb128 0x2f
	.quad	.LVL189
	.long	0x629a
	.long	0x1dc2
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC49
	.byte	0
	.uleb128 0x2f
	.quad	.LVL190
	.long	0x629a
	.long	0x1de7
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC50
	.byte	0
	.uleb128 0x2f
	.quad	.LVL191
	.long	0x629a
	.long	0x1e0c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC51
	.byte	0
	.uleb128 0x2f
	.quad	.LVL192
	.long	0x629a
	.long	0x1e31
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC52
	.byte	0
	.uleb128 0x2f
	.quad	.LVL193
	.long	0x629a
	.long	0x1e56
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC53
	.byte	0
	.uleb128 0x2f
	.quad	.LVL194
	.long	0x629a
	.long	0x1e7b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC54
	.byte	0
	.uleb128 0x2f
	.quad	.LVL195
	.long	0x629a
	.long	0x1ea0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC55
	.byte	0
	.uleb128 0x2f
	.quad	.LVL196
	.long	0x629a
	.long	0x1ec5
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC56
	.byte	0
	.uleb128 0x2f
	.quad	.LVL197
	.long	0x629a
	.long	0x1eea
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC57
	.byte	0
	.uleb128 0x2f
	.quad	.LVL198
	.long	0x12d9
	.long	0x1f08
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL199
	.long	0x62a6
	.long	0x1f20
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL201
	.long	0x6282
	.long	0x1f45
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL203
	.long	0x62b1
	.long	0x1f5d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL206
	.long	0x1243
	.long	0x1f7b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL207
	.long	0x12d9
	.long	0x1f99
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL208
	.long	0x62a6
	.long	0x1fb1
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL211
	.long	0x12d9
	.long	0x1fcf
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL212
	.long	0x18d7
	.long	0x1fe7
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL213
	.long	0x1243
	.long	0x2005
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL214
	.long	0x1243
	.long	0x2023
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL215
	.long	0x1243
	.long	0x2041
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL216
	.long	0x12d9
	.long	0x205f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL217
	.long	0x18d7
	.long	0x2077
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL218
	.long	0x1243
	.long	0x2095
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL219
	.long	0x12d9
	.long	0x20b3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL220
	.long	0x18d7
	.long	0x20cb
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL221
	.long	0x12d9
	.long	0x20e9
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL222
	.long	0x18d7
	.long	0x2101
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL223
	.long	0x12d9
	.long	0x211f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL224
	.long	0x62a6
	.long	0x2137
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL225
	.long	0x12d9
	.long	0x2155
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL226
	.long	0x18d7
	.long	0x216d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL227
	.long	0x12d9
	.long	0x218b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL228
	.long	0x18d7
	.long	0x21a3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL229
	.long	0x1243
	.long	0x21c1
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL231
	.long	0x62c0
	.long	0x21db
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -264
	.byte	0x6
	.byte	0
	.uleb128 0x2f
	.quad	.LVL234
	.long	0x62b1
	.long	0x21f3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL235
	.long	0x12d9
	.long	0x2211
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL236
	.long	0x18d7
	.long	0x2229
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL237
	.long	0x12d9
	.long	0x2247
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL238
	.long	0x18d7
	.long	0x225f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL239
	.long	0x62cb
	.long	0x2277
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 -1
	.byte	0
	.uleb128 0x30
	.quad	.LVL242
	.long	0x62cb
	.uleb128 0x2f
	.quad	.LVL243
	.long	0x62da
	.long	0x229c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL244
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL245
	.long	0x61a6
	.long	0x22c0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL248
	.long	0x62cb
	.uleb128 0x2f
	.quad	.LVL249
	.long	0x62b1
	.long	0x22e5
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL250
	.long	0x62b1
	.long	0x22fd
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL251
	.long	0x618b
	.long	0x2322
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC58
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL252
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL253
	.long	0x61a6
	.long	0x2346
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL254
	.long	0x12d9
	.long	0x2364
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL255
	.long	0x18d7
	.long	0x237c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL256
	.long	0x1243
	.long	0x239a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL257
	.long	0x1243
	.long	0x23b8
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL258
	.long	0x1243
	.long	0x23d6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL259
	.long	0x12d9
	.long	0x23f4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL260
	.long	0x18d7
	.long	0x240c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL261
	.long	0x12d9
	.long	0x242a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL262
	.long	0x18d7
	.long	0x2442
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL263
	.long	0x1243
	.long	0x2460
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL264
	.long	0x12d9
	.long	0x247e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL265
	.long	0x18d7
	.long	0x2496
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL266
	.long	0x615e
	.byte	0
	.uleb128 0xc
	.long	0x10a
	.long	0x24b4
	.uleb128 0xd
	.long	0xc4
	.byte	0x63
	.byte	0
	.uleb128 0x29
	.long	.LASF315
	.byte	0x1
	.value	0x344
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x2a3c
	.uleb128 0x2a
	.long	.LASF316
	.byte	0x1
	.value	0x344
	.long	0x53
	.long	.LLST37
	.uleb128 0x2a
	.long	.LASF317
	.byte	0x1
	.value	0x344
	.long	0x4cb
	.long	.LLST38
	.uleb128 0x2d
	.long	.LASF318
	.byte	0x1
	.value	0x346
	.long	0x53
	.long	.LLST39
	.uleb128 0x2f
	.quad	.LVL271
	.long	0x62e6
	.long	0x2527
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC66
	.byte	0
	.uleb128 0x2f
	.quad	.LVL272
	.long	0x62e6
	.long	0x254c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC67
	.byte	0
	.uleb128 0x2f
	.quad	.LVL277
	.long	0x62e6
	.long	0x2571
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC63
	.byte	0
	.uleb128 0x2f
	.quad	.LVL278
	.long	0x62e6
	.long	0x2596
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC65
	.byte	0
	.uleb128 0x2f
	.quad	.LVL279
	.long	0x62e6
	.long	0x25bb
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC66
	.byte	0
	.uleb128 0x30
	.quad	.LVL281
	.long	0x62a6
	.uleb128 0x2f
	.quad	.LVL285
	.long	0x62e6
	.long	0x25ed
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC68
	.byte	0
	.uleb128 0x2f
	.quad	.LVL286
	.long	0x62e6
	.long	0x2612
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC69
	.byte	0
	.uleb128 0x30
	.quad	.LVL288
	.long	0x19a7
	.uleb128 0x2f
	.quad	.LVL290
	.long	0x62e6
	.long	0x2644
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC70
	.byte	0
	.uleb128 0x2f
	.quad	.LVL293
	.long	0x62e6
	.long	0x2669
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC71
	.byte	0
	.uleb128 0x2f
	.quad	.LVL294
	.long	0x62e6
	.long	0x268e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC72
	.byte	0
	.uleb128 0x2f
	.quad	.LVL295
	.long	0x62e6
	.long	0x26b3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC73
	.byte	0
	.uleb128 0x2f
	.quad	.LVL298
	.long	0x62e6
	.long	0x26d8
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC74
	.byte	0
	.uleb128 0x2f
	.quad	.LVL301
	.long	0x62e6
	.long	0x26fd
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC75
	.byte	0
	.uleb128 0x2f
	.quad	.LVL302
	.long	0x62e6
	.long	0x2722
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC76
	.byte	0
	.uleb128 0x2f
	.quad	.LVL307
	.long	0x62e6
	.long	0x2747
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC76
	.byte	0
	.uleb128 0x2f
	.quad	.LVL308
	.long	0x62e6
	.long	0x276c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC78
	.byte	0
	.uleb128 0x2f
	.quad	.LVL309
	.long	0x62e6
	.long	0x2791
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC77
	.byte	0
	.uleb128 0x2f
	.quad	.LVL312
	.long	0x62e6
	.long	0x27b6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC79
	.byte	0
	.uleb128 0x2f
	.quad	.LVL313
	.long	0x62e6
	.long	0x27db
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC80
	.byte	0
	.uleb128 0x2f
	.quad	.LVL316
	.long	0x62e6
	.long	0x2800
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC81
	.byte	0
	.uleb128 0x2f
	.quad	.LVL317
	.long	0x62f1
	.long	0x281f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC64
	.byte	0
	.uleb128 0x30
	.quad	.LVL318
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL319
	.long	0x61a6
	.long	0x2843
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL320
	.long	0x62e6
	.long	0x2868
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC82
	.byte	0
	.uleb128 0x2f
	.quad	.LVL323
	.long	0x62e6
	.long	0x288d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC83
	.byte	0
	.uleb128 0x2f
	.quad	.LVL326
	.long	0x62e6
	.long	0x28b2
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC84
	.byte	0
	.uleb128 0x2f
	.quad	.LVL329
	.long	0x62e6
	.long	0x28d7
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC84
	.byte	0
	.uleb128 0x2f
	.quad	.LVL330
	.long	0x62e6
	.long	0x28fc
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC85
	.byte	0
	.uleb128 0x30
	.quad	.LVL332
	.long	0x62a6
	.uleb128 0x2f
	.quad	.LVL334
	.long	0x62e6
	.long	0x292e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC86
	.byte	0
	.uleb128 0x30
	.quad	.LVL336
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL337
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL338
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL339
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL340
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL341
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL342
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL343
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL344
	.long	0x62b1
	.long	0x29ae
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL345
	.long	0x62b1
	.long	0x29c6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL346
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL347
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL348
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL349
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL350
	.long	0x6197
	.uleb128 0x30
	.quad	.LVL351
	.long	0x136f
	.uleb128 0x30
	.quad	.LVL352
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL353
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL354
	.long	0x615e
	.byte	0
	.uleb128 0x33
	.long	.LASF319
	.byte	0x1
	.value	0x559
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x2e5a
	.uleb128 0x2a
	.long	.LASF320
	.byte	0x1
	.value	0x559
	.long	0x104
	.long	.LLST40
	.uleb128 0x2e
	.string	"fp"
	.byte	0x1
	.value	0x55b
	.long	0x97a
	.long	.LLST41
	.uleb128 0x25
	.string	"buf"
	.byte	0x1
	.value	0x55c
	.long	0x2e5a
	.uleb128 0x2e
	.string	"cp"
	.byte	0x1
	.value	0x55d
	.long	0x104
	.long	.LLST42
	.uleb128 0x2e
	.string	"len"
	.byte	0x1
	.value	0x55e
	.long	0x53
	.long	.LLST43
	.uleb128 0x23
	.long	.LASF253
	.byte	0x1
	.value	0x55f
	.long	0x2e5a
	.uleb128 0x23
	.long	.LASF254
	.byte	0x1
	.value	0x560
	.long	0x5a
	.uleb128 0x23
	.long	.LASF255
	.byte	0x1
	.value	0x560
	.long	0x5a
	.uleb128 0x25
	.string	"tv"
	.byte	0x1
	.value	0x561
	.long	0x18e
	.uleb128 0x2f
	.quad	.LVL358
	.long	0x625f
	.long	0x2afb
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.byte	0x91
	.sleb128 -10432
	.byte	0x6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC29
	.byte	0
	.uleb128 0x2f
	.quad	.LVL360
	.long	0x61ea
	.long	0x2b19
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x73
	.sleb128 160
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL361
	.long	0x626b
	.long	0x2b3e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.value	0x1388
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL362
	.long	0x6277
	.long	0x2b5c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x23
	.byte	0
	.uleb128 0x2f
	.quad	.LVL363
	.long	0x6300
	.long	0x2b74
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL366
	.long	0x630c
	.long	0x2bab
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC90
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL367
	.long	0x630c
	.long	0x2bdc
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC91
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL369
	.long	0x631c
	.uleb128 0x2f
	.quad	.LVL370
	.long	0x6327
	.long	0x2c0e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC94
	.byte	0
	.uleb128 0x2f
	.quad	.LVL372
	.long	0x6333
	.long	0x2c27
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xa
	.value	0x12c0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL373
	.long	0x18d7
	.long	0x2c3f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL379
	.long	0x633f
	.uleb128 0x2f
	.quad	.LVL380
	.long	0x6153
	.long	0x2c7f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC92
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x91
	.sleb128 -10432
	.byte	0x6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL381
	.long	0x618b
	.long	0x2cad
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC93
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x91
	.sleb128 -10432
	.byte	0x6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL382
	.long	0x62c0
	.long	0x2cc5
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL386
	.long	0x631c
	.long	0x2ce6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0x91
	.sleb128 -10408
	.byte	0x6
	.byte	0
	.uleb128 0x30
	.quad	.LVL392
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL393
	.long	0x62b1
	.uleb128 0x30
	.quad	.LVL394
	.long	0x62cb
	.uleb128 0x30
	.quad	.LVL395
	.long	0x6200
	.uleb128 0x30
	.quad	.LVL396
	.long	0x617c
	.uleb128 0x30
	.quad	.LVL397
	.long	0x617c
	.uleb128 0x30
	.quad	.LVL398
	.long	0x617c
	.uleb128 0x30
	.quad	.LVL399
	.long	0x617c
	.uleb128 0x2f
	.quad	.LVL400
	.long	0x617c
	.long	0x2d69
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.byte	0x91
	.sleb128 -10440
	.byte	0x6
	.byte	0
	.uleb128 0x2f
	.quad	.LVL401
	.long	0x6153
	.long	0x2d8d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC95
	.byte	0
	.uleb128 0x2f
	.quad	.LVL402
	.long	0x618b
	.long	0x2dac
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC96
	.byte	0
	.uleb128 0x30
	.quad	.LVL403
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL404
	.long	0x61a6
	.long	0x2dd0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL405
	.long	0x62b1
	.uleb128 0x30
	.quad	.LVL406
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL407
	.long	0x62cb
	.uleb128 0x2f
	.quad	.LVL409
	.long	0x6153
	.long	0x2e21
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC89
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL410
	.long	0x62da
	.long	0x2e39
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL411
	.long	0x6197
	.uleb128 0x2b
	.quad	.LVL412
	.long	0x61a6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x10a
	.long	0x2e6b
	.uleb128 0x3b
	.long	0xc4
	.value	0x1387
	.byte	0
	.uleb128 0x29
	.long	.LASF321
	.byte	0x1
	.value	0x146
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x2f8c
	.uleb128 0x2d
	.long	.LASF172
	.byte	0x1
	.value	0x148
	.long	0x97a
	.long	.LLST44
	.uleb128 0x2d
	.long	.LASF322
	.byte	0x1
	.value	0x149
	.long	0x53
	.long	.LLST45
	.uleb128 0x2f
	.quad	.LVL413
	.long	0x62e6
	.long	0x2ec8
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC98
	.byte	0
	.uleb128 0x2f
	.quad	.LVL414
	.long	0x6153
	.long	0x2eec
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x35
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC99
	.byte	0
	.uleb128 0x2f
	.quad	.LVL415
	.long	0x625f
	.long	0x2f0b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC100
	.byte	0
	.uleb128 0x2f
	.quad	.LVL417
	.long	0x634b
	.long	0x2f2a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.value	0x180
	.byte	0
	.uleb128 0x2f
	.quad	.LVL418
	.long	0x6357
	.long	0x2f42
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL419
	.long	0x6363
	.long	0x2f5e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x3c
	.quad	.LVL421
	.long	0x636e
	.uleb128 0x34
	.quad	.LVL424
	.long	0x6153
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC101
	.byte	0
	.byte	0
	.uleb128 0x3a
	.long	.LASF323
	.byte	0x1
	.value	0x5e0
	.long	0x53
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x322d
	.uleb128 0x35
	.string	"tvP"
	.byte	0x1
	.value	0x5e0
	.long	0xd02
	.long	.LLST46
	.uleb128 0x2a
	.long	.LASF324
	.byte	0x1
	.value	0x5e0
	.long	0x53
	.long	.LLST47
	.uleb128 0x2e
	.string	"c"
	.byte	0x1
	.value	0x5e2
	.long	0xefb
	.long	.LLST48
	.uleb128 0x2d
	.long	.LASF245
	.byte	0x1
	.value	0x5e3
	.long	0xcdc
	.long	.LLST49
	.uleb128 0x2f
	.quad	.LVL428
	.long	0x6379
	.long	0x3004
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL430
	.long	0x6384
	.uleb128 0x2f
	.quad	.LVL431
	.long	0x61b2
	.long	0x302e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL437
	.long	0x6390
	.long	0x3046
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL443
	.long	0x6333
	.long	0x305f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xa
	.value	0x2d0
	.byte	0
	.uleb128 0x30
	.quad	.LVL444
	.long	0x6200
	.uleb128 0x2f
	.quad	.LVL445
	.long	0x6153
	.long	0x3090
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x34
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC103
	.byte	0
	.uleb128 0x2f
	.quad	.LVL446
	.long	0x6390
	.long	0x30a8
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL447
	.long	0x6153
	.long	0x30cc
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC104
	.byte	0
	.uleb128 0x30
	.quad	.LVL448
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL449
	.long	0x61a6
	.long	0x30f0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL450
	.long	0x6153
	.long	0x3114
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC105
	.byte	0
	.uleb128 0x30
	.quad	.LVL451
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL452
	.long	0x61a6
	.long	0x3138
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL453
	.long	0x617c
	.uleb128 0x2f
	.quad	.LVL454
	.long	0x616d
	.long	0x315d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL455
	.long	0x616d
	.uleb128 0x2f
	.quad	.LVL456
	.long	0x615e
	.long	0x3182
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL457
	.long	0x617c
	.uleb128 0x2f
	.quad	.LVL458
	.long	0x615e
	.long	0x31a7
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL459
	.long	0x617c
	.uleb128 0x30
	.quad	.LVL460
	.long	0x617c
	.uleb128 0x30
	.quad	.LVL461
	.long	0x6200
	.uleb128 0x2f
	.quad	.LVL462
	.long	0x615e
	.long	0x31e6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL463
	.long	0x616d
	.uleb128 0x2f
	.quad	.LVL464
	.long	0x615e
	.long	0x320b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL465
	.long	0x616d
	.uleb128 0x2b
	.quad	.LVL466
	.long	0x6200
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x3a
	.long	.LASF325
	.byte	0x1
	.value	0x75a
	.long	0x53
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x340c
	.uleb128 0x35
	.string	"c"
	.byte	0x1
	.value	0x75a
	.long	0xefb
	.long	.LLST50
	.uleb128 0x2d
	.long	.LASF293
	.byte	0x1
	.value	0x75c
	.long	0x53
	.long	.LLST51
	.uleb128 0x2e
	.string	"l"
	.byte	0x1
	.value	0x75d
	.long	0x5a
	.long	.LLST52
	.uleb128 0x30
	.quad	.LVL476
	.long	0x639b
	.uleb128 0x2f
	.quad	.LVL477
	.long	0x6153
	.long	0x32ac
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC107
	.byte	0
	.uleb128 0x30
	.quad	.LVL484
	.long	0x6200
	.uleb128 0x2f
	.quad	.LVL485
	.long	0x615e
	.long	0x32d3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -80
	.byte	0x6
	.byte	0
	.uleb128 0x2f
	.quad	.LVL486
	.long	0x615e
	.long	0x32ed
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -88
	.byte	0x6
	.byte	0
	.uleb128 0x2f
	.quad	.LVL487
	.long	0x616d
	.long	0x3307
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -96
	.byte	0x6
	.byte	0
	.uleb128 0x30
	.quad	.LVL488
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL489
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL490
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL491
	.long	0x6200
	.uleb128 0x30
	.quad	.LVL492
	.long	0x6200
	.uleb128 0x2f
	.quad	.LVL493
	.long	0x616d
	.long	0x3362
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -96
	.byte	0x6
	.byte	0
	.uleb128 0x30
	.quad	.LVL494
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL495
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL496
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL497
	.long	0x615e
	.long	0x33a3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0
	.uleb128 0x2f
	.quad	.LVL498
	.long	0x617c
	.long	0x33bd
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -88
	.byte	0x6
	.byte	0
	.uleb128 0x2f
	.quad	.LVL499
	.long	0x617c
	.long	0x33d7
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -80
	.byte	0x6
	.byte	0
	.uleb128 0x2f
	.quad	.LVL500
	.long	0x6200
	.long	0x33f1
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -96
	.byte	0x6
	.byte	0
	.uleb128 0x30
	.quad	.LVL501
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL502
	.long	0x615e
	.byte	0
	.uleb128 0x33
	.long	.LASF326
	.byte	0x1
	.value	0x5ba
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x35a1
	.uleb128 0x2d
	.long	.LASF294
	.byte	0x1
	.value	0x5bc
	.long	0x53
	.long	.LLST53
	.uleb128 0x25
	.string	"tv"
	.byte	0x1
	.value	0x5bd
	.long	0x18e
	.uleb128 0x3d
	.long	.Ldebug_ranges0+0
	.long	0x34ab
	.uleb128 0x2e
	.string	"ths"
	.byte	0x1
	.value	0x5cf
	.long	0xca7
	.long	.LLST54
	.uleb128 0x30
	.quad	.LVL513
	.long	0x63a6
	.uleb128 0x30
	.quad	.LVL514
	.long	0x63a6
	.uleb128 0x2f
	.quad	.LVL515
	.long	0x63b1
	.long	0x3490
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL521
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL522
	.long	0x616d
	.byte	0
	.uleb128 0x2f
	.quad	.LVL503
	.long	0x61ea
	.long	0x34c9
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL504
	.long	0x1489
	.long	0x34e1
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL506
	.long	0x63bc
	.uleb128 0x30
	.quad	.LVL507
	.long	0x63c7
	.uleb128 0x2f
	.quad	.LVL510
	.long	0x63d3
	.long	0x3515
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x91
	.sleb128 -168
	.byte	0x6
	.byte	0
	.uleb128 0x30
	.quad	.LVL516
	.long	0x63de
	.uleb128 0x30
	.quad	.LVL517
	.long	0x63e9
	.uleb128 0x30
	.quad	.LVL518
	.long	0x63c7
	.uleb128 0x30
	.quad	.LVL519
	.long	0x63c7
	.uleb128 0x30
	.quad	.LVL523
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL524
	.long	0x617c
	.long	0x356e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL525
	.long	0x615e
	.long	0x3586
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL526
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL527
	.long	0x616d
	.byte	0
	.uleb128 0x29
	.long	.LASF327
	.byte	0x1
	.value	0x100
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x362e
	.uleb128 0x35
	.string	"sig"
	.byte	0x1
	.value	0x100
	.long	0x53
	.long	.LLST55
	.uleb128 0x30
	.quad	.LVL530
	.long	0x340c
	.uleb128 0x2f
	.quad	.LVL531
	.long	0x6153
	.long	0x3600
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x35
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC110
	.byte	0
	.uleb128 0x30
	.quad	.LVL532
	.long	0x63f4
	.uleb128 0x30
	.quad	.LVL533
	.long	0x6197
	.uleb128 0x2b
	.quad	.LVL534
	.long	0x61a6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x3e
	.long	.LASF328
	.byte	0x1
	.byte	0xab
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x36bf
	.uleb128 0x37
	.string	"sig"
	.byte	0x1
	.byte	0xab
	.long	0x53
	.long	.LLST56
	.uleb128 0x30
	.quad	.LVL536
	.long	0x340c
	.uleb128 0x2f
	.quad	.LVL537
	.long	0x6153
	.long	0x3691
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x35
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC112
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL538
	.long	0x63f4
	.uleb128 0x30
	.quad	.LVL539
	.long	0x6197
	.uleb128 0x2b
	.quad	.LVL540
	.long	0x61a6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x3f
	.long	0xecb
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.long	0x372e
	.uleb128 0x40
	.long	0xed8
	.long	.LLST57
	.uleb128 0x41
	.long	0xee2
	.uleb128 0x6
	.byte	0xfa
	.long	0xee2
	.byte	0x9f
	.uleb128 0x42
	.long	0xeee
	.long	.LLST58
	.uleb128 0x2f
	.quad	.LVL545
	.long	0x616d
	.long	0x3713
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x23
	.uleb128 0x38
	.byte	0
	.uleb128 0x30
	.quad	.LVL546
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL547
	.long	0x616d
	.byte	0
	.uleb128 0x29
	.long	.LASF329
	.byte	0x1
	.value	0x7ff
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x386a
	.uleb128 0x35
	.string	"c"
	.byte	0x1
	.value	0x7ff
	.long	0xefb
	.long	.LLST59
	.uleb128 0x35
	.string	"tvP"
	.byte	0x1
	.value	0x7ff
	.long	0xd02
	.long	.LLST60
	.uleb128 0x30
	.quad	.LVL550
	.long	0x63a6
	.uleb128 0x30
	.quad	.LVL552
	.long	0x63d3
	.uleb128 0x2f
	.quad	.LVL553
	.long	0x36bf
	.long	0x37a5
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x43
	.long	0xee2
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x30
	.quad	.LVL554
	.long	0x63ff
	.uleb128 0x2f
	.quad	.LVL558
	.long	0x616d
	.long	0x37ca
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL559
	.long	0x6200
	.uleb128 0x2f
	.quad	.LVL560
	.long	0x6200
	.long	0x37ef
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL561
	.long	0x616d
	.uleb128 0x2f
	.quad	.LVL562
	.long	0x615e
	.long	0x3814
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL564
	.long	0x615e
	.long	0x382c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL565
	.long	0x615e
	.long	0x3844
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL566
	.long	0x617c
	.long	0x385c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL567
	.long	0x615e
	.byte	0
	.uleb128 0x29
	.long	.LASF330
	.byte	0x1
	.value	0x7cb
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x3b23
	.uleb128 0x35
	.string	"c"
	.byte	0x1
	.value	0x7cb
	.long	0xefb
	.long	.LLST61
	.uleb128 0x35
	.string	"tvP"
	.byte	0x1
	.value	0x7cb
	.long	0xd02
	.long	.LLST62
	.uleb128 0x23
	.long	.LASF245
	.byte	0x1
	.value	0x7cd
	.long	0xcdc
	.uleb128 0x30
	.quad	.LVL570
	.long	0x63ff
	.uleb128 0x30
	.quad	.LVL571
	.long	0x63a6
	.uleb128 0x2f
	.quad	.LVL572
	.long	0x640a
	.long	0x38e3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL573
	.long	0x61b2
	.long	0x3900
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL574
	.long	0x6153
	.long	0x3924
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC116
	.byte	0
	.uleb128 0x2f
	.quad	.LVL575
	.long	0x6416
	.long	0x395b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	linger_clear_connection
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa
	.value	0x1f4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x30
	.quad	.LVL581
	.long	0x63ff
	.uleb128 0x44
	.quad	.LVL584
	.long	0x372e
	.long	0x3988
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x2f
	.quad	.LVL585
	.long	0x616d
	.long	0x39a0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL586
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL587
	.long	0x616d
	.uleb128 0x2f
	.quad	.LVL588
	.long	0x6200
	.long	0x39d2
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL589
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL590
	.long	0x616d
	.uleb128 0x2f
	.quad	.LVL591
	.long	0x6153
	.long	0x3a10
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC117
	.byte	0
	.uleb128 0x30
	.quad	.LVL592
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL593
	.long	0x61a6
	.long	0x3a34
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL594
	.long	0x615e
	.long	0x3a4c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL596
	.long	0x615e
	.long	0x3a64
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL597
	.long	0x615e
	.long	0x3a7c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL598
	.long	0x6200
	.uleb128 0x30
	.quad	.LVL599
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL600
	.long	0x617c
	.long	0x3aae
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL601
	.long	0x615e
	.long	0x3ac6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL602
	.long	0x615e
	.long	0x3ade
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL603
	.long	0x615e
	.long	0x3af6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL604
	.long	0x617c
	.long	0x3b0e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2b
	.quad	.LVL605
	.long	0x617c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF331
	.byte	0x1
	.value	0x7c0
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x3b9a
	.uleb128 0x35
	.string	"c"
	.byte	0x1
	.value	0x7c0
	.long	0xefb
	.long	.LLST63
	.uleb128 0x35
	.string	"tvP"
	.byte	0x1
	.value	0x7c0
	.long	0xd02
	.long	.LLST64
	.uleb128 0x30
	.quad	.LVL608
	.long	0x6421
	.uleb128 0x44
	.quad	.LVL611
	.long	0x386a
	.long	0x3b8c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x30
	.quad	.LVL612
	.long	0x615e
	.byte	0
	.uleb128 0x29
	.long	.LASF332
	.byte	0x1
	.value	0x631
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x4054
	.uleb128 0x35
	.string	"c"
	.byte	0x1
	.value	0x631
	.long	0xefb
	.long	.LLST65
	.uleb128 0x35
	.string	"tvP"
	.byte	0x1
	.value	0x631
	.long	0xd02
	.long	.LLST66
	.uleb128 0x2e
	.string	"sz"
	.byte	0x1
	.value	0x633
	.long	0x53
	.long	.LLST67
	.uleb128 0x2d
	.long	.LASF245
	.byte	0x1
	.value	0x634
	.long	0xcdc
	.long	.LLST68
	.uleb128 0x2e
	.string	"hc"
	.byte	0x1
	.value	0x635
	.long	0xea4
	.long	.LLST69
	.uleb128 0x3d
	.long	.Ldebug_ranges0+0x30
	.long	0x3c52
	.uleb128 0x2d
	.long	.LASF281
	.byte	0x1
	.value	0x691
	.long	0x53
	.long	.LLST70
	.uleb128 0x30
	.quad	.LVL655
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL657
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL660
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL692
	.long	0x617c
	.byte	0
	.uleb128 0x2f
	.quad	.LVL617
	.long	0x642c
	.long	0x3c8b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.value	0x190
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC62
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x9
	.byte	0x3
	.quad	.LC62
	.byte	0
	.uleb128 0x44
	.quad	.LVL622
	.long	0x3b23
	.long	0x3cab
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x2f
	.quad	.LVL623
	.long	0x6437
	.long	0x3cca
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x77
	.sleb128 0
	.byte	0x6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL624
	.long	0x6443
	.uleb128 0x2f
	.quad	.LVL626
	.long	0x644f
	.long	0x3cef
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL627
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL628
	.long	0x61f5
	.uleb128 0x30
	.quad	.LVL635
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL636
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL637
	.long	0x645a
	.long	0x3d3b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL638
	.long	0x322d
	.long	0x3d53
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL639
	.long	0x6465
	.long	0x3d71
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL641
	.long	0x63a6
	.uleb128 0x44
	.quad	.LVL646
	.long	0x61b2
	.long	0x3d9c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL647
	.long	0x642c
	.long	0x3dc8
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.value	0x1f7
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC62
	.byte	0
	.uleb128 0x2f
	.quad	.LVL648
	.long	0x616d
	.long	0x3de0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL649
	.long	0x616d
	.uleb128 0x2f
	.quad	.LVL650
	.long	0x617c
	.long	0x3e06
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x76
	.sleb128 128
	.byte	0
	.uleb128 0x30
	.quad	.LVL654
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL656
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL658
	.long	0x617c
	.uleb128 0x2f
	.quad	.LVL659
	.long	0x615e
	.long	0x3e46
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x76
	.sleb128 136
	.byte	0
	.uleb128 0x30
	.quad	.LVL661
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL662
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL663
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL664
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL665
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL666
	.long	0x615e
	.long	0x3e9f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL667
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL668
	.long	0x615e
	.long	0x3ec4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL669
	.long	0x615e
	.long	0x3edc
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL670
	.long	0x615e
	.long	0x3ef4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL671
	.long	0x615e
	.long	0x3f0c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL672
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL673
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL674
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL675
	.long	0x615e
	.long	0x3f4b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL676
	.long	0x617c
	.uleb128 0x30
	.quad	.LVL677
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL678
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL679
	.long	0x616d
	.uleb128 0x2f
	.quad	.LVL680
	.long	0x6200
	.long	0x3f97
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL681
	.long	0x617c
	.uleb128 0x2f
	.quad	.LVL682
	.long	0x615e
	.long	0x3fbc
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL683
	.long	0x617c
	.uleb128 0x2f
	.quad	.LVL684
	.long	0x616d
	.long	0x3fe1
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL685
	.long	0x615e
	.long	0x3ffa
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x73
	.sleb128 712
	.byte	0
	.uleb128 0x30
	.quad	.LVL686
	.long	0x617c
	.uleb128 0x30
	.quad	.LVL687
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL688
	.long	0x617c
	.uleb128 0x30
	.quad	.LVL689
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL690
	.long	0x616d
	.long	0x4046
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL691
	.long	0x615e
	.byte	0
	.uleb128 0x29
	.long	.LASF333
	.byte	0x1
	.value	0x813
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x4237
	.uleb128 0x2a
	.long	.LASF245
	.byte	0x1
	.value	0x813
	.long	0xcdc
	.long	.LLST71
	.uleb128 0x2a
	.long	.LASF292
	.byte	0x1
	.value	0x813
	.long	0xd02
	.long	.LLST72
	.uleb128 0x2d
	.long	.LASF294
	.byte	0x1
	.value	0x815
	.long	0x53
	.long	.LLST73
	.uleb128 0x2e
	.string	"c"
	.byte	0x1
	.value	0x816
	.long	0xefb
	.long	.LLST74
	.uleb128 0x30
	.quad	.LVL701
	.long	0x6470
	.uleb128 0x2f
	.quad	.LVL702
	.long	0x6153
	.long	0x40e1
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x36
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC121
	.byte	0
	.uleb128 0x2f
	.quad	.LVL704
	.long	0x642c
	.long	0x4114
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.value	0x198
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC62
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x9
	.byte	0x3
	.quad	.LC62
	.byte	0
	.uleb128 0x2f
	.quad	.LVL705
	.long	0x3b23
	.long	0x4132
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL711
	.long	0x6470
	.uleb128 0x2f
	.quad	.LVL712
	.long	0x6153
	.long	0x4163
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x36
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC122
	.byte	0
	.uleb128 0x2f
	.quad	.LVL713
	.long	0x386a
	.long	0x4181
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL716
	.long	0x616d
	.long	0x4199
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL717
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL718
	.long	0x615e
	.long	0x41be
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL719
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL720
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL721
	.long	0x615e
	.long	0x41f0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL722
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL724
	.long	0x615e
	.long	0x4215
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL725
	.long	0x615e
	.uleb128 0x2b
	.quad	.LVL727
	.long	0x615e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x33
	.long	.LASF334
	.byte	0x1
	.value	0x6ab
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x4804
	.uleb128 0x35
	.string	"c"
	.byte	0x1
	.value	0x6ab
	.long	0xefb
	.long	.LLST75
	.uleb128 0x35
	.string	"tvP"
	.byte	0x1
	.value	0x6ab
	.long	0xd02
	.long	.LLST76
	.uleb128 0x2d
	.long	.LASF335
	.byte	0x1
	.value	0x6ad
	.long	0x153
	.long	.LLST77
	.uleb128 0x2e
	.string	"sz"
	.byte	0x1
	.value	0x6ae
	.long	0x53
	.long	.LLST78
	.uleb128 0x2d
	.long	.LASF336
	.byte	0x1
	.value	0x6ae
	.long	0x53
	.long	.LLST79
	.uleb128 0x23
	.long	.LASF245
	.byte	0x1
	.value	0x6af
	.long	0xcdc
	.uleb128 0x2d
	.long	.LASF337
	.byte	0x1
	.value	0x6b0
	.long	0x148
	.long	.LLST80
	.uleb128 0x2e
	.string	"hc"
	.byte	0x1
	.value	0x6b1
	.long	0xea4
	.long	.LLST81
	.uleb128 0x2d
	.long	.LASF281
	.byte	0x1
	.value	0x6b2
	.long	0x53
	.long	.LLST82
	.uleb128 0x3d
	.long	.Ldebug_ranges0+0x80
	.long	0x436f
	.uleb128 0x25
	.string	"iv"
	.byte	0x1
	.value	0x6c6
	.long	0x4804
	.uleb128 0x2f
	.quad	.LVL745
	.long	0x647c
	.long	0x430e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0x2f
	.quad	.LVL779
	.long	0x615e
	.long	0x4326
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL782
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL783
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL803
	.long	0x616d
	.long	0x435a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -192
	.byte	0x6
	.byte	0
	.uleb128 0x2b
	.quad	.LVL807
	.long	0x615e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x3d
	.long	.Ldebug_ranges0+0xf0
	.long	0x43b0
	.uleb128 0x2d
	.long	.LASF338
	.byte	0x1
	.value	0x70b
	.long	0x53
	.long	.LLST83
	.uleb128 0x2f
	.quad	.LVL762
	.long	0x6487
	.long	0x43a2
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x91
	.sleb128 -176
	.byte	0x6
	.byte	0
	.uleb128 0x30
	.quad	.LVL778
	.long	0x615e
	.byte	0
	.uleb128 0x30
	.quad	.LVL734
	.long	0x6492
	.uleb128 0x2f
	.quad	.LVL743
	.long	0x6200
	.long	0x43d5
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL748
	.long	0x61f5
	.uleb128 0x2f
	.quad	.LVL749
	.long	0x6153
	.long	0x4406
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC127
	.byte	0
	.uleb128 0x2f
	.quad	.LVL750
	.long	0x386a
	.long	0x4426
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x91
	.sleb128 -200
	.byte	0x6
	.byte	0
	.uleb128 0x30
	.quad	.LVL751
	.long	0x63a6
	.uleb128 0x2f
	.quad	.LVL752
	.long	0x6153
	.long	0x4457
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC125
	.byte	0
	.uleb128 0x2f
	.quad	.LVL753
	.long	0x6416
	.long	0x4489
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -200
	.byte	0x6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	wakeup_connection
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL765
	.long	0x616d
	.long	0x44a3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -192
	.byte	0x6
	.byte	0
	.uleb128 0x30
	.quad	.LVL766
	.long	0x63a6
	.uleb128 0x2f
	.quad	.LVL768
	.long	0x6153
	.long	0x44d4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC125
	.byte	0
	.uleb128 0x2f
	.quad	.LVL769
	.long	0x6416
	.long	0x4506
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -200
	.byte	0x6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	wakeup_connection
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL770
	.long	0x617c
	.long	0x451e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL771
	.long	0x3b23
	.long	0x453e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x91
	.sleb128 -200
	.byte	0x6
	.byte	0
	.uleb128 0x2f
	.quad	.LVL780
	.long	0x616d
	.long	0x4558
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -192
	.byte	0x6
	.byte	0
	.uleb128 0x30
	.quad	.LVL781
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL784
	.long	0x615e
	.long	0x457f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -200
	.byte	0x6
	.byte	0
	.uleb128 0x30
	.quad	.LVL785
	.long	0x617c
	.uleb128 0x2f
	.quad	.LVL786
	.long	0x615e
	.long	0x45a4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL787
	.long	0x616d
	.uleb128 0x2f
	.quad	.LVL788
	.long	0x6200
	.long	0x45c9
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL789
	.long	0x615e
	.long	0x45e1
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL790
	.long	0x615e
	.long	0x45fb
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -184
	.byte	0x6
	.byte	0
	.uleb128 0x30
	.quad	.LVL791
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL792
	.long	0x615e
	.long	0x4620
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL793
	.long	0x615e
	.long	0x4638
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL794
	.long	0x615e
	.long	0x4650
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL795
	.long	0x615e
	.long	0x4668
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL796
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL797
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL798
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL799
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL800
	.long	0x615e
	.long	0x46b4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL801
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL802
	.long	0x616d
	.long	0x46db
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -192
	.byte	0x6
	.byte	0
	.uleb128 0x2f
	.quad	.LVL804
	.long	0x615e
	.long	0x46f3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL805
	.long	0x615e
	.long	0x470b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL806
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL808
	.long	0x615e
	.long	0x4730
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL809
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL810
	.long	0x615e
	.long	0x4757
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -184
	.byte	0x6
	.byte	0
	.uleb128 0x2f
	.quad	.LVL811
	.long	0x6153
	.long	0x477b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC126
	.byte	0
	.uleb128 0x30
	.quad	.LVL812
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL813
	.long	0x61a6
	.long	0x479f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL814
	.long	0x615e
	.long	0x47b7
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL815
	.long	0x617c
	.long	0x47cf
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL816
	.long	0x615e
	.long	0x47e9
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -184
	.byte	0x6
	.byte	0
	.uleb128 0x30
	.quad	.LVL817
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL818
	.long	0x615e
	.byte	0
	.uleb128 0xc
	.long	0x2b9
	.long	0x4814
	.uleb128 0xd
	.long	0xc4
	.byte	0x1
	.byte	0
	.uleb128 0x29
	.long	.LASF339
	.byte	0x1
	.value	0x846
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0x489e
	.uleb128 0x32
	.long	.LASF245
	.byte	0x1
	.value	0x846
	.long	0xcdc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2a
	.long	.LASF292
	.byte	0x1
	.value	0x846
	.long	0xd02
	.long	.LLST84
	.uleb128 0x2e
	.string	"c"
	.byte	0x1
	.value	0x848
	.long	0xefb
	.long	.LLST85
	.uleb128 0x2f
	.quad	.LVL821
	.long	0x372e
	.long	0x4878
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x2f
	.quad	.LVL823
	.long	0x615e
	.long	0x4890
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL825
	.long	0x617c
	.byte	0
	.uleb128 0x33
	.long	.LASF340
	.byte	0x1
	.value	0x749
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x4966
	.uleb128 0x35
	.string	"c"
	.byte	0x1
	.value	0x749
	.long	0xefb
	.long	.LLST86
	.uleb128 0x35
	.string	"tvP"
	.byte	0x1
	.value	0x749
	.long	0xd02
	.long	.LLST87
	.uleb128 0x25
	.string	"buf"
	.byte	0x1
	.value	0x74b
	.long	0x4966
	.uleb128 0x2e
	.string	"r"
	.byte	0x1
	.value	0x74c
	.long	0x53
	.long	.LLST88
	.uleb128 0x2f
	.quad	.LVL828
	.long	0x6443
	.long	0x4913
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa
	.value	0x1000
	.byte	0
	.uleb128 0x30
	.quad	.LVL833
	.long	0x61f5
	.uleb128 0x2f
	.quad	.LVL834
	.long	0x372e
	.long	0x493e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL835
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL836
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL841
	.long	0x615e
	.byte	0
	.uleb128 0xc
	.long	0x10a
	.long	0x4977
	.uleb128 0x3b
	.long	0xc4
	.value	0xfff
	.byte	0
	.uleb128 0x45
	.long	0xf01
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x4c98
	.uleb128 0x40
	.long	0xf0e
	.long	.LLST89
	.uleb128 0x40
	.long	0xf26
	.long	.LLST90
	.uleb128 0x40
	.long	0xf32
	.long	.LLST91
	.uleb128 0x40
	.long	0xf4a
	.long	.LLST92
	.uleb128 0x46
	.long	0xf56
	.uleb128 0x46
	.long	0xf62
	.uleb128 0x42
	.long	0xf6e
	.long	.LLST93
	.uleb128 0x46
	.long	0xf7a
	.uleb128 0x42
	.long	0xf85
	.long	.LLST94
	.uleb128 0x42
	.long	0xf91
	.long	.LLST95
	.uleb128 0x42
	.long	0xf9d
	.long	.LLST96
	.uleb128 0x40
	.long	0xf3e
	.long	.LLST97
	.uleb128 0x40
	.long	0xf1a
	.long	.LLST97
	.uleb128 0x2f
	.quad	.LVL845
	.long	0x649e
	.long	0x4a20
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -328
	.byte	0x6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL846
	.long	0x64a9
	.long	0x4a4a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x3a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC133
	.byte	0
	.uleb128 0x2f
	.quad	.LVL847
	.long	0x64b5
	.long	0x4a70
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x91
	.sleb128 -328
	.byte	0x6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 32
	.byte	0
	.uleb128 0x2f
	.quad	.LVL859
	.long	0x649e
	.long	0x4a95
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -336
	.byte	0x6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x80
	.byte	0
	.uleb128 0x2f
	.quad	.LVL860
	.long	0x6487
	.long	0x4aaf
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -336
	.byte	0x6
	.byte	0
	.uleb128 0x2f
	.quad	.LVL862
	.long	0x649e
	.long	0x4ad4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -344
	.byte	0x6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x80
	.byte	0
	.uleb128 0x2f
	.quad	.LVL863
	.long	0x6487
	.long	0x4aee
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -344
	.byte	0x6
	.byte	0
	.uleb128 0x30
	.quad	.LVL864
	.long	0x64c1
	.uleb128 0x2f
	.quad	.LVL869
	.long	0x6200
	.long	0x4b13
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL875
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL876
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL877
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL878
	.long	0x64cd
	.long	0x4b52
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL879
	.long	0x6153
	.long	0x4b76
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC134
	.byte	0
	.uleb128 0x2f
	.quad	.LVL880
	.long	0x64cd
	.long	0x4b8e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL881
	.long	0x618b
	.long	0x4bad
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC135
	.byte	0
	.uleb128 0x30
	.quad	.LVL882
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL883
	.long	0x61a6
	.long	0x4bd1
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL884
	.long	0x6200
	.long	0x4be9
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL885
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL886
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL887
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL888
	.long	0x6153
	.long	0x4c3a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC136
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x80
	.byte	0
	.uleb128 0x30
	.quad	.LVL889
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL890
	.long	0x61a6
	.long	0x4c5e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL891
	.long	0x6200
	.long	0x4c76
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL892
	.long	0x616d
	.uleb128 0x2b
	.quad	.LVL893
	.long	0x6200
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x47
	.long	.LASF507
	.byte	0x1
	.value	0x160
	.long	0x53
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x5ce2
	.uleb128 0x2a
	.long	.LASF316
	.byte	0x1
	.value	0x160
	.long	0x53
	.long	.LLST99
	.uleb128 0x2a
	.long	.LASF317
	.byte	0x1
	.value	0x160
	.long	0x4cb
	.long	.LLST100
	.uleb128 0x2e
	.string	"cp"
	.byte	0x1
	.value	0x162
	.long	0x104
	.long	.LLST101
	.uleb128 0x2e
	.string	"pwd"
	.byte	0x1
	.value	0x163
	.long	0x5ce2
	.long	.LLST102
	.uleb128 0x2e
	.string	"uid"
	.byte	0x1
	.value	0x164
	.long	0x127
	.long	.LLST103
	.uleb128 0x2e
	.string	"gid"
	.byte	0x1
	.value	0x165
	.long	0x11c
	.long	.LLST104
	.uleb128 0x25
	.string	"cwd"
	.byte	0x1
	.value	0x166
	.long	0x5ce8
	.uleb128 0x2d
	.long	.LASF172
	.byte	0x1
	.value	0x167
	.long	0x97a
	.long	.LLST105
	.uleb128 0x2d
	.long	.LASF322
	.byte	0x1
	.value	0x168
	.long	0x53
	.long	.LLST106
	.uleb128 0x2d
	.long	.LASF341
	.byte	0x1
	.value	0x169
	.long	0x53
	.long	.LLST107
	.uleb128 0x2d
	.long	.LASF294
	.byte	0x1
	.value	0x16a
	.long	0x53
	.long	.LLST108
	.uleb128 0x2e
	.string	"c"
	.byte	0x1
	.value	0x16b
	.long	0xefb
	.long	.LLST109
	.uleb128 0x2e
	.string	"hc"
	.byte	0x1
	.value	0x16c
	.long	0xea4
	.long	.LLST110
	.uleb128 0x25
	.string	"sa4"
	.byte	0x1
	.value	0x16d
	.long	0x876
	.uleb128 0x25
	.string	"sa6"
	.byte	0x1
	.value	0x16e
	.long	0x876
	.uleb128 0x23
	.long	.LASF342
	.byte	0x1
	.value	0x16f
	.long	0x53
	.uleb128 0x23
	.long	.LASF343
	.byte	0x1
	.value	0x16f
	.long	0x53
	.uleb128 0x25
	.string	"tv"
	.byte	0x1
	.value	0x170
	.long	0x18e
	.uleb128 0x48
	.long	.LASF478
	.byte	0x1
	.value	0x262
	.long	0x53
	.long	0x4dcf
	.uleb128 0x49
	.byte	0
	.uleb128 0x3d
	.long	.Ldebug_ranges0+0x130
	.long	0x4e96
	.uleb128 0x2d
	.long	.LASF344
	.byte	0x1
	.value	0x218
	.long	0x97a
	.long	.LLST111
	.uleb128 0x2f
	.quad	.LVL919
	.long	0x625f
	.long	0x4e07
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC152
	.byte	0
	.uleb128 0x30
	.quad	.LVL921
	.long	0x64d9
	.uleb128 0x2f
	.quad	.LVL922
	.long	0x618b
	.long	0x4e39
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC153
	.byte	0
	.uleb128 0x2f
	.quad	.LVL923
	.long	0x62c0
	.long	0x4e51
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1041
	.long	0x6153
	.long	0x4e75
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC89
	.byte	0
	.uleb128 0x30
	.quad	.LVL1042
	.long	0x6197
	.uleb128 0x2b
	.quad	.LVL1043
	.long	0x61a6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL897
	.long	0x64e5
	.long	0x4eb4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x2f
	.byte	0
	.uleb128 0x2f
	.quad	.LVL899
	.long	0x64f1
	.long	0x4ed6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x39
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x48
	.byte	0
	.uleb128 0x2f
	.quad	.LVL901
	.long	0x24b4
	.long	0x4ef5
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x30
	.quad	.LVL902
	.long	0x64fc
	.uleb128 0x2f
	.quad	.LVL903
	.long	0x4977
	.long	0x4f2e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x73
	.sleb128 -192
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x73
	.sleb128 -128
	.byte	0
	.uleb128 0x30
	.quad	.LVL904
	.long	0x2a3c
	.uleb128 0x30
	.quad	.LVL905
	.long	0x6508
	.uleb128 0x2f
	.quad	.LVL908
	.long	0x62e6
	.long	0x4f6d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC143
	.byte	0
	.uleb128 0x2f
	.quad	.LVL909
	.long	0x62e6
	.long	0x4f92
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC98
	.byte	0
	.uleb128 0x30
	.quad	.LVL911
	.long	0x6231
	.uleb128 0x2f
	.quad	.LVL912
	.long	0x6514
	.long	0x4fbe
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.value	0x1000
	.byte	0
	.uleb128 0x2f
	.quad	.LVL913
	.long	0x6300
	.long	0x4fd6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL914
	.long	0x6520
	.long	0x4ffa
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC150
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0x30
	.quad	.LVL915
	.long	0x62c0
	.uleb128 0x30
	.quad	.LVL916
	.long	0x62c0
	.uleb128 0x30
	.quad	.LVL917
	.long	0x62c0
	.uleb128 0x2f
	.quad	.LVL918
	.long	0x652f
	.long	0x503d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL924
	.long	0x653b
	.uleb128 0x30
	.quad	.LVL925
	.long	0x6231
	.uleb128 0x2f
	.quad	.LVL926
	.long	0x6546
	.long	0x507b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	handle_term
	.byte	0
	.uleb128 0x2f
	.quad	.LVL927
	.long	0x6546
	.long	0x509f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	handle_term
	.byte	0
	.uleb128 0x2f
	.quad	.LVL928
	.long	0x6546
	.long	0x50c3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x41
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	handle_chld
	.byte	0
	.uleb128 0x2f
	.quad	.LVL929
	.long	0x6546
	.long	0x50df
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL930
	.long	0x6546
	.long	0x5103
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	handle_hup
	.byte	0
	.uleb128 0x2f
	.quad	.LVL931
	.long	0x6546
	.long	0x5127
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	handle_usr1
	.byte	0
	.uleb128 0x2f
	.quad	.LVL932
	.long	0x6546
	.long	0x514b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	handle_usr2
	.byte	0
	.uleb128 0x2f
	.quad	.LVL933
	.long	0x6546
	.long	0x516f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	handle_alrm
	.byte	0
	.uleb128 0x2f
	.quad	.LVL934
	.long	0x6225
	.long	0x5188
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xa
	.value	0x168
	.byte	0
	.uleb128 0x30
	.quad	.LVL935
	.long	0x6552
	.uleb128 0x30
	.quad	.LVL937
	.long	0x655d
	.uleb128 0x2f
	.quad	.LVL939
	.long	0x6416
	.long	0x51d4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	occasional
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0xc
	.long	0x1d4c0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL940
	.long	0x6416
	.long	0x5204
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	idle
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa
	.value	0x1388
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL941
	.long	0x6416
	.long	0x5234
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	update_throttles
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa
	.value	0x7d0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL942
	.long	0x6416
	.long	0x5266
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	show_stats
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0xc
	.long	0x36ee80
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL943
	.long	0x6568
	.long	0x527d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x30
	.quad	.LVL944
	.long	0x6508
	.uleb128 0x2f
	.quad	.LVL945
	.long	0x6333
	.long	0x52a2
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL951
	.long	0x61b2
	.long	0x52be
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL952
	.long	0x61b2
	.long	0x52da
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL953
	.long	0x6573
	.long	0x52f2
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL954
	.long	0x657e
	.long	0x530a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL955
	.long	0x6589
	.uleb128 0x2f
	.quad	.LVL957
	.long	0x6573
	.long	0x532f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL958
	.long	0x6594
	.uleb128 0x30
	.quad	.LVL959
	.long	0x6594
	.uleb128 0x30
	.quad	.LVL961
	.long	0x659f
	.uleb128 0x30
	.quad	.LVL965
	.long	0x6594
	.uleb128 0x2f
	.quad	.LVL966
	.long	0x3b9a
	.long	0x5381
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL970
	.long	0x61f5
	.uleb128 0x30
	.quad	.LVL972
	.long	0x6153
	.uleb128 0x30
	.quad	.LVL973
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL974
	.long	0x61a6
	.long	0x53bf
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL975
	.long	0x65aa
	.uleb128 0x30
	.quad	.LVL977
	.long	0x65b6
	.uleb128 0x2f
	.quad	.LVL983
	.long	0x6153
	.long	0x53fd
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC139
	.byte	0
	.uleb128 0x2f
	.quad	.LVL984
	.long	0x618b
	.long	0x541c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC140
	.byte	0
	.uleb128 0x30
	.quad	.LVL985
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL986
	.long	0x61a6
	.long	0x5440
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL987
	.long	0x65c1
	.long	0x545c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL988
	.long	0x65cc
	.long	0x5476
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x77
	.sleb128 0
	.byte	0x94
	.byte	0x4
	.byte	0
	.uleb128 0x2f
	.quad	.LVL989
	.long	0x65d8
	.long	0x5490
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x77
	.sleb128 0
	.byte	0x94
	.byte	0x4
	.byte	0
	.uleb128 0x2f
	.quad	.LVL990
	.long	0x65e3
	.long	0x54ab
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.byte	0x91
	.sleb128 -4780
	.byte	0x94
	.byte	0x4
	.byte	0
	.uleb128 0x2f
	.quad	.LVL991
	.long	0x6153
	.long	0x54cf
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x34
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC170
	.byte	0
	.uleb128 0x2f
	.quad	.LVL992
	.long	0x6153
	.long	0x54e6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0x30
	.quad	.LVL993
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL994
	.long	0x61a6
	.long	0x550a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL995
	.long	0x386a
	.long	0x5528
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL996
	.long	0x4237
	.long	0x5546
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL997
	.long	0x489e
	.long	0x5564
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL999
	.long	0x6390
	.long	0x557c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL1000
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL1001
	.long	0x63a6
	.uleb128 0x30
	.quad	.LVL1002
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL1003
	.long	0x63a6
	.uleb128 0x30
	.quad	.LVL1004
	.long	0x65ef
	.uleb128 0x30
	.quad	.LVL1006
	.long	0x2e6b
	.uleb128 0x2f
	.quad	.LVL1008
	.long	0x6390
	.long	0x55e2
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1010
	.long	0x65fa
	.long	0x55fa
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1011
	.long	0x62e6
	.long	0x561f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC98
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1012
	.long	0x6300
	.long	0x5637
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1013
	.long	0x6606
	.long	0x565d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x91
	.sleb128 -4776
	.byte	0x6
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1014
	.long	0x6153
	.long	0x5681
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x34
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC156
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1015
	.long	0x618b
	.long	0x56a0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC157
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1016
	.long	0x6520
	.long	0x56ca
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC150
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1017
	.long	0x6231
	.long	0x56e2
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1018
	.long	0x6153
	.long	0x5706
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC158
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1019
	.long	0x62da
	.long	0x5725
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC159
	.byte	0
	.uleb128 0x30
	.quad	.LVL1020
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL1021
	.long	0x61a6
	.long	0x5749
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1022
	.long	0x625f
	.long	0x576e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC100
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1024
	.long	0x634b
	.long	0x578d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.value	0x180
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1026
	.long	0x62b1
	.long	0x57a5
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1027
	.long	0x6153
	.long	0x57c9
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x34
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC144
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1028
	.long	0x618b
	.long	0x57e8
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC145
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1029
	.long	0x6357
	.long	0x5800
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1030
	.long	0x6363
	.long	0x581c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL1031
	.long	0x6508
	.uleb128 0x2f
	.quad	.LVL1032
	.long	0x6357
	.long	0x5841
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1033
	.long	0x6611
	.long	0x5864
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0x91
	.sleb128 -4780
	.byte	0x94
	.byte	0x4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x77
	.sleb128 0
	.byte	0x94
	.byte	0x4
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1034
	.long	0x6153
	.long	0x5888
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x34
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC146
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1035
	.long	0x62da
	.long	0x58a7
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC147
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1036
	.long	0x6153
	.long	0x58cb
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC148
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1037
	.long	0x62da
	.long	0x58ea
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC149
	.byte	0
	.uleb128 0x30
	.quad	.LVL1038
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL1039
	.long	0x61a6
	.long	0x590e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1044
	.long	0x6153
	.long	0x5932
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC160
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1045
	.long	0x62da
	.long	0x5951
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC161
	.byte	0
	.uleb128 0x30
	.quad	.LVL1046
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL1047
	.long	0x61a6
	.long	0x5975
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1048
	.long	0x631c
	.long	0x599a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x7e
	.sleb128 0
	.byte	0x91
	.sleb128 -4776
	.byte	0x6
	.byte	0x22
	.byte	0x31
	.byte	0x1c
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1050
	.long	0x2f8c
	.long	0x59b2
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1051
	.long	0x2f8c
	.long	0x59ca
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1054
	.long	0x6153
	.long	0x59f4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC89
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL1055
	.long	0x62da
	.uleb128 0x30
	.quad	.LVL1056
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL1057
	.long	0x61a6
	.long	0x5a25
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL1058
	.long	0x340c
	.uleb128 0x2f
	.quad	.LVL1059
	.long	0x6153
	.long	0x5a56
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x35
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC110
	.byte	0
	.uleb128 0x30
	.quad	.LVL1060
	.long	0x63f4
	.uleb128 0x30
	.quad	.LVL1061
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL1062
	.long	0x61a6
	.long	0x5a87
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1063
	.long	0x6153
	.long	0x5aab
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC155
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1064
	.long	0x62da
	.long	0x5aca
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC34
	.byte	0
	.uleb128 0x30
	.quad	.LVL1065
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL1066
	.long	0x61a6
	.long	0x5aee
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1067
	.long	0x6153
	.long	0x5b12
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC141
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1068
	.long	0x618b
	.long	0x5b31
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC142
	.byte	0
	.uleb128 0x30
	.quad	.LVL1069
	.long	0x6197
	.uleb128 0x2f
	.quad	.LVL1070
	.long	0x61a6
	.long	0x5b55
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL1071
	.long	0x6153
	.long	0x5b79
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x34
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC168
	.byte	0
	.uleb128 0x30
	.quad	.LVL1076
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL1077
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL1078
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL1079
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL1080
	.long	0x6200
	.uleb128 0x30
	.quad	.LVL1081
	.long	0x617c
	.uleb128 0x30
	.quad	.LVL1082
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL1083
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL1084
	.long	0x616d
	.long	0x5bf9
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL1085
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL1086
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL1087
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL1088
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL1089
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL1090
	.long	0x62b1
	.uleb128 0x30
	.quad	.LVL1091
	.long	0x615e
	.uleb128 0x2f
	.quad	.LVL1092
	.long	0x615e
	.long	0x5c6c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL1093
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL1094
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL1095
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL1096
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL1097
	.long	0x615e
	.uleb128 0x30
	.quad	.LVL1098
	.long	0x6200
	.uleb128 0x30
	.quad	.LVL1099
	.long	0x6200
	.uleb128 0x30
	.quad	.LVL1100
	.long	0x616d
	.uleb128 0x30
	.quad	.LVL1101
	.long	0x615e
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2de
	.uleb128 0xc
	.long	0x10a
	.long	0x5cf9
	.uleb128 0x3b
	.long	0xc4
	.value	0x1000
	.byte	0
	.uleb128 0x4a
	.long	.LASF345
	.byte	0x1
	.byte	0x43
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	argv0
	.uleb128 0x4a
	.long	.LASF346
	.byte	0x1
	.byte	0x44
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	debug
	.uleb128 0x4a
	.long	.LASF163
	.byte	0x1
	.byte	0x45
	.long	0x30
	.uleb128 0x9
	.byte	0x3
	.quad	port
	.uleb128 0x4b
	.string	"dir"
	.byte	0x1
	.byte	0x46
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	dir
	.uleb128 0x4a
	.long	.LASF347
	.byte	0x1
	.byte	0x47
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	data_dir
	.uleb128 0x4a
	.long	.LASF348
	.byte	0x1
	.byte	0x48
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	do_chroot
	.uleb128 0x4a
	.long	.LASF171
	.byte	0x1
	.byte	0x48
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	no_log
	.uleb128 0x4a
	.long	.LASF173
	.byte	0x1
	.byte	0x48
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	no_symlink_check
	.uleb128 0x4a
	.long	.LASF349
	.byte	0x1
	.byte	0x48
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	do_vhost
	.uleb128 0x4a
	.long	.LASF350
	.byte	0x1
	.byte	0x48
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	do_global_passwd
	.uleb128 0x4a
	.long	.LASF164
	.byte	0x1
	.byte	0x49
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	cgi_pattern
	.uleb128 0x4a
	.long	.LASF165
	.byte	0x1
	.byte	0x4a
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	cgi_limit
	.uleb128 0x4a
	.long	.LASF176
	.byte	0x1
	.byte	0x4b
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	url_pattern
	.uleb128 0x4a
	.long	.LASF178
	.byte	0x1
	.byte	0x4c
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	no_empty_referers
	.uleb128 0x4a
	.long	.LASF177
	.byte	0x1
	.byte	0x4d
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	local_pattern
	.uleb128 0x4a
	.long	.LASF351
	.byte	0x1
	.byte	0x4e
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	logfile
	.uleb128 0x4a
	.long	.LASF320
	.byte	0x1
	.byte	0x4f
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	throttlefile
	.uleb128 0x4a
	.long	.LASF229
	.byte	0x1
	.byte	0x50
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	hostname
	.uleb128 0x4a
	.long	.LASF352
	.byte	0x1
	.byte	0x51
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	pidfile
	.uleb128 0x4a
	.long	.LASF353
	.byte	0x1
	.byte	0x52
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	user
	.uleb128 0x4a
	.long	.LASF167
	.byte	0x1
	.byte	0x53
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	charset
	.uleb128 0x4b
	.string	"p3p"
	.byte	0x1
	.byte	0x54
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	p3p
	.uleb128 0x4a
	.long	.LASF168
	.byte	0x1
	.byte	0x55
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	max_age
	.uleb128 0x4a
	.long	.LASF354
	.byte	0x1
	.byte	0x5f
	.long	0x5ef1
	.uleb128 0x9
	.byte	0x3
	.quad	throttles
	.uleb128 0x6
	.byte	0x8
	.long	0xddd
	.uleb128 0x4a
	.long	.LASF355
	.byte	0x1
	.byte	0x60
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	numthrottles
	.uleb128 0x4a
	.long	.LASF356
	.byte	0x1
	.byte	0x60
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	maxthrottles
	.uleb128 0x4a
	.long	.LASF357
	.byte	0x1
	.byte	0x74
	.long	0xefb
	.uleb128 0x9
	.byte	0x3
	.quad	connects
	.uleb128 0x4a
	.long	.LASF358
	.byte	0x1
	.byte	0x75
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	num_connects
	.uleb128 0x4a
	.long	.LASF359
	.byte	0x1
	.byte	0x75
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	max_connects
	.uleb128 0x4a
	.long	.LASF360
	.byte	0x1
	.byte	0x75
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	first_free_connect
	.uleb128 0x4a
	.long	.LASF361
	.byte	0x1
	.byte	0x76
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	httpd_conn_count
	.uleb128 0x4b
	.string	"hs"
	.byte	0x1
	.byte	0x80
	.long	0xca7
	.uleb128 0x9
	.byte	0x3
	.quad	hs
	.uleb128 0x4a
	.long	.LASF362
	.byte	0x1
	.byte	0x87
	.long	0x1c1
	.uleb128 0x9
	.byte	0x3
	.quad	got_hup
	.uleb128 0x4a
	.long	.LASF363
	.byte	0x1
	.byte	0x87
	.long	0x1c1
	.uleb128 0x9
	.byte	0x3
	.quad	got_usr1
	.uleb128 0x4a
	.long	.LASF364
	.byte	0x1
	.byte	0x87
	.long	0x1c1
	.uleb128 0x9
	.byte	0x3
	.quad	watchdog_flag
	.uleb128 0x4c
	.long	.LASF365
	.byte	0xb
	.byte	0xa8
	.long	0x50f
	.uleb128 0x4c
	.long	.LASF366
	.byte	0xb
	.byte	0xa9
	.long	0x50f
	.uleb128 0x4c
	.long	.LASF367
	.byte	0xb
	.byte	0xaa
	.long	0x50f
	.uleb128 0x4c
	.long	.LASF368
	.byte	0x14
	.byte	0xfd
	.long	0x104
	.uleb128 0x4c
	.long	.LASF369
	.byte	0x14
	.byte	0xfe
	.long	0x104
	.uleb128 0x4c
	.long	.LASF370
	.byte	0x14
	.byte	0xff
	.long	0x104
	.uleb128 0x4d
	.long	.LASF371
	.byte	0x14
	.value	0x100
	.long	0x104
	.uleb128 0x4d
	.long	.LASF372
	.byte	0x14
	.value	0x101
	.long	0x104
	.uleb128 0x4d
	.long	.LASF373
	.byte	0x14
	.value	0x102
	.long	0x104
	.uleb128 0x4c
	.long	.LASF374
	.byte	0x15
	.byte	0x30
	.long	0xcdc
	.uleb128 0x4e
	.long	.LASF375
	.byte	0x1
	.byte	0x81
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	terminate
	.uleb128 0x4e
	.long	.LASF376
	.byte	0x1
	.byte	0x82
	.long	0x148
	.uleb128 0x9
	.byte	0x3
	.quad	start_time
	.uleb128 0x4e
	.long	.LASF377
	.byte	0x1
	.byte	0x82
	.long	0x148
	.uleb128 0x9
	.byte	0x3
	.quad	stats_time
	.uleb128 0x4e
	.long	.LASF378
	.byte	0x1
	.byte	0x83
	.long	0x5a
	.uleb128 0x9
	.byte	0x3
	.quad	stats_connections
	.uleb128 0x4e
	.long	.LASF379
	.byte	0x1
	.byte	0x84
	.long	0x132
	.uleb128 0x9
	.byte	0x3
	.quad	stats_bytes
	.uleb128 0x4e
	.long	.LASF380
	.byte	0x1
	.byte	0x85
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	stats_simultaneous
	.uleb128 0x4f
	.long	.LASF381
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.long	0x6109
	.uleb128 0x34
	.quad	.LVL1102
	.long	0x661d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LASAN0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0xa8
	.byte	0
	.byte	0
	.uleb128 0x4f
	.long	.LASF382
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.long	0x6153
	.uleb128 0x30
	.quad	.LVL1103
	.long	0x662c
	.uleb128 0x34
	.quad	.LVL1104
	.long	0x663b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LASAN0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0xa8
	.byte	0
	.byte	0
	.uleb128 0x50
	.long	.LASF389
	.long	.LASF389
	.byte	0x17
	.byte	0xbe
	.uleb128 0x51
	.long	.LASF383
	.long	.LASF385
	.byte	0x16
	.byte	0
	.long	.LASF383
	.uleb128 0x51
	.long	.LASF384
	.long	.LASF386
	.byte	0x16
	.byte	0
	.long	.LASF384
	.uleb128 0x51
	.long	.LASF387
	.long	.LASF388
	.byte	0x16
	.byte	0
	.long	.LASF387
	.uleb128 0x52
	.long	.LASF390
	.long	.LASF390
	.byte	0xb
	.value	0x164
	.uleb128 0x51
	.long	.LASF391
	.long	.LASF392
	.byte	0x16
	.byte	0
	.long	.LASF391
	.uleb128 0x52
	.long	.LASF393
	.long	.LASF393
	.byte	0x18
	.value	0x21e
	.uleb128 0x50
	.long	.LASF394
	.long	.LASF394
	.byte	0x19
	.byte	0x3f
	.uleb128 0x52
	.long	.LASF395
	.long	.LASF395
	.byte	0x14
	.value	0x11a
	.uleb128 0x50
	.long	.LASF396
	.long	.LASF396
	.byte	0x1a
	.byte	0x35
	.uleb128 0x50
	.long	.LASF397
	.long	.LASF397
	.byte	0x19
	.byte	0x53
	.uleb128 0x50
	.long	.LASF398
	.long	.LASF398
	.byte	0x15
	.byte	0x6c
	.uleb128 0x50
	.long	.LASF399
	.long	.LASF399
	.byte	0xe
	.byte	0x48
	.uleb128 0x50
	.long	.LASF400
	.long	.LASF400
	.byte	0x1b
	.byte	0x32
	.uleb128 0x51
	.long	.LASF401
	.long	.LASF402
	.byte	0x16
	.byte	0
	.long	.LASF401
	.uleb128 0x50
	.long	.LASF403
	.long	.LASF403
	.byte	0x1a
	.byte	0x2f
	.uleb128 0x50
	.long	.LASF404
	.long	.LASF404
	.byte	0x15
	.byte	0x66
	.uleb128 0x52
	.long	.LASF405
	.long	.LASF405
	.byte	0xd
	.value	0x1b0
	.uleb128 0x52
	.long	.LASF406
	.long	.LASF406
	.byte	0xd
	.value	0x1f1
	.uleb128 0x52
	.long	.LASF407
	.long	.LASF407
	.byte	0x18
	.value	0x202
	.uleb128 0x50
	.long	.LASF408
	.long	.LASF408
	.byte	0x1c
	.byte	0x89
	.uleb128 0x50
	.long	.LASF409
	.long	.LASF409
	.byte	0x1d
	.byte	0xac
	.uleb128 0x52
	.long	.LASF410
	.long	.LASF410
	.byte	0xb
	.value	0x110
	.uleb128 0x52
	.long	.LASF411
	.long	.LASF411
	.byte	0xb
	.value	0x26e
	.uleb128 0x50
	.long	.LASF412
	.long	.LASF412
	.byte	0x1d
	.byte	0xe8
	.uleb128 0x52
	.long	.LASF413
	.long	.LASF413
	.byte	0x1d
	.value	0x11d
	.uleb128 0x52
	.long	.LASF414
	.long	.LASF414
	.byte	0x1d
	.value	0x119
	.uleb128 0x52
	.long	.LASF415
	.long	.LASF415
	.byte	0x1d
	.value	0x214
	.uleb128 0x50
	.long	.LASF416
	.long	.LASF416
	.byte	0x18
	.byte	0x93
	.uleb128 0x51
	.long	.LASF417
	.long	.LASF418
	.byte	0x16
	.byte	0
	.long	.LASF417
	.uleb128 0x50
	.long	.LASF419
	.long	.LASF419
	.byte	0xb
	.byte	0xed
	.uleb128 0x51
	.long	.LASF420
	.long	.LASF421
	.byte	0x16
	.byte	0
	.long	.LASF420
	.uleb128 0x52
	.long	.LASF422
	.long	.LASF422
	.byte	0xb
	.value	0x34e
	.uleb128 0x50
	.long	.LASF423
	.long	.LASF423
	.byte	0x1d
	.byte	0x8c
	.uleb128 0x51
	.long	.LASF424
	.long	.LASF425
	.byte	0x16
	.byte	0
	.long	.LASF424
	.uleb128 0x52
	.long	.LASF426
	.long	.LASF426
	.byte	0x1d
	.value	0x18b
	.uleb128 0x53
	.long	.LASF427
	.long	.LASF428
	.byte	0xb
	.value	0x1c0
	.long	.LASF427
	.uleb128 0x50
	.long	.LASF429
	.long	.LASF429
	.byte	0x1d
	.byte	0x7d
	.uleb128 0x52
	.long	.LASF430
	.long	.LASF430
	.byte	0x1d
	.value	0x152
	.uleb128 0x52
	.long	.LASF431
	.long	.LASF431
	.byte	0x18
	.value	0x1d1
	.uleb128 0x52
	.long	.LASF432
	.long	.LASF432
	.byte	0x18
	.value	0x1df
	.uleb128 0x52
	.long	.LASF433
	.long	.LASF433
	.byte	0x1e
	.value	0x11d
	.uleb128 0x52
	.long	.LASF434
	.long	.LASF434
	.byte	0xb
	.value	0x35a
	.uleb128 0x50
	.long	.LASF435
	.long	.LASF435
	.byte	0x1f
	.byte	0x9a
	.uleb128 0x50
	.long	.LASF436
	.long	.LASF436
	.byte	0x14
	.byte	0xb4
	.uleb128 0x50
	.long	.LASF437
	.long	.LASF437
	.byte	0x14
	.byte	0xc6
	.uleb128 0x52
	.long	.LASF438
	.long	.LASF438
	.byte	0x14
	.value	0x10e
	.uleb128 0x50
	.long	.LASF439
	.long	.LASF439
	.byte	0x15
	.byte	0x5b
	.uleb128 0x50
	.long	.LASF440
	.long	.LASF440
	.byte	0x20
	.byte	0x22
	.uleb128 0x50
	.long	.LASF441
	.long	.LASF441
	.byte	0x19
	.byte	0x42
	.uleb128 0x50
	.long	.LASF442
	.long	.LASF442
	.byte	0x14
	.byte	0xba
	.uleb128 0x50
	.long	.LASF443
	.long	.LASF443
	.byte	0x14
	.byte	0xf5
	.uleb128 0x52
	.long	.LASF444
	.long	.LASF444
	.byte	0x18
	.value	0x1e2
	.uleb128 0x50
	.long	.LASF445
	.long	.LASF445
	.byte	0x14
	.byte	0xf0
	.uleb128 0x50
	.long	.LASF446
	.long	.LASF446
	.byte	0x1a
	.byte	0x32
	.uleb128 0x50
	.long	.LASF447
	.long	.LASF447
	.byte	0x15
	.byte	0x69
	.uleb128 0x50
	.long	.LASF448
	.long	.LASF448
	.byte	0x17
	.byte	0xaf
	.uleb128 0x50
	.long	.LASF449
	.long	.LASF449
	.byte	0x15
	.byte	0x63
	.uleb128 0x52
	.long	.LASF450
	.long	.LASF450
	.byte	0x21
	.value	0x106
	.uleb128 0x50
	.long	.LASF451
	.long	.LASF451
	.byte	0x15
	.byte	0x48
	.uleb128 0x50
	.long	.LASF452
	.long	.LASF452
	.byte	0x14
	.byte	0xe9
	.uleb128 0x50
	.long	.LASF453
	.long	.LASF453
	.byte	0x14
	.byte	0xf9
	.uleb128 0x52
	.long	.LASF454
	.long	.LASF454
	.byte	0x14
	.value	0x108
	.uleb128 0x52
	.long	.LASF455
	.long	.LASF455
	.byte	0xd
	.value	0x168
	.uleb128 0x50
	.long	.LASF456
	.long	.LASF456
	.byte	0x14
	.byte	0xd2
	.uleb128 0x50
	.long	.LASF457
	.long	.LASF457
	.byte	0x14
	.byte	0xdc
	.uleb128 0x50
	.long	.LASF458
	.long	.LASF458
	.byte	0x14
	.byte	0xe6
	.uleb128 0x52
	.long	.LASF459
	.long	.LASF459
	.byte	0x14
	.value	0x10b
	.uleb128 0x50
	.long	.LASF460
	.long	.LASF460
	.byte	0x22
	.byte	0x33
	.uleb128 0x50
	.long	.LASF461
	.long	.LASF461
	.byte	0x1d
	.byte	0x2e
	.uleb128 0x52
	.long	.LASF462
	.long	.LASF462
	.byte	0xd
	.value	0x16e
	.uleb128 0x50
	.long	.LASF463
	.long	.LASF463
	.byte	0x1d
	.byte	0x3e
	.uleb128 0x52
	.long	.LASF464
	.long	.LASF464
	.byte	0xb
	.value	0x182
	.uleb128 0x52
	.long	.LASF465
	.long	.LASF465
	.byte	0x13
	.value	0x296
	.uleb128 0x52
	.long	.LASF466
	.long	.LASF466
	.byte	0x13
	.value	0x29c
	.uleb128 0x52
	.long	.LASF467
	.long	.LASF467
	.byte	0x13
	.value	0x29f
	.uleb128 0x52
	.long	.LASF468
	.long	.LASF468
	.byte	0xd
	.value	0x274
	.uleb128 0x52
	.long	.LASF469
	.long	.LASF469
	.byte	0x1d
	.value	0x103
	.uleb128 0x50
	.long	.LASF470
	.long	.LASF470
	.byte	0x17
	.byte	0xb5
	.uleb128 0x52
	.long	.LASF471
	.long	.LASF471
	.byte	0x4
	.value	0x125
	.uleb128 0x52
	.long	.LASF472
	.long	.LASF472
	.byte	0xd
	.value	0x2b9
	.uleb128 0x52
	.long	.LASF473
	.long	.LASF473
	.byte	0xd
	.value	0x1ff
	.uleb128 0x51
	.long	.LASF474
	.long	.LASF475
	.byte	0x16
	.byte	0
	.long	.LASF474
	.uleb128 0x52
	.long	.LASF476
	.long	.LASF476
	.byte	0xd
	.value	0x3bf
	.uleb128 0x50
	.long	.LASF477
	.long	.LASF477
	.byte	0x19
	.byte	0x3c
	.uleb128 0x52
	.long	.LASF478
	.long	.LASF478
	.byte	0x1
	.value	0x262
	.uleb128 0x50
	.long	.LASF479
	.long	.LASF479
	.byte	0x15
	.byte	0x45
	.uleb128 0x50
	.long	.LASF480
	.long	.LASF480
	.byte	0x14
	.byte	0xac
	.uleb128 0x50
	.long	.LASF248
	.long	.LASF248
	.byte	0x4
	.byte	0xc0
	.uleb128 0x50
	.long	.LASF481
	.long	.LASF481
	.byte	0x15
	.byte	0x6f
	.uleb128 0x50
	.long	.LASF482
	.long	.LASF482
	.byte	0x15
	.byte	0x56
	.uleb128 0x50
	.long	.LASF483
	.long	.LASF483
	.byte	0x19
	.byte	0x48
	.uleb128 0x50
	.long	.LASF484
	.long	.LASF484
	.byte	0x19
	.byte	0x4b
	.uleb128 0x50
	.long	.LASF485
	.long	.LASF485
	.byte	0x19
	.byte	0x50
	.uleb128 0x52
	.long	.LASF486
	.long	.LASF486
	.byte	0xd
	.value	0x2b1
	.uleb128 0x50
	.long	.LASF487
	.long	.LASF487
	.byte	0xa
	.byte	0x75
	.uleb128 0x50
	.long	.LASF488
	.long	.LASF488
	.byte	0x23
	.byte	0xb5
	.uleb128 0x52
	.long	.LASF489
	.long	.LASF489
	.byte	0xd
	.value	0x2e3
	.uleb128 0x50
	.long	.LASF490
	.long	.LASF490
	.byte	0x23
	.byte	0xca
	.uleb128 0x52
	.long	.LASF491
	.long	.LASF491
	.byte	0xd
	.value	0x2d2
	.uleb128 0x50
	.long	.LASF492
	.long	.LASF492
	.byte	0x14
	.byte	0xb7
	.uleb128 0x52
	.long	.LASF493
	.long	.LASF493
	.byte	0xd
	.value	0x3c6
	.uleb128 0x50
	.long	.LASF494
	.long	.LASF494
	.byte	0x1d
	.byte	0x8f
	.uleb128 0x52
	.long	.LASF495
	.long	.LASF495
	.byte	0xd
	.value	0x1de
	.uleb128 0x51
	.long	.LASF496
	.long	.LASF497
	.byte	0x16
	.byte	0
	.long	.LASF496
	.uleb128 0x51
	.long	.LASF498
	.long	.LASF499
	.byte	0x16
	.byte	0
	.long	.LASF498
	.uleb128 0x51
	.long	.LASF500
	.long	.LASF501
	.byte	0x16
	.byte	0
	.long	.LASF500
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x410a
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x44
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x45
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x46
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x47
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x48
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x49
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x4d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x4e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x50
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x51
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x52
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x53
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL1
	.quad	.LVL2
	.value	0x1
	.byte	0x55
	.quad	.LVL2
	.quad	.LFE35
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL4
	.quad	.LVL5
	.value	0x1
	.byte	0x55
	.quad	.LVL8
	.quad	.LVL9
	.value	0x1
	.byte	0x55
	.quad	.LVL13
	.quad	.LVL14
	.value	0x1
	.byte	0x55
	.quad	.LVL26
	.quad	.LVL27
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL4
	.quad	.LVL5
	.value	0x1
	.byte	0x54
	.quad	.LVL5
	.quad	.LFE25
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL4
	.quad	.LVL5
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL5
	.quad	.LVL11
	.value	0x1
	.byte	0x53
	.quad	.LVL11
	.quad	.LVL12-1
	.value	0x1
	.byte	0x51
	.quad	.LVL12-1
	.quad	.LVL12
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL12
	.quad	.LVL13
	.value	0x1
	.byte	0x53
	.quad	.LVL19
	.quad	.LVL22
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL22
	.quad	.LVL23
	.value	0x2
	.byte	0x74
	.sleb128 -4
	.quad	.LVL24
	.quad	.LVL26
	.value	0x1
	.byte	0x53
	.quad	.LVL30
	.quad	.LVL40
	.value	0x1
	.byte	0x53
	.quad	.LVL40
	.quad	.LVL41-1
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL41
	.quad	.LVL42-1
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL18
	.quad	.LVL19
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL27
	.quad	.LVL28
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL13
	.quad	.LVL15
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL15
	.quad	.LVL16
	.value	0x1
	.byte	0x59
	.quad	.LVL16
	.quad	.LVL17
	.value	0x4
	.byte	0x79
	.sleb128 -144
	.byte	0x9f
	.quad	.LVL17
	.quad	.LVL24-1
	.value	0x1
	.byte	0x59
	.quad	.LVL27
	.quad	.LVL28-1
	.value	0x1
	.byte	0x59
	.quad	.LVL28
	.quad	.LVL29-1
	.value	0x1
	.byte	0x59
	.quad	.LVL29
	.quad	.LVL30-1
	.value	0x1
	.byte	0x59
	.quad	.LVL40
	.quad	.LVL41-1
	.value	0x1
	.byte	0x59
	.quad	.LVL41
	.quad	.LVL42-1
	.value	0x1
	.byte	0x59
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL20
	.quad	.LVL21
	.value	0x1
	.byte	0x50
	.quad	.LVL21
	.quad	.LVL23
	.value	0x7
	.byte	0x76
	.sleb128 -32
	.byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x1b
	.byte	0x9f
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL43
	.quad	.LVL44
	.value	0x1
	.byte	0x55
	.quad	.LVL44
	.quad	.LVL46-1
	.value	0x1
	.byte	0x52
	.quad	.LVL46-1
	.quad	.LVL48
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL48
	.quad	.LVL49-1
	.value	0x1
	.byte	0x52
	.quad	.LVL49-1
	.quad	.LFE14
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL43
	.quad	.LVL45
	.value	0x1
	.byte	0x54
	.quad	.LVL45
	.quad	.LVL48
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL48
	.quad	.LVL49-1
	.value	0x1
	.byte	0x54
	.quad	.LVL49-1
	.quad	.LFE14
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL50
	.quad	.LVL51
	.value	0x1
	.byte	0x55
	.quad	.LVL51
	.quad	.LVL53-1
	.value	0x1
	.byte	0x52
	.quad	.LVL53-1
	.quad	.LVL55
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL55
	.quad	.LVL56-1
	.value	0x1
	.byte	0x52
	.quad	.LVL56-1
	.quad	.LFE13
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL50
	.quad	.LVL52
	.value	0x1
	.byte	0x54
	.quad	.LVL52
	.quad	.LVL55
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL55
	.quad	.LVL56-1
	.value	0x1
	.byte	0x54
	.quad	.LVL56-1
	.quad	.LFE13
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL61
	.quad	.LVL62
	.value	0x1
	.byte	0x54
	.quad	.LVL62
	.quad	.LVL66
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL66
	.quad	.LVL67-1
	.value	0x1
	.byte	0x54
	.quad	.LVL67-1
	.quad	.LFE30
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL62
	.quad	.LVL63-1
	.value	0x1
	.byte	0x54
	.quad	.LVL64
	.quad	.LVL65-1
	.value	0x1
	.byte	0x54
	.quad	.LVL65
	.quad	.LVL66-1
	.value	0x1
	.byte	0x54
	.quad	.LVL67
	.quad	.LVL68-1
	.value	0x1
	.byte	0x54
	.quad	.LVL68
	.quad	.LVL69-1
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL70
	.quad	.LVL71
	.value	0x1
	.byte	0x55
	.quad	.LVL71
	.quad	.LVL74
	.value	0x1
	.byte	0x53
	.quad	.LVL86
	.quad	.LVL87
	.value	0x1
	.byte	0x53
	.quad	.LVL87
	.quad	.LVL88
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL90
	.quad	.LFE34
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL73
	.quad	.LVL78
	.value	0x1
	.byte	0x50
	.quad	.LVL78
	.quad	.LVL79-1
	.value	0x9
	.byte	0x3
	.quad	stats_time
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL75
	.quad	.LVL79-1
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL75
	.quad	.LVL76
	.value	0xe
	.byte	0x70
	.sleb128 0
	.byte	0x3
	.quad	stats_time
	.byte	0x6
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL76
	.quad	.LVL85
	.value	0x1
	.byte	0x53
	.quad	.LVL89
	.quad	.LVL90
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL93
	.quad	.LVL94
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL93
	.quad	.LVL95-1
	.value	0x1
	.byte	0x54
	.quad	.LVL95-1
	.quad	.LFE33
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL96
	.quad	.LVL97-1
	.value	0x1
	.byte	0x55
	.quad	.LVL97-1
	.quad	.LFE6
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL98
	.quad	.LVL100
	.value	0x1
	.byte	0x56
	.quad	.LVL101
	.quad	.LVL102
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL104
	.quad	.LVL105
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL104
	.quad	.LVL106-1
	.value	0x1
	.byte	0x54
	.quad	.LVL106-1
	.quad	.LFE32
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL108
	.quad	.LVL109-1
	.value	0x1
	.byte	0x55
	.quad	.LVL109-1
	.quad	.LFE7
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL110
	.quad	.LVL112
	.value	0x1
	.byte	0x56
	.quad	.LVL113
	.quad	.LVL114
	.value	0x1
	.byte	0x56
	.quad	.LVL115
	.quad	.LFE7
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL119
	.quad	.LVL120
	.value	0x1
	.byte	0x55
	.quad	.LVL120
	.quad	.LVL132
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL132
	.quad	.LVL133
	.value	0x1
	.byte	0x55
	.quad	.LVL133
	.quad	.LFE3
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL122
	.quad	.LVL123
	.value	0x1
	.byte	0x50
	.quad	.LVL123
	.quad	.LVL124
	.value	0x2
	.byte	0x70
	.sleb128 0
	.quad	.LVL124
	.quad	.LVL125
	.value	0x2
	.byte	0x73
	.sleb128 0
	.quad	.LVL125
	.quad	.LVL131
	.value	0x3
	.byte	0x91
	.sleb128 -164
	.quad	.LVL135
	.quad	.LVL136
	.value	0x3
	.byte	0x91
	.sleb128 -164
	.quad	.LVL137
	.quad	.LVL140
	.value	0x3
	.byte	0x91
	.sleb128 -164
	.quad	0
	.quad	0
.LLST28:
	.quad	.LVL126
	.quad	.LVL127
	.value	0x1
	.byte	0x50
	.quad	.LVL128
	.quad	.LVL129
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST29:
	.quad	.LVL142
	.quad	.LVL143-1
	.value	0x1
	.byte	0x55
	.quad	.LVL143-1
	.quad	.LFE15
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST30:
	.quad	.LVL143
	.quad	.LVL144-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST31:
	.quad	.LVL149
	.quad	.LVL150
	.value	0x1
	.byte	0x55
	.quad	.LVL150
	.quad	.LVL154
	.value	0x1
	.byte	0x53
	.quad	.LVL154
	.quad	.LVL242
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL242
	.quad	.LVL247
	.value	0x1
	.byte	0x53
	.quad	.LVL247
	.quad	.LFE12
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST32:
	.quad	.LVL152
	.quad	.LVL153
	.value	0x1
	.byte	0x50
	.quad	.LVL153
	.quad	.LVL232
	.value	0x3
	.byte	0x91
	.sleb128 -264
	.quad	.LVL233
	.quad	.LVL240
	.value	0x3
	.byte	0x91
	.sleb128 -264
	.quad	.LVL241
	.quad	.LVL242
	.value	0x3
	.byte	0x91
	.sleb128 -264
	.quad	.LVL242
	.quad	.LVL243-1
	.value	0x1
	.byte	0x50
	.quad	.LVL243-1
	.quad	.LVL245
	.value	0x3
	.byte	0x91
	.sleb128 -264
	.quad	.LVL247
	.quad	.LFE12
	.value	0x3
	.byte	0x91
	.sleb128 -264
	.quad	0
	.quad	0
.LLST33:
	.quad	.LVL156
	.quad	.LVL157
	.value	0x1
	.byte	0x50
	.quad	.LVL157
	.quad	.LVL159
	.value	0x3
	.byte	0x7c
	.sleb128 32
	.byte	0x9f
	.quad	.LVL159
	.quad	.LVL200
	.value	0x1
	.byte	0x53
	.quad	.LVL200
	.quad	.LVL202
	.value	0x1
	.byte	0x5f
	.quad	.LVL202
	.quad	.LVL230
	.value	0x1
	.byte	0x53
	.quad	.LVL233
	.quad	.LVL239
	.value	0x1
	.byte	0x53
	.quad	.LVL241
	.quad	.LVL242
	.value	0x1
	.byte	0x53
	.quad	.LVL247
	.quad	.LVL248-1
	.value	0x1
	.byte	0x50
	.quad	.LVL248
	.quad	.LFE12
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST34:
	.quad	.LVL161
	.quad	.LVL162
	.value	0x1
	.byte	0x5f
	.quad	.LVL162
	.quad	.LVL163
	.value	0x1
	.byte	0x55
	.quad	.LVL163
	.quad	.LVL164
	.value	0x1
	.byte	0x5f
	.quad	.LVL164
	.quad	.LVL165
	.value	0x1
	.byte	0x50
	.quad	.LVL165
	.quad	.LVL166
	.value	0x1
	.byte	0x54
	.quad	.LVL166
	.quad	.LVL204
	.value	0x1
	.byte	0x5f
	.quad	.LVL204
	.quad	.LVL205
	.value	0x1
	.byte	0x55
	.quad	.LVL205
	.quad	.LVL230
	.value	0x1
	.byte	0x5f
	.quad	.LVL233
	.quad	.LVL239
	.value	0x1
	.byte	0x5f
	.quad	.LVL241
	.quad	.LVL242
	.value	0x1
	.byte	0x5f
	.quad	.LVL249
	.quad	.LFE12
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST35:
	.quad	.LVL167
	.quad	.LVL202
	.value	0x1
	.byte	0x53
	.quad	.LVL205
	.quad	.LVL230
	.value	0x1
	.byte	0x53
	.quad	.LVL234
	.quad	.LVL239
	.value	0x1
	.byte	0x53
	.quad	.LVL250
	.quad	.LFE12
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST36:
	.quad	.LVL168
	.quad	.LVL169
	.value	0x1
	.byte	0x50
	.quad	.LVL169
	.quad	.LVL203
	.value	0x1
	.byte	0x56
	.quad	.LVL205
	.quad	.LVL209
	.value	0x1
	.byte	0x56
	.quad	.LVL209
	.quad	.LVL210
	.value	0x1
	.byte	0x50
	.quad	.LVL210
	.quad	.LVL230
	.value	0x1
	.byte	0x56
	.quad	.LVL234
	.quad	.LVL239
	.value	0x1
	.byte	0x56
	.quad	.LVL250
	.quad	.LFE12
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST37:
	.quad	.LVL267
	.quad	.LVL269
	.value	0x1
	.byte	0x55
	.quad	.LVL269
	.quad	.LVL283
	.value	0x1
	.byte	0x5c
	.quad	.LVL283
	.quad	.LVL284
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL284
	.quad	.LVL314
	.value	0x1
	.byte	0x5c
	.quad	.LVL314
	.quad	.LVL315
	.value	0x1
	.byte	0x55
	.quad	.LVL315
	.quad	.LFE10
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST38:
	.quad	.LVL267
	.quad	.LVL270
	.value	0x1
	.byte	0x54
	.quad	.LVL270
	.quad	.LVL282
	.value	0x1
	.byte	0x5d
	.quad	.LVL282
	.quad	.LVL284
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL284
	.quad	.LVL314
	.value	0x1
	.byte	0x5d
	.quad	.LVL314
	.quad	.LVL315
	.value	0x1
	.byte	0x54
	.quad	.LVL315
	.quad	.LVL344
	.value	0x1
	.byte	0x5d
	.quad	.LVL344
	.quad	.LVL345-1
	.value	0x1
	.byte	0x54
	.quad	.LVL345-1
	.quad	.LVL348
	.value	0x1
	.byte	0x5d
	.quad	.LVL348
	.quad	.LVL349-1
	.value	0x1
	.byte	0x54
	.quad	.LVL349-1
	.quad	.LVL349
	.value	0x1
	.byte	0x5d
	.quad	.LVL349
	.quad	.LVL351
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL351
	.quad	.LFE10
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST39:
	.quad	.LVL268
	.quad	.LVL270
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL270
	.quad	.LVL273
	.value	0x1
	.byte	0x56
	.quad	.LVL273
	.quad	.LVL274
	.value	0x1
	.byte	0x50
	.quad	.LVL274
	.quad	.LVL280
	.value	0x1
	.byte	0x56
	.quad	.LVL280
	.quad	.LVL281
	.value	0x1
	.byte	0x5e
	.quad	.LVL281
	.quad	.LVL282
	.value	0x1
	.byte	0x56
	.quad	.LVL284
	.quad	.LVL287
	.value	0x1
	.byte	0x56
	.quad	.LVL287
	.quad	.LVL289
	.value	0x1
	.byte	0x5e
	.quad	.LVL289
	.quad	.LVL291
	.value	0x1
	.byte	0x56
	.quad	.LVL291
	.quad	.LVL292
	.value	0x1
	.byte	0x50
	.quad	.LVL292
	.quad	.LVL296
	.value	0x1
	.byte	0x56
	.quad	.LVL296
	.quad	.LVL297
	.value	0x1
	.byte	0x50
	.quad	.LVL297
	.quad	.LVL299
	.value	0x1
	.byte	0x56
	.quad	.LVL299
	.quad	.LVL300
	.value	0x1
	.byte	0x50
	.quad	.LVL300
	.quad	.LVL303
	.value	0x1
	.byte	0x56
	.quad	.LVL303
	.quad	.LVL304
	.value	0x1
	.byte	0x50
	.quad	.LVL304
	.quad	.LVL305
	.value	0x1
	.byte	0x56
	.quad	.LVL305
	.quad	.LVL306
	.value	0x1
	.byte	0x50
	.quad	.LVL306
	.quad	.LVL310
	.value	0x1
	.byte	0x56
	.quad	.LVL310
	.quad	.LVL311
	.value	0x1
	.byte	0x50
	.quad	.LVL311
	.quad	.LVL314
	.value	0x1
	.byte	0x56
	.quad	.LVL314
	.quad	.LVL315
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL315
	.quad	.LVL321
	.value	0x1
	.byte	0x56
	.quad	.LVL321
	.quad	.LVL322
	.value	0x1
	.byte	0x50
	.quad	.LVL322
	.quad	.LVL324
	.value	0x1
	.byte	0x56
	.quad	.LVL324
	.quad	.LVL325
	.value	0x1
	.byte	0x50
	.quad	.LVL325
	.quad	.LVL327
	.value	0x1
	.byte	0x56
	.quad	.LVL327
	.quad	.LVL328
	.value	0x1
	.byte	0x50
	.quad	.LVL328
	.quad	.LVL331
	.value	0x1
	.byte	0x56
	.quad	.LVL331
	.quad	.LVL333
	.value	0x1
	.byte	0x5e
	.quad	.LVL333
	.quad	.LVL335
	.value	0x1
	.byte	0x56
	.quad	.LVL335
	.quad	.LVL336-1
	.value	0x1
	.byte	0x50
	.quad	.LVL336-1
	.quad	.LVL336
	.value	0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.quad	.LVL336
	.quad	.LVL337-1
	.value	0x1
	.byte	0x50
	.quad	.LVL337-1
	.quad	.LVL337
	.value	0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.quad	.LVL337
	.quad	.LVL338-1
	.value	0x1
	.byte	0x50
	.quad	.LVL338-1
	.quad	.LVL338
	.value	0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.quad	.LVL338
	.quad	.LVL339
	.value	0x1
	.byte	0x5e
	.quad	.LVL339
	.quad	.LVL340-1
	.value	0x1
	.byte	0x50
	.quad	.LVL340-1
	.quad	.LVL340
	.value	0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.quad	.LVL340
	.quad	.LVL341-1
	.value	0x1
	.byte	0x50
	.quad	.LVL341-1
	.quad	.LVL341
	.value	0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.quad	.LVL341
	.quad	.LVL343
	.value	0x1
	.byte	0x5e
	.quad	.LVL343
	.quad	.LVL344
	.value	0x1
	.byte	0x56
	.quad	.LVL344
	.quad	.LVL345
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL345
	.quad	.LVL346-1
	.value	0x1
	.byte	0x50
	.quad	.LVL346-1
	.quad	.LVL346
	.value	0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.quad	.LVL346
	.quad	.LVL347-1
	.value	0x1
	.byte	0x50
	.quad	.LVL347-1
	.quad	.LVL347
	.value	0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.quad	.LVL347
	.quad	.LVL348-1
	.value	0x1
	.byte	0x50
	.quad	.LVL348-1
	.quad	.LVL348
	.value	0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.quad	.LVL348
	.quad	.LVL349
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL351
	.quad	.LVL352
	.value	0x1
	.byte	0x56
	.quad	.LVL352
	.quad	.LVL353-1
	.value	0x1
	.byte	0x50
	.quad	.LVL353-1
	.quad	.LVL353
	.value	0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.quad	.LVL353
	.quad	.LVL354-1
	.value	0x1
	.byte	0x50
	.quad	.LVL354-1
	.quad	.LFE10
	.value	0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST40:
	.quad	.LVL355
	.quad	.LVL356
	.value	0x1
	.byte	0x55
	.quad	.LVL356
	.quad	.LVL357
	.value	0x4
	.byte	0x91
	.sleb128 -10432
	.quad	.LVL357
	.quad	.LVL387
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL387
	.quad	.LVL388
	.value	0x1
	.byte	0x55
	.quad	.LVL388
	.quad	.LVL390
	.value	0x4
	.byte	0x91
	.sleb128 -10432
	.quad	.LVL390
	.quad	.LFE17
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST41:
	.quad	.LVL359
	.quad	.LVL360-1
	.value	0x1
	.byte	0x50
	.quad	.LVL360-1
	.quad	.LVL383
	.value	0x1
	.byte	0x56
	.quad	.LVL384
	.quad	.LVL387
	.value	0x1
	.byte	0x56
	.quad	.LVL390
	.quad	.LVL407
	.value	0x1
	.byte	0x56
	.quad	.LVL407
	.quad	.LVL408
	.value	0x1
	.byte	0x50
	.quad	.LVL408
	.quad	.LFE17
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST42:
	.quad	.LVL362
	.quad	.LVL363-1
	.value	0x1
	.byte	0x50
	.quad	.LVL368
	.quad	.LVL369-1
	.value	0x1
	.byte	0x50
	.quad	.LVL370
	.quad	.LVL371
	.value	0x1
	.byte	0x50
	.quad	.LVL406
	.quad	.LVL407-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST43:
	.quad	.LVL363
	.quad	.LVL364
	.value	0x1
	.byte	0x50
	.quad	.LVL364
	.quad	.LVL365
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	.LVL374
	.quad	.LVL375
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	.LVL376
	.quad	.LVL377
	.value	0x1
	.byte	0x50
	.quad	.LVL377
	.quad	.LVL378
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	.LVL384
	.quad	.LVL385
	.value	0x1
	.byte	0x50
	.quad	.LVL392
	.quad	.LVL393-1
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	.LVL393
	.quad	.LVL394-1
	.value	0x1
	.byte	0x50
	.quad	.LVL404
	.quad	.LVL405-1
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST44:
	.quad	.LVL416
	.quad	.LVL417-1
	.value	0x1
	.byte	0x50
	.quad	.LVL417-1
	.quad	.LVL420
	.value	0x1
	.byte	0x53
	.quad	.LVL420
	.quad	.LVL421-1
	.value	0x1
	.byte	0x54
	.quad	.LVL421
	.quad	.LVL422
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST45:
	.quad	.LVL417
	.quad	.LVL418-1
	.value	0x1
	.byte	0x50
	.quad	.LVL421
	.quad	.LVL423
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST46:
	.quad	.LVL425
	.quad	.LVL426
	.value	0x1
	.byte	0x55
	.quad	.LVL426
	.quad	.LVL434
	.value	0x1
	.byte	0x56
	.quad	.LVL434
	.quad	.LVL436
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL436
	.quad	.LVL439
	.value	0x1
	.byte	0x56
	.quad	.LVL439
	.quad	.LVL442
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL442
	.quad	.LFE19
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST47:
	.quad	.LVL425
	.quad	.LVL426
	.value	0x1
	.byte	0x54
	.quad	.LVL426
	.quad	.LVL435
	.value	0x1
	.byte	0x5c
	.quad	.LVL435
	.quad	.LVL436
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL436
	.quad	.LVL440
	.value	0x1
	.byte	0x5c
	.quad	.LVL440
	.quad	.LVL442
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL442
	.quad	.LFE19
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST48:
	.quad	.LVL427
	.quad	.LVL433
	.value	0x1
	.byte	0x53
	.quad	.LVL436
	.quad	.LVL438
	.value	0x1
	.byte	0x53
	.quad	.LVL438
	.quad	.LVL441
	.value	0x3
	.byte	0x7e
	.sleb128 -8
	.byte	0x9f
	.quad	.LVL442
	.quad	.LVL444
	.value	0x1
	.byte	0x53
	.quad	.LVL449
	.quad	.LVL453
	.value	0x1
	.byte	0x53
	.quad	.LVL454
	.quad	.LFE19
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST49:
	.quad	.LVL429
	.quad	.LVL432
	.value	0x3
	.byte	0x53
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL452
	.quad	.LVL453
	.value	0x3
	.byte	0x53
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL455
	.quad	.LVL457
	.value	0x3
	.byte	0x53
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL458
	.quad	.LVL465
	.value	0x3
	.byte	0x53
	.byte	0x93
	.uleb128 0x8
	.quad	0
	.quad	0
.LLST50:
	.quad	.LVL467
	.quad	.LVL469
	.value	0x1
	.byte	0x55
	.quad	.LVL469
	.quad	.LVL479
	.value	0x1
	.byte	0x53
	.quad	.LVL479
	.quad	.LVL480
	.value	0x7
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x38
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL480
	.quad	.LVL481
	.value	0x1
	.byte	0x53
	.quad	.LVL481
	.quad	.LVL483
	.value	0x7
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0x38
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL483
	.quad	.LFE23
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST51:
	.quad	.LVL468
	.quad	.LVL469
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL469
	.quad	.LVL478
	.value	0x1
	.byte	0x5e
	.quad	.LVL480
	.quad	.LVL482
	.value	0x1
	.byte	0x5e
	.quad	.LVL483
	.quad	.LVL497
	.value	0x1
	.byte	0x5e
	.quad	.LVL500
	.quad	.LFE23
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST52:
	.quad	.LVL470
	.quad	.LVL471
	.value	0x1
	.byte	0x50
	.quad	.LVL472
	.quad	.LVL473
	.value	0x19
	.byte	0x7e
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x1e
	.byte	0x34
	.byte	0x24
	.byte	0x3
	.quad	throttles
	.byte	0x6
	.byte	0x22
	.byte	0x23
	.uleb128 0x10
	.quad	.LVL484
	.quad	.LVL485-1
	.value	0x19
	.byte	0x7e
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x1e
	.byte	0x34
	.byte	0x24
	.byte	0x3
	.quad	throttles
	.byte	0x6
	.byte	0x22
	.byte	0x23
	.uleb128 0x10
	.quad	.LVL485
	.quad	.LVL486-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST53:
	.quad	.LVL504
	.quad	.LVL505
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL505
	.quad	.LVL511
	.value	0x1
	.byte	0x56
	.quad	.LVL522
	.quad	.LVL527
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST54:
	.quad	.LVL512
	.quad	.LVL515
	.value	0x1
	.byte	0x53
	.quad	.LVL520
	.quad	.LVL522
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST55:
	.quad	.LVL529
	.quad	.LVL530-1
	.value	0x1
	.byte	0x55
	.quad	.LVL530-1
	.quad	.LFE5
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST56:
	.quad	.LVL535
	.quad	.LVL536-1
	.value	0x1
	.byte	0x55
	.quad	.LVL536-1
	.quad	.LFE2
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST57:
	.quad	.LVL541
	.quad	.LVL542
	.value	0x1
	.byte	0x55
	.quad	.LVL542
	.quad	.LVL543
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL543
	.quad	.LVL544
	.value	0x1
	.byte	0x55
	.quad	.LVL544
	.quad	.LVL545-1
	.value	0x3
	.byte	0x71
	.sleb128 -56
	.byte	0x9f
	.quad	.LVL545-1
	.quad	.LFE36
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST58:
	.quad	.LVL541
	.quad	.LVL542
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL543
	.quad	.LVL545
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST59:
	.quad	.LVL548
	.quad	.LVL549
	.value	0x1
	.byte	0x55
	.quad	.LVL549
	.quad	.LVL555
	.value	0x1
	.byte	0x53
	.quad	.LVL555
	.quad	.LVL556
	.value	0x4
	.byte	0x7c
	.sleb128 -104
	.byte	0x9f
	.quad	.LVL556
	.quad	.LVL557
	.value	0x3
	.byte	0x75
	.sleb128 -4
	.byte	0x9f
	.quad	.LVL557
	.quad	.LVL562
	.value	0x1
	.byte	0x53
	.quad	.LVL562
	.quad	.LVL563
	.value	0x1
	.byte	0x55
	.quad	.LVL563
	.quad	.LVL564
	.value	0x3
	.byte	0x76
	.sleb128 -8
	.byte	0x9f
	.quad	.LVL564
	.quad	.LFE28
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST60:
	.quad	.LVL548
	.quad	.LVL550-1
	.value	0x1
	.byte	0x54
	.quad	.LVL550-1
	.quad	.LVL551
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.quad	.LVL551
	.quad	.LVL557
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL557
	.quad	.LVL558-1
	.value	0x1
	.byte	0x54
	.quad	.LVL558-1
	.quad	.LVL560
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL560
	.quad	.LVL561-1
	.value	0x1
	.byte	0x54
	.quad	.LVL561-1
	.quad	.LVL561
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL561
	.quad	.LVL562
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.quad	.LVL562
	.quad	.LVL564-1
	.value	0x1
	.byte	0x54
	.quad	.LVL564-1
	.quad	.LVL566
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL566
	.quad	.LVL567-1
	.value	0x1
	.byte	0x54
	.quad	.LVL567-1
	.quad	.LFE28
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST61:
	.quad	.LVL568
	.quad	.LVL569
	.value	0x1
	.byte	0x55
	.quad	.LVL569
	.quad	.LVL576
	.value	0x1
	.byte	0x53
	.quad	.LVL576
	.quad	.LVL577
	.value	0x4
	.byte	0x76
	.sleb128 -104
	.byte	0x9f
	.quad	.LVL577
	.quad	.LVL579
	.value	0x4
	.byte	0x7d
	.sleb128 -96
	.byte	0x9f
	.quad	.LVL579
	.quad	.LVL580
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL580
	.quad	.LVL582
	.value	0x1
	.byte	0x53
	.quad	.LVL582
	.quad	.LVL584-1
	.value	0x1
	.byte	0x55
	.quad	.LVL584-1
	.quad	.LVL584
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL584
	.quad	.LVL594
	.value	0x1
	.byte	0x53
	.quad	.LVL594
	.quad	.LVL595
	.value	0x1
	.byte	0x55
	.quad	.LVL595
	.quad	.LVL596
	.value	0x4
	.byte	0x7d
	.sleb128 -96
	.byte	0x9f
	.quad	.LVL596
	.quad	.LFE27
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST62:
	.quad	.LVL568
	.quad	.LVL570-1
	.value	0x1
	.byte	0x54
	.quad	.LVL570-1
	.quad	.LVL578
	.value	0x1
	.byte	0x5c
	.quad	.LVL578
	.quad	.LVL580
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL580
	.quad	.LVL583
	.value	0x1
	.byte	0x5c
	.quad	.LVL583
	.quad	.LVL584-1
	.value	0x1
	.byte	0x54
	.quad	.LVL584-1
	.quad	.LVL584
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL584
	.quad	.LVL594
	.value	0x1
	.byte	0x5c
	.quad	.LVL594
	.quad	.LVL596-1
	.value	0x1
	.byte	0x54
	.quad	.LVL596-1
	.quad	.LVL596
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL596
	.quad	.LFE27
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST63:
	.quad	.LVL606
	.quad	.LVL607
	.value	0x1
	.byte	0x55
	.quad	.LVL607
	.quad	.LVL609
	.value	0x1
	.byte	0x53
	.quad	.LVL609
	.quad	.LVL611-1
	.value	0x1
	.byte	0x55
	.quad	.LVL611-1
	.quad	.LVL611
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL611
	.quad	.LFE26
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST64:
	.quad	.LVL606
	.quad	.LVL608-1
	.value	0x1
	.byte	0x54
	.quad	.LVL608-1
	.quad	.LVL610
	.value	0x1
	.byte	0x56
	.quad	.LVL610
	.quad	.LVL611-1
	.value	0x1
	.byte	0x54
	.quad	.LVL611-1
	.quad	.LVL611
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL611
	.quad	.LVL612-1
	.value	0x1
	.byte	0x54
	.quad	.LVL612-1
	.quad	.LFE26
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST65:
	.quad	.LVL613
	.quad	.LVL614
	.value	0x1
	.byte	0x55
	.quad	.LVL614
	.quad	.LVL619
	.value	0x1
	.byte	0x56
	.quad	.LVL619
	.quad	.LVL622-1
	.value	0x1
	.byte	0x55
	.quad	.LVL622-1
	.quad	.LVL622
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL622
	.quad	.LVL630
	.value	0x1
	.byte	0x56
	.quad	.LVL630
	.quad	.LVL633
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL633
	.quad	.LVL643
	.value	0x1
	.byte	0x56
	.quad	.LVL643
	.quad	.LVL646-1
	.value	0x1
	.byte	0x54
	.quad	.LVL646-1
	.quad	.LVL646
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL646
	.quad	.LFE20
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST66:
	.quad	.LVL613
	.quad	.LVL616
	.value	0x1
	.byte	0x54
	.quad	.LVL616
	.quad	.LVL620
	.value	0x1
	.byte	0x5c
	.quad	.LVL620
	.quad	.LVL622-1
	.value	0x1
	.byte	0x54
	.quad	.LVL622-1
	.quad	.LVL622
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL622
	.quad	.LVL631
	.value	0x1
	.byte	0x5c
	.quad	.LVL631
	.quad	.LVL633
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL633
	.quad	.LVL644
	.value	0x1
	.byte	0x5c
	.quad	.LVL644
	.quad	.LVL646
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL646
	.quad	.LVL665
	.value	0x1
	.byte	0x5c
	.quad	.LVL665
	.quad	.LVL666-1
	.value	0x1
	.byte	0x54
	.quad	.LVL666-1
	.quad	.LVL666
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL666
	.quad	.LVL667-1
	.value	0x1
	.byte	0x54
	.quad	.LVL667-1
	.quad	.LVL667
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL667
	.quad	.LFE20
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST67:
	.quad	.LVL624
	.quad	.LVL625
	.value	0x1
	.byte	0x50
	.quad	.LVL627
	.quad	.LVL628-1
	.value	0x1
	.byte	0x50
	.quad	.LVL633
	.quad	.LVL634
	.value	0x1
	.byte	0x50
	.quad	.LVL667
	.quad	.LVL668-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST68:
	.quad	.LVL640
	.quad	.LVL643
	.value	0x3
	.byte	0x56
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL643
	.quad	.LVL646-1
	.value	0x3
	.byte	0x54
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL646-1
	.quad	.LVL646
	.value	0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL683
	.quad	.LVL684
	.value	0x3
	.byte	0x56
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL689
	.quad	.LVL690
	.value	0x3
	.byte	0x56
	.byte	0x93
	.uleb128 0x8
	.quad	0
	.quad	0
.LLST69:
	.quad	.LVL615
	.quad	.LVL618
	.value	0x1
	.byte	0x53
	.quad	.LVL618
	.quad	.LVL621
	.value	0x4
	.byte	0x7d
	.sleb128 -160
	.byte	0x9f
	.quad	.LVL622
	.quad	.LVL629
	.value	0x1
	.byte	0x53
	.quad	.LVL629
	.quad	.LVL632
	.value	0x4
	.byte	0x7e
	.sleb128 -704
	.byte	0x9f
	.quad	.LVL633
	.quad	.LVL642
	.value	0x1
	.byte	0x53
	.quad	.LVL642
	.quad	.LVL645
	.value	0x4
	.byte	0x7e
	.sleb128 -704
	.byte	0x9f
	.quad	.LVL646
	.quad	.LVL666
	.value	0x1
	.byte	0x53
	.quad	.LVL667
	.quad	.LFE20
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST70:
	.quad	.LVL650
	.quad	.LVL651
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL652
	.quad	.LVL653
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL655
	.quad	.LVL656
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL659
	.quad	.LVL661
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST71:
	.quad	.LVL693
	.quad	.LVL695
	.value	0x1
	.byte	0x55
	.quad	.LVL696
	.quad	.LVL700
	.value	0x1
	.byte	0x55
	.quad	.LVL706
	.quad	.LVL710
	.value	0x1
	.byte	0x55
	.quad	.LVL714
	.quad	.LVL715
	.value	0x1
	.byte	0x55
	.quad	.LVL722
	.quad	.LVL723
	.value	0x1
	.byte	0x55
	.quad	.LVL725
	.quad	.LVL726
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST72:
	.quad	.LVL693
	.quad	.LVL694
	.value	0x1
	.byte	0x54
	.quad	.LVL694
	.quad	.LVL709
	.value	0x1
	.byte	0x5e
	.quad	.LVL709
	.quad	.LVL710
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL710
	.quad	.LFE29
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST73:
	.quad	.LVL693
	.quad	.LVL694
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL694
	.quad	.LVL703
	.value	0x1
	.byte	0x56
	.quad	.LVL703
	.quad	.LVL705
	.value	0x3
	.byte	0x76
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL705
	.quad	.LVL708
	.value	0x1
	.byte	0x56
	.quad	.LVL710
	.quad	.LFE29
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST74:
	.quad	.LVL694
	.quad	.LVL698
	.value	0x1
	.byte	0x53
	.quad	.LVL699
	.quad	.LVL707
	.value	0x1
	.byte	0x53
	.quad	.LVL710
	.quad	.LFE29
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST75:
	.quad	.LVL728
	.quad	.LVL729
	.value	0x1
	.byte	0x55
	.quad	.LVL729
	.quad	.LVL755
	.value	0x1
	.byte	0x56
	.quad	.LVL755
	.quad	.LVL756
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL756
	.quad	.LVL772
	.value	0x1
	.byte	0x56
	.quad	.LVL772
	.quad	.LVL774
	.value	0x1
	.byte	0x55
	.quad	.LVL774
	.quad	.LFE21
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST76:
	.quad	.LVL728
	.quad	.LVL729
	.value	0x1
	.byte	0x54
	.quad	.LVL729
	.quad	.LVL730
	.value	0x3
	.byte	0x91
	.sleb128 -200
	.quad	.LVL730
	.quad	.LVL772
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL772
	.quad	.LVL773
	.value	0x1
	.byte	0x54
	.quad	.LVL773
	.quad	.LVL776
	.value	0x3
	.byte	0x91
	.sleb128 -200
	.quad	.LVL776
	.quad	.LFE21
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST77:
	.quad	.LVL732
	.quad	.LVL733
	.value	0x1
	.byte	0x50
	.quad	.LVL743
	.quad	.LVL744
	.value	0x1
	.byte	0x50
	.quad	.LVL778
	.quad	.LVL779-1
	.value	0x1
	.byte	0x50
	.quad	.LVL781
	.quad	.LVL782-1
	.value	0x1
	.byte	0x50
	.quad	.LVL782
	.quad	.LVL783-1
	.value	0x1
	.byte	0x50
	.quad	.LVL803
	.quad	.LVL804-1
	.value	0x1
	.byte	0x50
	.quad	.LVL804
	.quad	.LVL805-1
	.value	0x1
	.byte	0x50
	.quad	.LVL805
	.quad	.LVL806-1
	.value	0x1
	.byte	0x50
	.quad	.LVL806
	.quad	.LVL807-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST78:
	.quad	.LVL734
	.quad	.LVL737
	.value	0x1
	.byte	0x50
	.quad	.LVL746
	.quad	.LVL748-1
	.value	0x1
	.byte	0x50
	.quad	.LVL757
	.quad	.LVL759
	.value	0x1
	.byte	0x50
	.quad	.LVL759
	.quad	.LVL761
	.value	0x1
	.byte	0x54
	.quad	.LVL763
	.quad	.LVL764
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL777
	.quad	.LVL778-1
	.value	0x1
	.byte	0x54
	.quad	.LVL783
	.quad	.LVL784-1
	.value	0x1
	.byte	0x50
	.quad	.LVL784
	.quad	.LVL785-1
	.value	0x1
	.byte	0x50
	.quad	.LVL800
	.quad	.LVL801-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST79:
	.quad	.LVL767
	.quad	.LVL770
	.value	0x1
	.byte	0x5d
	.quad	.LVL788
	.quad	.LVL789
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST80:
	.quad	.LVL740
	.quad	.LVL741
	.value	0x7
	.byte	0x7d
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x6
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL741
	.quad	.LVL743
	.value	0x1
	.byte	0x5d
	.quad	.LVL764
	.quad	.LVL767
	.value	0x1
	.byte	0x5d
	.quad	.LVL789
	.quad	.LVL792
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST81:
	.quad	.LVL731
	.quad	.LVL734-1
	.value	0x1
	.byte	0x52
	.quad	.LVL734-1
	.quad	.LVL735
	.value	0x9
	.byte	0x91
	.sleb128 -192
	.byte	0x6
	.byte	0xa
	.value	0x2c0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL735
	.quad	.LVL737
	.value	0x3
	.byte	0x91
	.sleb128 -176
	.quad	.LVL743
	.quad	.LVL745-1
	.value	0x1
	.byte	0x52
	.quad	.LVL745-1
	.quad	.LVL747
	.value	0x9
	.byte	0x91
	.sleb128 -168
	.byte	0x6
	.byte	0xa
	.value	0x1d8
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL747
	.quad	.LVL754
	.value	0x3
	.byte	0x91
	.sleb128 -176
	.quad	.LVL757
	.quad	.LVL760
	.value	0x3
	.byte	0x91
	.sleb128 -176
	.quad	.LVL777
	.quad	.LVL778
	.value	0x3
	.byte	0x91
	.sleb128 -176
	.quad	.LVL778
	.quad	.LVL779-1
	.value	0x1
	.byte	0x52
	.quad	.LVL779
	.quad	.LVL781
	.value	0x3
	.byte	0x91
	.sleb128 -176
	.quad	.LVL781
	.quad	.LVL782-1
	.value	0x1
	.byte	0x52
	.quad	.LVL782
	.quad	.LVL783-1
	.value	0x1
	.byte	0x52
	.quad	.LVL783
	.quad	.LVL785
	.value	0x3
	.byte	0x91
	.sleb128 -176
	.quad	.LVL786
	.quad	.LVL788
	.value	0x3
	.byte	0x91
	.sleb128 -176
	.quad	.LVL792
	.quad	.LVL793
	.value	0x3
	.byte	0x91
	.sleb128 -176
	.quad	.LVL794
	.quad	.LVL795
	.value	0x3
	.byte	0x91
	.sleb128 -176
	.quad	.LVL800
	.quad	.LVL801
	.value	0x3
	.byte	0x91
	.sleb128 -176
	.quad	.LVL801
	.quad	.LVL802-1
	.value	0x1
	.byte	0x52
	.quad	.LVL802-1
	.quad	.LVL802
	.value	0x9
	.byte	0x91
	.sleb128 -192
	.byte	0x6
	.byte	0xa
	.value	0x2c0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL802
	.quad	.LVL803-1
	.value	0x1
	.byte	0x52
	.quad	.LVL803-1
	.quad	.LVL803
	.value	0x9
	.byte	0x91
	.sleb128 -192
	.byte	0x6
	.byte	0xa
	.value	0x2c0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL803
	.quad	.LVL804-1
	.value	0x1
	.byte	0x52
	.quad	.LVL804
	.quad	.LVL805-1
	.value	0x1
	.byte	0x52
	.quad	.LVL805
	.quad	.LVL806-1
	.value	0x1
	.byte	0x52
	.quad	.LVL806
	.quad	.LVL807-1
	.value	0x1
	.byte	0x52
	.quad	.LVL808
	.quad	.LVL809-1
	.value	0x1
	.byte	0x52
	.quad	.LVL809
	.quad	.LVL810-1
	.value	0x1
	.byte	0x52
	.quad	.LVL813
	.quad	.LVL815
	.value	0x3
	.byte	0x91
	.sleb128 -176
	.quad	0
	.quad	0
.LLST82:
	.quad	.LVL738
	.quad	.LVL739
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL796
	.quad	.LVL797
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST83:
	.quad	.LVL757
	.quad	.LVL758
	.value	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL758
	.quad	.LVL762-1
	.value	0x1
	.byte	0x51
	.quad	.LVL762-1
	.quad	.LVL764
	.value	0x3
	.byte	0x91
	.sleb128 -176
	.quad	.LVL777
	.quad	.LVL778-1
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST84:
	.quad	.LVL819
	.quad	.LVL821-1
	.value	0x1
	.byte	0x54
	.quad	.LVL821-1
	.quad	.LVL822
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL822
	.quad	.LVL823-1
	.value	0x1
	.byte	0x54
	.quad	.LVL823-1
	.quad	.LVL823
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL823
	.quad	.LVL825-1
	.value	0x1
	.byte	0x54
	.quad	.LVL825-1
	.quad	.LFE31
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST85:
	.quad	.LVL820
	.quad	.LVL821-1
	.value	0x1
	.byte	0x55
	.quad	.LVL823
	.quad	.LVL824
	.value	0x1
	.byte	0x55
	.quad	.LVL824
	.quad	.LVL825-1
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LLST86:
	.quad	.LVL826
	.quad	.LVL827
	.value	0x1
	.byte	0x55
	.quad	.LVL827
	.quad	.LVL831
	.value	0x1
	.byte	0x5e
	.quad	.LVL831
	.quad	.LVL832
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL832
	.quad	.LVL836
	.value	0x1
	.byte	0x5e
	.quad	.LVL836
	.quad	.LVL838
	.value	0x1
	.byte	0x55
	.quad	.LVL838
	.quad	.LFE22
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST87:
	.quad	.LVL826
	.quad	.LVL827
	.value	0x1
	.byte	0x54
	.quad	.LVL827
	.quad	.LVL830
	.value	0x1
	.byte	0x5d
	.quad	.LVL830
	.quad	.LVL832
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL832
	.quad	.LVL836
	.value	0x1
	.byte	0x5d
	.quad	.LVL836
	.quad	.LVL837
	.value	0x1
	.byte	0x54
	.quad	.LVL837
	.quad	.LFE22
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST88:
	.quad	.LVL828
	.quad	.LVL829
	.value	0x1
	.byte	0x50
	.quad	.LVL832
	.quad	.LVL833-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST89:
	.quad	.LVL842
	.quad	.LVL843
	.value	0x1
	.byte	0x55
	.quad	.LVL843
	.quad	.LVL844
	.value	0x3
	.byte	0x91
	.sleb128 -344
	.quad	.LVL844
	.quad	.LVL869
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL869
	.quad	.LVL871
	.value	0x1
	.byte	0x55
	.quad	.LVL871
	.quad	.LVL873
	.value	0x3
	.byte	0x91
	.sleb128 -344
	.quad	.LVL873
	.quad	.LFE37
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST90:
	.quad	.LVL842
	.quad	.LVL843
	.value	0x1
	.byte	0x54
	.quad	.LVL843
	.quad	.LVL865
	.value	0x1
	.byte	0x5c
	.quad	.LVL865
	.quad	.LVL867
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL867
	.quad	.LVL869
	.value	0x1
	.byte	0x5c
	.quad	.LVL869
	.quad	.LVL870
	.value	0x1
	.byte	0x54
	.quad	.LVL870
	.quad	.LFE37
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST91:
	.quad	.LVL842
	.quad	.LVL843
	.value	0x1
	.byte	0x51
	.quad	.LVL843
	.quad	.LVL844
	.value	0x3
	.byte	0x91
	.sleb128 -336
	.quad	.LVL844
	.quad	.LVL869
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	.LVL869
	.quad	.LVL872-1
	.value	0x1
	.byte	0x51
	.quad	.LVL872-1
	.quad	.LVL873
	.value	0x3
	.byte	0x91
	.sleb128 -336
	.quad	.LVL873
	.quad	.LFE37
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LLST92:
	.quad	.LVL842
	.quad	.LVL843
	.value	0x1
	.byte	0x52
	.quad	.LVL843
	.quad	.LVL866
	.value	0x1
	.byte	0x5d
	.quad	.LVL866
	.quad	.LVL867
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	.LVL867
	.quad	.LVL869
	.value	0x1
	.byte	0x5d
	.quad	.LVL869
	.quad	.LVL872-1
	.value	0x1
	.byte	0x52
	.quad	.LVL872-1
	.quad	.LFE37
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST93:
	.quad	.LVL848
	.quad	.LVL850
	.value	0x1
	.byte	0x50
	.quad	.LVL850
	.quad	.LVL851
	.value	0x1
	.byte	0x5e
	.quad	.LVL877
	.quad	.LVL878-1
	.value	0x1
	.byte	0x50
	.quad	.LVL878-1
	.quad	.LVL883
	.value	0x1
	.byte	0x5e
	.quad	.LVL884
	.quad	.LVL885
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST94:
	.quad	.LVL850
	.quad	.LVL858
	.value	0x1
	.byte	0x50
	.quad	.LVL867
	.quad	.LVL868
	.value	0x1
	.byte	0x50
	.quad	.LVL874
	.quad	.LVL875-1
	.value	0x1
	.byte	0x50
	.quad	.LVL875
	.quad	.LVL876-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST95:
	.quad	.LVL849
	.quad	.LVL852
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL852
	.quad	.LVL859-1
	.value	0x1
	.byte	0x5a
	.quad	.LVL859-1
	.quad	.LVL861
	.value	0x3
	.byte	0x91
	.sleb128 -328
	.quad	.LVL867
	.quad	.LVL868
	.value	0x1
	.byte	0x5a
	.quad	.LVL874
	.quad	.LVL875-1
	.value	0x1
	.byte	0x5a
	.quad	.LVL875
	.quad	.LVL876-1
	.value	0x1
	.byte	0x5a
	.quad	.LVL883
	.quad	.LVL884
	.value	0x3
	.byte	0x91
	.sleb128 -328
	.quad	.LVL885
	.quad	.LVL886-1
	.value	0x1
	.byte	0x5a
	.quad	.LVL886
	.quad	.LVL887
	.value	0x3
	.byte	0x91
	.sleb128 -328
	.quad	0
	.quad	0
.LLST96:
	.quad	.LVL849
	.quad	.LVL852
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL852
	.quad	.LVL856
	.value	0x1
	.byte	0x5e
	.quad	.LVL857
	.quad	.LVL861
	.value	0x1
	.byte	0x5e
	.quad	.LVL867
	.quad	.LVL868
	.value	0x1
	.byte	0x5e
	.quad	.LVL874
	.quad	.LVL876
	.value	0x1
	.byte	0x5e
	.quad	.LVL883
	.quad	.LVL884
	.value	0x1
	.byte	0x5e
	.quad	.LVL885
	.quad	.LVL887
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST97:
	.quad	.LVL843
	.quad	.LVL869
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	.LVL873
	.quad	.LFE37
	.value	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.quad	0
	.quad	0
.LLST99:
	.quad	.LVL894
	.quad	.LVL896
	.value	0x1
	.byte	0x55
	.quad	.LVL896
	.quad	.LVL920
	.value	0x1
	.byte	0x5e
	.quad	.LVL920
	.quad	.LVL967
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL967
	.quad	.LVL969
	.value	0x1
	.byte	0x5e
	.quad	.LVL969
	.quad	.LVL974
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL974
	.quad	.LVL986
	.value	0x1
	.byte	0x5e
	.quad	.LVL986
	.quad	.LVL1021
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL1021
	.quad	.LVL1039
	.value	0x1
	.byte	0x5e
	.quad	.LVL1039
	.quad	.LVL1052
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL1052
	.quad	.LVL1057
	.value	0x1
	.byte	0x5e
	.quad	.LVL1057
	.quad	.LVL1066
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL1066
	.quad	.LVL1070
	.value	0x1
	.byte	0x5e
	.quad	.LVL1070
	.quad	.LVL1072
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL1072
	.quad	.LVL1073
	.value	0x1
	.byte	0x55
	.quad	.LVL1073
	.quad	.LVL1075
	.value	0x1
	.byte	0x5e
	.quad	.LVL1075
	.quad	.LVL1076
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL1076
	.quad	.LVL1077
	.value	0x1
	.byte	0x5e
	.quad	.LVL1077
	.quad	.LVL1089
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL1089
	.quad	.LVL1097
	.value	0x1
	.byte	0x5e
	.quad	.LVL1097
	.quad	.LVL1099
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL1099
	.quad	.LFE9
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST100:
	.quad	.LVL894
	.quad	.LVL895
	.value	0x1
	.byte	0x54
	.quad	.LVL895
	.quad	.LVL900
	.value	0x1
	.byte	0x5d
	.quad	.LVL900
	.quad	.LVL901-1
	.value	0x1
	.byte	0x54
	.quad	.LVL901-1
	.quad	.LVL1072
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL1072
	.quad	.LVL1075
	.value	0x1
	.byte	0x5d
	.quad	.LVL1075
	.quad	.LVL1091
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL1091
	.quad	.LVL1092
	.value	0x1
	.byte	0x5d
	.quad	.LVL1092
	.quad	.LFE9
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST101:
	.quad	.LVL897
	.quad	.LVL898
	.value	0x1
	.byte	0x50
	.quad	.LVL898
	.quad	.LVL907
	.value	0x1
	.byte	0x5c
	.quad	.LVL976
	.quad	.LVL986
	.value	0x1
	.byte	0x5c
	.quad	.LVL1066
	.quad	.LVL1070
	.value	0x1
	.byte	0x5c
	.quad	.LVL1093
	.quad	.LVL1095
	.value	0x1
	.byte	0x5c
	.quad	.LVL1099
	.quad	.LFE9
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST102:
	.quad	.LVL977
	.quad	.LVL980
	.value	0x1
	.byte	0x50
	.quad	.LVL980
	.quad	.LVL982
	.value	0x3
	.byte	0x75
	.sleb128 -20
	.byte	0x9f
	.quad	.LVL1066
	.quad	.LVL1067-1
	.value	0x1
	.byte	0x50
	.quad	.LVL1093
	.quad	.LVL1094-1
	.value	0x1
	.byte	0x50
	.quad	.LVL1099
	.quad	.LVL1100-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST103:
	.quad	.LVL896
	.quad	.LVL906
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL906
	.quad	.LVL976
	.value	0x3
	.byte	0x91
	.sleb128 -4780
	.quad	.LVL976
	.quad	.LVL978
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL978
	.quad	.LVL979
	.value	0x1
	.byte	0x52
	.quad	.LVL979
	.quad	.LVL982
	.value	0x3
	.byte	0x91
	.sleb128 -4780
	.quad	.LVL982
	.quad	.LVL986
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL986
	.quad	.LVL1066
	.value	0x3
	.byte	0x91
	.sleb128 -4780
	.quad	.LVL1066
	.quad	.LVL1070
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL1070
	.quad	.LVL1072
	.value	0x3
	.byte	0x91
	.sleb128 -4780
	.quad	.LVL1075
	.quad	.LVL1091
	.value	0x3
	.byte	0x91
	.sleb128 -4780
	.quad	.LVL1091
	.quad	.LVL1092
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL1092
	.quad	.LVL1094
	.value	0x3
	.byte	0x91
	.sleb128 -4780
	.quad	.LVL1094
	.quad	.LVL1095
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL1095
	.quad	.LVL1099
	.value	0x3
	.byte	0x91
	.sleb128 -4780
	.quad	.LVL1099
	.quad	.LFE9
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	0
	.quad	0
.LLST104:
	.quad	.LVL896
	.quad	.LVL906
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL906
	.quad	.LVL936
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL936
	.quad	.LVL938
	.value	0x3
	.byte	0x91
	.sleb128 -4784
	.quad	.LVL938
	.quad	.LVL976
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL976
	.quad	.LVL981
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL981
	.quad	.LVL982
	.value	0x1
	.byte	0x50
	.quad	.LVL982
	.quad	.LVL986
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL986
	.quad	.LVL1066
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL1066
	.quad	.LVL1070
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL1070
	.quad	.LVL1072
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL1075
	.quad	.LVL1091
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL1091
	.quad	.LVL1092
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL1092
	.quad	.LVL1093
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL1093
	.quad	.LVL1095
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL1095
	.quad	.LVL1099
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL1099
	.quad	.LFE9
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	0
	.quad	0
.LLST105:
	.quad	.LVL910
	.quad	.LVL967
	.value	0x1
	.byte	0x5f
	.quad	.LVL968
	.quad	.LVL969
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL969
	.quad	.LVL976
	.value	0x1
	.byte	0x5f
	.quad	.LVL986
	.quad	.LVL1021
	.value	0x1
	.byte	0x5f
	.quad	.LVL1023
	.quad	.LVL1024-1
	.value	0x1
	.byte	0x50
	.quad	.LVL1024-1
	.quad	.LVL1066
	.value	0x1
	.byte	0x5f
	.quad	.LVL1070
	.quad	.LVL1072
	.value	0x1
	.byte	0x5f
	.quad	.LVL1075
	.quad	.LVL1090
	.value	0x1
	.byte	0x5f
	.quad	.LVL1092
	.quad	.LVL1093
	.value	0x1
	.byte	0x5f
	.quad	.LVL1095
	.quad	.LVL1099
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST106:
	.quad	.LVL1024
	.quad	.LVL1025
	.value	0x1
	.byte	0x50
	.quad	.LVL1052
	.quad	.LVL1053
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST107:
	.quad	.LVL956
	.quad	.LVL957-1
	.value	0x1
	.byte	0x50
	.quad	.LVL957-1
	.quad	.LVL960
	.value	0x1
	.byte	0x53
	.quad	.LVL969
	.quad	.LVL970-1
	.value	0x1
	.byte	0x50
	.quad	.LVL970-1
	.quad	.LVL971
	.value	0x1
	.byte	0x53
	.quad	.LVL1007
	.quad	.LVL1009
	.value	0x1
	.byte	0x53
	.quad	.LVL1049
	.quad	.LVL1052
	.value	0x1
	.byte	0x53
	.quad	.LVL1075
	.quad	.LVL1076
	.value	0x1
	.byte	0x53
	.quad	.LVL1081
	.quad	.LVL1082
	.value	0x1
	.byte	0x53
	.quad	.LVL1085
	.quad	.LVL1088
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST108:
	.quad	.LVL946
	.quad	.LVL947
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL947
	.quad	.LVL948
	.value	0x1
	.byte	0x52
	.quad	.LVL948
	.quad	.LVL949
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL949
	.quad	.LVL950
	.value	0x1
	.byte	0x52
	.quad	.LVL1080
	.quad	.LVL1081-1
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL1097
	.quad	.LVL1098-1
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL1098
	.quad	.LVL1099-1
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST109:
	.quad	.LVL962
	.quad	.LVL963
	.value	0x1
	.byte	0x50
	.quad	.LVL963
	.quad	.LVL967
	.value	0x1
	.byte	0x53
	.quad	.LVL994
	.quad	.LVL998
	.value	0x1
	.byte	0x53
	.quad	.LVL998
	.quad	.LVL999-1
	.value	0x1
	.byte	0x50
	.quad	.LVL999-1
	.quad	.LVL1005
	.value	0x1
	.byte	0x53
	.quad	.LVL1082
	.quad	.LVL1085
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST110:
	.quad	.LVL964
	.quad	.LVL965-1
	.value	0x1
	.byte	0x50
	.quad	.LVL1084
	.quad	.LVL1085-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST111:
	.quad	.LVL920
	.quad	.LVL921-1
	.value	0x1
	.byte	0x50
	.quad	.LVL921-1
	.quad	.LVL923
	.value	0x1
	.byte	0x5e
	.quad	.LVL1039
	.quad	.LVL1040
	.value	0x1
	.byte	0x50
	.quad	.LVL1040
	.quad	.LVL1043
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x6c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.Ltext_cold0
	.quad	.Letext_cold0-.Ltext_cold0
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB2
	.quad	.LBE2
	.quad	.LBB3
	.quad	.LBE3
	.quad	0
	.quad	0
	.quad	.LBB4
	.quad	.LBE4
	.quad	.LBB5
	.quad	.LBE5
	.quad	.LBB6
	.quad	.LBE6
	.quad	.LBB7
	.quad	.LBE7
	.quad	0
	.quad	0
	.quad	.LBB8
	.quad	.LBE8
	.quad	.LBB9
	.quad	.LBE9
	.quad	.LBB13
	.quad	.LBE13
	.quad	.LBB14
	.quad	.LBE14
	.quad	.LBB15
	.quad	.LBE15
	.quad	.LBB16
	.quad	.LBE16
	.quad	0
	.quad	0
	.quad	.LBB10
	.quad	.LBE10
	.quad	.LBB11
	.quad	.LBE11
	.quad	.LBB12
	.quad	.LBE12
	.quad	0
	.quad	0
	.quad	.LBB17
	.quad	.LBE17
	.quad	.LBB18
	.quad	.LBE18
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.Ltext_cold0
	.quad	.Letext_cold0
	.quad	.LFB9
	.quad	.LFE9
	.quad	.LFB38
	.quad	.LFE38
	.quad	.LFB39
	.quad	.LFE39
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF101:
	.string	"socklen_t"
.LASF53:
	.string	"st_ctim"
.LASF243:
	.string	"TimerStruct"
.LASF29:
	.string	"size_t"
.LASF16:
	.string	"sizetype"
.LASF142:
	.string	"sockaddr_in6"
.LASF195:
	.string	"expnfilename"
.LASF194:
	.string	"origfilename"
.LASF49:
	.string	"st_blksize"
.LASF50:
	.string	"st_blocks"
.LASF443:
	.string	"httpd_destroy_conn"
.LASF353:
	.string	"user"
.LASF340:
	.string	"handle_linger"
.LASF153:
	.string	"ai_addrlen"
.LASF124:
	.string	"SHUT_RDWR"
.LASF138:
	.string	"sin_family"
.LASF500:
	.string	"__asan_register_globals"
.LASF293:
	.string	"tnum"
.LASF140:
	.string	"sin_addr"
.LASF79:
	.string	"_IO_save_end"
.LASF267:
	.string	"linger_timer"
.LASF450:
	.string	"shutdown"
.LASF329:
	.string	"really_clear_connection"
.LASF9:
	.string	"__gid_t"
.LASF149:
	.string	"ai_flags"
.LASF178:
	.string	"no_empty_referers"
.LASF107:
	.string	"SOCK_RAW"
.LASF52:
	.string	"st_mtim"
.LASF28:
	.string	"time_t"
.LASF381:
	.string	"_GLOBAL__sub_D_00099_0_terminate"
.LASF146:
	.string	"sin6_addr"
.LASF417:
	.string	"__asan_report_load1"
.LASF172:
	.string	"logfp"
.LASF72:
	.string	"_IO_write_base"
.LASF164:
	.string	"cgi_pattern"
.LASF383:
	.string	"__asan_report_load8"
.LASF350:
	.string	"do_global_passwd"
.LASF156:
	.string	"ai_next"
.LASF88:
	.string	"_lock"
.LASF424:
	.string	"puts"
.LASF438:
	.string	"httpd_set_ndelay"
.LASF265:
	.string	"active_at"
.LASF492:
	.string	"httpd_unlisten"
.LASF228:
	.string	"type"
.LASF392:
	.string	"__builtin___asan_handle_no_return"
.LASF39:
	.string	"stat"
.LASF471:
	.string	"tzset"
.LASF77:
	.string	"_IO_save_base"
.LASF272:
	.string	"connecttab"
.LASF324:
	.string	"listen_fd"
.LASF416:
	.string	"atoi"
.LASF155:
	.string	"ai_canonname"
.LASF456:
	.string	"httpd_got_request"
.LASF81:
	.string	"_chain"
.LASF499:
	.string	"__builtin___asan_init_v4"
.LASF119:
	.string	"ss_family"
.LASF408:
	.string	"waitpid"
.LASF85:
	.string	"_cur_column"
.LASF286:
	.string	"aiv4"
.LASF285:
	.string	"aiv6"
.LASF465:
	.string	"getaddrinfo"
.LASF327:
	.string	"handle_usr1"
.LASF304:
	.string	"handle_usr2"
.LASF241:
	.string	"ClientData"
.LASF7:
	.string	"__dev_t"
.LASF439:
	.string	"tmr_run"
.LASF25:
	.string	"uid_t"
.LASF205:
	.string	"contenttype"
.LASF434:
	.string	"fileno"
.LASF184:
	.string	"read_idx"
.LASF294:
	.string	"cnum"
.LASF290:
	.string	"secs"
.LASF165:
	.string	"cgi_limit"
.LASF407:
	.string	"abort"
.LASF378:
	.string	"stats_connections"
.LASF491:
	.string	"setuid"
.LASF58:
	.string	"passwd"
.LASF227:
	.string	"contentlength"
.LASF110:
	.string	"SOCK_DCCP"
.LASF6:
	.string	"long int"
.LASF108:
	.string	"SOCK_RDM"
.LASF393:
	.string	"exit"
.LASF461:
	.string	"memmove"
.LASF180:
	.string	"initialized"
.LASF173:
	.string	"no_symlink_check"
.LASF230:
	.string	"mime_flag"
.LASF310:
	.string	"oldstr"
.LASF371:
	.string	"httpd_err408form"
.LASF64:
	.string	"pw_dir"
.LASF481:
	.string	"tmr_prepare_timeval"
.LASF360:
	.string	"first_free_connect"
.LASF97:
	.string	"_IO_marker"
.LASF507:
	.string	"main"
.LASF312:
	.string	"read_config"
.LASF334:
	.string	"handle_send"
.LASF301:
	.string	"up_secs"
.LASF192:
	.string	"decodedurl"
.LASF335:
	.string	"max_bytes"
.LASF162:
	.string	"server_hostname"
.LASF255:
	.string	"min_limit"
.LASF289:
	.string	"thttpd_logstats"
.LASF65:
	.string	"pw_shell"
.LASF4:
	.string	"signed char"
.LASF19:
	.string	"__blksize_t"
.LASF125:
	.string	"uint8_t"
.LASF372:
	.string	"httpd_err503title"
.LASF67:
	.string	"_IO_FILE"
.LASF313:
	.string	"filename"
.LASF44:
	.string	"st_uid"
.LASF493:
	.string	"chroot"
.LASF460:
	.string	"writev"
.LASF109:
	.string	"SOCK_SEQPACKET"
.LASF311:
	.string	"newstr"
.LASF458:
	.string	"httpd_start_request"
.LASF0:
	.string	"unsigned char"
.LASF470:
	.string	"openlog"
.LASF225:
	.string	"if_modified_since"
.LASF47:
	.string	"st_rdev"
.LASF498:
	.string	"__asan_init_v4"
.LASF419:
	.string	"fclose"
.LASF464:
	.string	"snprintf"
.LASF375:
	.string	"terminate"
.LASF305:
	.string	"occasional"
.LASF442:
	.string	"httpd_terminate"
.LASF63:
	.string	"pw_gecos"
.LASF396:
	.string	"mmc_logstats"
.LASF273:
	.string	"clear_throttles"
.LASF332:
	.string	"handle_read"
.LASF179:
	.string	"httpd_server"
.LASF147:
	.string	"sin6_scope_id"
.LASF21:
	.string	"__syscall_slong_t"
.LASF269:
	.string	"bytes"
.LASF237:
	.string	"should_linger"
.LASF210:
	.string	"remoteuser"
.LASF283:
	.string	"portstr"
.LASF297:
	.string	"value"
.LASF506:
	.string	"__socket_type"
.LASF276:
	.string	"sa4_len"
.LASF22:
	.string	"char"
.LASF105:
	.string	"SOCK_STREAM"
.LASF182:
	.string	"read_buf"
.LASF120:
	.string	"__ss_align"
.LASF168:
	.string	"max_age"
.LASF315:
	.string	"parse_args"
.LASF363:
	.string	"got_usr1"
.LASF221:
	.string	"maxhostdir"
.LASF254:
	.string	"max_limit"
.LASF209:
	.string	"authorization"
.LASF505:
	.string	"_IO_lock_t"
.LASF472:
	.string	"getuid"
.LASF391:
	.string	"__asan_handle_no_return"
.LASF137:
	.string	"sockaddr_in"
.LASF34:
	.string	"timeval"
.LASF473:
	.string	"getcwd"
.LASF370:
	.string	"httpd_err408title"
.LASF397:
	.string	"fdwatch_logstats"
.LASF139:
	.string	"sin_port"
.LASF409:
	.string	"strdup"
.LASF102:
	.string	"timezone"
.LASF349:
	.string	"do_vhost"
.LASF299:
	.string	"wakeup_connection"
.LASF11:
	.string	"__mode_t"
.LASF395:
	.string	"httpd_logstats"
.LASF257:
	.string	"bytes_since_avg"
.LASF295:
	.string	"no_value_required"
.LASF185:
	.string	"checked_idx"
.LASF69:
	.string	"_IO_read_ptr"
.LASF213:
	.string	"maxorigfilename"
.LASF338:
	.string	"newlen"
.LASF144:
	.string	"sin6_port"
.LASF423:
	.string	"strcmp"
.LASF100:
	.string	"_pos"
.LASF23:
	.string	"__socklen_t"
.LASF365:
	.string	"stdin"
.LASF489:
	.string	"setgid"
.LASF400:
	.string	"__errno_location"
.LASF116:
	.string	"sa_family"
.LASF141:
	.string	"sin_zero"
.LASF337:
	.string	"elapsed"
.LASF445:
	.string	"httpd_close_conn"
.LASF80:
	.string	"_markers"
.LASF166:
	.string	"cgi_count"
.LASF174:
	.string	"vhost"
.LASF431:
	.string	"malloc"
.LASF233:
	.string	"tildemapped"
.LASF300:
	.string	"logstats"
.LASF495:
	.string	"fchown"
.LASF440:
	.string	"match"
.LASF467:
	.string	"gai_strerror"
.LASF277:
	.string	"gotv4P"
.LASF35:
	.string	"tv_usec"
.LASF129:
	.string	"in_addr_t"
.LASF161:
	.string	"binding_hostname"
.LASF256:
	.string	"rate"
.LASF238:
	.string	"conn_fd"
.LASF187:
	.string	"method"
.LASF235:
	.string	"last_byte_index"
.LASF89:
	.string	"_offset"
.LASF223:
	.string	"maxresponse"
.LASF45:
	.string	"st_gid"
.LASF479:
	.string	"tmr_init"
.LASF415:
	.string	"strcasecmp"
.LASF321:
	.string	"re_open_logfile"
.LASF260:
	.string	"conn_state"
.LASF247:
	.string	"periodic"
.LASF368:
	.string	"httpd_err400title"
.LASF451:
	.string	"tmr_create"
.LASF444:
	.string	"free"
.LASF351:
	.string	"logfile"
.LASF420:
	.string	"__asan_report_store1"
.LASF401:
	.string	"__asan_report_store4"
.LASF377:
	.string	"stats_time"
.LASF3:
	.string	"long unsigned int"
.LASF406:
	.string	"chdir"
.LASF429:
	.string	"strcpy"
.LASF188:
	.string	"status"
.LASF83:
	.string	"_flags2"
.LASF122:
	.string	"SHUT_RD"
.LASF48:
	.string	"st_size"
.LASF280:
	.string	"gotv6P"
.LASF71:
	.string	"_IO_read_base"
.LASF246:
	.string	"msecs"
.LASF478:
	.string	"sigset"
.LASF454:
	.string	"httpd_realloc_str"
.LASF314:
	.string	"line"
.LASF405:
	.string	"alarm"
.LASF96:
	.string	"_unused2"
.LASF323:
	.string	"handle_newconnect"
.LASF150:
	.string	"ai_family"
.LASF466:
	.string	"freeaddrinfo"
.LASF151:
	.string	"ai_socktype"
.LASF339:
	.string	"linger_clear_connection"
.LASF418:
	.string	"__builtin___asan_report_load1"
.LASF57:
	.string	"iov_len"
.LASF468:
	.string	"getpid"
.LASF462:
	.string	"write"
.LASF167:
	.string	"charset"
.LASF316:
	.string	"argc"
.LASF232:
	.string	"got_range"
.LASF84:
	.string	"_old_offset"
.LASF318:
	.string	"argn"
.LASF317:
	.string	"argv"
.LASF20:
	.string	"__blkcnt_t"
.LASF220:
	.string	"maxreqhost"
.LASF197:
	.string	"pathinfo"
.LASF103:
	.string	"tz_minuteswest"
.LASF206:
	.string	"reqhost"
.LASF10:
	.string	"__ino_t"
.LASF369:
	.string	"httpd_err400form"
.LASF266:
	.string	"wakeup_timer"
.LASF132:
	.string	"__u6_addr8"
.LASF193:
	.string	"protocol"
.LASF373:
	.string	"httpd_err503form"
.LASF37:
	.string	"long long int"
.LASF449:
	.string	"tmr_cancel"
.LASF502:
	.string	"GNU C11 5.2.0 -mtune=generic -march=x86-64 -g -O2 -fno-inline -fsanitize=address"
.LASF469:
	.string	"strrchr"
.LASF457:
	.string	"httpd_parse_request"
.LASF503:
	.string	"thttpd.c"
.LASF474:
	.string	"memcpy"
.LASF264:
	.string	"started_at"
.LASF55:
	.string	"iovec"
.LASF258:
	.string	"num_sending"
.LASF483:
	.string	"fdwatch"
.LASF74:
	.string	"_IO_write_end"
.LASF181:
	.string	"client_addr"
.LASF361:
	.string	"httpd_conn_count"
.LASF384:
	.string	"__asan_report_load4"
.LASF282:
	.string	"hints"
.LASF425:
	.string	"__builtin_puts"
.LASF177:
	.string	"local_pattern"
.LASF234:
	.string	"first_byte_index"
.LASF455:
	.string	"read"
.LASF75:
	.string	"_IO_buf_base"
.LASF2:
	.string	"unsigned int"
.LASF288:
	.string	"handle_hup"
.LASF422:
	.string	"perror"
.LASF270:
	.string	"end_byte_index"
.LASF46:
	.string	"__pad0"
.LASF61:
	.string	"pw_uid"
.LASF91:
	.string	"__pad2"
.LASF92:
	.string	"__pad3"
.LASF93:
	.string	"__pad4"
.LASF94:
	.string	"__pad5"
.LASF99:
	.string	"_sbuf"
.LASF27:
	.string	"pid_t"
.LASF325:
	.string	"check_throttles"
.LASF271:
	.string	"next_byte_index"
.LASF204:
	.string	"cookie"
.LASF18:
	.string	"__suseconds_t"
.LASF113:
	.string	"SOCK_NONBLOCK"
.LASF359:
	.string	"max_connects"
.LASF242:
	.string	"TimerProc"
.LASF123:
	.string	"SHUT_WR"
.LASF219:
	.string	"maxaccepte"
.LASF309:
	.string	"e_strdup"
.LASF68:
	.string	"_flags"
.LASF284:
	.string	"gaierr"
.LASF504:
	.string	"/u/eng/class/classsbk/sthttpd-2.27.0/src"
.LASF217:
	.string	"maxquery"
.LASF387:
	.string	"__asan_report_store8"
.LASF95:
	.string	"_mode"
.LASF487:
	.string	"getpwnam"
.LASF496:
	.string	"__asan_unregister_globals"
.LASF215:
	.string	"maxencodings"
.LASF135:
	.string	"in6_addr"
.LASF42:
	.string	"st_nlink"
.LASF26:
	.string	"off_t"
.LASF374:
	.string	"JunkClientData"
.LASF379:
	.string	"stats_bytes"
.LASF322:
	.string	"retchmod"
.LASF54:
	.string	"__unused"
.LASF347:
	.string	"data_dir"
.LASF306:
	.string	"handle_alrm"
.LASF198:
	.string	"query"
.LASF307:
	.string	"handle_chld"
.LASF202:
	.string	"accepte"
.LASF413:
	.string	"strspn"
.LASF154:
	.string	"ai_addr"
.LASF203:
	.string	"acceptl"
.LASF494:
	.string	"strncmp"
.LASF143:
	.string	"sin6_family"
.LASF459:
	.string	"httpd_ntoa"
.LASF66:
	.string	"FILE"
.LASF15:
	.string	"__pid_t"
.LASF404:
	.string	"tmr_cleanup"
.LASF40:
	.string	"st_dev"
.LASF231:
	.string	"one_one"
.LASF33:
	.string	"timespec"
.LASF106:
	.string	"SOCK_DGRAM"
.LASF453:
	.string	"httpd_send_err"
.LASF176:
	.string	"url_pattern"
.LASF336:
	.string	"coast"
.LASF484:
	.string	"fdwatch_check_fd"
.LASF36:
	.string	"long long unsigned int"
.LASF114:
	.string	"sa_family_t"
.LASF160:
	.string	"httpd_sockaddr"
.LASF262:
	.string	"tnums"
.LASF126:
	.string	"uint16_t"
.LASF13:
	.string	"__off_t"
.LASF291:
	.string	"update_throttles"
.LASF475:
	.string	"__builtin_memcpy"
.LASF399:
	.string	"gettimeofday"
.LASF157:
	.string	"sa_in"
.LASF117:
	.string	"sa_data"
.LASF261:
	.string	"next_free_connect"
.LASF480:
	.string	"httpd_initialize"
.LASF352:
	.string	"pidfile"
.LASF303:
	.string	"show_stats"
.LASF437:
	.string	"httpd_get_conn"
.LASF362:
	.string	"got_hup"
.LASF224:
	.string	"responselen"
.LASF346:
	.string	"debug"
.LASF115:
	.string	"sockaddr"
.LASF17:
	.string	"__time_t"
.LASF148:
	.string	"addrinfo"
.LASF229:
	.string	"hostname"
.LASF320:
	.string	"throttlefile"
.LASF463:
	.string	"memset"
.LASF486:
	.string	"setsid"
.LASF240:
	.string	"httpd_conn"
.LASF428:
	.string	"sscanf"
.LASF78:
	.string	"_IO_backup_base"
.LASF87:
	.string	"_shortbuf"
.LASF62:
	.string	"pw_gid"
.LASF212:
	.string	"maxdecodedurl"
.LASF354:
	.string	"throttles"
.LASF432:
	.string	"realloc"
.LASF355:
	.string	"numthrottles"
.LASF275:
	.string	"sa4P"
.LASF200:
	.string	"useragent"
.LASF98:
	.string	"_next"
.LASF14:
	.string	"__off64_t"
.LASF130:
	.string	"in_addr"
.LASF356:
	.string	"maxthrottles"
.LASF331:
	.string	"finish_connection"
.LASF430:
	.string	"strstr"
.LASF410:
	.string	"fopen"
.LASF326:
	.string	"shut_down"
.LASF302:
	.string	"stats_secs"
.LASF345:
	.string	"argv0"
.LASF412:
	.string	"strchr"
.LASF190:
	.string	"bytes_sent"
.LASF76:
	.string	"_IO_buf_end"
.LASF488:
	.string	"setgroups"
.LASF341:
	.string	"num_ready"
.LASF447:
	.string	"tmr_destroy"
.LASF281:
	.string	"tind"
.LASF448:
	.string	"closelog"
.LASF136:
	.string	"__in6_u"
.LASF112:
	.string	"SOCK_CLOEXEC"
.LASF296:
	.string	"name"
.LASF435:
	.string	"fcntl"
.LASF390:
	.string	"fprintf"
.LASF163:
	.string	"port"
.LASF319:
	.string	"read_throttlefile"
.LASF111:
	.string	"SOCK_PACKET"
.LASF344:
	.string	"pidfp"
.LASF121:
	.string	"__ss_padding"
.LASF118:
	.string	"sockaddr_storage"
.LASF367:
	.string	"stderr"
.LASF5:
	.string	"short int"
.LASF199:
	.string	"referer"
.LASF382:
	.string	"_GLOBAL__sub_I_00099_1_terminate"
.LASF253:
	.string	"pattern"
.LASF328:
	.string	"handle_term"
.LASF222:
	.string	"maxremoteuser"
.LASF348:
	.string	"do_chroot"
.LASF501:
	.string	"__builtin___asan_register_globals"
.LASF32:
	.string	"tv_nsec"
.LASF278:
	.string	"sa6P"
.LASF308:
	.string	"usage"
.LASF394:
	.string	"fdwatch_add_fd"
.LASF433:
	.string	"chmod"
.LASF403:
	.string	"mmc_cleanup"
.LASF421:
	.string	"__builtin___asan_report_store1"
.LASF86:
	.string	"_vtable_offset"
.LASF402:
	.string	"__builtin___asan_report_store4"
.LASF330:
	.string	"clear_connection"
.LASF388:
	.string	"__builtin___asan_report_store8"
.LASF60:
	.string	"pw_passwd"
.LASF333:
	.string	"idle"
.LASF169:
	.string	"listen4_fd"
.LASF38:
	.string	"__sighandler_t"
.LASF357:
	.string	"connects"
.LASF427:
	.string	"__isoc99_sscanf"
.LASF201:
	.string	"accept"
.LASF170:
	.string	"listen6_fd"
.LASF358:
	.string	"num_connects"
.LASF497:
	.string	"__builtin___asan_unregister_globals"
.LASF211:
	.string	"response"
.LASF426:
	.string	"strlen"
.LASF268:
	.string	"wouldblock_delay"
.LASF186:
	.string	"checked_state"
.LASF263:
	.string	"numtnums"
.LASF158:
	.string	"sa_in6"
.LASF364:
	.string	"watchdog_flag"
.LASF59:
	.string	"pw_name"
.LASF43:
	.string	"st_mode"
.LASF8:
	.string	"__uid_t"
.LASF189:
	.string	"bytes_to_send"
.LASF490:
	.string	"initgroups"
.LASF70:
	.string	"_IO_read_end"
.LASF441:
	.string	"fdwatch_del_fd"
.LASF207:
	.string	"hdrhost"
.LASF131:
	.string	"s_addr"
.LASF236:
	.string	"keep_alive"
.LASF133:
	.string	"__u6_addr16"
.LASF196:
	.string	"encodings"
.LASF127:
	.string	"uint32_t"
.LASF485:
	.string	"fdwatch_get_next_client_data"
.LASF82:
	.string	"_fileno"
.LASF104:
	.string	"tz_dsttime"
.LASF218:
	.string	"maxaccept"
.LASF287:
	.string	"oerrno"
.LASF398:
	.string	"tmr_logstats"
.LASF414:
	.string	"strcspn"
.LASF476:
	.string	"daemon"
.LASF389:
	.string	"syslog"
.LASF214:
	.string	"maxexpnfilename"
.LASF376:
	.string	"start_time"
.LASF244:
	.string	"timer_proc"
.LASF1:
	.string	"short unsigned int"
.LASF366:
	.string	"stdout"
.LASF252:
	.string	"Timer"
.LASF452:
	.string	"httpd_write_response"
.LASF226:
	.string	"range_if"
.LASF56:
	.string	"iov_base"
.LASF274:
	.string	"lookup_hostname"
.LASF259:
	.string	"throttletab"
.LASF292:
	.string	"nowP"
.LASF73:
	.string	"_IO_write_ptr"
.LASF248:
	.string	"time"
.LASF245:
	.string	"client_data"
.LASF30:
	.string	"int64_t"
.LASF386:
	.string	"__builtin___asan_report_load4"
.LASF279:
	.string	"sa6_len"
.LASF385:
	.string	"__builtin___asan_report_load8"
.LASF342:
	.string	"gotv4"
.LASF343:
	.string	"gotv6"
.LASF175:
	.string	"global_passwd"
.LASF411:
	.string	"fgets"
.LASF134:
	.string	"__u6_addr32"
.LASF41:
	.string	"st_ino"
.LASF12:
	.string	"__nlink_t"
.LASF171:
	.string	"no_log"
.LASF251:
	.string	"hash"
.LASF159:
	.string	"sa_stor"
.LASF145:
	.string	"sin6_flowinfo"
.LASF446:
	.string	"mmc_destroy"
.LASF482:
	.string	"tmr_mstimeout"
.LASF250:
	.string	"next"
.LASF24:
	.string	"gid_t"
.LASF90:
	.string	"__pad1"
.LASF239:
	.string	"file_address"
.LASF249:
	.string	"prev"
.LASF31:
	.string	"tv_sec"
.LASF152:
	.string	"ai_protocol"
.LASF477:
	.string	"fdwatch_get_nfiles"
.LASF128:
	.string	"in_port_t"
.LASF380:
	.string	"stats_simultaneous"
.LASF216:
	.string	"maxpathinfo"
.LASF298:
	.string	"value_required"
.LASF183:
	.string	"read_size"
.LASF51:
	.string	"st_atim"
.LASF208:
	.string	"hostdir"
.LASF436:
	.string	"httpd_set_logfp"
.LASF191:
	.string	"encodedurl"
	.ident	"GCC: (GNU) 5.2.0"
	.section	.note.GNU-stack,"",@progbits
