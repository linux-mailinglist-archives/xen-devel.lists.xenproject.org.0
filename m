Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FcuKSIT+mlRJAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 17:56:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FC94D0B77
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 17:56:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300851.1575305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKI81-0000oi-KE; Tue, 05 May 2026 15:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300851.1575305; Tue, 05 May 2026 15:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKI81-0000mD-Gp; Tue, 05 May 2026 15:56:09 +0000
Received: by outflank-mailman (input) for mailman id 1300851;
 Tue, 05 May 2026 15:56:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wKI80-0000m7-9W
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 15:56:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKI7z-005i21-MM
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 17:56:07 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fa12f7-e002-0a2a0a5209dd-0a2a4502df6e-36
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 17:56:07 +0200
Received: from [209.85.167.54] (helo=mail-lf1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fa1317-af86-0a2a45020019-d155a736b0bc-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 17:56:07 +0200
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5a40cfab24dso5989855e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 08:56:07 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1777996567; cv=none;
        d=google.com; s=arc-20240605;
        b=OuHR0heqH2jo6s5ihAnrLa4bhD93e4aIv9gApk9AjOZM2oIoY5z+WaH4nkkJgoogbm
         0YskHSUEEoWmkR/WTOg3vaipZ9CXQH0gDo3WWs4dgfwDJ0r9qPs6BHD1pkFMWEJj8y23
         RrDelIKBUvumxazXOcztFSGY+v9uGoKIgGWR+qj6xnLYqFlF1VUV41UONTV6vPATaboD
         pceN8iD2muGZtHEqKqaWbJDEFrDIiOFlEc+HfJngZeiHvdiopFuejL3q/n81azP4Gm7u
         7KRTjC4hKPJ2Gz+IagwgIouczDyEUxk3N9d4kRJ5aQd28gkJuWFJ2CZ8ktfV2WhLct69
         B1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HuNZHulAwh+EOwt2M0h+Hs4hQD0c89BqN36BzTSZvHQ=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=YdzG0vcgs/90sPnmd32REblnlNbuYF9NbR3QzXBoQkFAyfPsdkBFONSTx3/XZHrY9Q
         KZLz9ONRQi7XwjsDvA0g12YvQpgb2TX3/itmWNT7PGn12fOVfg4t35jd4oLeOrePzWEq
         DKDeXNxuMxnuHrNBxOZ2nCXmlJuYWlTY9KcOm/soh5Eiu4sNAHtVO1+2Ixz70BRvd4pm
         LTDSI6BHW4DjeviMQ5+G29Qm/NvYYTNLZiJmbsI0x/Hut1RAUH6Fz0PpKZPMiBq5cmer
         PnXYyB07C8IqzIj94na5Juxx6A+1PLIxAJQdu9CTatoodP6FNpuKUmY1hdn5+yNV0kUg
         XMPg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777996567; x=1778601367; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuNZHulAwh+EOwt2M0h+Hs4hQD0c89BqN36BzTSZvHQ=;
        b=iAnKVa+yIOMlKD/gUpCz+qWmKCbCZe9tFY10TbRDMeund7oV+jvchb/DToNtLm+d6Y
         CCTo+UR6HvDFtkmUG94TTsmMZCIDRZdng/szyGlN4t2eYAzfjJdbgj7uhfo7pMCHPecy
         4SPgLgLxwOcKhNkhkIa40/qAFLmu+oFeD7tBrgPeL6R5Buu64R4yeoLIbehO/m/wKEhV
         Fj5dN5b1a5pQ7/szBmZ+IK5x7gg3GONvFe22ouZince50tHavbqtI6pdCT+apYKM7OiB
         XABKeMWN9HAA4l9KwRtEKb76RQOjb6tnvL3P8GFsoXWeTmDgIiDM94e0roLT2KqwP49T
         OYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777996567; x=1778601367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HuNZHulAwh+EOwt2M0h+Hs4hQD0c89BqN36BzTSZvHQ=;
        b=W9oep2m4LK0+yzv1TPET6kEqBWb2RPRCQAvd44YZXIRCjtVr1599GEYxyTykz2K8yM
         BVurmUDmTg6RFX9z2e0ftmTg7O+yJNxsviPFUneCrinvpOxTSflDlv76A0Xz81Yj+1Ij
         3J+zC54J3O63oiBjyYgyghSpoaSbMwoYkaH4GUnABJkrqgAxPR/2MFadxptd3O3KifM0
         75gaNwyf6DnKN9zk3L1oza76yiTtxKbDpelM1UyA8nq/2J42g6UZOjACQr+cpTUNKjMf
         Y0v5zOmvbNzGsnP1YvJ0NsiNtHrZW+SKDzJ2j0htLClwot6vaHonXYtp7NnUmMMzYiKm
         LRlw==
X-Gm-Message-State: AOJu0YwYj6/NxCh7CDAr3ZJazHplVbmMdhjVRmbFIvrB6mUwJvve1K5g
	xf8cUeaHrYJKwo5Q7mUqf7JvGaHt32esGskZ4zNKjPZN6OMk1SipjfmRMw2tfNgJ77L+SlCFVFK
	Rc49RzfYUWm0cN8e5iKTEs4aQc6/e0/k=
X-Gm-Gg: AeBDiet62Q5TRshmzYeInZsxoymdCwBW9F67aMs77IaB0Egpi2A618U1NxM6yPUTBGW
	MK+9e2R3RvLcdP7nBnn/HWQUHkz2DPpPEUuXLbu/fQPv38vKKImiGMeeZC63bl5y6m+MPcNkAl9
	lxYf6ndqZMBuPfKotaigPOEToUUtBYv2CZSypP/NYfpJgMMaNk9rkSJqQJODuXaJofImmaJch1D
	gxjjztulA4SKLcapBpbkoSTAoJjfyTu60Hti6P0vJe/eG9N1w6F0FMWVRoPfkH8xV42FlBRsBEX
	uciSXKtwq9ffFJX4s/SqV1566PE=
X-Received: by 2002:a05:6512:3090:b0:5a8:7c80:3f3e with SMTP id
 2adb3069b0e04-5a87c803f6dmr2175169e87.14.1777996566521; Tue, 05 May 2026
 08:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <02b55a02f329d09c9f8b15d97ca9176b3c33017a.1775125380.git.mykola_kvach@epam.com>
 <ECDA0BD5-C2C8-4726-9377-AE4AFBE972AD@arm.com>
In-Reply-To: <ECDA0BD5-C2C8-4726-9377-AE4AFBE972AD@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 5 May 2026 18:55:55 +0300
X-Gm-Features: AVHnY4JDkdlmJZWNpT7hyZZMLcNL17vU7UTQSUH7lbzGeu5906GeV_u-4PeeC9Q
Message-ID: <CAGeoDV9Jg0neHn0qzoaDSThhVRGQE8ko2qhbhDvF77=6hrYUWg@mail.gmail.com>
Subject: Re: [PATCH v8 10/13] xen/arm: Resume memory management on Xen resume
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1777996567-81971161-B33E1FDD/0/0
X-purgate-type: clean
X-purgate-size: 4117
X-Rspamd-Queue-Id: 10FC94D0B77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,arm.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]

