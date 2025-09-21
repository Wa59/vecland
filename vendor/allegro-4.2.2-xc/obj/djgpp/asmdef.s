	.file	"asmdef.c"
	.section .text
	.globl	_install_allegro
_install_allegro:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	pushl	$262658
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	__install_allegro_version_check
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_set_window_title
_set_window_title:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	_system_driver, %eax
	movl	32(%eax), %eax
	testl	%eax, %eax
	je	L3
	movl	_system_driver, %eax
	movl	32(%eax), %eax
	subl	$12, %esp
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
L3:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_desktop_color_depth
_desktop_color_depth:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	_system_driver, %eax
	movl	96(%eax), %eax
	testl	%eax, %eax
	je	L6
	movl	_system_driver, %eax
	movl	96(%eax), %eax
	call	*%eax
	jmp	L7
L6:
	movl	$0, %eax
L7:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_get_desktop_resolution
_get_desktop_resolution:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	_system_driver, %eax
	movl	100(%eax), %eax
	testl	%eax, %eax
	je	L9
	movl	_system_driver, %eax
	movl	100(%eax), %eax
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	jmp	L10
L9:
	movl	$-1, %eax
L10:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__default_ds
__default_ds:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
/APP
# 28 "./include/allegro/platform/al386gcc.h" 1
	  movw %ds, %ax 
