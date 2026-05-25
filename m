Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AENhKYONFGpcOQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 19:57:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 135A95CD7DF
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 19:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319402.1587035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRZXw-0004aU-JC; Mon, 25 May 2026 17:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319402.1587035; Mon, 25 May 2026 17:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRZXw-0004Xc-GH; Mon, 25 May 2026 17:57:00 +0000
Received: by outflank-mailman (input) for mailman id 1319402;
 Mon, 25 May 2026 17:56:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wRZXu-0004XW-1W
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 17:56:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRZXt-00A8Yi-Dy
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 19:56:57 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a148d67-bab6-0a2a0a5309dd-0a2a450b82dc-6
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 19:56:57 +0200
Received: from [209.85.167.44] (helo=mail-lf1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a148d69-212f-0a2a450b0019-d155a72cc886-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 19:56:57 +0200
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5a877510541so10738477e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 10:56:57 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779731816; cv=none;
        d=google.com; s=arc-20240605;
        b=Q30f4cV3JS/rhIyQ7AJrubquxoxduo56cGIOxj++KQLLF1wA+QmF0Sns788QO3NTZ/
         t/d5zoaoKz+kw+rGtj/19ZRcHn+pb9AjHUzSh4Jk5ldzkBg6oomKjk4wUorYYb3SqLgk
         gLBnhw5pABf73yswrUSoakv8PL+syM+w49s15VvP2Q1xOoT6zGn4SNERXwus1bjbH/ZC
         QsyfxnGT5V25WmmYkH6udmvyS6V5py+sNSXFqvCZg6cGZ/T/2Cj9T3huuvsMma+JX4iu
         2I4sTfDrEoaQ3azfd+6LTWslWzc8V/Tl7oLucHfRfxt3aCfmyMCmo6iYnBi6Dj/o/QlG
         oTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MNJt8cRHwyIcYi/0+vjGBOgpL03aVZwqgiIyAY5tsYs=;
        fh=vHQhu8+3w8fIT0NmGZ7Av5NNpAuuuKJ4YoBRPf5+ZME=;
        b=BdXiPIxhfgsWgcvVIto3ksspknOBwnhXaQb0qxXUv7B+rf3swIkQpOzgsqvCzxJei6
         PkZnUK74wWf1IpYtuY4fCCexKu8uMPsNoVJ/RZz1eJKayPmVibunvuQV0egj0RDet/LB
         15dJyOd5hHc/DGpaJCq8OW76zsxoHVR2jX4coF7MAugmwPO8vh43IAgvL2447ATBLobu
         ccQTJOpMtiuQfgf0Ar0+BHhuMdqDajeFLmzHvDPGDK8IX2uCuoPF2hkYGAnqY9INJwpB
         coHR578P3DCwCE7YPqVzgKQc96Innhi6lmM2YOf4x/DxfHqmxqLemficiE8Gc8pBPyJo
         mBYw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779731816; x=1780336616; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNJt8cRHwyIcYi/0+vjGBOgpL03aVZwqgiIyAY5tsYs=;
        b=UNQZphaeJX0mEe9QY2ecE/mAWPs9QqvRK5+spLfjeEudiYo0++1KEAx1jFMglUgtgO
         JBHX11qKwXN0jYh0JurWOH/b+aQc1PwfVmqCc3Q1n+CIOzljvNiuS6pDNS51eB+TneXf
         AyqZhgXPe/LgmddwlvlwRAMm1XajOJwmuzVqZ9hHbxV/rVp3cPlxLqDNyggv1P4bNnKD
         Jov4ftB55znMm9lrMf1estCyUQgnV+XfFwm30E85lSC592dzN0WUflhAfX2mlmuaZBsJ
         t0zG4no/UfqPOz04eFgc5Ccj6+of12W7WBEctA0NwDnMhhTKmTuAOwt65VjBEOdUUyX/
         Jd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779731816; x=1780336616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MNJt8cRHwyIcYi/0+vjGBOgpL03aVZwqgiIyAY5tsYs=;
        b=sDEwC8CM0UtYxy/64mMQqm9GagoxRBMxrfBUfL0Vke1tMtXyRP3qQD7y0XLHOddqO7
         jRlJUJjuSNe7NwcKz7pH/XCM69kQ39wbSaQxDXz86e6X68BMU4SfZnoMgjLeHNyyUkYE
         vEJnNyjQfy+f4URaJT/6dild691g2x0+NicCV+JAtiOygAoJ921zCsDAAZDrEQ70UtAe
         JNcdUO6nRd87PpWUU3Xa6zu+OkyzFYyGkbo3rjM6E2Um5w1IzEWGPFQFxnyutMHWz0Lp
         JOrE165WA14t5QbuVneCDSYcrkXVOt1CbeywEXCLCb8ekYHwLTuZmbZaK+TuUBb870Ge
         h3kA==
X-Gm-Message-State: AOJu0YzeDIyktHwsKM8b8k+gkK8ijBlEUMbvMyIKNChphoqShL6AC2eS
	0WkYqZqHsRYU3lfj0mEZGrzt87x/41iUqiUHPZyCmCfK/2sVG8xF6jVa+30kW+OtrQj8kjb+z4q
	F86RotiCcUQW+S61c6RymdP+iqwSizu8=
X-Gm-Gg: Acq92OFsMP0T0RX3xo2bkjEgzcLG7qhC20+v27PqaUBE1pWVRVsjmL4NlBjcwSDw5GF
	DqxqE0dvXj59lTR16XyO3gc09X5tKv1/l6r6muyi/6NsQ3XH5vryq1AfTxMGuxhoo21opMahccx
	Kc2XJcYXug1BE9RcCAv+8YyGU9gWyRSTB7XRb+vjl2xjGFBrN5ggdkRGGxaeeltCEf1iUmlt+0j
	XIG+TwIhlt7us6WSlo97woNNUVhh9HnKFu931xIo1Ui8Eu7y2F6V1DA1XgtKVWjgY6ng3QhSmgn
	ggXa
X-Received: by 2002:a05:6512:3d11:b0:5a8:d1ef:caad with SMTP id
 2adb3069b0e04-5aa3237d6c8mr3979794e87.4.1779731816103; Mon, 25 May 2026
 10:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <9ae4f7dd49f5b1f761193adae573c2675c92e883.1779051035.git.mykola_kvach@epam.com>
 <0db37c10-b920-4d9d-9453-18f820e6d093@amd.com>
In-Reply-To: <0db37c10-b920-4d9d-9453-18f820e6d093@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 25 May 2026 20:56:44 +0300
X-Gm-Features: AVHnY4IpbUegaoLO0BYt4qENwcAbyxGqDvC5h-M5C4Lit_RLWpSIf-acoOnbkAw
Message-ID: <CAGeoDV8f2Db-VaA6YTV_O1DHcSaeb8fshN=QoS7neUHGoAkrRg@mail.gmail.com>
Subject: Re: [RFC PATCH] device-tree: size first hwdom bank for boot modules
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1779731817-1BD7FF3B-61A8E13F/0/0
X-purgate-type: clean
X-purgate-size: 13218
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
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 135A95CD7DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

Thank you for the detailed review.

On Mon, May 25, 2026 at 10:35=E2=80=AFAM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 17-May-26 22:57, Mykola Kvach wrote:
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
> Don't mention dom0 given that this is purely hwdom path.

Ack.

>
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
> > +}
> > +
> >  unsigned int __init dom0_max_vcpus(void)
> >  {
> >      if ( opt_dom0_max_vcpus =3D=3D 0 )
> > diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/inc=
lude/asm/domain_build.h
> > index df8b361b3d..45687c5d6f 100644
> > --- a/xen/arch/arm/include/asm/domain_build.h
> > +++ b/xen/arch/arm/include/asm/domain_build.h
> > @@ -19,6 +19,10 @@ int prepare_acpi(struct domain *d, struct kernel_inf=
o *kinfo);
> >
> >  int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *da=
ta);
> >
> > +#define ACPI_DOM0_FDT_MIN_SIZE 4096
> > +
> > +paddr_t dom0_get_fdt_size_hint(void);
> > +
> >  #if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
> >  /* Utility function to determine if an Armv8-R processor supports VMSA=
. */
> >  bool has_v8r_vmsa_support(void);
> > diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/a=
sm/kernel.h
> > index 21f4273fa1..17c5b9bce4 100644
> > --- a/xen/arch/arm/include/asm/kernel.h
> > +++ b/xen/arch/arm/include/asm/kernel.h
> > @@ -8,12 +8,20 @@
> >
> >  #include <asm/domain.h>
> >
> > +#include <xen/types.h>
> > +
> > +struct kernel_info;
> > +
> >  struct arch_kernel_info
> >  {
> >      /* Enable pl011 emulation */
> >      bool vpl011;
> >  };
> >
> > +#define arch_get_min_first_bank_size arch_get_min_first_bank_size
> > +paddr_t arch_get_min_first_bank_size(struct kernel_info *info,
> > +                                     paddr_t bank_start);
> > +
> >  #endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
> >
> >  /*
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
> Used from one site. place_modules() open-codes the same
> expression; the CONFIG_HAS_DOMAIN_TYPE branch below is
> kernel_placement_size(load_addr, len) + text_offset. Either drop the help=
er or
> use it consistently.

Ack, I will use the helper consistently.

>
> > +}
> > +
> > +paddr_t __init arch_get_min_first_bank_size(struct kernel_info *info,
> info is RO, so const please.

Ack.

>
> > +                                            paddr_t bank_start)
> > +{
> > +    const struct boot_module *mod =3D info->bd.initrd;
> Why mod instead of initrd? - choose more meaningful names

Ack.

>
> > +    const paddr_t initrd_len =3D ROUNDUP(mod ? mod->size : 0, MB(2));
> It would be nice to explain why 2MB, at least to say that it mirrors
> place_modules rounding.

Ack, I will add a comment that this mirrors the 2MB rounding used by
place_modules().

>
> > +    const paddr_t dtb_len =3D ROUNDUP(dom0_get_fdt_size_hint(), MB(2))=
;
> > +    paddr_t kernsize;
> > +
> > +#ifdef CONFIG_HAS_DOMAIN_TYPE
> > +    if ( (info->type =3D=3D DOMAIN_64BIT) && (info->image.start =3D=3D=
 0) )
> > +    {
> > +        paddr_t load_addr =3D bank_start + info->image.text_offset;
> > +
> > +        /*
> > +         * The caller compares this value with a size measured from
> > +         * bank_start, so include the text offset before the kernel.
> The comment belongs above the load_addr line above.

Ack.

>
> > +         */
> > +        kernsize =3D ROUNDUP(load_addr + info->image.len, MB(2)) - ban=
k_start;
> > +        return kernsize + initrd_len + dtb_len;
> Could it be written as:
> info->image.text_offset + kernel_placement_size(load_addr, info->image.le=
n)

