Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2274580B37
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 08:18:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375024.607284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGDtI-0003Ay-5B; Tue, 26 Jul 2022 06:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375024.607284; Tue, 26 Jul 2022 06:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGDtI-00037T-10; Tue, 26 Jul 2022 06:18:00 +0000
Received: by outflank-mailman (input) for mailman id 375024;
 Tue, 26 Jul 2022 06:17:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idIW=X7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oGDtG-00037J-0F
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 06:17:58 +0000
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [2607:f8b0:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af4a68f8-0caa-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 08:17:55 +0200 (CEST)
Received: by mail-pg1-x52f.google.com with SMTP id f65so12310053pgc.12
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jul 2022 23:17:55 -0700 (PDT)
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
X-Inumbo-ID: af4a68f8-0caa-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JPUEYwXa9Po3sGzwZHY31YLAuN0lGJa2gKdH2VeZSlg=;
        b=CzS6+pGF8tfulOvP8pOKqr10ilq63056Jba5SyklJq/KoQ+DrhZ0yWZ3u2/y1AZEGV
         Gf6YZewG7O6TAbyqkzWQCVEYL/M/TqNjo9QbLcBC4zRd7bqo6D60AvyzsfaVlJ9cv9YD
         CWtRGYUGtQD0ra1f8+tji3MwzDTut5pqjj4PScvUsB6PM7oh2nNGmTFKTGhNJ26v9VXf
         Lg/aALE5NtxxSEQ0bLHDpvimPeq/EDX93WdSs1KBhMxbv9bUWYXspdpP9T5/CTdQPIpx
         lagrWT09QyLvlHmYN8FiPzhTizacd6GXgHii6y47Iq8H71euIFbvcl6L7WWVIwL+FdKK
         Lr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JPUEYwXa9Po3sGzwZHY31YLAuN0lGJa2gKdH2VeZSlg=;
        b=s5Pz/NJow2YupKLYmXDTHm7htXzqVleKEVl6QNoVzDvVjdr/Cj9hJvpj8aUrpy9bU4
         O//U2jqPWs2ZY3R5N+ianxaHiK+/wPRnC47DIqcU9u4mDO01nB3MxvR+qSx3iOk/Zzn+
         O6+AJnmNdlKjkFxIMvXW3p4DZGmzl7toHefyffFyi8zZDUeCItrHipCxi2HrKuZBg6zS
         YQdrBP5xaypeVMuU8uS/d1ayhEWaBiYFkEiN1yX8r/NCYqmyKFk8vway2qB6D43PhBXf
         pf9ygSQ8MEX4VL5CKz8dXeHj+hwQoYzDFcB+lidJsvO4I7zrdvZpTRw3aR7wXy8OwGqR
         vrVg==
X-Gm-Message-State: AJIora+RH8H5MmodNc9O9/C/XYb5rxsaGoTzexk33NgYzJjw45zi4SCq
	EN/fYrB2L7wRvwbMDMah28zah6rBOUzusJSXVWwOC6mfgzM=
X-Google-Smtp-Source: AGRyM1v/HfjVt3T8CpiKIsp8Nxte/mv7CgWyGzgPSDppPcG48uXZ0Gix0gn6zGlr4xv7huUe3fWEq2Arn91vzcx4yak=
X-Received: by 2002:a62:ea18:0:b0:52a:c12b:9313 with SMTP id
 t24-20020a62ea18000000b0052ac12b9313mr15922821pfh.49.1658816273289; Mon, 25
 Jul 2022 23:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220622134219.1596613-1-jens.wiklander@linaro.org>
 <20220622134219.1596613-3-jens.wiklander@linaro.org> <25778cc8-b9d3-ac0d-b8e4-9a7be87d44bc@xen.org>
In-Reply-To: <25778cc8-b9d3-ac0d-b8e4-9a7be87d44bc@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 26 Jul 2022 08:17:41 +0200
Message-ID: <CAHUa44EBUE3Xo+YGj+JBu0ebpW+sDmuvXS5i-GO45K-4ZdiSBA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] xen/arm: add FF-A mediator
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand.Marquis@arm.com, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Fri, Jul 8, 2022 at 3:41 PM Julien Grall <julien@xen.org> wrote:
>
> Hi Jens,
>
> I haven't checked whether the FFA driver is complaint with the spec. I
> mainly checked whether the code makes sense from Xen PoV.
>
> This is a fairly long patch to review. So I will split my review in
> multiple session/e-mail.
>
> On 22/06/2022 14:42, Jens Wiklander wrote:
> > Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
> > Partition in secure world.
> >
> > The implementation is the bare minimum to be able to communicate with
> > OP-TEE running as an SPMC at S-EL1.
> >
> > This is loosely based on the TEE mediator framework and the OP-TEE
> > mediator.
> >
> > [1] https://developer.arm.com/documentation/den0077/latest
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   SUPPORT.md                        |    7 +
> >   tools/libs/light/libxl_arm.c      |    3 +
> >   tools/libs/light/libxl_types.idl  |    1 +
> >   tools/xl/xl_parse.c               |    3 +
>
> These changes would need an ack from the toolstack maintainers.

