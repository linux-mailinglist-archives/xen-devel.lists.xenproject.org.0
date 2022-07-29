Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212B7584E7B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 12:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377444.610659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHMqJ-0004Ek-HM; Fri, 29 Jul 2022 10:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377444.610659; Fri, 29 Jul 2022 10:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHMqJ-0004Bx-Eb; Fri, 29 Jul 2022 10:03:39 +0000
Received: by outflank-mailman (input) for mailman id 377444;
 Fri, 29 Jul 2022 10:03:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=llaK=YC=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oHMqH-0004Br-R1
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 10:03:37 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b57eebc6-0f25-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 12:03:36 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id w7so4145614ply.12
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 03:03:36 -0700 (PDT)
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
X-Inumbo-ID: b57eebc6-0f25-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/LXI3L17+WtGu616rS/nHNIU6OsczQPnLRSBLTdg8kE=;
        b=VZatfwLi3AzAViuLuLgUSRFaJZQhrYImrUBRZgI7aF7WrnNbNt1PB3uRxMbOv6lzD7
         9LmrMwQMEE2BZBE/nNbZojpLCrqlj4Bclg4CAIemoEXwfApjAIQnCPmEEojEnF60Ye5o
         UcVzl6OCE5efpYx3hyVbe4mdMxaFdGbMa1hlLVmP2qSLzgLh1waKilKdPsvyUe4gER+M
         7MSZT1mr2EJ0VCP6rHDgX/+aOu3W0bsqK0tRS3eTGZ3ID5kIToha8qYrEFOXY/mMPSgM
         4y1+bzY8wUJ0/OF3kog+33uVC9A3LD3OouVAvnCLdWrQzFkicqK07HEaS0Px4h3iw7+2
         T9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/LXI3L17+WtGu616rS/nHNIU6OsczQPnLRSBLTdg8kE=;
        b=zuA13Z9LmGxueVjNCCr8LBKHus8Nd2iIxTqNIOi/S0xABcMbN59YaW8hj/q4Z/dE04
         uH1WQvOmUp7gxYabewYkwpJVAXHndbdZh5X7/dg9r0tdWl2cSJKckKHQWXlCRF2IVC+C
         sBT4QtMsK2+ufp1nfwZitQflJH1EOeMjO6dKJQrMR2b/PQsHstQNnSbxQYThXOyW8pX8
         Bl60uZalqCTooLKyO4QRz/5NUminL9vJ1hpWmRw7KLPKinAq6/DQgQa43Emj+/LMTNGj
         rRxnz3elvCQD7k+tD8ecHi2Er0SEGTpAtV5QG6RjylcOP4XWHvcS7SYjtRnOK4b1hKap
         XYqQ==
X-Gm-Message-State: ACgBeo1c3k8VYEYLpHEo6nLaYZJNc17pKVtZfiKTT5Yrsei9SQVnkAqi
	sLrhjaIy0YB7g19DkaRPXPjxh5FHles43+gblhhrLkg4mUc=
X-Google-Smtp-Source: AA6agR6ObIrIOOOd+uCaSudrMUFSObKxQZBbgP0XfZv7I+3y1Cg4rkggGnSkJ/cXuqMAHZF4eOHgb3KKKiSpRhRZXas=
X-Received: by 2002:a17:902:f101:b0:16d:c0ae:acd5 with SMTP id
 e1-20020a170902f10100b0016dc0aeacd5mr3071809plb.70.1659089014391; Fri, 29 Jul
 2022 03:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220622134219.1596613-1-jens.wiklander@linaro.org>
 <20220622134219.1596613-3-jens.wiklander@linaro.org> <25778cc8-b9d3-ac0d-b8e4-9a7be87d44bc@xen.org>
 <CAHUa44EBUE3Xo+YGj+JBu0ebpW+sDmuvXS5i-GO45K-4ZdiSBA@mail.gmail.com> <307cef37-e48f-e66f-3550-85c0c50cbb7e@xen.org>
