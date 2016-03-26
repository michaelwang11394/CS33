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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"  thttpd - %ld connections (%g/sec), %d max simultaneous, %lld bytes (%g/sec), %d httpd_conns allocated"
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.type	thttpd_logstats, @function
thttpd_logstats:
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
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"throttle #%d '%.80s' rate %ld greatly exceeding limit %ld; %d sending"
	.align 8
.LC4:
	.string	"throttle #%d '%.80s' rate %ld exceeding limit %ld; %d sending"
	.align 8
.LC5:
	.string	"throttle #%d '%.80s' rate %ld lower than minimum %ld; %d sending"
	.section	.text.unlikely
.LCOLDB6:
	.text
.LHOTB6:
	.p2align 4,,15
	.type	update_throttles, @function
update_throttles:
.LFB25:
	.loc 1 1933 0
	.cfi_startproc
.LVL4:
	.loc 1 1942 0
	movl	numthrottles(%rip), %r8d
	.loc 1 1933 0
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movabsq	$6148914691236517206, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebx, %ebx
	.loc 1 1942 0
	testl	%r8d, %r8d
	jg	.L25
	jmp	.L14
.LVL5:
	.p2align 4,,10
	.p2align 3
.L35:
	.loc 1 1950 0
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	movq	(%rcx), %rcx
	movl	%ebx, %edx
	pushq	%rax
	.cfi_def_cfa_offset 48
	movl	$.LC3, %esi
	movl	$5, %edi
.LVL6:
.L32:
	.loc 1 1952 0
	xorl	%eax, %eax
	call	syslog
.LVL7:
	movq	%rbp, %rcx
	addq	throttles(%rip), %rcx
	popq	%rsi
	.cfi_def_cfa_offset 40
	popq	%rdi
	.cfi_def_cfa_offset 32
	movq	24(%rcx), %r8
.LVL8:
.L10:
	.loc 1 1954 0
	movq	16(%rcx), %r9
	cmpq	%r8, %r9
	jle	.L11
	.loc 1 1954 0 is_stmt 0 discriminator 1
	movl	40(%rcx), %eax
	testl	%eax, %eax
	je	.L11
	.loc 1 1956 0 is_stmt 1
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	movq	(%rcx), %rcx
	movl	%ebx, %edx
	pushq	%rax
	.cfi_def_cfa_offset 48
	movl	$.LC5, %esi
	xorl	%eax, %eax
	movl	$5, %edi
.LVL9:
	call	syslog
.LVL10:
	popq	%rax
	.cfi_def_cfa_offset 40
	popq	%rdx
	.cfi_def_cfa_offset 32
.LVL11:
	.p2align 4,,10
	.p2align 3
.L11:
	.loc 1 1942 0 discriminator 2
	addl	$1, %ebx
.LVL12:
	addq	$48, %rbp
	cmpl	%ebx, numthrottles(%rip)
	jle	.L14
.LVL13:
.L25:
	.loc 1 1944 0
	movq	%rbp, %rcx
	addq	throttles(%rip), %rcx
	movq	32(%rcx), %rax
	movq	24(%rcx), %rdx
	.loc 1 1947 0
	movq	8(%rcx), %r9
	.loc 1 1945 0
	movq	$0, 32(%rcx)
	.loc 1 1944 0
	movq	%rax, %rsi
	shrq	$63, %rsi
	addq	%rsi, %rax
	sarq	%rax
	leaq	(%rax,%rdx,2), %rsi
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%r12
	subq	%rsi, %rdx
	.loc 1 1947 0
	cmpq	%r9, %rdx
	.loc 1 1944 0
	movq	%rdx, %r8
	movq	%rdx, 24(%rcx)
	.loc 1 1947 0
	jle	.L10
	.loc 1 1947 0 is_stmt 0 discriminator 1
	movl	40(%rcx), %eax
	testl	%eax, %eax
	je	.L11
	.loc 1 1949 0 is_stmt 1
	leaq	(%r9,%r9), %rdx
	cmpq	%rdx, %r8
	jg	.L35
	.loc 1 1952 0
	subq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	(%rcx), %rcx
	movl	%ebx, %edx
	pushq	%rax
	.cfi_def_cfa_offset 48
	movl	$.LC4, %esi
	movl	$6, %edi
.LVL14:
	jmp	.L32
.LVL15:
	.p2align 4,,10
	.p2align 3
.L14:
	.cfi_restore_state
	.loc 1 1963 0
	movl	max_connects(%rip), %eax
	testl	%eax, %eax
	jle	.L6
	subl	$1, %eax
	movq	connects(%rip), %rsi
	movq	throttles(%rip), %r10
	leaq	9(%rax,%rax,8), %r11
	salq	$4, %r11
	addq	%rsi, %r11
	jmp	.L16
.LVL16:
	.p2align 4,,10
	.p2align 3
.L17:
	addq	$144, %rsi
.LVL17:
	cmpq	%r11, %rsi
	je	.L6
.LVL18:
.L16:
	.loc 1 1966 0
	movl	(%rsi), %eax
	subl	$2, %eax
	cmpl	$1, %eax
	ja	.L17
	.loc 1 1969 0
	movl	56(%rsi), %eax
	.loc 1 1968 0
	movq	$-1, 64(%rsi)
.LVL19:
	.loc 1 1969 0
	testl	%eax, %eax
	jle	.L17
	subl	$1, %eax
	leaq	16(%rsi), %rcx
	movq	$-1, %rdi
.LVL20:
	leaq	20(%rsi,%rax,4), %r9
	jmp	.L20
.LVL21:
	.p2align 4,,10
	.p2align 3
.L36:
	movq	64(%rsi), %rdi
.L20:
.LVL22:
	.loc 1 1972 0
	movslq	(%rcx), %rax
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	addq	%r10, %rax
	movslq	40(%rax), %r8
	movq	8(%rax), %rax
	cqto
	idivq	%r8
.LVL23:
	.loc 1 1973 0
	cmpq	$-1, %rdi
	je	.L33
	.loc 1 1976 0
	cmpq	%rdi, %rax
	cmovg	%rdi, %rax
.LVL24:
.L33:
	addq	$4, %rcx
.LVL25:
	movq	%rax, 64(%rsi)
.LVL26:
	.loc 1 1969 0
	cmpq	%r9, %rcx
	jne	.L36
	addq	$144, %rsi
.LVL27:
	.loc 1 1963 0
	cmpq	%r11, %rsi
	jne	.L16
.LVL28:
.L6:
	.loc 1 1980 0
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	update_throttles, .-update_throttles
	.section	.text.unlikely
.LCOLDE6:
	.text
.LHOTE6:
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"%s: no value required for %s option\n"
	.section	.text.unlikely
.LCOLDB8:
	.text
.LHOTB8:
	.p2align 4,,15
	.type	no_value_required, @function
no_value_required:
.LFB14:
	.loc 1 1207 0
	.cfi_startproc
.LVL29:
	.loc 1 1208 0
	testq	%rsi, %rsi
	jne	.L41
	rep ret
.L41:
	movq	%rdi, %rcx
	.loc 1 1207 0
	pushq	%rax
	.cfi_def_cfa_offset 16
	.loc 1 1210 0
	movq	stderr(%rip), %rdi
.LVL30:
	movq	argv0(%rip), %rdx
	movl	$.LC7, %esi
.LVL31:
	xorl	%eax, %eax
	call	fprintf
.LVL32:
	.loc 1 1213 0
	movl	$1, %edi
	call	exit
.LVL33:
	.cfi_endproc
.LFE14:
	.size	no_value_required, .-no_value_required
	.section	.text.unlikely
.LCOLDE8:
	.text
.LHOTE8:
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"%s: value required for %s option\n"
	.section	.text.unlikely
.LCOLDB10:
	.text
.LHOTB10:
	.p2align 4,,15
	.type	value_required, @function
value_required:
.LFB13:
	.loc 1 1195 0
	.cfi_startproc
.LVL34:
	.loc 1 1196 0
	testq	%rsi, %rsi
	je	.L46
	rep ret
.L46:
	movq	%rdi, %rcx
	.loc 1 1195 0
	pushq	%rax
	.cfi_def_cfa_offset 16
	.loc 1 1198 0
	movq	stderr(%rip), %rdi
.LVL35:
	movq	argv0(%rip), %rdx
	movl	$.LC9, %esi
.LVL36:
	xorl	%eax, %eax
	call	fprintf
.LVL37:
	.loc 1 1200 0
	movl	$1, %edi
	call	exit
.LVL38:
	.cfi_endproc
.LFE13:
	.size	value_required, .-value_required
	.section	.text.unlikely
.LCOLDE10:
	.text
.LHOTE10:
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"usage:  %s [-C configfile] [-p port] [-d dir] [-r|-nor] [-dd data_dir] [-s|-nos] [-v|-nov] [-g|-nog] [-u user] [-c cgipat] [-t throttles] [-h host] [-l logfile] [-i pidfile] [-T charset] [-P P3P] [-M maxage] [-V] [-D]\n"
	.section	.text.unlikely
.LCOLDB12:
.LHOTB12:
	.type	usage, @function
usage:
.LFB11:
	.loc 1 990 0
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	.loc 1 991 0
	movq	stderr(%rip), %rdi
	movl	$.LC11, %esi
	movq	argv0(%rip), %rdx
	xorl	%eax, %eax
	call	fprintf
.LVL39:
	.loc 1 994 0
	movl	$1, %edi
	call	exit
.LVL40:
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
.LFB30:
	.loc 1 2105 0
	.cfi_startproc
.LVL41:
	.loc 1 2110 0
	cmpl	$3, (%rdi)
	.loc 1 2109 0
	movq	$0, 96(%rdi)
	.loc 1 2110 0
	je	.L51
	rep ret
	.p2align 4,,10
	.p2align 3
.L51:
	.loc 1 2113 0
	movq	8(%rdi), %rax
	.loc 1 2112 0
	movl	$2, (%rdi)
	.loc 1 2113 0
	movq	%rdi, %rsi
.LVL42:
	movl	$1, %edx
	movl	704(%rax), %eax
	movl	%eax, %edi
.LVL43:
	jmp	fdwatch_add_fd
.LVL44:
	.cfi_endproc
.LFE30:
	.size	wakeup_connection, .-wakeup_connection
	.section	.text.unlikely
.LCOLDE13:
	.text
.LHOTE13:
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"up %ld seconds, stats for %ld seconds:"
	.section	.text.unlikely
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4,,15
	.type	logstats, @function
logstats:
.LFB34:
	.loc 1 2149 0
	.cfi_startproc
.LVL45:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 2154 0
	testq	%rdi, %rdi
	je	.L56
.L53:
	.loc 1 2159 0
	movq	(%rdi), %rax
.LVL46:
	.loc 1 2163 0
	movl	$1, %ecx
	.loc 1 2165 0
	movl	$.LC14, %esi
	movl	$6, %edi
.LVL47:
	.loc 1 2160 0
	movq	%rax, %rdx
	.loc 1 2163 0
	movq	%rax, %rbx
	.loc 1 2160 0
	subq	start_time(%rip), %rdx
.LVL48:
	.loc 1 2163 0
	subq	stats_time(%rip), %rbx
.LVL49:
	.loc 1 2164 0
	movq	%rax, stats_time(%rip)
	.loc 1 2163 0
	cmove	%rcx, %rbx
.LVL50:
	.loc 1 2165 0
	xorl	%eax, %eax
.LVL51:
	movq	%rbx, %rcx
	call	syslog
.LVL52:
	.loc 1 2168 0
	movq	%rbx, %rdi
	call	thttpd_logstats
.LVL53:
	.loc 1 2169 0
	movq	%rbx, %rdi
	call	httpd_logstats
.LVL54:
	.loc 1 2170 0
	movq	%rbx, %rdi
	call	mmc_logstats
.LVL55:
	.loc 1 2171 0
	movq	%rbx, %rdi
	call	fdwatch_logstats
.LVL56:
	.loc 1 2172 0
	movq	%rbx, %rdi
	call	tmr_logstats
.LVL57:
	.loc 1 2173 0
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL58:
	ret
.LVL59:
	.p2align 4,,10
	.p2align 3
.L56:
	.cfi_restore_state
	.loc 1 2156 0
	movq	%rsp, %rdi
.LVL60:
	xorl	%esi, %esi
	call	gettimeofday
.LVL61:
	.loc 1 2157 0
	movq	%rsp, %rdi
	jmp	.L53
	.cfi_endproc
.LFE34:
	.size	logstats, .-logstats
	.section	.text.unlikely
.LCOLDE15:
	.text
.LHOTE15:
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4,,15
	.type	show_stats, @function
show_stats:
.LFB33:
	.loc 1 2140 0
	.cfi_startproc
.LVL62:
	.loc 1 2141 0
	movq	%rsi, %rdi
.LVL63:
	jmp	logstats
.LVL64:
	.cfi_endproc
.LFE33:
	.size	show_stats, .-show_stats
	.section	.text.unlikely
.LCOLDE16:
	.text
.LHOTE16:
	.section	.text.unlikely
.LCOLDB17:
	.text
.LHOTB17:
	.p2align 4,,15
	.type	handle_usr2, @function
handle_usr2:
.LFB6:
	.loc 1 282 0
	.cfi_startproc
.LVL65:
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
.LVL66:
	movl	(%rax), %ebp
.LVL67:
	movq	%rax, %rbx
	.loc 1 290 0
	xorl	%edi, %edi
	call	logstats
.LVL68:
	.loc 1 293 0
	movl	%ebp, (%rbx)
	.loc 1 294 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL69:
	ret
	.cfi_endproc
.LFE6:
	.size	handle_usr2, .-handle_usr2
	.section	.text.unlikely
.LCOLDE17:
	.text
.LHOTE17:
	.section	.text.unlikely
.LCOLDB18:
	.text
.LHOTB18:
	.p2align 4,,15
	.type	occasional, @function
occasional:
.LFB32:
	.loc 1 2130 0
	.cfi_startproc
.LVL70:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 2131 0
	movq	%rsi, %rdi
.LVL71:
	call	mmc_cleanup
.LVL72:
	.loc 1 2132 0
	call	tmr_cleanup
.LVL73:
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
.LCOLDE18:
	.text
.LHOTE18:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC19:
	.string	"/tmp"
	.section	.text.unlikely
.LCOLDB20:
	.text
.LHOTB20:
	.p2align 4,,15
	.type	handle_alrm, @function
handle_alrm:
.LFB7:
	.loc 1 300 0
	.cfi_startproc
.LVL74:
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
.LVL75:
	movq	%rax, %rbx
	movl	(%rax), %ebp
.LVL76:
	.loc 1 304 0
	movl	watchdog_flag(%rip), %eax
	testl	%eax, %eax
	je	.L65
	.loc 1 318 0
	movl	$360, %edi
	.loc 1 311 0
	movl	$0, watchdog_flag(%rip)
	.loc 1 318 0
	call	alarm
.LVL77:
	.loc 1 321 0
	movl	%ebp, (%rbx)
	.loc 1 322 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL78:
	ret
.LVL79:
.L65:
	.cfi_restore_state
	.loc 1 307 0
	movl	$.LC19, %edi
	call	chdir
.LVL80:
	.loc 1 309 0
	call	abort
.LVL81:
	.cfi_endproc
.LFE7:
	.size	handle_alrm, .-handle_alrm
	.section	.text.unlikely
.LCOLDE20:
	.text
.LHOTE20:
	.section	.rodata.str1.1
.LC21:
	.string	"child wait - %m"
	.section	.text.unlikely
.LCOLDB22:
	.text
.LHOTB22:
	.p2align 4,,15
	.type	handle_chld, @function
handle_chld:
.LFB3:
	.loc 1 185 0
	.cfi_startproc
.LVL82:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	.loc 1 224 0
	xorl	%ebp, %ebp
	.loc 1 185 0
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 186 0
	call	__errno_location
.LVL83:
	movl	(%rax), %r12d
.LVL84:
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L67:
	.loc 1 199 0
	leaq	12(%rsp), %rsi
	movl	$1, %edx
	movl	$-1, %edi
	call	waitpid
.LVL85:
	.loc 1 203 0
	testl	%eax, %eax
	je	.L68
	.loc 1 205 0
	js	.L83
	.loc 1 222 0
	movq	hs(%rip), %rdx
	testq	%rdx, %rdx
	je	.L67
	.loc 1 224 0
	movl	36(%rdx), %eax
.LVL86:
	subl	$1, %eax
	cmovs	%ebp, %eax
	movl	%eax, 36(%rdx)
	jmp	.L67
.LVL87:
	.p2align 4,,10
	.p2align 3
.L83:
	.loc 1 207 0
	movl	(%rbx), %eax
.LVL88:
	cmpl	$4, %eax
	je	.L67
	cmpl	$11, %eax
	je	.L67
	.loc 1 212 0
	cmpl	$10, %eax
	je	.L68
	.loc 1 213 0
	movl	$.LC21, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.LVL89:
.L68:
	.loc 1 231 0
	movl	%r12d, (%rbx)
	.loc 1 232 0
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL90:
	ret
	.cfi_endproc
.LFE3:
	.size	handle_chld, .-handle_chld
	.section	.text.unlikely
.LCOLDE22:
	.text
.LHOTE22:
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"out of memory copying a string"
	.align 8
.LC24:
	.string	"%s: out of memory copying a string\n"
	.section	.text.unlikely
.LCOLDB25:
	.text
.LHOTB25:
	.p2align 4,,15
	.type	e_strdup, @function
e_strdup:
.LFB15:
	.loc 1 1220 0
	.cfi_startproc
.LVL91:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 1223 0
	call	strdup
.LVL92:
	.loc 1 1224 0
	testq	%rax, %rax
	je	.L87
	.loc 1 1231 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L87:
	.cfi_restore_state
	.loc 1 1226 0
	movl	$.LC23, %esi
	movl	$2, %edi
	call	syslog
.LVL93:
	.loc 1 1227 0
	movq	stderr(%rip), %rdi
	movq	argv0(%rip), %rdx
	movl	$.LC24, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL94:
	.loc 1 1228 0
	movl	$1, %edi
	call	exit
.LVL95:
	.cfi_endproc
.LFE15:
	.size	e_strdup, .-e_strdup
	.section	.text.unlikely
.LCOLDE25:
	.text
.LHOTE25:
	.section	.rodata.str1.1
.LC26:
	.string	"r"
.LC27:
	.string	" \t\n\r"
.LC28:
	.string	"debug"
.LC29:
	.string	"port"
.LC30:
	.string	"dir"
.LC31:
	.string	"chroot"
.LC32:
	.string	"nochroot"
.LC33:
	.string	"data_dir"
.LC34:
	.string	"symlink"
.LC35:
	.string	"nosymlink"
.LC36:
	.string	"symlinks"
.LC37:
	.string	"nosymlinks"
.LC38:
	.string	"user"
.LC39:
	.string	"cgipat"
.LC40:
	.string	"cgilimit"
.LC41:
	.string	"urlpat"
.LC42:
	.string	"noemptyreferers"
.LC43:
	.string	"localpat"
.LC44:
	.string	"throttles"
.LC45:
	.string	"host"
.LC46:
	.string	"logfile"
.LC47:
	.string	"vhost"
.LC48:
	.string	"novhost"
.LC49:
	.string	"globalpasswd"
.LC50:
	.string	"noglobalpasswd"
.LC51:
	.string	"pidfile"
.LC52:
	.string	"charset"
.LC53:
	.string	"p3p"
.LC54:
	.string	"max_age"
	.section	.rodata.str1.8
	.align 8
.LC55:
	.string	"%s: unknown config option '%s'\n"
	.section	.text.unlikely
.LCOLDB56:
	.text
.LHOTB56:
	.p2align 4,,15
	.type	read_config, @function
read_config:
.LFB12:
	.loc 1 1000 0
	.cfi_startproc
.LVL96:
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	.loc 1 1008 0
	movl	$.LC26, %esi
	.loc 1 1000 0
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	subq	$112, %rsp
	.cfi_def_cfa_offset 160
	.loc 1 1008 0
	call	fopen
.LVL97:
	.loc 1 1009 0
	testq	%rax, %rax
	je	.L135
	movq	%rax, %r12
.LVL98:
	.loc 1 1031 0
	movabsq	$4294977024, %r14
.LVL99:
.L89:
	.loc 1 1015 0
	movq	%r12, %rdx
	movl	$1000, %esi
	movq	%rsp, %rdi
	call	fgets
.LVL100:
	testq	%rax, %rax
	je	.L139
	.loc 1 1018 0
	movl	$35, %esi
	movq	%rsp, %rdi
	call	strchr
.LVL101:
	testq	%rax, %rax
	je	.L90
	.loc 1 1019 0
	movb	$0, (%rax)
.L90:
.LVL102:
	.loc 1 1023 0
	movl	$.LC27, %esi
	movq	%rsp, %rdi
	call	strspn
.LVL103:
	leaq	(%rsp,%rax), %rbp
.LVL104:
	.loc 1 1026 0
	cmpb	$0, 0(%rbp)
	jne	.L131
	jmp	.L89
.LVL105:
	.p2align 4,,10
	.p2align 3
.L92:
	.loc 1 1035 0
	movl	$61, %esi
	movq	%rbp, %rdi
	call	strchr
.LVL106:
	.loc 1 1036 0
	testq	%rax, %rax
	je	.L126
	.loc 1 1037 0
	leaq	1(%rax), %r13
.LVL107:
	movb	$0, (%rax)
.LVL108:
.L94:
	.loc 1 1039 0
	movl	$.LC28, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL109:
	testl	%eax, %eax
	je	.L140
	.loc 1 1044 0
	movl	$.LC29, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL110:
	testl	%eax, %eax
	je	.L141
	.loc 1 1049 0
	movl	$.LC30, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL111:
	testl	%eax, %eax
	je	.L142
	.loc 1 1054 0
	movl	$.LC31, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL112:
	testl	%eax, %eax
	je	.L143
	.loc 1 1060 0
	movl	$.LC32, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL113:
	testl	%eax, %eax
	je	.L144
	.loc 1 1066 0
	movl	$.LC33, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL114:
	testl	%eax, %eax
	je	.L145
	.loc 1 1071 0
	movl	$.LC34, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL115:
	testl	%eax, %eax
	je	.L137
	.loc 1 1076 0
	movl	$.LC35, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL116:
	testl	%eax, %eax
	je	.L138
	.loc 1 1081 0
	movl	$.LC36, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL117:
	testl	%eax, %eax
	je	.L137
	.loc 1 1086 0
	movl	$.LC37, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL118:
	testl	%eax, %eax
	je	.L138
	.loc 1 1091 0
	movl	$.LC38, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL119:
	testl	%eax, %eax
	je	.L146
	.loc 1 1096 0
	movl	$.LC39, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL120:
	testl	%eax, %eax
	je	.L147
	.loc 1 1101 0
	movl	$.LC40, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL121:
	testl	%eax, %eax
	je	.L148
	.loc 1 1106 0
	movl	$.LC41, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL122:
	testl	%eax, %eax
	je	.L149
	.loc 1 1111 0
	movl	$.LC42, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL123:
	testl	%eax, %eax
	je	.L150
	.loc 1 1116 0
	movl	$.LC43, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL124:
	testl	%eax, %eax
	je	.L151
	.loc 1 1121 0
	movl	$.LC44, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL125:
	testl	%eax, %eax
	je	.L152
	.loc 1 1126 0
	movl	$.LC45, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL126:
	testl	%eax, %eax
	je	.L153
	.loc 1 1131 0
	movl	$.LC46, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL127:
	testl	%eax, %eax
	je	.L154
	.loc 1 1136 0
	movl	$.LC47, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL128:
	testl	%eax, %eax
	je	.L155
	.loc 1 1141 0
	movl	$.LC48, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL129:
	testl	%eax, %eax
	je	.L156
	.loc 1 1146 0
	movl	$.LC49, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL130:
	testl	%eax, %eax
	je	.L157
	.loc 1 1151 0
	movl	$.LC50, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL131:
	testl	%eax, %eax
	je	.L158
	.loc 1 1156 0
	movl	$.LC51, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL132:
	testl	%eax, %eax
	je	.L159
	.loc 1 1161 0
	movl	$.LC52, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL133:
	testl	%eax, %eax
	je	.L160
	.loc 1 1166 0
	movl	$.LC53, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL134:
	testl	%eax, %eax
	je	.L161
	.loc 1 1171 0
	movl	$.LC54, %esi
	movq	%rbp, %rdi
	call	strcasecmp
.LVL135:
	testl	%eax, %eax
	jne	.L122
	.loc 1 1173 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL136:
	.loc 1 1174 0
	movq	%r13, %rdi
	call	atoi
.LVL137:
	movl	%eax, max_age(%rip)
	.p2align 4,,10
	.p2align 3
.L96:
.LVL138:
	.loc 1 1185 0
	movl	$.LC27, %esi
	movq	%rbx, %rdi
	call	strspn
.LVL139:
	leaq	(%rbx,%rax), %rbp
.LVL140:
	.loc 1 1026 0
	cmpb	$0, 0(%rbp)
	je	.L89
.LVL141:
.L131:
	.loc 1 1029 0
	movl	$.LC27, %esi
	movq	%rbp, %rdi
	call	strcspn
.LVL142:
	leaq	0(%rbp,%rax), %rbx
.LVL143:
	.loc 1 1031 0
	movzbl	(%rbx), %eax
	cmpb	$32, %al
	ja	.L92
	btq	%rax, %r14
	jnc	.L92
	.p2align 4,,10
	.p2align 3
.L93:
	.loc 1 1032 0
	addq	$1, %rbx
.LVL144:
	.loc 1 1031 0
	movzbl	(%rbx), %edx
	.loc 1 1032 0
	movb	$0, -1(%rbx)
	.loc 1 1031 0
	cmpb	$32, %dl
	ja	.L92
	btq	%rdx, %r14
	jc	.L93
	jmp	.L92
.LVL145:
	.p2align 4,,10
	.p2align 3
.L140:
	.loc 1 1041 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	no_value_required
.LVL146:
	.loc 1 1042 0
	movl	$1, debug(%rip)
	jmp	.L96
.L141:
	.loc 1 1046 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL147:
	.loc 1 1047 0
	movq	%r13, %rdi
	call	atoi
.LVL148:
	movw	%ax, port(%rip)
	jmp	.L96
.LVL149:
.L126:
	xorl	%r13d, %r13d
	jmp	.L94
.LVL150:
.L142:
	.loc 1 1051 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL151:
	.loc 1 1052 0
	movq	%r13, %rdi
	call	e_strdup
.LVL152:
	movq	%rax, dir(%rip)
	jmp	.L96
.L143:
	.loc 1 1056 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	no_value_required
.LVL153:
	.loc 1 1057 0
	movl	$1, do_chroot(%rip)
	.loc 1 1058 0
	movl	$1, no_symlink_check(%rip)
	jmp	.L96
.L144:
	.loc 1 1062 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	no_value_required
.LVL154:
	.loc 1 1063 0
	movl	$0, do_chroot(%rip)
	.loc 1 1064 0
	movl	$0, no_symlink_check(%rip)
	jmp	.L96
.L137:
	.loc 1 1083 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	no_value_required
.LVL155:
	.loc 1 1084 0
	movl	$0, no_symlink_check(%rip)
	jmp	.L96
.L145:
	.loc 1 1068 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL156:
	.loc 1 1069 0
	movq	%r13, %rdi
	call	e_strdup
.LVL157:
	movq	%rax, data_dir(%rip)
	jmp	.L96
.L138:
	.loc 1 1088 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	no_value_required
.LVL158:
	.loc 1 1089 0
	movl	$1, no_symlink_check(%rip)
	jmp	.L96
.L146:
	.loc 1 1093 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL159:
	.loc 1 1094 0
	movq	%r13, %rdi
	call	e_strdup
.LVL160:
	movq	%rax, user(%rip)
	jmp	.L96
.L148:
	.loc 1 1103 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL161:
	.loc 1 1104 0
	movq	%r13, %rdi
	call	atoi
.LVL162:
	movl	%eax, cgi_limit(%rip)
	jmp	.L96
.L147:
	.loc 1 1098 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL163:
	.loc 1 1099 0
	movq	%r13, %rdi
	call	e_strdup
.LVL164:
	movq	%rax, cgi_pattern(%rip)
	jmp	.L96
.LVL165:
.L139:
	.loc 1 1189 0
	movq	%r12, %rdi
	call	fclose
.LVL166:
	.loc 1 1190 0
	addq	$112, %rsp
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
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.LVL167:
.L150:
	.cfi_restore_state
	.loc 1 1113 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	no_value_required
.LVL168:
	.loc 1 1114 0
	movl	$1, no_empty_referers(%rip)
	jmp	.L96
.L149:
	.loc 1 1108 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL169:
	.loc 1 1109 0
	movq	%r13, %rdi
	call	e_strdup
.LVL170:
	movq	%rax, url_pattern(%rip)
	jmp	.L96
.L151:
	.loc 1 1118 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL171:
	.loc 1 1119 0
	movq	%r13, %rdi
	call	e_strdup
.LVL172:
	movq	%rax, local_pattern(%rip)
	jmp	.L96
.L122:
	.loc 1 1178 0
	movq	stderr(%rip), %rdi
	movq	argv0(%rip), %rdx
	movq	%rbp, %rcx
	movl	$.LC55, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL173:
	.loc 1 1180 0
	movl	$1, %edi
	call	exit
.LVL174:
.L161:
	.loc 1 1168 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL175:
	.loc 1 1169 0
	movq	%r13, %rdi
	call	e_strdup
.LVL176:
	movq	%rax, p3p(%rip)
	jmp	.L96
.L160:
	.loc 1 1163 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL177:
	.loc 1 1164 0
	movq	%r13, %rdi
	call	e_strdup
.LVL178:
	movq	%rax, charset(%rip)
	jmp	.L96
.L159:
	.loc 1 1158 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL179:
	.loc 1 1159 0
	movq	%r13, %rdi
	call	e_strdup
.LVL180:
	movq	%rax, pidfile(%rip)
	jmp	.L96
.LVL181:
.L135:
	.loc 1 1011 0
	movq	%rbx, %rdi
	call	perror
.LVL182:
	.loc 1 1012 0
	movl	$1, %edi
	call	exit
.LVL183:
.L152:
	.loc 1 1123 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL184:
	.loc 1 1124 0
	movq	%r13, %rdi
	call	e_strdup
.LVL185:
	movq	%rax, throttlefile(%rip)
	jmp	.L96
.L154:
	.loc 1 1133 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL186:
	.loc 1 1134 0
	movq	%r13, %rdi
	call	e_strdup
.LVL187:
	movq	%rax, logfile(%rip)
	jmp	.L96
.L153:
	.loc 1 1128 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	value_required
.LVL188:
	.loc 1 1129 0
	movq	%r13, %rdi
	call	e_strdup
.LVL189:
	movq	%rax, hostname(%rip)
	jmp	.L96
.L158:
	.loc 1 1153 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	no_value_required
.LVL190:
	.loc 1 1154 0
	movl	$0, do_global_passwd(%rip)
	jmp	.L96
.L157:
	.loc 1 1148 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	no_value_required
.LVL191:
	.loc 1 1149 0
	movl	$1, do_global_passwd(%rip)
	jmp	.L96
.L156:
	.loc 1 1143 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	no_value_required
.LVL192:
	.loc 1 1144 0
	movl	$0, do_vhost(%rip)
	jmp	.L96
.L155:
	.loc 1 1138 0
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	no_value_required
.LVL193:
	.loc 1 1139 0
	movl	$1, do_vhost(%rip)
	jmp	.L96
	.cfi_endproc
.LFE12:
	.size	read_config, .-read_config
	.section	.text.unlikely
.LCOLDE56:
	.text
.LHOTE56:
	.section	.rodata.str1.1
.LC57:
	.string	"nobody"