OK, I'll keep them in CC.

>
> >   xen/arch/arm/Kconfig              |   11 +
> >   xen/arch/arm/Makefile             |    1 +
> >   xen/arch/arm/domain.c             |   10 +
> >   xen/arch/arm/domain_build.c       |    1 +
> >   xen/arch/arm/ffa.c                | 1683 +++++++++++++++++++++++++++++
> >   xen/arch/arm/include/asm/domain.h |    4 +
> >   xen/arch/arm/include/asm/ffa.h    |   71 ++
> >   xen/arch/arm/vsmc.c               |   17 +-
> >   xen/include/public/arch-arm.h     |    2 +
> >   13 files changed, 1811 insertions(+), 3 deletions(-)
> >   create mode 100644 xen/arch/arm/ffa.c
> >   create mode 100644 xen/arch/arm/include/asm/ffa.h
> >
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index 70e98964cbc0..215bb3c9043b 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -785,6 +785,13 @@ that covers the DMA of the device to be passed through.
> >
> >   No support for QEMU backends in a 16K or 64K domain.
> >
> > +### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
> > +
> > +    Status, Arm64: Tech Preview
> > +
> > +There are still some code paths where a vCPU may hog a pCPU longer than
> > +necessary. The FF-A mediator is not yet implemented for Arm32.
> > +
> >   ### ARM: Guest Device Tree support
> >
> >       Status: Supported
> > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> > index eef1de093914..a985609861c7 100644
> > --- a/tools/libs/light/libxl_arm.c
> > +++ b/tools/libs/light/libxl_arm.c
> > @@ -101,6 +101,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >           return ERROR_FAIL;
> >       }
> >
> > +    config->arch.ffa_enabled =
> > +        libxl_defbool_val(d_config->b_info.arch_arm.ffa_enabled);
> > +
> >       return 0;
> >   }
> >
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> > index 2a42da2f7d78..bf4544bef399 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -646,6 +646,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
> >
> >       ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
> >                                  ("vuart", libxl_vuart_type),
> > +                               ("ffa_enabled", libxl_defbool),
>
> This needs to be accompagnied with a define LIBXL_HAVE_* in
> tools/include/libxl.h. Please see the examples in the header.

OK, I'll add something. I'm not entirely sure how this is used so I'm
afraid it will be a bit of Cargo Cult programming from my side.

>
> >                                 ])),
> >       ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
> >                                 ])),
> > diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> > index b98c0de378b6..e0e99ed8d2b1 100644
> > --- a/tools/xl/xl_parse.c
> > +++ b/tools/xl/xl_parse.c
> > @@ -2746,6 +2746,9 @@ skip_usbdev:
> >               exit(-ERROR_FAIL);
> >           }
> >       }
> > +    libxl_defbool_setdefault(&b_info->arch_arm.ffa_enabled, false);
> > +    xlu_cfg_get_defbool(config, "ffa_enabled",
> > +                        &b_info->arch_arm.ffa_enabled, 0);
>
> This option needs to be documented in docs/man/xl.cfg.5.pod.in.

OK

>
> >
> >       parse_vkb_list(config, d_config);
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index be9eff014120..e57e1d3757e2 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -139,6 +139,17 @@ config TEE
> >
> >   source "arch/arm/tee/Kconfig"
> >
> > +config FFA
> > +     bool "Enable FF-A mediator support" if EXPERT
> > +     default n
> > +     depends on ARM_64
> > +     help
> > +       This option enables a minimal FF-A mediator. The mediator is
> > +       generic as it follows the FF-A specification [1], but it only
> > +       implements a small subset of the specification.
>
> Where would a user be able to find which subset of the specification
> that Xen implements?

I'll add a bit more in docs/man/xl.cfg.5.pod.in where I'm describing
ffa_enabled.

