Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CADjFP89+GkxrwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 08:34:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC6F4B8F19
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 08:34:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299517.1574055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJmsF-0001uZ-GD; Mon, 04 May 2026 06:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299517.1574055; Mon, 04 May 2026 06:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJmsF-0001tA-DE; Mon, 04 May 2026 06:33:47 +0000
Received: by outflank-mailman (input) for mailman id 1299517;
 Mon, 04 May 2026 06:33:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wJmsD-0001sl-Sm
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 06:33:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJmsC-000pKi-Et
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 08:33:44 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f83dc6-5cb7-0a2a0a5109dd-0a2a45049d5c-6
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 08:33:44 +0200
Received: from [209.85.167.50] (helo=mail-lf1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f83dc7-1dec-0a2a45040019-d155a732c99c-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 08:33:44 +0200
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5a8704dc3a8so577781e87.3
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 23:33:44 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1777876423; cv=none;
        d=google.com; s=arc-20240605;
        b=ZI+G/1YnQ5jihPZRQqLoeW8Aqr29IpeM487nR+DZedStMYiwnNhLQFSUFsE/cwykMm
         1riy1psmDFwxWaPJPL5KSiEsHUvyfcxHDgh3Gc52ss4jGETzrWuiYFOekWGYO/3pIJ+f
         8mzA9sgINv5iJ5qWOWZwfMH6T84rXeqGTq1FbRgYc5x8oLsYY+g+lc6vmuNL5CGmkRwu
         GqVy4akJtlM1LTig0DIMOv5KaruStjOLZAUN+5xsDoB9c8qYcYJOIR0XXCdjTjlrgu4O
         AtCLGPcVtVbEWKuboeFyWJl70izW6ty+QANTfu0z+eEwmc0jR5MvIAi2HlDWQtgE1mwe
         z65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=emm0nOW7AT35luFuC0TZis7rdQbPFoLws99ueDOFLuw=;
        fh=SFtdlMni3BnFH+oTSZbVgVF1hLyFxrwlVmTI+BqD6+c=;
        b=QCZhPOI2TDjypF37lXZg+j8F86ZFErnS7ZEtNITGllEL/+jpFrfJbg9XQndx++f8Yu
         9APzfCAhScfPwHiw9si4VEIJwdoYcwarQNNPYQrficDAZ85KN8MRmKBQrLDcoGtJ6/Bq
         1lqKFlWUyHEOL1FpjhA6m/4DRz5rkN+OI/vfxPnCxgxXVR+7LsQLiPNYARgyzevyXJFJ
         3Y8uu/2YqE/XSjBS2e5XXec1waNATRDX9+NdObfQaO12Qo2fD55UoGR6/PrQUBcA1TUZ
         qz6I572gzxFKVK/5gylLqCm6xs5bsaFTtx8p2qiGFBaPFpZbnIwVl1KPd6kqf+JLt+zW
         TKUw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777876423; x=1778481223; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emm0nOW7AT35luFuC0TZis7rdQbPFoLws99ueDOFLuw=;
        b=PB+7twfr6TWWXyN42FKFzKJF3S5bBq5HMaER7fWj3MObRj9M/iaTACaI1jI9ixBAVa
         y7O6oEOaKxxjmZCqHWOjkc1MmJGYy10LYpkvPY0vQPxH2sAuZMZNNBZtklFzBYg0ofYi
         Q6EehQ6qmhdayWMxispu4Fi/jhqz0BQxjULTsBi9TYoOKMoqTTnmyoA1Z21tXQFXLrKn
         1bkcoFPOJnbFNLIvGuX7pTcss3+HebPF6CXuI3EHSAjhgHjeAgYCDbkIGSAAGDMyvxOE
         5aOs8uWGiBGLqCAp+oqhNYYhbfGN0nlKXUrxphxrd7X4OKVCmAo3yti3tRklJVtZEvmB
         L7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777876423; x=1778481223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=emm0nOW7AT35luFuC0TZis7rdQbPFoLws99ueDOFLuw=;
        b=kBBboaTlguePemOX5i3SfIiroHsvMuGbq43/bA3aYDebdF2e/gW4n+PKgsOjTxsmO7
         ICpIe/Ut4PMeQ5ghRBRYWupr0UFg5WIAK1+hjirtKWWIw+KWY+xRHoxZ/yDN3V5iVd9I
         JG5UU79NwdQ2yqDaSBakW/ezdhqKzt7yBYaOluXISihpax3QaHONrRSvYSlOmFUf/BRw
         1OuqECUfvcp++avaKU1PhyAR6dPYGzBQ9u/JUNTnViZ4NApLV1lNyyGvfUsSPl1COnJA
         vcDTcSX/pE9fvvoHlmZ1G2a09UEeaqDfIuRM1VJ7GtcWCkaxIIf8z1CAXNFQq/0KSiQU
         pQ7w==
X-Gm-Message-State: AOJu0YxrimonyJxSKUgzlYrS11VyKx5HfhjIUhwSJPTSDpBNFiraPr3J
	93uO8G+XqDdXWmQX1BXoYoSwxTphp6zWksr1kOxTGN+x5PZgO9p+3T6h6mHoI3XqFEK9U24iO5K
	jFaEpxypehrQoN8pIEi9fQydMlO4fmPw=
X-Gm-Gg: AeBDiesZXf+gT0+LzsJoMGWDYAQuDwBcudrTOS2DeJbGx1kzgF16G8EIJ7zjLPvrcv6
	6kxdmVgqiwjsUopKgCdX4F5TUvNNeGAA0a8ubQP/AuVGVOSNxoHiAW1aREW4ssFnUzpK0//EXr7
	mTbhFPx32l3QdI9UEpWKp/7uHLSTkUodU0HsiVaqwLviOFTlBsibfsO0oSmO9sqsq3ZT83e0NJK
	hakSk3bNb3bwrOJdMxdhDBRpScJ8aM5o2VsxZpmbzm3lkZEH0pO4GaW6v6tLE+oKWcLZgGdqzsh
	H4jXYrZdPEyMZ9x9
X-Received: by 2002:a05:6512:696:b0:5a8:707f:904 with SMTP id
 2adb3069b0e04-5a8707f0a67mr1226440e87.0.1777876423318; Sun, 03 May 2026
 23:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774431310.git.mykola_kvach@epam.com> <a7732487959e777ff1de318cb28c588db69fbaa1.1774431311.git.mykola_kvach@epam.com>
 <6b78dcf3-7e4c-4568-a0fd-58d5c860e4fa@gmail.com>
In-Reply-To: <6b78dcf3-7e4c-4568-a0fd-58d5c860e4fa@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 4 May 2026 09:33:32 +0300
X-Gm-Features: AVHnY4K0n5-M1EGmt3OlTmRiQa2Or5e4EMXWv7ABjjvb9VOrLd6oBZjuvaFxXlQ
Message-ID: <CAGeoDV8KK0Uv=gT2j-SqQhTJHVfzi3w_42ctGZP=9=ncw++cyw@mail.gmail.com>
Subject: Re: [PATCH 4/4] xen/arm: its: pre-initialize ITS quirks before LPI setup
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1777876424-310493FF-9C9D6481/0/0
X-purgate-type: clean
X-purgate-size: 8981
X-Rspamd-Queue-Id: AAC6F4B8F19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:olekstysh@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]