.LC58:
	.string	"iso-8859-1"
.LC59:
	.string	""
.LC60:
	.string	"-V"
.LC61:
	.string	"thttpd/2.27.0 Oct 3, 2014"
.LC62:
	.string	"-C"
.LC63:
	.string	"-p"
.LC64:
	.string	"-d"
.LC65:
	.string	"-r"
.LC66:
	.string	"-nor"
.LC67:
	.string	"-dd"
.LC68:
	.string	"-s"
.LC69:
	.string	"-nos"
.LC70:
	.string	"-u"
.LC71:
	.string	"-c"
.LC72:
	.string	"-t"
.LC73:
	.string	"-h"
.LC74:
	.string	"-l"
.LC75:
	.string	"-v"
.LC76:
	.string	"-nov"
.LC77:
	.string	"-g"
.LC78:
	.string	"-nog"
.LC79:
	.string	"-i"
.LC80:
	.string	"-T"
.LC81:
	.string	"-P"
.LC82:
	.string	"-M"
.LC83:
	.string	"-D"
	.section	.text.unlikely
.LCOLDB84:
	.text
.LHOTB84:
	.p2align 4,,15
	.type	parse_args, @function
parse_args:
.LFB10:
	.loc 1 837 0
	.cfi_startproc
.LVL194:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	.loc 1 841 0
	movl	$80, %eax
	.loc 1 837 0
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edi, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	.loc 1 883 0
	cmpl	$1, %edi
	.loc 1 840 0
	movl	$0, debug(%rip)
	.loc 1 841 0
	movw	%ax, port(%rip)
	.loc 1 842 0
	movq	$0, dir(%rip)
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
	movq	$.LC57, user(%rip)
	.loc 1 879 0
	movq	$.LC58, charset(%rip)
	.loc 1 880 0
	movq	$.LC59, p3p(%rip)
	.loc 1 881 0
	movl	$-1, max_age(%rip)
.LVL195:
	.loc 1 883 0
	jle	.L194
	movq	8(%rsi), %rbx
	movq	%rsi, %r14
	movl	$1, %ebp
	movl	$.LC60, %r12d
	cmpb	$45, (%rbx)
	je	.L201
	jmp	.L165
.LVL196:
	.p2align 4,,10
	.p2align 3
.L210:
	.loc 1 890 0 discriminator 1
	leal	1(%rbp), %r15d
	cmpl	%r15d, %r13d
	jg	.L208
	.loc 1 895 0
	movl	$.LC63, %edi
	movl	$3, %ecx
	movq	%rbx, %rsi
	repz cmpsb
	je	.L171
.L170:
	.loc 1 900 0
	movl	$.LC64, %edi
	movl	$3, %ecx
	movq	%rbx, %rsi
	repz cmpsb
	jne	.L171
	.loc 1 900 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r13d
	jle	.L171
.LVL197:
	.loc 1 903 0 is_stmt 1
	movslq	%eax, %rdx
	movl	%eax, %ebp
	movq	(%r14,%rdx,8), %rdx
	movq	%rdx, dir(%rip)
.LVL198:
.L169:
	.loc 1 981 0
	addl	$1, %ebp
.LVL199:
	.loc 1 883 0
	cmpl	%ebp, %r13d
	jle	.L163
.L211:
	.loc 1 883 0 is_stmt 0 discriminator 1
	movslq	%ebp, %rax
	movq	(%r14,%rax,8), %rbx
	cmpb	$45, (%rbx)
	jne	.L165
.LVL200:
.L201:
	.loc 1 885 0 is_stmt 1
	movl	$3, %ecx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	repz cmpsb
	je	.L209
	.loc 1 890 0
	movl	$.LC62, %edi
	movl	$3, %ecx
	movq	%rbx, %rsi
	repz cmpsb
	je	.L210
	.loc 1 895 0
	movl	$.LC63, %edi
	movl	$3, %ecx
	movq	%rbx, %rsi
	repz cmpsb
	jne	.L170
	.loc 1 895 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %r15d
	cmpl	%r15d, %r13d
	jle	.L171
.LVL201:
	.loc 1 898 0 is_stmt 1
	movslq	%r15d, %rax
	movl	%r15d, %ebp
	movq	(%r14,%rax,8), %rdi
	.loc 1 981 0
	addl	$1, %ebp
	.loc 1 898 0
	call	atoi
.LVL202:
	.loc 1 883 0
	cmpl	%ebp, %r13d
	.loc 1 898 0
	movw	%ax, port(%rip)
	.loc 1 883 0
	jg	.L211
.LVL203:
.L163:
	.loc 1 983 0
	cmpl	%ebp, %r13d
	jne	.L165
	.loc 1 985 0
	addq	$8, %rsp
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
.LVL204:
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL205:
	.p2align 4,,10
	.p2align 3
.L171:
	.cfi_restore_state
	.loc 1 905 0
	movl	$.LC65, %edi
	movl	$3, %ecx
	movq	%rbx, %rsi
	repz cmpsb
	jne	.L172
	.loc 1 907 0
	movl	$1, do_chroot(%rip)
	.loc 1 908 0
	movl	$1, no_symlink_check(%rip)
	jmp	.L169
	.p2align 4,,10
	.p2align 3
.L172:
	.loc 1 910 0
	movl	$.LC66, %edi
	movl	$5, %ecx
	movq	%rbx, %rsi
	repz cmpsb
	jne	.L173
	.loc 1 912 0
	movl	$0, do_chroot(%rip)
	.loc 1 913 0
	movl	$0, no_symlink_check(%rip)
	jmp	.L169
	.p2align 4,,10
	.p2align 3
.L208:
.LVL206:
	.loc 1 893 0
	movslq	%r15d, %rax
	movl	%r15d, %ebp
	movq	(%r14,%rax,8), %rdi
	call	read_config
.LVL207:
	jmp	.L169
.LVL208:
	.p2align 4,,10
	.p2align 3
.L173:
	.loc 1 915 0
	movl	$.LC67, %edi
	movl	$4, %ecx
	movq	%rbx, %rsi
	repz cmpsb
	jne	.L174
	.loc 1 915 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r13d
	jle	.L174
.LVL209:
	.loc 1 918 0 is_stmt 1
	movslq	%eax, %rdx
	movl	%eax, %ebp
	movq	(%r14,%rdx,8), %rdx
	movq	%rdx, data_dir(%rip)
	jmp	.L169
.LVL210:
	.p2align 4,,10
	.p2align 3
.L174:
	.loc 1 920 0
	movl	$.LC68, %edi
	movl	$3, %ecx
	movq	%rbx, %rsi
	repz cmpsb
	jne	.L175
	.loc 1 921 0
	movl	$0, no_symlink_check(%rip)
	jmp	.L169
	.p2align 4,,10
	.p2align 3
.L175:
	.loc 1 922 0
	movl	$.LC69, %edi
	movl	$5, %ecx
	movq	%rbx, %rsi
	repz cmpsb
	je	.L212
	.loc 1 924 0
	movl	$.LC70, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL211:
	testl	%eax, %eax
	jne	.L177
	.loc 1 924 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r13d
	jle	.L177
.LVL212:
	.loc 1 927 0 is_stmt 1
	movslq	%eax, %rdx
	movl	%eax, %ebp
	movq	(%r14,%rdx,8), %rdx
	movq	%rdx, user(%rip)
	jmp	.L169
.LVL213:
.L212:
	.loc 1 923 0
	movl	$1, no_symlink_check(%rip)
	jmp	.L169
.L177:
	.loc 1 929 0
	movl	$.LC71, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL214:
	testl	%eax, %eax
	jne	.L178
	.loc 1 929 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r13d
	jle	.L178
.LVL215:
	.loc 1 932 0 is_stmt 1
	movslq	%eax, %rdx
	movl	%eax, %ebp
	movq	(%r14,%rdx,8), %rdx
	movq	%rdx, cgi_pattern(%rip)
	jmp	.L169
.LVL216:
.L178:
	.loc 1 934 0
	movl	$.LC72, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL217:
	testl	%eax, %eax
	je	.L213
	.loc 1 939 0
	movl	$.LC73, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL218:
	testl	%eax, %eax
	jne	.L181
	.loc 1 939 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r13d
	jle	.L182
.LVL219:
	.loc 1 942 0 is_stmt 1
	movslq	%eax, %rdx
	movl	%eax, %ebp
	movq	(%r14,%rdx,8), %rdx
	movq	%rdx, hostname(%rip)
	jmp	.L169
.LVL220:
.L213:
	.loc 1 934 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r13d
	jle	.L180
.LVL221:
	.loc 1 937 0
	movslq	%eax, %rdx
	movl	%eax, %ebp
	movq	(%r14,%rdx,8), %rdx
	movq	%rdx, throttlefile(%rip)
	jmp	.L169
.LVL222:
.L180:
	.loc 1 939 0
	movl	$.LC73, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL223:
	testl	%eax, %eax
	jne	.L181
.L182:
	.loc 1 949 0
	movl	$.LC75, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL224:
	testl	%eax, %eax
	jne	.L183
	.loc 1 950 0
	movl	$1, do_vhost(%rip)
	jmp	.L169
.L181:
	.loc 1 944 0
	movl	$.LC74, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL225:
	testl	%eax, %eax
	jne	.L182
	.loc 1 944 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r13d
	jle	.L182
.LVL226:
	.loc 1 947 0 is_stmt 1
	movslq	%eax, %rdx
	movl	%eax, %ebp
	movq	(%r14,%rdx,8), %rdx
	movq	%rdx, logfile(%rip)
	jmp	.L169
.LVL227:
.L183:
	.loc 1 951 0
	movl	$.LC76, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL228:
	testl	%eax, %eax
	je	.L214
	.loc 1 953 0
	movl	$.LC77, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL229:
	testl	%eax, %eax
	jne	.L185
	.loc 1 954 0
	movl	$1, do_global_passwd(%rip)
	jmp	.L169
.L214:
	.loc 1 952 0
	movl	$0, do_vhost(%rip)
	jmp	.L169
.LVL230:
.L194:
	.loc 1 882 0
	movl	$1, %ebp
	jmp	.L163
.LVL231:
.L185:
	.loc 1 955 0
	movl	$.LC78, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL232:
	testl	%eax, %eax
	jne	.L186
	.loc 1 956 0
	movl	$0, do_global_passwd(%rip)
	jmp	.L169
.L209:
	.loc 1 887 0
	movl	$.LC61, %edi
	call	puts
.LVL233:
	.loc 1 888 0
	xorl	%edi, %edi
	call	exit
.LVL234:
.L186:
	.loc 1 957 0
	movl	$.LC79, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL235:
	testl	%eax, %eax
	jne	.L187
	.loc 1 957 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r13d
	jle	.L187
.LVL236:
	.loc 1 960 0 is_stmt 1
	movslq	%eax, %rdx
	movl	%eax, %ebp
	movq	(%r14,%rdx,8), %rdx
	movq	%rdx, pidfile(%rip)
	jmp	.L169
.LVL237:
.L187:
	.loc 1 962 0
	movl	$.LC80, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL238:
	testl	%eax, %eax
	jne	.L188
	.loc 1 962 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r13d
	jle	.L189
.LVL239:
	.loc 1 965 0 is_stmt 1
	movslq	%eax, %rdx
	movl	%eax, %ebp
	movq	(%r14,%rdx,8), %rdx
	movq	%rdx, charset(%rip)
	jmp	.L169
.LVL240:
.L188:
	.loc 1 967 0
	movl	$.LC81, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL241:
	testl	%eax, %eax
	jne	.L190
	.loc 1 967 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %eax
	cmpl	%eax, %r13d
	jle	.L191
.LVL242:
	.loc 1 970 0 is_stmt 1
	movslq	%eax, %rdx
	movl	%eax, %ebp
	movq	(%r14,%rdx,8), %rdx
	movq	%rdx, p3p(%rip)
	jmp	.L169
.LVL243:
.L189:
	.loc 1 967 0
	movl	$.LC81, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL244:
	testl	%eax, %eax
	je	.L191
.L190:
	.loc 1 972 0
	movl	$.LC82, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL245:
	testl	%eax, %eax
	jne	.L191
	.loc 1 972 0 is_stmt 0 discriminator 1
	leal	1(%rbp), %r15d
	cmpl	%r15d, %r13d
	jle	.L191
.LVL246:
	.loc 1 975 0 is_stmt 1
	movslq	%r15d, %rax
	movl	%r15d, %ebp
	movq	(%r14,%rax,8), %rdi
	call	atoi
.LVL247:
	movl	%eax, max_age(%rip)
	jmp	.L169
.LVL248:
.L191:
	.loc 1 977 0
	movl	$.LC83, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL249:
	testl	%eax, %eax
	jne	.L165
	.loc 1 978 0
	movl	$1, debug(%rip)
	jmp	.L169
.LVL250:
.L165:
	.loc 1 980 0
	call	usage
.LVL251:
	.cfi_endproc
.LFE10:
	.size	parse_args, .-parse_args
	.section	.text.unlikely
.LCOLDE84:
	.text
.LHOTE84:
	.section	.rodata.str1.1
.LC85:
	.string	"%.80s - %m"
.LC86:
	.string	" %4900[^ \t] %ld-%ld"
.LC87:
	.string	" %4900[^ \t] %ld"
	.section	.rodata.str1.8
	.align 8
.LC88:
	.string	"unparsable line in %.80s - %.80s"
	.align 8
.LC89:
	.string	"%s: unparsable line in %.80s - %.80s\n"
	.section	.rodata.str1.1
.LC90:
	.string	"|/"
	.section	.rodata.str1.8
	.align 8
.LC91:
	.string	"out of memory allocating a throttletab"
	.align 8
.LC92:
	.string	"%s: out of memory allocating a throttletab\n"
	.section	.text.unlikely
.LCOLDB93:
	.text
.LHOTB93:
	.p2align 4,,15
	.type	read_throttlefile, @function
read_throttlefile:
.LFB17:
	.loc 1 1370 0
	.cfi_startproc
.LVL252:
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	.loc 1 1379 0
	movl	$.LC26, %esi
	.loc 1 1370 0
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$10048, %rsp
	.cfi_def_cfa_offset 10096
	.loc 1 1379 0
	call	fopen
.LVL253:
	.loc 1 1380 0
	testq	%rax, %rax
	je	.L254
	.loc 1 1387 0
	leaq	16(%rsp), %rdi
	leaq	32(%rsp), %rbx
	.loc 1 1424 0
	leaq	5041(%rsp), %r13
	.loc 1 1387 0
	xorl	%esi, %esi
	movq	%rax, %rbp
.LVL254:
	call	gettimeofday
.LVL255:
	.p2align 4,,10
	.p2align 3
.L217:
	.loc 1 1389 0
	movq	%rbp, %rdx
	movl	$5000, %esi
	movq	%rbx, %rdi
	call	fgets
.LVL256:
	testq	%rax, %rax
	je	.L255
	.loc 1 1392 0
	movl	$35, %esi
	movq	%rbx, %rdi
	call	strchr
.LVL257:
	.loc 1 1393 0
	testq	%rax, %rax
	je	.L218
	.loc 1 1394 0
	movb	$0, (%rax)
.L218:
	.loc 1 1397 0
	movq	%rbx, %rax
.LVL258:
.L219:
	movl	(%rax), %ecx
	addq	$4, %rax
	leal	-16843009(%rcx), %edx
	notl	%ecx
	andl	%ecx, %edx
	andl	$-2139062144, %edx
	je	.L219
	movl	%edx, %ecx
	shrl	$16, %ecx
	testl	$32896, %edx
	cmove	%ecx, %edx
	leaq	2(%rax), %rcx
	cmove	%rcx, %rax
	addb	%dl, %dl
	sbbq	$3, %rax
	subq	%rbx, %rax
.LVL259:
	.loc 1 1398 0
	cmpl	$0, %eax
	jle	.L221
	.loc 1 1399 0
	subl	$1, %eax
.LVL260:
	movslq	%eax, %rdx
	movzbl	32(%rsp,%rdx), %ecx
	cmpb	$32, %cl
	jbe	.L256
.LVL261:
	.p2align 4,,10
	.p2align 3
.L222:
	.loc 1 1408 0
	leaq	8(%rsp), %rcx
	leaq	5040(%rsp), %rdx
	xorl	%eax, %eax
	movq	%rsp, %r8
	movl	$.LC86, %esi
	movq	%rbx, %rdi
	call	__isoc99_sscanf
.LVL262:
	cmpl	$3, %eax
	je	.L224
	.loc 1 1410 0
	leaq	5040(%rsp), %rdx
	xorl	%eax, %eax
	movq	%rsp, %rcx
	movl	$.LC87, %esi
	movq	%rbx, %rdi
	call	__isoc99_sscanf
.LVL263:
	cmpl	$2, %eax
	jne	.L228
	.loc 1 1411 0
	movq	$0, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L224:
	.loc 1 1423 0
	cmpb	$47, 5040(%rsp)
	jne	.L230
	jmp	.L257
.LVL264:
	.p2align 4,,10
	.p2align 3
.L231:
	.loc 1 1426 0
	leaq	2(%rax), %rsi
	leaq	1(%rax), %rdi
	call	strcpy
.LVL265:
.L230:
	.loc 1 1425 0
	leaq	5040(%rsp), %rdi
	movl	$.LC90, %esi
	call	strstr
.LVL266:
	testq	%rax, %rax
	jne	.L231
	.loc 1 1429 0
	movslq	numthrottles(%rip), %rdx
	movl	maxthrottles(%rip), %eax
.LVL267:
	cmpl	%eax, %edx
	jl	.L232
	.loc 1 1431 0
	testl	%eax, %eax
	jne	.L233
	.loc 1 1434 0
	movl	$4800, %edi
	.loc 1 1433 0
	movl	$100, maxthrottles(%rip)
	.loc 1 1434 0
	call	malloc
.LVL268:
	movq	%rax, throttles(%rip)
.L234:
	.loc 1 1441 0
	testq	%rax, %rax
	je	.L235
	movslq	numthrottles(%rip), %rdx
.L236:
	.loc 1 1452 0
	leaq	(%rdx,%rdx,2), %r14
	leaq	5040(%rsp), %rdi
	movq	%r14, %rdx
	salq	$4, %rdx
	leaq	(%rax,%rdx), %r14
	call	e_strdup
.LVL269:
	movq	%rax, (%r14)
	.loc 1 1453 0
	movslq	numthrottles(%rip), %rax
	movq	(%rsp), %rcx
	movq	%rax, %rdx
	leaq	(%rax,%rax,2), %rax
	.loc 1 1459 0
	addl	$1, %edx
	.loc 1 1453 0
	salq	$4, %rax
	addq	throttles(%rip), %rax
	.loc 1 1459 0
	movl	%edx, numthrottles(%rip)
	.loc 1 1453 0
	movq	%rcx, 8(%rax)
	.loc 1 1454 0
	movq	8(%rsp), %rcx
	.loc 1 1455 0
	movq	$0, 24(%rax)
	.loc 1 1456 0
	movq	$0, 32(%rax)
	.loc 1 1457 0
	movl	$0, 40(%rax)
	.loc 1 1454 0
	movq	%rcx, 16(%rax)
	jmp	.L217
.LVL270:
	.p2align 4,,10
	.p2align 3
.L256:
	.loc 1 1400 0
	movabsq	$4294977024, %rsi
.LVL271:
	.p2align 4,,10
	.p2align 3
.L253:
	btq	%rcx, %rsi
	jnc	.L222
.LVL272:
	.loc 1 1398 0
	testl	%eax, %eax
	.loc 1 1401 0
	movb	$0, 32(%rsp,%rdx)
	.loc 1 1398 0
	je	.L217
	.loc 1 1399 0 discriminator 1
	subl	$1, %eax
.LVL273:
	movslq	%eax, %rdx
	movzbl	32(%rsp,%rdx), %ecx
	cmpb	$32, %cl
	ja	.L222
	jmp	.L253
.LVL274:
.L228:
	.loc 1 1414 0
	movq	%rbx, %rcx
	movq	%r12, %rdx
	xorl	%eax, %eax
	movl	$.LC88, %esi
	movl	$2, %edi
	call	syslog
.LVL275:
	.loc 1 1416 0
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rdi
	movq	%rbx, %r8
	movq	%r12, %rcx
	movl	$.LC89, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL276:
	.loc 1 1419 0
	jmp	.L217
.L233:
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
.LVL277:
	movq	%rax, throttles(%rip)
	jmp	.L234
.L232:
	movq	throttles(%rip), %rax
	jmp	.L236
.L255:
	.loc 1 1461 0
	movq	%rbp, %rdi
	call	fclose
.LVL278:
	.loc 1 1462 0
	addq	$10048, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
.LVL279:
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.LVL280:
.L221:
	.cfi_restore_state
	.loc 1 1404 0
	jne	.L222
	jmp	.L217
.LVL281:
.L257:
	.loc 1 1424 0
	leaq	5040(%rsp), %rdi
	movq	%r13, %rsi
	call	strcpy
.LVL282:
	jmp	.L230
.LVL283:
.L254:
	.loc 1 1382 0
	movq	%r12, %rdx
	movl	$.LC85, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
.LVL284:
	.loc 1 1383 0
	movq	%r12, %rdi
	call	perror
.LVL285:
	.loc 1 1384 0
	movl	$1, %edi
	call	exit
.LVL286:
.L235:
	.loc 1 1443 0
	movl	$.LC91, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
.LVL287:
	.loc 1 1444 0
	movq	stderr(%rip), %rdi
	movq	argv0(%rip), %rdx
	movl	$.LC92, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL288:
	.loc 1 1447 0
	movl	$1, %edi
	call	exit
.LVL289:
	.cfi_endproc
.LFE17:
	.size	read_throttlefile, .-read_throttlefile
	.section	.text.unlikely
.LCOLDE93:
	.text
.LHOTE93:
	.section	.rodata.str1.1
.LC94:
	.string	"-"
.LC95:
	.string	"re-opening logfile"
.LC96:
	.string	"a"
.LC97:
	.string	"re-opening %.80s - %m"
	.section	.text.unlikely
.LCOLDB98:
	.text
.LHOTB98:
	.p2align 4,,15
	.type	re_open_logfile, @function
re_open_logfile:
.LFB8:
	.loc 1 327 0
	.cfi_startproc
	.loc 1 331 0
	movl	no_log(%rip), %eax
	testl	%eax, %eax
	jne	.L270
	.loc 1 331 0 is_stmt 0 discriminator 1
	cmpq	$0, hs(%rip)
	je	.L270
	.loc 1 335 0 is_stmt 1
	movq	logfile(%rip), %rsi
	testq	%rsi, %rsi
	je	.L270
	.loc 1 335 0 is_stmt 0 discriminator 1
	movl	$.LC94, %edi
	movl	$2, %ecx
	repz cmpsb
	jne	.L271
.L270:
	rep ret
	.p2align 4,,10
	.p2align 3
.L271:
	.loc 1 327 0 is_stmt 1
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.loc 1 337 0
	xorl	%eax, %eax
	movl	$.LC95, %esi
	movl	$5, %edi
	.loc 1 327 0
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 337 0
	call	syslog
.LVL290:
	.loc 1 338 0
	movq	logfile(%rip), %rdi
	movl	$.LC96, %esi
	call	fopen
.LVL291:
	.loc 1 339 0
	movq	logfile(%rip), %rbp
	.loc 1 338 0
	movq	%rax, %rbx
.LVL292:
	.loc 1 339 0
	movl	$384, %esi
	movq	%rbp, %rdi
	call	chmod
.LVL293:
	.loc 1 340 0
	testq	%rbx, %rbx
	je	.L262
	testl	%eax, %eax
	jne	.L262
	.loc 1 345 0
	movq	%rbx, %rdi
	call	fileno
.LVL294:
	movl	$2, %esi
	movl	%eax, %edi
	movl	$1, %edx
	xorl	%eax, %eax
	call	fcntl
.LVL295:
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
.LVL296:
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	.loc 1 346 0
	jmp	httpd_set_logfp
.LVL297:
	.p2align 4,,10
	.p2align 3
.L262:
	.cfi_restore_state
	.loc 1 348 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	.loc 1 342 0
	movq	%rbp, %rdx
	movl	$.LC97, %esi
	.loc 1 348 0
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL298:
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	.loc 1 342 0
	movl	$2, %edi
	xorl	%eax, %eax
.LVL299:
	jmp	syslog
.LVL300:
	.cfi_endproc
.LFE8:
	.size	re_open_logfile, .-re_open_logfile
	.section	.text.unlikely
.LCOLDE98:
	.text
.LHOTE98:
	.section	.rodata.str1.1
.LC99:
	.string	"too many connections!"
	.section	.rodata.str1.8
	.align 8
.LC100:
	.string	"the connects free list is messed up"
	.align 8
.LC101:
	.string	"out of memory allocating an httpd_conn"
	.section	.text.unlikely
.LCOLDB102:
	.text
.LHOTB102:
	.p2align 4,,15
	.type	handle_newconnect, @function
handle_newconnect:
.LFB19:
	.loc 1 1505 0
	.cfi_startproc
.LVL301:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%esi, %ebp
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movl	num_connects(%rip), %eax
.LVL302:
.L281:
	.loc 1 1516 0
	cmpl	%eax, max_connects(%rip)
	jle	.L291
	.loc 1 1527 0
	movslq	first_free_connect(%rip), %rax
	cmpl	$-1, %eax
	je	.L275
	.loc 1 1527 0 is_stmt 0 discriminator 1
	leaq	(%rax,%rax,8), %rbx
	salq	$4, %rbx
	addq	connects(%rip), %rbx
	movl	(%rbx), %eax
	testl	%eax, %eax
	jne	.L275
.LVL303:
	.loc 1 1534 0 is_stmt 1
	movq	8(%rbx), %rdx
	testq	%rdx, %rdx
	je	.L292
.L277:
	.loc 1 1547 0
	movq	hs(%rip), %rdi
	movl	%ebp, %esi
	call	httpd_get_conn
.LVL304:
	testl	%eax, %eax
	je	.L280
	cmpl	$2, %eax
	jne	.L293
	.loc 1 1558 0
	movl	$1, %eax
.LVL305:
.L274:
	.loc 1 1581 0
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
.LVL306:
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL307:
	ret
.LVL308:
	.p2align 4,,10
	.p2align 3
.L293:
	.cfi_restore_state
	.loc 1 1562 0
	movl	4(%rbx), %eax
	.loc 1 1560 0
	movl	$1, (%rbx)
	.loc 1 1563 0
	movl	$-1, 4(%rbx)
	.loc 1 1564 0
	addl	$1, num_connects(%rip)
.LVL309:
	.loc 1 1562 0
	movl	%eax, first_free_connect(%rip)
	.loc 1 1566 0
	movq	(%r12), %rax
	.loc 1 1567 0
	movq	$0, 96(%rbx)
	.loc 1 1568 0
	movq	$0, 104(%rbx)
	.loc 1 1566 0
	movq	%rax, 88(%rbx)
	.loc 1 1573 0
	movq	8(%rbx), %rax
	.loc 1 1569 0
	movq	$0, 136(%rbx)
	.loc 1 1570 0
	movl	$0, 56(%rbx)
	.loc 1 1573 0
	movl	704(%rax), %edi
	call	httpd_set_ndelay
.LVL310:
	.loc 1 1575 0
	movq	8(%rbx), %rax
	xorl	%edx, %edx
	movq	%rbx, %rsi
	movl	704(%rax), %edi
	call	fdwatch_add_fd
.LVL311:
	.loc 1 1577 0
	addq	$1, stats_connections(%rip)
	.loc 1 1578 0
	movl	num_connects(%rip), %eax
	cmpl	stats_simultaneous(%rip), %eax
	jle	.L281
	.loc 1 1579 0
	movl	%eax, stats_simultaneous(%rip)
	jmp	.L281
.LVL312:
	.p2align 4,,10
	.p2align 3
.L280:
	.loc 1 1553 0
	movq	%r12, %rdi
	movl	%eax, 12(%rsp)
	call	tmr_run
.LVL313:
	.loc 1 1554 0
	movl	12(%rsp), %eax
	.loc 1 1581 0
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL314:
	popq	%rbp
	.cfi_def_cfa_offset 16
.LVL315:
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL316:
	ret
.LVL317:
	.p2align 4,,10
	.p2align 3
.L292:
	.cfi_restore_state
	.loc 1 1536 0
	movl	$720, %edi
	call	malloc
.LVL318:
	.loc 1 1537 0
	testq	%rax, %rax
	.loc 1 1536 0
	movq	%rax, 8(%rbx)
	.loc 1 1537 0
	je	.L294
	.loc 1 1542 0
	movl	$0, (%rax)
	.loc 1 1543 0
	addl	$1, httpd_conn_count(%rip)
	movq	%rax, %rdx
	jmp	.L277
.LVL319:
	.p2align 4,,10
	.p2align 3
.L291:
	.loc 1 1522 0
	xorl	%eax, %eax
	movl	$.LC99, %esi
	movl	$4, %edi
	call	syslog
.LVL320:
	.loc 1 1523 0
	movq	%r12, %rdi
	call	tmr_run
.LVL321:
	.loc 1 1524 0
	xorl	%eax, %eax
	jmp	.L274
.L275:
	.loc 1 1529 0
	movl	$2, %edi
	movl	$.LC100, %esi
	xorl	%eax, %eax
	call	syslog
.LVL322:
	.loc 1 1530 0
	movl	$1, %edi
	call	exit
.LVL323:
.L294:
	.loc 1 1539 0
	movl	$2, %edi
	movl	$.LC101, %esi
	call	syslog
.LVL324:
	.loc 1 1540 0
	movl	$1, %edi
	call	exit
.LVL325:
	.cfi_endproc
.LFE19:
	.size	handle_newconnect, .-handle_newconnect
	.section	.text.unlikely
.LCOLDE102:
	.text
.LHOTE102:
	.section	.rodata.str1.8
	.align 8
.LC103:
	.string	"throttle sending count was negative - shouldn't happen!"
	.section	.text.unlikely
.LCOLDB104:
	.text
.LHOTB104:
	.p2align 4,,15
	.type	check_throttles, @function
check_throttles:
.LFB23:
	.loc 1 1883 0
	.cfi_startproc
.LVL326:
	.loc 1 1889 0
	movl	numthrottles(%rip), %eax
	.loc 1 1887 0
	movl	$0, 56(%rdi)
	.loc 1 1888 0
	movq	$-1, 72(%rdi)
	movq	$-1, 64(%rdi)
.LVL327:
	.loc 1 1889 0
	testl	%eax, %eax
	jle	.L318
	.loc 1 1883 0
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	jmp	.L310
.LVL328:
	.p2align 4,,10
	.p2align 3
.L303:
	.loc 1 1915 0
	cmpq	%rdi, %rax
	cmovl	%rdi, %rax
	movq	%rax, 72(%rbx)
.LVL329:
.L298:
	.loc 1 1890 0
	addl	$1, %r12d
.LVL330:
	.loc 1 1889 0
	cmpl	%r12d, numthrottles(%rip)
	jle	.L304
.L319:
	addq	$48, %rbp
	.loc 1 1889 0 is_stmt 0 discriminator 2
	cmpl	$9, 56(%rbx)
	jg	.L304
.LVL331:
.L310:
	.loc 1 1891 0 is_stmt 1
	movq	8(%rbx), %rax
	movq	240(%rax), %rsi
	movq	throttles(%rip), %rax
	movq	(%rax,%rbp), %rdi
	call	match
.LVL332:
	testl	%eax, %eax
	je	.L298
	.loc 1 1894 0
	movq	%rbp, %rdx
	addq	throttles(%rip), %rdx
	movq	8(%rdx), %rax
	movq	24(%rdx), %rcx
	leaq	(%rax,%rax), %rsi
	cmpq	%rsi, %rcx
	jg	.L307
	.loc 1 1897 0
	movq	16(%rdx), %rdi
	cmpq	%rdi, %rcx
	jl	.L307
	.loc 1 1899 0
	movl	40(%rdx), %ecx
	testl	%ecx, %ecx
	js	.L299
	addl	$1, %ecx
	movslq	%ecx, %r8