>
> > +
> > +       [1] https://developer.arm.com/documentation/den0077/latest
> > +
> >   endmenu
> >
> >   menu "ARM errata workaround via the alternative framework"
> > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > index bb7a6151c13c..af0c69f793d4 100644
> > --- a/xen/arch/arm/Makefile
> > +++ b/xen/arch/arm/Makefile
> > @@ -20,6 +20,7 @@ obj-y += domain_build.init.o
> >   obj-y += domctl.o
> >   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
> >   obj-y += efi/
> > +obj-$(CONFIG_FFA) += ffa.o
> >   obj-y += gic.o
> >   obj-y += gic-v2.o
> >   obj-$(CONFIG_GICV3) += gic-v3.o
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 8110c1df8638..a3f00e7e234d 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -27,6 +27,7 @@
> >   #include <asm/cpufeature.h>
> >   #include <asm/current.h>
> >   #include <asm/event.h>
> > +#include <asm/ffa.h>
> >   #include <asm/gic.h>
> >   #include <asm/guest_atomics.h>
> >   #include <asm/irq.h>
> > @@ -756,6 +757,9 @@ int arch_domain_create(struct domain *d,
> >       if ( (rc = tee_domain_init(d, config->arch.tee_type)) != 0 )
> >           goto fail;
> >
> > +    if ( (rc = ffa_domain_init(d, config->arch.ffa_enabled)) != 0 )
> > +        goto fail;
> > +
> >       update_domain_wallclock_time(d);
> >
> >       /*
> > @@ -998,6 +1002,7 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
> >   enum {
> >       PROG_pci = 1,
> >       PROG_tee,
> > +    PROG_ffa,
> >       PROG_xen,
> >       PROG_page,
> >       PROG_mapping,
> > @@ -1043,6 +1048,11 @@ int domain_relinquish_resources(struct domain *d)
> >
> >       PROGRESS(tee):
> >           ret = tee_relinquish_resources(d);
> > +        if ( ret )
> > +            return ret;
> > +
> > +    PROGRESS(ffa):
> > +        ret = ffa_relinquish_resources(d);
> >           if (ret )
> >               return ret;
> >
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 7ddd16c26da5..d708f76356f7 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -3450,6 +3450,7 @@ void __init create_dom0(void)
> >       if ( gic_number_lines() > 992 )
> >           printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
> >       dom0_cfg.arch.tee_type = tee_get_type();
> > +    dom0_cfg.arch.ffa_enabled = true;
>
> AFAICT, ffa_enabled is a uint8_t. So we should use 1. However, I am not
> convinced that using a uint8_t for what looks like a boolean is warrant.
> I will detail more on the definition.

OK

>
> >       dom0_cfg.max_vcpus = dom0_max_vcpus();
> >
> >       if ( iommu_enabled )
> > diff --git a/xen/arch/arm/ffa.c b/xen/arch/arm/ffa.c
> > new file mode 100644
> > index 000000000000..3117ce5cec4d
> > --- /dev/null
> > +++ b/xen/arch/arm/ffa.c
> > @@ -0,0 +1,1683 @@
> > +/*
> > + * xen/arch/arm/ffa.c
> > + *
> > + * Arm Firmware Framework for ARMv8-A (FF-A) mediator
> > + *
> > + * Copyright (C) 2022  Linaro Limited
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> > + * obtaining a copy of this software and associated documentation
> > + * files (the "Software"), to deal in the Software without restriction,
> > + * including without limitation the rights to use, copy, modify, merge,
> > + * publish, distribute, sublicense, and/or sell copies of the Software,
> > + * and to permit persons to whom the Software is furnished to do so,
> > + * subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> > + * included in all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
> > + * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> > + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> > + * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> > + * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>
> This doesn't look like to be a GPLv2 license. Can you clarify which
> license you are using?

I'll switch to the GPLv2 license to keep things simple.

>
> > + */
> > +
> > +#include <xen/domain_page.h>
> > +#include <xen/errno.h>
> > +#include <xen/init.h>
> > +#include <xen/lib.h>
> > +#include <xen/sched.h>
> > +#include <xen/types.h>
> > +#include <xen/sizes.h>
> > +#include <xen/bitops.h>
> > +
> > +#include <asm/smccc.h>
> > +#include <asm/event.h>
> > +#include <asm/ffa.h>
> > +#include <asm/regs.h>
> > +
> > +/* Error codes */
>
> All the #define below are using hard tab. Please use soft tab.

OK

>
> > +#define FFA_RET_OK                   0
> > +#define FFA_RET_NOT_SUPPORTED                -1
> > +#define FFA_RET_INVALID_PARAMETERS   -2
> > +#define FFA_RET_NO_MEMORY            -3
> > +#define FFA_RET_BUSY                 -4
> > +#define FFA_RET_INTERRUPTED          -5
> > +#define FFA_RET_DENIED                       -6
> > +#define FFA_RET_RETRY                        -7
> > +#define FFA_RET_ABORTED                      -8
> > +
> > +/* FFA_VERSION helpers */
> > +#define FFA_VERSION_MAJOR            _AC(1,U)
>
> NIT: The use of _AC() is a bit pointless given that you are only use the
> values in C code.

OK, I'll drop the _AC() usage.

>
> > +#define FFA_VERSION_MAJOR_SHIFT              _AC(16,U)
> > +#define FFA_VERSION_MAJOR_MASK               _AC(0x7FFF,U)
> > +#define FFA_VERSION_MINOR            _AC(1,U)
> > +#define FFA_VERSION_MINOR_SHIFT              _AC(0,U)
> > +#define FFA_VERSION_MINOR_MASK               _AC(0xFFFF,U)
> > +#define MAKE_FFA_VERSION(major, minor)       \
> > +     ((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT) | \
> > +      ((minor) & FFA_VERSION_MINOR_MASK))
> > +
> > +#define FFA_MIN_VERSION              MAKE_FFA_VERSION(1, 0)
> > +#define FFA_VERSION_1_0              MAKE_FFA_VERSION(1, 0)
> > +#define FFA_VERSION_1_1              MAKE_FFA_VERSION(1, 1)
> > +#define FFA_MY_VERSION               MAKE_FFA_VERSION(FFA_VERSION_MAJOR, \
> > +                                              FFA_VERSION_MINOR)
>
> NIT: I think it would be better that FFA_VERSION_MAJOR AND
> FFA_VERSION_MINOR are defined closer to FFA_MY_VERSION and they are
> renamed to FFA_MY_VERSION_*.

