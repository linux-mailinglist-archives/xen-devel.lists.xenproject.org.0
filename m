Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Md3OJsipEGrKcAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 21:08:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF7C5B944B
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 21:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317259.1586444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQVDo-0007CT-6J; Fri, 22 May 2026 19:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317259.1586444; Fri, 22 May 2026 19:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQVDo-00079a-2y; Fri, 22 May 2026 19:07:48 +0000
Received: by outflank-mailman (input) for mailman id 1317259;
 Fri, 22 May 2026 19:07:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQVDl-00079U-SE
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 19:07:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQVDl-000Pt0-4L
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 21:07:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a10a93f-5cb7-0a2a0a5109dd-0a2a4502bff2-34
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 21:07:44 +0200
Received: from [209.85.167.48] (helo=mail-lf1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a10a980-af86-0a2a45020019-d155a730b5d1-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 21:07:44 +0200
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5a742b8b72eso8925758e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:07:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1779476864; cv=none;
        d=google.com; s=arc-20240605;
        b=cheVRrRQ+QupfbxZ6OvPzAt2xs5cGkuyQ6rLCE9P0BUQkU8DGKzRXTUwN0W///uOGb
         S1BkvrUpVeQXFeriQI1Mwla1sdF3EvhoNfnTc2FpSrpSr8l07PB4eYsJvTYAx7FhHlOX
         1UwhrTGI6Y6dbJAONh9XA6TS20x8NlpbTGhrspCGaa26y4jNWYgSiXRTsvH3nwmZWWDF
         /q27hc5ia31O5VOgluC7DnyL5k5OJuHio/Z+Bp3JY2kZo4DVMslf2DI6ljoO1GgFN6hH
         4trYU/v9THJ/NzcfLUdqA4o5p7hCAQQH3yMdbQBb++dHiko2JPF9i5VDdZCt2f6+gCMO
         3sMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U6FoAH0aljJtCakQnRGXKX2kfxj3ossrbBz1P1HqOv4=;
        fh=9JZxiMpSfuLqiQWy+/Qm7fbwQ+MYsT4GTch2ySqG6FU=;
        b=kN04v0p4bcXxGgtohsc+NjedHp33yL763aL8NljnP4x7q3mjV5+TZmyVR5sXe96whe
         xPrv3VZQrtNxp0qCCEHHG4KwucgEWkILDXe1EfwE70RFOLmPH9xfMCkUQoCPfAg4LmQb
         YLHGCHvi/pd0KtwLwRctirCqa9J4ZbPCphjIWp26IGAJAXT+B9aCl0OTmbQNhtV9ldSH
         9vdwTWWEUtK2sD6D7S5OW3JrfSEOiupvJPoU7R7jMMfOgEwM23HBSq9nAUKhQdBI/0JS
         DA8DMnC1/X36YEyhWuJNalM0tbRDslAJS2pgLoi2IJh5K4u7AdLgdKfaO0Bvsbqkc0jE
         O9wQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779476864; x=1780081664; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6FoAH0aljJtCakQnRGXKX2kfxj3ossrbBz1P1HqOv4=;
        b=DLykwycayKrXTUjL/6XrOwkhG0aMqL5stKhk9Gi9+pzEsJ34y0o9B9ngfKFGeLe+6p
         Bvk8VVW21WahgGT+tooaAk0h8cN8IaHd2D7wSfn/BmVBvSq3YqaWdDnjqMKWoYRLDIU0
         e0ojosgmSw/ahpnL/5tLmbQEGxhjAuv0DwBCGh0nZd7HiecFu6us7zGPFvjPc8ttQG6F
         dWAkWRMa0jSQCzzLXhEX+M855KqJVHXaVCZXRmCXP/uUgLnrrt+EWqmEkUo2Zffl/akU
         NbQ00UXpkfuUw9GtgMbwaIpA/aikd+W9YiMMDSJR/al3djncQBXuhXMv6nbUVUrTMbgE
         YgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779476864; x=1780081664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U6FoAH0aljJtCakQnRGXKX2kfxj3ossrbBz1P1HqOv4=;
        b=V9WlJGOkGRRaCrYnc5GU3jE52H1w0EGIVleZr5g0hZKWLmbEAWMj63Sa0UqCu6RPC+
         +E89ov1gE6ofBzg1RRtFbGlJilP2iot3ku/zfk9wPUuYWaaH5LZqJ2Zu5uz6/E7BRjpY
         3mcYOJt8a2b3FcnKFRPWdZcy9Nx7vv8ASWap3+dmOTs4jjkWmxK8BlqUfOTB93Tynm8E
         64u5haEjrHgwV3F5rKNyhb8c8T7rkK6loKqsTzybLn0WYgG7cKtAmnxv0k38GIO6eGu/
         N6wrdJkhKTWjzBna9dV1d9AtldVtn3rNb+d07SXXE0tQgU/+KgOsql0xusNuZ6yxkCLc
         1YMA==
X-Gm-Message-State: AOJu0Yy/Wna9AHpfYuyIzG61PxcW+LWx4+wb8CElrIATllsSq61d311q
	mPYM/nQzhH0xmlpo2ZVQgKzlPc0Y64wFUV1MdKdKahyUC5wAr1P2K+xwdbhhhaihhJFi92Cg7nM
	m34MP0oP6qZ4Z0l34aSkPHV34Sm5eyak=
X-Gm-Gg: Acq92OFh/iqYQQc/rrBqJhDr6dReBqv5g49cqVLvPSJqsV4RsmbEaoH9BI0NceJ3oQN
	iCfasfoeeuAH1vpm9IIY2GkHf7MVC80RW1tVVSk7DhCl5LyMMBklsdTY2gS+REAR0/2BFHzRe9/
	z75ktRba433HprMoH3EYiS+rIssroGrdPPAy8JPbAuU2cJwMKmDt7lAzHSmlbxa5O+cfKrAUMde
	sAtgIlUyHSkozCnjPUjOCC91i4t3RP5MbLywcGdX5Pgl9iNf/qIN3zvLBaOoRzBH3SC1/tSSFen
	bEf4ynorOwrRZT8=
X-Received: by 2002:ac2:5586:0:b0:5a3:feed:31cc with SMTP id
 2adb3069b0e04-5aa3238e2e0mr1178927e87.24.1779476863868; Fri, 22 May 2026
 12:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <9ae4f7dd49f5b1f761193adae573c2675c92e883.1779051035.git.mykola_kvach@epam.com>
 <ag+C21L9WoH3ngg8@kraken>
In-Reply-To: <ag+C21L9WoH3ngg8@kraken>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 22 May 2026 22:07:31 +0300
X-Gm-Features: AVHnY4K05jPxIxzwwQEypjICtjEPI7LADla4NVbRq5wr81Ppf-i-h32fAjBypTg
Message-ID: <CAGeoDV8bOXp2CqLEVE5+nOygxxHzXnXRLstsGk2kHhiPMVjb2w@mail.gmail.com>
Subject: Re: [RFC PATCH] device-tree: size first hwdom bank for boot modules
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1779476864-8256B161-8FE3DBA7/0/0
X-purgate-type: clean
X-purgate-size: 8942
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: DDF7C5B944B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Denis,

Thank you for the review.

On Fri, May 22, 2026 at 1:10=E2=80=AFAM <dmukhin@ford.com> wrote:
>
> Hi Mykola,
>
> The patch looks good!
>
> I would try to add a CI coverage for QEMU aarch64 tests, since QEMU
> supports multiple RAM banks topology.
>
> What do you think?

Sounds good to me. CI coverage would be useful for this case.

The test would need LLC coloring enabled and a low free region that
passes the old 128MB threshold while still being too small for the
kernel, generated DTB and initrd placement. This should be possible to
model in QEMU with suitable reserved-memory holes in the DT.

>
> Also, few remarks below.
>
> On Sun, May 17, 2026 at 11:57:56PM +0300, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > With LLC coloring enabled, the hardware domain memory comes from
> > allocate_hwdom_memory(), not from the fixed direct-map banks used when
> > coloring is off.
> >
> > Commit de99f3263555 ("device-tree: Improve hwdom memory allocation for
> > DMA") made that allocator sort free host regions by ascending address s=
o
> > Dom0 gets DMA-capable low memory first. The first bank filter still onl=
y
> > required 128MB. That can select a low region which is large enough for
> > the heuristic, but not large enough for place_modules() to put the Dom0
> > kernel, generated DTB and initrd contiguously in bank 0.
> >
> > Ask arch code for any additional first-bank size requirement. On Arm,
> > compute it from the actual Dom0 kernel placement, rounded initrd size a=
nd
> > generated DTB size hint. For 64-bit Image kernels, include the text off=
set
> > from the candidate bank start, because the returned requirement is comp=
ared
> > with a bank size measured from that start. The hint covers both the nor=
mal
> > Device Tree path and the minimal DTB created for ACPI boot.
> >
> > Check the first-bank threshold against the size which will actually be
> > assigned to Dom0, after capping the host region by the remaining unassi=
gned
> > Dom0 memory. Otherwise a large host region could pass the test but stil=
l
> > produce a first guest bank too small for place_modules().
> >
> > Use the typed min()/max() helpers for this normal allocation arithmetic=
;
> > MIN()/MAX() are intended for preprocessor-style contexts and skip the t=
ype
> > checking provided by the lowercase helpers.
> >
> > This keeps the DMA-oriented allocation policy from de99f3263555 while
> > preventing a too-small bank 0 from reaching place_modules().
> >
> > Fixes: de99f3263555 ("device-tree: Improve hwdom memory allocation for =
DMA")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Test/setup notes:
> >
> > The failure was reproduced on a Renesas H3ULCB/R-Car H3 (r8a7795)
> > arm64 board booted through U-Boot/TFTP and using huge initrd.
> >
> > Relevant Xen command line excerpt:
> >   dom0_mem=3D2048M llc-coloring=3Don
> >
> > Boot module layout from Xen:
> >   MODULE[2]: 0x0000000084000040-0x000000008e75d92f Ramdisk
> >   MODULE[3]: 0x00000000a0000000-0x00000000a3ffffff Kernel
> >   MODULE[4]: 0x00000000a4000000-0x00000000a400ffff XSM Policy
> >
> > The initrd is about 168MB. With LLC coloring enabled and the low-addres=
s
> > allocation policy from de99f3263555, Dom0 can receive a 192MB first ban=
k:
> >   d0 BANK[0] 0x00000048000000-0x00000054000000 (192MB)
> >
> > That bank satisfies the old 128MB minimum but is too small for the
> > rounded Dom0 kernel, generated DTB and initrd placement. The observed
> > failure before this patch was:
> >   Panic on CPU 0:
> >   Not enough memory in the first bank for the kernel+dtb+initrd
> >
> > With this patch, the same boot skips the too-small low region for bank =
0
> > and reaches Dom0:
> >   d0 BANK[0] 0x00000057000000-0x00000084000000 (720MB)
> >   d0 BANK[1] 0x0000008e800000-0x000000c0000000 (792MB)
> >   d0 BANK[2] 0x00000500000000-0x00000521800000 (536MB)
> >   d0: extended region 0: 0x48000000->0x54000000
> >   Loading zImage from 0x00000000a0000000 to 0x57000000-0x5b000000
> >   Loading d0 initrd from 0x0000000084000040 to 0x5f200000-0x6995d8f0
> >   Loading d0 DTB to 0x5f000000-0x5f011c80
> >   Linux version 5.10.194-yocto-standard
> > ---
> >  xen/arch/arm/acpi/domain_build.c        |  2 --
> >  xen/arch/arm/domain_build.c             |  8 ++++++
> >  xen/arch/arm/include/asm/domain_build.h |  4 +++
> >  xen/arch/arm/include/asm/kernel.h       |  8 ++++++
> >  xen/arch/arm/kernel.c                   | 35 +++++++++++++++++++++++++
> >  xen/common/device-tree/domain-build.c   | 27 ++++++++++++++-----
> >  xen/include/xen/fdt-kernel.h            |  8 ++++++
> >  7 files changed, 83 insertions(+), 9 deletions(-)
> >
> > diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domai=
n_build.c
> > index 249d899c33..db16f7fa94 100644
> > --- a/xen/arch/arm/acpi/domain_build.c
> > +++ b/xen/arch/arm/acpi/domain_build.c
> > @@ -26,8 +26,6 @@
> >  #undef virt_to_mfn
> >  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> >
> > -#define ACPI_DOM0_FDT_MIN_SIZE 4096
> > -
> >  static int __init acpi_iomem_deny_access(struct domain *d)
> >  {
> >      acpi_status status;
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 1efddc60ef..226e053c68 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -115,6 +115,14 @@ int __init parse_arch_dom0_param(const char *s, co=
nst char *e)
> >                               (IS_ENABLED(CONFIG_STATIC_SHM) ?         =
\
> >                                (NR_SHMEM_BANKS * (160 + 16)) : 0))
> >
> > +paddr_t __init dom0_get_fdt_size_hint(void)
> > +{
> > +    if ( !acpi_disabled )
> > +        return ACPI_DOM0_FDT_MIN_SIZE;
> > +
> > +    return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_SIZE;
>
> I would invert the condition so it is read more straightforward:
>
>     if ( acpi_disabled )
>         return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_SIZE=
;
>
>     return ACPI_DOM0_FDT_MIN_SIZE;

Ack, I will change it.

>
> [..]
> > diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> > index b72585b7fe..3644663e2f 100644
> > --- a/xen/arch/arm/kernel.c
> > +++ b/xen/arch/arm/kernel.c
> > @@ -128,6 +128,41 @@ static paddr_t __init kernel_zimage_place(struct k=
ernel_info *info)
> >      return load_addr;
> >  }
> >
> > +static paddr_t __init kernel_placement_size(paddr_t load_addr, paddr_t=
 len)
> > +{
> > +    return ROUNDUP(load_addr + len, MB(2)) - load_addr;
> > +}
> > +
> > +paddr_t __init arch_get_min_first_bank_size(struct kernel_info *info,
> > +                                            paddr_t bank_start)
> > +{
> > +    const struct boot_module *mod =3D info->bd.initrd;
> > +    const paddr_t initrd_len =3D ROUNDUP(mod ? mod->size : 0, MB(2));
> > +    const paddr_t dtb_len =3D ROUNDUP(dom0_get_fdt_size_hint(), MB(2))=
;
> > +    paddr_t kernsize;
> > +
> > +#ifdef CONFIG_HAS_DOMAIN_TYPE
>
> Perhaps use `IS_ENABLED(CONFIG_HAS_DOMAIN_TYPE)` to reduce ifdefery?
> My impression that IS_ENABLED() is preferred.

I think the #ifdef is needed here. This code is in the common Arm kernel
path and can still be built for 32-bit Arm, while both the `type` field in
struct kernel_info and DOMAIN_64BIT are only available when
CONFIG_HAS_DOMAIN_TYPE is enabled. Also, the `text_offset` field used in
this branch is only present for ARM_64.

IS_ENABLED() would make the condition a compile-time constant, but the
compiler would still need to parse and type-check the expression in
configurations where those fields/symbols do not exist.

>
> > +    if ( (info->type =3D=3D DOMAIN_64BIT) && (info->image.start =3D=3D=
 0) )
> > +    {
> > +        paddr_t load_addr =3D bank_start + info->image.text_offset;
> > +
> > +        /*
> > +         * The caller compares this value with a size measured from
> > +         * bank_start, so include the text offset before the kernel.
> > +         */
> > +        kernsize =3D ROUNDUP(load_addr + info->image.len, MB(2)) - ban=
k_start;
> > +        return kernsize + initrd_len + dtb_len;
> > +    }
> > +#endif
> > +
> > +    if ( info->image.start =3D=3D 0 )
>
> Here too: invert the condition?
>
>        if ( info->image.start )
>            kernsize =3D kernel_placement_size(info->image.start, info->im=
age.len);
>        else
>            ...

Sounds good to me. CI coverage would be useful for this case.

The test would need LLC coloring enabled and a low free region that
passes the old 128MB threshold while still being too small for the
kernel, generated DTB and initrd placement. I think this should be
possible to model in QEMU by using a suitable DT memory layout, for
example with reserved-memory holes.

~Mykola

