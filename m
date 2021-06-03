Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6DC39AEBC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 01:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136594.253189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lowqH-0005io-Dx; Thu, 03 Jun 2021 23:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136594.253189; Thu, 03 Jun 2021 23:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lowqH-0005gl-Ap; Thu, 03 Jun 2021 23:33:37 +0000
Received: by outflank-mailman (input) for mailman id 136594;
 Thu, 03 Jun 2021 23:33:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=alxE=K5=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1lowqF-0005gf-TC
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 23:33:35 +0000
Received: from mail-il1-x136.google.com (unknown [2607:f8b0:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58fe0324-ed44-4528-88e9-18cdc8f5dc4e;
 Thu, 03 Jun 2021 23:33:33 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id i13so1471650ilk.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jun 2021 16:33:33 -0700 (PDT)
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
X-Inumbo-ID: 58fe0324-ed44-4528-88e9-18cdc8f5dc4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LzTmbLr1R+Utddp1aVDlm+2T7NkmZxeRM9ikLAhGO7M=;
        b=sYdd5i96yOUGzz6QFOfuFpPZYQ04fumcSMhdJaG55I4uIWIosqIden5FadbuD3bGtX
         wGVFJDPbEXzQ4FKW4gCzaPanhdeaZP0vJV6ySeC2RWsIqTpVTTQNgwtzIuGCo+6+OWwe
         G/6fZhmjB57VrqPqGgQxl4Zr4SPTEMpvu1Kao8AQOI8zZ7OG0jyeYVmh+R7ZvI9nrrzg
         WPr7T0sGdR/lUJEZTyXzh4E1yN2Ihf9EI7iJv7t1233L+Q2ZiYget0FXa3GMY4IwUoF/
         iO/pqB+hTbC9+7cEktqsxR4S46/Ftl65M6r6+6dihFvQHs9QvrWMbPBmsPadUQAkvsqX
         u1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LzTmbLr1R+Utddp1aVDlm+2T7NkmZxeRM9ikLAhGO7M=;
        b=ie4nwLHnCMyZwPF4HQ7deAOflLUcRIWCLuuXbZFl5RKRHArMooPb+fl5pUTyexQvb9
         6Fmo57wSbHbsuwJtQdjFlTf29uVL0QTLpEtC2+a2Z2zLT06tRZPgouWKLup+MBeHJLSe
         +/qhGHJntViA50vjnJpz8V7GX/qqGRujxa57j0oPPq2Ru0JNG+w2pD77jUk8+pRsBeZ+
         O2PtY/zUP5B/QaAvg2cKtNbs1Mn4MilqFHczT7yAZ10qnV3BzEdwAkKGf/K2yGDAdEsN
         i2IF8iW7v/9i10NfkHZbsxodxWJl8wnqKiBIBSuaRv070YEdBMD4CiloocPXyIFb3gGA
         381g==
X-Gm-Message-State: AOAM533ks1lMq2yf/O+zTmRxbWg7hKl/wOUHqBRzbd8DAYx+nTxPk6Gk
	M71aBy/ded1sk6UXrNoLHaEFZoRSeLea+GqiI94=
X-Google-Smtp-Source: ABdhPJxULwAzKpZZFgf0OJV/4LZF4D8z+3BNELae9HyhiM4Tu50EN0T8TxZaCF034cLPQCWdE3Xjh0psbEP2odEQb50=
X-Received: by 2002:a05:6e02:d08:: with SMTP id g8mr1288789ilj.40.1622763213291;
 Thu, 03 Jun 2021 16:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622676439.git.connojdavis@gmail.com> <d4670a35758df878565cf757bbc20e2815618eb5.1622676439.git.connojdavis@gmail.com>
In-Reply-To: <d4670a35758df878565cf757bbc20e2815618eb5.1622676439.git.connojdavis@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Jun 2021 09:33:07 +1000
Message-ID: <CAKmqyKPSTmkufvpAj9A_jK1sRkK+J9DMNUgmKfWchrCB9Hm+oQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] xen: Add files needed for minimal riscv build
To: Connor Davis <connojdavis@gmail.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, 
	Bobby Eshleman <bobbyeshleman@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 3, 2021 at 9:38 AM Connor Davis <connojdavis@gmail.com> wrote:
>
> Add arch-specific makefiles and configs needed to build for
> riscv. Also add a minimal head.S that is a simple infinite loop.
> head.o can be built with
>
> $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen -C xen tiny64_defconfig
> $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen -C xen TARGET=riscv64/head.o
>
> No other TARGET is supported at the moment.
>
> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> ---
> Bob: I moved back to XEN_TARGET_ARCH=riscv64 because supplying
> just XEN_TARGET_ARCH=riscv causes TARGET_ARCH == TARGET_SUBARCH, and
> that broke the build after the recent commit b6ecd5c8bc
> "build: centralize / unify asm-offsets generation". It also deviates
> from how x86 and arm work now, so I think this change is for the best
> for now. That commit is also why the PHONY include target is added
> in the riscv/Makefile.
> ---
>  MAINTAINERS                             |  8 +++++
>  config/riscv64.mk                       |  5 +++
>  xen/Makefile                            |  8 +++--
>  xen/arch/riscv/Kconfig                  | 47 +++++++++++++++++++++++++
>  xen/arch/riscv/Kconfig.debug            |  0
>  xen/arch/riscv/Makefile                 |  2 ++
>  xen/arch/riscv/Rules.mk                 |  0
>  xen/arch/riscv/arch.mk                  | 14 ++++++++
>  xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
>  xen/arch/riscv/riscv64/asm-offsets.c    |  0
>  xen/arch/riscv/riscv64/head.S           |  6 ++++
>  xen/include/asm-riscv/config.h          | 47 +++++++++++++++++++++++++
>  12 files changed, 148 insertions(+), 2 deletions(-)
>  create mode 100644 config/riscv64.mk
>  create mode 100644 xen/arch/riscv/Kconfig
>  create mode 100644 xen/arch/riscv/Kconfig.debug
>  create mode 100644 xen/arch/riscv/Makefile
>  create mode 100644 xen/arch/riscv/Rules.mk
>  create mode 100644 xen/arch/riscv/arch.mk
>  create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
>  create mode 100644 xen/arch/riscv/riscv64/asm-offsets.c
>  create mode 100644 xen/arch/riscv/riscv64/head.S
>  create mode 100644 xen/include/asm-riscv/config.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d46b08a0d2..956e71220d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -456,6 +456,14 @@ F: tools/libs/light/libxl_nonetbuffer.c
>  F:     tools/hotplug/Linux/remus-netbuf-setup
>  F:     tools/hotplug/Linux/block-drbd-probe
>
> +RISCV
> +M:     Bob Eshleman <bobbyeshleman@gmail.com>
> +R:     Connor Davis <connojdavis@gmail.com>
> +S:     Supported
> +F:     config/riscv64.mk
> +F:     xen/arch/riscv/
> +F:     xen/include/asm-riscv/

I volunteer to be a maintainer as well, feel free to say no :)