OK

>
> I would also potentially move the 3 defines past all the definition
> related to the specification. This would make clearer that this is what
> Xen supports.

I couldn't find a good spot below so I'll add a comment here instead
to make it more clear.

>
> > +
> > +
> > +#define FFA_HANDLE_HYP_FLAG             BIT(63,ULL)
>
> Coding style: You seem to use a mix of FOO(... , ...) and FOO(...,...).
> At mimimum, please be consistent within the file.
>
> For Xen, we usually add a space after the comma.

I'll do that.

>
> [...]
>
> > +/*
> > + * Our rx/rx buffer shared with the SPMC
> > + */
>
> Hmmm... The comment seems to be misplaced.
>
> > +static uint32_t ffa_version;
>
> This probably can be __read_mostly.
>
> > +static uint16_t *subsr_vm_created;
>
> What subsr stand for?

Subscribers. Not sure how I came to shorten it in that way, maybe I
slipped on the keyboard :-). But it is a bit long to spell out. I'll
add a comment.

>
> > +static unsigned int subsr_vm_created_count;
> > +static uint16_t *subsr_vm_destroyed;
> > +static unsigned int subsr_vm_destroyed_count;
> > +static void *ffa_rx;
> > +static void *ffa_tx;
>
> subsr_vm_created, subsr_vm_destroyed, ffa_rx and ffa_tx can probably be
> __read_mostly.

Agree, I'll fix.

>
> > +static unsigned int ffa_page_count;
>
> Is this related to ffa_rx?

Yes, the number of pages used each by ffa_rx and ffa_tx. I'll add a comment.

>
> > +static DEFINE_SPINLOCK(ffa_buffer_lock);
> > +
> > +static LIST_HEAD(ffa_mem_list);
> > +static DEFINE_SPINLOCK(ffa_mem_list_lock);
> > +
> > +static uint64_t next_handle = FFA_HANDLE_HYP_FLAG;
>
> next_handle only seems to be used handle_mem_share(). So I think it
> would be better to move the definition (as static) within the function.
>
> This will reduce the number of global variables.

OK

>
> > +
> > +static inline uint64_t reg_pair_to_64(uint32_t reg0, uint32_t reg1)
> > +{
> > +    return (uint64_t)reg0 << 32 | reg1;
> > +}
> > +
> > +static void inline reg_pair_from_64(uint32_t *reg0, uint32_t *reg1,
> > +                                    uint64_t val)
> > +{
> > +    *reg0 = val >> 32;
> > +    *reg1 = val;
> > +}
>
> Those two functions are the same as optee.c but with a different. I
> would rather prefer if we avoid the duplication and provide generic
> helpers in a pre-requisite.

These functions are trivial but at the same time for a special purpose
which happens to coincide with the usage in optee.c. I can't find a
suitable common .h file and creating a new one seems a bit much.

>
> > +
> > +static bool ffa_get_version(uint32_t *vers)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = {
> > +        .a0 = FFA_VERSION, .a1 = FFA_MY_VERSION,
>
> Coding sytle: Please set each field on their own line.

OK

>
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +    if ( resp.a0 == FFA_RET_NOT_SUPPORTED )
> > +    {
> > +        printk(XENLOG_ERR "ffa: FFA_VERSION returned not supported\n");
> > +        return false;
> > +    }
> > +
> > +    *vers = resp.a0;
>
> Coding style: We tend to add a newline before the last return. I am not
> necessarily going to comment about this on all the instances. So please
> have a look through the code.

OK

>
> > +    return true;
> > +}
> > +
> > +static uint32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
>
> FFA_RET_* will be negative, so shouldn't this return int32_t?

You're right, I'll update as needed.

>
> > +{
> > +    switch ( resp->a0 )
> > +    {
> > +    case FFA_ERROR:
> > +        if ( resp->a2 )
> > +            return resp->a2;
> > +        else
> > +            return FFA_RET_NOT_SUPPORTED;
> > +    case FFA_SUCCESS_32:
> > +    case FFA_SUCCESS_64:
> > +        return FFA_RET_OK;
> > +    default:
> > +        return FFA_RET_NOT_SUPPORTED;
> > +    }
> > +}
> > +
> > +static uint32_t ffa_features(uint32_t id)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = { .a0 = FFA_FEATURES, .a1 = id, };
>
> Coding style. Please split each field on their own line.