In-Reply-To: <307cef37-e48f-e66f-3550-85c0c50cbb7e@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 29 Jul 2022 12:03:23 +0200
Message-ID: <CAHUa44GbUwAYxi4zTO=7QUCBKaFfF1fM5RD=AOD_iEUDChLpJA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] xen/arm: add FF-A mediator
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand.Marquis@arm.com, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Jul 28, 2022 at 9:15 PM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 26/07/2022 07:17, Jens Wiklander wrote:
> > On Fri, Jul 8, 2022 at 3:41 PM Julien Grall <julien@xen.org> wrote:
> >>
> >> Hi Jens,
> >>
> >> I haven't checked whether the FFA driver is complaint with the spec. I
> >> mainly checked whether the code makes sense from Xen PoV.
> >>
> >> This is a fairly long patch to review. So I will split my review in
> >> multiple session/e-mail.
> >>
> >> On 22/06/2022 14:42, Jens Wiklander wrote:
> >>> Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
> >>> Partition in secure world.
> >>>
> >>> The implementation is the bare minimum to be able to communicate with
> >>> OP-TEE running as an SPMC at S-EL1.
> >>>
> >>> This is loosely based on the TEE mediator framework and the OP-TEE
> >>> mediator.
> >>>
> >>> [1] https://developer.arm.com/documentation/den0077/latest
> >>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>> ---
> >>>    SUPPORT.md                        |    7 +
> >>>    tools/libs/light/libxl_arm.c      |    3 +
> >>>    tools/libs/light/libxl_types.idl  |    1 +
> >>>    tools/xl/xl_parse.c               |    3 +
> >>
> >> These changes would need an ack from the toolstack maintainers.
> >
> > OK, I'll keep them in CC.
> >
> >>
> >>>    xen/arch/arm/Kconfig              |   11 +
> >>>    xen/arch/arm/Makefile             |    1 +
> >>>    xen/arch/arm/domain.c             |   10 +
> >>>    xen/arch/arm/domain_build.c       |    1 +
> >>>    xen/arch/arm/ffa.c                | 1683 +++++++++++++++++++++++++++++
> >>>    xen/arch/arm/include/asm/domain.h |    4 +
> >>>    xen/arch/arm/include/asm/ffa.h    |   71 ++
> >>>    xen/arch/arm/vsmc.c               |   17 +-
> >>>    xen/include/public/arch-arm.h     |    2 +
> >>>    13 files changed, 1811 insertions(+), 3 deletions(-)
> >>>    create mode 100644 xen/arch/arm/ffa.c
> >>>    create mode 100644 xen/arch/arm/include/asm/ffa.h
> >>>
> >>> diff --git a/SUPPORT.md b/SUPPORT.md
> >>> index 70e98964cbc0..215bb3c9043b 100644
> >>> --- a/SUPPORT.md
> >>> +++ b/SUPPORT.md
> >>> @@ -785,6 +785,13 @@ that covers the DMA of the device to be passed through.
> >>>
> >>>    No support for QEMU backends in a 16K or 64K domain.
> >>>
> >>> +### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
> >>> +
> >>> +    Status, Arm64: Tech Preview
> >>> +
> >>> +There are still some code paths where a vCPU may hog a pCPU longer than
> >>> +necessary. The FF-A mediator is not yet implemented for Arm32.
> >>> +
> >>>    ### ARM: Guest Device Tree support
> >>>
> >>>        Status: Supported
> >>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> >>> index eef1de093914..a985609861c7 100644
> >>> --- a/tools/libs/light/libxl_arm.c
> >>> +++ b/tools/libs/light/libxl_arm.c
> >>> @@ -101,6 +101,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >>>            return ERROR_FAIL;
> >>>        }
> >>>
> >>> +    config->arch.ffa_enabled =
> >>> +        libxl_defbool_val(d_config->b_info.arch_arm.ffa_enabled);
> >>> +
> >>>        return 0;
> >>>    }
> >>>
> >>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> >>> index 2a42da2f7d78..bf4544bef399 100644
> >>> --- a/tools/libs/light/libxl_types.idl
> >>> +++ b/tools/libs/light/libxl_types.idl
> >>> @@ -646,6 +646,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
> >>>
> >>>        ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
> >>>                                   ("vuart", libxl_vuart_type),
> >>> +                               ("ffa_enabled", libxl_defbool),
> >>
> >> This needs to be accompagnied with a define LIBXL_HAVE_* in
> >> tools/include/libxl.h. Please see the examples in the header.
> >
> > OK, I'll add something. I'm not entirely sure how this is used so I'm
> > afraid it will be a bit of Cargo Cult programming from my side.
>
> The LIBXL_HAVE* by toolstack built on top of libxl (like virtio) to know
> whether a future is supported by the current library.
>
> [...]
>
> >>
> >>> +
> >>> +static inline uint64_t reg_pair_to_64(uint32_t reg0, uint32_t reg1)
> >>> +{
> >>> +    return (uint64_t)reg0 << 32 | reg1;
> >>> +}
> >>> +
> >>> +static void inline reg_pair_from_64(uint32_t *reg0, uint32_t *reg1,
> >>> +                                    uint64_t val)
> >>> +{
> >>> +    *reg0 = val >> 32;
> >>> +    *reg1 = val;
> >>> +}
> >>
> >> Those two functions are the same as optee.c but with a different. I
> >> would rather prefer if we avoid the duplication and provide generic
> >> helpers in a pre-requisite.
> >
> > These functions are trivial but at the same time for a special purpose
> > which happens to coincide with the usage in optee.c. I can't find a
> > suitable common .h file and creating a new one seems a bit much.
>
> I would implement it in regs.h.

OK, thanks.

>
> [...]
>
> >>> +        .a4 = pg_count,
> >>> +    };
> >>> +    struct arm_smccc_1_2_regs resp;
> >>> +
> >>> +    /*
> >>> +     * For arm64 we must use 64-bit calling convention if the buffer isn't
> >>> +     * passed in our tx buffer.
> >>> +     */
> >>
> >> Can you explain why we would want to use the 32-bit calling convention
> >> if addr is 0?
> >
> > I was trying to avoid the 64-bit calling convention where possible,
>
> OOI, why are you trying to avoid the 64-bit calling convention?

To make it easier to support a use-case where the SPMC is using
AArch32, but I'm not sure it's realistic any longer.

Cheers,
Jens