Hi Luca,

Thank you for the review.

On Mon, Apr 27, 2026 at 5:51=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> > On 2 Apr 2026, at 11:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
> >
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > The MMU must be enabled during the resume path before restoring context=
,
> > as virtual addresses are used to access the saved context data.
> >
> > This patch adds MMU setup during resume by reusing the existing
> > enable_secondary_cpu_mm function, which enables data cache and the MMU.
>
> I don=E2=80=99t understand where this last part happen in this commit:

This is a leftover from before the commits were reorganized. I will update =
the
commit message in v9 so that it only describes what this patch actually doe=
s.

>
> > Before the MMU is enabled, the content of TTBR0_EL2 is changed to point
> > to init_ttbr (page tables used at runtime).
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v7:
> > - no functional changes, just moved commit
> > ---
> > xen/arch/arm/arm64/head.S | 24 ++++++++++++++++++++++++
> > 1 file changed, 24 insertions(+)
> >
> > diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> > index 72c7b24498..596e960152 100644
> > --- a/xen/arch/arm/arm64/head.S
> > +++ b/xen/arch/arm/arm64/head.S
> > @@ -561,6 +561,30 @@ END(efi_xen_start)
> >
> > #endif /* CONFIG_ARM_EFI */
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +FUNC(hyp_resume)
>
> I think we should mask all exceptions here:
> msr DAIFSet, 0xf
>
> until we resume correctly the status (VBAR_EL2, etc).

This was discussed in an earlier version:

https://patchew.org/Xen/cover.1741164138.git.xakep.amatop@gmail.com/2ef15cb=
605f987eb087c5496d123c47c01cc0ae7.1741164138.git.xakep.amatop@gmail.com/#CA=
GeoDV97no7mXSKd7auFu5E85wSXAHKWvqGW2=3D-VEAbkrTyU8Q@mail.gmail.com

For SYSTEM_SUSPEND, PSCI ties the call semantics to CPU_SUSPEND. In
particular, section 5.20.2 says that the caller must observe all the rules
described for CPU_SUSPEND, and section 6.4 explicitly says that the initial
state rules also apply to SYSTEM_SUSPEND.

For the return Exception level on AArch64, section 6.4.3.3 requires
SPSR_ELx.{D,A,I,F} to be set to {1, 1, 1, 1}. Therefore Xen expects to ente=
r
this resume path with DAIF already masked by PSCI-compliant firmware.

I agree this assumption is not obvious from the code, so I will add a comme=
nt
at the resume entry point to document that this path relies on the PSCI ini=
tial
core configuration requirements.

>
> > +        /* Initialize the UART if earlyprintk has been enabled. */
> > +#ifdef CONFIG_EARLY_PRINTK
> > +        bl    init_uart
> > +#endif
> > +        PRINT_ID("- Xen resuming -\r\n")
> > +
> > +        bl    check_cpu_mode
> > +        bl    cpu_init
> > +
> > +        ldr   x0, =3Dstart
> > +        adr   x20, start             /* x20 :=3D paddr (start) */
> > +        sub   x20, x20, x0           /* x20 :=3D phys-offset */
> > +        ldr   lr, =3Dmmu_resumed
> > +        b     enable_secondary_cpu_mm
> > +
> > +mmu_resumed:
> > +        b .
> > +END(hyp_resume)
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> > /*
> >  * Local variables:
> >  * mode: ASM
> >
>
> This is more a trampoline for the core resuming, not sure if it could be =
better to squash this
> into the following patch, the maintainer could provide their preference.

Yes, this patch is only the low-level resume trampoline before the context
restore code is added by the following patch. I do not have a strong prefer=
ence
between keeping it separate and squashing it into the next patch. I can squ=
ash
them in v9 unless the maintainers prefer to keep the trampoline separate.

Best regards,
Mykola

>
> Cheers,
> Luca
>
>
>