OK

>
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +    return get_ffa_ret_code(&resp);
> > +}
> > +
> > +static bool check_mandatory_feature(uint32_t id)
> > +{
> > +    uint32_t ret = ffa_features(id);
> > +
> > +    if (ret)
> > +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing\n", id);
> > +    return !ret;
> > +}
> > +
> > +static uint32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
> > +                             uint32_t page_count)
>
> Aside the parameters, the helper looks very similar to ffa_features(),
> ffa_rxtx_unmap(). Can this be abstracted? Maybe using macro if you still
> want to have separate helper name.

OK, I'll try something.

>
> > +{
> > +    const struct arm_smccc_1_2_regs arg = {
> > +#ifdef CONFIG_ARM_64
> > +        .a0 = FFA_RXTX_MAP_64,
> > +#endif
> > +#ifdef CONFIG_ARM_32
> > +        .a0 = FFA_RXTX_MAP_32,
> > +#endif
> > +     .a1 = tx_addr, .a2 = rx_addr,
>
> Coding: Please don't use hard tab and put each field on their own line.

OK

>
> > +        .a3 = page_count,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    return get_ffa_ret_code(&resp);
> > +}
> > +
> > +static uint32_t ffa_rxtx_unmap(uint16_t vm_id)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = {
> > +        .a0 = FFA_RXTX_UNMAP, .a1 = vm_id,
>
> Coding style. Please add each field on their own line.

OK

>
>
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    return get_ffa_ret_code(&resp);
> > +}
> > +
> > +static uint32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
> > +                                       uint32_t w4, uint32_t w5,
> > +                                       uint32_t *count)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = {
> > +        .a0 = FFA_PARTITION_INFO_GET, .a1 = w1, .a2 = w2, .a3 = w3, .a4 = w4,
>
> Ditto.

OK

>
> > +        .a5 = w5,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +    uint32_t ret;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    ret = get_ffa_ret_code(&resp);
> > +    if ( !ret )
> > +        *count = resp.a2;
> > +
> > +    return ret;
> > +}
> > +
> > +static uint32_t ffa_rx_release(void)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = { .a0 = FFA_RX_RELEASE, };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    return get_ffa_ret_code(&resp);
> > +}
> > +
> > +static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
> > +                             register_t addr, uint32_t pg_count,
> > +                             uint64_t *handle)
> > +{
> > +    struct arm_smccc_1_2_regs arg = {
> > +        .a0 = FFA_MEM_SHARE_32, .a1 = tot_len, .a2 = frag_len, .a3 = addr,
>
> Ditto.

OK

>
> > +        .a4 = pg_count,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    /*
> > +     * For arm64 we must use 64-bit calling convention if the buffer isn't
> > +     * passed in our tx buffer.
> > +     */
>
> Can you explain why we would want to use the 32-bit calling convention
> if addr is 0?

I was trying to avoid the 64-bit calling convention where possible,
but ffa_rxtx_map() still depends on 64-bit calling convention. So it's
useless here, I'll remove that check.

>
> > +    if (sizeof(addr) > 4 && addr)
>
> sizeof(addr) > 4 is a bit odd to read. I think it would be better to
> check that CONFIG_ARM_64 is set (i.e. IS_ENABLED()).

Thanks, I'll fix.

>
> > +        arg.a0 = FFA_MEM_SHARE_64;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    switch ( resp.a0 )
> > +    {
> > +    case FFA_ERROR:
> > +        if ( resp.a2 )
> > +            return resp.a2;
> > +        else
> > +            return FFA_RET_NOT_SUPPORTED;
> > +    case FFA_SUCCESS_32:
> > +        *handle = reg_pair_to_64(resp.a3, resp.a2);
> > +        return FFA_RET_OK;
> > +    case FFA_MEM_FRAG_RX:
> > +        *handle = reg_pair_to_64(resp.a2, resp.a1);
> > +        return resp.a3;
> > +    default:
> > +        return FFA_RET_NOT_SUPPORTED;
> > +    }
> > +}
> > +
> > +static int32_t ffa_mem_frag_tx(uint64_t handle, uint32_t frag_len,
> > +                               uint16_t sender_id)
> > +{
> > +    struct arm_smccc_1_2_regs arg = {
> > +        .a0 = FFA_MEM_FRAG_TX, .a1 = handle & UINT32_MAX, .a2 = handle >> 32,
> > +        .a3 = frag_len, .a4 = (uint32_t)sender_id << 16,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    switch ( resp.a0 )
> > +    {
> > +    case FFA_ERROR:
> > +        if ( resp.a2 )
> > +            return resp.a2;
> > +        else
> > +            return FFA_RET_NOT_SUPPORTED;
> > +    case FFA_SUCCESS_32:
> > +        return FFA_RET_OK;
> > +    case FFA_MEM_FRAG_RX:
> > +        return resp.a3;
> > +    default:
> > +            return FFA_RET_NOT_SUPPORTED;
> > +    }
> > +}
> > +
> > +static uint32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
> > +                                uint32_t flags)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = {
> > +        .a0 = FFA_MEM_RECLAIM, .a1 = handle_lo, .a2 = handle_hi, .a3 = flags,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    return get_ffa_ret_code(&resp);
> > +}
> > +
> > +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
>
> OOI, why is this call returns int32_t when all the other use uint32_t
> (even if may returned negative values)?

I'll fix all those other functions.

>
> > +                                      uint8_t msg)
> > +{
> > +    uint32_t exp_resp = FFA_MSG_FLAG_FRAMEWORK;
> > +    int32_t res;
> > +
> > +    if ( msg != FFA_MSG_SEND_VM_CREATED && msg !=FFA_MSG_SEND_VM_DESTROYED )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +
> > +    if ( msg == FFA_MSG_SEND_VM_CREATED )
> > +        exp_resp |= FFA_MSG_RESP_VM_CREATED;
> > +    else
> > +        exp_resp |= FFA_MSG_RESP_VM_DESTROYED;
>
> NIT: I think it would be easier to read if you drop the first 'if' and
> instead write:
>
> if ( msg == ..._CREATED )
>    ...
> else if ( msg == ..._DESTROYED )
>    ...
> else
>    return FFA_RET_INVALID_PARAMETERS.

Thanks, I'll fix.

>
> > +
> > +    do {
> > +        const struct arm_smccc_1_2_regs arg = {
> > +            .a0 = FFA_MSG_SEND_DIRECT_REQ_32,
> > +            .a1 = sp_id,
> > +            .a2 = FFA_MSG_FLAG_FRAMEWORK | msg,
> > +            .a5 = vm_id,
> > +        };
> > +        struct arm_smccc_1_2_regs resp;
> > +
> > +        arm_smccc_1_2_smc(&arg, &resp);
> > +        if ( resp.a0 != FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 != exp_resp )
> > +        {
> > +            /*
> > +             * This is an invalid response, likely due to some error in the
> > +             * implementation of the ABI.
> > +             */
> > +            return FFA_RET_INVALID_PARAMETERS;
> > +        }
> > +        res = resp.a3;
> > +    } while ( res == FFA_RET_INTERRUPTED || res == FFA_RET_RETRY );
> > +
> > +    return res;
> > +}
> > +
> > +static u16 get_vm_id(struct domain *d)
>
> d is not meant to be modified by the helper. So please use 'const'.