I did the QEMU RISC-V H extension port and have a pretty good
understanding of the RISC-V Hypervisor extension.

> +
>  RTDS SCHEDULER
>  M:     Dario Faggioli <dfaggioli@suse.com>
>  M:     Meng Xu <mengxu@cis.upenn.edu>
> diff --git a/config/riscv64.mk b/config/riscv64.mk
> new file mode 100644
> index 0000000000..a5a21e5fa2
> --- /dev/null
> +++ b/config/riscv64.mk
> @@ -0,0 +1,5 @@
> +CONFIG_RISCV := y
> +CONFIG_RISCV_64 := y
> +CONFIG_RISCV_$(XEN_OS) := y
> +
> +CONFIG_XEN_INSTALL_SUFFIX :=
> diff --git a/xen/Makefile b/xen/Makefile
> index 7ce7692354..89879fad4c 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -26,7 +26,9 @@ MAKEFLAGS += -rR
>  EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
>
>  ARCH=$(XEN_TARGET_ARCH)
> -SRCARCH=$(shell echo $(ARCH) | sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
> +SRCARCH=$(shell echo $(ARCH) | \
> +          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> +              -e s'/riscv.*/riscv/g')
>
>  # Don't break if the build process wasn't called from the top level
>  # we need XEN_TARGET_ARCH to generate the proper config
> @@ -35,7 +37,8 @@ include $(XEN_ROOT)/Config.mk
>  # Set ARCH/SUBARCH appropriately.
>  export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
>  export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
> -                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
> +                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> +                                -e s'/riscv.*/riscv/g')
>
>  # Allow someone to change their config file
>  export KCONFIG_CONFIG ?= .config
> @@ -335,6 +338,7 @@ _clean: delete-unfresh-files
>         $(MAKE) $(clean) xsm
>         $(MAKE) $(clean) crypto
>         $(MAKE) $(clean) arch/arm
> +       $(MAKE) $(clean) arch/riscv
>         $(MAKE) $(clean) arch/x86
>         $(MAKE) $(clean) test
>         $(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) clean
> diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
> new file mode 100644
> index 0000000000..bd8381c5e0
> --- /dev/null
> +++ b/xen/arch/riscv/Kconfig
> @@ -0,0 +1,47 @@
> +config RISCV
> +       def_bool y
> +
> +config RISCV_64
> +       def_bool y
> +       select 64BIT
> +
> +config ARCH_DEFCONFIG
> +       string
> +       default "arch/riscv/configs/tiny64_defconfig"
> +
> +menu "Architecture Features"
> +
> +source "arch/Kconfig"
> +
> +endmenu
> +
> +menu "ISA Selection"
> +
> +choice
> +       prompt "Base ISA"
> +       default RISCV_ISA_RV64IMA if RISCV_64
> +       help
> +         This selects the base ISA extensions that Xen will target.
> +
> +config RISCV_ISA_RV64IMA
> +       bool "RV64IMA"
> +       help
> +         Use the RV64I base ISA, plus the "M" and "A" extensions
> +         for integer multiply/divide and atomic instructions, respectively.
> +
> +endchoice
> +
> +config RISCV_ISA_C
> +       bool "Compressed extension"
> +       help
> +         Add "C" to the ISA subsets that the toolchain is allowed to
> +         emit when building Xen, which results in compressed instructions
> +         in the Xen binary.
> +
> +         If unsure, say N.