# 0 "" 2
/NO_APP
	movw	%ax, -2(%ebp)
	movswl	-2(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_bmp_write_line
_bmp_write_line:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	32(%eax), %ecx
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
/APP
# 46 "./include/allegro/platform/al386gcc.h" 1
	  call *%ecx 
# 0 "" 2
/NO_APP
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_bmp_read_line
_bmp_read_line:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	36(%eax), %ecx
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
/APP
# 68 "./include/allegro/platform/al386gcc.h" 1
	  call *%ecx 
# 0 "" 2
/NO_APP
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_bmp_unwrite_line
_bmp_unwrite_line:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	8(%eax), %ecx
	movl	8(%ebp), %eax
	movl	%eax, %edx
/APP
# 90 "./include/allegro/platform/al386gcc.h" 1
	  call *%ecx 
# 0 "" 2
/NO_APP
	popl	%ebp
	ret
	.globl	_is_windowed_mode
_is_windowed_mode:
	pushl	%ebp
	movl	%esp, %ebp
	movl	_gfx_driver, %eax
	movl	136(%eax), %eax
	popl	%ebp
	ret
	.globl	_clear_to_color
_clear_to_color:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	160(%eax), %eax
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_bitmap_color_depth
_bitmap_color_depth:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	(%eax), %eax
	popl	%ebp
	ret
	.globl	_bitmap_mask_color
_bitmap_mask_color:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	4(%eax), %eax
	popl	%ebp
	ret
	.globl	_is_same_bitmap
_is_same_bitmap:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	cmpl	$0, 8(%ebp)
	je	L26
	cmpl	$0, 12(%ebp)
	jne	L27
L26:
	movl	$0, %eax
	jmp	L28
L27:
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jne	L29
	movl	$-1, %eax
	jmp	L28
L29:
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	andl	$33554431, %eax
	movl	%eax, -4(%ebp)
	movl	12(%ebp), %eax
	movl	44(%eax), %eax
	andl	$33554431, %eax
	movl	%eax, -8(%ebp)
	cmpl	$0, -4(%ebp)
	je	L30
	movl	-4(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jne	L30
	movl	$1, %eax
	jmp	L28
L30:
	movl	$0, %eax
L28:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_is_linear_bitmap
_is_linear_bitmap:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	andl	$268435456, %eax
	testl	%eax, %eax
	sete	%al
	andl	$255, %eax
	popl	%ebp
	ret
	.globl	_is_planar_bitmap
_is_planar_bitmap:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	andl	$268435456, %eax
	testl	%eax, %eax
	setne	%al
	andl	$255, %eax
	popl	%ebp
	ret
	.globl	_is_memory_bitmap
_is_memory_bitmap:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	cmpl	$1073741823, %eax
	setbe	%al
	andl	$255, %eax
	popl	%ebp
	ret
	.globl	_is_screen_bitmap
_is_screen_bitmap:
	pushl	%ebp
	movl	%esp, %ebp
	movl	_screen, %eax
	pushl	%eax
	pushl	8(%ebp)
	call	_is_same_bitmap
	addl	$8, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_is_video_bitmap
_is_video_bitmap:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	shrl	$31, %eax
	andl	$255, %eax
	popl	%ebp
	ret
	.globl	_is_system_bitmap
_is_system_bitmap:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	andl	$1073741824, %eax
	testl	%eax, %eax
	setne	%al
	andl	$255, %eax
	popl	%ebp
	ret
	.globl	_is_sub_bitmap
_is_sub_bitmap:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	andl	$536870912, %eax
	testl	%eax, %eax
	setne	%al
	andl	$255, %eax
	popl	%ebp
	ret
	.globl	_acquire_bitmap
_acquire_bitmap:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	je	L46
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	16(%eax), %eax
	subl	$12, %esp
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
L46:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_release_bitmap
_release_bitmap:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	je	L48
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	20(%eax), %eax
	subl	$12, %esp
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
L48:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_acquire_screen
_acquire_screen:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	_screen, %eax
	subl	$12, %esp
	pushl	%eax
	call	_acquire_bitmap
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_release_screen
_release_screen:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	_screen, %eax
	subl	$12, %esp
	pushl	%eax
	call	_release_bitmap
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_is_inside_bitmap
_is_inside_bitmap:
	pushl	%ebp
	movl	%esp, %ebp
	cmpl	$0, 20(%ebp)
	je	L53
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	je	L54
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	%eax, 12(%ebp)
	jl	L55
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	cmpl	%eax, 16(%ebp)
	jl	L55
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	cmpl	%eax, 12(%ebp)
	jge	L55
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	cmpl	%eax, 16(%ebp)
	jge	L55
	movl	$1, %eax
	jmp	L57
L55:
	movl	$0, %eax
	jmp	L57
L54:
	movl	$-1, %eax
	jmp	L57
L53:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	12(%ebp), %edx
	cmpl	%eax, %edx
	jnb	L58
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	16(%ebp), %edx
	cmpl	%eax, %edx
	jnb	L58
	movl	$1, %eax
	jmp	L57
L58:
	movl	$0, %eax
L57:
	popl	%ebp
	ret
	.globl	_get_clip_rect
_get_clip_rect:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	12(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	20(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	leal	-1(%eax), %edx
	movl	24(%ebp), %eax
	movl	%edx, (%eax)
	popl	%ebp
	ret
	.globl	_set_clip_state
_set_clip_state:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%eax)
	popl	%ebp
	ret
	.globl	_get_clip_state
_get_clip_state:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	popl	%ebp
	ret
	.globl	_makecol15
_makecol15:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	8(%ebp), %eax
	sarl	$3, %eax
	movl	%eax, %edx
	movl	__rgb_r_shift_15, %eax
	movb	%al, %cl
	sall	%cl, %edx
	movl	12(%ebp), %eax
	sarl	$3, %eax
	movl	%eax, %ebx
	movl	__rgb_g_shift_15, %eax
	movb	%al, %cl
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%eax, %edx
	movl	16(%ebp), %eax
	sarl	$3, %eax
	movl	%eax, %ebx
	movl	__rgb_b_shift_15, %eax
	movb	%al, %cl
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%edx, %eax
	popl	%ebx
	popl	%ebp
	ret
	.globl	_makecol16
_makecol16:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	8(%ebp), %eax
	sarl	$3, %eax
	movl	%eax, %edx
	movl	__rgb_r_shift_16, %eax
	movb	%al, %cl
	sall	%cl, %edx
	movl	12(%ebp), %eax
	sarl	$2, %eax
	movl	%eax, %ebx
	movl	__rgb_g_shift_16, %eax
	movb	%al, %cl
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%eax, %edx
	movl	16(%ebp), %eax
	sarl	$3, %eax
	movl	%eax, %ebx
	movl	__rgb_b_shift_16, %eax
	movb	%al, %cl
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%edx, %eax
	popl	%ebx
	popl	%ebp
	ret
	.globl	_makecol24
_makecol24:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	__rgb_r_shift_24, %eax
	movl	8(%ebp), %edx
	movl	%edx, %ebx
	movb	%al, %cl
	sall	%cl, %ebx
	movl	__rgb_g_shift_24, %eax
	movl	12(%ebp), %edx
	movb	%al, %cl
	sall	%cl, %edx
	movl	%edx, %eax
	orl	%eax, %ebx
	movl	__rgb_b_shift_24, %eax
	movl	16(%ebp), %edx
	movb	%al, %cl
	sall	%cl, %edx
	movl	%edx, %eax
	orl	%ebx, %eax
	popl	%ebx
	popl	%ebp
	ret
	.globl	_makecol32
_makecol32:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	__rgb_r_shift_32, %eax
	movl	8(%ebp), %edx
	movl	%edx, %ebx
	movb	%al, %cl
	sall	%cl, %ebx
	movl	__rgb_g_shift_32, %eax
	movl	12(%ebp), %edx
	movb	%al, %cl
	sall	%cl, %edx
	movl	%edx, %eax
	orl	%eax, %ebx
	movl	__rgb_b_shift_32, %eax
	movl	16(%ebp), %edx
	movb	%al, %cl
	sall	%cl, %edx
	movl	%edx, %eax
	orl	%ebx, %eax
	popl	%ebx
	popl	%ebp
	ret
	.globl	_makeacol32
_makeacol32:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	__rgb_r_shift_32, %eax
	movl	8(%ebp), %edx
	movl	%edx, %ebx
	movb	%al, %cl
	sall	%cl, %ebx
	movl	__rgb_g_shift_32, %eax
	movl	12(%ebp), %edx
	movb	%al, %cl
	sall	%cl, %edx
	movl	%edx, %eax
	orl	%eax, %ebx
	movl	__rgb_b_shift_32, %eax
	movl	16(%ebp), %edx
	movb	%al, %cl
	sall	%cl, %edx
	movl	%edx, %eax
	orl	%eax, %ebx
	movl	__rgb_a_shift_32, %eax
	movl	20(%ebp), %edx
	movb	%al, %cl
	sall	%cl, %edx
	movl	%edx, %eax
	orl	%ebx, %eax
	popl	%ebx
	popl	%ebp
	ret
	.globl	_getr8
_getr8:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movb	__current_palette(,%eax,4), %al
	andl	$255, %eax
	movl	__rgb_scale_6(,%eax,4), %eax
	popl	%ebp
	ret
	.globl	_getg8
_getg8:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movb	__current_palette+1(,%eax,4), %al
	andl	$255, %eax
	movl	__rgb_scale_6(,%eax,4), %eax
	popl	%ebp
	ret
	.globl	_getb8
_getb8:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movb	__current_palette+2(,%eax,4), %al
	andl	$255, %eax
	movl	__rgb_scale_6(,%eax,4), %eax
	popl	%ebp
	ret
	.globl	_getr15
_getr15:
	pushl	%ebp
	movl	%esp, %ebp
	movl	__rgb_r_shift_15, %eax
	movl	8(%ebp), %edx
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$31, %eax
	movl	__rgb_scale_5(,%eax,4), %eax
	popl	%ebp
	ret
	.globl	_getg15
_getg15:
	pushl	%ebp
	movl	%esp, %ebp
	movl	__rgb_g_shift_15, %eax
	movl	8(%ebp), %edx
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$31, %eax
	movl	__rgb_scale_5(,%eax,4), %eax
	popl	%ebp
	ret
	.globl	_getb15
_getb15:
	pushl	%ebp
	movl	%esp, %ebp
	movl	__rgb_b_shift_15, %eax
	movl	8(%ebp), %edx
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$31, %eax
	movl	__rgb_scale_5(,%eax,4), %eax
	popl	%ebp
	ret
	.globl	_getr16
_getr16:
	pushl	%ebp
	movl	%esp, %ebp
	movl	__rgb_r_shift_16, %eax
	movl	8(%ebp), %edx
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$31, %eax
	movl	__rgb_scale_5(,%eax,4), %eax
	popl	%ebp
	ret
	.globl	_getg16
_getg16:
	pushl	%ebp
	movl	%esp, %ebp
	movl	__rgb_g_shift_16, %eax
	movl	8(%ebp), %edx
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$63, %eax
	movl	__rgb_scale_6(,%eax,4), %eax
	popl	%ebp
	ret
	.globl	_getb16
_getb16:
	pushl	%ebp
	movl	%esp, %ebp
	movl	__rgb_b_shift_16, %eax
	movl	8(%ebp), %edx
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$31, %eax
	movl	__rgb_scale_5(,%eax,4), %eax
	popl	%ebp
	ret
	.globl	_getr24
_getr24:
	pushl	%ebp
	movl	%esp, %ebp
	movl	__rgb_r_shift_24, %eax
	movl	8(%ebp), %edx
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$255, %eax
	popl	%ebp
	ret
	.globl	_getg24
_getg24:
	pushl	%ebp
	movl	%esp, %ebp
	movl	__rgb_g_shift_24, %eax
	movl	8(%ebp), %edx
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$255, %eax
	popl	%ebp
	ret
	.globl	_getb24
_getb24:
	pushl	%ebp
	movl	%esp, %ebp
	movl	__rgb_b_shift_24, %eax
	movl	8(%ebp), %edx
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$255, %eax
	popl	%ebp
	ret
	.globl	_getr32
_getr32:
	pushl	%ebp
	movl	%esp, %ebp
	movl	__rgb_r_shift_32, %eax
	movl	8(%ebp), %edx
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$255, %eax
	popl	%ebp
	ret
	.globl	_getg32
_getg32:
	pushl	%ebp
	movl	%esp, %ebp
	movl	__rgb_g_shift_32, %eax
	movl	8(%ebp), %edx
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$255, %eax
	popl	%ebp
	ret
	.globl	_getb32
_getb32:
	pushl	%ebp
	movl	%esp, %ebp
	movl	__rgb_b_shift_32, %eax
	movl	8(%ebp), %edx
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$255, %eax
	popl	%ebp
	ret
	.globl	_geta32
_geta32:
	pushl	%ebp
	movl	%esp, %ebp
	movl	__rgb_a_shift_32, %eax
	movl	8(%ebp), %edx
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$255, %eax
	popl	%ebp
	ret
	.globl	_getpixel
_getpixel:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	32(%eax), %eax
	subl	$4, %esp
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_putpixel
_putpixel:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	36(%eax), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__allegro_vline
__allegro_vline:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	40(%eax), %eax
	subl	$12, %esp
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__allegro_hline
__allegro_hline:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	44(%eax), %eax
	subl	$12, %esp
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_line
_line:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	52(%eax), %eax
	subl	$8, %esp
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_fastline
_fastline:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	56(%eax), %eax
	subl	$8, %esp
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_rectfill
_rectfill:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	60(%eax), %eax
	subl	$8, %esp
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_triangle
_triangle:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	64(%eax), %eax
	pushl	36(%ebp)
	pushl	32(%ebp)
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_polygon
_polygon:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	184(%eax), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_rect
_rect:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	188(%eax), %eax
	subl	$8, %esp
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_circle
_circle:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	192(%eax), %eax
	subl	$12, %esp
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_circlefill
_circlefill:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	196(%eax), %eax
	subl	$12, %esp
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_ellipse
_ellipse:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	200(%eax), %eax
	subl	$8, %esp
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_ellipsefill
_ellipsefill:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	204(%eax), %eax
	subl	$8, %esp
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_arc
_arc:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	208(%eax), %eax
	subl	$4, %esp
	pushl	32(%ebp)
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_spline
_spline:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	212(%eax), %eax
	subl	$4, %esp
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_floodfill
_floodfill:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	216(%eax), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_polygon3d
_polygon3d:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	220(%eax), %eax
	subl	$12, %esp
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_polygon3d_f
_polygon3d_f:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	224(%eax), %eax
	subl	$12, %esp
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_triangle3d
_triangle3d:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	228(%eax), %eax
	subl	$8, %esp
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_triangle3d_f
_triangle3d_f:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	232(%eax), %eax
	subl	$8, %esp
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_quad3d
_quad3d:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	236(%eax), %eax
	subl	$4, %esp
	pushl	32(%ebp)
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_quad3d_f
_quad3d_f:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	240(%eax), %eax
	subl	$4, %esp
	pushl	32(%ebp)
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_draw_sprite
_draw_sprite:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	12(%ebp), %eax
	movl	28(%eax), %eax
	movl	(%eax), %eax
	cmpl	$8, %eax
	jne	L131
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	72(%eax), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	jmp	L130
L131:
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	68(%eax), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
L130:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_draw_sprite_v_flip
_draw_sprite_v_flip:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	76(%eax), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_draw_sprite_h_flip
_draw_sprite_h_flip:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	80(%eax), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_draw_sprite_vh_flip
_draw_sprite_vh_flip:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	84(%eax), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_draw_trans_sprite
_draw_trans_sprite:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	12(%ebp), %eax
	movl	28(%eax), %eax
	movl	(%eax), %eax
	cmpl	$32, %eax
	jne	L137
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	92(%eax), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	jmp	L136
L137:
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	88(%eax), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
L136:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_draw_lit_sprite
_draw_lit_sprite:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	96(%eax), %eax
	subl	$12, %esp
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_draw_gouraud_sprite
_draw_gouraud_sprite:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	172(%eax), %eax
	pushl	36(%ebp)
	pushl	32(%ebp)
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_draw_character_ex
_draw_character_ex:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	116(%eax), %eax
	subl	$8, %esp
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_rotate_sprite
_rotate_sprite:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	164(%eax), %eax
	movl	12(%ebp), %edx
	movl	4(%edx), %edx
	movl	%edx, %esi
	sall	$15, %esi
	movl	12(%ebp), %edx
	movl	(%edx), %edx
	movl	%edx, %ebx
	sall	$15, %ebx
	movl	20(%ebp), %edx
	movl	%edx, %ecx
	sall	$16, %ecx
	movl	12(%ebp), %edx
	movl	4(%edx), %edx
	sall	$15, %edx
	addl	%edx, %ecx
	movl	16(%ebp), %edx
	movl	%edx, %edi
	sall	$16, %edi
	movl	12(%ebp), %edx
	movl	(%edx), %edx
	sall	$15, %edx
	addl	%edi, %edx
	subl	$12, %esp
	pushl	$0
	pushl	$65536
	pushl	24(%ebp)
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$48, %esp
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.globl	_rotate_sprite_v_flip
_rotate_sprite_v_flip:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	164(%eax), %eax
	movl	12(%ebp), %edx
	movl	4(%edx), %edx
	movl	%edx, %esi
	sall	$15, %esi
	movl	12(%ebp), %edx
	movl	(%edx), %edx
	movl	%edx, %ebx
	sall	$15, %ebx
	movl	20(%ebp), %edx
	movl	%edx, %ecx
	sall	$16, %ecx
	movl	12(%ebp), %edx
	movl	4(%edx), %edx
	sall	$15, %edx
	addl	%edx, %ecx
	movl	16(%ebp), %edx
	movl	%edx, %edi
	sall	$16, %edi
	movl	12(%ebp), %edx
	movl	(%edx), %edx
	sall	$15, %edx
	addl	%edi, %edx
	subl	$12, %esp
	pushl	$-1
	pushl	$65536
	pushl	24(%ebp)
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$48, %esp
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.globl	_rotate_scaled_sprite
_rotate_scaled_sprite:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	164(%eax), %eax
	movl	%eax, -28(%ebp)
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	sall	$15, %eax
	movl	%eax, %edi
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	sall	$15, %eax
	movl	%eax, %esi
	movl	20(%ebp), %eax
	sall	$16, %eax
	movl	%eax, %ecx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	imull	28(%ebp), %eax
	movl	%eax, %ebx
	shrl	$31, %ebx
	addl	%ebx, %eax
	sarl	%eax
	addl	%eax, %ecx
	movl	16(%ebp), %eax
	sall	$16, %eax
	movl	%eax, %ebx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	imull	28(%ebp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ebx, %eax
	subl	$12, %esp
	pushl	$0
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	%edi
	pushl	%esi
	pushl	%ecx
	pushl	%eax
	pushl	12(%ebp)
	pushl	8(%ebp)
	movl	-28(%ebp), %eax
	call	*%eax
	addl	$48, %esp
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.globl	_rotate_scaled_sprite_v_flip
_rotate_scaled_sprite_v_flip:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	164(%eax), %eax
	movl	%eax, -28(%ebp)
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	sall	$15, %eax
	movl	%eax, %edi
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	sall	$15, %eax
	movl	%eax, %esi
	movl	20(%ebp), %eax
	sall	$16, %eax
	movl	%eax, %ecx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	imull	28(%ebp), %eax
	movl	%eax, %ebx
	shrl	$31, %ebx
	addl	%ebx, %eax
	sarl	%eax
	addl	%eax, %ecx
	movl	16(%ebp), %eax
	sall	$16, %eax
	movl	%eax, %ebx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	imull	28(%ebp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ebx, %eax
	subl	$12, %esp
	pushl	$-1
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	%edi
	pushl	%esi
	pushl	%ecx
	pushl	%eax
	pushl	12(%ebp)
	pushl	8(%ebp)
	movl	-28(%ebp), %eax
	call	*%eax
	addl	$48, %esp
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.globl	_pivot_sprite
_pivot_sprite:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	164(%eax), %eax
	movl	28(%ebp), %edx
	movl	%edx, %esi
	sall	$16, %esi
	movl	24(%ebp), %edx
	movl	%edx, %ebx
	sall	$16, %ebx
	movl	20(%ebp), %edx
	movl	%edx, %ecx
	sall	$16, %ecx
	movl	16(%ebp), %edx
	sall	$16, %edx
	subl	$12, %esp
	pushl	$0
	pushl	$65536
	pushl	32(%ebp)
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$48, %esp
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.globl	_pivot_sprite_v_flip
_pivot_sprite_v_flip:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	164(%eax), %eax
	movl	28(%ebp), %edx
	movl	%edx, %esi
	sall	$16, %esi
	movl	24(%ebp), %edx
	movl	%edx, %ebx
	sall	$16, %ebx
	movl	20(%ebp), %edx
	movl	%edx, %ecx
	sall	$16, %ecx
	movl	16(%ebp), %edx
	sall	$16, %edx
	subl	$12, %esp
	pushl	$-1
	pushl	$65536
	pushl	32(%ebp)
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$48, %esp
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.globl	_pivot_scaled_sprite
_pivot_scaled_sprite:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	164(%eax), %eax
	movl	28(%ebp), %edx
	movl	%edx, %esi
	sall	$16, %esi
	movl	24(%ebp), %edx
	movl	%edx, %ebx
	sall	$16, %ebx
	movl	20(%ebp), %edx
	movl	%edx, %ecx
	sall	$16, %ecx
	movl	16(%ebp), %edx
	sall	$16, %edx
	subl	$12, %esp
	pushl	$0
	pushl	36(%ebp)
	pushl	32(%ebp)
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$48, %esp
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.globl	_pivot_scaled_sprite_v_flip
_pivot_scaled_sprite_v_flip:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	164(%eax), %eax
	movl	28(%ebp), %edx
	movl	%edx, %esi
	sall	$16, %esi
	movl	24(%ebp), %edx
	movl	%edx, %ebx
	sall	$16, %ebx
	movl	20(%ebp), %edx
	movl	%edx, %ecx
	sall	$16, %ecx
	movl	16(%ebp), %edx
	sall	$16, %edx
	subl	$12, %esp
	pushl	$-1
	pushl	36(%ebp)
	pushl	32(%ebp)
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$48, %esp
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.globl	__putpixel
__putpixel:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	andl	$65535, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farsetsel
	addl	$16, %esp
	subl	$8, %esp
	pushl	16(%ebp)
	pushl	8(%ebp)
	call	_bmp_write_line
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	movl	20(%ebp), %eax
	andl	$255, %eax
	movl	12(%ebp), %ecx
	movl	-12(%ebp), %edx
	addl	%ecx, %edx
	subl	$8, %esp
	pushl	%eax
	pushl	%edx
	call	__farnspokeb
	addl	$16, %esp
	subl	$12, %esp
	pushl	8(%ebp)
	call	_bmp_unwrite_line
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__getpixel
__getpixel:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	andl	$65535, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farsetsel
	addl	$16, %esp
	subl	$8, %esp
	pushl	16(%ebp)
	pushl	8(%ebp)
	call	_bmp_read_line
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	movl	12(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farnspeekb
	addl	$16, %esp
	andl	$255, %eax
	movl	%eax, -16(%ebp)
	subl	$12, %esp
	pushl	8(%ebp)
	call	_bmp_unwrite_line
	addl	$16, %esp
	movl	-16(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__putpixel15
__putpixel15:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	andl	$65535, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farsetsel
	addl	$16, %esp
	subl	$8, %esp
	pushl	16(%ebp)
	pushl	8(%ebp)
	call	_bmp_write_line
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	movl	20(%ebp), %eax
	andl	$65535, %eax
	movl	12(%ebp), %edx
	leal	(%edx,%edx), %ecx
	movl	-12(%ebp), %edx
	addl	%ecx, %edx
	subl	$8, %esp
	pushl	%eax
	pushl	%edx
	call	__farnspokew
	addl	$16, %esp
	subl	$12, %esp
	pushl	8(%ebp)
	call	_bmp_unwrite_line
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__getpixel15
__getpixel15:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	andl	$65535, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farsetsel
	addl	$16, %esp
	subl	$8, %esp
	pushl	16(%ebp)
	pushl	8(%ebp)
	call	_bmp_read_line
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	movl	12(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farnspeekw
	addl	$16, %esp
	andl	$65535, %eax
	movl	%eax, -16(%ebp)
	subl	$12, %esp
	pushl	8(%ebp)
	call	_bmp_unwrite_line
	addl	$16, %esp
	movl	-16(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__putpixel16
__putpixel16:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	andl	$65535, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farsetsel
	addl	$16, %esp
	subl	$8, %esp
	pushl	16(%ebp)
	pushl	8(%ebp)
	call	_bmp_write_line
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	movl	20(%ebp), %eax
	andl	$65535, %eax
	movl	12(%ebp), %edx
	leal	(%edx,%edx), %ecx
	movl	-12(%ebp), %edx
	addl	%ecx, %edx
	subl	$8, %esp
	pushl	%eax
	pushl	%edx
	call	__farnspokew
	addl	$16, %esp
	subl	$12, %esp
	pushl	8(%ebp)
	call	_bmp_unwrite_line
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__getpixel16
__getpixel16:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	andl	$65535, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farsetsel
	addl	$16, %esp
	subl	$8, %esp
	pushl	16(%ebp)
	pushl	8(%ebp)
	call	_bmp_read_line
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	movl	12(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farnspeekw
	addl	$16, %esp
	andl	$65535, %eax
	movl	%eax, -16(%ebp)
	subl	$12, %esp
	pushl	8(%ebp)
	call	_bmp_unwrite_line
	addl	$16, %esp
	movl	-16(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__putpixel24
__putpixel24:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	andl	$65535, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farsetsel
	addl	$16, %esp
	subl	$8, %esp
	pushl	16(%ebp)
	pushl	8(%ebp)
	call	_bmp_write_line
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	movl	20(%ebp), %eax
	xorl	%edx, %edx
	movw	%ax, %dx
	movl	12(%ebp), %ecx
	movl	%ecx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	movl	-12(%ebp), %eax
	addl	%ecx, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	__farnspokew
	addl	$16, %esp
	movl	20(%ebp), %eax
	sarl	$16, %eax
	xorl	%edx, %edx
	movb	%al, %dl
	movl	12(%ebp), %ecx
	movl	%ecx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	movl	-12(%ebp), %eax
	addl	%ecx, %eax
	addl	$2, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	__farnspokeb
	addl	$16, %esp
	subl	$12, %esp
	pushl	8(%ebp)
	call	_bmp_unwrite_line
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__getpixel24
__getpixel24:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	andl	$65535, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farsetsel
	addl	$16, %esp
	subl	$8, %esp
	pushl	16(%ebp)
	pushl	8(%ebp)
	call	_bmp_read_line
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	movl	12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farnspeekl
	addl	$16, %esp
	andl	$16777215, %eax
	movl	%eax, -16(%ebp)
	subl	$12, %esp
	pushl	8(%ebp)
	call	_bmp_unwrite_line
	addl	$16, %esp
	movl	-16(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__putpixel32
__putpixel32:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	andl	$65535, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farsetsel
	addl	$16, %esp
	subl	$8, %esp
	pushl	16(%ebp)
	pushl	8(%ebp)
	call	_bmp_write_line
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	movl	20(%ebp), %eax
	movl	12(%ebp), %edx
	leal	0(,%edx,4), %ecx
	movl	-12(%ebp), %edx
	addl	%ecx, %edx
	subl	$8, %esp
	pushl	%eax
	pushl	%edx
	call	__farnspokel
	addl	$16, %esp
	subl	$12, %esp
	pushl	8(%ebp)
	call	_bmp_unwrite_line
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__getpixel32
__getpixel32:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	andl	$65535, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farsetsel
	addl	$16, %esp
	subl	$8, %esp
	pushl	16(%ebp)
	pushl	8(%ebp)
	call	_bmp_read_line
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	movl	12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	subl	$12, %esp
	pushl	%eax
	call	__farnspeekl
	addl	$16, %esp
	movl	%eax, -16(%ebp)
	subl	$12, %esp
	pushl	8(%ebp)
	call	_bmp_unwrite_line
	addl	$16, %esp
	movl	-16(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_draw_rle_sprite
_draw_rle_sprite:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	100(%eax), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_draw_trans_rle_sprite
_draw_trans_rle_sprite:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$32, %eax
	jne	L167
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	108(%eax), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	jmp	L166
L167:
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	104(%eax), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
L166:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_draw_lit_rle_sprite
_draw_lit_rle_sprite:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	112(%eax), %eax
	subl	$12, %esp
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_fixadd
_fixadd:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
/APP
# 133 "./include/allegro/platform/al386gcc.h" 1
	  addl 12(%ebp), %eax ;   jno 0f ;   movl _allegro_errno, %eax ;   movl $2, (%eax) ;   movl $0x7FFFFFFF, %eax ;   cmpl $0, 12(%ebp) ;   jg 0f ;   negl %eax ;  0: 
# 0 "" 2
/NO_APP
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_fixsub
_fixsub:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
/APP
# 171 "./include/allegro/platform/al386gcc.h" 1
	  subl 12(%ebp), %eax ;   jno 0f ;   movl _allegro_errno, %eax ;   movl $2, (%eax) ;   movl $0x7FFFFFFF, %eax ;   cmpl $0, 12(%ebp) ;   jl 0f ;   negl %eax ;  0: 
# 0 "" 2
/NO_APP
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_fixmul
_fixmul:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
/APP
# 209 "./include/allegro/platform/al386gcc.h" 1
	  movl 8(%ebp), %eax ;   imull 12(%ebp) ;   shrdl $16, %edx, %eax ;   sarl $15, %edx ;   jz 0f ;   cmpl $-1, %edx ;   je 0f ;   movl _allegro_errno, %eax ;   movl $2, (%eax) ;   movl $0x7FFFFFFF, %eax ;   cmpl $0, 8(%ebp) ;   jge 1f ;   negl %eax ;  1:   cmpl $0, 12(%ebp) ;   jge 0f ;   negl %eax ;   .balign 4, 0x90 ;  0: 
# 0 "" 2
/NO_APP
	movl	%eax, -4(%ebp)
	movl	%edx, -8(%ebp)
	movl	-4(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_fixdiv
_fixdiv:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, %ecx
/APP
# 261 "./include/allegro/platform/al386gcc.h" 1
	  testl %eax, %eax ;   js 3f ;   testl %ecx, %ecx ;   jns 4f ;   negl %ecx ;  0:   movl %eax, %edx ;   shrl $16, %edx ;   shll $16, %eax ;   cmpl %ecx, %edx ;   jae 1f ;   divl %ecx ;   testl %eax, %eax ;   jns 2f ;  1:   movl _allegro_errno, %eax ;   movl $2, (%eax) ;   movl $0x7FFFFFFF, %eax ;  2:   negl %eax ;   jmp 6f ;   .balign 4, 0x90 ;  3:   negl %eax ;   testl %ecx, %ecx ;   jns 0b ;   negl %ecx ;  4:   movl %eax, %edx ;   shrl $16, %edx ;   shll $16, %eax ;   cmpl %ecx, %edx ;   jae 5f ;   divl %ecx ;   testl %eax, %eax ;   jns 6f ;  5:   movl _allegro_errno, %eax ;   movl $2, (%eax) ;   movl $0x7FFFFFFF, %eax ;  6: 
# 0 "" 2
/NO_APP
	movl	%eax, -4(%ebp)
	movl	%edx, -8(%ebp)
	movl	%ecx, -12(%ebp)
	movl	-4(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_fixfloor
_fixfloor:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
/APP
# 345 "./include/allegro/platform/al386gcc.h" 1
	 sarl $16, %eax 
# 0 "" 2
/NO_APP
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_fixceil
_fixceil:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
/APP
# 366 "./include/allegro/platform/al386gcc.h" 1
	 addl $0xFFFF, %eax ; jns 0f ; jo 1f ;0: sarl $16, %eax ; jmp 2f ;1: movl _allegro_errno, %eax ; movl $2, (%eax) ; movl $0x7FFF, %eax ;2:
# 0 "" 2
/NO_APP
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_ftofix
_ftofix:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	%eax, -8(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -4(%ebp)
	fldl	-8(%ebp)
	fcompl	LC0
	fnstsw	%ax
	testb	$69, %ah
	jne	L194
	movl	_allegro_errno, %eax
	movl	$2, (%eax)
	movl	$2147483647, %eax
	jmp	L185
L194:
	fldl	-8(%ebp)
	fldl	LC1
	fcompp
	fnstsw	%ax
	testb	$69, %ah
	jne	L195
	movl	_allegro_errno, %eax
	movl	$2, (%eax)
	movl	$-2147483647, %eax
	jmp	L185
L195:
	fldl	-8(%ebp)
	fldl	LC2
	fmulp	%st, %st(1)
	fldz
	fcompl	-8(%ebp)
	fnstsw	%ax
	testb	$69, %ah
	jne	L196
	fldl	LC4
	jmp	L190
L196:
	fldl	LC5
L190:
	faddp	%st, %st(1)
	fnstcw	-10(%ebp)
	movw	-10(%ebp), %ax
	orb	$12, %ah
	movw	%ax, -12(%ebp)
	fldcw	-12(%ebp)
	fistpl	-16(%ebp)
	fldcw	-10(%ebp)
	movl	-16(%ebp), %eax
L185:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_fixtof
_fixtof:
	pushl	%ebp
	movl	%esp, %ebp
	fildl	8(%ebp)
	fldl	LC2
	fdivrp	%st, %st(1)
	popl	%ebp
	ret
	.globl	_itofix
_itofix:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	sall	$16, %eax
	popl	%ebp
	ret
	.globl	_fixtoi
_fixtoi:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	8(%ebp)
	call	_fixfloor
	addl	$4, %esp
	movl	8(%ebp), %edx
	sarl	$15, %edx
	andl	$1, %edx
	addl	%edx, %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_fixcos
_fixcos:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	addl	$16384, %eax
	sarl	$15, %eax
	andl	$511, %eax
	movl	__cos_tbl(,%eax,4), %eax
	popl	%ebp
	ret
	.globl	_fixsin
_fixsin:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	subl	$4177920, %eax
	sarl	$15, %eax
	andl	$511, %eax
	movl	__cos_tbl(,%eax,4), %eax
	popl	%ebp
	ret
	.globl	_fixtan
_fixtan:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	addl	$16384, %eax
	sarl	$15, %eax
	andl	$255, %eax
	movl	__tan_tbl(,%eax,4), %eax
	popl	%ebp
	ret
	.globl	_fixacos
_fixacos:
	pushl	%ebp
	movl	%esp, %ebp
	cmpl	$-65536, 8(%ebp)
	jl	L210
	cmpl	$65536, 8(%ebp)
	jle	L211
L210:
	movl	_allegro_errno, %eax
	movl	$1, (%eax)
	movl	$0, %eax
	jmp	L212
L211:
	movl	8(%ebp), %eax
	addl	$65663, %eax
	sarl	$8, %eax
	movl	__acos_tbl(,%eax,4), %eax
L212:
	popl	%ebp
	ret
	.globl	_fixasin
_fixasin:
	pushl	%ebp
	movl	%esp, %ebp
	cmpl	$-65536, 8(%ebp)
	jl	L214
	cmpl	$65536, 8(%ebp)
	jle	L215
L214:
	movl	_allegro_errno, %eax
	movl	$1, (%eax)
	movl	$0, %edx
	jmp	L216
L215:
	movl	8(%ebp), %eax
	addl	$65663, %eax
	sarl	$8, %eax
	movl	__acos_tbl(,%eax,4), %eax
	movl	$4194304, %edx
	subl	%eax, %edx
L216:
	movl	%edx, %eax
	popl	%ebp
	ret
	.globl	_apply_matrix
_apply_matrix:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	pushl	%eax
	pushl	12(%ebp)
	call	_fixmul
	addl	$8, %esp
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	pushl	%eax
	pushl	16(%ebp)
	call	_fixmul
	addl	$8, %esp
	addl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	pushl	%eax
	pushl	20(%ebp)
	call	_fixmul
	addl	$8, %esp
	leal	(%ebx,%eax), %edx
	movl	8(%ebp), %eax
	movl	36(%eax), %eax
	addl	%eax, %edx
	movl	24(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	pushl	%eax
	pushl	12(%ebp)
	call	_fixmul
	addl	$8, %esp
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	pushl	%eax
	pushl	16(%ebp)
	call	_fixmul
	addl	$8, %esp
	addl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	pushl	%eax
	pushl	20(%ebp)
	call	_fixmul
	addl	$8, %esp
	leal	(%ebx,%eax), %edx
	movl	8(%ebp), %eax
	movl	40(%eax), %eax
	addl	%eax, %edx
	movl	28(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	pushl	%eax
	pushl	12(%ebp)
	call	_fixmul
	addl	$8, %esp
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	pushl	%eax
	pushl	16(%ebp)
	call	_fixmul
	addl	$8, %esp
	addl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	32(%eax), %eax
	pushl	%eax
	pushl	20(%ebp)
	call	_fixmul
	addl	$8, %esp
	leal	(%ebx,%eax), %edx
	movl	8(%ebp), %eax
	movl	44(%eax), %eax
	addl	%eax, %edx
	movl	32(%ebp), %eax
	movl	%edx, (%eax)
	movl	-4(%ebp), %ebx
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_dot_product
_dot_product:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	20(%ebp)
	pushl	8(%ebp)
	call	_fixmul
	addl	$8, %esp
	movl	%eax, %ebx
	pushl	24(%ebp)
	pushl	12(%ebp)
	call	_fixmul
	addl	$8, %esp
	addl	%eax, %ebx
	pushl	28(%ebp)
	pushl	16(%ebp)
	call	_fixmul
	addl	$8, %esp
	addl	%ebx, %eax
	movl	-4(%ebp), %ebx
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_dot_product_f
_dot_product_f:
	pushl	%ebp
	movl	%esp, %ebp
	flds	8(%ebp)
	fmuls	20(%ebp)
	flds	12(%ebp)
	fmuls	24(%ebp)
	faddp	%st, %st(1)
	flds	16(%ebp)
	fmuls	28(%ebp)
	faddp	%st, %st(1)
	popl	%ebp
	ret
	.globl	_persp_project
_persp_project:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	__persp_xscale, %ebx
	pushl	16(%ebp)
	pushl	8(%ebp)
	call	_fixdiv
	addl	$8, %esp
	pushl	%ebx
	pushl	%eax
	call	_fixmul
	addl	$8, %esp
	movl	__persp_xoffset, %edx
	addl	%eax, %edx
	movl	20(%ebp), %eax
	movl	%edx, (%eax)
	movl	__persp_yscale, %ebx
	pushl	16(%ebp)
	pushl	12(%ebp)
	call	_fixdiv
	addl	$8, %esp
	pushl	%ebx
	pushl	%eax
	call	_fixmul
	addl	$8, %esp
	movl	__persp_yoffset, %edx
	addl	%eax, %edx
	movl	24(%ebp), %eax
	movl	%edx, (%eax)
	movl	-4(%ebp), %ebx
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_persp_project_f
_persp_project_f:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	fld1
	fdivs	16(%ebp)
	fstps	-4(%ebp)
	flds	8(%ebp)
	fmuls	-4(%ebp)
	flds	__persp_xscale_f
	fmulp	%st, %st(1)
	flds	__persp_xoffset_f
	faddp	%st, %st(1)
	movl	20(%ebp), %eax
	fstps	(%eax)
	flds	12(%ebp)
	fmuls	-4(%ebp)
	flds	__persp_yscale_f
	fmulp	%st, %st(1)
	flds	__persp_yoffset_f
	faddp	%st, %st(1)
	movl	24(%ebp), %eax
	fstps	(%eax)
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_file_select
_file_select:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	subl	$8, %esp
	pushl	$-1
	pushl	$-1
	pushl	$1024
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	_file_select_ex
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_textout
_textout:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	__textmode, %eax
	subl	$4, %esp
	pushl	%eax
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	_textout_ex
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_textout_centre
_textout_centre:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	__textmode, %eax
	subl	$4, %esp
	pushl	%eax
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	_textout_centre_ex
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_textout_right
_textout_right:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	__textmode, %eax
	subl	$4, %esp
	pushl	%eax
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	_textout_right_ex
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_textout_justify
_textout_justify:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	__textmode, %eax
	subl	$12, %esp
	pushl	%eax
	pushl	36(%ebp)
	pushl	32(%ebp)
	pushl	28(%ebp)
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	_textout_justify_ex
	addl	$48, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_draw_character
_draw_character:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	__textmode, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	_draw_character_ex
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_gui_textout
_gui_textout:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	__textmode, %eax
	subl	$4, %esp
	pushl	28(%ebp)
	pushl	%eax
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	_gui_textout_ex
	addl	$32, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_set_window_close_button
_set_window_close_button:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$0, %eax
	popl	%ebp
	ret
	.globl	_set_window_close_hook
_set_window_close_hook:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	subl	$12, %esp
	pushl	8(%ebp)
	call	_set_close_button_callback
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_yield_timeslice
_yield_timeslice:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	_system_driver, %eax
	movl	108(%eax), %eax
	testl	%eax, %eax
	je	L236
	movl	_system_driver, %eax
	movl	108(%eax), %eax
	call	*%eax
L236:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__set_color
__set_color:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	andl	$255, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$968
	call	_outportb
	addl	$16, %esp
	movl	12(%ebp), %eax
	movb	(%eax), %al
	andl	$255, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$969
	call	_outportb
	addl	$16, %esp
	movl	12(%ebp), %eax
	movb	1(%eax), %al
	andl	$255, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$969
	call	_outportb
	addl	$16, %esp
	movl	12(%ebp), %eax
	movb	2(%eax), %al
	andl	$255, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$969
	call	_outportb
	addl	$16, %esp
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	(%edx), %edx
	movl	%edx, __current_palette(,%eax,4)
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__grow_scratch_mem
__grow_scratch_mem:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	__scratch_mem_size, %eax
	cmpl	%eax, 8(%ebp)
	jle	L239
	movl	8(%ebp), %eax
	addl	$1023, %eax
	andl	$-1024, %eax
	movl	%eax, 8(%ebp)
	movl	8(%ebp), %edx
	movl	__scratch_mem, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	__al_realloc
	addl	$16, %esp
	movl	%eax, __scratch_mem
	movl	8(%ebp), %eax
	movl	%eax, __scratch_mem_size
L239:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__enter_critical
__enter_critical:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$72, %esp
	movl	_os_type, %eax
	cmpl	$1464421939, %eax
	je	L242
	movl	_os_type, %eax
	cmpl	$1463366944, %eax
	je	L242
	movl	_os_type, %eax
	cmpl	$1463367712, %eax
	je	L242
	movl	_os_type, %eax
	cmpl	$1464681760, %eax
	je	L242
	movl	_os_type, %eax
	cmpl	$1464751136, %eax
	je	L242
	movl	_os_type, %eax
	cmpl	$1462913824, %eax
	jne	L243
L242:
	movw	$5761, -32(%ebp)
	subl	$8, %esp
	leal	-60(%ebp), %eax
	pushl	%eax
	pushl	$47
	call	___dpmi_int
	addl	$16, %esp
L243:
/APP
# 57 "./include/allegro/platform/aintdos.h" 1
	cli
# 0 "" 2
/NO_APP
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__exit_critical
__exit_critical:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$72, %esp
	movl	_os_type, %eax
	cmpl	$1464421939, %eax
	je	L245
	movl	_os_type, %eax
	cmpl	$1463366944, %eax
	je	L245
	movl	_os_type, %eax
	cmpl	$1463367712, %eax
	je	L245
	movl	_os_type, %eax
	cmpl	$1464681760, %eax
	je	L245
	movl	_os_type, %eax
	cmpl	$1464751136, %eax
	je	L245
	movl	_os_type, %eax
	cmpl	$1462913824, %eax
	jne	L246
L245:
	movw	$5762, -32(%ebp)
	subl	$8, %esp
	leal	-60(%ebp), %eax
	pushl	%eax
	pushl	$47
	call	___dpmi_int
	addl	$16, %esp
L246:
/APP
# 72 "./include/allegro/platform/aintdos.h" 1
	sti
# 0 "" 2
/NO_APP
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__read_vga_register
__read_vga_register:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	cmpl	$960, 8(%ebp)
	jne	L248
	movl	__crtc, %eax
	addl	$6, %eax
	andl	$65535, %eax
	subl	$12, %esp
	pushl	%eax
	call	_inportb
	addl	$16, %esp
L248:
	movl	12(%ebp), %eax
	xorl	%edx, %edx
	movb	%al, %dl
	movl	8(%ebp), %eax
	andl	$65535, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	_outportb
	addl	$16, %esp
	movl	8(%ebp), %eax
	incl	%eax
	andl	$65535, %eax
	subl	$12, %esp
	pushl	%eax
	call	_inportb
	addl	$16, %esp
	andl	$255, %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__write_vga_register
__write_vga_register:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	cmpl	$960, 8(%ebp)
	jne	L251
	movl	__crtc, %eax
	addl	$6, %eax
	andl	$65535, %eax
	subl	$12, %esp
	pushl	%eax
	call	_inportb
	addl	$16, %esp
	movl	12(%ebp), %eax
	xorl	%edx, %edx
	movb	%al, %dl
	movl	8(%ebp), %eax
	andl	$65535, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	_outportb
	addl	$16, %esp
	movl	16(%ebp), %eax
	xorl	%edx, %edx
	movb	%al, %dl
	movl	8(%ebp), %eax
	andl	$65535, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	_outportb
	addl	$16, %esp
	jmp	L250
L251:
	movl	12(%ebp), %eax
	xorl	%edx, %edx
	movb	%al, %dl
	movl	8(%ebp), %eax
	andl	$65535, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	_outportb
	addl	$16, %esp
	movl	16(%ebp), %eax
	xorl	%edx, %edx
	movb	%al, %dl
	movl	8(%ebp), %eax
	incl	%eax
	andl	$65535, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	_outportb
	addl	$16, %esp
L250:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__alter_vga_register
__alter_vga_register:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	__read_vga_register
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	movl	16(%ebp), %eax
	notl	%eax
	andl	%eax, -12(%ebp)
	movl	20(%ebp), %eax
	andl	16(%ebp), %eax
	orl	%eax, -12(%ebp)
	subl	$4, %esp
	pushl	-12(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	__write_vga_register
	addl	$16, %esp
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__vsync_out_h
__vsync_out_h:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
L255:
	subl	$12, %esp
	pushl	$986
	call	_inportb
	addl	$16, %esp
	andl	$255, %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	L255
	nop
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__vsync_out_v
__vsync_out_v:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
L257:
	subl	$12, %esp
	pushl	$986
	call	_inportb
	addl	$16, %esp
	andl	$255, %eax
	andl	$8, %eax
	testl	%eax, %eax
	jne	L257
	nop
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__vsync_in
__vsync_in:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	__timer_use_retrace, %eax
	testl	%eax, %eax
	je	L259
	movl	_retrace_count, %eax
	movl	%eax, -12(%ebp)
L260:
	movl	_retrace_count, %eax
	cmpl	%eax, -12(%ebp)
	je	L260
	jmp	L258
L259:
	subl	$12, %esp
	pushl	$986
	call	_inportb
	addl	$16, %esp
	andl	$255, %eax
	andl	$8, %eax
	testl	%eax, %eax
	je	L259
L258:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	__write_hpp
__write_hpp:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	__timer_use_retrace, %eax
	testl	%eax, %eax
	je	L263
	movl	8(%ebp), %eax
	movl	%eax, __retrace_hpp_value
L264:
	movl	__retrace_hpp_value, %eax
	cmpl	%eax, 8(%ebp)
	je	L264
	jmp	L262
L263:
	subl	$12, %esp
	pushl	$986
	call	_inportb
	addl	$16, %esp
	andl	$255, %eax
	andl	$8, %eax
	testl	%eax, %eax
	je	L263
	subl	$4, %esp
	pushl	8(%ebp)
	pushl	$51
	pushl	$960
	call	__write_vga_register
	addl	$16, %esp
L262:
	movl	%ebp, %esp
	popl	%ebp
	ret
	.globl	_list
LC8:
	.ascii "##ALLEGRO_DJGPP\0"
LC9:
	.ascii "##ALLEGRO_DOS\0"
LC10:
	.ascii "##ALLEGRO_COLOR8\0"
LC11:
	.ascii "##ALLEGRO_COLOR16\0"
LC12:
	.ascii "##ALLEGRO_COLOR24\0"
LC13:
	.ascii "##ALLEGRO_COLOR32\0"
LC14:
	.ascii "##ALLEGRO_MMX\0"
LC15:
	.ascii "BMP_W\0"
LC16:
	.ascii "BMP_H\0"
LC17:
	.ascii "BMP_CLIP\0"
LC18:
	.ascii "BMP_CL\0"
LC19:
	.ascii "BMP_CR\0"
LC20:
	.ascii "BMP_CT\0"
LC21:
	.ascii "BMP_CB\0"
LC22:
	.ascii "BMP_VTABLE\0"
LC23:
	.ascii "BMP_WBANK\0"
LC24:
	.ascii "BMP_RBANK\0"
LC25:
	.ascii "BMP_DAT\0"
LC26:
	.ascii "BMP_ID\0"
LC27:
	.ascii "BMP_EXTRA\0"
LC28:
	.ascii "BMP_XOFFSET\0"
LC29:
	.ascii "BMP_YOFFSET\0"
LC30:
	.ascii "BMP_SEG\0"
LC31:
	.ascii "BMP_LINE\0"
LC32:
	.ascii "NEWLINE\0"
LC33:
	.ascii "#ifndef BMP_ID_VIDEO\0"
LC34:
	.ascii "BMP_ID_VIDEO\0"
LC35:
	.ascii "BMP_ID_SYSTEM\0"
LC36:
	.ascii "BMP_ID_SUB\0"
LC37:
	.ascii "BMP_ID_PLANAR\0"
LC38:
	.ascii "BMP_ID_NOBLIT\0"
LC39:
	.ascii "BMP_ID_LOCKED\0"
LC40:
	.ascii "BMP_ID_AUTOLOCK\0"
LC41:
	.ascii "BMP_ID_MASK\0"
LC42:
	.ascii "#endif\0"
LC43:
	.ascii "CMP_PLANAR\0"
LC44:
	.ascii "CMP_COLOR_DEPTH\0"
LC45:
	.ascii "CMP_DRAW\0"
LC46:
	.ascii "VTABLE_COLOR_DEPTH\0"
LC47:
	.ascii "VTABLE_MASK_COLOR\0"
LC48:
	.ascii "VTABLE_UNBANK\0"
LC49:
	.ascii "RLE_W\0"
LC50:
	.ascii "RLE_H\0"
LC51:
	.ascii "RLE_DAT\0"
LC52:
	.ascii "GFXRECT_WIDTH\0"
LC53:
	.ascii "GFXRECT_HEIGHT\0"
LC54:
	.ascii "GFXRECT_PITCH\0"
LC55:
	.ascii "GFXRECT_DATA\0"
LC56:
	.ascii "DRAW_SOLID\0"
LC57:
	.ascii "DRAW_XOR\0"
LC58:
	.ascii "DRAW_COPY_PATTERN\0"
LC59:
	.ascii "DRAW_SOLID_PATTERN\0"
LC60:
	.ascii "DRAW_MASKED_PATTERN\0"
LC61:
	.ascii "DRAW_TRANS\0"
LC62:
	.ascii "#ifndef MASK_COLOR_8\0"
LC63:
	.ascii "MASK_COLOR_8\0"
LC64:
	.ascii "MASK_COLOR_15\0"
LC65:
	.ascii "MASK_COLOR_16\0"
LC66:
	.ascii "MASK_COLOR_24\0"
LC67:
	.ascii "MASK_COLOR_32\0"
LC68:
	.ascii "POLYSEG_U\0"
LC69:
	.ascii "POLYSEG_V\0"
LC70:
	.ascii "POLYSEG_DU\0"
LC71:
	.ascii "POLYSEG_DV\0"
LC72:
	.ascii "POLYSEG_C\0"
LC73:
	.ascii "POLYSEG_DC\0"
LC74:
	.ascii "POLYSEG_R\0"
LC75:
	.ascii "POLYSEG_G\0"
LC76:
	.ascii "POLYSEG_B\0"
LC77:
	.ascii "POLYSEG_DR\0"
LC78:
	.ascii "POLYSEG_DG\0"
LC79:
	.ascii "POLYSEG_DB\0"
LC80:
	.ascii "POLYSEG_Z\0"
LC81:
	.ascii "POLYSEG_DZ\0"
LC82:
	.ascii "POLYSEG_FU\0"
LC83:
	.ascii "POLYSEG_FV\0"
LC84:
	.ascii "POLYSEG_DFU\0"
LC85:
	.ascii "POLYSEG_DFV\0"
LC86:
	.ascii "POLYSEG_TEXTURE\0"
LC87:
	.ascii "POLYSEG_UMASK\0"
LC88:
	.ascii "POLYSEG_VMASK\0"
LC89:
	.ascii "POLYSEG_VSHIFT\0"
LC90:
	.ascii "POLYSEG_SEG  \0"
LC91:
	.ascii "POLYSEG_ZBADDR\0"
LC92:
	.ascii "POLYSEG_RADDR\0"
LC93:
	.ascii "ERANGE\0"
LC94:
	.ascii "M_V00\0"
LC95:
	.ascii "M_V01\0"
LC96:
	.ascii "M_V02\0"
LC97:
	.ascii "M_V10\0"
LC98:
	.ascii "M_V11\0"
LC99:
	.ascii "M_V12\0"
LC100:
	.ascii "M_V20\0"
LC101:
	.ascii "M_V21\0"
LC102:
	.ascii "M_V22\0"
LC103:
	.ascii "M_T0\0"
LC104:
	.ascii "M_T1\0"
LC105:
	.ascii "M_T2\0"
LC106:
	.ascii "IRQ_SIZE\0"
LC107:
	.ascii "IRQ_HANDLER\0"
LC108:
	.ascii "IRQ_NUMBER\0"
LC109:
	.ascii "IRQ_OLDVEC\0"
LC110:
	.ascii "DPMI_AX\0"
LC111:
	.ascii "DPMI_BX\0"
LC112:
	.ascii "DPMI_CX\0"
LC113:
	.ascii "DPMI_DX\0"
LC114:
	.ascii "DPMI_SP\0"
LC115:
	.ascii "DPMI_SS\0"
LC116:
	.ascii "DPMI_FLAGS\0"
LC117:
	.ascii "#define USE_FS\0"
LC118:
	.ascii "#define FSEG %fs:\0"
LC119:
	.ascii "#ifndef CPU_ID\0"
LC120:
	.ascii "CPU_ID\0"
LC121:
	.ascii "CPU_FPU\0"
LC122:
	.ascii "CPU_MMX\0"
LC123:
	.ascii "CPU_MMXPLUS\0"
LC124:
	.ascii "CPU_SSE\0"
LC125:
	.ascii "CPU_SSE2\0"
LC126:
	.ascii "CPU_3DNOW\0"
LC127:
	.ascii "CPU_ENH3DNOW\0"
LC128:
	.ascii "CPU_CMOV\0"
	.p2align 2
LC129:
	.ascii "#define FUNC(name)            .globl _##name ; _align_ ; _##name:\0"
	.p2align 2
LC130:
	.ascii "#define GLOBL(name)           _##name\0"
	.section .data
	.p2align 4
_list:
	.long	LC8
	.long	0
	.long	LC9
	.long	0
	.long	LC10
	.long	0
	.long	LC11
	.long	0
	.long	LC12
	.long	0
	.long	LC13
	.long	0
	.long	LC14
	.long	0
	.long	LC15
	.long	0
	.long	LC16
	.long	4
	.long	LC17
	.long	8
	.long	LC18
	.long	12
	.long	LC19
	.long	16
	.long	LC20
	.long	20
	.long	LC21
	.long	24
	.long	LC22
	.long	28
	.long	LC23
	.long	32
	.long	LC24
	.long	36
	.long	LC25
	.long	40
	.long	LC26
	.long	44
	.long	LC27
	.long	48
	.long	LC28
	.long	52
	.long	LC29
	.long	56
	.long	LC30
	.long	60
	.long	LC31
	.long	64
	.long	LC32
	.long	0
	.long	LC33
	.long	0
	.long	LC34
	.long	-2147483648
	.long	LC35
	.long	1073741824
	.long	LC36
	.long	536870912
	.long	LC37
	.long	268435456
	.long	LC38
	.long	134217728
	.long	LC39
	.long	67108864
	.long	LC40
	.long	33554432
	.long	LC41
	.long	33554431
	.long	LC42
	.long	0
	.long	LC32
	.long	0
	.long	LC43
	.long	0
	.long	LC44
	.long	2
	.long	LC45
	.long	8
	.long	LC32
	.long	0
	.long	LC46
	.long	0
	.long	LC47
	.long	4
	.long	LC48
	.long	8
	.long	LC32
	.long	0
	.long	LC49
	.long	0
	.long	LC50
	.long	4
	.long	LC51
	.long	16
	.long	LC32
	.long	0
	.long	LC52
	.long	0
	.long	LC53
	.long	4
	.long	LC54
	.long	8
	.long	LC55
	.long	12
	.long	LC32
	.long	0
	.long	LC56
	.long	0
	.long	LC57
	.long	1
	.long	LC58
	.long	2
	.long	LC59
	.long	3
	.long	LC60
	.long	4
	.long	LC61
	.long	5
	.long	LC32
	.long	0
	.long	LC62
	.long	0
	.long	LC63
	.long	0
	.long	LC64
	.long	31775
	.long	LC65
	.long	63519
	.long	LC66
	.long	16711935
	.long	LC67
	.long	16711935
	.long	LC42
	.long	0
	.long	LC32
	.long	0
	.long	LC68
	.long	0
	.long	LC69
	.long	4
	.long	LC70
	.long	8
	.long	LC71
	.long	12
	.long	LC72
	.long	16
	.long	LC73
	.long	20
	.long	LC74
	.long	24
	.long	LC75
	.long	28
	.long	LC76
	.long	32
	.long	LC77
	.long	36
	.long	LC78
	.long	40
	.long	LC79
	.long	44
	.long	LC80
	.long	48
	.long	LC81
	.long	52
	.long	LC82
	.long	56
	.long	LC83
	.long	60
	.long	LC84
	.long	64
	.long	LC85
	.long	68
	.long	LC86
	.long	72
	.long	LC87
	.long	76
	.long	LC88
	.long	80
	.long	LC89
	.long	84
	.long	LC90
	.long	88
	.long	LC91
	.long	92
	.long	LC92
	.long	96
	.long	LC32
	.long	0
	.long	LC93
	.long	2
	.long	LC32
	.long	0
	.long	LC94
	.long	0
	.long	LC95
	.long	4
	.long	LC96
	.long	8
	.long	LC97
	.long	12
	.long	LC98
	.long	16
	.long	LC99
	.long	20
	.long	LC100
	.long	24
	.long	LC101
	.long	28
	.long	LC102
	.long	32
	.long	LC32
	.long	0
	.long	LC103
	.long	36
	.long	LC104
	.long	40
	.long	LC105
	.long	44
	.long	LC32
	.long	0
	.long	LC106
	.long	16
	.long	LC107
	.long	0
	.long	LC108
	.long	4
	.long	LC109
	.long	8
	.long	LC32
	.long	0
	.long	LC110
	.long	28
	.long	LC111
	.long	16
	.long	LC112
	.long	24
	.long	LC113
	.long	20
	.long	LC114
	.long	46
	.long	LC115
	.long	48
	.long	LC116
	.long	32
	.long	LC32
	.long	0
	.long	LC117
	.long	0
	.long	LC118
	.long	0
	.long	LC32
	.long	0
	.long	LC119
	.long	0
	.long	LC120
	.long	1
	.long	LC121
	.long	2
	.long	LC122
	.long	4
	.long	LC123
	.long	8
	.long	LC124
	.long	16
	.long	LC125
	.long	32
	.long	LC126
	.long	64
	.long	LC127
	.long	128
	.long	LC128
	.long	256
	.long	LC42
	.long	0
	.long	LC32
	.long	0
	.long	LC129
	.long	0
	.long	LC130
	.long	0
	.long	LC32
	.long	0
	.long	0
	.long	0
	.section .text
LC131:
	.ascii "Usage: %s <output file>\12\0"
	.p2align 2
LC132:
	.ascii "writing structure offsets into %s...\12\0"
LC133:
	.ascii "w\0"
LC134:
	.ascii "%s: can not open file %s\12\0"
LC135:
	.ascii "/* Allegro 4.2.2, djgpp */\12\0"
	.p2align 2
LC136:
	.ascii "/* automatically generated structure offsets */\12\12\0"
	.p2align 2
LC137:
	.ascii "#ifndef %s\12#define %s\12#endif\12\12\0"
LC138:
	.ascii "%s\12\0"
LC139:
	.ascii "#define %s %d\12\0"
LC140:
	.ascii "%s: cannot write file %s\12\0"
LC141:
	.ascii "%s: cannot close file %s\12\0"
	.globl	_main
_main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	subl	$16, %esp
	movl	%ecx, %ebx
	cmpl	$1, (%ebx)
	jg	L267
	movl	4(%ebx), %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$LC131
	pushl	$___dj_stderr
	call	_fprintf
	addl	$16, %esp
	movl	$1, %eax
	jmp	L268
L267:
	movl	4(%ebx), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$LC132
	call	_printf
	addl	$16, %esp
	movl	4(%ebx), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	$LC133
	pushl	%eax
	call	_fopen
	addl	$16, %esp
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L269
	movl	4(%ebx), %eax
	addl	$4, %eax
	movl	(%eax), %edx
	movl	4(%ebx), %eax
	movl	(%eax), %eax
	pushl	%edx
	pushl	%eax
	pushl	$LC134
	pushl	$___dj_stderr
	call	_fprintf
	addl	$16, %esp
	movl	$1, %eax
	jmp	L268
L269:
	pushl	-16(%ebp)
	pushl	$27
	pushl	$1
	pushl	$LC135
	call	_fwrite
	addl	$16, %esp
	pushl	-16(%ebp)
	pushl	$49
	pushl	$1
	pushl	$LC136
	call	_fwrite
	addl	$16, %esp
	movl	$_list, -12(%ebp)
	jmp	L270
L274:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movb	(%eax), %al
	cmpb	$35, %al
	jne	L271
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	incl	%eax
	movb	(%eax), %al
	cmpb	$35, %al
	jne	L272
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	leal	2(%eax), %edx
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	addl	$2, %eax
	pushl	%edx
	pushl	%eax
	pushl	$LC137
	pushl	-16(%ebp)
	call	_fprintf
	addl	$16, %esp
	jmp	L273
L272:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$LC138
	pushl	-16(%ebp)
	call	_fprintf
	addl	$16, %esp
	jmp	L273
L271:
	movl	-12(%ebp), %eax
	movl	4(%eax), %edx
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	pushl	%edx
	pushl	%eax
	pushl	$LC139
	pushl	-16(%ebp)
	call	_fprintf
	addl	$16, %esp
L273:
	addl	$8, -12(%ebp)
L270:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L274
	subl	$12, %esp
	pushl	-16(%ebp)
	call	_ferror
	addl	$16, %esp
	testl	%eax, %eax
	je	L275
	movl	4(%ebx), %eax
	addl	$4, %eax
	movl	(%eax), %edx
	movl	4(%ebx), %eax
	movl	(%eax), %eax
	pushl	%edx
	pushl	%eax
	pushl	$LC140
	pushl	$___dj_stderr
	call	_fprintf
	addl	$16, %esp
	movl	$1, %eax
	jmp	L268
L275:
	subl	$12, %esp
	pushl	-16(%ebp)
	call	_fclose
	addl	$16, %esp
	testl	%eax, %eax
	je	L276
	movl	4(%ebx), %eax
	addl	$4, %eax
	movl	(%eax), %edx
	movl	4(%ebx), %eax
	movl	(%eax), %eax
	pushl	%edx
	pushl	%eax
	pushl	$LC141
	pushl	$___dj_stderr
	call	_fprintf
	addl	$16, %esp
	movl	$1, %eax
	jmp	L268
L276:
	movl	$0, %eax
L268:
	leal	-8(%ebp), %esp
	popl	%ecx
	popl	%ebx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.p2align 3
LC0:
	.long	0
	.long	1088421824
	.p2align 3
LC1:
	.long	0
	.long	-1059061824
	.p2align 3
LC2:
	.long	0
	.long	1089470464
	.p2align 3
LC4:
	.long	0
	.long	-1075838976
	.p2align 3
LC5:
	.long	0
	.long	1071644672
	.ident	"GCC: (GNU) 12.2.0"