OK

>
> > +{
> > +    /* +1 since 0 is reserved for the hypervisor in FF-A */
> > +    return d->domain_id + 1;
> > +}
> > +
> > +static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
> > +                     register_t v2, register_t v3, register_t v4, register_t v5,
> > +                     register_t v6, register_t v7)
> > +{
> > +        set_user_reg(regs, 0, v0);
> > +        set_user_reg(regs, 1, v1);
> > +        set_user_reg(regs, 2, v2);
> > +        set_user_reg(regs, 3, v3);
> > +        set_user_reg(regs, 4, v4);
> > +        set_user_reg(regs, 5, v5);
> > +        set_user_reg(regs, 6, v6);
> > +        set_user_reg(regs, 7, v7);
> > +}
> > +
> > +static void set_regs_error(struct cpu_user_regs *regs, uint32_t error_code)
> > +{
> > +    set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
> > +}
> > +
> > +static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
> > +                             uint32_t w3)
> > +{
> > +    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> > +}
> > +
> > +static void set_regs_frag_rx(struct cpu_user_regs *regs, uint32_t handle_lo,
> > +                             uint32_t handle_hi, uint32_t frag_offset,
> > +                             uint16_t sender_id)
> > +{
> > +    set_regs(regs, FFA_MEM_FRAG_RX, handle_lo, handle_hi, frag_offset,
> > +             (uint32_t)sender_id << 16, 0, 0, 0);
> > +}
> > +
> > +static void handle_version(struct cpu_user_regs *regs)
> > +{
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +    uint32_t vers = get_user_reg(regs, 1);
> > +
> > +    if ( vers < FFA_VERSION_1_1 )
> > +        vers = FFA_VERSION_1_0;
> > +    else
> > +        vers = FFA_VERSION_1_1;
>
> I find a bit strange to 'cap' the version provided by the user. Is this
> part of the spec?

Yes, it's part of the spec. The user supplies its version and we reply
with the version closest to that which we can handle. Then we must
remember that so we use the correct version of structs etc.

>
> > +
> > +    ctx->guest_vers = vers;
> > +    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> > +}
> > +
> > +static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
> > +                                register_t rx_addr, uint32_t page_count)
>
> Xen, Linux, and the firmware may use different page size. Below, you
> seem to have the page size will always be 4KB. Is this guaranteed by the
> spec? If not, how do all the 3 components agree on it?

