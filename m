Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A91B46842
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 04:03:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1113008.1461116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiH1-0004th-Ip; Sat, 06 Sep 2025 02:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1113008.1461116; Sat, 06 Sep 2025 02:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiH1-0004rA-Fn; Sat, 06 Sep 2025 02:03:27 +0000
Received: by outflank-mailman (input) for mailman id 1113008;
 Sat, 06 Sep 2025 02:03:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uuiGz-0003NI-EV
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 02:03:25 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aabbf665-8ac5-11f0-9809-7dc792cee155;
 Sat, 06 Sep 2025 04:03:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5B6B9437B8;
 Sat,  6 Sep 2025 02:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1198FC4CEF1;
 Sat,  6 Sep 2025 02:03:20 +0000 (UTC)
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
X-Inumbo-ID: aabbf665-8ac5-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757124202;
	bh=/P271jzFbbaiVYtvMFy5+v9ACveQ4+jmMCL1lvvSP6s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DpZxNR0tMWnTuWsQbx5Zau3OUPf5XvC47s5VY7cfZOlo3bPCuzr70AZXfgKxxT9Ey
	 EMZRHepXbvnaR09HPpfS3WizAj9Z3q1+tgricyMMNWG0qcxWyPGx6AMh/+R2LuVFs+
	 MCBJ6JXU7FfXtnKESLQhDvQJWH6NjzzE+1ih9NtqXlMJVftEh1NXoHyVYcO3QD/2a7
	 ObNNBKC+Ts/btCnZO5hOOHFolsWlM53irwer+t/sBpU6GVDvaVQQZLi/V5UXcJBhIs
	 OMX2Bj6B79yuEbJ4AJKAfEhnudYn/ohDJTIFYeZSpt9tiO/UlFoEND1W0y55DjhXk4
	 s3wHeXN9OX5og==
Date: Fri, 5 Sep 2025 19:03:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v6 03/15] emul/ns16x50: implement emulator stub
In-Reply-To: <20250905232715.440758-4-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2509051902510.1405870@ubuntu-linux-20-04-desktop>
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-4-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
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
> Changes since v5:
> - v5 feedback
> - Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-4-dmukhin@ford.com/
> ---
>  xen/arch/x86/hvm/hvm.c          |  21 ++
>  xen/common/emul/vuart/Kconfig   |  19 ++
>  xen/common/emul/vuart/Makefile  |   1 +
>  xen/common/emul/vuart/ns16x50.c | 366 ++++++++++++++++++++++++++++++++
>  4 files changed, 407 insertions(+)
>  create mode 100644 xen/common/emul/vuart/ns16x50.c
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 23bd7f078a1d..91c971f11e14 100644
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
> @@ -689,6 +690,22 @@ int hvm_domain_initialise(struct domain *d,
>      if ( rc != 0 )
>          goto fail1;
>  
> +    /* Limit NS16550 emulator for dom0 only for now. */
> +    if ( IS_ENABLED(CONFIG_VUART_NS16X50) && is_hardware_domain(d) )
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
> @@ -712,6 +729,8 @@ int hvm_domain_initialise(struct domain *d,
>      return 0;
>  
>   fail2:
> +    vuart_deinit(d);
> + out_vioapic_deinit:
>      vioapic_deinit(d);
>   fail1:
>      if ( is_hardware_domain(d) )
> @@ -774,6 +793,8 @@ void hvm_domain_destroy(struct domain *d)
>      if ( hvm_funcs.domain_destroy )
>          alternative_vcall(hvm_funcs.domain_destroy, d);
>  
> +    vuart_deinit(d);
> +
>      vioapic_deinit(d);
>  
>      XFREE(d->arch.hvm.pl_time);
> diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfig
> index ce1b976b7da7..a27d7ca135af 100644
> --- a/xen/common/emul/vuart/Kconfig
> +++ b/xen/common/emul/vuart/Kconfig
> @@ -3,4 +3,23 @@ config VUART_FRAMEWORK
>  
>  menu "UART Emulation"
>  
> +config VUART_NS16X50
> +	bool "NS16550-compatible UART Emulator" if EXPERT
> +	depends on X86 && HVM
> +	select VUART_FRAMEWORK
> +	default n
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

There is a question about adding the kconfig option early in the series.
I think it would be best to add it as last patch


>  endmenu