Ack, I will rewrite it that way.

>
> > +    }
> > +#endif
> > +
> > +    if ( info->image.start =3D=3D 0 )
> > +        kernsize =3D ROUNDUP(info->image.len, MB(2));
> > +    else
> > +        kernsize =3D kernel_placement_size(info->image.start, info->im=
age.len);
> This could be written as a single expression, no need for if/else:
> kernsize =3D kernel_placement_size(info->image.start, info->image.len);

Ack. You are right, kernel_placement_size(0, len) is mathematically
equivalent to ROUNDUP(len, MB(2)). I will simplify this to a single
expression in the next version.

>
> > +
> > +    return kernsize + initrd_len + dtb_len;
> > +}
> > +
> >  static void __init kernel_zimage_load(struct kernel_info *info)
> >  {
> >      paddr_t load_addr =3D kernel_zimage_place(info);
> > diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-=
tree/domain-build.c
> > index 2a760b007b..d8865db259 100644
> > --- a/xen/common/device-tree/domain-build.c
> > +++ b/xen/common/device-tree/domain-build.c
> > @@ -299,20 +299,33 @@ static bool __init allocate_hwdom_memory(struct k=
ernel_info *kinfo)
> >
> >      for ( i =3D 0; (kinfo->unassigned_mem > 0) && (i < nr_banks); i++ =
)
> >      {
> > -        paddr_t bank_size;
> > +        const paddr_t bank_start =3D hwdom_free_mem->bank[i].start;
> > +        paddr_t bank_size =3D hwdom_free_mem->bank[i].size;
> > +
> > +        /*
> > +         * Check the size that would actually be assigned, not just th=
e size
> > +         * of the host region.
> > +         */
> > +        bank_size =3D min(bank_size, kinfo->unassigned_mem);
> >
> >          /*
> >           * The first bank must be large enough for place_modules() to
> >           * fit the kernel, DTB and initrd.  Skip small regions to avoi=
d
> >           * ending up with a tiny first bank.
> >           */
> > -        if ( !mem->nr_banks && (hwdom_free_mem->bank[i].size < min_ban=
k_size) )
> > -            continue;
> > +        if ( !mem->nr_banks )
> > +        {
> > +            paddr_t arch_min_size;
> > +            paddr_t required_first_bank_size;
> > +
> > +            arch_min_size =3D arch_get_min_first_bank_size(kinfo, bank=
_start);
> > +            required_first_bank_size =3D max(min_bank_size, arch_min_s=
ize);
> > +
> > +            if ( bank_size < required_first_bank_size )
> > +                continue;
> > +        }
> >
> > -        bank_size =3D MIN(hwdom_free_mem->bank[i].size, kinfo->unassig=
ned_mem);
> > -        if ( !allocate_bank_memory(kinfo,
> > -                                   gaddr_to_gfn(hwdom_free_mem->bank[i=
].start),
> > -                                   bank_size) )
> > +        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), ba=
nk_size) )
> >          {
> >              xfree(hwdom_free_mem);
> >              return false;
> > diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.=
h
> > index 8cd1670c2c..931b3e1686 100644
> > --- a/xen/include/xen/fdt-kernel.h
> > +++ b/xen/include/xen/fdt-kernel.h
> > @@ -86,6 +86,14 @@ kernel_info_get_mem_const(const struct kernel_info *=
kinfo)
> >      return container_of(&kinfo->mem.common, const struct membanks, com=
mon);
> >  }
> >
> > +#ifndef arch_get_min_first_bank_size
> > +static inline paddr_t arch_get_min_first_bank_size(struct kernel_info =
*info,
> > +                                                   paddr_t bank_start)
> > +{
> > +    return 0;
> > +}
> > +#endif
> > +
> >  #ifndef KERNEL_INFO_SHM_MEM_INIT
> >
> >  #ifdef CONFIG_STATIC_SHM
>
> As for the upstream CI test, we should start with more generic tests that=
 we are
> missing (like regular LLC boot) before thinking of covering more granular
> scenarios. Also, in the past we agreed on first covering the supported fe=
atures
> before adding tests for unsupported ones.

Ack, that makes sense.

Best regards,
Mykola