Hi Oleksandr,

Thank you for the review.

On Tue, Apr 28, 2026 at 7:31=E2=80=AFPM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
>
>
>
> On 3/25/26 12:38, Mykola Kvach wrote:
>
> Hello Mykola
>
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > In the current initialization flow, gicv3_init() calls gicv3_dist_init(=
)
> > before gicv3_its_init().
> >
> > When LPIs are supported, gicv3_dist_init() calls
> > gicv3_lpi_init_host_lpis(), which initializes host LPI state and alloca=
tes
> > the boot CPU pending table before ITS quirk flags are computed. Non-boo=
t
> > CPUs allocate their pending tables later from the CPU_UP_PREPARE notifi=
er,
> > while redistributor LPI programming happens separately in
> > gicv3_lpi_init_rdist().
> >
> > This means the boot CPU LPI setup can observe default ITS memory attrib=
utes
> > before dma-noncoherent and other ITS quirks are applied.
> >
> > Introduce gicv3_its_preinit() and call it before gicv3_dist_init(). Thi=
s
> > keeps the actual ITS hardware initialization in gicv3_its_init(), but m=
oves
> > ITS discovery, quirk validation and quirk flag setup early enough for t=
he
> > subsequent LPI initialization to use the correct attributes.
>
>
> Have you considered an alternative approach that might be less invasive?
> I am thinking of something the other way around: perhaps we could
> allocate the LPI pending table for the boot CPU later.
>
> Would a diff below work?
>
>
> ---
>   xen/arch/arm/gic-v3-lpi.c             | 9 +++++++++
>   xen/arch/arm/gic-v3.c                 | 2 ++
>   xen/arch/arm/include/asm/gic_v3_its.h | 6 ++++++
>   3 files changed, 17 insertions(+)
>
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index 9ee338edc2..61cc45d347 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -450,6 +450,15 @@ int gicv3_lpi_init_host_lpis(unsigned int
> host_lpi_bits)
>
>       printk("GICv3: using at most %lu LPIs on the host.\n",
> MAX_NR_HOST_LPIS);
>
> +    return rc;
> +}
> +
> +int gicv3_lpi_post_init_host_lpis(void)
> +{
> +    int rc;
> +
> +    ASSERT(smp_processor_id() =3D=3D 0);
> +
>       /* Register the CPU notifier and allocate memory for the boot CPU *=
/
>       register_cpu_notifier(&cpu_nfb);
>       rc =3D gicv3_lpi_allocate_pendtable(smp_processor_id());
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 7f365cdbe9..8b9059c5c9 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1981,6 +1981,8 @@ static int __init gicv3_init(void)
>           res =3D gicv3_its_init();
>           if ( res )
>               panic("GICv3: ITS: initialization failed: %d\n", res);
> +
> +        gicv3_lpi_post_init_host_lpis();
>       }
>
>       res =3D gicv3_cpu_init();
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h
> b/xen/arch/arm/include/asm/gic_v3_its.h
> index fc5a84892c..288cc1d42f 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -156,6 +156,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base);
>
>   /* Initialize the host structures for LPIs and the host ITSes. */
>   int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
> +int gicv3_lpi_post_init_host_lpis(void);
>   int gicv3_its_init(void);
>
>   /* Store the physical address and ID for each redistributor as read
> from DT. */
> @@ -245,6 +246,11 @@ static inline int gicv3_lpi_init_host_lpis(unsigned
> int host_lpi_bits)
>       return 0;
>   }
>
> +static inline int gicv3_lpi_post_init_host_lpis(void)
> +{
> +    return 0;
> +}
> +
>   static inline int gicv3_its_init(void)
>   {
>       return 0;

Yes, I think this direction is better and less invasive.
Thank you for the suggestion.

Best regards,
Mykola

> --
> 2.34.1
>
>
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > TODO: Think about separating Redistributor/LPI attributes from ITS.
> > ---
> >   xen/arch/arm/gic-v3-its.c             | 36 +++++++++++++++++---------=
-
> >   xen/arch/arm/gic-v3.c                 |  7 ++++++
> >   xen/arch/arm/include/asm/gic_v3_its.h |  5 ++++
> >   3 files changed, 35 insertions(+), 13 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> > index ee432088cd..0251d91630 100644
> > --- a/xen/arch/arm/gic-v3-its.c
> > +++ b/xen/arch/arm/gic-v3-its.c
> > @@ -63,6 +63,7 @@ struct its_quirk {
> >       uint32_t flags;
> >   };
> >
> > +/* TODO: Separate Redistributor/LPI attributes from ITS quirks. */
> >   static uint32_t __ro_after_init its_quirk_flags;
> >
> >   static bool gicv3_its_match_quirk_gen4(const struct host_its *hw_its)
> > @@ -148,9 +149,15 @@ static uint32_t gicv3_its_collect_quirks(const str=
uct host_its *hw_its,
> >       return flags;
> >   }
> >
> > -static void gicv3_its_enable_quirks(struct host_its *hw_its)
> > +static void gicv3_its_enable_quirks(void)
> >   {
> >       const struct its_quirk *quirk;
> > +    const struct host_its *hw_its;
> > +
> > +    if ( list_empty(&host_its_list) )
> > +        return;
> > +
> > +    hw_its =3D list_first_entry(&host_its_list, struct host_its, entry=
);
> >
> >       its_quirk_flags =3D gicv3_its_collect_quirks(hw_its, &quirk);
> >
> > @@ -603,16 +610,10 @@ static int gicv3_its_init_single_its(struct host_=
its *hw_its)
> >       uint64_t reg;
> >       int i, ret;
> >
> > -    hw_its->its_base =3D ioremap_nocache(hw_its->addr, hw_its->size);
> > -    if ( !hw_its->its_base )
> > -        return -ENOMEM;
> > -
> >       ret =3D gicv3_disable_its(hw_its);
> >       if ( ret )
> >           return ret;
> >
> > -    gicv3_its_enable_quirks(hw_its);
> > -
> >       reg =3D readq_relaxed(hw_its->its_base + GITS_TYPER);
> >       hw_its->devid_bits =3D GITS_TYPER_DEVICE_ID_BITS(reg);
> >       hw_its->evid_bits =3D GITS_TYPER_EVENT_ID_BITS(reg);
> > @@ -1161,6 +1162,11 @@ static void add_to_host_its_list(paddr_t addr, p=
addr_t size,
> >       its_data->size =3D size;
> >       its_data->dt_node =3D node;
> >
> > +    its_data->its_base =3D ioremap_nocache(its_data->addr, its_data->s=
ize);
> > +    if ( !its_data->its_base )
> > +        panic("GICv3: Cannot map ITS frame: 0x%lx, 0x%lx\n",
> > +            its_data->addr, its_data->size);
> > +
> >       printk("GICv3: Found ITS @0x%lx\n", addr);
> >
> >       list_add_tail(&its_data->entry, &host_its_list);
> > @@ -1238,16 +1244,22 @@ static void gicv3_its_acpi_init(void)
> >
> >   #endif
> >
> > -int gicv3_its_init(void)
> > +void __init gicv3_its_preinit(void)
> >   {
> > -    struct host_its *hw_its;
> > -    int ret;
> > -
> >       if ( acpi_disabled )
> >           gicv3_its_dt_init(dt_interrupt_controller);
> >       else
> >           gicv3_its_acpi_init();
> >
> > +    gicv3_its_validate_quirks();
> > +    gicv3_its_enable_quirks();
> > +}
> > +
> > +int gicv3_its_init(void)
> > +{
> > +    struct host_its *hw_its;
> > +    int ret;
> > +
> >       list_for_each_entry(hw_its, &host_its_list, entry)
> >       {
> >           ret =3D gicv3_its_init_single_its(hw_its);
> > @@ -1255,8 +1267,6 @@ int gicv3_its_init(void)
> >               return ret;
> >       }
> >
> > -    gicv3_its_validate_quirks();
> > -
> >       return 0;
> >   }
> >
> > diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> > index bc07f97c16..6e44d23d64 100644
> > --- a/xen/arch/arm/gic-v3.c
> > +++ b/xen/arch/arm/gic-v3.c
> > @@ -1974,6 +1974,13 @@ static int __init gicv3_init(void)
> >
> >       spin_lock(&gicv3.lock);
> >
> > +    if ( gic_dist_supports_lpis() )
> > +        /*
> > +         * Apply ITS quirks before gicv3_dist_init() sets up host LPIs=
,
> > +         * so pending tables use the correct ITS memory attributes.
> > +         */
> > +        gicv3_its_preinit();
> > +
> >       gicv3_dist_init();
> >
> >       if ( gic_dist_supports_lpis() )
> > diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/inclu=
de/asm/gic_v3_its.h
> > index fc5a84892c..e1d7522ea5 100644
> > --- a/xen/arch/arm/include/asm/gic_v3_its.h
> > +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> > @@ -156,6 +156,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base)=
;
> >
> >   /* Initialize the host structures for LPIs and the host ITSes. */
> >   int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
> > +void gicv3_its_preinit(void);
> >   int gicv3_its_init(void);
> >
> >   /* Store the physical address and ID for each redistributor as read f=
rom DT. */
> > @@ -219,6 +220,10 @@ static inline int gicv3_its_deny_access(struct dom=
ain *d)
> >       return 0;
> >   }
> >
> > +static inline void gicv3_its_preinit(void)
> > +{
> > +}
> > +
> >   static inline bool gicv3_its_host_has_its(void)
> >   {
> >       return false;
>

