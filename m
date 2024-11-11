Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 811AF9C368B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 03:33:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833327.1248455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAKFE-0005KF-3k; Mon, 11 Nov 2024 02:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833327.1248455; Mon, 11 Nov 2024 02:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAKFE-0005Il-0A; Mon, 11 Nov 2024 02:33:36 +0000
Received: by outflank-mailman (input) for mailman id 833327;
 Mon, 11 Nov 2024 02:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zp6W=SG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tAKFC-0005Id-I4
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 02:33:34 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56f46f82-9fd5-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 03:33:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D2633A40E20;
 Mon, 11 Nov 2024 02:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6F6C4CECD;
 Mon, 11 Nov 2024 02:33:28 +0000 (UTC)
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
X-Inumbo-ID: 56f46f82-9fd5-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDQ6MTM4MDo0NWQxOmVjMDA6OjMiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjU2ZjQ2ZjgyLTlmZDUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMjkyNDExLjY1OTE2NSwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731292409;
	bh=KTdgh3h0eJlKNMFEysLgDbsEX2rz1m+qifyRstn7WTw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Wn0kTO+O5rbj+vq6Poskp7YenM0zZd1t1/UdEwJTNlIwjdYncgvCjHdYoq4Jt9QkJ
	 G7YykcwINITBEeNywcultG0+9AuS3F+XnCT9Yi6k4BFHVPRWkUAfaWu46sUcZ4/L23
	 rSgNwW4RRmviGpHqkWD24FPmCiCkfGAKE9SdkSJAID++zG4JlO9DkPlNsYXV80cW9w
	 jr2VaYqODFFjxGTY7/UzCtfanHG03OwdzOCNw8IEExr8drJPnRm0br8nviC9AsYop1
	 eRpLYTgdo1fza5iuphC14N8ygiyOVXFunMqzSN5uFxHsosaXcxDRWmvCG2d0Bh+Rcc
	 fbkEXRsq3lhFA==
Date: Sun, 10 Nov 2024 18:33:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v2 2/2] x86/hvm: introduce config option for stdvga
 emulation
In-Reply-To: <53b0d5552c128630e476c77b54b8983fe02e0e1c.1730887415.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2411101831220.14721@ubuntu-linux-20-04-desktop>
References: <cover.1730887415.git.Sergiy_Kibrik@epam.com> <53b0d5552c128630e476c77b54b8983fe02e0e1c.1730887415.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-990869920-1731292410=:14721"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-990869920-1731292410=:14721
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 6 Nov 2024, Sergiy Kibrik wrote:
> Introduce config option X86_HVM_STDVGA and make stdvga emulation driver
> configurable so it can be disabled on systems that don't need it.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
> changes in v2:
>  - updated description
>  - renamed config option X86_STDVGA -> X86_HVM_STDVGA & moved related
>    Kconfig changes to this patch
>  - reverted changes to has_vvga() macro
>  - moved emulation_flags_ok() checks to this patch
> ---
>  xen/arch/x86/Kconfig              | 10 ++++++++++
>  xen/arch/x86/domain.c             |  4 ++--
>  xen/arch/x86/hvm/Makefile         |  2 +-
>  xen/arch/x86/include/asm/domain.h |  8 ++++++--
>  xen/arch/x86/include/asm/hvm/io.h |  4 ++++
>  5 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index ed0ece85c7..35c8ace8ef 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -155,6 +155,16 @@ config X86_HVM_PMTIMER
>  	  Build pmtimer driver that emulates ACPI PM timer for HVM/PVH guests.
>  
>  	  If unsure, say Y.
> +
> +config X86_HVM_STDVGA
> +	bool "Standard VGA card emulation support"
> +	default y
> +	help
> +	  Build stdvga driver that emulates standard VGA card with VESA BIOS
> +	  Extensions for HVM/PVH guests.
> +
> +	  If unsure, say Y.
> +
>  endmenu
>  
>  config XEN_SHSTK
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index b340818ee2..aefa1fc136 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -742,9 +742,9 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>  
>  static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>  {
> -    const uint32_t disabled_emu_mask = X86_EMU_PM;
> +    const uint32_t disabled_emu_mask = X86_EMU_PM | X86_EMU_VGA;
>  
> -#if defined(CONFIG_X86_HVM_PMTIMER)
> +#if defined(CONFIG_X86_HVM_PMTIMER) && defined(CONFIG_X86_HVM_STDVGA)
>      /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
>      BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
>  #endif

You need to remove this part, following your reply to the previous patch

With that modification:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> index 3af8963218..80ec425aa8 100644
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -22,7 +22,7 @@ obj-$(CONFIG_X86_HVM_PMTIMER) += pmtimer.o
>  obj-y += quirks.o
>  obj-y += rtc.o
>  obj-y += save.o
> -obj-y += stdvga.o
> +obj-$(CONFIG_X86_HVM_STDVGA) += stdvga.o
>  obj-y += vioapic.o
>  obj-y += vlapic.o
>  obj-y += vm_event.o
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 8550473997..106b438779 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -466,7 +466,6 @@ struct arch_domain
>  #define X86_EMU_RTC      XEN_X86_EMU_RTC
>  #define X86_EMU_IOAPIC   XEN_X86_EMU_IOAPIC
>  #define X86_EMU_PIC      XEN_X86_EMU_PIC
> -#define X86_EMU_VGA      XEN_X86_EMU_VGA
>  #define X86_EMU_IOMMU    XEN_X86_EMU_IOMMU
>  #define X86_EMU_USE_PIRQ XEN_X86_EMU_USE_PIRQ
>  #define X86_EMU_VPCI     XEN_X86_EMU_VPCI
> @@ -476,7 +475,6 @@ struct arch_domain
>  #define X86_EMU_RTC      0
>  #define X86_EMU_IOAPIC   0
>  #define X86_EMU_PIC      0
> -#define X86_EMU_VGA      0
>  #define X86_EMU_IOMMU    0
>  #define X86_EMU_USE_PIRQ 0
>  #define X86_EMU_VPCI     0
> @@ -488,6 +486,12 @@ struct arch_domain
>  #define X86_EMU_PM       0
>  #endif
>  
> +#ifdef CONFIG_X86_HVM_STDVGA
> +#define X86_EMU_VGA      XEN_X86_EMU_VGA
> +#else
> +#define X86_EMU_VGA      0
> +#endif
> +
>  #define X86_EMU_PIT     XEN_X86_EMU_PIT
>  
>  /* This must match XEN_X86_EMU_ALL in xen.h */
> diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
> index f2b8431fac..c02fad876c 100644
> --- a/xen/arch/x86/include/asm/hvm/io.h
> +++ b/xen/arch/x86/include/asm/hvm/io.h
> @@ -108,7 +108,11 @@ struct vpci_arch_msix_entry {
>      int pirq;
>  };
>  
> +#ifdef CONFIG_X86_HVM_STDVGA
>  void stdvga_init(struct domain *d);
> +#else
> +static inline void stdvga_init(struct domain *d) {}
> +#endif
>  
>  extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
>  
> -- 
> 2.25.1
> 
--8323329-990869920-1731292410=:14721--