.L300:
	.loc 1 1904 0
	movslq	56(%rbx), %rsi
	leal	1(%rsi), %r9d
	movl	%r9d, 56(%rbx)
	movl	%r12d, 16(%rbx,%rsi,4)
	.loc 1 1905 0
	movl	%ecx, 40(%rdx)
	.loc 1 1906 0
	cqto
	idivq	%r8
.LVL333:
	.loc 1 1907 0
	movq	64(%rbx), %rdx
	cmpq	$-1, %rdx
	je	.L316
	.loc 1 1910 0
	cmpq	%rdx, %rax
	cmovg	%rdx, %rax
.LVL334:
.L316:
	movq	%rax, 64(%rbx)
.LVL335:
	.loc 1 1912 0
	movq	72(%rbx), %rax
	cmpq	$-1, %rax
	jne	.L303
	.loc 1 1890 0
	addl	$1, %r12d
.LVL336:
	.loc 1 1889 0
	cmpl	%r12d, numthrottles(%rip)
	.loc 1 1913 0
	movq	%rdi, 72(%rbx)
.LVL337:
	.loc 1 1889 0
	jg	.L319
.L304:
	.loc 1 1918 0
	popq	%rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 24
.LVL338:
	.loc 1 1917 0
	movl	$1, %eax
	.loc 1 1918 0
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 8
.LVL339:
	ret
.LVL340:
	.p2align 4,,10
	.p2align 3
.L299:
	.cfi_restore_state
	.loc 1 1901 0
	movl	$3, %edi
	xorl	%eax, %eax
	movl	$.LC103, %esi
	call	syslog
.LVL341:
	.loc 1 1902 0
	movq	%rbp, %rdx
	addq	throttles(%rip), %rdx
	movl	$1, %r8d
	movl	$1, %ecx
	movl	$0, 40(%rdx)
	movq	8(%rdx), %rax
	movq	16(%rdx), %rdi
	jmp	.L300
	.p2align 4,,10
	.p2align 3
.L307:
	.loc 1 1918 0
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 24
.LVL342:
	.loc 1 1895 0
	xorl	%eax, %eax
	.loc 1 1918 0
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 8
.LVL343:
	ret
.LVL344:
.L318:
	.loc 1 1917 0
	movl	$1, %eax
	.loc 1 1918 0
	ret
	.cfi_endproc
.LFE23:
	.size	check_throttles, .-check_throttles
	.section	.text.unlikely
.LCOLDE104:
	.text
.LHOTE104:
	.section	.text.unlikely
.LCOLDB105:
	.text
.LHOTB105:
	.p2align 4,,15
	.type	shut_down, @function
shut_down:
.LFB18:
	.loc 1 1467 0
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	.loc 1 1471 0
	xorl	%esi, %esi
	.loc 1 1467 0
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 1471 0
	movq	%rsp, %rdi
	call	gettimeofday
.LVL345:
	.loc 1 1472 0
	movq	%rsp, %rdi
	call	logstats
.LVL346:
	.loc 1 1473 0
	movl	max_connects(%rip), %ecx
	testl	%ecx, %ecx
	jg	.L339
	jmp	.L327
.LVL347:
	.p2align 4,,10
	.p2align 3
.L324:
	.loc 1 1477 0
	movq	8(%rax), %rdi
	testq	%rdi, %rdi
	je	.L325
	.loc 1 1479 0
	call	httpd_destroy_conn
.LVL348:
	.loc 1 1480 0
	movq	%rbx, %r12
	addq	connects(%rip), %r12
	movq	8(%r12), %rdi
	call	free
.LVL349:
	.loc 1 1481 0
	subl	$1, httpd_conn_count(%rip)
	.loc 1 1482 0
	movq	$0, 8(%r12)
.L325:
	.loc 1 1473 0 discriminator 2
	addl	$1, %ebp
.LVL350:
	addq	$144, %rbx
	cmpl	%ebp, max_connects(%rip)
	jle	.L327
.LVL351:
.L339:
	.loc 1 1475 0
	movq	%rbx, %rax
	addq	connects(%rip), %rax
	movl	(%rax), %edx
	testl	%edx, %edx
	je	.L324
	.loc 1 1476 0
	movq	8(%rax), %rdi
	movq	%rsp, %rsi
	call	httpd_close_conn
.LVL352:
	movq	%rbx, %rax
	addq	connects(%rip), %rax
	jmp	.L324
.LVL353:
	.p2align 4,,10
	.p2align 3
.L327:
	.loc 1 1485 0
	movq	hs(%rip), %rbx
	testq	%rbx, %rbx
	je	.L323
.LVL354:
.LBB2:
	.loc 1 1489 0
	movl	72(%rbx), %edi
	.loc 1 1488 0
	movq	$0, hs(%rip)
	.loc 1 1489 0
	cmpl	$-1, %edi
	je	.L328
	.loc 1 1490 0
	call	fdwatch_del_fd
.LVL355:
.L328:
	.loc 1 1491 0
	movl	76(%rbx), %edi
	cmpl	$-1, %edi
	je	.L329
	.loc 1 1492 0
	call	fdwatch_del_fd
.LVL356:
.L329:
	.loc 1 1493 0
	movq	%rbx, %rdi
	call	httpd_terminate
.LVL357:
.L323:
.LBE2:
	.loc 1 1495 0
	call	mmc_destroy
.LVL358:
	.loc 1 1496 0
	call	tmr_destroy
.LVL359:
	.loc 1 1497 0
	movq	connects(%rip), %rdi
	call	free
.LVL360:
	.loc 1 1498 0
	movq	throttles(%rip), %rdi
	testq	%rdi, %rdi
	je	.L320
	.loc 1 1499 0
	call	free
.LVL361:
.L320:
	.loc 1 1500 0
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE18:
	.size	shut_down, .-shut_down
	.section	.text.unlikely
.LCOLDE105:
	.text
.LHOTE105:
	.section	.rodata.str1.1
.LC106:
	.string	"exiting"
	.section	.text.unlikely
.LCOLDB107:
	.text
.LHOTB107:
	.p2align 4,,15
	.type	handle_usr1, @function
handle_usr1:
.LFB5:
	.loc 1 257 0
	.cfi_startproc
.LVL362:
	.loc 1 260 0
	movl	num_connects(%rip), %edx
	testl	%edx, %edx
	je	.L350
	.loc 1 273 0
	movl	$1, got_usr1(%rip)
	ret
.L350:
	.loc 1 257 0
	pushq	%rax
	.cfi_def_cfa_offset 16
	.loc 1 266 0
	call	shut_down
.LVL363:
	.loc 1 267 0
	movl	$5, %edi
	movl	$.LC106, %esi
	xorl	%eax, %eax
	call	syslog
.LVL364:
	.loc 1 268 0
	call	closelog
.LVL365:
	.loc 1 269 0
	xorl	%edi, %edi
	call	exit
.LVL366:
	.cfi_endproc
.LFE5:
	.size	handle_usr1, .-handle_usr1
	.section	.text.unlikely
.LCOLDE107:
	.text
.LHOTE107:
	.section	.rodata.str1.1
.LC108:
	.string	"exiting due to signal %d"
	.section	.text.unlikely
.LCOLDB109:
	.text
.LHOTB109:
	.p2align 4,,15
	.type	handle_term, @function
handle_term:
.LFB2:
	.loc 1 172 0
	.cfi_startproc
.LVL367:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 172 0
	movl	%edi, %ebx
	.loc 1 175 0
	call	shut_down
.LVL368:
	.loc 1 176 0
	movl	$5, %edi
	movl	%ebx, %edx
	movl	$.LC108, %esi
	xorl	%eax, %eax
	call	syslog
.LVL369:
	.loc 1 177 0
	call	closelog
.LVL370:
	.loc 1 178 0
	movl	$1, %edi
	call	exit
.LVL371:
	.cfi_endproc
.LFE2:
	.size	handle_term, .-handle_term
	.section	.text.unlikely
.LCOLDE109:
	.text
.LHOTE109:
	.section	.text.unlikely
.LCOLDB110:
	.text
.LHOTB110:
	.p2align 4,,15
	.type	clear_throttles.isra.0, @function
clear_throttles.isra.0:
.LFB36:
	.loc 1 1922 0
	.cfi_startproc
.LVL372:
	.loc 1 1926 0
	movl	56(%rdi), %eax
	testl	%eax, %eax
	jle	.L353
	subl	$1, %eax
	movq	throttles(%rip), %rcx
	leaq	16(%rdi), %rdx
	leaq	20(%rdi,%rax,4), %rsi
.LVL373:
	.p2align 4,,10
	.p2align 3
.L355:
	.loc 1 1927 0
	movslq	(%rdx), %rax
	addq	$4, %rdx
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	subl	$1, 40(%rcx,%rax)
	.loc 1 1926 0
	cmpq	%rsi, %rdx
	jne	.L355
.L353:
	rep ret
	.cfi_endproc
.LFE36:
	.size	clear_throttles.isra.0, .-clear_throttles.isra.0
	.section	.text.unlikely
.LCOLDE110:
	.text
.LHOTE110:
	.section	.text.unlikely
.LCOLDB111:
	.text
.LHOTB111:
	.p2align 4,,15
	.type	really_clear_connection, @function
really_clear_connection:
.LFB28:
	.loc 1 2048 0
	.cfi_startproc
.LVL374:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 2049 0
	movq	8(%rdi), %rdi
.LVL375:
	movq	200(%rdi), %rax
	addq	%rax, stats_bytes(%rip)
	.loc 1 2050 0
	cmpl	$3, (%rbx)
	je	.L359
	.loc 1 2051 0
	movl	704(%rdi), %edi
	movq	%rsi, 8(%rsp)
	call	fdwatch_del_fd
.LVL376:
	movq	8(%rbx), %rdi
	movq	8(%rsp), %rsi
.LVL377:
.L359:
	.loc 1 2052 0
	call	httpd_close_conn
.LVL378:
	.loc 1 2053 0
	movq	%rbx, %rdi
	call	clear_throttles.isra.0
