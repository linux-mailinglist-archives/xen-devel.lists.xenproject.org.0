Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43729B3C37C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 21:58:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102085.1454855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us5EO-00081S-Hb; Fri, 29 Aug 2025 19:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102085.1454855; Fri, 29 Aug 2025 19:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us5EO-00080D-Ex; Fri, 29 Aug 2025 19:57:52 +0000
Received: by outflank-mailman (input) for mailman id 1102085;
 Fri, 29 Aug 2025 19:57:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zkx=3J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1us5EM-000803-QM
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 19:57:50 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ff6a1d1-8512-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 21:57:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 69D2D43837;
 Fri, 29 Aug 2025 19:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08344C4CEF0;
 Fri, 29 Aug 2025 19:57:45 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6ff6a1d1-8512-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756497467;
	bh=7RwocJKGP1P0snVi7XY0tdesWNsl30sJQg75fas9PpA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D9MmLHcK7CcoUZdnY6vZPvu5XvVfBFhxE6VAFiMsmUPS90QdmoZ8pWt5cw90EICMF
	 VVCEmy9hDjCUrjvu6rMsVW/LSFyG8DJNbb5u9CLhA+LqBysumXERD7fsA7Ozxr54Yg
	 ghgycSZgWW3e7Jo3AZDWQYLSYDCPMHKGgJfFrA7O6gn6KeRv9sr0Z1y8XznjYEk54Y
	 TvLI2toWrTtq/iUv1awdFzoMuU6o03130akOrZ9F2uySgSS/iybMqUWoUNDkqP7BgC
	 B/rcqJEtqac9o981zFhKtfpUazG2sQ6O/AQrTXCzLES4HwlbpReqI1fEFwJL/feNRw
	 vMScGiAth5qFA==
