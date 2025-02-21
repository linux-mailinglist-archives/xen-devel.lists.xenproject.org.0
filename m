Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DCFA40163
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 21:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894651.1303371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tla2m-0007AK-Kj; Fri, 21 Feb 2025 20:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894651.1303371; Fri, 21 Feb 2025 20:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tla2m-00078L-Hg; Fri, 21 Feb 2025 20:54:44 +0000
Received: by outflank-mailman (input) for mailman id 894651;
 Fri, 21 Feb 2025 20:54:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ozyL=VM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tla2l-00078F-Pa
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 20:54:43 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11ed3db5-f096-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 21:54:41 +0100 (CET)
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
X-Inumbo-ID: 11ed3db5-f096-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1740171279; x=1740430479;
	bh=gGx5ZE19RMUPqCepFKIhOBMFBZdAhSzXHSDCe3MwrgI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Y0XO7b44ubq3r8+Cpl53bSrqx+mli3ouwuFhajIZeOyIAwc50r0DJwOzfKqMn1v6h
	 V+OBIOYdrwvHSVgMhhJNJbo1D+cSgK9PzJdmffUPkEwCl2JmhTmBcaOD6uh/tRxZz7
	 0J2OH5R8OuOr6V9SOkFCW66esT+D7h8hvLKkCnjnnTuEL9pnmw8p1oexQB6RrmGIU6
	 uGOUaPOZ6e02+cIg4PmeEZ+K/P11dSMZX4PxzdSbEdM4IxKUNbCvny5udd/WKl2dvJ
	 D7HHLeHtLzeWevZmOdJaMj7iqPOPNwxIn6I+1kl3lCCsTCv0aAT/m9c7fWZZqvqHF6
	 beySNurFFix6g==
Date: Fri, 21 Feb 2025 20:54:36 +0000
To: Jiqian Chen <Jiqian.Chen@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v2 1/2] x86/hvm: make stdvga support optional
Message-ID: <Xtyhxknby_vVOb-p-4rGVEJ6ozk8T2eWytFRMYamuLAnGtP4WHB-1WOlnemiG6VYJWIUZ39zly6lQjKDRZhvglxEUnpg9y64TLtCW1cOs3Q=@proton.me>
In-Reply-To: <20250220095349.1823593-1-Jiqian.Chen@amd.com>
References: <20250220095349.1823593-1-Jiqian.Chen@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d2c45faf5354d07b3411b39a4feb23ca9c86f739
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, February 20th, 2025 at 1:53 AM, Jiqian Chen <Jiqian.Chen@amd.c=
om> wrote:

>
>
> From: Sergiy Kibrik Sergiy_Kibrik@epam.com
>
>
> Introduce config option X86_STDVGA so that stdvga driver can be
> disabled on systems that don't need it.
>
> What's more, in function emulation_flags_ok, to check if toolstack
> pass any emulation flag that disabled in building time.
>
> Signed-off-by: Sergiy Kibrik Sergiy_Kibrik@epam.com
>
> Signed-off-by: Jiqian Chen Jiqian.Chen@amd.com
>
> ---
> Hi all,
> this is a rework for https://lore.kernel.org/xen-devel/20240912085709.858=
052-1-Sergiy_Kibrik@epam.com/T/#u.
>
> v1->v2 changes:
>
> * For emulation flags, added a new file "arch/x86/hvm/Kconfig.emu" to be =
a separate seletion,
> and moved definition of "config X86_STDVGA" into it.
> * Added a new macro "#define DISABLED_EMU_MASK (!IS_ENABLED(CONFIG_X86_ST=
DVGA) ? X86_EMU_VGA : 0)",
> and checked it in function emulation_flags_ok.
> * Adjusted macro "has_vvga".
>
> Best regards,
> Jiqian Chen.
> ---
> xen/arch/x86/Kconfig | 2 ++
> xen/arch/x86/domain.c | 2 ++
> xen/arch/x86/hvm/Kconfig.emu | 14 ++++++++++++++
> xen/arch/x86/hvm/Makefile | 2 +-
> xen/arch/x86/include/asm/domain.h | 6 +++++-
> xen/arch/x86/include/asm/hvm/io.h | 4 ++++
> 6 files changed, 28 insertions(+), 2 deletions(-)
> create mode 100644 xen/arch/x86/hvm/Kconfig.emu
>
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 9cdd04721afa..e4fedf7e54d8 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -123,6 +123,8 @@ config HVM
>
> If unsure, say Y.
>
> +source "arch/x86/hvm/Kconfig.emu"

