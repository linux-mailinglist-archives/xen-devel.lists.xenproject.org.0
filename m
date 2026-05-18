Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBeQO/gcC2qiDgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 16:06:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE9556E4F1
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 16:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311915.1582039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOybP-0002QE-8l; Mon, 18 May 2026 14:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311915.1582039; Mon, 18 May 2026 14:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOybP-0002O3-5y; Mon, 18 May 2026 14:05:51 +0000
Received: by outflank-mailman (input) for mailman id 1311915;
 Mon, 18 May 2026 14:05:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOybN-0002Nv-H3
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 14:05:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOybM-00GONU-TU
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 16:05:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0b1cb8-5cb7-0a2a0a5109dd-0a2a4501a83a-16
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:05:48 +0200
Received: from [209.85.208.177] (helo=mail-lj1-f177.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0b1cbc-c1f2-0a2a45010019-d155d0b1b01a-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:05:48 +0200
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-39397d63804so30560561fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 07:05:48 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779113148; cv=none;
        d=google.com; s=arc-20240605;
        b=I/pbgb4Y43mOA2xBIz6ycoH0M+ReD7SpNNWjciBdUWnjIgZt62/5NUyrE38DFYcvPp
         lmCdv2CFcbAcwAfq0gj6AUCIsDpGmBnoO5PEGWe+Rz5J25RgbWlIITmFMygnzjbWa8mQ
         A0nnvvxG9P8VXFr0RHiFG1BmCsuEO3FzjQEQpqc2xXsFWODpEIsulXq2P23Ig2p5JIdS
         KtRgIkg0g4w/YH9+wfGfMmO0L6YoVuQ+Wsnrd5cWMiYOY5rvnyePxXn1p9814hRIogpc
         e8IadKqr3jiYOOAkadaS4HjUmMR7hwyO/uXuh64FwB6C/qwHMXv+4IBDISV2RTtYa7wN
         MBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BpgLHi9Qz5Is4RecBAOuzC6FxHCCy6X6Nea8EIJTNUo=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=WVCqiltkz4VYq6t/IeiA6OiLmKvB9iJQQk/NFAWM1Gm/UA55V2h5aKQJ3JKBBaeQz3
         1jbGyS4sbKVcI6jxrgmqLq2jGeDx4LlbruKxOU76/xLveaxW0mxYVwfCJrKLsF60FAWs
         eDtLDQd+QMG7TQiuabC8r74mK2SmZUyGr4OElbA2y+NVXlsKyaH2DFrxYEFKK2QDnP48
         qxzcHT5KCxKVzgy1Hb1j3dAVFhQAedyqM3G3JXdPGU51Bdi1SZGbUbgaq544XV5j1Ucg
         fuPoPpir8YbbjbhG5dRZMvkNaBEpgiCrdzkY1/y+wCRN07Y2xWseeLIjx4TSn3Ghgp/B
         5BeA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779113148; x=1779717948; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpgLHi9Qz5Is4RecBAOuzC6FxHCCy6X6Nea8EIJTNUo=;
        b=QoYBHpcssV1LPIRpW2+4xHZMe+hbs/t6Wtene44e8/ULwaVrevdoGA62u997ZW2bJq
         22CiGAmKswVN1uUBHekkk03VviJ/dZ/VzJfeaXQ4Juy/EWRjKQJMrMom/E41dSnuO8qK
         fETPduzBKh7TVfNAX9SpR63sp1jad9lHcemVs3QWntEwehYlnPvleuDwnIxXINs+GRmR
         IMisqHUZ6i8JKAIF5Obbf0HweQdjfheDneGJIipnvZnAGMZ1mLXNDajgWp4t7IBHapUv
         XgYRjwWh96bUUhydDVochdm0dStRhaqwVaiWVGQnYwkAAlZWkwKZja8jvek72xvmKww7
         QrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113148; x=1779717948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BpgLHi9Qz5Is4RecBAOuzC6FxHCCy6X6Nea8EIJTNUo=;
        b=Ty/FIQKG9/HXq04hRi+12Z+1x2bqm2gnUubKGWt9twZOxmPulLyBEB3UHkNKkG3cHN
         dFzUoIFzCNQ0Q8t+/xAzPAnj/zFQQgXpS9vGOBh43jnKazUQnH7wM0NgckKBRpJD4R1R
         6XWkyIoNWvERG1NwJgVunqWE1zkOsLpdDE3u2g4cCD/WkH7BjP7Fp76z4JSq7vp7GZWN
         YjxngFfJldMYbNdLZ1VGI2gBZz7uosLKIA53CQKvF7yDF2o1rwPz4jI02H2hgsz6xihN
         EIy+ASyb991JYLgHt7EVY3YhbzbBF/rtwyplUcTC3DnJvXPSZVNhidJTW1oA56Re5Y2g
         bFcQ==
X-Gm-Message-State: AOJu0YzpXgBHBjxNGhf5QNzO8v5HSI9A6JXLRTACfWAzTdAsRecH1oC5
	4Trdf/OpRshVpM2NyX/geyMry9Y1FWmiUgFG4SAymx6l0hZkw5ltNo6ualupE6fBrHMvflHo2VF
	PNbfSYXx9427e2rGHP5Ivehpc35gPzjbwn8yprR8=
X-Gm-Gg: Acq92OF6ApvCy9yW/OUiNIM/76TT5vM/tegLPTN4UgQ5t8NFVyc9IjBlUcEDHHgpMgV
	lUjWqDjU1zUg2M+UnGRyOFqHP0ZyaLWLq/ael2JFKgzRWO/gxnzQDGf70dN/N1wLPh/WO0cwq67
	qmfwTaZacpWUAiHaAvE0qGkxPxRi0tA6Ud6przBJ04FEkkP3du9mLtwhuhWQCNn49tpB/ggQ/oG
	AFifMYEVMY98pllk7csWNP+k+LCObl5iewE3zzRY//RViqaCgoIx2atIo4K6QT3W9rThJgEgLEF
	C0zBcBlwwST4ou8=
X-Received: by 2002:a2e:a803:0:b0:38e:9667:f21a with SMTP id
 38308e7fff4ca-39561fec65amr47789621fa.20.1779113147780; Mon, 18 May 2026
 07:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778605274.git.mykola_kvach@epam.com> <46bbc9e008a65dd86fb2b368e4751eb7d2014afa.1778605274.git.mykola_kvach@epam.com>
 <7254EEC1-315F-41EB-B623-5CACAD7255E9@arm.com>
In-Reply-To: <7254EEC1-315F-41EB-B623-5CACAD7255E9@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 May 2026 17:05:36 +0300
X-Gm-Features: AVHnY4KUKNsRyhScqxIEaQvzHCFhvZMM_7XpNiooU8kyV5_ae1spewjS8cYIQUs
Message-ID: <CAGeoDV-A6xpjioUGrV_fQLYEFhzOwz=fLGZ-eHxidKzuFk8poA@mail.gmail.com>
Subject: Re: [PATCH v9 10/13] xen/arm64: Save/restore CPU context across SYSTEM_SUSPEND
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1779113148-B4D49FF4-68DF4E1F/0/0
X-purgate-type: clean
X-purgate-size: 2603
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
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 5CE9556E4F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

Thank you for the detailed review.

On Thu, May 14, 2026 at 8:22=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +/*
> > + * int prepare_resume_ctx(void)
> > + *
> > + * CPU context saved here will be restored on resume in hyp_resume fun=
ction.
> > + * prepare_resume_ctx shall return a non-zero value. Upon restoring co=
ntext
> > + * hyp_resume shall return value zero instead. From C code that invoke=
s
> > + * prepare_resume_ctx, the return value is interpreted to determine wh=
ether
> > + * the context is saved (prepare_resume_ctx) or restored (hyp_resume).
> > + */
> > +FUNC(prepare_resume_ctx)
> > +        ldr   x0, =3Dresume_cpu_context
> > +
> > +        /* Store callee-saved registers */
> > +        stp   x19, x20, [x0, #RESUME_CTX_X19]
> > +        stp   x21, x22, [x0, #RESUME_CTX_X21]
> > +        stp   x23, x24, [x0, #RESUME_CTX_X23]
> > +        stp   x25, x26, [x0, #RESUME_CTX_X25]
> > +        stp   x27, x28, [x0, #RESUME_CTX_X27]
> > +        stp   x29, lr, [x0, #RESUME_CTX_X29]
> > +
> > +        /* Store stack-pointer */
> > +        mov   x2, sp
> > +        str   x2, [x0, #RESUME_CTX_SP]
> > +
> > +        /* Store system control registers */
> > +        mrs   x2, VBAR_EL2
> > +        str   x2, [x0, #RESUME_CTX_VBAR_EL2]
> > +        mrs   x2, VTCR_EL2
> > +        str   x2, [x0, #RESUME_CTX_VTCR_EL2]
> > +        mrs   x2, VTTBR_EL2
> > +        str   x2, [x0, #RESUME_CTX_VTTBR_EL2]
> > +        mrs   x2, TPIDR_EL2
> > +        str   x2, [x0, #RESUME_CTX_TPIDR_EL2]
> > +        mrs   x2, MDCR_EL2
> > +        str   x2, [x0, #RESUME_CTX_MDCR_EL2]
> > +        mrs   x2, HSTR_EL2
> > +        str   x2, [x0, #RESUME_CTX_HSTR_EL2]
> > +        mrs   x2, CPTR_EL2
> > +        str   x2, [x0, #RESUME_CTX_CPTR_EL2]
> > +        mrs   x2, HCR_EL2
> > +        str   x2, [x0, #RESUME_CTX_HCR_EL2]
>
> Do you think we should save also CNTHCTL_EL2? Apologies it escaped my fir=
st review,
> but I see we program it in the boot cpu path + secondary cpu path: init_t=
imer_interrupt().
>
> The rest looks ok.

Ack. Good catch, thanks.

CNTHCTL_EL2 is programmed from init_timer_interrupt() for both the boot
CPU and secondary CPUs, so it should be part of the EL2 context saved and
restored across SYSTEM_SUSPEND. I will add save/restore for it.

I will also re-audit the context save/restore list against the current
boot path to check whether any other EL2 system registers are missing.

Best regards,
Mykola