Date: Fri, 29 Aug 2025 12:57:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v5 03/15] emul/ns16x50: implement emulator stub
In-Reply-To: <20250828235409.2835815-4-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2508291237100.341243@ubuntu-linux-20-04-desktop>
References: <20250828235409.2835815-1-dmukhin@ford.com> <20250828235409.2835815-4-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> The change is the first on the way on introducing minimally functional
> NS16550-compatible UART emulator.
> 
> Define UART state and a set of emulated registers.
> 
> Implement alloc/free vUART hooks.
> 
> Stub out I/O port handler.
> 
> Add initialization of the NS16x50-compatible UART emulator state machine.
> 
> Plumb debug logging.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v4:
> - new patch 
> ---
>  xen/arch/x86/hvm/hvm.c          |  20 ++
>  xen/common/emul/vuart/Kconfig   |  18 ++
>  xen/common/emul/vuart/Makefile  |   1 +
>  xen/common/emul/vuart/ns16x50.c | 362 ++++++++++++++++++++++++++++++++
>  xen/include/xen/sched.h         |   4 +
>  5 files changed, 405 insertions(+)
>  create mode 100644 xen/common/emul/vuart/ns16x50.c
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 23bd7f078a1d..26760cf995df 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -28,6 +28,7 @@
>  #include <xen/softirq.h>
>  #include <xen/trace.h>
>  #include <xen/vm_event.h>
> +#include <xen/vuart.h>
>  #include <xen/vpci.h>
>  #include <xen/wait.h>
>  #include <xen/warning.h>
> @@ -689,6 +690,21 @@ int hvm_domain_initialise(struct domain *d,
>      if ( rc != 0 )
>          goto fail1;
>  
> +    if ( IS_ENABLED(CONFIG_VUART_NS16X50) )

maybe only for the hardware domain?
or only input_allowed = true only for the hardware domain?

> +    {
> +        struct vuart_info info = {
> +            .name       = "COM2",
> +            .compatible = "ns16550",
> +            .base_addr  = 0x2f8,
> +            .size       = 8,
> +            .irq        = 3,
> +        };
> +
> +        rc = vuart_init(d, &info);
> +        if ( rc )
> +            goto out_vioapic_deinit;
> +    }
> +
>      stdvga_init(d);
>  
>      rtc_init(d);
> @@ -712,6 +728,8 @@ int hvm_domain_initialise(struct domain *d,
>      return 0;
>  
>   fail2:
> +    vuart_deinit(d);
> + out_vioapic_deinit:
>      vioapic_deinit(d);
>   fail1:
>      if ( is_hardware_domain(d) )
> @@ -774,6 +792,8 @@ void hvm_domain_destroy(struct domain *d)
>      if ( hvm_funcs.domain_destroy )
>          alternative_vcall(hvm_funcs.domain_destroy, d);
>  
> +    vuart_deinit(d);
> +
>      vioapic_deinit(d);
>  
>      XFREE(d->arch.hvm.pl_time);
> diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfig
> index ce1b976b7da7..539e6d5e4fc7 100644
> --- a/xen/common/emul/vuart/Kconfig
> +++ b/xen/common/emul/vuart/Kconfig
> @@ -3,4 +3,22 @@ config VUART_FRAMEWORK
>  
>  menu "UART Emulation"
>  
> +config VUART_NS16X50
> +	bool "NS16550-compatible UART Emulator" if EXPERT
> +	depends on X86 && HVM
> +	select VUART_FRAMEWORK

default n

> +	help
> +	  In-hypervisor NS16x50 UART emulation.
> +
> +	  Only legacy PC COM2 port is emulated.
> +
> +	  This is strictly for testing purposes (such as early HVM guest console),
> +	  and not appropriate for use in production.
> +
> +config VUART_NS16X50_DEBUG
> +	bool "NS16550-compatible UART Emulator Debugging"
> +	depends on VUART_NS16X50 && DEBUG
> +	help
> +	  Enable development debugging.
> +
>  endmenu
> diff --git a/xen/common/emul/vuart/Makefile b/xen/common/emul/vuart/Makefile
> index 97f792dc6641..fe904f6cb65d 100644
> --- a/xen/common/emul/vuart/Makefile
> +++ b/xen/common/emul/vuart/Makefile
> @@ -1 +1,2 @@
>  obj-y += vuart.o
> +obj-$(CONFIG_VUART_NS16X50) += ns16x50.o
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> new file mode 100644
> index 000000000000..f0479e1022fb
> --- /dev/null
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -0,0 +1,362 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * NS16550-compatible UART Emulator.
> + *
> + * See:
> + * - Serial and UART Tutorial:
> + *     https://download.freebsd.org/doc/en/articles/serial-uart/serial-uart_en.pdf
> + * - UART w/ 16 byte FIFO:
> + *     https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
> + * - UART w/ 64 byte FIFO:
> + *     https://www.ti.com/lit/ds/symlink/tl16c750.pdf
> + *
> + * Limitations:
> + * - Only x86;
> + * - Only Xen console as a backend, no inter-domain communication (similar to
> + *   vpl011 on Arm);
> + * - Only 8n1 emulation (8-bit data, no parity, 1 stop bit);
> + * - No baud rate emulation (reports 115200 baud to the guest OS);
> + * - No FIFO-less mode emulation;
> + * - No RX FIFO interrupt moderation (FCR) emulation;
> + * - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
> + *   friends);
> + * - No ISA IRQ sharing allowed;
> + * - No MMIO-based UART emulation.
> + */
> +
> +#define pr_prefix               "ns16x50"
> +#define pr_fmt(fmt)             pr_prefix ": " fmt
> +
> +#ifdef CONFIG_VUART_NS16X50_DEBUG
> +#define guest_prefix            "FROM GUEST "
> +#define ns16x50_log_level       2
> +#else
> +#define guest_prefix            ""
> +#define ns16x50_log_level       0
> +#endif
> +
> +#include <xen/8250-uart.h>
> +#include <xen/console.h>
> +#include <xen/err.h>
> +#include <xen/iocap.h>
> +#include <xen/vuart.h>
> +#include <xen/xvmalloc.h>
> +
> +#include <public/io/console.h>
> +
> +#define ns16x50_log(n, lvl, vdev, fmt, args...) do { \
> +    if ( ns16x50_log_level >= n) \
> +        gprintk(lvl, pr_fmt("%s: " fmt), (vdev)->name, ## args); \
> +} while (0)
> +
> +#define ns16x50_err(vdev, fmt, args...) \
> +    ns16x50_log(0, KERN_ERR, vdev, fmt, ## args)
> +#define ns16x50_warn(vdev, fmt, args...) \
> +    ns16x50_log(1, KERN_WARNING, vdev, fmt, ## args)
> +#define ns16x50_info(vdev, fmt, args...) \
> +    ns16x50_log(2, KERN_INFO, vdev, fmt, ## args)
> +#define ns16x50_debug(vdev, fmt, args...) \
> +    ns16x50_log(3, KERN_DEBUG, vdev, fmt, ## args)
> +
> +/*
> + * Number of supported registers in the UART.
> + */
> +#define NS16X50_REGS_NUM        (UART_SCR + 1)
> +
> +/*
> + * Number of emulated registers.
> + *
> + * - Emulated registers [0..NS16X50_REGS_NUM] are R/W registers for DLAB=0.
> + * - DLAB=1, R/W, DLL            = NS16X50_REGS_NUM + 0
> + * - DLAB=1, R/W, DLM            = NS16X50_REGS_NUM + 1
> + * -         R/O, IIR (IIR_THR)  = NS16X50_REGS_NUM + 2
> + */
> +#define NS16X50_EMU_REGS_NUM    (NS16X50_REGS_NUM + 3)
> +
> +/*
> + * Virtual ns16x50 device state.
> + */
> +struct vuart_ns16x50 {
> +    struct xencons_interface cons;      /* Emulated RX/TX FIFOs */
> +    uint8_t regs[NS16X50_EMU_REGS_NUM]; /* Emulated registers */
> +    const char *name;                   /* Device name */
> +    struct domain *owner;               /* Owner domain */
> +    const struct vuart_info *info;      /* UART description */
> +    spinlock_t lock;                    /* Protection */
> +};
> +
> +/*
> + * Emulate 8-bit write access to ns16x50 register.
> + */
> +static int ns16x50_io_write8(
> +    struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
> +{
> +    int rc = 0;
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate 16-bit write access to ns16x50 register.
> + * NB: some guest OSes use outw() to access UART_DLL.
> + */
> +static int ns16x50_io_write16(
> +    struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
> +{
> +    int rc = -EINVAL;
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate write access to ns16x50 register.
> + */
> +static int ns16x50_io_write(
> +    struct vuart_ns16x50 *vdev, uint8_t reg, uint32_t size, uint32_t *data)
> +{
> +    int rc;
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        rc = ns16x50_io_write8(vdev, reg, (uint8_t *)data);
> +        break;
> +
> +    case 2:
> +        rc = ns16x50_io_write16(vdev, reg, (uint16_t *)data);
> +        break;
> +
> +    default:
> +        rc = -EINVAL;
> +        break;
> +    }
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate 8-bit read access to ns16x50 register.
> + */
> +static int ns16x50_io_read8(
> +    struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
> +{
> +    uint8_t val = 0xff;
> +    int rc = 0;
> +
> +    *data = val;
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate 16-bit read access to ns16x50 register.
> + */
> +static int ns16x50_io_read16(
> +    struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
> +{
> +    uint16_t val = 0xffff;
> +    int rc = -EINVAL;
> +
> +    *data = val;
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate read access to ns16x50 register.
> + */
> +static int ns16x50_io_read(
> +    struct vuart_ns16x50 *vdev, uint8_t reg, uint32_t size, uint32_t *data)
> +{
> +    int rc;
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        rc = ns16x50_io_read8(vdev, reg, (uint8_t *)data);
> +        break;
> +
> +    case 2:
> +        rc = ns16x50_io_read16(vdev, reg, (uint16_t *)data);
> +        break;
> +
> +    default:
> +        *data = 0xffffffff;
> +        rc = -EINVAL;
> +        break;
> +    }
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate I/O access to ns16x50 register.
> + * Note, emulation always returns X86EMUL_OKAY, once I/O port trap is enabled.
> + */
> +static int cf_check ns16x50_io_handle(
> +    int dir, unsigned int addr, unsigned int size, uint32_t *data)
> +{
> +#define op(dir)     (((dir) == IOREQ_WRITE) ? 'W' : 'R')
> +    struct domain *d = rcu_lock_current_domain();
> +    struct vuart *vuart = vuart_find_by_io_range(d, addr, size);
> +    struct vuart_ns16x50 *vdev;
> +    const struct domain *owner;
> +    const struct vuart_info *info;
> +    uint32_t reg;
> +    unsigned dlab;
> +    int rc;
> +
> +    if ( !vuart || !vuart->vdev )
> +    {
> +        printk(KERN_ERR "%c io 0x%04x %d: not initialized\n",

XENLOG_ERR


> +               op(dir), addr, size);
> +
> +        ASSERT_UNREACHABLE();
> +        goto out;
> +    }
> +    vdev = vuart->vdev;
> +
> +    owner = vuart->owner;
> +    ASSERT(owner);
> +    if ( d != owner )
> +    {
> +        ns16x50_err(vdev, "%c io 0x%04x %d: does not match current domain %pv\n",
> +                    op(dir), addr, size, d);
> +
> +        ASSERT_UNREACHABLE();
> +        goto out;
> +    }
> +
> +    info = vuart->info;
> +    ASSERT(info);
> +    reg = addr - info->base_addr;
> +    if ( !IS_ALIGNED(reg, size) )
> +    {
> +        ns16x50_err(vdev, "%c 0x%04x %d: unaligned access\n",
> +                    op(dir), addr, size);


For this one we could consider returning X86EMUL_UNHANDLEABLE but I am not sure
as it would crash the guest.

> +        goto out;
> +    }
> +
> +    dlab = 0;
> +    if ( reg >= NS16X50_REGS_NUM )
> +    {
> +        ns16x50_err(vdev, "%c io 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32": not implemented\n",
> +                    op(dir), addr, size, dlab, reg, *data);
> +        goto out;
> +    }
> +
> +    spin_lock(&vdev->lock);
> +
> +    if ( dir == IOREQ_WRITE )
> +    {
> +        ns16x50_debug(vdev, "%c 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32"\n",
> +                      op(dir), addr, size, dlab, reg, *data);
> +        rc = ns16x50_io_write(vdev, reg, size, data);
> +    }
> +    else
> +    {
> +        rc = ns16x50_io_read(vdev, reg, size, data);
> +        ns16x50_debug(vdev, "%c 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32"\n",
> +                      op(dir), addr, size, dlab, reg, *data);
> +    }
> +    if ( rc < 0 )
> +        ns16x50_err(vdev, "%c 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32": unsupported access\n",
> +                    op(dir), addr, size, dlab, reg, *data);
> +
> +    spin_unlock(&vdev->lock);
> +
> +out:
> +    rcu_unlock_domain(d);
> +
> +    return X86EMUL_OKAY;
> +#undef op
> +}
> +
> +static int ns16x50_init(void *arg)
> +{
> +    struct vuart_ns16x50 *vdev = arg;
> +    const struct vuart_info *info = vdev->info;
> +    struct domain *d = vdev->owner;
> +
> +    ASSERT(vdev);
> +
> +    register_portio_handler(d, info->base_addr, info->size, ns16x50_io_handle);
> +
> +    return 0;
> +}
> +
> +static void cf_check ns16x50_deinit(void *arg)
> +{
> +    struct vuart_ns16x50 *vdev = arg;
> +
> +    ASSERT(vdev);

it should unregister the handlers


> +}
> +
> +static void * cf_check ns16x50_alloc(struct domain *d, const struct vuart_info *info)
> +{
> +    struct vuart_ns16x50 *vdev;
> +    int rc;
> +
> +    if ( !info )
> +        return ERR_PTR(-EINVAL);
> +
> +    if ( vuart_find_by_io_range(d, info->base_addr, info->size) )
> +    {
> +        ns16x50_err(info, "already registered\n");
> +        return ERR_PTR(-EBUSY);
> +    }
> +
> +    if ( !is_hvm_domain(d) )
> +    {
> +        ns16x50_err(info, "not an HVM domain\n");
> +        return ERR_PTR(-ENOSYS);
> +    }
> +
> +    vdev = xvzalloc(typeof(*vdev));
> +    if ( !vdev )
> +    {
> +        ns16x50_err(info, "failed to allocate memory\n");
> +        return ERR_PTR(-ENOMEM);
> +    }
> +
> +    /* Save convenience pointer. */
> +    vdev->name = info->name;
> +    vdev->owner = d;
> +    vdev->info = info;

the spinlock should be initialized 


> +    rc = ns16x50_init(vdev);
> +    if ( rc )
> +        return ERR_PTR(rc);
> +
> +    return vdev;
> +}
> +
> +static void cf_check ns16x50_free(void *arg)
> +{
> +    struct vuart_ns16x50 *vdev = arg;
> +
> +    if ( vdev )
> +        ns16x50_deinit(vdev);
> +
> +    XVFREE(vdev);

XVFREE should only be called if ( vdev )


> +}
> +
> +#define ns16x50_emulator                \
> +{                                       \
> +    .compatible = "ns16550",            \
> +    .alloc      = ns16x50_alloc,        \
> +    .free       = ns16x50_free,         \
> +    .dump_state = NULL,                 \
> +    .put_rx     = NULL,                 \
> +}
> +
> +VUART_REGISTER(ns16x50, ns16x50_emulator);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 02bdc256ce37..613f4596e33d 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -23,6 +23,7 @@
>  #include <asm/atomic.h>
>  #include <asm/current.h>
>  #include <xen/vpci.h>
> +#include <xen/vuart.h>
>  #include <xen/wait.h>
>  #include <public/xen.h>
>  #include <public/domctl.h>
> @@ -660,6 +661,9 @@ struct domain
>      struct {
>          /* Permission to take ownership of the physical console input. */
>          bool input_allowed;
> +#ifdef CONFIG_VUART_FRAMEWORK
> +        struct vuart *vuart;
> +#endif

this should be in patch #1, as patch #1 does:

d->console.vuart = vuart;


>      } console;
>  } __aligned(PAGE_SIZE);
>  
> -- 
> 2.51.0
> 