The page size is always 4KB, but the smallest memory unit may be
larger, 16KB or 64KB if I remember correctly.


>
> If yes, then I think this should be written down and we should have a
> BUILD_BUG_ON(PAGE_SIZE != SZ_4K).

However, here I've assumed 4KB as the smallest memory unit so I'll add
the BUILD_BUG_ON() for now.

>
> > +{
> > +    uint32_t ret = FFA_RET_INVALID_PARAMETERS;
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +    struct page_info *tx_pg;
> > +    struct page_info *rx_pg;
> > +    p2m_type_t t;
> > +    void *rx;
> > +    void *tx;
> > +
> > +    if ( !smccc_is_conv_64(fid) )
> > +    {
> > +        tx_addr &= UINT32_MAX;
> > +        rx_addr &= UINT32_MAX;
> > +    }
> > +
> > +    /* For now to keep things simple, only deal with a single page */
> > +    if ( page_count != 1 )
> > +        return FFA_RET_NOT_SUPPORTED;
> > +
> > +    /* Already mapped */
> > +    if ( ctx->rx )
> > +        return FFA_RET_DENIED;
> > +
> > +    tx_pg = get_page_from_gfn(d, gaddr_to_gfn(tx_addr), &t, P2M_ALLOC);
> > +    if ( !tx_pg )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +    /* Only normal RAM for now */
>
> This comment suggests the check below should be p2m_is_ram() but you are
> using p2m_ram_rw.

Thanks, I'll fix.

>
> > +    if (t != p2m_ram_rw)
>
> Coding style: if ( ... )

OK

>
> > +        goto err_put_tx_pg;
> > +
> > +    rx_pg = get_page_from_gfn(d, gaddr_to_gfn(rx_addr), &t, P2M_ALLOC);
> > +    if ( !tx_pg )
> > +        goto err_put_tx_pg;
> > +    /* Only normal RAM for now */
>
> Same about the comment.

OK


>
> > +    if ( t != p2m_ram_rw )
> > +        goto err_put_rx_pg;
> > +
> > +    tx = /(tx_pg);
> > +    if ( !tx )
> > +        goto err_put_rx_pg;
> > +
> > +    rx = __map_domain_page_global(rx_pg);
> > +    if ( !rx )
> > +        goto err_unmap_tx;
> > +
> > +    ctx->rx = rx;
> > +    ctx->tx = tx;
> > +    ctx->rx_pg = rx_pg;
> > +    ctx->tx_pg = tx_pg;
> > +    ctx->page_count = 1;
> > +    ctx->tx_is_mine = true;
> > +    return FFA_RET_OK;
> > +
> > +err_unmap_tx:
> > +    unmap_domain_page_global(tx);
> > +err_put_rx_pg:
> > +    put_page(rx_pg);
> > +err_put_tx_pg:
> > +    put_page(tx_pg);
> > +    return ret;
> > +}
> > +
> > +static uint32_t handle_rxtx_unmap(void)
> > +{
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +    uint32_t ret;
> > +
> > +    if ( !ctx->rx )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +
> > +    ret = ffa_rxtx_unmap(get_vm_id(d));
> > +    if ( ret )
> > +        return ret;
> > +
> > +    unmap_domain_page_global(ctx->rx);
> > +    unmap_domain_page_global(ctx->tx);
> > +    put_page(ctx->rx_pg);
> > +    put_page(ctx->tx_pg);
> > +    ctx->rx = NULL;
> > +    ctx->tx = NULL;
> > +    ctx->rx_pg = NULL;
> > +    ctx->tx_pg = NULL;
> > +    ctx->page_count = 0;
> > +    ctx->tx_is_mine = false;
> > +
> > +    return FFA_RET_OK;
> > +}
> > +
> > +static uint32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
> > +                                          uint32_t w4, uint32_t w5,
> > +                                          uint32_t *count)
> > +{
> > +    uint32_t ret = FFA_RET_DENIED;
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +
> > +    if ( !ffa_page_count )
> > +        return FFA_RET_DENIED;
> > +
> > +    spin_lock(&ctx->lock);
> > +    if ( !ctx->page_count || !ctx->tx_is_mine )
> > +        goto out;
> > +    ret = ffa_partition_info_get(w1, w2, w3, w4, w5, count);
> > +    if ( ret )
> > +        goto out;
> > +    if ( ctx->guest_vers == FFA_VERSION_1_0 )
> > +    {
> > +        size_t n;
> > +        struct ffa_partition_info_1_1 *src = ffa_rx;
> > +        struct ffa_partition_info_1_0 *dst = ctx->rx;
> > +
> > +        for ( n = 0; n < *count; n++ )
>
> Who is going to sanitize 'count' and how do you make sure that...
>
> > +        {
> > +            dst[n].id = src[n].id;
>
> ... this will still be written within the page provided by the domain?

Good point, I'll add some checks.

>
> > +            dst[n].execution_context = src[n].execution_context;
> > +            dst[n].partition_properties = src[n].partition_properties;
> > +        }
> > +    }
> > +    else
> > +    {
> > +        size_t sz = *count * sizeof(struct ffa_partition_info_1_1);
> > +
> > +        memcpy(ctx->rx, ffa_rx, sz);
> > +    }
> > +    ffa_rx_release();
>
> I saw above that you are expecting the ffa_rx to be "locked". Will it be
> the firmware to block another thread that may need ffa_rx?

It's firmware (SPMC) which writes into ffa_rx. At the same time it's
marking ffa_rx as used and will refuse another call which would also
mark ffa_rx as used until ffa_rx_release() has been called. If another
thread also tries to use ffa_rx before it has been released the SPMC
will return FFA_RET_BUSY. So SPMC isn't blocking it's rather
preventing another thread. I'll add a spinlock for the ffa_rx buffer
too.

>
> > +    ctx->tx_is_mine = false;
> > +out:
> > +    spin_unlock(&ctx->lock);
> > +
> > +    return ret;
> > +}
> > +
> > +static uint32_t handle_rx_release(void)
> > +{
> > +    uint32_t ret = FFA_RET_DENIED;
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +
> > +    spin_lock(&ctx->lock);
> > +    if ( !ctx->page_count || ctx->tx_is_mine )
> > +        goto out;
> > +    ret = FFA_RET_OK;
> > +    ctx->tx_is_mine = true;
> > +out:
> > +    spin_unlock(&ctx->lock);
> > +
> > +    return ret;
> > +}
> > +
> > +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
> > +{
> > +    struct arm_smccc_1_2_regs arg = { .a0 = fid, };
> > +    struct arm_smccc_1_2_regs resp = { };
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +    uint32_t src_dst;
> > +    uint64_t mask;
> > +
> > +    if ( smccc_is_conv_64(fid) )
> > +        mask = 0xffffffffffffffff;
> > +    else
> > +        mask = 0xffffffff;
>
> Please use GENMASK() (or similar). So it is easier to confirm the number
> of 'f' is correct.

OK

>
> > +
> > +    src_dst = get_user_reg(regs, 1);
> > +    if ( (src_dst >> 16) != get_vm_id(d) )
> > +    {
> > +        resp.a0 = FFA_ERROR;
> > +        resp.a2 = FFA_RET_INVALID_PARAMETERS;
> > +        goto out;
> > +    }
> > +
> > +    arg.a1 = src_dst;
> > +    arg.a2 = get_user_reg(regs, 2) & mask;
> > +    arg.a3 = get_user_reg(regs, 3) & mask;
> > +    arg.a4 = get_user_reg(regs, 4) & mask;
> > +    arg.a5 = get_user_reg(regs, 5) & mask;
> > +    arg.a6 = get_user_reg(regs, 6) & mask;
> > +    arg.a7 = get_user_reg(regs, 7) & mask;
> > +
> > +    while ( true )
> > +    {
> > +        arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +        switch ( resp.a0 )
> > +        {
> > +        case FFA_INTERRUPT:
> > +            ctx->interrupted = true;
> > +            goto out;
> > +        case FFA_ERROR:
> > +        case FFA_SUCCESS_32:
> > +        case FFA_SUCCESS_64:
> > +        case FFA_MSG_SEND_DIRECT_RESP_32:
> > +        case FFA_MSG_SEND_DIRECT_RESP_64:
> > +            goto out;
> > +        default:
> > +            /* Bad fid, report back. */
> > +            memset(&arg, 0, sizeof(arg));
> > +            arg.a0 = FFA_ERROR;
> > +            arg.a1 = src_dst;
> > +            arg.a2 = FFA_RET_NOT_SUPPORTED;
> > +            continue;
> > +        }
> > +    }
> > +
> > +out:
> > +    set_user_reg(regs, 0, resp.a0);
> > +    set_user_reg(regs, 1, resp.a1 & mask);
> > +    set_user_reg(regs, 2, resp.a2 & mask);
> > +    set_user_reg(regs, 3, resp.a3 & mask);
> > +    set_user_reg(regs, 4, resp.a4 & mask);
> > +    set_user_reg(regs, 5, resp.a5 & mask);
> > +    set_user_reg(regs, 6, resp.a6 & mask);
> > +    set_user_reg(regs, 7, resp.a7 & mask);
>
> You have already an helper to set all the registers. Why not using it?

OK

>
> > +}
>
> I will continue the rest of the review at a later point.

Thanks for reviewing this far.

Cheers,
Jens