I would change this to y if you are unsure. I don't expect any
hardware to have an MMU (yet along the H extension) and no compressed
instruction extension. Linux won't run without the C extension.

Otherwise looks good:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Now the hard part of getting it to boot.

Alistair

> +
> +endmenu
> +
> +source "common/Kconfig"
> +
> +source "drivers/Kconfig"
> diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> new file mode 100644
> index 0000000000..942e4ffbc1
> --- /dev/null
> +++ b/xen/arch/riscv/Makefile
> @@ -0,0 +1,2 @@
> +.PHONY: include
> +include:
> diff --git a/xen/arch/riscv/Rules.mk b/xen/arch/riscv/Rules.mk
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> new file mode 100644
> index 0000000000..53dadb8975
> --- /dev/null
> +++ b/xen/arch/riscv/arch.mk
> @@ -0,0 +1,14 @@
> +########################################
> +# RISCV-specific definitions
> +
> +CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
> +
> +riscv-march-$(CONFIG_RISCV_ISA_RV64IMA) := rv64ima
> +riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
> +
> +# Note that -mcmodel=medany is used so that Xen can be mapped
> +# into the upper half _or_ the lower half of the address space.
> +# -mcmodel=medlow would force Xen into the lower half.
> +
> +CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
> +CFLAGS += -I$(BASEDIR)/include
> diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
> new file mode 100644
> index 0000000000..3c9a2ff941
> --- /dev/null
> +++ b/xen/arch/riscv/configs/tiny64_defconfig
> @@ -0,0 +1,13 @@
> +# CONFIG_SCHED_CREDIT is not set
> +# CONFIG_SCHED_RTDS is not set
> +# CONFIG_SCHED_NULL is not set
> +# CONFIG_SCHED_ARINC653 is not set
> +# CONFIG_TRACEBUFFER is not set
> +# CONFIG_HYPFS is not set
> +# CONFIG_GRANT_TABLE is not set
> +# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
> +
> +CONFIG_RISCV_64=y
> +CONFIG_DEBUG=y
> +CONFIG_DEBUG_INFO=y
> +CONFIG_EXPERT=y
> diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> new file mode 100644
> index 0000000000..0dbc27ba75
> --- /dev/null
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -0,0 +1,6 @@
> +#include <asm/config.h>
> +
> +        .text
> +
> +ENTRY(start)
> +        j  start
> diff --git a/xen/include/asm-riscv/config.h b/xen/include/asm-riscv/config.h
> new file mode 100644
> index 0000000000..e2ae21de61
> --- /dev/null
> +++ b/xen/include/asm-riscv/config.h
> @@ -0,0 +1,47 @@
> +#ifndef __RISCV_CONFIG_H__
> +#define __RISCV_CONFIG_H__
> +
> +#if defined(CONFIG_RISCV_64)
> +# define LONG_BYTEORDER 3
> +# define ELFSIZE 64
> +# define MAX_VIRT_CPUS 128u
> +#else
> +# error "Unsupported RISCV variant"
> +#endif
> +
> +#define BYTES_PER_LONG (1 << LONG_BYTEORDER)
> +#define BITS_PER_LONG  (BYTES_PER_LONG << 3)
> +#define POINTER_ALIGN  BYTES_PER_LONG
> +
> +#define BITS_PER_LLONG 64
> +
> +/* xen_ulong_t is always 64 bits */
> +#define BITS_PER_XEN_ULONG 64
> +
> +#define CONFIG_RISCV_L1_CACHE_SHIFT 6
> +#define CONFIG_PAGEALLOC_MAX_ORDER  18
> +#define CONFIG_DOMU_MAX_ORDER       9
> +#define CONFIG_HWDOM_MAX_ORDER      10
> +
> +#define OPT_CONSOLE_STR "dtuart"
> +#define INVALID_VCPU_ID MAX_VIRT_CPUS
> +
> +/* Linkage for RISCV */
> +#ifdef __ASSEMBLY__
> +#define ALIGN .align 2
> +
> +#define ENTRY(name)                                \
> +  .globl name;                                     \
> +  ALIGN;                                           \
> +  name:
> +#endif
> +
> +#endif /* __RISCV_CONFIG_H__ */
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.31.1
>

