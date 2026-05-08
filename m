Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ35K/FM/mnoowAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 22:52:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1814FBA63
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 22:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304214.1577293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSAq-0006fZ-8O; Fri, 08 May 2026 20:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304214.1577293; Fri, 08 May 2026 20:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSAq-0006dj-5Q; Fri, 08 May 2026 20:51:52 +0000
Received: by outflank-mailman (input) for mailman id 1304214;
 Fri, 08 May 2026 20:51:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wLSAo-0006dd-W1
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 20:51:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLSAo-00HIeD-2i
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 22:51:50 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fe4cbf-5cb7-0a2a0a5109dd-0a2a450488f4-20
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:51:50 +0200
Received: from [209.85.208.177] (helo=mail-lj1-f177.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fe4ce5-1dec-0a2a45040019-d155d0b1ede5-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:51:50 +0200
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-38e97e73234so22557171fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 13:51:49 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1778273509; cv=none;
        d=google.com; s=arc-20240605;
        b=OEgtxLnM91k9ykq2RKkXRBi02LKDMLzn+QhX+fbLc2x9DKPrpmKviDvbkH31vzId9n
         qTX+YC2d/uLJfCaGgSirRmTCpSwGvwK9UfG/o8GPSkNBfyHfVkQBn5aEGOdPe8hZsSvg
         5kYl8cCSQzfahGetcTztcxUPq2r4Tz9k3bCNvWQFoHlJzbxZOH4I6ExLzcAdTx1qLb0F
         m80qtNsmBtFR3u9kIX3KjA4Lreiz+uHP7vGaBl6rFw2NbB5KKqWJpbe4avHoJtNfmC8o
         1WGVN/fWwTOYw0aS6QAECZm6yIqFe/EDLzkrSplv/8xMl8pQChtxdR2eg+So1OAB6od0
         DCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aA0+nB+/Zf5LNNPDHfcvzrP2LrNRyeHJUPzaReKZ5lo=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=edpIJWphpJzgfz+8I2lXR+2SX6uiPicHwLC5fFBrzm1Pgou+Kai3zwd5FyHRKYrTx9
         hgryCYxmoQzzZmUP9Zs8yVe/oUxtsM50xQrcoY5D4Q+QE6CWPO50UetFTEbDbPXh7BBj
         JWm+tnTBTc4g5O6FVIdmyQ3GmpUk2+8/S495H2JaVtmnyMK/hATRoAzS0iSSa1BoV64v
         fO0JQdLtJyRxZF1trba8gYDpu2aKb5t4aUNC5IYsvOZAwYJWucdy+O+HrgVcAz9XTlYe
         k/y2p64tcutypu8YI6bvXvZ/6jQ9eJ7uweulTtnhuni8WI8TWXBNBxcMtgsVLkyKAfRy
         A+Ow==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778273509; x=1778878309; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aA0+nB+/Zf5LNNPDHfcvzrP2LrNRyeHJUPzaReKZ5lo=;
        b=B26YpMn6ULAdM1r6YUTYebi7w4i2l+uFG3dpWpWNrHA2QTq4hABq7QZ+A7ZAHt78EH
         lYIS41N2fxGiuy6L4LPTtR4lq36wBMMgKKeqz0S22UjkPPVMEZlPvseaifNLHiIS7kag
         qMv82zATzf12RrVbvkaNmumjm4wRvhz7SkojLvOu6Ynf+dFbczGOFxZuxPjCiRM1eACb
         ANqbgg1I1lmmKnQ5LJEHc9N1kQ8puS1zgjKTqag0wxLQABvL7CCggjLPU0RZSBpkQ4OB
         yBzYyIuXJdelkRzZWWmOgt1U5fxRDC0JDbbaf5llGdszHUV8iNVd73tRC3rvtE1TghgK
         DYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778273509; x=1778878309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aA0+nB+/Zf5LNNPDHfcvzrP2LrNRyeHJUPzaReKZ5lo=;
        b=jv5AfUdj6k4IMJNsKJT7qIxQvkfCr7FRAr0Se3bTMPkXoVtAT46b+Ar0r7hPt890dq
         FqFM+Q3uzskKfX3Y7iWSt5N7wPWaqtxZlLI36y9YBIndVz27kundgRDC4radw6XiscSB
         mLW4InrqLedSp8qQp94558FYkC1WjudPFKQmLHA5g1qIQpILTgmPlR0A/eEVmDBsQxr1
         jKQnSveMAIoYRe8NUqrP/Tae3MZ3jizvc1T0JXzgSZbW5/q1twPXK4nrAAIQJjmDCJwy
         r5X6JLwaYk3K7JfrpyoZUgT28S3m1EcWxKEOvoAgkXq25U71DHcNn2YMxxxZfpl7wK0L
         9ruQ==
X-Gm-Message-State: AOJu0YweMVwi1dsbJz85Q3M+YJK2DUKn2Fi2abZ+9q+qRCiL3aJPaLxG
	46FyviWkqqo6h623fnAxUnXynPgwtw7oBwhgMqGXWQg6GZTx5Zq+VLlIhuTZcatPvGDCDElklal
	KLwZc1HZzQ6WHcRAT9In9vb4BOl4W+88=
X-Gm-Gg: Acq92OHr6kPAhH2iXX6vJc8tZCoEPrZi/Rh36kH5N/YSv+70hNz4NVvqPWMl3cE+J5Y
	5LtexOQnjLZ0h5OL9tvNbDHfV44bnSqg7laV4fdxzuiQIc0M0tEnuOpxhIDvkUm2kLYSXi39TJu
	rh+n1hAZxAdqPnP+oRvwQIh8wZZYHgHx/GEcImFc8655gmlQ91tgOOHy+MA965naWn/lq1U0JKY
	A7RM6yrpHk0Vw28Lxr9bPQeRxZdLtFfyDqWf0jYFs8d3Xb/0nzBNgvsM+SibLLTwA10VGUQLK/x
	i8vU7Q==
X-Received: by 2002:a05:651c:3242:b0:394:75b:eb3d with SMTP id
 38308e7fff4ca-394075c0404mr211061fa.18.1778273509151; Fri, 08 May 2026
 13:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <02b55a02f329d09c9f8b15d97ca9176b3c33017a.1775125380.git.mykola_kvach@epam.com>
 <ECDA0BD5-C2C8-4726-9377-AE4AFBE972AD@arm.com> <CAGeoDV9Jg0neHn0qzoaDSThhVRGQE8ko2qhbhDvF77=6hrYUWg@mail.gmail.com>
 <4BFA8CEE-0168-4C14-8B5F-E19E6FD7D747@arm.com>
In-Reply-To: <4BFA8CEE-0168-4C14-8B5F-E19E6FD7D747@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 8 May 2026 23:51:37 +0300
X-Gm-Features: AVHnY4IBHwfA-r4Hx63WBO9W13PGwaDdwuvkxW7WBHq8XbIt1kQISSKl2FDYMmA
Message-ID: <CAGeoDV_atObaBcLHDeG2=4aj0ceyabkK44R9wuSGZGJm_SqoDw@mail.gmail.com>
Subject: Re: [PATCH v8 10/13] xen/arm: Resume memory management on Xen resume
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1778273510-295783FF-15B33EA2/0/0
X-purgate-type: clean
X-purgate-size: 2063
X-Rspamd-Queue-Id: 0E1814FBA63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 4:28=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.com=
> wrote:
>
> Hi Mykola,
>
> >>> xen/arch/arm/arm64/head.S | 24 ++++++++++++++++++++++++
> >>> 1 file changed, 24 insertions(+)
> >>>
> >>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> >>> index 72c7b24498..596e960152 100644
> >>> --- a/xen/arch/arm/arm64/head.S
> >>> +++ b/xen/arch/arm/arm64/head.S
> >>> @@ -561,6 +561,30 @@ END(efi_xen_start)
> >>>
> >>> #endif /* CONFIG_ARM_EFI */
> >>>
> >>> +#ifdef CONFIG_SYSTEM_SUSPEND
> >>> +
> >>> +FUNC(hyp_resume)
> >>
> >> I think we should mask all exceptions here:
> >> msr DAIFSet, 0xf
> >>
> >> until we resume correctly the status (VBAR_EL2, etc).
> >
> > This was discussed in an earlier version:
> >
> > https://patchew.org/Xen/cover.1741164138.git.xakep.amatop@gmail.com/2ef=
15cb605f987eb087c5496d123c47c01cc0ae7.1741164138.git.xakep.amatop@gmail.com=
/#CAGeoDV97no7mXSKd7auFu5E85wSXAHKWvqGW2=3D-VEAbkrTyU8Q@mail.gmail.com
> >
> > For SYSTEM_SUSPEND, PSCI ties the call semantics to CPU_SUSPEND. In
> > particular, section 5.20.2 says that the caller must observe all the ru=
les
> > described for CPU_SUSPEND, and section 6.4 explicitly says that the ini=
tial
> > state rules also apply to SYSTEM_SUSPEND.
> >
> > For the return Exception level on AArch64, section 6.4.3.3 requires
> > SPSR_ELx.{D,A,I,F} to be set to {1, 1, 1, 1}. Therefore Xen expects to =
enter
> > this resume path with DAIF already masked by PSCI-compliant firmware.
> >
> > I agree this assumption is not obvious from the code, so I will add a c=
omment
> > at the resume entry point to document that this path relies on the PSCI=
 initial
> > core configuration requirements.
>
> Yes please, something along the line of
>
> /*
>  * PSCI SYSTEM_SUSPEND follows CPU_SUSPEND initial-state rules.
>  * On AArch64, firmware must return with SPSR_ELx.DAIF set, so
>  * PSTATE.DAIF is already masked on entry here.
>  */

Ack.

Best regards,
Mykola

>
> Cheers,
> Luca
>