.LVL379:
	.loc 1 2054 0
	movq	104(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L360
	.loc 1 2056 0
	call	tmr_cancel
.LVL380:
	.loc 1 2057 0
	movq	$0, 104(%rbx)
.L360:
	.loc 1 2060 0
	movl	first_free_connect(%rip), %eax
	.loc 1 2059 0
	movl	$0, (%rbx)
	.loc 1 2062 0
	subl	$1, num_connects(%rip)
	.loc 1 2060 0
	movl	%eax, 4(%rbx)
	.loc 1 2061 0
	subq	connects(%rip), %rbx
.LVL381:
	movabsq	$-8198552921648689607, %rax
	sarq	$4, %rbx
	imulq	%rax, %rbx
	movl	%ebx, first_free_connect(%rip)
	.loc 1 2063 0
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE28:
	.size	really_clear_connection, .-really_clear_connection
	.section	.text.unlikely
.LCOLDE111:
	.text
.LHOTE111:
	.section	.rodata.str1.8
	.align 8
.LC112:
	.string	"replacing non-null linger_timer!"
	.align 8
.LC113:
	.string	"tmr_create(linger_clear_connection) failed"
	.section	.text.unlikely
.LCOLDB114:
	.text
.LHOTB114:
	.p2align 4,,15
	.type	clear_connection, @function
clear_connection:
.LFB27:
	.loc 1 1996 0
	.cfi_startproc
.LVL382:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 1999 0
	movq	96(%rdi), %rdi
.LVL383:
	testq	%rdi, %rdi
	je	.L366
	.loc 1 2001 0
	call	tmr_cancel
.LVL384:
	.loc 1 2002 0
	movq	$0, 96(%rbx)
.L366:
	.loc 1 2016 0
	movl	(%rbx), %edx
	cmpl	$4, %edx
	je	.L379
	.loc 1 2023 0
	movq	8(%rbx), %rax
	movl	556(%rax), %ecx
	testl	%ecx, %ecx
	je	.L368
	.loc 1 2025 0
	cmpl	$3, %edx
	je	.L369
	.loc 1 2026 0
	movl	704(%rax), %edi
	call	fdwatch_del_fd
.LVL385:
	movq	8(%rbx), %rax
.L369:
	.loc 1 2028 0
	movl	704(%rax), %edi
	movl	$1, %esi
	.loc 1 2027 0
	movl	$4, (%rbx)
	.loc 1 2028 0
	call	shutdown
.LVL386:
	.loc 1 2029 0
	movq	8(%rbx), %rax
	xorl	%edx, %edx
	movq	%rbx, %rsi
	movl	704(%rax), %edi
	call	fdwatch_add_fd
.LVL387:
	.loc 1 2031 0
	cmpq	$0, 104(%rbx)
	je	.L370
	.loc 1 2032 0
	movl	$.LC112, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.LVL388:
.L370:
	.loc 1 2033 0
	xorl	%r8d, %r8d
	movl	$500, %ecx
	movq	%rbx, %rdx
	movl	$linger_clear_connection, %esi
	movq	%rbp, %rdi
	call	tmr_create
.LVL389:
	.loc 1 2035 0
	testq	%rax, %rax
	.loc 1 2033 0
	movq	%rax, 104(%rbx)
	.loc 1 2035 0
	je	.L380
	.loc 1 2043 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL390:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL391:
	ret
.LVL392:
	.p2align 4,,10
	.p2align 3
.L379:
	.cfi_restore_state
	.loc 1 2019 0
	movq	104(%rbx), %rdi
	call	tmr_cancel
.LVL393:
	.loc 1 2021 0
	movq	8(%rbx), %rax
	.loc 1 2020 0
	movq	$0, 104(%rbx)
	.loc 1 2021 0
	movl	$0, 556(%rax)
.L368:
	.loc 1 2043 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	.loc 1 2042 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	.loc 1 2043 0
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL394:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL395:
	.loc 1 2042 0
	jmp	really_clear_connection
.LVL396:
.L380:
	.cfi_restore_state
	.loc 1 2037 0
	movl	$2, %edi
	movl	$.LC113, %esi
	call	syslog
.LVL397:
	.loc 1 2038 0
	movl	$1, %edi
	call	exit
.LVL398:
	.cfi_endproc
.LFE27:
	.size	clear_connection, .-clear_connection
	.section	.text.unlikely
.LCOLDE114:
	.text
.LHOTE114:
	.section	.text.unlikely
.LCOLDB115:
	.text
.LHOTB115:
	.p2align 4,,15
	.type	finish_connection, @function
finish_connection:
.LFB26:
	.loc 1 1985 0
	.cfi_startproc
.LVL399:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 1987 0
	movq	8(%rdi), %rdi
.LVL400:
	call	httpd_write_response
.LVL401:
	.loc 1 1991 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	.loc 1 1990 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	.loc 1 1991 0
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL402:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL403:
	.loc 1 1990 0
	jmp	clear_connection
.LVL404:
	.cfi_endproc
.LFE26:
	.size	finish_connection, .-finish_connection
	.section	.text.unlikely
.LCOLDE115:
	.text
.LHOTE115:
	.section	.text.unlikely
.LCOLDB116:
	.text
.LHOTB116:
	.p2align 4,,15
	.type	handle_read, @function
handle_read:
.LFB20:
	.loc 1 1586 0
	.cfi_startproc
.LVL405:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.loc 1 1589 0
	movq	8(%rdi), %rbx
.LVL406:
	.loc 1 1586 0
	movq	%rdi, %rbp
	.loc 1 1592 0
	movq	160(%rbx), %rsi
.LVL407:
	movq	152(%rbx), %rdx
	cmpq	%rdx, %rsi
	jb	.L384
	.loc 1 1594 0
	cmpq	$5000, %rdx
	jbe	.L411
.LVL408:
.L410:
	.loc 1 1637 0
	movq	httpd_err400form(%rip), %r8
	movq	httpd_err400title(%rip), %rdx
	movl	$.LC59, %r9d
	movq	%r9, %rcx
	movl	$400, %esi
	movq	%rbx, %rdi
	call	httpd_send_err
.LVL409:
.L409:
	.loc 1 1703 0
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
.LVL410:
.LBB3:
	.loc 1 1685 0
	movq	%r12, %rsi
	movq	%rbp, %rdi
.LBE3:
	.loc 1 1703 0
	popq	%rbp
	.cfi_def_cfa_offset 16
.LVL411:
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL412:
.LBB4:
	.loc 1 1685 0
	jmp	finish_connection
.LVL413:
	.p2align 4,,10
	.p2align 3
.L411:
	.cfi_restore_state
.LBE4:
	.loc 1 1600 0
	leaq	152(%rbx), %rsi
	leaq	144(%rbx), %rdi
.LVL414:
	addq	$1000, %rdx
	call	httpd_realloc_str
.LVL415:
	movq	152(%rbx), %rdx
	movq	160(%rbx), %rsi
.L384:
	.loc 1 1605 0
	subq	%rsi, %rdx
	addq	144(%rbx), %rsi
	movl	704(%rbx), %edi
	call	read
.LVL416:
	.loc 1 1608 0
	testl	%eax, %eax
	je	.L410
	.loc 1 1614 0
	js	.L412
	.loc 1 1628 0
	cltq
	addq	%rax, 160(%rbx)
	.loc 1 1629 0
	movq	(%r12), %rax
.LVL417:
	.loc 1 1632 0
	movq	%rbx, %rdi
	.loc 1 1629 0
	movq	%rax, 88(%rbp)
	.loc 1 1632 0
	call	httpd_got_request
.LVL418:
	testl	%eax, %eax
	je	.L383
	cmpl	$2, %eax
	je	.L410
	.loc 1 1643 0
	movq	%rbx, %rdi
	call	httpd_parse_request
.LVL419:
	testl	%eax, %eax
	js	.L409
	.loc 1 1650 0
	movq	%rbp, %rdi
	call	check_throttles
.LVL420:
	testl	%eax, %eax
	je	.L413
	.loc 1 1659 0
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	httpd_start_request
.LVL421:
	testl	%eax, %eax
	js	.L409
	.loc 1 1667 0
	movl	528(%rbx), %eax
	testl	%eax, %eax
	je	.L394
	.loc 1 1669 0
	movq	536(%rbx), %rax
	movq	%rax, 136(%rbp)
	.loc 1 1670 0
	movq	544(%rbx), %rax
	addq	$1, %rax
	movq	%rax, 128(%rbp)
.L395:
	.loc 1 1678 0
	cmpq	$0, 712(%rbx)
	je	.L414
	.loc 1 1688 0
	movq	128(%rbp), %rax
	cmpq	%rax, 136(%rbp)
	jge	.L409
	.loc 1 1697 0
	movq	(%r12), %rax
	.loc 1 1701 0
	movl	704(%rbx), %edi
	.loc 1 1696 0
	movl	$2, 0(%rbp)
	.loc 1 1698 0
	movq	$0, 112(%rbp)
.LVL422:
	.loc 1 1697 0
	movq	%rax, 80(%rbp)
	.loc 1 1701 0
	call	fdwatch_del_fd
.LVL423:
	.loc 1 1702 0
	movl	704(%rbx), %edi
	movq	%rbp, %rsi
	movl	$1, %edx
	.loc 1 1703 0
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
.LVL424:
	popq	%rbp
	.cfi_def_cfa_offset 16
.LVL425:
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL426:
	.loc 1 1702 0
	jmp	fdwatch_add_fd
.LVL427:
	.p2align 4,,10
	.p2align 3
.L412:
	.cfi_restore_state
	.loc 1 1621 0
	call	__errno_location
.LVL428:
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L383
	cmpl	$11, %eax
	jne	.L410
.L383:
	.loc 1 1703 0
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
.LVL429:
	popq	%rbp
	.cfi_def_cfa_offset 16
.LVL430:
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL431:
	ret
.LVL432:
	.p2align 4,,10
	.p2align 3
.L413:
	.cfi_restore_state
	.loc 1 1652 0
	movq	208(%rbx), %r9
	movq	httpd_err503form(%rip), %r8
	movl	$.LC59, %ecx
	movq	httpd_err503title(%rip), %rdx
	movl	$503, %esi
	movq	%rbx, %rdi
	call	httpd_send_err
.LVL433:
	jmp	.L409
	.p2align 4,,10
	.p2align 3
.L394:
	.loc 1 1672 0
	movq	192(%rbx), %rax
	.loc 1 1673 0
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, 128(%rbp)
	jmp	.L395
.L414:
.LVL434:
.LBB5:
	.loc 1 1682 0 discriminator 1
	movl	56(%rbp), %eax
	testl	%eax, %eax
	jle	.L415
	subl	$1, %eax
	movq	throttles(%rip), %rcx
	movq	200(%rbx), %rsi
	leaq	16(%rbp), %rdx
	leaq	20(%rbp,%rax,4), %rdi
.LVL435:
	.p2align 4,,10
	.p2align 3
.L400:
	.loc 1 1683 0 discriminator 3
	movslq	(%rdx), %rax
	addq	$4, %rdx
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	addq	%rsi, 32(%rcx,%rax)
	.loc 1 1682 0 discriminator 3
	cmpq	%rdx, %rdi
	jne	.L400
.L399:
	.loc 1 1684 0
	movq	%rsi, 136(%rbp)
	jmp	.L409
.LVL436:
.L415:
	movq	200(%rbx), %rsi
	jmp	.L399
.LBE5:
	.cfi_endproc
.LFE20:
	.size	handle_read, .-handle_read
	.section	.text.unlikely
.LCOLDE116:
	.text
.LHOTE116:
	.section	.rodata.str1.8
	.align 8
.LC117:
	.string	"%.80s connection timed out reading"
	.align 8
.LC118:
	.string	"%.80s connection timed out sending"
	.section	.text.unlikely
.LCOLDB119:
	.text
.LHOTB119:
	.p2align 4,,15
	.type	idle, @function
idle:
.LFB29:
	.loc 1 2068 0
	.cfi_startproc
.LVL437:
	.loc 1 2072 0
	movl	max_connects(%rip), %eax
	testl	%eax, %eax
	jle	.L428
	.loc 1 2068 0
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	jmp	.L423
.LVL438:
	.p2align 4,,10
	.p2align 3
.L431:
	.loc 1 2075 0
	jl	.L418
	cmpl	$3, %eax
	jg	.L418
	.loc 1 2090 0
	movq	0(%r13), %rax
	subq	88(%rbx), %rax
	cmpq	$299, %rax
	jg	.L429
.L418:
	.loc 1 2072 0 discriminator 2
	addl	$1, %ebp
.LVL439:
	addq	$144, %r12
	cmpl	%ebp, max_connects(%rip)
	jle	.L430
.LVL440:
.L423:
	.loc 1 2074 0
	movq	%r12, %rbx
	addq	connects(%rip), %rbx
.LVL441:
	.loc 1 2075 0
	movl	(%rbx), %eax
	cmpl	$1, %eax
	jne	.L431
	.loc 1 2078 0
	movq	0(%r13), %rax
	subq	88(%rbx), %rax
	cmpq	$59, %rax
	jle	.L418
	.loc 1 2080 0
	movq	8(%rbx), %rax
	leaq	16(%rax), %rdi
.LVL442:
	call	httpd_ntoa
.LVL443:
	movl	$.LC117, %esi
	movq	%rax, %rdx
	movl	$6, %edi
	xorl	%eax, %eax
	call	syslog
.LVL444:
	.loc 1 2083 0
	movq	8(%rbx), %rdi
	movq	httpd_err408form(%rip), %r8
	movl	$.LC59, %r9d
	movq	httpd_err408title(%rip), %rdx
	movq	%r9, %rcx
	movl	$408, %esi
	call	httpd_send_err
.LVL445:
	.loc 1 2085 0
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	finish_connection
.LVL446:
	jmp	.L418
.LVL447:
	.p2align 4,,10
	.p2align 3
.L429:
	.loc 1 2092 0
	movq	8(%rbx), %rax
	leaq	16(%rax), %rdi
.LVL448:
	call	httpd_ntoa
.LVL449:
	movl	$.LC118, %esi
	movq	%rax, %rdx
	movl	$6, %edi
	xorl	%eax, %eax
	call	syslog
.LVL450:
	.loc 1 2095 0
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	clear_connection
.LVL451:
	jmp	.L418
.LVL452:
	.p2align 4,,10
	.p2align 3
.L430:
	.loc 1 2100 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 32
.LVL453:
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 24
.LVL454:
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 8
.LVL455:
.L428:
	rep ret
	.cfi_endproc
.LFE29:
	.size	idle, .-idle
	.section	.text.unlikely
.LCOLDE119:
	.text
.LHOTE119:
	.section	.rodata.str1.8
	.align 8
.LC120:
	.string	"replacing non-null wakeup_timer!"
	.align 8
.LC121:
	.string	"tmr_create(wakeup_connection) failed"
	.section	.rodata.str1.1
.LC122:
	.string	"write - %m sending %.80s"
	.section	.text.unlikely
.LCOLDB123:
	.text
.LHOTB123:
	.p2align 4,,15
	.type	handle_send, @function
handle_send:
.LFB21:
	.loc 1 1708 0
	.cfi_startproc
.LVL456:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$1000000000, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbp
	movq	%rdi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	.loc 1 1716 0
	movq	64(%rdi), %rcx
	.loc 1 1713 0
	movq	8(%rdi), %r12
.LVL457:
	.loc 1 1716 0
	cmpq	$-1, %rcx
	je	.L433
	.loc 1 1719 0
	leaq	3(%rcx), %rax
	testq	%rcx, %rcx
	movq	%rcx, %rdx
	cmovs	%rax, %rdx
	sarq	$2, %rdx
.LVL458:
.L433:
	.loc 1 1722 0
	movq	472(%r12), %rax
	testq	%rax, %rax
	jne	.L434
	.loc 1 1727 0
	movq	136(%rbx), %rsi
.LVL459:
	.loc 1 1725 0
	movq	128(%rbx), %rax
	movl	704(%r12), %edi
.LVL460:
	subq	%rsi, %rax
	cmpq	%rdx, %rax
	cmovbe	%rax, %rdx
.LVL461:
	addq	712(%r12), %rsi
	call	write
.LVL462:
	.loc 1 1743 0
	testl	%eax, %eax
	js	.L491
.L436:
	.loc 1 1746 0
	je	.L439
	.loc 1 1795 0
	movq	0(%rbp), %rdx
	movq	%rdx, 88(%rbx)
	.loc 1 1797 0
	movq	472(%r12), %rdx
	testq	%rdx, %rdx
	je	.L489
	.loc 1 1800 0
	movslq	%eax, %rcx
	cmpq	%rcx, %rdx
	ja	.L492
	.loc 1 1811 0
	subl	%edx, %eax
.LVL463:
	.loc 1 1812 0
	movq	$0, 472(%r12)
.L489:
	movslq	%eax, %rdi
.LVL464:
.L446:
	.loc 1 1817 0
	movq	8(%rbx), %rdx
	.loc 1 1816 0
	movq	%rdi, %r10
	.loc 1 1817 0
	movq	%rdi, %rax
	.loc 1 1816 0
	addq	136(%rbx), %r10
	.loc 1 1817 0
	addq	200(%rdx), %rax
	.loc 1 1816 0
	movq	%r10, 136(%rbx)
	.loc 1 1817 0
	movq	%rax, 200(%rdx)
.LVL465:
	.loc 1 1818 0
	movl	56(%rbx), %edx
	testl	%edx, %edx
	jle	.L452
	subl	$1, %edx
	movq	throttles(%rip), %r8
	leaq	16(%rbx), %rsi
	leaq	20(%rbx,%rdx,4), %r9
.LVL466:
	.p2align 4,,10
	.p2align 3
.L451:
	.loc 1 1819 0 discriminator 3
	movslq	(%rsi), %rcx
	addq	$4, %rsi
	leaq	(%rcx,%rcx,2), %rcx
	salq	$4, %rcx
	addq	%rdi, 32(%r8,%rcx)
	.loc 1 1818 0 discriminator 3
	cmpq	%rsi, %r9
	jne	.L451
.L452:
	.loc 1 1822 0
	cmpq	128(%rbx), %r10
	jge	.L493
	.loc 1 1830 0
	movq	112(%rbx), %rdx
	cmpq	$100, %rdx
	jg	.L494
.L453:
	.loc 1 1834 0
	movq	64(%rbx), %rcx
	cmpq	$-1, %rcx
	je	.L432
	.loc 1 1836 0
	movq	0(%rbp), %r13
.LVL467:
	.loc 1 1838 0
	subq	80(%rbx), %r13
.LVL468:
	movl	$1, %edx
	cmove	%rdx, %r13
.LVL469:
	.loc 1 1839 0
	cqto
	idivq	%r13
	cmpq	%rax, %rcx
	jge	.L432
	.loc 1 1842 0
	movl	704(%r12), %edi
	.loc 1 1841 0
	movl	$3, (%rbx)
	.loc 1 1842 0
	call	fdwatch_del_fd
.LVL470:
	.loc 1 1846 0
	movq	8(%rbx), %rax
	movq	200(%rax), %rax
	cqto
	idivq	64(%rbx)
	movl	%eax, %r12d
.LVL471:
	subl	%r13d, %r12d
.LVL472:
	.loc 1 1848 0
	cmpq	$0, 96(%rbx)
	je	.L456
	.loc 1 1849 0
	movl	$.LC120, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.LVL473:
.L456:
	.loc 1 1850 0
	testl	%r12d, %r12d
	movl	$500, %ecx
	jle	.L488
	.loc 1 1850 0 is_stmt 0 discriminator 1
	movslq	%r12d, %r12
	imulq	$1000, %r12, %rcx
	jmp	.L488
.LVL474:
	.p2align 4,,10
	.p2align 3
.L434:
.LBB6:
	.loc 1 1737 0 is_stmt 1
	movq	%rax, 8(%rsp)
	.loc 1 1739 0
	movq	128(%rbx), %rdi
	.loc 1 1740 0
	movq	%rsp, %rsi
.LVL475:
	.loc 1 1738 0
	movq	136(%rbx), %rax
	.loc 1 1736 0
	movq	368(%r12), %rcx
	.loc 1 1739 0
	subq	%rax, %rdi
	.loc 1 1736 0
	movq	%rcx, (%rsp)
	.loc 1 1738 0
	movq	%rax, %rcx
	addq	712(%r12), %rcx
	.loc 1 1739 0
	cmpq	%rdx, %rdi
	cmovbe	%rdi, %rdx
.LVL476:
	.loc 1 1740 0
	movl	704(%r12), %edi
	.loc 1 1739 0
	movq	%rdx, 24(%rsp)
	.loc 1 1740 0
	movl	$2, %edx
	.loc 1 1738 0
	movq	%rcx, 16(%rsp)
	.loc 1 1740 0
	call	writev
.LVL477:
.LBE6:
	.loc 1 1743 0
	testl	%eax, %eax
	jns	.L436
.L491:
	.loc 1 1743 0 is_stmt 0 discriminator 1
	call	__errno_location
.LVL478:
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L432
	.loc 1 1747 0 is_stmt 1
	cmpl	$11, %eax
	je	.L439
	.loc 1 1788 0
	cmpl	$32, %eax
	setne	%cl
	cmpl	$22, %eax
	setne	%dl
	testb	%dl, %cl
	je	.L443
	cmpl	$104, %eax
	je	.L443
	.loc 1 1789 0
	movq	208(%r12), %rdx
	movl	$.LC122, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.LVL479:
.L443:
	.loc 1 1790 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	clear_connection
.LVL480:
	.loc 1 1861 0
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL481:
	popq	%rbp
	.cfi_def_cfa_offset 24
.LVL482:
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL483:
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.LVL484:
	.p2align 4,,10
	.p2align 3
.L439:
	.cfi_restore_state
	.loc 1 1759 0
	addq	$100, 112(%rbx)
	.loc 1 1761 0
	movl	704(%r12), %edi
	.loc 1 1760 0
	movl	$3, (%rbx)
	.loc 1 1761 0
	call	fdwatch_del_fd
.LVL485:
	.loc 1 1763 0
	cmpq	$0, 96(%rbx)
	je	.L442
	.loc 1 1764 0
	movl	$.LC120, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.LVL486:
.L442:
	.loc 1 1765 0
	movq	112(%rbx), %rcx
.LVL487:
.L488:
	xorl	%r8d, %r8d
	movq	%rbx, %rdx
	movl	$wakeup_connection, %esi
	movq	%rbp, %rdi
	call	tmr_create
.LVL488:
	.loc 1 1767 0
	testq	%rax, %rax
	.loc 1 1765 0
	movq	%rax, 96(%rbx)
	.loc 1 1767 0
	je	.L495
.L432:
	.loc 1 1861 0
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL489:
	popq	%rbp
	.cfi_def_cfa_offset 24
.LVL490:
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.LVL491:
	.p2align 4,,10
	.p2align 3
.L494:
	.cfi_restore_state
	.loc 1 1831 0
	subq	$100, %rdx
	movq	%rdx, 112(%rbx)
	jmp	.L453
.LVL492:
	.p2align 4,,10
	.p2align 3
.L492:
.LBB7:
	.loc 1 1804 0
	movq	368(%r12), %rdi
	subl	%eax, %edx
.LVL493:
	movslq	%edx, %r13
	movq	%r13, %rdx
	leaq	(%rdi,%rcx), %rsi
	call	memmove
.LVL494:
	.loc 1 1805 0
	movq	%r13, 472(%r12)
.LVL495:
.LBE7:
	xorl	%edi, %edi
	jmp	.L446
.LVL496:
	.p2align 4,,10
	.p2align 3
.L493:
	.loc 1 1825 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	finish_connection
.LVL497:
	.loc 1 1861 0
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL498:
	popq	%rbp
	.cfi_def_cfa_offset 24
.LVL499:
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL500:
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.LVL501:
.L495:
	.cfi_restore_state
	.loc 1 1769 0
	movl	$2, %edi
	movl	$.LC121, %esi
	xorl	%eax, %eax
	call	syslog
.LVL502:
	.loc 1 1770 0
	movl	$1, %edi
	call	exit
.LVL503:
	.cfi_endproc
.LFE21:
	.size	handle_send, .-handle_send
	.section	.text.unlikely
.LCOLDE123:
	.text
.LHOTE123:
	.section	.text.unlikely
.LCOLDB124:
	.text
.LHOTB124:
	.p2align 4,,15
	.type	linger_clear_connection, @function
linger_clear_connection:
.LFB31:
	.loc 1 2119 0
	.cfi_startproc
.LVL504:
	.loc 1 2123 0
	movq	$0, 104(%rdi)
	.loc 1 2124 0
	jmp	really_clear_connection
.LVL505:
	.cfi_endproc
.LFE31:
	.size	linger_clear_connection, .-linger_clear_connection
	.section	.text.unlikely
.LCOLDE124:
	.text
.LHOTE124:
	.section	.text.unlikely
.LCOLDB125:
	.text
.LHOTB125:
	.p2align 4,,15
	.type	handle_linger, @function
handle_linger:
.LFB22:
	.loc 1 1866 0
	.cfi_startproc
.LVL506:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	.loc 1 1873 0
	movl	$4096, %edx
	.loc 1 1866 0
	subq	$4104, %rsp
	.cfi_def_cfa_offset 4128
	.loc 1 1873 0
	movq	8(%rdi), %rax
	movq	%rsp, %rsi
.LVL507:
	movl	704(%rax), %edi
.LVL508:
	call	read
.LVL509:
	.loc 1 1874 0
	testl	%eax, %eax
	js	.L504
	.loc 1 1876 0
	je	.L500
.LVL510:
.L497:
	.loc 1 1878 0
	addq	$4104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL511:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL512:
	ret
.LVL513:
	.p2align 4,,10
	.p2align 3
.L504:
	.cfi_restore_state
	.loc 1 1874 0 discriminator 1
	call	__errno_location
.LVL514:
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L497
	cmpl	$11, %eax
	je	.L497
.L500:
	.loc 1 1877 0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	really_clear_connection
.LVL515:
	.loc 1 1878 0
	addq	$4104, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL516:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL517:
	ret
	.cfi_endproc
.LFE22:
	.size	handle_linger, .-handle_linger
	.section	.text.unlikely
.LCOLDE125:
	.text
.LHOTE125:
	.section	.rodata.str1.1
.LC126:
	.string	"%d"
.LC127:
	.string	"getaddrinfo %.80s - %.80s"
.LC128:
	.string	"%s: getaddrinfo %s - %s\n"
	.section	.rodata.str1.8
	.align 8
.LC129:
	.string	"%.80s - sockaddr too small (%lu < %lu)"
	.section	.text.unlikely
.LCOLDB130:
	.text
.LHOTB130:
	.p2align 4,,15
	.type	lookup_hostname.constprop.1, @function
lookup_hostname.constprop.1:
.LFB37:
	.loc 1 1235 0
	.cfi_startproc
.LVL518:
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	.loc 1 1247 0
	xorl	%eax, %eax
	.loc 1 1235 0
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rcx, %r13
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbp
	.loc 1 1247 0
	movl	$6, %ecx
.LVL519:
	.loc 1 1235 0
	movq	%rsi, %r12
	movq	%rdx, %r14
	.loc 1 1251 0
	movl	$10, %esi
.LVL520:
	.loc 1 1235 0
	subq	$80, %rsp
	.cfi_def_cfa_offset 128
	.loc 1 1251 0
	movl	$.LC126, %edx
.LVL521:
	.loc 1 1247 0
	leaq	32(%rsp), %rbx
	movq	%rbx, %rdi
.LVL522:
	rep stosq
	.loc 1 1251 0
	movzwl	port(%rip), %ecx
	leaq	16(%rsp), %rdi
	.loc 1 1249 0
	movl	$1, 32(%rsp)
	.loc 1 1250 0
	movl	$1, 40(%rsp)
	.loc 1 1251 0
	call	snprintf
.LVL523:
	.loc 1 1252 0
	movq	hostname(%rip), %rdi
	leaq	8(%rsp), %rcx
	leaq	16(%rsp), %rsi
	movq	%rbx, %rdx
	call	getaddrinfo
.LVL524:
	testl	%eax, %eax
	jne	.L524
.LVL525:
	.loc 1 1266 0
	movq	8(%rsp), %rax
.LVL526:
	testq	%rax, %rax
	je	.L507
	xorl	%ebx, %ebx
.LVL527:
	xorl	%esi, %esi
	jmp	.L511
.LVL528:
	.p2align 4,,10
	.p2align 3
.L526:
	.loc 1 1268 0
	cmpl	$10, %edx
	jne	.L508
	.loc 1 1271 0
	testq	%rsi, %rsi
	cmove	%rax, %rsi
.LVL529:
.L508:
	.loc 1 1266 0
	movq	40(%rax), %rax
.LVL530:
	testq	%rax, %rax
	je	.L525
.LVL531:
.L511:
	.loc 1 1268 0
	movl	4(%rax), %edx
	cmpl	$2, %edx
	jne	.L526
	.loc 1 1275 0
	testq	%rbx, %rbx
	cmove	%rax, %rbx
.LVL532:
	.loc 1 1266 0
	movq	40(%rax), %rax
.LVL533:
	testq	%rax, %rax
	jne	.L511
.L525:
	.loc 1 1281 0
	testq	%rsi, %rsi
	je	.L527
	.loc 1 1285 0
	movl	16(%rsi), %r8d
	cmpq	$128, %r8
	ja	.L523
	.loc 1 1293 0
	movl	$16, %ecx
	movq	%r14, %rdi
	rep stosq
	.loc 1 1294 0
	movq	%r14, %rdi
	movl	16(%rsi), %edx
	movq	24(%rsi), %rsi
.LVL534:
	call	memmove
.LVL535:
	.loc 1 1295 0
	movl	$1, 0(%r13)
.LVL536:
.L513:
	.loc 1 1298 0
	testq	%rbx, %rbx
	je	.L528
	.loc 1 1302 0
	movl	16(%rbx), %r8d
	cmpq	$128, %r8
	ja	.L523
	.loc 1 1310 0
	xorl	%eax, %eax
	movl	$16, %ecx
	movq	%rbp, %rdi
	rep stosq
	.loc 1 1311 0
	movq	%rbp, %rdi
	movl	16(%rbx), %edx
	movq	24(%rbx), %rsi
	call	memmove
.LVL537:
	.loc 1 1312 0
	movl	$1, (%r12)
.L516:
	.loc 1 1315 0
	movq	8(%rsp), %rdi
	call	freeaddrinfo
.LVL538:
	.loc 1 1365 0
	addq	$80, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
.LVL539:
	popq	%r12
	.cfi_def_cfa_offset 24
.LVL540:
	popq	%r13
	.cfi_def_cfa_offset 16
.LVL541:
	popq	%r14
	.cfi_def_cfa_offset 8
.LVL542:
	ret
.LVL543:
.L527:
	.cfi_restore_state
	.loc 1 1281 0
	movq	%rbx, %rax
.LVL544:
.L507:
	.loc 1 1282 0
	movl	$0, 0(%r13)
	movq	%rax, %rbx
	jmp	.L513
.L528:
	.loc 1 1299 0
	movl	$0, (%r12)
	jmp	.L516
.L523:
	.loc 1 1304 0
	movq	hostname(%rip), %rdx
	movl	$2, %edi
	movl	$128, %ecx
	movl	$.LC129, %esi
	xorl	%eax, %eax
	call	syslog
.LVL545:
	.loc 1 1308 0
	movl	$1, %edi
	call	exit
.LVL546:
.L524:
	.loc 1 1254 0
	movl	%eax, %edi
	movl	%eax, %ebx
.LVL547:
	call	gai_strerror
.LVL548:
	movq	hostname(%rip), %rdx
	movq	%rax, %rcx
	movl	$.LC127, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
.LVL549:
	.loc 1 1257 0
	movl	%ebx, %edi
	call	gai_strerror
.LVL550:
	movq	stderr(%rip), %rdi
	movq	hostname(%rip), %rcx
	movq	%rax, %r8
	movq	argv0(%rip), %rdx
	movl	$.LC128, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL551:
	.loc 1 1260 0
	movl	$1, %edi
	call	exit
.LVL552:
	.cfi_endproc
.LFE37:
	.size	lookup_hostname.constprop.1, .-lookup_hostname.constprop.1
	.section	.text.unlikely
.LCOLDE130:
	.text
.LHOTE130:
	.section	.rodata.str1.1
.LC131:
	.string	"can't find any valid address"
	.section	.rodata.str1.8
	.align 8
.LC132:
	.string	"%s: can't find any valid address\n"
	.section	.rodata.str1.1
.LC133:
	.string	"unknown user - '%.80s'"
.LC134:
	.string	"%s: unknown user - '%s'\n"
.LC135:
	.string	"/dev/null"
	.section	.rodata.str1.8
	.align 8
.LC136:
	.string	"logfile is not an absolute path, you may not be able to re-open it"
	.align 8
.LC137:
	.string	"%s: logfile is not an absolute path, you may not be able to re-open it\n"
	.section	.rodata.str1.1
.LC138:
	.string	"fchown logfile - %m"
.LC139:
	.string	"fchown logfile"
.LC140:
	.string	"chdir - %m"
.LC141:
	.string	"chdir"
.LC142:
	.string	"daemon - %m"
.LC143:
	.string	"w"
.LC144:
	.string	"%d\n"
	.section	.rodata.str1.8
	.align 8
.LC145:
	.string	"fdwatch initialization failure"
	.section	.rodata.str1.1
.LC146:
	.string	"chroot - %m"
	.section	.rodata.str1.8
	.align 8
.LC147:
	.string	"logfile is not within the chroot tree, you will not be able to re-open it"
	.align 8
.LC148:
	.string	"%s: logfile is not within the chroot tree, you will not be able to re-open it\n"
	.section	.rodata.str1.1
.LC149:
	.string	"chroot chdir - %m"
.LC150:
	.string	"chroot chdir"
.LC151:
	.string	"data_dir chdir - %m"
.LC152:
	.string	"data_dir chdir"
.LC153:
	.string	"tmr_create(occasional) failed"
.LC154:
	.string	"tmr_create(idle) failed"
	.section	.rodata.str1.8
	.align 8
.LC155:
	.string	"tmr_create(update_throttles) failed"
	.section	.rodata.str1.1
.LC156:
	.string	"tmr_create(show_stats) failed"
.LC157:
	.string	"setgroups - %m"
.LC158:
	.string	"setgid - %m"
.LC159:
	.string	"initgroups - %m"
.LC160:
	.string	"setuid - %m"
	.section	.rodata.str1.8
	.align 8
.LC161:
	.string	"started as root without requesting chroot(), warning only"
	.align 8
.LC162:
	.string	"out of memory allocating a connecttab"
	.section	.rodata.str1.1
.LC163:
	.string	"fdwatch - %m"
	.section	.text.unlikely
.LCOLDB164:
	.section	.text.startup,"ax",@progbits
.LHOTB164:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB9:
	.loc 1 353 0
	.cfi_startproc
.LVL553:
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
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbp
	subq	$4424, %rsp
	.cfi_def_cfa_offset 4480
	.loc 1 370 0
	movq	(%rsi), %rbx
	.loc 1 372 0
	movl	$47, %esi
.LVL554:
	movq	%rbx, %rdi
.LVL555:
	.loc 1 370 0
	movq	%rbx, argv0(%rip)
	.loc 1 372 0
	call	strrchr
.LVL556:
	.loc 1 374 0
	leaq	1(%rax), %rdx
	testq	%rax, %rax
	.loc 1 377 0
	movl	$9, %esi
	.loc 1 374 0
	cmovne	%rdx, %rbx
.LVL557:
	.loc 1 377 0
	movl	$24, %edx
	movq	%rbx, %rdi
	call	openlog
.LVL558:
	.loc 1 380 0
	movq	%rbp, %rsi
	movl	%r12d, %edi
	.loc 1 386 0
	leaq	176(%rsp), %rbp
.LVL559:
	leaq	48(%rsp), %r12
.LVL560:
	.loc 1 380 0
	call	parse_args
.LVL561:
	.loc 1 383 0
	call	tzset
.LVL562:
	.loc 1 386 0
	leaq	28(%rsp), %rcx
	leaq	24(%rsp), %rsi
	movq	%rbp, %rdx
	movq	%r12, %rdi
	call	lookup_hostname.constprop.1
.LVL563:
	.loc 1 387 0
	movl	24(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L531
	.loc 1 387 0 is_stmt 0 discriminator 1
	cmpl	$0, 28(%rsp)
	je	.L666
.L531:
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
	je	.L532
	.loc 1 399 0
	call	read_throttlefile
.LVL564:
.L532:
	.loc 1 404 0
	call	getuid
.LVL565:
	testl	%eax, %eax
	.loc 1 357 0
	movl	$32767, %r15d
	.loc 1 356 0
	movl	$32767, 4(%rsp)
	.loc 1 404 0
	je	.L667
.LVL566:
.L533:
	.loc 1 418 0
	movq	logfile(%rip), %rbx
.LVL567:
	testq	%rbx, %rbx
	je	.L603
	.loc 1 420 0
	movl	$.LC135, %edi
	movl	$10, %ecx
	movq	%rbx, %rsi
	repz cmpsb
	je	.L668
	.loc 1 425 0
	movl	$.LC94, %esi
	movq	%rbx, %rdi
	call	strcmp
.LVL568:
	testl	%eax, %eax
	jne	.L537
	.loc 1 426 0
	movq	stdout(%rip), %r14
.LVL569:
.L535:
	.loc 1 460 0
	movq	dir(%rip), %rdi
	testq	%rdi, %rdi
	je	.L541
	.loc 1 462 0
	call	chdir
.LVL570:
	testl	%eax, %eax
	js	.L669
.L541:
	.loc 1 486 0
	leaq	304(%rsp), %rbx
	movl	$4096, %esi
	movq	%rbx, %rdi
	call	getcwd
.LVL571:
	.loc 1 487 0
	movq	%rbx, %rdx
.L542:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	.L542
	movl	%eax, %ecx
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	cmove	%rcx, %rdx
	addb	%al, %al
	sbbq	$3, %rdx
	subq	%rbx, %rdx
	cmpb	$47, 303(%rsp,%rdx)
	je	.L544
	.loc 1 488 0
	movw	$47, (%rbx,%rdx)
.L544:
	.loc 1 490 0
	movl	debug(%rip), %edx
	testl	%edx, %edx
	jne	.L545
	.loc 1 495 0
	movq	stdin(%rip), %rdi
	call	fclose
.LVL572:
	.loc 1 496 0
	movq	stdout(%rip), %rdi
	cmpq	%rdi, %r14
	je	.L546
	.loc 1 497 0
	call	fclose
.LVL573:
.L546:
	.loc 1 498 0
	movq	stderr(%rip), %rdi
	call	fclose
.LVL574:
	.loc 1 502 0
	movl	$1, %esi
	movl	$1, %edi
	call	daemon
.LVL575:
	testl	%eax, %eax
	.loc 1 504 0
	movl	$.LC142, %esi
	.loc 1 502 0
	js	.L664
.L547:
	.loc 1 533 0
	movq	pidfile(%rip), %rdi
	testq	%rdi, %rdi
	je	.L548
.LBB8:
	.loc 1 536 0
	movl	$.LC143, %esi
	call	fopen
.LVL576:
	.loc 1 537 0
	testq	%rax, %rax
	.loc 1 536 0
	movq	%rax, %r13
.LVL577:
	.loc 1 537 0
	je	.L670
	.loc 1 542 0
	call	getpid
.LVL578:
	movq	%r13, %rdi
	movl	%eax, %edx
	movl	$.LC144, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL579:
	.loc 1 543 0
	movq	%r13, %rdi
	call	fclose
.LVL580:
.L548:
.LBE8:
	.loc 1 549 0
	call	fdwatch_get_nfiles
.LVL581:
	.loc 1 550 0
	testl	%eax, %eax
	.loc 1 549 0
	movl	%eax, max_connects(%rip)
	.loc 1 550 0
	js	.L671
	.loc 1 555 0
	subl	$10, %eax
	.loc 1 558 0
	cmpl	$0, do_chroot(%rip)
	.loc 1 555 0
	movl	%eax, max_connects(%rip)
	.loc 1 558 0
	jne	.L672
.L551:
	.loc 1 598 0
	movq	data_dir(%rip), %rdi
	testq	%rdi, %rdi
	je	.L555
	.loc 1 600 0
	call	chdir
.LVL582:
	testl	%eax, %eax
	js	.L673
.L555:
	.loc 1 610 0
	movl	$handle_term, %esi
	movl	$15, %edi
	xorl	%eax, %eax
	call	sigset
.LVL583:
	.loc 1 611 0
	movl	$handle_term, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	sigset
.LVL584:
	.loc 1 612 0
	movl	$handle_chld, %esi
	movl	$17, %edi
	xorl	%eax, %eax
	call	sigset
.LVL585:
	.loc 1 613 0
	movl	$1, %esi
	movl	$13, %edi
	xorl	%eax, %eax
	call	sigset
.LVL586:
	.loc 1 614 0
	movl	$handle_hup, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	sigset
.LVL587:
	.loc 1 615 0
	movl	$handle_usr1, %esi
	movl	$10, %edi
	xorl	%eax, %eax
	call	sigset
.LVL588:
	.loc 1 616 0
	movl	$handle_usr2, %esi
	movl	$12, %edi
	xorl	%eax, %eax
	call	sigset
.LVL589:
	.loc 1 617 0
	movl	$handle_alrm, %esi
	movl	$14, %edi
	xorl	%eax, %eax
	call	sigset
.LVL590:
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
.LVL591:
	.loc 1 634 0
	call	tmr_init
.LVL592:
	.loc 1 639 0
	xorl	%esi, %esi
	cmpl	$0, 28(%rsp)
	movl	no_empty_referers(%rip), %eax
	movq	%rbp, %rdx
	movzwl	port(%rip), %ecx
	movl	cgi_limit(%rip), %r9d
	movq	cgi_pattern(%rip), %r8
	movq	hostname(%rip), %rdi
	cmove	%rsi, %rdx
	cmpl	$0, 24(%rsp)
	pushq	%rax
	.cfi_def_cfa_offset 4488
	movl	do_global_passwd(%rip), %eax
	pushq	local_pattern(%rip)
	.cfi_def_cfa_offset 4496
	pushq	url_pattern(%rip)
	.cfi_def_cfa_offset 4504
	pushq	%rax
	.cfi_def_cfa_offset 4512
	movl	do_vhost(%rip), %eax
	cmovne	%r12, %rsi
	pushq	%rax
	.cfi_def_cfa_offset 4520
	movl	no_symlink_check(%rip), %eax
	pushq	%rax
	.cfi_def_cfa_offset 4528
	movl	no_log(%rip), %eax
	pushq	%r14
	.cfi_def_cfa_offset 4536
	pushq	%rax
	.cfi_def_cfa_offset 4544
	movl	max_age(%rip), %eax
	pushq	%rbx
	.cfi_def_cfa_offset 4552
	pushq	%rax
	.cfi_def_cfa_offset 4560
	pushq	p3p(%rip)
	.cfi_def_cfa_offset 4568
	pushq	charset(%rip)
	.cfi_def_cfa_offset 4576
	call	httpd_initialize
.LVL593:
	.loc 1 645 0
	addq	$96, %rsp
	.cfi_def_cfa_offset 4480
	testq	%rax, %rax
	.loc 1 639 0
	movq	%rax, hs(%rip)
	.loc 1 645 0
	je	.L665
	.loc 1 649 0
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$120000, %ecx
	movl	$occasional, %esi
	call	tmr_create
.LVL594:
	testq	%rax, %rax
	je	.L674
	.loc 1 655 0
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$5000, %ecx
	movl	$idle, %esi
	call	tmr_create
.LVL595:
	testq	%rax, %rax
	je	.L675
	.loc 1 660 0
	cmpl	$0, numthrottles(%rip)
	jle	.L561
	.loc 1 663 0
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$2000, %ecx
	movl	$update_throttles, %esi
	call	tmr_create
.LVL596:
	testq	%rax, %rax
	je	.L676
.L561:
	.loc 1 671 0
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$3600000, %ecx
	movl	$show_stats, %esi
	call	tmr_create
.LVL597:
	testq	%rax, %rax
	je	.L677
	.loc 1 677 0
	xorl	%edi, %edi
	call	time
.LVL598:
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
.LVL599:
	testl	%eax, %eax
	jne	.L564
	.loc 1 686 0
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	setgroups
.LVL600:
	testl	%eax, %eax
	.loc 1 688 0
	movl	$.LC157, %esi
	.loc 1 686 0
	js	.L664
	.loc 1 692 0
	movl	%r15d, %edi
	call	setgid
.LVL601:
	testl	%eax, %eax
	.loc 1 694 0
	movl	$.LC158, %esi
	.loc 1 692 0
	js	.L664
	.loc 1 698 0
	movq	user(%rip), %rdi
	movl	%r15d, %esi
	call	initgroups
.LVL602:
	testl	%eax, %eax
	js	.L678
.L567:
	.loc 1 705 0
	movl	4(%rsp), %edi
	call	setuid
.LVL603:
	testl	%eax, %eax
	.loc 1 707 0
	movl	$.LC160, %esi
	.loc 1 705 0
	js	.L664
	.loc 1 711 0
	cmpl	$0, do_chroot(%rip)
	je	.L679
.L564:
	.loc 1 718 0
	movslq	max_connects(%rip), %rbp
	movq	%rbp, %rbx
	imulq	$144, %rbp, %rbp
	movq	%rbp, %rdi
	call	malloc
.LVL604:
	.loc 1 719 0
	testq	%rax, %rax
	.loc 1 718 0
	movq	%rax, connects(%rip)
	.loc 1 719 0
	je	.L570
.LVL605:
	.loc 1 724 0 discriminator 1
	xorl	%ecx, %ecx
	testl	%ebx, %ebx
	movq	%rax, %rdx
	jle	.L575
.LVL606:
	.p2align 4,,10
	.p2align 3
.L643:
	.loc 1 727 0 discriminator 3
	addl	$1, %ecx
.LVL607:
	.loc 1 726 0 discriminator 3
	movl	$0, (%rdx)
	.loc 1 728 0 discriminator 3
	movq	$0, 8(%rdx)
.LVL608:
	.loc 1 727 0 discriminator 3
	movl	%ecx, 4(%rdx)
	addq	$144, %rdx
	.loc 1 724 0 discriminator 3
	cmpl	%ecx, %ebx
	jne	.L643
.LVL609:
.L575:
	.loc 1 730 0
	movl	$-1, -140(%rax,%rbp)
	.loc 1 735 0
	movq	hs(%rip), %rax
	.loc 1 731 0
	movl	$0, first_free_connect(%rip)
	.loc 1 732 0
	movl	$0, num_connects(%rip)
	.loc 1 733 0
	movl	$0, httpd_conn_count(%rip)
	.loc 1 735 0
	testq	%rax, %rax
	je	.L576
	.loc 1 737 0
	movl	72(%rax), %edi
	cmpl	$-1, %edi
	je	.L577
	.loc 1 738 0
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	fdwatch_add_fd
.LVL610:
	movq	hs(%rip), %rax
.L577:
	.loc 1 739 0
	movl	76(%rax), %edi
	cmpl	$-1, %edi
	je	.L576
	.loc 1 740 0
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	fdwatch_add_fd
.LVL611:
.L576:
	.loc 1 744 0
	leaq	32(%rsp), %rdi
	call	tmr_prepare_timeval
.LVL612:
	.p2align 4,,10
	.p2align 3
.L578:
	.loc 1 745 0
	movl	terminate(%rip), %eax
	testl	%eax, %eax
	je	.L601
	.loc 1 745 0 is_stmt 0 discriminator 1
	cmpl	$0, num_connects(%rip)
	jle	.L680
.L601:
	.loc 1 748 0 is_stmt 1
	movl	got_hup(%rip), %eax
	testl	%eax, %eax
	jne	.L681
.L579:
	.loc 1 755 0
	leaq	32(%rsp), %rdi
	call	tmr_mstimeout
.LVL613:
	movq	%rax, %rdi
	call	fdwatch
.LVL614:
	.loc 1 756 0
	testl	%eax, %eax
	.loc 1 755 0
	movl	%eax, %ebx
.LVL615:
	.loc 1 756 0
	js	.L682
	.loc 1 763 0
	leaq	32(%rsp), %rdi
	call	tmr_prepare_timeval
.LVL616:
	.loc 1 765 0
	testl	%ebx, %ebx
	je	.L683
	.loc 1 773 0
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L592
	.loc 1 773 0 is_stmt 0 discriminator 1
	movl	76(%rax), %edi
	cmpl	$-1, %edi
	je	.L587
	.loc 1 774 0 is_stmt 1 discriminator 2
	call	fdwatch_check_fd
.LVL617:
	.loc 1 773 0 discriminator 2
	testl	%eax, %eax
	jne	.L588
.L591:
	.loc 1 783 0
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L592
.L587:
	.loc 1 783 0 is_stmt 0 discriminator 1
	movl	72(%rax), %edi
	cmpl	$-1, %edi
	je	.L592
	.loc 1 784 0 is_stmt 1 discriminator 2
	call	fdwatch_check_fd
.LVL618:
	.loc 1 783 0 discriminator 2
	testl	%eax, %eax
	jne	.L684
.LVL619:
	.p2align 4,,10
	.p2align 3
.L592:
	.loc 1 795 0
	call	fdwatch_get_next_client_data
.LVL620:
	cmpq	$-1, %rax
	movq	%rax, %rbx
.LVL621:
	je	.L685
	.loc 1 797 0
	testq	%rbx, %rbx
	je	.L592
.LVL622:
	.loc 1 800 0
	movq	8(%rbx), %rax
.LVL623:
	movl	704(%rax), %edi
	call	fdwatch_check_fd
.LVL624:
	testl	%eax, %eax
	je	.L686
	.loc 1 804 0
	movl	(%rbx), %eax
	cmpl	$2, %eax
	je	.L595
	cmpl	$4, %eax
	je	.L596
	cmpl	$1, %eax
	jne	.L592
	.loc 1 806 0
	leaq	32(%rsp), %rsi
	movq	%rbx, %rdi
	call	handle_read
.LVL625:
	jmp	.L592
.LVL626:
.L668:
	.loc 1 422 0
	movl	$1, no_log(%rip)
.LVL627:
	.loc 1 423 0
	xorl	%r14d, %r14d
	jmp	.L535
.LVL628:
.L545:
	.loc 1 529 0
	call	setsid
.LVL629:
	jmp	.L547
.L671:
	.loc 1 552 0
	movl	$.LC145, %esi
.L664:
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
.LVL630:
.L665:
	.loc 1 553 0
	movl	$1, %edi
	call	exit
.LVL631:
.L667:
	.loc 1 406 0
	movq	user(%rip), %rdi
	call	getpwnam
.LVL632:
	.loc 1 407 0
	testq	%rax, %rax
	je	.L687
	.loc 1 413 0
	movl	16(%rax), %ecx
	.loc 1 414 0
	movl	20(%rax), %r15d
	.loc 1 413 0
	movl	%ecx, 4(%rsp)
.LVL633:
	jmp	.L533
.LVL634:
.L666:
	.loc 1 389 0
	movl	$.LC131, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	syslog
.LVL635:
	.loc 1 390 0
	movq	stderr(%rip), %rdi
	movq	argv0(%rip), %rdx
	movl	$.LC132, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL636:
	.loc 1 391 0
	movl	$1, %edi
	call	exit
.LVL637:
.L686:
	.loc 1 802 0
	leaq	32(%rsp), %rsi
	movq	%rbx, %rdi
	call	clear_connection
.LVL638:
	jmp	.L592
.LVL639:
.L682:
	.loc 1 758 0
	call	__errno_location
.LVL640:
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L578
	cmpl	$11, %eax
	je	.L578
	.loc 1 760 0
	movl	$3, %edi
	movl	$.LC163, %esi
	xorl	%eax, %eax
	call	syslog
.LVL641:
	.loc 1 761 0
	movl	$1, %edi
	call	exit
.LVL642:
.L596:
	.loc 1 808 0
	leaq	32(%rsp), %rsi
	movq	%rbx, %rdi
	call	handle_linger
.LVL643:
	jmp	.L592
.L595:
	.loc 1 807 0
	leaq	32(%rsp), %rsi
	movq	%rbx, %rdi
	call	handle_send
.LVL644:
	jmp	.L592
.LVL645:
.L685:
	.loc 1 811 0
	leaq	32(%rsp), %rdi
	call	tmr_run
.LVL646:
	.loc 1 813 0
	movl	got_usr1(%rip), %eax
	testl	%eax, %eax
	je	.L578
	.loc 1 813 0 is_stmt 0 discriminator 1
	cmpl	$0, terminate(%rip)
	jne	.L578
	.loc 1 816 0 is_stmt 1
	movq	hs(%rip), %rax
	.loc 1 815 0
	movl	$1, terminate(%rip)
	.loc 1 816 0
	testq	%rax, %rax
	je	.L578
	.loc 1 818 0
	movl	72(%rax), %edi
	cmpl	$-1, %edi
	je	.L599
	.loc 1 819 0
	call	fdwatch_del_fd
.LVL647:
	movq	hs(%rip), %rax
.L599:
	.loc 1 820 0
	movl	76(%rax), %edi
	cmpl	$-1, %edi
	je	.L600
	.loc 1 821 0
	call	fdwatch_del_fd
.LVL648:
.L600:
	.loc 1 822 0
	movq	hs(%rip), %rdi
	call	httpd_unlisten
.LVL649:
	jmp	.L578
.LVL650:
.L681:
	.loc 1 750 0
	call	re_open_logfile
.LVL651:
	.loc 1 751 0
	movl	$0, got_hup(%rip)
	jmp	.L579
.LVL652:
.L683:
	.loc 1 768 0
	leaq	32(%rsp), %rdi
	call	tmr_run
.LVL653:
	.loc 1 769 0
	jmp	.L578
.LVL654:
.L672:
	.loc 1 560 0
	movq	%rbx, %rdi
	call	chroot
.LVL655:
	testl	%eax, %eax
	js	.L688
	.loc 1 571 0
	movq	logfile(%rip), %r13
	testq	%r13, %r13
	je	.L553
	.loc 1 571 0 is_stmt 0 discriminator 1
	movl	$.LC94, %esi
	movq	%r13, %rdi
	call	strcmp
.LVL656:
	testl	%eax, %eax
	je	.L553
	.loc 1 573 0 is_stmt 1
	xorl	%eax, %eax
	orq	$-1, %rcx
	movq	%rbx, %rdi
	repnz scasb
	movq	%rbx, %rsi
	movq	%r13, %rdi
	notq	%rcx
	leaq	-1(%rcx), %rdx
	movq	%rcx, 8(%rsp)
	call	strncmp
.LVL657:
	testl	%eax, %eax
	jne	.L554
	.loc 1 575 0
	movq	8(%rsp), %rcx
	movq	%r13, %rdi
	leaq	-2(%r13,%rcx), %rsi
	call	strcpy
.LVL658:
.L553:
	.loc 1 589 0
	movq	%rbx, %rdi
	.loc 1 587 0
	movw	$47, 304(%rsp)
	.loc 1 589 0
	call	chdir
.LVL659:
	testl	%eax, %eax
	jns	.L551
	.loc 1 591 0
	movl	$.LC149, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
.LVL660:
	.loc 1 592 0
	movl	$.LC150, %edi
	call	perror
.LVL661:
	.loc 1 593 0
	movl	$1, %edi
	call	exit
.LVL662:
.L603:
	.loc 1 457 0
	xorl	%r14d, %r14d
	jmp	.L535
.L537:
	.loc 1 429 0
	movq	%rbx, %rdi
	movl	$.LC96, %esi
	call	fopen
.LVL663:
	.loc 1 430 0
	movq	logfile(%rip), %rbx
	.loc 1 429 0
	movq	%rax, %r14
.LVL664:
	.loc 1 430 0
	movl	$384, %esi
	movq	%rbx, %rdi
	call	chmod
.LVL665:
	.loc 1 431 0
	testq	%r14, %r14
	je	.L606
	testl	%eax, %eax
	jne	.L606
	.loc 1 437 0
	cmpb	$47, (%rbx)
	je	.L540
	.loc 1 439 0
	movl	$.LC136, %esi
	movl	$4, %edi
	xorl	%eax, %eax
.LVL666:
	call	syslog
.LVL667:
	.loc 1 440 0
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.LC137, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL668:
.L540:
	.loc 1 442 0
	movq	%r14, %rdi
	call	fileno
.LVL669:
	movl	$1, %edx
	movl	%eax, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	call	fcntl
.LVL670:
	.loc 1 443 0
	call	getuid
.LVL671:
	testl	%eax, %eax
	jne	.L535
	.loc 1 448 0
	movq	%r14, %rdi
	call	fileno
.LVL672:
	movl	4(%rsp), %esi
	movl	%r15d, %edx
	movl	%eax, %edi
	call	fchown
.LVL673:
	testl	%eax, %eax
	jns	.L535
	.loc 1 450 0
	movl	$.LC138, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	syslog
.LVL674:
	.loc 1 451 0
	movl	$.LC139, %edi
	call	perror
.LVL675:
	jmp	.L535
.L669:
	.loc 1 464 0
	movl	$.LC140, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
.LVL676:
	.loc 1 465 0
	movl	$.LC141, %edi
	call	perror
.LVL677:
	.loc 1 466 0
	movl	$1, %edi
	call	exit
.LVL678:
.L670:
.LBB9:
	.loc 1 539 0
	movq	pidfile(%rip), %rdx
	movl	$2, %edi
	movl	$.LC85, %esi
	xorl	%eax, %eax
.LVL679:
	call	syslog
.LVL680:
	.loc 1 540 0
	movl	$1, %edi
	call	exit
.LVL681:
.L674:
.LBE9:
	.loc 1 651 0
	movl	$2, %edi
	movl	$.LC153, %esi
	call	syslog
.LVL682:
	.loc 1 652 0
	movl	$1, %edi
	call	exit
.LVL683:
.L673:
	.loc 1 602 0
	movl	$.LC151, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
.LVL684:
	.loc 1 603 0
	movl	$.LC152, %edi
	call	perror
.LVL685:
	.loc 1 604 0
	movl	$1, %edi
	call	exit
.LVL686:
.L554:
	.loc 1 583 0
	xorl	%eax, %eax
	movl	$.LC147, %esi
	movl	$4, %edi
	call	syslog
.LVL687:
	.loc 1 584 0
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.LC148, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL688:
	jmp	.L553
.L679:
	.loc 1 712 0
	movl	$.LC161, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	syslog
.LVL689:
	jmp	.L564
.L676:
	.loc 1 665 0
	movl	$2, %edi
	movl	$.LC155, %esi
	call	syslog
.LVL690:
	.loc 1 666 0
	movl	$1, %edi
	call	exit
.LVL691:
.L588:
	.loc 1 776 0
	movq	hs(%rip), %rax
	leaq	32(%rsp), %rdi
	movl	76(%rax), %esi
	call	handle_newconnect
.LVL692:
	testl	%eax, %eax
	jne	.L578
	jmp	.L591
.L684:
	.loc 1 786 0
	movq	hs(%rip), %rax
	leaq	32(%rsp), %rdi
	movl	72(%rax), %esi
	call	handle_newconnect
.LVL693:
	testl	%eax, %eax
	jne	.L578
	jmp	.L592
.LVL694:
.L677:
	.loc 1 673 0
	movl	$2, %edi
	movl	$.LC156, %esi
	call	syslog
.LVL695:
	.loc 1 674 0
	movl	$1, %edi
	call	exit
.LVL696:
.L606:
	.loc 1 433 0
	movq	%rbx, %rdx
	movl	$.LC85, %esi
	movl	$2, %edi
	xorl	%eax, %eax
.LVL697:
	call	syslog
.LVL698:
	.loc 1 434 0
	movq	logfile(%rip), %rdi
	call	perror
.LVL699:
	.loc 1 435 0
	movl	$1, %edi
	call	exit
.LVL700:
.L680:
	.loc 1 828 0
	call	shut_down
.LVL701:
	.loc 1 829 0
	movl	$5, %edi
	movl	$.LC106, %esi
	xorl	%eax, %eax
	call	syslog
.LVL702:
	.loc 1 830 0
	call	closelog
.LVL703:
	.loc 1 831 0
	xorl	%edi, %edi
	call	exit
.LVL704:
.L675:
	.loc 1 657 0
	movl	$2, %edi
	movl	$.LC154, %esi
	call	syslog
.LVL705:
	.loc 1 658 0
	movl	$1, %edi
	call	exit
.LVL706:
.L688:
	.loc 1 562 0
	movl	$.LC146, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	syslog
.LVL707:
	.loc 1 563 0
	movl	$.LC31, %edi
	call	perror
.LVL708:
	.loc 1 564 0
	movl	$1, %edi
	call	exit
.LVL709:
.L687:
	.loc 1 409 0
	movq	user(%rip), %rdx
	movl	$.LC133, %esi
	movl	$2, %edi
	call	syslog
.LVL710:
	.loc 1 410 0
	movq	stderr(%rip), %rdi
	movq	user(%rip), %rcx
	movl	$.LC134, %esi
	movq	argv0(%rip), %rdx
	xorl	%eax, %eax
	call	fprintf
.LVL711:
	.loc 1 411 0
	movl	$1, %edi
	call	exit
.LVL712:
.L570:
	.loc 1 721 0
	movl	$.LC162, %esi
	jmp	.L664
.L678:
	.loc 1 699 0
	movl	$.LC159, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	syslog
.LVL713:
	jmp	.L567
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE164:
	.section	.text.startup
.LHOTE164:
	.local	watchdog_flag
	.comm	watchdog_flag,4,4
	.local	got_usr1
	.comm	got_usr1,4,4
	.local	got_hup
	.comm	got_hup,4,4
	.comm	stats_simultaneous,4,4
	.comm	stats_bytes,8,8
	.comm	stats_connections,8,8
	.comm	stats_time,8,8
	.comm	start_time,8,8
	.globl	terminate
	.bss
	.align 4
	.type	terminate, @object
	.size	terminate, 4
terminate:
	.zero	4
	.local	hs
	.comm	hs,8,8
	.local	httpd_conn_count
	.comm	httpd_conn_count,4,4
	.local	first_free_connect
	.comm	first_free_connect,4,4
	.local	max_connects
	.comm	max_connects,4,4
	.local	num_connects
	.comm	num_connects,4,4
	.local	connects
	.comm	connects,8,8
	.local	maxthrottles
	.comm	maxthrottles,4,4
	.local	numthrottles
	.comm	numthrottles,4,4
	.local	throttles
	.comm	throttles,8,8
	.local	max_age
	.comm	max_age,4,4
	.local	p3p
	.comm	p3p,8,8
	.local	charset
	.comm	charset,8,8
	.local	user
	.comm	user,8,8
	.local	pidfile
	.comm	pidfile,8,8
	.local	hostname
	.comm	hostname,8,8
	.local	throttlefile
	.comm	throttlefile,8,8
	.local	logfile
	.comm	logfile,8,8
	.local	local_pattern
	.comm	local_pattern,8,8
	.local	no_empty_referers
	.comm	no_empty_referers,4,4
	.local	url_pattern
	.comm	url_pattern,8,8
	.local	cgi_limit
	.comm	cgi_limit,4,4
	.local	cgi_pattern
	.comm	cgi_pattern,8,8
	.local	do_global_passwd
	.comm	do_global_passwd,4,4
	.local	do_vhost
	.comm	do_vhost,4,4
	.local	no_symlink_check
	.comm	no_symlink_check,4,4
	.local	no_log
	.comm	no_log,4,4
	.local	do_chroot
	.comm	do_chroot,4,4
	.local	data_dir
	.comm	data_dir,8,8
	.local	dir
	.comm	dir,8,8
	.local	port
	.comm	port,2,2
	.local	debug
	.comm	debug,4,4
	.local	argv0
	.comm	argv0,8,8
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
	.file 22 "/usr/include/sys/syslog.h"
	.file 23 "/usr/include/stdlib.h"
	.file 24 "./fdwatch.h"
	.file 25 "./mmc.h"
	.file 26 "/usr/include/bits/errno.h"
	.file 27 "/usr/include/sys/wait.h"
	.file 28 "/usr/include/string.h"
	.file 29 "<built-in>"
	.file 30 "/usr/include/sys/stat.h"
	.file 31 "/usr/include/fcntl.h"
	.file 32 "./match.h"
	.file 33 "/usr/include/sys/socket.h"
	.file 34 "/usr/include/sys/uio.h"
	.file 35 "/usr/include/grp.h"
	.file 36 "/usr/include/bits/socket_type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x4e54
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF476
	.byte	0xc
	.long	.LASF477
	.long	.LASF478
	.long	.Ldebug_ranges0+0x70
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
	.long	.LASF479
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
	.long	.LASF480
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
	.long	0x4a1c
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
	.long	0x1103
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
	.quad	.LVL7
	.long	0x4a1c
	.uleb128 0x2b
	.quad	.LVL10
	.long	0x4a1c
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
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF295
	.byte	0x1
	.value	0x4b6
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x117b
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
	.uleb128 0x30
	.quad	.LVL32
	.long	0x4a27
	.long	0x1167
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
	.uleb128 0x2b
	.quad	.LVL33
	.long	0x4a33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF298
	.byte	0x1
	.value	0x4aa
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x11f3
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
	.uleb128 0x30
	.quad	.LVL37
	.long	0x4a27
	.long	0x11df
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
	.uleb128 0x2b
	.quad	.LVL38
	.long	0x4a33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x31
	.long	.LASF308
	.byte	0x1
	.value	0x3dd
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x1244
	.uleb128 0x30
	.quad	.LVL39
	.long	0x4a27
	.long	0x1230
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.byte	0
	.uleb128 0x2b
	.quad	.LVL40
	.long	0x4a33
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
	.long	0x12a4
	.uleb128 0x2a
	.long	.LASF245
	.byte	0x1
	.value	0x838
	.long	0xcdc
	.long	.LLST12
	.uleb128 0x2a
	.long	.LASF292
	.byte	0x1
	.value	0x838
	.long	0xd02
	.long	.LLST13
	.uleb128 0x2e
	.string	"c"
	.byte	0x1
	.value	0x83a
	.long	0xefb
	.long	.LLST14
	.uleb128 0x32
	.quad	.LVL44
	.long	0x4a3f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF300
	.byte	0x1
	.value	0x864
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.long	0x13cc
	.uleb128 0x2a
	.long	.LASF292
	.byte	0x1
	.value	0x864
	.long	0xd02
	.long	.LLST15
	.uleb128 0x33
	.string	"tv"
	.byte	0x1
	.value	0x866
	.long	0x18e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2e
	.string	"now"
	.byte	0x1
	.value	0x867
	.long	0x148
	.long	.LLST16
	.uleb128 0x2d
	.long	.LASF301
	.byte	0x1
	.value	0x868
	.long	0x5a
	.long	.LLST17
	.uleb128 0x2d
	.long	.LASF302
	.byte	0x1
	.value	0x868
	.long	0x5a
	.long	.LLST18
	.uleb128 0x30
	.quad	.LVL52
	.long	0x4a1c
	.long	0x133a
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
	.quad	.LC14
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL53
	.long	0xff6
	.long	0x1352
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL54
	.long	0x4a4a
	.long	0x136a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL55
	.long	0x4a56
	.long	0x1382
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL56
	.long	0x4a61
	.long	0x139a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL57
	.long	0x4a6c
	.long	0x13b2
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2b
	.quad	.LVL61
	.long	0x4a77
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
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
	.long	0x1420
	.uleb128 0x2a
	.long	.LASF245
	.byte	0x1
	.value	0x85b
	.long	0xcdc
	.long	.LLST19
	.uleb128 0x2a
	.long	.LASF292
	.byte	0x1
	.value	0x85b
	.long	0xd02
	.long	.LLST20
	.uleb128 0x32
	.quad	.LVL64
	.long	0x12a4
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
	.long	0x147f
	.uleb128 0x34
	.string	"sig"
	.byte	0x1
	.value	0x119
	.long	0x53
	.long	.LLST21
	.uleb128 0x2d
	.long	.LASF287
	.byte	0x1
	.value	0x11b
	.long	0x53b
	.long	.LLST22
	.uleb128 0x2f
	.quad	.LVL66
	.long	0x4a82
	.uleb128 0x2b
	.quad	.LVL68
	.long	0x12a4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
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
	.long	0x14e4
	.uleb128 0x2a
	.long	.LASF245
	.byte	0x1
	.value	0x851
	.long	0xcdc
	.long	.LLST23
	.uleb128 0x2a
	.long	.LASF292
	.byte	0x1
	.value	0x851
	.long	0xd02
	.long	.LLST24
	.uleb128 0x30
	.quad	.LVL72
	.long	0x4a8d
	.long	0x14d6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x2f
	.quad	.LVL73
	.long	0x4a98
	.byte	0
	.uleb128 0x29
	.long	.LASF306
	.byte	0x1
	.value	0x12b
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x1575
	.uleb128 0x34
	.string	"sig"
	.byte	0x1
	.value	0x12b
	.long	0x53
	.long	.LLST25
	.uleb128 0x2d
	.long	.LASF287
	.byte	0x1
	.value	0x12d
	.long	0x53b
	.long	.LLST26
	.uleb128 0x2f
	.quad	.LVL75
	.long	0x4a82
	.uleb128 0x30
	.quad	.LVL77
	.long	0x4aa3
	.long	0x1548
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xa
	.value	0x168
	.byte	0
	.uleb128 0x30
	.quad	.LVL80
	.long	0x4aaf
	.long	0x1567
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC19
	.byte	0
	.uleb128 0x2f
	.quad	.LVL81
	.long	0x4abb
	.byte	0
	.uleb128 0x26
	.long	.LASF307
	.byte	0x1
	.byte	0xb8
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x161e
	.uleb128 0x35
	.string	"sig"
	.byte	0x1
	.byte	0xb8
	.long	0x53
	.long	.LLST27
	.uleb128 0x36
	.long	.LASF287
	.byte	0x1
	.byte	0xba
	.long	0x53b
	.long	.LLST28
	.uleb128 0x37
	.string	"pid"
	.byte	0x1
	.byte	0xbb
	.long	0x13d
	.long	.LLST29
	.uleb128 0x38
	.long	.LASF188
	.byte	0x1
	.byte	0xbc
	.long	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2f
	.quad	.LVL83
	.long	0x4a82
	.uleb128 0x30
	.quad	.LVL85
	.long	0x4ac7
	.long	0x15fd
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
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2b
	.quad	.LVL89
	.long	0x4a1c
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
	.quad	.LC21
	.byte	0
	.byte	0
	.uleb128 0x39
	.long	.LASF309
	.byte	0x1
	.value	0x4c3
	.long	0x104
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x16d0
	.uleb128 0x2a
	.long	.LASF310
	.byte	0x1
	.value	0x4c3
	.long	0x104
	.long	.LLST30
	.uleb128 0x2d
	.long	.LASF311
	.byte	0x1
	.value	0x4c5
	.long	0x104
	.long	.LLST31
	.uleb128 0x30
	.quad	.LVL92
	.long	0x4ad2
	.long	0x1679
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x30
	.quad	.LVL93
	.long	0x4a1c
	.long	0x169d
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
	.quad	.LC23
	.byte	0
	.uleb128 0x30
	.quad	.LVL94
	.long	0x4a27
	.long	0x16bc
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC24
	.byte	0
	.uleb128 0x2b
	.quad	.LVL95
	.long	0x4a33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF312
	.byte	0x1
	.value	0x3e7
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x210e
	.uleb128 0x2a
	.long	.LASF313
	.byte	0x1
	.value	0x3e7
	.long	0x104
	.long	.LLST32
	.uleb128 0x2e
	.string	"fp"
	.byte	0x1
	.value	0x3e9
	.long	0x97a
	.long	.LLST33
	.uleb128 0x3a
	.long	.LASF314
	.byte	0x1
	.value	0x3ea
	.long	0x210e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x2e
	.string	"cp"
	.byte	0x1
	.value	0x3eb
	.long	0x104
	.long	.LLST34
	.uleb128 0x2e
	.string	"cp2"
	.byte	0x1
	.value	0x3ec
	.long	0x104
	.long	.LLST35
	.uleb128 0x2d
	.long	.LASF296
	.byte	0x1
	.value	0x3ed
	.long	0x104
	.long	.LLST36
	.uleb128 0x2d
	.long	.LASF297
	.byte	0x1
	.value	0x3ee
	.long	0x104
	.long	.LLST37
	.uleb128 0x30
	.quad	.LVL97
	.long	0x4add
	.long	0x1781
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
	.quad	.LC26
	.byte	0
	.uleb128 0x30
	.quad	.LVL100
	.long	0x4ae9
	.long	0x17a6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.value	0x3e8
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL101
	.long	0x4af5
	.long	0x17c4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x23
	.byte	0
	.uleb128 0x30
	.quad	.LVL103
	.long	0x4b00
	.long	0x17e9
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC27
	.byte	0
	.uleb128 0x30
	.quad	.LVL106
	.long	0x4af5
	.long	0x1807
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x3d
	.byte	0
	.uleb128 0x30
	.quad	.LVL109
	.long	0x4b0c
	.long	0x182c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC28
	.byte	0
	.uleb128 0x30
	.quad	.LVL110
	.long	0x4b0c
	.long	0x1851
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC29
	.byte	0
	.uleb128 0x30
	.quad	.LVL111
	.long	0x4b0c
	.long	0x1876
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC30
	.byte	0
	.uleb128 0x30
	.quad	.LVL112
	.long	0x4b0c
	.long	0x189b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC31
	.byte	0
	.uleb128 0x30
	.quad	.LVL113
	.long	0x4b0c
	.long	0x18c0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC32
	.byte	0
	.uleb128 0x30
	.quad	.LVL114
	.long	0x4b0c
	.long	0x18e5
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC33
	.byte	0
	.uleb128 0x30
	.quad	.LVL115
	.long	0x4b0c
	.long	0x190a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC34
	.byte	0
	.uleb128 0x30
	.quad	.LVL116
	.long	0x4b0c
	.long	0x192f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC35
	.byte	0
	.uleb128 0x30
	.quad	.LVL117
	.long	0x4b0c
	.long	0x1954
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC36
	.byte	0
	.uleb128 0x30
	.quad	.LVL118
	.long	0x4b0c
	.long	0x1979
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC37
	.byte	0
	.uleb128 0x30
	.quad	.LVL119
	.long	0x4b0c
	.long	0x199e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC38
	.byte	0
	.uleb128 0x30
	.quad	.LVL120
	.long	0x4b0c
	.long	0x19c3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC39
	.byte	0
	.uleb128 0x30
	.quad	.LVL121
	.long	0x4b0c
	.long	0x19e8
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC40
	.byte	0
	.uleb128 0x30
	.quad	.LVL122
	.long	0x4b0c
	.long	0x1a0d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC41
	.byte	0
	.uleb128 0x30
	.quad	.LVL123
	.long	0x4b0c
	.long	0x1a32
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC42
	.byte	0
	.uleb128 0x30
	.quad	.LVL124
	.long	0x4b0c
	.long	0x1a57
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC43
	.byte	0
	.uleb128 0x30
	.quad	.LVL125
	.long	0x4b0c
	.long	0x1a7c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC44
	.byte	0
	.uleb128 0x30
	.quad	.LVL126
	.long	0x4b0c
	.long	0x1aa1
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC45
	.byte	0
	.uleb128 0x30
	.quad	.LVL127
	.long	0x4b0c
	.long	0x1ac6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC46
	.byte	0
	.uleb128 0x30
	.quad	.LVL128
	.long	0x4b0c
	.long	0x1aeb
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC47
	.byte	0
	.uleb128 0x30
	.quad	.LVL129
	.long	0x4b0c
	.long	0x1b10
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC48
	.byte	0
	.uleb128 0x30
	.quad	.LVL130
	.long	0x4b0c
	.long	0x1b35
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC49
	.byte	0
	.uleb128 0x30
	.quad	.LVL131
	.long	0x4b0c
	.long	0x1b5a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC50
	.byte	0
	.uleb128 0x30
	.quad	.LVL132
	.long	0x4b0c
	.long	0x1b7f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC51
	.byte	0
	.uleb128 0x30
	.quad	.LVL133
	.long	0x4b0c
	.long	0x1ba4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC52
	.byte	0
	.uleb128 0x30
	.quad	.LVL134
	.long	0x4b0c
	.long	0x1bc9
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC53
	.byte	0
	.uleb128 0x30
	.quad	.LVL135
	.long	0x4b0c
	.long	0x1bee
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC54
	.byte	0
	.uleb128 0x30
	.quad	.LVL136
	.long	0x117b
	.long	0x1c0c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL137
	.long	0x4b18
	.long	0x1c24
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL139
	.long	0x4b00
	.long	0x1c49
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
	.quad	.LC27
	.byte	0
	.uleb128 0x30
	.quad	.LVL142
	.long	0x4b23
	.long	0x1c6e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC27
	.byte	0
	.uleb128 0x30
	.quad	.LVL146
	.long	0x1103
	.long	0x1c8c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL147
	.long	0x117b
	.long	0x1caa
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL148
	.long	0x4b18
	.long	0x1cc2
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL151
	.long	0x117b
	.long	0x1ce0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL152
	.long	0x161e
	.long	0x1cf8
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL153
	.long	0x1103
	.long	0x1d16
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL154
	.long	0x1103
	.long	0x1d34
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL155
	.long	0x1103
	.long	0x1d52
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL156
	.long	0x117b
	.long	0x1d70
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL157
	.long	0x161e
	.long	0x1d88
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL158
	.long	0x1103
	.long	0x1da6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL159
	.long	0x117b
	.long	0x1dc4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL160
	.long	0x161e
	.long	0x1ddc
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL161
	.long	0x117b
	.long	0x1dfa
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL162
	.long	0x4b18
	.long	0x1e12
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL163
	.long	0x117b
	.long	0x1e30
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL164
	.long	0x161e
	.long	0x1e48
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL166
	.long	0x4b2f
	.long	0x1e60
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL168
	.long	0x1103
	.long	0x1e7e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL169
	.long	0x117b
	.long	0x1e9c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL170
	.long	0x161e
	.long	0x1eb4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL171
	.long	0x117b
	.long	0x1ed2
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL172
	.long	0x161e
	.long	0x1eea
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL173
	.long	0x4a27
	.long	0x1f0f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC55
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL174
	.long	0x4a33
	.long	0x1f26
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL175
	.long	0x117b
	.long	0x1f44
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL176
	.long	0x161e
	.long	0x1f5c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL177
	.long	0x117b
	.long	0x1f7a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL178
	.long	0x161e
	.long	0x1f92
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL179
	.long	0x117b
	.long	0x1fb0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL180
	.long	0x161e
	.long	0x1fc8
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL182
	.long	0x4b3a
	.long	0x1fe0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL183
	.long	0x4a33
	.long	0x1ff7
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL184
	.long	0x117b
	.long	0x2015
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL185
	.long	0x161e
	.long	0x202d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL186
	.long	0x117b
	.long	0x204b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL187
	.long	0x161e
	.long	0x2063
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL188
	.long	0x117b
	.long	0x2081
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL189
	.long	0x161e
	.long	0x2099
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL190
	.long	0x1103
	.long	0x20b7
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL191
	.long	0x1103
	.long	0x20d5
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL192
	.long	0x1103
	.long	0x20f3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x2b
	.quad	.LVL193
	.long	0x1103
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x10a
	.long	0x211e
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
	.long	0x2427
	.uleb128 0x2a
	.long	.LASF316
	.byte	0x1
	.value	0x344
	.long	0x53
	.long	.LLST38
	.uleb128 0x2a
	.long	.LASF317
	.byte	0x1
	.value	0x344
	.long	0x4cb
	.long	.LLST39
	.uleb128 0x2d
	.long	.LASF318
	.byte	0x1
	.value	0x346
	.long	0x53
	.long	.LLST40
	.uleb128 0x2f
	.quad	.LVL202
	.long	0x4b18
	.uleb128 0x2f
	.quad	.LVL207
	.long	0x16d0
	.uleb128 0x30
	.quad	.LVL211
	.long	0x4b46
	.long	0x21ab
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
	.uleb128 0x30
	.quad	.LVL214
	.long	0x4b46
	.long	0x21d0
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
	.uleb128 0x30
	.quad	.LVL217
	.long	0x4b46
	.long	0x21f5
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
	.uleb128 0x30
	.quad	.LVL218
	.long	0x4b46
	.long	0x221a
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
	.uleb128 0x30
	.quad	.LVL223
	.long	0x4b46
	.long	0x223f
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
	.uleb128 0x30
	.quad	.LVL224
	.long	0x4b46
	.long	0x2264
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
	.uleb128 0x30
	.quad	.LVL225
	.long	0x4b46
	.long	0x2289
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
	.uleb128 0x30
	.quad	.LVL228
	.long	0x4b46
	.long	0x22ae
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
	.uleb128 0x30
	.quad	.LVL229
	.long	0x4b46
	.long	0x22d3
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
	.uleb128 0x30
	.quad	.LVL232
	.long	0x4b46
	.long	0x22f8
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
	.uleb128 0x30
	.quad	.LVL233
	.long	0x4b51
	.long	0x2317
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC61
	.byte	0
	.uleb128 0x30
	.quad	.LVL234
	.long	0x4a33
	.long	0x232e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x30
	.quad	.LVL235
	.long	0x4b46
	.long	0x2353
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
	.uleb128 0x30
	.quad	.LVL238
	.long	0x4b46
	.long	0x2378
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
	.uleb128 0x30
	.quad	.LVL241
	.long	0x4b46
	.long	0x239d
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
	.uleb128 0x30
	.quad	.LVL244
	.long	0x4b46
	.long	0x23c2
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
	.uleb128 0x30
	.quad	.LVL245
	.long	0x4b46
	.long	0x23e7
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
	.quad	.LVL247
	.long	0x4b18
	.uleb128 0x30
	.quad	.LVL249
	.long	0x4b46
	.long	0x2419
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
	.quad	.LVL251
	.long	0x11f3
	.byte	0
	.uleb128 0x29
	.long	.LASF319
	.byte	0x1
	.value	0x559
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x277d
	.uleb128 0x2a
	.long	.LASF320
	.byte	0x1
	.value	0x559
	.long	0x104
	.long	.LLST41
	.uleb128 0x2e
	.string	"fp"
	.byte	0x1
	.value	0x55b
	.long	0x97a
	.long	.LLST42
	.uleb128 0x33
	.string	"buf"
	.byte	0x1
	.value	0x55c
	.long	0x277d
	.uleb128 0x4
	.byte	0x91
	.sleb128 -10064
	.uleb128 0x2e
	.string	"cp"
	.byte	0x1
	.value	0x55d
	.long	0x104
	.long	.LLST43
	.uleb128 0x2e
	.string	"len"
	.byte	0x1
	.value	0x55e
	.long	0x53
	.long	.LLST44
	.uleb128 0x3a
	.long	.LASF253
	.byte	0x1
	.value	0x55f
	.long	0x277d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -5056
	.uleb128 0x3a
	.long	.LASF254
	.byte	0x1
	.value	0x560
	.long	0x5a
	.uleb128 0x4
	.byte	0x91
	.sleb128 -10096
	.uleb128 0x3a
	.long	.LASF255
	.byte	0x1
	.value	0x560
	.long	0x5a
	.uleb128 0x4
	.byte	0x91
	.sleb128 -10088
	.uleb128 0x33
	.string	"tv"
	.byte	0x1
	.value	0x561
	.long	0x18e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -10080
	.uleb128 0x30
	.quad	.LVL253
	.long	0x4add
	.long	0x24fb
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
	.quad	.LC26
	.byte	0
	.uleb128 0x30
	.quad	.LVL255
	.long	0x4a77
	.long	0x251a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -10080
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x30
	.quad	.LVL256
	.long	0x4ae9
	.long	0x253f
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
	.value	0x1388
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL257
	.long	0x4af5
	.long	0x255d
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
	.byte	0x23
	.byte	0
	.uleb128 0x30
	.quad	.LVL262
	.long	0x4b60
	.long	0x2597
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
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -5056
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x4
	.byte	0x91
	.sleb128 -10088
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL263
	.long	0x4b60
	.long	0x25c9
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
	.quad	.LC87
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -5056
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL265
	.long	0x4b70
	.uleb128 0x30
	.quad	.LVL266
	.long	0x4b7b
	.long	0x25fc
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -5056
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC90
	.byte	0
	.uleb128 0x30
	.quad	.LVL268
	.long	0x4b87
	.long	0x2615
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xa
	.value	0x12c0
	.byte	0
	.uleb128 0x30
	.quad	.LVL269
	.long	0x161e
	.long	0x262e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -5056
	.byte	0
	.uleb128 0x30
	.quad	.LVL275
	.long	0x4a1c
	.long	0x265e
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
	.quad	.LC88
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL276
	.long	0x4a27
	.long	0x2689
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC89
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL277
	.long	0x4b93
	.uleb128 0x30
	.quad	.LVL278
	.long	0x4b2f
	.long	0x26ae
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL282
	.long	0x4b70
	.long	0x26cd
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -5056
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL284
	.long	0x4a1c
	.long	0x26f7
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
	.quad	.LC85
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL285
	.long	0x4b3a
	.long	0x270f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL286
	.long	0x4a33
	.long	0x2726
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL287
	.long	0x4a1c
	.long	0x274a
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
	.quad	.LC91
	.byte	0
	.uleb128 0x30
	.quad	.LVL288
	.long	0x4a27
	.long	0x2769
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC92
	.byte	0
	.uleb128 0x2b
	.quad	.LVL289
	.long	0x4a33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x10a
	.long	0x278e
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
	.long	0x2890
	.uleb128 0x2d
	.long	.LASF172
	.byte	0x1
	.value	0x148
	.long	0x97a
	.long	.LLST45
	.uleb128 0x2d
	.long	.LASF322
	.byte	0x1
	.value	0x149
	.long	0x53
	.long	.LLST46
	.uleb128 0x30
	.quad	.LVL290
	.long	0x4a1c
	.long	0x27f0
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
	.quad	.LC95
	.byte	0
	.uleb128 0x30
	.quad	.LVL291
	.long	0x4add
	.long	0x280f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC96
	.byte	0
	.uleb128 0x30
	.quad	.LVL293
	.long	0x4b9f
	.long	0x282e
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
	.uleb128 0x30
	.quad	.LVL294
	.long	0x4bab
	.long	0x2846
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL295
	.long	0x4bb7
	.long	0x2862
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
	.quad	.LVL297
	.long	0x4bc2
	.uleb128 0x32
	.quad	.LVL300
	.long	0x4a1c
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
	.quad	.LC97
	.byte	0
	.byte	0
	.uleb128 0x39
	.long	.LASF323
	.byte	0x1
	.value	0x5e0
	.long	0x53
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x2a12
	.uleb128 0x34
	.string	"tvP"
	.byte	0x1
	.value	0x5e0
	.long	0xd02
	.long	.LLST47
	.uleb128 0x2a
	.long	.LASF324
	.byte	0x1
	.value	0x5e0
	.long	0x53
	.long	.LLST48
	.uleb128 0x2e
	.string	"c"
	.byte	0x1
	.value	0x5e2
	.long	0xefb
	.long	.LLST49
	.uleb128 0x2d
	.long	.LASF245
	.byte	0x1
	.value	0x5e3
	.long	0xcdc
	.long	.LLST50
	.uleb128 0x30
	.quad	.LVL304
	.long	0x4bcd
	.long	0x2908
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL310
	.long	0x4bd8
	.uleb128 0x30
	.quad	.LVL311
	.long	0x4a3f
	.long	0x2932
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
	.uleb128 0x30
	.quad	.LVL313
	.long	0x4be4
	.long	0x294a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL318
	.long	0x4b87
	.long	0x2963
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xa
	.value	0x2d0
	.byte	0
	.uleb128 0x30
	.quad	.LVL320
	.long	0x4a1c
	.long	0x2987
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
	.quad	.LC99
	.byte	0
	.uleb128 0x30
	.quad	.LVL321
	.long	0x4be4
	.long	0x299f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL322
	.long	0x4a1c
	.long	0x29c3
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
	.quad	.LC100
	.byte	0
	.uleb128 0x30
	.quad	.LVL323
	.long	0x4a33
	.long	0x29da
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL324
	.long	0x4a1c
	.long	0x29fe
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
	.uleb128 0x2b
	.quad	.LVL325
	.long	0x4a33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x39
	.long	.LASF325
	.byte	0x1
	.value	0x75a
	.long	0x53
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x2a8e
	.uleb128 0x34
	.string	"c"
	.byte	0x1
	.value	0x75a
	.long	0xefb
	.long	.LLST51
	.uleb128 0x2d
	.long	.LASF293
	.byte	0x1
	.value	0x75c
	.long	0x53
	.long	.LLST52
	.uleb128 0x2e
	.string	"l"
	.byte	0x1
	.value	0x75d
	.long	0x5a
	.long	.LLST53
	.uleb128 0x2f
	.quad	.LVL332
	.long	0x4bef
	.uleb128 0x2b
	.quad	.LVL341
	.long	0x4a1c
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
	.quad	.LC103
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF326
	.byte	0x1
	.value	0x5ba
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x2bbb
	.uleb128 0x2d
	.long	.LASF294
	.byte	0x1
	.value	0x5bc
	.long	0x53
	.long	.LLST54
	.uleb128 0x33
	.string	"tv"
	.byte	0x1
	.value	0x5bd
	.long	0x18e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x3d
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x2b1e
	.uleb128 0x2e
	.string	"ths"
	.byte	0x1
	.value	0x5cf
	.long	0xca7
	.long	.LLST55
	.uleb128 0x2f
	.quad	.LVL355
	.long	0x4bfa
	.uleb128 0x2f
	.quad	.LVL356
	.long	0x4bfa
	.uleb128 0x2b
	.quad	.LVL357
	.long	0x4c05
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x30
	.quad	.LVL345
	.long	0x4a77
	.long	0x2b3c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL346
	.long	0x12a4
	.long	0x2b54
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL348
	.long	0x4c10
	.uleb128 0x2f
	.quad	.LVL349
	.long	0x4c1b
	.uleb128 0x30
	.quad	.LVL352
	.long	0x4c27
	.long	0x2b86
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL358
	.long	0x4c32
	.uleb128 0x2f
	.quad	.LVL359
	.long	0x4c3d
	.uleb128 0x2f
	.quad	.LVL360
	.long	0x4c1b
	.uleb128 0x2f
	.quad	.LVL361
	.long	0x4c1b
	.byte	0
	.uleb128 0x29
	.long	.LASF327
	.byte	0x1
	.value	0x100
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x2c3b
	.uleb128 0x34
	.string	"sig"
	.byte	0x1
	.value	0x100
	.long	0x53
	.long	.LLST56
	.uleb128 0x2f
	.quad	.LVL363
	.long	0x2a8e
	.uleb128 0x30
	.quad	.LVL364
	.long	0x4a1c
	.long	0x2c1a
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
	.quad	.LC106
	.byte	0
	.uleb128 0x2f
	.quad	.LVL365
	.long	0x4c48
	.uleb128 0x2b
	.quad	.LVL366
	.long	0x4a33
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
	.long	0x2cbf
	.uleb128 0x35
	.string	"sig"
	.byte	0x1
	.byte	0xab
	.long	0x53
	.long	.LLST57
	.uleb128 0x2f
	.quad	.LVL368
	.long	0x2a8e
	.uleb128 0x30
	.quad	.LVL369
	.long	0x4a1c
	.long	0x2c9e
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
	.quad	.LC108
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL370
	.long	0x4c48
	.uleb128 0x2b
	.quad	.LVL371
	.long	0x4a33
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
	.long	0x2cf7
	.uleb128 0x40
	.long	0xed8
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x40
	.long	0xee2
	.uleb128 0x6
	.byte	0xfa
	.long	0xee2
	.byte	0x9f
	.uleb128 0x41
	.long	0xeee
	.long	.LLST58
	.byte	0
	.uleb128 0x29
	.long	.LASF329
	.byte	0x1
	.value	0x7ff
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x2d7c
	.uleb128 0x34
	.string	"c"
	.byte	0x1
	.value	0x7ff
	.long	0xefb
	.long	.LLST59
	.uleb128 0x34
	.string	"tvP"
	.byte	0x1
	.value	0x7ff
	.long	0xd02
	.long	.LLST60
	.uleb128 0x2f
	.quad	.LVL376
	.long	0x4bfa
	.uleb128 0x2f
	.quad	.LVL378
	.long	0x4c27
	.uleb128 0x30
	.quad	.LVL379
	.long	0x2cbf
	.long	0x2d6e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x42
	.long	0xee2
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x2f
	.quad	.LVL380
	.long	0x4c53
	.byte	0
	.uleb128 0x29
	.long	.LASF330
	.byte	0x1
	.value	0x7cb
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x2ed2
	.uleb128 0x34
	.string	"c"
	.byte	0x1
	.value	0x7cb
	.long	0xefb
	.long	.LLST61
	.uleb128 0x34
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
	.uleb128 0x2f
	.quad	.LVL384
	.long	0x4c53
	.uleb128 0x2f
	.quad	.LVL385
	.long	0x4bfa
	.uleb128 0x30
	.quad	.LVL386
	.long	0x4c5e
	.long	0x2df5
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL387
	.long	0x4a3f
	.long	0x2e12
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
	.uleb128 0x30
	.quad	.LVL388
	.long	0x4a1c
	.long	0x2e36
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
	.quad	.LC112
	.byte	0
	.uleb128 0x30
	.quad	.LVL389
	.long	0x4c6a
	.long	0x2e6d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
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
	.uleb128 0x2f
	.quad	.LVL393
	.long	0x4c53
	.uleb128 0x43
	.quad	.LVL396
	.long	0x2cf7
	.long	0x2e9a
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
	.quad	.LVL397
	.long	0x4a1c
	.long	0x2ebe
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
	.quad	.LC113
	.byte	0
	.uleb128 0x2b
	.quad	.LVL398
	.long	0x4a33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
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
	.long	0x2f38
	.uleb128 0x34
	.string	"c"
	.byte	0x1
	.value	0x7c0
	.long	0xefb
	.long	.LLST63
	.uleb128 0x34
	.string	"tvP"
	.byte	0x1
	.value	0x7c0
	.long	0xd02
	.long	.LLST64
	.uleb128 0x2f
	.quad	.LVL401
	.long	0x4c75
	.uleb128 0x32
	.quad	.LVL404
	.long	0x2d7c
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
	.byte	0
	.uleb128 0x29
	.long	.LASF332
	.byte	0x1
	.value	0x631
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x3105
	.uleb128 0x34
	.string	"c"
	.byte	0x1
	.value	0x631
	.long	0xefb
	.long	.LLST65
	.uleb128 0x34
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
	.uleb128 0x44
	.long	.Ldebug_ranges0+0
	.long	0x2fd8
	.uleb128 0x2d
	.long	.LASF281
	.byte	0x1
	.value	0x691
	.long	0x53
	.long	.LLST70
	.uleb128 0x32
	.quad	.LVL413
	.long	0x2ed2
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
	.byte	0
	.uleb128 0x30
	.quad	.LVL409
	.long	0x4c80
	.long	0x3011
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
	.quad	.LC59
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x9
	.byte	0x3
	.quad	.LC59
	.byte	0
	.uleb128 0x30
	.quad	.LVL415
	.long	0x4c8b
	.long	0x3031
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x73
	.sleb128 144
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x73
	.sleb128 152
	.byte	0
	.uleb128 0x2f
	.quad	.LVL416
	.long	0x4c97
	.uleb128 0x30
	.quad	.LVL418
	.long	0x4ca3
	.long	0x3056
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL419
	.long	0x4cae
	.long	0x306e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL420
	.long	0x2a12
	.long	0x3086
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL421
	.long	0x4cb9
	.long	0x30a4
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
	.uleb128 0x2f
	.quad	.LVL423
	.long	0x4bfa
	.uleb128 0x43
	.quad	.LVL427
	.long	0x4a3f
	.long	0x30cf
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
	.quad	.LVL428
	.long	0x4a82
	.uleb128 0x2b
	.quad	.LVL433
	.long	0x4c80
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
	.quad	.LC59
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF333
	.byte	0x1
	.value	0x813
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x322f
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
	.uleb128 0x2f
	.quad	.LVL443
	.long	0x4cc4
	.uleb128 0x30
	.quad	.LVL444
	.long	0x4a1c
	.long	0x3192
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
	.quad	.LC117
	.byte	0
	.uleb128 0x30
	.quad	.LVL445
	.long	0x4c80
	.long	0x31c5
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
	.quad	.LC59
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x9
	.byte	0x3
	.quad	.LC59
	.byte	0
	.uleb128 0x30
	.quad	.LVL446
	.long	0x2ed2
	.long	0x31e3
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
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL449
	.long	0x4cc4
	.uleb128 0x30
	.quad	.LVL450
	.long	0x4a1c
	.long	0x3214
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
	.quad	.LC118
	.byte	0
	.uleb128 0x2b
	.quad	.LVL451
	.long	0x2d7c
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
	.byte	0x7d
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF334
	.byte	0x1
	.value	0x6ab
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x3491
	.uleb128 0x34
	.string	"c"
	.byte	0x1
	.value	0x6ab
	.long	0xefb
	.long	.LLST75
	.uleb128 0x34
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
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x3313
	.uleb128 0x33
	.string	"iv"
	.byte	0x1
	.value	0x6c6
	.long	0x3491
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2b
	.quad	.LVL477
	.long	0x4cd0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.byte	0
	.uleb128 0x3d
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.long	0x334d
	.uleb128 0x2d
	.long	.LASF338
	.byte	0x1
	.value	0x70b
	.long	0x53
	.long	.LLST83
	.uleb128 0x2b
	.quad	.LVL494
	.long	0x4cdb
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL462
	.long	0x4ce6
	.uleb128 0x2f
	.quad	.LVL470
	.long	0x4bfa
	.uleb128 0x30
	.quad	.LVL473
	.long	0x4a1c
	.long	0x338b
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
	.quad	.LC120
	.byte	0
	.uleb128 0x2f
	.quad	.LVL478
	.long	0x4a82
	.uleb128 0x30
	.quad	.LVL479
	.long	0x4a1c
	.long	0x33bc
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
	.quad	.LC122
	.byte	0
	.uleb128 0x30
	.quad	.LVL480
	.long	0x2d7c
	.long	0x33da
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
	.quad	.LVL485
	.long	0x4bfa
	.uleb128 0x30
	.quad	.LVL486
	.long	0x4a1c
	.long	0x340b
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
	.quad	.LC120
	.byte	0
	.uleb128 0x30
	.quad	.LVL488
	.long	0x4c6a
	.long	0x343b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
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
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x30
	.quad	.LVL497
	.long	0x2ed2
	.long	0x3459
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
	.quad	.LVL502
	.long	0x4a1c
	.long	0x347d
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
	.quad	.LC121
	.byte	0
	.uleb128 0x2b
	.quad	.LVL503
	.long	0x4a33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x2b9
	.long	0x34a1
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
	.long	0x3503
	.uleb128 0x2a
	.long	.LASF245
	.byte	0x1
	.value	0x846
	.long	0xcdc
	.long	.LLST84
	.uleb128 0x2a
	.long	.LASF292
	.byte	0x1
	.value	0x846
	.long	0xd02
	.long	.LLST85
	.uleb128 0x2e
	.string	"c"
	.byte	0x1
	.value	0x848
	.long	0xefb
	.long	.LLST84
	.uleb128 0x32
	.quad	.LVL505
	.long	0x2cf7
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF340
	.byte	0x1
	.value	0x749
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x35a4
	.uleb128 0x34
	.string	"c"
	.byte	0x1
	.value	0x749
	.long	0xefb
	.long	.LLST87
	.uleb128 0x34
	.string	"tvP"
	.byte	0x1
	.value	0x749
	.long	0xd02
	.long	.LLST88
	.uleb128 0x33
	.string	"buf"
	.byte	0x1
	.value	0x74b
	.long	0x35a4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4128
	.uleb128 0x2e
	.string	"r"
	.byte	0x1
	.value	0x74c
	.long	0x53
	.long	.LLST89
	.uleb128 0x30
	.quad	.LVL509
	.long	0x4c97
	.long	0x357c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa
	.value	0x1000
	.byte	0
	.uleb128 0x2f
	.quad	.LVL514
	.long	0x4a82
	.uleb128 0x2b
	.quad	.LVL515
	.long	0x2cf7
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
	.byte	0
	.uleb128 0xc
	.long	0x10a
	.long	0x35b5
	.uleb128 0x3b
	.long	0xc4
	.value	0xfff
	.byte	0
	.uleb128 0x3f
	.long	0xf01
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x3795
	.uleb128 0x45
	.long	0xf0e
	.long	.LLST90
	.uleb128 0x45
	.long	0xf26
	.long	.LLST91
	.uleb128 0x45
	.long	0xf32
	.long	.LLST92
	.uleb128 0x45
	.long	0xf4a
	.long	.LLST93
	.uleb128 0x46
	.long	0xf56
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x46
	.long	0xf62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x41
	.long	0xf6e
	.long	.LLST94
	.uleb128 0x46
	.long	0xf7a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x41
	.long	0xf85
	.long	.LLST95
	.uleb128 0x41
	.long	0xf91
	.long	.LLST96
	.uleb128 0x41
	.long	0xf9d
	.long	.LLST97
	.uleb128 0x47
	.long	0xf3e
	.byte	0x80
	.uleb128 0x47
	.long	0xf1a
	.byte	0x80
	.uleb128 0x30
	.quad	.LVL523
	.long	0x4cf2
	.long	0x366a
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
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
	.quad	.LC126
	.byte	0
	.uleb128 0x30
	.quad	.LVL524
	.long	0x4cfe
	.long	0x3690
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
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
	.byte	0x91
	.sleb128 -120
	.byte	0
	.uleb128 0x30
	.quad	.LVL535
	.long	0x4cdb
	.long	0x36a8
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL537
	.long	0x4cdb
	.long	0x36c0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL538
	.long	0x4d0a
	.uleb128 0x30
	.quad	.LVL545
	.long	0x4a1c
	.long	0x36f7
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
	.quad	.LC129
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x80
	.byte	0
	.uleb128 0x30
	.quad	.LVL546
	.long	0x4a33
	.long	0x370e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL548
	.long	0x4d16
	.long	0x3726
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL549
	.long	0x4a1c
	.long	0x374a
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
	.quad	.LC127
	.byte	0
	.uleb128 0x30
	.quad	.LVL550
	.long	0x4d16
	.long	0x3762
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL551
	.long	0x4a27
	.long	0x3781
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC128
	.byte	0
	.uleb128 0x2b
	.quad	.LVL552
	.long	0x4a33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x48
	.long	.LASF481
	.byte	0x1
	.value	0x160
	.long	0x53
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x4632
	.uleb128 0x2a
	.long	.LASF316
	.byte	0x1
	.value	0x160
	.long	0x53
	.long	.LLST98
	.uleb128 0x2a
	.long	.LASF317
	.byte	0x1
	.value	0x160
	.long	0x4cb
	.long	.LLST99
	.uleb128 0x2e
	.string	"cp"
	.byte	0x1
	.value	0x162
	.long	0x104
	.long	.LLST100
	.uleb128 0x2e
	.string	"pwd"
	.byte	0x1
	.value	0x163
	.long	0x4632
	.long	.LLST101
	.uleb128 0x2e
	.string	"uid"
	.byte	0x1
	.value	0x164
	.long	0x127
	.long	.LLST102
	.uleb128 0x2e
	.string	"gid"
	.byte	0x1
	.value	0x165
	.long	0x11c
	.long	.LLST103
	.uleb128 0x33
	.string	"cwd"
	.byte	0x1
	.value	0x166
	.long	0x4638
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4176
	.uleb128 0x2d
	.long	.LASF172
	.byte	0x1
	.value	0x167
	.long	0x97a
	.long	.LLST104
	.uleb128 0x2d
	.long	.LASF322
	.byte	0x1
	.value	0x168
	.long	0x53
	.long	.LLST105
	.uleb128 0x2d
	.long	.LASF341
	.byte	0x1
	.value	0x169
	.long	0x53
	.long	.LLST106
	.uleb128 0x2d
	.long	.LASF294
	.byte	0x1
	.value	0x16a
	.long	0x53
	.long	.LLST107
	.uleb128 0x2e
	.string	"c"
	.byte	0x1
	.value	0x16b
	.long	0xefb
	.long	.LLST108
	.uleb128 0x2e
	.string	"hc"
	.byte	0x1
	.value	0x16c
	.long	0xea4
	.long	.LLST109
	.uleb128 0x33
	.string	"sa4"
	.byte	0x1
	.value	0x16d
	.long	0x876
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4432
	.uleb128 0x33
	.string	"sa6"
	.byte	0x1
	.value	0x16e
	.long	0x876
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4304
	.uleb128 0x3a
	.long	.LASF342
	.byte	0x1
	.value	0x16f
	.long	0x53
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4456
	.uleb128 0x3a
	.long	.LASF343
	.byte	0x1
	.value	0x16f
	.long	0x53
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4452
	.uleb128 0x33
	.string	"tv"
	.byte	0x1
	.value	0x170
	.long	0x18e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4448
	.uleb128 0x49
	.long	.LASF458
	.byte	0x1
	.value	0x262
	.long	0x53
	.long	0x38e4
	.uleb128 0x4a
	.byte	0
	.uleb128 0x44
	.long	.Ldebug_ranges0+0x40
	.long	0x399e
	.uleb128 0x2d
	.long	.LASF344
	.byte	0x1
	.value	0x218
	.long	0x97a
	.long	.LLST110
	.uleb128 0x30
	.quad	.LVL576
	.long	0x4add
	.long	0x391c
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC143
	.byte	0
	.uleb128 0x2f
	.quad	.LVL578
	.long	0x4d22
	.uleb128 0x30
	.quad	.LVL579
	.long	0x4a27
	.long	0x394e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC144
	.byte	0
	.uleb128 0x30
	.quad	.LVL580
	.long	0x4b2f
	.long	0x3966
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL680
	.long	0x4a1c
	.long	0x398a
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
	.quad	.LC85
	.byte	0
	.uleb128 0x2b
	.quad	.LVL681
	.long	0x4a33
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x30
	.quad	.LVL556
	.long	0x4d2e
	.long	0x39bc
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
	.byte	0x2f
	.byte	0
	.uleb128 0x30
	.quad	.LVL558
	.long	0x4d3a
	.long	0x39de
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
	.byte	0x39
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x48
	.byte	0
	.uleb128 0x30
	.quad	.LVL561
	.long	0x211e
	.long	0x39fe
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
	.quad	.LVL562
	.long	0x4d45
	.uleb128 0x30
	.quad	.LVL563
	.long	0x35b5
	.long	0x3a37
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
	.byte	0x91
	.sleb128 -4456
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4452
	.byte	0
	.uleb128 0x2f
	.quad	.LVL564
	.long	0x2427
	.uleb128 0x2f
	.quad	.LVL565
	.long	0x4d51
	.uleb128 0x30
	.quad	.LVL568
	.long	0x4b46
	.long	0x3a76
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
	.quad	.LVL570
	.long	0x4aaf
	.uleb128 0x30
	.quad	.LVL571
	.long	0x4d5d
	.long	0x3aa2
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
	.value	0x1000
	.byte	0
	.uleb128 0x2f
	.quad	.LVL572
	.long	0x4b2f
	.uleb128 0x2f
	.quad	.LVL573
	.long	0x4b2f
	.uleb128 0x2f
	.quad	.LVL574
	.long	0x4b2f
	.uleb128 0x30
	.quad	.LVL575
	.long	0x4d69
	.long	0x3ae5
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
	.uleb128 0x2f
	.quad	.LVL581
	.long	0x4d75
	.uleb128 0x2f
	.quad	.LVL582
	.long	0x4aaf
	.uleb128 0x30
	.quad	.LVL583
	.long	0x4d80
	.long	0x3b23
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
	.uleb128 0x30
	.quad	.LVL584
	.long	0x4d80
	.long	0x3b47
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
	.uleb128 0x30
	.quad	.LVL585
	.long	0x4d80
	.long	0x3b6b
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
	.uleb128 0x30
	.quad	.LVL586
	.long	0x4d80
	.long	0x3b87
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
	.uleb128 0x30
	.quad	.LVL587
	.long	0x4d80
	.long	0x3bab
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
	.uleb128 0x30
	.quad	.LVL588
	.long	0x4d80
	.long	0x3bcf
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
	.uleb128 0x30
	.quad	.LVL589
	.long	0x4d80
	.long	0x3bf3
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
	.uleb128 0x30
	.quad	.LVL590
	.long	0x4d80
	.long	0x3c17
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
	.uleb128 0x30
	.quad	.LVL591
	.long	0x4aa3
	.long	0x3c30
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xa
	.value	0x168
	.byte	0
	.uleb128 0x2f
	.quad	.LVL592
	.long	0x4d8c
	.uleb128 0x2f
	.quad	.LVL593
	.long	0x4d97
	.uleb128 0x30
	.quad	.LVL594
	.long	0x4c6a
	.long	0x3c7c
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
	.uleb128 0x30
	.quad	.LVL595
	.long	0x4c6a
	.long	0x3cac
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
	.uleb128 0x30
	.quad	.LVL596
	.long	0x4c6a
	.long	0x3cdc
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
	.uleb128 0x30
	.quad	.LVL597
	.long	0x4c6a
	.long	0x3d0e
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
	.uleb128 0x30
	.quad	.LVL598
	.long	0x4da2
	.long	0x3d25
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2f
	.quad	.LVL599
	.long	0x4d51
	.uleb128 0x30
	.quad	.LVL600
	.long	0x4dad
	.long	0x3d4e
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
	.uleb128 0x30
	.quad	.LVL601
	.long	0x4db8
	.long	0x3d66
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL602
	.long	0x4dc4
	.long	0x3d7e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL603
	.long	0x4dcf
	.long	0x3d99
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.byte	0x91
	.sleb128 -4476
	.byte	0x94
	.byte	0x4
	.byte	0
	.uleb128 0x30
	.quad	.LVL604
	.long	0x4b87
	.long	0x3db1
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL610
	.long	0x4a3f
	.long	0x3dcd
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
	.uleb128 0x30
	.quad	.LVL611
	.long	0x4a3f
	.long	0x3de9
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
	.uleb128 0x30
	.quad	.LVL612
	.long	0x4ddb
	.long	0x3e02
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4448
	.byte	0
	.uleb128 0x30
	.quad	.LVL613
	.long	0x4de6
	.long	0x3e1b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4448
	.byte	0
	.uleb128 0x2f
	.quad	.LVL614
	.long	0x4df1
	.uleb128 0x30
	.quad	.LVL616
	.long	0x4ddb
	.long	0x3e41
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4448
	.byte	0
	.uleb128 0x2f
	.quad	.LVL617
	.long	0x4dfc
	.uleb128 0x2f
	.quad	.LVL618
	.long	0x4dfc
	.uleb128 0x2f
	.quad	.LVL620
	.long	0x4e07
	.uleb128 0x2f
	.quad	.LVL624
	.long	0x4dfc
	.uleb128 0x30
	.quad	.LVL625
	.long	0x2f38
	.long	0x3e94
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
	.byte	0x91
	.sleb128 -4448
	.byte	0
	.uleb128 0x2f
	.quad	.LVL629
	.long	0x4e12
	.uleb128 0x30
	.quad	.LVL630
	.long	0x4a1c
	.long	0x3eb8
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0x30
	.quad	.LVL631
	.long	0x4a33
	.long	0x3ecf
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL632
	.long	0x4e1e
	.uleb128 0x30
	.quad	.LVL635
	.long	0x4a1c
	.long	0x3f00
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
	.quad	.LC131
	.byte	0
	.uleb128 0x30
	.quad	.LVL636
	.long	0x4a27
	.long	0x3f1f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC132
	.byte	0
	.uleb128 0x30
	.quad	.LVL637
	.long	0x4a33
	.long	0x3f36
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL638
	.long	0x2d7c
	.long	0x3f55
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
	.byte	0x91
	.sleb128 -4448
	.byte	0
	.uleb128 0x2f
	.quad	.LVL640
	.long	0x4a82
	.uleb128 0x30
	.quad	.LVL641
	.long	0x4a1c
	.long	0x3f86
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
	.quad	.LC163
	.byte	0
	.uleb128 0x30
	.quad	.LVL642
	.long	0x4a33
	.long	0x3f9d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL643
	.long	0x3503
	.long	0x3fbc
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
	.byte	0x91
	.sleb128 -4448
	.byte	0
	.uleb128 0x30
	.quad	.LVL644
	.long	0x322f
	.long	0x3fdb
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
	.byte	0x91
	.sleb128 -4448
	.byte	0
	.uleb128 0x30
	.quad	.LVL646
	.long	0x4be4
	.long	0x3ff4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4448
	.byte	0
	.uleb128 0x2f
	.quad	.LVL647
	.long	0x4bfa
	.uleb128 0x2f
	.quad	.LVL648
	.long	0x4bfa
	.uleb128 0x2f
	.quad	.LVL649
	.long	0x4e29
	.uleb128 0x2f
	.quad	.LVL651
	.long	0x278e
	.uleb128 0x30
	.quad	.LVL653
	.long	0x4be4
	.long	0x4041
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4448
	.byte	0
	.uleb128 0x30
	.quad	.LVL655
	.long	0x4e34
	.long	0x4059
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL656
	.long	0x4b46
	.long	0x407e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC94
	.byte	0
	.uleb128 0x30
	.quad	.LVL657
	.long	0x4e40
	.long	0x40a6
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x6
	.byte	0x91
	.sleb128 -4472
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.byte	0
	.uleb128 0x30
	.quad	.LVL658
	.long	0x4b70
	.long	0x40cb
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x7d
	.sleb128 0
	.byte	0x91
	.sleb128 -4472
	.byte	0x6
	.byte	0x22
	.byte	0x32
	.byte	0x1c
	.byte	0
	.uleb128 0x30
	.quad	.LVL659
	.long	0x4aaf
	.long	0x40e3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL660
	.long	0x4a1c
	.long	0x4107
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
	.quad	.LC149
	.byte	0
	.uleb128 0x30
	.quad	.LVL661
	.long	0x4b3a
	.long	0x4126
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC150
	.byte	0
	.uleb128 0x30
	.quad	.LVL662
	.long	0x4a33
	.long	0x413d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL663
	.long	0x4add
	.long	0x4162
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
	.quad	.LC96
	.byte	0
	.uleb128 0x30
	.quad	.LVL665
	.long	0x4b9f
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
	.uleb128 0x3
	.byte	0xa
	.value	0x180
	.byte	0
	.uleb128 0x30
	.quad	.LVL667
	.long	0x4a1c
	.long	0x41a5
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
	.quad	.LC136
	.byte	0
	.uleb128 0x30
	.quad	.LVL668
	.long	0x4a27
	.long	0x41c4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC137
	.byte	0
	.uleb128 0x30
	.quad	.LVL669
	.long	0x4bab
	.long	0x41dc
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL670
	.long	0x4bb7
	.long	0x41f8
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
	.uleb128 0x2f
	.quad	.LVL671
	.long	0x4d51
	.uleb128 0x30
	.quad	.LVL672
	.long	0x4bab
	.long	0x421d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL673
	.long	0x4e4b
	.long	0x423e
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0x91
	.sleb128 -4476
	.byte	0x94
	.byte	0x4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x30
	.quad	.LVL674
	.long	0x4a1c
	.long	0x4262
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
	.quad	.LC138
	.byte	0
	.uleb128 0x30
	.quad	.LVL675
	.long	0x4b3a
	.long	0x4281
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC139
	.byte	0
	.uleb128 0x30
	.quad	.LVL676
	.long	0x4a1c
	.long	0x42a5
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
	.quad	.LC140
	.byte	0
	.uleb128 0x30
	.quad	.LVL677
	.long	0x4b3a
	.long	0x42c4
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC141
	.byte	0
	.uleb128 0x30
	.quad	.LVL678
	.long	0x4a33
	.long	0x42db
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL682
	.long	0x4a1c
	.long	0x42ff
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
	.quad	.LC153
	.byte	0
	.uleb128 0x30
	.quad	.LVL683
	.long	0x4a33
	.long	0x4316
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL684
	.long	0x4a1c
	.long	0x433a
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
	.quad	.LC151
	.byte	0
	.uleb128 0x30
	.quad	.LVL685
	.long	0x4b3a
	.long	0x4359
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC152
	.byte	0
	.uleb128 0x30
	.quad	.LVL686
	.long	0x4a33
	.long	0x4370
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL687
	.long	0x4a1c
	.long	0x4394
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
	.quad	.LC147
	.byte	0
	.uleb128 0x30
	.quad	.LVL688
	.long	0x4a27
	.long	0x43b3
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC148
	.byte	0
	.uleb128 0x30
	.quad	.LVL689
	.long	0x4a1c
	.long	0x43d7
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
	.quad	.LC161
	.byte	0
	.uleb128 0x30
	.quad	.LVL690
	.long	0x4a1c
	.long	0x43fb
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
	.uleb128 0x30
	.quad	.LVL691
	.long	0x4a33
	.long	0x4412
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL692
	.long	0x2890
	.long	0x442b
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4448
	.byte	0
	.uleb128 0x30
	.quad	.LVL693
	.long	0x2890
	.long	0x4444
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -4448
	.byte	0
	.uleb128 0x30
	.quad	.LVL695
	.long	0x4a1c
	.long	0x4468
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
	.quad	.LC156
	.byte	0
	.uleb128 0x30
	.quad	.LVL696
	.long	0x4a33
	.long	0x447f
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL698
	.long	0x4a1c
	.long	0x44a9
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
	.quad	.LC85
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2f
	.quad	.LVL699
	.long	0x4b3a
	.uleb128 0x30
	.quad	.LVL700
	.long	0x4a33
	.long	0x44cd
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2f
	.quad	.LVL701
	.long	0x2a8e
	.uleb128 0x30
	.quad	.LVL702
	.long	0x4a1c
	.long	0x44fe
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
	.quad	.LC106
	.byte	0
	.uleb128 0x2f
	.quad	.LVL703
	.long	0x4c48
	.uleb128 0x30
	.quad	.LVL704
	.long	0x4a33
	.long	0x4522
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x30
	.quad	.LVL705
	.long	0x4a1c
	.long	0x4546
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
	.quad	.LC154
	.byte	0
	.uleb128 0x30
	.quad	.LVL706
	.long	0x4a33
	.long	0x455d
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL707
	.long	0x4a1c
	.long	0x4581
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
	.quad	.LC146
	.byte	0
	.uleb128 0x30
	.quad	.LVL708
	.long	0x4b3a
	.long	0x45a0
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC31
	.byte	0
	.uleb128 0x30
	.quad	.LVL709
	.long	0x4a33
	.long	0x45b7
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x30
	.quad	.LVL710
	.long	0x4a1c
	.long	0x45db
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
	.quad	.LC133
	.byte	0
	.uleb128 0x30
	.quad	.LVL711
	.long	0x4a27
	.long	0x45fa
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC134
	.byte	0
	.uleb128 0x30
	.quad	.LVL712
	.long	0x4a33
	.long	0x4611
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x2b
	.quad	.LVL713
	.long	0x4a1c
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
	.quad	.LC159
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2de
	.uleb128 0xc
	.long	0x10a
	.long	0x4649
	.uleb128 0x3b
	.long	0xc4
	.value	0x1000
	.byte	0
	.uleb128 0x38
	.long	.LASF345
	.byte	0x1
	.byte	0x43
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	argv0
	.uleb128 0x38
	.long	.LASF346
	.byte	0x1
	.byte	0x44
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	debug
	.uleb128 0x38
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
	.uleb128 0x38
	.long	.LASF347
	.byte	0x1
	.byte	0x47
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	data_dir
	.uleb128 0x38
	.long	.LASF348
	.byte	0x1
	.byte	0x48
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	do_chroot
	.uleb128 0x38
	.long	.LASF171
	.byte	0x1
	.byte	0x48
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	no_log
	.uleb128 0x38
	.long	.LASF173
	.byte	0x1
	.byte	0x48
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	no_symlink_check
	.uleb128 0x38
	.long	.LASF349
	.byte	0x1
	.byte	0x48
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	do_vhost
	.uleb128 0x38
	.long	.LASF350
	.byte	0x1
	.byte	0x48
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	do_global_passwd
	.uleb128 0x38
	.long	.LASF164
	.byte	0x1
	.byte	0x49
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	cgi_pattern
	.uleb128 0x38
	.long	.LASF165
	.byte	0x1
	.byte	0x4a
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	cgi_limit
	.uleb128 0x38
	.long	.LASF176
	.byte	0x1
	.byte	0x4b
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	url_pattern
	.uleb128 0x38
	.long	.LASF178
	.byte	0x1
	.byte	0x4c
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	no_empty_referers
	.uleb128 0x38
	.long	.LASF177
	.byte	0x1
	.byte	0x4d
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	local_pattern
	.uleb128 0x38
	.long	.LASF351
	.byte	0x1
	.byte	0x4e
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	logfile
	.uleb128 0x38
	.long	.LASF320
	.byte	0x1
	.byte	0x4f
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	throttlefile
	.uleb128 0x38
	.long	.LASF229
	.byte	0x1
	.byte	0x50
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	hostname
	.uleb128 0x38
	.long	.LASF352
	.byte	0x1
	.byte	0x51
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	pidfile
	.uleb128 0x38
	.long	.LASF353
	.byte	0x1
	.byte	0x52
	.long	0x104
	.uleb128 0x9
	.byte	0x3
	.quad	user
	.uleb128 0x38
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
	.uleb128 0x38
	.long	.LASF168
	.byte	0x1
	.byte	0x55
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	max_age
	.uleb128 0x38
	.long	.LASF354
	.byte	0x1
	.byte	0x5f
	.long	0x4841
	.uleb128 0x9
	.byte	0x3
	.quad	throttles
	.uleb128 0x6
	.byte	0x8
	.long	0xddd
	.uleb128 0x38
	.long	.LASF355
	.byte	0x1
	.byte	0x60
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	numthrottles
	.uleb128 0x38
	.long	.LASF356
	.byte	0x1
	.byte	0x60
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	maxthrottles
	.uleb128 0x38
	.long	.LASF357
	.byte	0x1
	.byte	0x74
	.long	0xefb
	.uleb128 0x9
	.byte	0x3
	.quad	connects
	.uleb128 0x38
	.long	.LASF358
	.byte	0x1
	.byte	0x75
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	num_connects
	.uleb128 0x38
	.long	.LASF359
	.byte	0x1
	.byte	0x75
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	max_connects
	.uleb128 0x38
	.long	.LASF360
	.byte	0x1
	.byte	0x75
	.long	0x53
	.uleb128 0x9
	.byte	0x3
	.quad	first_free_connect
	.uleb128 0x38
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
	.uleb128 0x38
	.long	.LASF362
	.byte	0x1
	.byte	0x87
	.long	0x1c1
	.uleb128 0x9
	.byte	0x3
	.quad	got_hup
	.uleb128 0x38
	.long	.LASF363
	.byte	0x1
	.byte	0x87
	.long	0x1c1
	.uleb128 0x9
	.byte	0x3
	.quad	got_usr1
	.uleb128 0x38
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
	.long	.LASF381
	.byte	0x16
	.byte	0xbe
	.uleb128 0x50
	.long	.LASF382
	.long	.LASF382
	.byte	0xb
	.value	0x164
	.uleb128 0x50
	.long	.LASF383
	.long	.LASF383
	.byte	0x17
	.value	0x21e
	.uleb128 0x4f
	.long	.LASF384
	.long	.LASF384
	.byte	0x18
	.byte	0x3f
	.uleb128 0x50
	.long	.LASF385
	.long	.LASF385
	.byte	0x14
	.value	0x11a
	.uleb128 0x4f
	.long	.LASF386
	.long	.LASF386
	.byte	0x19
	.byte	0x35
	.uleb128 0x4f
	.long	.LASF387
	.long	.LASF387
	.byte	0x18
	.byte	0x53
	.uleb128 0x4f
	.long	.LASF388
	.long	.LASF388
	.byte	0x15
	.byte	0x6c
	.uleb128 0x4f
	.long	.LASF389
	.long	.LASF389
	.byte	0xe
	.byte	0x48
	.uleb128 0x4f
	.long	.LASF390
	.long	.LASF390
	.byte	0x1a
	.byte	0x32
	.uleb128 0x4f
	.long	.LASF391
	.long	.LASF391
	.byte	0x19
	.byte	0x2f
	.uleb128 0x4f
	.long	.LASF392
	.long	.LASF392
	.byte	0x15
	.byte	0x66
	.uleb128 0x50
	.long	.LASF393
	.long	.LASF393
	.byte	0xd
	.value	0x1b0
	.uleb128 0x50
	.long	.LASF394
	.long	.LASF394
	.byte	0xd
	.value	0x1f1
	.uleb128 0x50
	.long	.LASF395
	.long	.LASF395
	.byte	0x17
	.value	0x202
	.uleb128 0x4f
	.long	.LASF396
	.long	.LASF396
	.byte	0x1b
	.byte	0x89
	.uleb128 0x4f
	.long	.LASF397
	.long	.LASF397
	.byte	0x1c
	.byte	0xac
	.uleb128 0x50
	.long	.LASF398
	.long	.LASF398
	.byte	0xb
	.value	0x110
	.uleb128 0x50
	.long	.LASF399
	.long	.LASF399
	.byte	0xb
	.value	0x26e
	.uleb128 0x4f
	.long	.LASF400
	.long	.LASF400
	.byte	0x1c
	.byte	0xe8
	.uleb128 0x50
	.long	.LASF401
	.long	.LASF401
	.byte	0x1c
	.value	0x11d
	.uleb128 0x50
	.long	.LASF402
	.long	.LASF402
	.byte	0x1c
	.value	0x214
	.uleb128 0x4f
	.long	.LASF403
	.long	.LASF403
	.byte	0x17
	.byte	0x93
	.uleb128 0x50
	.long	.LASF404
	.long	.LASF404
	.byte	0x1c
	.value	0x119
	.uleb128 0x4f
	.long	.LASF405
	.long	.LASF405
	.byte	0xb
	.byte	0xed
	.uleb128 0x50
	.long	.LASF406
	.long	.LASF406
	.byte	0xb
	.value	0x34e
	.uleb128 0x4f
	.long	.LASF407
	.long	.LASF407
	.byte	0x1c
	.byte	0x8c
	.uleb128 0x51
	.long	.LASF408
	.long	.LASF410
	.byte	0x1d
	.byte	0
	.long	.LASF408
	.uleb128 0x52
	.long	.LASF409
	.long	.LASF411
	.byte	0xb
	.value	0x1c0
	.long	.LASF409
	.uleb128 0x4f
	.long	.LASF412
	.long	.LASF412
	.byte	0x1c
	.byte	0x7d
	.uleb128 0x50
	.long	.LASF413
	.long	.LASF413
	.byte	0x1c
	.value	0x152
	.uleb128 0x50
	.long	.LASF414
	.long	.LASF414
	.byte	0x17
	.value	0x1d1
	.uleb128 0x50
	.long	.LASF415
	.long	.LASF415
	.byte	0x17
	.value	0x1df
	.uleb128 0x50
	.long	.LASF416
	.long	.LASF416
	.byte	0x1e
	.value	0x11d
	.uleb128 0x50
	.long	.LASF417
	.long	.LASF417
	.byte	0xb
	.value	0x35a
	.uleb128 0x4f
	.long	.LASF418
	.long	.LASF418
	.byte	0x1f
	.byte	0x9a
	.uleb128 0x4f
	.long	.LASF419
	.long	.LASF419
	.byte	0x14
	.byte	0xb4
	.uleb128 0x4f
	.long	.LASF420
	.long	.LASF420
	.byte	0x14
	.byte	0xc6
	.uleb128 0x50
	.long	.LASF421
	.long	.LASF421
	.byte	0x14
	.value	0x10e
	.uleb128 0x4f
	.long	.LASF422
	.long	.LASF422
	.byte	0x15
	.byte	0x5b
	.uleb128 0x4f
	.long	.LASF423
	.long	.LASF423
	.byte	0x20
	.byte	0x22
	.uleb128 0x4f
	.long	.LASF424
	.long	.LASF424
	.byte	0x18
	.byte	0x42
	.uleb128 0x4f
	.long	.LASF425
	.long	.LASF425
	.byte	0x14
	.byte	0xba
	.uleb128 0x4f
	.long	.LASF426
	.long	.LASF426
	.byte	0x14
	.byte	0xf5
	.uleb128 0x50
	.long	.LASF427
	.long	.LASF427
	.byte	0x17
	.value	0x1e2
	.uleb128 0x4f
	.long	.LASF428
	.long	.LASF428
	.byte	0x14
	.byte	0xf0
	.uleb128 0x4f
	.long	.LASF429
	.long	.LASF429
	.byte	0x19
	.byte	0x32
	.uleb128 0x4f
	.long	.LASF430
	.long	.LASF430
	.byte	0x15
	.byte	0x69
	.uleb128 0x4f
	.long	.LASF431
	.long	.LASF431
	.byte	0x16
	.byte	0xaf
	.uleb128 0x4f
	.long	.LASF432
	.long	.LASF432
	.byte	0x15
	.byte	0x63
	.uleb128 0x50
	.long	.LASF433
	.long	.LASF433
	.byte	0x21
	.value	0x106
	.uleb128 0x4f
	.long	.LASF434
	.long	.LASF434
	.byte	0x15
	.byte	0x48
	.uleb128 0x4f
	.long	.LASF435
	.long	.LASF435
	.byte	0x14
	.byte	0xe9
	.uleb128 0x4f
	.long	.LASF436
	.long	.LASF436
	.byte	0x14
	.byte	0xf9
	.uleb128 0x50
	.long	.LASF437
	.long	.LASF437
	.byte	0x14
	.value	0x108
	.uleb128 0x50
	.long	.LASF438
	.long	.LASF438
	.byte	0xd
	.value	0x168
	.uleb128 0x4f
	.long	.LASF439
	.long	.LASF439
	.byte	0x14
	.byte	0xd2
	.uleb128 0x4f
	.long	.LASF440
	.long	.LASF440
	.byte	0x14
	.byte	0xdc
	.uleb128 0x4f
	.long	.LASF441
	.long	.LASF441
	.byte	0x14
	.byte	0xe6
	.uleb128 0x50
	.long	.LASF442
	.long	.LASF442
	.byte	0x14
	.value	0x10b
	.uleb128 0x4f
	.long	.LASF443
	.long	.LASF443
	.byte	0x22
	.byte	0x33
	.uleb128 0x4f
	.long	.LASF444
	.long	.LASF444
	.byte	0x1c
	.byte	0x2e
	.uleb128 0x50
	.long	.LASF445
	.long	.LASF445
	.byte	0xd
	.value	0x16e
	.uleb128 0x50
	.long	.LASF446
	.long	.LASF446
	.byte	0xb
	.value	0x182
	.uleb128 0x50
	.long	.LASF447
	.long	.LASF447
	.byte	0x13
	.value	0x296
	.uleb128 0x50
	.long	.LASF448
	.long	.LASF448
	.byte	0x13
	.value	0x29c
	.uleb128 0x50
	.long	.LASF449
	.long	.LASF449
	.byte	0x13
	.value	0x29f
	.uleb128 0x50
	.long	.LASF450
	.long	.LASF450
	.byte	0xd
	.value	0x274
	.uleb128 0x50
	.long	.LASF451
	.long	.LASF451
	.byte	0x1c
	.value	0x103
	.uleb128 0x4f
	.long	.LASF452
	.long	.LASF452
	.byte	0x16
	.byte	0xb5
	.uleb128 0x50
	.long	.LASF453
	.long	.LASF453
	.byte	0x4
	.value	0x125
	.uleb128 0x50
	.long	.LASF454
	.long	.LASF454
	.byte	0xd
	.value	0x2b9
	.uleb128 0x50
	.long	.LASF455
	.long	.LASF455
	.byte	0xd
	.value	0x1ff
	.uleb128 0x50
	.long	.LASF456
	.long	.LASF456
	.byte	0xd
	.value	0x3bf
	.uleb128 0x4f
	.long	.LASF457
	.long	.LASF457
	.byte	0x18
	.byte	0x3c
	.uleb128 0x50
	.long	.LASF458
	.long	.LASF458
	.byte	0x1
	.value	0x262
	.uleb128 0x4f
	.long	.LASF459
	.long	.LASF459
	.byte	0x15
	.byte	0x45
	.uleb128 0x4f
	.long	.LASF460
	.long	.LASF460
	.byte	0x14
	.byte	0xac
	.uleb128 0x4f
	.long	.LASF248
	.long	.LASF248
	.byte	0x4
	.byte	0xc0
	.uleb128 0x4f
	.long	.LASF461
	.long	.LASF461
	.byte	0x23
	.byte	0xb5
	.uleb128 0x50
	.long	.LASF462
	.long	.LASF462
	.byte	0xd
	.value	0x2e3
	.uleb128 0x4f
	.long	.LASF463
	.long	.LASF463
	.byte	0x23
	.byte	0xca
	.uleb128 0x50
	.long	.LASF464
	.long	.LASF464
	.byte	0xd
	.value	0x2d2
	.uleb128 0x4f
	.long	.LASF465
	.long	.LASF465
	.byte	0x15
	.byte	0x6f
	.uleb128 0x4f
	.long	.LASF466
	.long	.LASF466
	.byte	0x15
	.byte	0x56
	.uleb128 0x4f
	.long	.LASF467
	.long	.LASF467
	.byte	0x18
	.byte	0x48
	.uleb128 0x4f
	.long	.LASF468
	.long	.LASF468
	.byte	0x18
	.byte	0x4b
	.uleb128 0x4f
	.long	.LASF469
	.long	.LASF469
	.byte	0x18
	.byte	0x50
	.uleb128 0x50
	.long	.LASF470
	.long	.LASF470
	.byte	0xd
	.value	0x2b1
	.uleb128 0x4f
	.long	.LASF471
	.long	.LASF471
	.byte	0xa
	.byte	0x75
	.uleb128 0x4f
	.long	.LASF472
	.long	.LASF472
	.byte	0x14
	.byte	0xb7
	.uleb128 0x50
	.long	.LASF473
	.long	.LASF473
	.byte	0xd
	.value	0x3c6
	.uleb128 0x4f
	.long	.LASF474
	.long	.LASF474
	.byte	0x1c
	.byte	0x8f
	.uleb128 0x50
	.long	.LASF475
	.long	.LASF475
	.byte	0xd
	.value	0x1de
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
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
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
	.uleb128 0x33
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x34
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
	.uleb128 0x35
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
	.uleb128 0x36
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
	.uleb128 0x37
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x39
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
	.uleb128 0x3a
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
	.uleb128 0x18
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x410a
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x43
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
	.uleb128 0x44
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x45
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x46
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x47
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x4a
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x5
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
	.quad	.LVL6
	.value	0x1
	.byte	0x55
	.quad	.LVL8
	.quad	.LVL9
	.value	0x1
	.byte	0x55
	.quad	.LVL11
	.quad	.LVL14
	.value	0x1
	.byte	0x55
	.quad	.LVL15
	.quad	.LVL20
	.value	0x1
	.byte	0x55
	.quad	.LVL28
	.quad	.LFE25
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
	.quad	.LVL6
	.value	0x1
	.byte	0x53
	.quad	.LVL6
	.quad	.LVL7-1
	.value	0x1
	.byte	0x51
	.quad	.LVL7-1
	.quad	.LVL15
	.value	0x1
	.byte	0x53
	.quad	.LVL22
	.quad	.LVL25
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	.LVL25
	.quad	.LVL26
	.value	0x2
	.byte	0x72
	.sleb128 -4
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL19
	.quad	.LVL21
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL15
	.quad	.LVL16
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL16
	.quad	.LVL17
	.value	0x1
	.byte	0x54
	.quad	.LVL17
	.quad	.LVL18
	.value	0x4
	.byte	0x74
	.sleb128 -144
	.byte	0x9f
	.quad	.LVL18
	.quad	.LVL27
	.value	0x1
	.byte	0x54
	.quad	.LVL27
	.quad	.LVL28
	.value	0x4
	.byte	0x74
	.sleb128 -144
	.byte	0x9f
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL23
	.quad	.LVL24
	.value	0x1
	.byte	0x50
	.quad	.LVL24
	.quad	.LVL25
	.value	0x18
	.byte	0x72
	.sleb128 0
	.byte	0x94
	.byte	0x4
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
	.byte	0x7a
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x8
	.byte	0x6
	.byte	0x78
	.sleb128 0
	.byte	0x1b
	.byte	0x9f
	.quad	.LVL25
	.quad	.LVL26
	.value	0x18
	.byte	0x72
	.sleb128 -4
	.byte	0x94
	.byte	0x4
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
	.byte	0x7a
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x8
	.byte	0x6
	.byte	0x78
	.sleb128 0
	.byte	0x1b
	.byte	0x9f
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL29
	.quad	.LVL30
	.value	0x1
	.byte	0x55
	.quad	.LVL30
	.quad	.LVL32-1
	.value	0x1
	.byte	0x52
	.quad	.LVL32-1
	.quad	.LFE14
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL29
	.quad	.LVL31
	.value	0x1
	.byte	0x54
	.quad	.LVL31
	.quad	.LFE14
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL34
	.quad	.LVL35
	.value	0x1
	.byte	0x55
	.quad	.LVL35
	.quad	.LVL37-1
	.value	0x1
	.byte	0x52
	.quad	.LVL37-1
	.quad	.LFE13
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL34
	.quad	.LVL36
	.value	0x1
	.byte	0x54
	.quad	.LVL36
	.quad	.LFE13
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL41
	.quad	.LVL43
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL41
	.quad	.LVL42
	.value	0x1
	.byte	0x54
	.quad	.LVL42
	.quad	.LFE30
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL41
	.quad	.LVL43
	.value	0x1
	.byte	0x55
	.quad	.LVL43
	.quad	.LVL44-1
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL45
	.quad	.LVL47
	.value	0x1
	.byte	0x55
	.quad	.LVL59
	.quad	.LVL60
	.value	0x1
	.byte	0x55
	.quad	.LVL60
	.quad	.LVL61
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL61
	.quad	.LFE34
	.value	0x1
	.byte	0x57
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL46
	.quad	.LVL51
	.value	0x1
	.byte	0x50
	.quad	.LVL51
	.quad	.LVL52-1
	.value	0x9
	.byte	0x3
	.quad	stats_time
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL48
	.quad	.LVL52-1
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL48
	.quad	.LVL49
	.value	0xe
	.byte	0x70
	.sleb128 0
	.byte	0x3
	.quad	stats_time
	.byte	0x6
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL49
	.quad	.LVL58
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL62
	.quad	.LVL63
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL62
	.quad	.LVL64-1
	.value	0x1
	.byte	0x54
	.quad	.LVL64-1
	.quad	.LFE33
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL65
	.quad	.LVL66-1
	.value	0x1
	.byte	0x55
	.quad	.LVL66-1
	.quad	.LFE6
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL67
	.quad	.LVL69
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL70
	.quad	.LVL71
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL70
	.quad	.LVL72-1
	.value	0x1
	.byte	0x54
	.quad	.LVL72-1
	.quad	.LFE32
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL74
	.quad	.LVL75-1
	.value	0x1
	.byte	0x55
	.quad	.LVL75-1
	.quad	.LFE7
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL76
	.quad	.LVL78
	.value	0x1
	.byte	0x56
	.quad	.LVL79
	.quad	.LFE7
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL82
	.quad	.LVL83-1
	.value	0x1
	.byte	0x55
	.quad	.LVL83-1
	.quad	.LFE3
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST28:
	.quad	.LVL84
	.quad	.LVL90
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST29:
	.quad	.LVL85
	.quad	.LVL86
	.value	0x1
	.byte	0x50
	.quad	.LVL87
	.quad	.LVL88
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST30:
	.quad	.LVL91
	.quad	.LVL92-1
	.value	0x1
	.byte	0x55
	.quad	.LVL92-1
	.quad	.LFE15
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST31:
	.quad	.LVL92
	.quad	.LVL93-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST32:
	.quad	.LVL96
	.quad	.LVL97-1
	.value	0x1
	.byte	0x55
	.quad	.LVL97-1
	.quad	.LVL99
	.value	0x1
	.byte	0x53
	.quad	.LVL99
	.quad	.LVL181
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL181
	.quad	.LVL183
	.value	0x1
	.byte	0x53
	.quad	.LVL183
	.quad	.LFE12
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST33:
	.quad	.LVL97
	.quad	.LVL98
	.value	0x1
	.byte	0x5c
	.quad	.LVL181
	.quad	.LVL183
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST34:
	.quad	.LVL101
	.quad	.LVL102
	.value	0x1
	.byte	0x50
	.quad	.LVL102
	.quad	.LVL104
	.value	0x1
	.byte	0x57
	.quad	.LVL104
	.quad	.LVL138
	.value	0x1
	.byte	0x56
	.quad	.LVL138
	.quad	.LVL140
	.value	0x1
	.byte	0x53
	.quad	.LVL140
	.quad	.LVL165
	.value	0x1
	.byte	0x56
	.quad	.LVL167
	.quad	.LVL181
	.value	0x1
	.byte	0x56
	.quad	.LVL183
	.quad	.LFE12
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST35:
	.quad	.LVL105
	.quad	.LVL141
	.value	0x1
	.byte	0x53
	.quad	.LVL143
	.quad	.LVL165
	.value	0x1
	.byte	0x53
	.quad	.LVL167
	.quad	.LVL181
	.value	0x1
	.byte	0x53
	.quad	.LVL183
	.quad	.LFE12
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST36:
	.quad	.LVL105
	.quad	.LVL140
	.value	0x1
	.byte	0x56
	.quad	.LVL145
	.quad	.LVL165
	.value	0x1
	.byte	0x56
	.quad	.LVL167
	.quad	.LVL181
	.value	0x1
	.byte	0x56
	.quad	.LVL183
	.quad	.LFE12
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST37:
	.quad	.LVL106
	.quad	.LVL107
	.value	0x1
	.byte	0x50
	.quad	.LVL107
	.quad	.LVL141
	.value	0x1
	.byte	0x5d
	.quad	.LVL145
	.quad	.LVL149
	.value	0x1
	.byte	0x5d
	.quad	.LVL149
	.quad	.LVL150
	.value	0x1
	.byte	0x50
	.quad	.LVL150
	.quad	.LVL165
	.value	0x1
	.byte	0x5d
	.quad	.LVL167
	.quad	.LVL181
	.value	0x1
	.byte	0x5d
	.quad	.LVL183
	.quad	.LFE12
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST38:
	.quad	.LVL194
	.quad	.LVL196
	.value	0x1
	.byte	0x55
	.quad	.LVL196
	.quad	.LVL204
	.value	0x1
	.byte	0x5d
	.quad	.LVL204
	.quad	.LVL205
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL205
	.quad	.LVL230
	.value	0x1
	.byte	0x5d
	.quad	.LVL230
	.quad	.LVL231
	.value	0x1
	.byte	0x55
	.quad	.LVL231
	.quad	.LFE10
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST39:
	.quad	.LVL194
	.quad	.LVL196
	.value	0x1
	.byte	0x54
	.quad	.LVL196
	.quad	.LVL203
	.value	0x1
	.byte	0x5e
	.quad	.LVL203
	.quad	.LVL205
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL205
	.quad	.LVL230
	.value	0x1
	.byte	0x5e
	.quad	.LVL230
	.quad	.LVL231
	.value	0x1
	.byte	0x54
	.quad	.LVL231
	.quad	.LVL250
	.value	0x1
	.byte	0x5e
	.quad	.LVL250
	.quad	.LFE10
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST40:
	.quad	.LVL195
	.quad	.LVL196
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL196
	.quad	.LVL197
	.value	0x1
	.byte	0x56
	.quad	.LVL197
	.quad	.LVL198
	.value	0x1
	.byte	0x50
	.quad	.LVL198
	.quad	.LVL201
	.value	0x1
	.byte	0x56
	.quad	.LVL201
	.quad	.LVL202
	.value	0x1
	.byte	0x5f
	.quad	.LVL202
	.quad	.LVL203
	.value	0x1
	.byte	0x56
	.quad	.LVL205
	.quad	.LVL206
	.value	0x1
	.byte	0x56
	.quad	.LVL206
	.quad	.LVL208
	.value	0x1
	.byte	0x5f
	.quad	.LVL208
	.quad	.LVL209
	.value	0x1
	.byte	0x56
	.quad	.LVL209
	.quad	.LVL210
	.value	0x1
	.byte	0x50
	.quad	.LVL210
	.quad	.LVL212
	.value	0x1
	.byte	0x56
	.quad	.LVL212
	.quad	.LVL213
	.value	0x1
	.byte	0x50
	.quad	.LVL213
	.quad	.LVL215
	.value	0x1
	.byte	0x56
	.quad	.LVL215
	.quad	.LVL216
	.value	0x1
	.byte	0x50
	.quad	.LVL216
	.quad	.LVL219
	.value	0x1
	.byte	0x56
	.quad	.LVL219
	.quad	.LVL220
	.value	0x1
	.byte	0x50
	.quad	.LVL220
	.quad	.LVL221
	.value	0x1
	.byte	0x56
	.quad	.LVL221
	.quad	.LVL222
	.value	0x1
	.byte	0x50
	.quad	.LVL222
	.quad	.LVL226
	.value	0x1
	.byte	0x56
	.quad	.LVL226
	.quad	.LVL227
	.value	0x1
	.byte	0x50
	.quad	.LVL227
	.quad	.LVL230
	.value	0x1
	.byte	0x56
	.quad	.LVL230
	.quad	.LVL231
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL231
	.quad	.LVL236
	.value	0x1
	.byte	0x56
	.quad	.LVL236
	.quad	.LVL237
	.value	0x1
	.byte	0x50
	.quad	.LVL237
	.quad	.LVL239
	.value	0x1
	.byte	0x56
	.quad	.LVL239
	.quad	.LVL240
	.value	0x1
	.byte	0x50
	.quad	.LVL240
	.quad	.LVL242
	.value	0x1
	.byte	0x56
	.quad	.LVL242
	.quad	.LVL243
	.value	0x1
	.byte	0x50
	.quad	.LVL243
	.quad	.LVL246
	.value	0x1
	.byte	0x56
	.quad	.LVL246
	.quad	.LVL248
	.value	0x1
	.byte	0x5f
	.quad	.LVL248
	.quad	.LVL250
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST41:
	.quad	.LVL252
	.quad	.LVL253-1
	.value	0x1
	.byte	0x55
	.quad	.LVL253-1
	.quad	.LVL279
	.value	0x1
	.byte	0x5c
	.quad	.LVL279
	.quad	.LVL280
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL280
	.quad	.LFE17
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST42:
	.quad	.LVL253
	.quad	.LVL254
	.value	0x1
	.byte	0x56
	.quad	.LVL283
	.quad	.LVL286
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST43:
	.quad	.LVL257
	.quad	.LVL258
	.value	0x1
	.byte	0x50
	.quad	.LVL264
	.quad	.LVL265-1
	.value	0x1
	.byte	0x50
	.quad	.LVL266
	.quad	.LVL267
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST44:
	.quad	.LVL259
	.quad	.LVL260
	.value	0x1
	.byte	0x50
	.quad	.LVL260
	.quad	.LVL261
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	.LVL270
	.quad	.LVL271
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	.LVL272
	.quad	.LVL273
	.value	0x1
	.byte	0x50
	.quad	.LVL273
	.quad	.LVL274
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	.LVL280
	.quad	.LVL281
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST45:
	.quad	.LVL292
	.quad	.LVL293-1
	.value	0x1
	.byte	0x50
	.quad	.LVL293-1
	.quad	.LVL296
	.value	0x1
	.byte	0x53
	.quad	.LVL296
	.quad	.LVL297-1
	.value	0x1
	.byte	0x54
	.quad	.LVL297
	.quad	.LVL298
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST46:
	.quad	.LVL293
	.quad	.LVL294-1
	.value	0x1
	.byte	0x50
	.quad	.LVL297
	.quad	.LVL299
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST47:
	.quad	.LVL301
	.quad	.LVL302
	.value	0x1
	.byte	0x55
	.quad	.LVL302
	.quad	.LVL307
	.value	0x1
	.byte	0x5c
	.quad	.LVL307
	.quad	.LVL308
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL308
	.quad	.LVL316
	.value	0x1
	.byte	0x5c
	.quad	.LVL316
	.quad	.LVL317
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL317
	.quad	.LFE19
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST48:
	.quad	.LVL301
	.quad	.LVL302
	.value	0x1
	.byte	0x54
	.quad	.LVL302
	.quad	.LVL306
	.value	0x1
	.byte	0x56
	.quad	.LVL306
	.quad	.LVL308
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL308
	.quad	.LVL315
	.value	0x1
	.byte	0x56
	.quad	.LVL315
	.quad	.LVL317
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL317
	.quad	.LFE19
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST49:
	.quad	.LVL303
	.quad	.LVL305
	.value	0x1
	.byte	0x53
	.quad	.LVL308
	.quad	.LVL314
	.value	0x1
	.byte	0x53
	.quad	.LVL317
	.quad	.LVL319
	.value	0x1
	.byte	0x53
	.quad	.LVL323
	.quad	.LFE19
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST50:
	.quad	.LVL309
	.quad	.LVL312
	.value	0x3
	.byte	0x53
	.byte	0x93
	.uleb128 0x8
	.quad	0
	.quad	0
.LLST51:
	.quad	.LVL326
	.quad	.LVL328
	.value	0x1
	.byte	0x55
	.quad	.LVL328
	.quad	.LVL338
	.value	0x1
	.byte	0x53
	.quad	.LVL338
	.quad	.LVL340
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL340
	.quad	.LVL342
	.value	0x1
	.byte	0x53
	.quad	.LVL342
	.quad	.LVL344
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL344
	.quad	.LFE23
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST52:
	.quad	.LVL327
	.quad	.LVL328
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL328
	.quad	.LVL339
	.value	0x1
	.byte	0x5c
	.quad	.LVL340
	.quad	.LVL343
	.value	0x1
	.byte	0x5c
	.quad	.LVL344
	.quad	.LFE23
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST53:
	.quad	.LVL328
	.quad	.LVL329
	.value	0xf
	.byte	0x3
	.quad	throttles
	.byte	0x6
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x10
	.quad	.LVL333
	.quad	.LVL334
	.value	0x1
	.byte	0x50
	.quad	.LVL335
	.quad	.LVL337
	.value	0xf
	.byte	0x3
	.quad	throttles
	.byte	0x6
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x10
	.quad	0
	.quad	0
.LLST54:
	.quad	.LVL346
	.quad	.LVL347
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL347
	.quad	.LVL353
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST55:
	.quad	.LVL354
	.quad	.LVL357
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST56:
	.quad	.LVL362
	.quad	.LVL363-1
	.value	0x1
	.byte	0x55
	.quad	.LVL363-1
	.quad	.LFE5
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST57:
	.quad	.LVL367
	.quad	.LVL368-1
	.value	0x1
	.byte	0x55
	.quad	.LVL368-1
	.quad	.LFE2
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST58:
	.quad	.LVL372
	.quad	.LVL373
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST59:
	.quad	.LVL374
	.quad	.LVL375
	.value	0x1
	.byte	0x55
	.quad	.LVL375
	.quad	.LVL381
	.value	0x1
	.byte	0x53
	.quad	.LVL381
	.quad	.LFE28
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST60:
	.quad	.LVL374
	.quad	.LVL376-1
	.value	0x1
	.byte	0x54
	.quad	.LVL376-1
	.quad	.LVL377
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.quad	.LVL377
	.quad	.LFE28
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST61:
	.quad	.LVL382
	.quad	.LVL383
	.value	0x1
	.byte	0x55
	.quad	.LVL383
	.quad	.LVL390
	.value	0x1
	.byte	0x53
	.quad	.LVL390
	.quad	.LVL392
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL392
	.quad	.LVL394
	.value	0x1
	.byte	0x53
	.quad	.LVL394
	.quad	.LVL396-1
	.value	0x1
	.byte	0x55
	.quad	.LVL396-1
	.quad	.LVL396
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL396
	.quad	.LFE27
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST62:
	.quad	.LVL382
	.quad	.LVL384-1
	.value	0x1
	.byte	0x54
	.quad	.LVL384-1
	.quad	.LVL391
	.value	0x1
	.byte	0x56
	.quad	.LVL391
	.quad	.LVL392
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL392
	.quad	.LVL395
	.value	0x1
	.byte	0x56
	.quad	.LVL395
	.quad	.LVL396-1
	.value	0x1
	.byte	0x54
	.quad	.LVL396-1
	.quad	.LVL396
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL396
	.quad	.LFE27
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST63:
	.quad	.LVL399
	.quad	.LVL400
	.value	0x1
	.byte	0x55
	.quad	.LVL400
	.quad	.LVL402
	.value	0x1
	.byte	0x53
	.quad	.LVL402
	.quad	.LVL404-1
	.value	0x1
	.byte	0x55
	.quad	.LVL404-1
	.quad	.LFE26
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST64:
	.quad	.LVL399
	.quad	.LVL401-1
	.value	0x1
	.byte	0x54
	.quad	.LVL401-1
	.quad	.LVL403
	.value	0x1
	.byte	0x56
	.quad	.LVL403
	.quad	.LVL404-1
	.value	0x1
	.byte	0x54
	.quad	.LVL404-1
	.quad	.LFE26
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST65:
	.quad	.LVL405
	.quad	.LVL408
	.value	0x1
	.byte	0x55
	.quad	.LVL408
	.quad	.LVL411
	.value	0x1
	.byte	0x56
	.quad	.LVL411
	.quad	.LVL413-1
	.value	0x1
	.byte	0x55
	.quad	.LVL413-1
	.quad	.LVL413
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL413
	.quad	.LVL414
	.value	0x1
	.byte	0x55
	.quad	.LVL414
	.quad	.LVL425
	.value	0x1
	.byte	0x56
	.quad	.LVL425
	.quad	.LVL427-1
	.value	0x1
	.byte	0x54
	.quad	.LVL427-1
	.quad	.LVL427
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL427
	.quad	.LVL430
	.value	0x1
	.byte	0x56
	.quad	.LVL430
	.quad	.LVL432
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL432
	.quad	.LFE20
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST66:
	.quad	.LVL405
	.quad	.LVL407
	.value	0x1
	.byte	0x54
	.quad	.LVL407
	.quad	.LVL412
	.value	0x1
	.byte	0x5c
	.quad	.LVL412
	.quad	.LVL413-1
	.value	0x1
	.byte	0x54
	.quad	.LVL413-1
	.quad	.LVL413
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL413
	.quad	.LVL426
	.value	0x1
	.byte	0x5c
	.quad	.LVL426
	.quad	.LVL427
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL427
	.quad	.LVL431
	.value	0x1
	.byte	0x5c
	.quad	.LVL431
	.quad	.LVL432
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL432
	.quad	.LFE20
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST67:
	.quad	.LVL416
	.quad	.LVL417
	.value	0x1
	.byte	0x50
	.quad	.LVL427
	.quad	.LVL428-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST68:
	.quad	.LVL422
	.quad	.LVL425
	.value	0x3
	.byte	0x56
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL425
	.quad	.LVL427-1
	.value	0x3
	.byte	0x54
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL427-1
	.quad	.LVL427
	.value	0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0x93
	.uleb128 0x8
	.quad	0
	.quad	0
.LLST69:
	.quad	.LVL406
	.quad	.LVL410
	.value	0x1
	.byte	0x53
	.quad	.LVL413
	.quad	.LVL424
	.value	0x1
	.byte	0x53
	.quad	.LVL427
	.quad	.LVL429
	.value	0x1
	.byte	0x53
	.quad	.LVL432
	.quad	.LFE20
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST70:
	.quad	.LVL434
	.quad	.LVL435
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL436
	.quad	.LFE20
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST71:
	.quad	.LVL437
	.quad	.LVL442
	.value	0x1
	.byte	0x55
	.quad	.LVL447
	.quad	.LVL448
	.value	0x1
	.byte	0x55
	.quad	.LVL452
	.quad	.LFE29
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST72:
	.quad	.LVL437
	.quad	.LVL438
	.value	0x1
	.byte	0x54
	.quad	.LVL438
	.quad	.LVL455
	.value	0x1
	.byte	0x5d
	.quad	.LVL455
	.quad	.LFE29
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST73:
	.quad	.LVL437
	.quad	.LVL438
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL438
	.quad	.LVL454
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST74:
	.quad	.LVL438
	.quad	.LVL440
	.value	0x1
	.byte	0x53
	.quad	.LVL441
	.quad	.LVL453
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST75:
	.quad	.LVL456
	.quad	.LVL460
	.value	0x1
	.byte	0x55
	.quad	.LVL460
	.quad	.LVL481
	.value	0x1
	.byte	0x53
	.quad	.LVL481
	.quad	.LVL484
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL484
	.quad	.LVL489
	.value	0x1
	.byte	0x53
	.quad	.LVL489
	.quad	.LVL491
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL491
	.quad	.LVL498
	.value	0x1
	.byte	0x53
	.quad	.LVL498
	.quad	.LVL501
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL501
	.quad	.LFE21
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST76:
	.quad	.LVL456
	.quad	.LVL459
	.value	0x1
	.byte	0x54
	.quad	.LVL459
	.quad	.LVL474
	.value	0x1
	.byte	0x56
	.quad	.LVL474
	.quad	.LVL475
	.value	0x1
	.byte	0x54
	.quad	.LVL475
	.quad	.LVL482
	.value	0x1
	.byte	0x56
	.quad	.LVL482
	.quad	.LVL484
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL484
	.quad	.LVL490
	.value	0x1
	.byte	0x56
	.quad	.LVL490
	.quad	.LVL491
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL491
	.quad	.LVL499
	.value	0x1
	.byte	0x56
	.quad	.LVL499
	.quad	.LVL501
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL501
	.quad	.LFE21
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST77:
	.quad	.LVL458
	.quad	.LVL461
	.value	0x1
	.byte	0x51
	.quad	.LVL474
	.quad	.LVL476
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST78:
	.quad	.LVL462
	.quad	.LVL464
	.value	0x1
	.byte	0x50
	.quad	.LVL477
	.quad	.LVL478-1
	.value	0x1
	.byte	0x50
	.quad	.LVL492
	.quad	.LVL494-1
	.value	0x1
	.byte	0x50
	.quad	.LVL495
	.quad	.LVL496
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST79:
	.quad	.LVL472
	.quad	.LVL474
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST80:
	.quad	.LVL467
	.quad	.LVL468
	.value	0x8
	.byte	0x7d
	.sleb128 0
	.byte	0x73
	.sleb128 80
	.byte	0x6
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL468
	.quad	.LVL474
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST81:
	.quad	.LVL457
	.quad	.LVL471
	.value	0x1
	.byte	0x5c
	.quad	.LVL474
	.quad	.LVL483
	.value	0x1
	.byte	0x5c
	.quad	.LVL484
	.quad	.LVL487
	.value	0x1
	.byte	0x5c
	.quad	.LVL491
	.quad	.LVL500
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST82:
	.quad	.LVL465
	.quad	.LVL466
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST83:
	.quad	.LVL492
	.quad	.LVL493
	.value	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL493
	.quad	.LVL494-1
	.value	0x1
	.byte	0x51
	.quad	.LVL494-1
	.quad	.LVL496
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST84:
	.quad	.LVL504
	.quad	.LVL505-1
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST85:
	.quad	.LVL504
	.quad	.LVL505-1
	.value	0x1
	.byte	0x54
	.quad	.LVL505-1
	.quad	.LFE31
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST87:
	.quad	.LVL506
	.quad	.LVL508
	.value	0x1
	.byte	0x55
	.quad	.LVL508
	.quad	.LVL511
	.value	0x1
	.byte	0x53
	.quad	.LVL511
	.quad	.LVL513
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL513
	.quad	.LVL516
	.value	0x1
	.byte	0x53
	.quad	.LVL516
	.quad	.LFE22
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST88:
	.quad	.LVL506
	.quad	.LVL507
	.value	0x1
	.byte	0x54
	.quad	.LVL507
	.quad	.LVL512
	.value	0x1
	.byte	0x56
	.quad	.LVL512
	.quad	.LVL513
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL513
	.quad	.LVL517
	.value	0x1
	.byte	0x56
	.quad	.LVL517
	.quad	.LFE22
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST89:
	.quad	.LVL509
	.quad	.LVL510
	.value	0x1
	.byte	0x50
	.quad	.LVL513
	.quad	.LVL514-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST90:
	.quad	.LVL518
	.quad	.LVL522
	.value	0x1
	.byte	0x55
	.quad	.LVL522
	.quad	.LVL539
	.value	0x1
	.byte	0x56
	.quad	.LVL539
	.quad	.LVL543
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL543
	.quad	.LFE37
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST91:
	.quad	.LVL518
	.quad	.LVL520
	.value	0x1
	.byte	0x54
	.quad	.LVL520
	.quad	.LVL540
	.value	0x1
	.byte	0x5c
	.quad	.LVL540
	.quad	.LVL543
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL543
	.quad	.LFE37
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST92:
	.quad	.LVL518
	.quad	.LVL521
	.value	0x1
	.byte	0x51
	.quad	.LVL521
	.quad	.LVL542
	.value	0x1
	.byte	0x5e
	.quad	.LVL542
	.quad	.LVL543
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	.LVL543
	.quad	.LFE37
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST93:
	.quad	.LVL518
	.quad	.LVL519
	.value	0x1
	.byte	0x52
	.quad	.LVL519
	.quad	.LVL541
	.value	0x1
	.byte	0x5d
	.quad	.LVL541
	.quad	.LVL543
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	.LVL543
	.quad	.LFE37
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST94:
	.quad	.LVL524
	.quad	.LVL527
	.value	0x1
	.byte	0x53
	.quad	.LVL527
	.quad	.LVL546
	.value	0x4
	.byte	0x91
	.sleb128 -96
	.byte	0x9f
	.quad	.LVL546
	.quad	.LVL547
	.value	0x1
	.byte	0x53
	.quad	.LVL547
	.quad	.LFE37
	.value	0x4
	.byte	0x91
	.sleb128 -96
	.byte	0x9f
	.quad	0
	.quad	0
.LLST95:
	.quad	.LVL526
	.quad	.LVL535-1
	.value	0x1
	.byte	0x50
	.quad	.LVL543
	.quad	.LVL544
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST96:
	.quad	.LVL525
	.quad	.LVL528
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL528
	.quad	.LVL534
	.value	0x1
	.byte	0x54
	.quad	.LVL543
	.quad	.LVL544
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST97:
	.quad	.LVL525
	.quad	.LVL528
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL528
	.quad	.LVL536
	.value	0x1
	.byte	0x53
	.quad	.LVL543
	.quad	.LVL544
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST98:
	.quad	.LVL553
	.quad	.LVL555
	.value	0x1
	.byte	0x55
	.quad	.LVL555
	.quad	.LVL560
	.value	0x1
	.byte	0x5c
	.quad	.LVL560
	.quad	.LVL561-1
	.value	0x1
	.byte	0x55
	.quad	.LVL561-1
	.quad	.LFE9
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST99:
	.quad	.LVL553
	.quad	.LVL554
	.value	0x1
	.byte	0x54
	.quad	.LVL554
	.quad	.LVL559
	.value	0x1
	.byte	0x56
	.quad	.LVL559
	.quad	.LVL561-1
	.value	0x1
	.byte	0x54
	.quad	.LVL561-1
	.quad	.LFE9
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST100:
	.quad	.LVL556
	.quad	.LVL557
	.value	0x1
	.byte	0x50
	.quad	.LVL557
	.quad	.LVL567
	.value	0x1
	.byte	0x53
	.quad	.LVL631
	.quad	.LVL637
	.value	0x1
	.byte	0x53
	.quad	.LVL709
	.quad	.LVL712
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST101:
	.quad	.LVL632
	.quad	.LVL634
	.value	0x1
	.byte	0x50
	.quad	.LVL709
	.quad	.LVL710-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST102:
	.quad	.LVL553
	.quad	.LVL566
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL566
	.quad	.LVL631
	.value	0x3
	.byte	0x91
	.sleb128 -4476
	.quad	.LVL631
	.quad	.LVL633
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL633
	.quad	.LVL634
	.value	0x1
	.byte	0x52
	.quad	.LVL634
	.quad	.LVL637
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL637
	.quad	.LVL709
	.value	0x3
	.byte	0x91
	.sleb128 -4476
	.quad	.LVL709
	.quad	.LVL712
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL712
	.quad	.LFE9
	.value	0x3
	.byte	0x91
	.sleb128 -4476
	.quad	0
	.quad	0
.LLST103:
	.quad	.LVL553
	.quad	.LVL566
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL566
	.quad	.LVL631
	.value	0x1
	.byte	0x5f
	.quad	.LVL631
	.quad	.LVL633
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL633
	.quad	.LVL634
	.value	0x1
	.byte	0x5f
	.quad	.LVL634
	.quad	.LVL637
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL637
	.quad	.LVL709
	.value	0x1
	.byte	0x5f
	.quad	.LVL709
	.quad	.LVL712
	.value	0x4
	.byte	0xa
	.value	0x7fff
	.byte	0x9f
	.quad	.LVL712
	.quad	.LFE9
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST104:
	.quad	.LVL569
	.quad	.LVL626
	.value	0x1
	.byte	0x5e
	.quad	.LVL627
	.quad	.LVL628
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL628
	.quad	.LVL631
	.value	0x1
	.byte	0x5e
	.quad	.LVL637
	.quad	.LVL662
	.value	0x1
	.byte	0x5e
	.quad	.LVL664
	.quad	.LVL665-1
	.value	0x1
	.byte	0x50
	.quad	.LVL665-1
	.quad	.LVL709
	.value	0x1
	.byte	0x5e
	.quad	.LVL712
	.quad	.LFE9
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST105:
	.quad	.LVL665
	.quad	.LVL666
	.value	0x1
	.byte	0x50
	.quad	.LVL696
	.quad	.LVL697
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST106:
	.quad	.LVL615
	.quad	.LVL616-1
	.value	0x1
	.byte	0x50
	.quad	.LVL616-1
	.quad	.LVL619
	.value	0x1
	.byte	0x53
	.quad	.LVL639
	.quad	.LVL640-1
	.value	0x1
	.byte	0x50
	.quad	.LVL640-1
	.quad	.LVL642
	.value	0x1
	.byte	0x53
	.quad	.LVL652
	.quad	.LVL654
	.value	0x1
	.byte	0x53
	.quad	.LVL691
	.quad	.LVL694
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST107:
	.quad	.LVL605
	.quad	.LVL606
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL606
	.quad	.LVL607
	.value	0x1
	.byte	0x52
	.quad	.LVL607
	.quad	.LVL608
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL608
	.quad	.LVL609
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST108:
	.quad	.LVL621
	.quad	.LVL623
	.value	0x1
	.byte	0x50
	.quad	.LVL623
	.quad	.LVL626
	.value	0x1
	.byte	0x53
	.quad	.LVL637
	.quad	.LVL639
	.value	0x1
	.byte	0x53
	.quad	.LVL642
	.quad	.LVL645
	.value	0x1
	.byte	0x53
	.quad	.LVL645
	.quad	.LVL646-1
	.value	0x1
	.byte	0x50
	.quad	.LVL646-1
	.quad	.LVL650
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST109:
	.quad	.LVL622
	.quad	.LVL623
	.value	0x2
	.byte	0x70
	.sleb128 8
	.quad	.LVL623
	.quad	.LVL624-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST110:
	.quad	.LVL577
	.quad	.LVL578-1
	.value	0x1
	.byte	0x50
	.quad	.LVL578-1
	.quad	.LVL580
	.value	0x1
	.byte	0x5d
	.quad	.LVL678
	.quad	.LVL679
	.value	0x1
	.byte	0x50
	.quad	.LVL679
	.quad	.LVL681
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x4c
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
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB3
	.quad	.LBE3
	.quad	.LBB4
	.quad	.LBE4
	.quad	.LBB5
	.quad	.LBE5
	.quad	0
	.quad	0
	.quad	.LBB8
	.quad	.LBE8
	.quad	.LBB9
	.quad	.LBE9
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.Ltext_cold0
	.quad	.Letext_cold0
	.quad	.LFB9
	.quad	.LFE9
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF101:
	.string	"socklen_t"
.LASF476:
	.string	"GNU C11 5.2.0 -mtune=generic -march=x86-64 -g -O2 -fno-inline -fno-stack-protector"
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
.LASF426:
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
.LASF293:
	.string	"tnum"
.LASF140:
	.string	"sin_addr"
.LASF79:
	.string	"_IO_save_end"
.LASF267:
	.string	"linger_timer"
.LASF433:
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
.LASF146:
	.string	"sin6_addr"
.LASF172:
	.string	"logfp"
.LASF72:
	.string	"_IO_write_base"
.LASF164:
	.string	"cgi_pattern"
.LASF350:
	.string	"do_global_passwd"
.LASF156:
	.string	"ai_next"
.LASF88:
	.string	"_lock"
.LASF408:
	.string	"puts"
.LASF421:
	.string	"httpd_set_ndelay"
.LASF265:
	.string	"active_at"
.LASF472:
	.string	"httpd_unlisten"
.LASF228:
	.string	"type"
.LASF39:
	.string	"stat"
.LASF453:
	.string	"tzset"
.LASF77:
	.string	"_IO_save_base"
.LASF272:
	.string	"connecttab"
.LASF324:
	.string	"listen_fd"
.LASF403:
	.string	"atoi"
.LASF155:
	.string	"ai_canonname"
.LASF439:
	.string	"httpd_got_request"
.LASF81:
	.string	"_chain"
.LASF119:
	.string	"ss_family"
.LASF396:
	.string	"waitpid"
.LASF85:
	.string	"_cur_column"
.LASF286:
	.string	"aiv4"
.LASF285:
	.string	"aiv6"
.LASF447:
	.string	"getaddrinfo"
.LASF327:
	.string	"handle_usr1"
.LASF304:
	.string	"handle_usr2"
.LASF241:
	.string	"ClientData"
.LASF7:
	.string	"__dev_t"
.LASF422:
	.string	"tmr_run"
.LASF25:
	.string	"uid_t"
.LASF205:
	.string	"contenttype"
.LASF417:
	.string	"fileno"
.LASF184:
	.string	"read_idx"
.LASF294:
	.string	"cnum"
.LASF290:
	.string	"secs"
.LASF165:
	.string	"cgi_limit"
.LASF395:
	.string	"abort"
.LASF378:
	.string	"stats_connections"
.LASF464:
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
.LASF383:
	.string	"exit"
.LASF444:
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
.LASF465:
	.string	"tmr_prepare_timeval"
.LASF360:
	.string	"first_free_connect"
.LASF97:
	.string	"_IO_marker"
.LASF481:
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
.LASF473:
	.string	"chroot"
.LASF443:
	.string	"writev"
.LASF109:
	.string	"SOCK_SEQPACKET"
.LASF311:
	.string	"newstr"
.LASF441:
	.string	"httpd_start_request"
.LASF0:
	.string	"unsigned char"
.LASF452:
	.string	"openlog"
.LASF225:
	.string	"if_modified_since"
.LASF47:
	.string	"st_rdev"
.LASF405:
	.string	"fclose"
.LASF446:
	.string	"snprintf"
.LASF375:
	.string	"terminate"
.LASF305:
	.string	"occasional"
.LASF425:
	.string	"httpd_terminate"
.LASF63:
	.string	"pw_gecos"
.LASF386:
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
.LASF480:
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
.LASF479:
	.string	"_IO_lock_t"
.LASF454:
	.string	"getuid"
.LASF137:
	.string	"sockaddr_in"
.LASF34:
	.string	"timeval"
.LASF455:
	.string	"getcwd"
.LASF370:
	.string	"httpd_err408title"
.LASF387:
	.string	"fdwatch_logstats"
.LASF139:
	.string	"sin_port"
.LASF397:
	.string	"strdup"
.LASF102:
	.string	"timezone"
.LASF349:
	.string	"do_vhost"
.LASF299:
	.string	"wakeup_connection"
.LASF11:
	.string	"__mode_t"
.LASF385:
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
.LASF407:
	.string	"strcmp"
.LASF100:
	.string	"_pos"
.LASF23:
	.string	"__socklen_t"
.LASF365:
	.string	"stdin"
.LASF462:
	.string	"setgid"
.LASF390:
	.string	"__errno_location"
.LASF116:
	.string	"sa_family"
.LASF141:
	.string	"sin_zero"
.LASF337:
	.string	"elapsed"
.LASF428:
	.string	"httpd_close_conn"
.LASF80:
	.string	"_markers"
.LASF166:
	.string	"cgi_count"
.LASF174:
	.string	"vhost"
.LASF414:
	.string	"malloc"
.LASF233:
	.string	"tildemapped"
.LASF300:
	.string	"logstats"
.LASF475:
	.string	"fchown"
.LASF423:
	.string	"match"
.LASF449:
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
.LASF459:
	.string	"tmr_init"
.LASF402:
	.string	"strcasecmp"
.LASF321:
	.string	"re_open_logfile"
.LASF260:
	.string	"conn_state"
.LASF247:
	.string	"periodic"
.LASF368:
	.string	"httpd_err400title"
.LASF434:
	.string	"tmr_create"
.LASF468:
	.string	"fdwatch_check_fd"
.LASF351:
	.string	"logfile"
.LASF404:
	.string	"strcspn"
.LASF377:
	.string	"stats_time"
.LASF3:
	.string	"long unsigned int"
.LASF394:
	.string	"chdir"
.LASF412:
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
.LASF458:
	.string	"sigset"
.LASF437:
	.string	"httpd_realloc_str"
.LASF314:
	.string	"line"
.LASF393:
	.string	"alarm"
.LASF96:
	.string	"_unused2"
.LASF323:
	.string	"handle_newconnect"
.LASF150:
	.string	"ai_family"
.LASF448:
	.string	"freeaddrinfo"
.LASF151:
	.string	"ai_socktype"
.LASF339:
	.string	"linger_clear_connection"
.LASF57:
	.string	"iov_len"
.LASF450:
	.string	"getpid"
.LASF445:
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
.LASF432:
	.string	"tmr_cancel"
.LASF451:
	.string	"strrchr"
.LASF440:
	.string	"httpd_parse_request"
.LASF477:
	.string	"thttpd.c"
.LASF264:
	.string	"started_at"
.LASF55:
	.string	"iovec"
.LASF258:
	.string	"num_sending"
.LASF467:
	.string	"fdwatch"
.LASF74:
	.string	"_IO_write_end"
.LASF181:
	.string	"client_addr"
.LASF361:
	.string	"httpd_conn_count"
.LASF282:
	.string	"hints"
.LASF410:
	.string	"__builtin_puts"
.LASF177:
	.string	"local_pattern"
.LASF234:
	.string	"first_byte_index"
.LASF438:
	.string	"read"
.LASF75:
	.string	"_IO_buf_base"
.LASF2:
	.string	"unsigned int"
.LASF288:
	.string	"handle_hup"
.LASF406:
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
.LASF478:
	.string	"/u/eng/class/classsbk/sthttpd-2.27.0/src"
.LASF217:
	.string	"maxquery"
.LASF95:
	.string	"_mode"
.LASF471:
	.string	"getpwnam"
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
.LASF401:
	.string	"strspn"
.LASF154:
	.string	"ai_addr"
.LASF203:
	.string	"acceptl"
.LASF474:
	.string	"strncmp"
.LASF143:
	.string	"sin6_family"
.LASF442:
	.string	"httpd_ntoa"
.LASF66:
	.string	"FILE"
.LASF15:
	.string	"__pid_t"
.LASF392:
	.string	"tmr_cleanup"
.LASF40:
	.string	"st_dev"
.LASF231:
	.string	"one_one"
.LASF33:
	.string	"timespec"
.LASF106:
	.string	"SOCK_DGRAM"
.LASF436:
	.string	"httpd_send_err"
.LASF176:
	.string	"url_pattern"
.LASF336:
	.string	"coast"
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
.LASF389:
	.string	"gettimeofday"
.LASF157:
	.string	"sa_in"
.LASF117:
	.string	"sa_data"
.LASF261:
	.string	"next_free_connect"
.LASF460:
	.string	"httpd_initialize"
.LASF352:
	.string	"pidfile"
.LASF303:
	.string	"show_stats"
.LASF420:
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
.LASF470:
	.string	"setsid"
.LASF240:
	.string	"httpd_conn"
.LASF411:
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
.LASF415:
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
.LASF413:
	.string	"strstr"
.LASF398:
	.string	"fopen"
.LASF326:
	.string	"shut_down"
.LASF302:
	.string	"stats_secs"
.LASF345:
	.string	"argv0"
.LASF400:
	.string	"strchr"
.LASF190:
	.string	"bytes_sent"
.LASF76:
	.string	"_IO_buf_end"
.LASF461:
	.string	"setgroups"
.LASF341:
	.string	"num_ready"
.LASF430:
	.string	"tmr_destroy"
.LASF281:
	.string	"tind"
.LASF431:
	.string	"closelog"
.LASF136:
	.string	"__in6_u"
.LASF112:
	.string	"SOCK_CLOEXEC"
.LASF296:
	.string	"name"
.LASF418:
	.string	"fcntl"
.LASF382:
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
.LASF253:
	.string	"pattern"
.LASF328:
	.string	"handle_term"
.LASF222:
	.string	"maxremoteuser"
.LASF348:
	.string	"do_chroot"
.LASF32:
	.string	"tv_nsec"
.LASF278:
	.string	"sa6P"
.LASF308:
	.string	"usage"
.LASF384:
	.string	"fdwatch_add_fd"
.LASF416:
	.string	"chmod"
.LASF391:
	.string	"mmc_cleanup"
.LASF86:
	.string	"_vtable_offset"
.LASF330:
	.string	"clear_connection"
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
.LASF409:
	.string	"__isoc99_sscanf"
.LASF201:
	.string	"accept"
.LASF170:
	.string	"listen6_fd"
.LASF358:
	.string	"num_connects"
.LASF211:
	.string	"response"
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
.LASF463:
	.string	"initgroups"
.LASF70:
	.string	"_IO_read_end"
.LASF424:
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
.LASF469:
	.string	"fdwatch_get_next_client_data"
.LASF82:
	.string	"_fileno"
.LASF104:
	.string	"tz_dsttime"
.LASF218:
	.string	"maxaccept"
.LASF287:
	.string	"oerrno"
.LASF388:
	.string	"tmr_logstats"
.LASF427:
	.string	"free"
.LASF456:
	.string	"daemon"
.LASF381:
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
.LASF435:
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
.LASF279:
	.string	"sa6_len"
.LASF342:
	.string	"gotv4"
.LASF343:
	.string	"gotv6"
.LASF175:
	.string	"global_passwd"
.LASF399:
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
.LASF429:
	.string	"mmc_destroy"
.LASF466:
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
.LASF457:
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
.LASF419:
	.string	"httpd_set_logfp"
.LASF191:
	.string	"encodedurl"
	.ident	"GCC: (GNU) 5.2.0"
	.section	.note.GNU-stack,"",@progbits