JFYI, there's this patch:
  https://lore.kernel.org/xen-devel/20250207220302.4190210-1-dmukhin@ford.c=
om/

I think having one Kconfig under arch/x86/hvm is enough.
Thoughts?

> +
> config AMD_SVM
> bool "AMD-V" if EXPERT
> depends on HVM
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 78a13e6812c9..289c91459470 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -758,6 +758,8 @@ static bool emulation_flags_ok(const struct domain *d=
, uint32_t emflags)
> (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
> emflags !=3D X86_EMU_LAPIC )
> return false;
> + if ( emflags & DISABLED_EMU_MASK )
> + return false;
> }
> else if ( emflags !=3D 0 && emflags !=3D X86_EMU_PIT )
> {
> diff --git a/xen/arch/x86/hvm/Kconfig.emu b/xen/arch/x86/hvm/Kconfig.emu
> new file mode 100644
> index 000000000000..aa60b6227036
> --- /dev/null
> +++ b/xen/arch/x86/hvm/Kconfig.emu
> @@ -0,0 +1,14 @@
> +menu "Emulated device support"
> + visible if EXPERT
> +
> +config X86_STDVGA
> + bool "Standard VGA card emulation support" if EXPERT
> + default y
> + depends on HVM
> + help
> + Build stdvga driver that emulates standard VGA card with VESA BIOS
> + Extensions for HVM guests.
> +
> + If unsure, say Y.
> +
> +endmenu
> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> index 4c1fa5c6c2bf..4d1f8e00eb68 100644
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -22,7 +22,7 @@ obj-y +=3D pmtimer.o
> obj-y +=3D quirks.o
> obj-y +=3D rtc.o
> obj-y +=3D save.o
> -obj-y +=3D stdvga.o
> +obj-$(CONFIG_X86_STDVGA) +=3D stdvga.o
> obj-y +=3D vioapic.o
> obj-y +=3D vlapic.o
> obj-y +=3D vm_event.o
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm=
/domain.h
> index b79d6badd71c..68be23bf3bf4 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -494,13 +494,17 @@ struct arch_domain
> X86_EMU_PIT | X86_EMU_USE_PIRQ | \
> X86_EMU_VPCI)
>
> +#define DISABLED_EMU_MASK \
> + (!IS_ENABLED(CONFIG_X86_STDVGA) ? X86_EMU_VGA : 0)
> +
> #define has_vlapic(d) (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
>
> #define has_vhpet(d) (!!((d)->arch.emulation_flags & X86_EMU_HPET))
>
> #define has_vpm(d) (!!((d)->arch.emulation_flags & X86_EMU_PM))
>
> #define has_vrtc(d) (!!((d)->arch.emulation_flags & X86_EMU_RTC))
>
> #define has_vioapic(d) (!!((d)->arch.emulation_flags & X86_EMU_IOAPIC))
>
> #define has_vpic(d) (!!((d)->arch.emulation_flags & X86_EMU_PIC))
>
> -#define has_vvga(d) (!!((d)->arch.emulation_flags & X86_EMU_VGA))
>
> +#define has_vvga(d) (IS_ENABLED(CONFIG_X86_STDVGA) && \
> + !!((d)->arch.emulation_flags & X86_EMU_VGA))
>
> #define has_viommu(d) (!!((d)->arch.emulation_flags & X86_EMU_IOMMU))
>
> #define has_vpit(d) (!!((d)->arch.emulation_flags & X86_EMU_PIT))
>
> #define has_pirq(d) (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
>
> diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm=
/hvm/io.h
> index f2b8431facb0..32a2490fbcb2 100644
> --- a/xen/arch/x86/include/asm/hvm/io.h
> +++ b/xen/arch/x86/include/asm/hvm/io.h
> @@ -108,7 +108,11 @@ struct vpci_arch_msix_entry {
> int pirq;
> };
>
> +#ifdef CONFIG_X86_STDVGA
> void stdvga_init(struct domain *d);
> +#else
> +static inline void stdvga_init(struct domain *d) {}
> +#endif
>
> extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
>
> --
> 2.34.1

