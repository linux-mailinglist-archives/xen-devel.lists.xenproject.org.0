Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNJzFY1f/mnCpwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 00:11:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DCA4FC318
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 00:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304344.1577419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLTPf-0000Gv-7Z; Fri, 08 May 2026 22:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304344.1577419; Fri, 08 May 2026 22:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLTPf-0000Do-3y; Fri, 08 May 2026 22:11:15 +0000
Received: by outflank-mailman (input) for mailman id 1304344;
 Fri, 08 May 2026 22:11:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wLTPd-0000De-LQ
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 22:11:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLTPc-0046H4-OQ
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 00:11:12 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fe5f72-bab6-0a2a0a5309dd-0a2a4501bf2a-10
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 00:11:12 +0200
Received: from [209.85.208.174] (helo=mail-lj1-f174.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fe5f80-c1f2-0a2a45010019-d155d0aec514-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 00:11:12 +0200
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-38eab6cf7d8so20199951fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 15:11:12 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1778278272; cv=none;
        d=google.com; s=arc-20240605;
        b=ctEPWtcrRH7/AL/gpGVlLx7wM7EkOI+33f4sCAwisOknQMFUMABo3E7hFQbuh/7VYC
         mVqExXjx79FxN4h59yFo8BGP5uk/KAoz7tEWRUl/GunO0XwMlHL64fVBL7De46dvvIpI
         eeUbdxgL1853u0NEUWMM8WHkG/nYFy1Y4wYL8+MRzFpusp3UqoNYSMx3J7NtYDkTTdnf
         JeLeZzgbYLbEop0uG7rP63PKkL7EnA9Dk8hzCLHxX/Mi4QWfyXU72R67y+8WmdGB0wj2
         4943bmQcWaUa58PFnjs1WvA9XHxplnldxn6xBaOmDMaarj66EEQjuqi7imJ7vyjRhoH4
         ZQeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4uoSD4dv/lM4JCjO11NQ3fturTKgoKsOxneWDpV0nVw=;
        fh=URHEk7klKxjqc5bXwxtPgt12zwbJaOVjsCphaVnE7cw=;
        b=Z/0mSUiTU3IoY0fIp3e5sDBGNOSFNuVxs6cB1DaTD7J4brf6nmLLui9X/Pul/TneuK
         rfD5jESnayv9cqeUd2ec7zct9gM8oPtSkz6KL1q0l0vojJgWHzYocj6zgro9dlACrEre
         k9QSEXgyQYfBRzADQ25l2dwdEu8enQOJDjaXfdyruy5UK1jDI+pLgrB9Il1rpv7WBwY2
         GnE2bZjuSKqnzVziWwp+h3o57EWbotlGpn3mxAS454ai06N6lhnXwClm+uhjWWrfqlEX
         DfiKkYAr9rkBGJr48ajTAL8/qmuzonrQmcyumGtaLfzOj4JKD36DTWOHy7SJZcxkxhjE
         F/8w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778278272; x=1778883072; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uoSD4dv/lM4JCjO11NQ3fturTKgoKsOxneWDpV0nVw=;
        b=sOONakH2mQP+bqcf3NFRKkE/IBDpvuBKda8Z34ugqiSW6Ag4PCxqbWQtuL9o4Ke7sM
         +SodNjhwhOzlcz/FrqNKocJy9+wub82xVhyjk/wMUbyAFzm9Yw72IGXzA89j429CowyH
         tz66yzu2RktJZhtknC+NeKVdjG2bh0xYSh6GQqkfLq++3A32npm0pAofqGL8vl9nobEG
         af8vvQwRnIsqGEkCcyFtlULFNvV/80FsXtVX+DORt/OgkdHdnbNMg+pDqejD8CPZAUQz
         EHIIUUkGobVytPgKG9uXVyrzy+xWIJMmNBDyPEboSW2uME62ZlZzvJ2vkmPgoqEBdWoN
         UCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778278272; x=1778883072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4uoSD4dv/lM4JCjO11NQ3fturTKgoKsOxneWDpV0nVw=;
        b=QkN1G83I3xhmYyUEmKr13WavthHqIe8hcyZIUn46LDVyqZ/9fvy9XyoOl54PaQo+eZ
         +9V0WEx4vgzaXnfSmSzOvQ8ye2NspSZXl34ymqGrFoaQyf+vBy/rTR0SlvvhNLviZljh
         WKDFpu5DIzwlKj4AYCPvt16Kp+gEcGRqJ6Fbc+6uHsLbwwjBXEW7ZVjLC1f7+zCe5MkL
         Z20NB+wNaFb4+Zh164IVbVw1Ep7FWHJo9fm/QKzRCbdmjjVG2T7PwpUdnpppJdHttQvf
         cLgYnA3dSMKNzOKi/pb9tGtGtdssalL71tlNYHPCL4EmaZGnNesNz6VA79r2M54jqSvK
         QMNg==
X-Gm-Message-State: AOJu0YyTNa03nyodvcrl8Vlre4Nkq3hx6wnzioXkeyBtX2WBFQwaEvEH
	+1I31Oprsop++SCb8p37jnOp821OxINoGfpKbCalOOt+bZrLwvDoR1zMzS51rarj64mshCjt+df
	GBIAt2xhqGu4mWjbO1ZgpkiW1F3r7WQk=
X-Gm-Gg: Acq92OGf+egH37peHOKTK8vFRVPRRdeJ4/y/yznp74qmTUfJ2GyQiL6dTNXcW7QSwjs
	914UUz52FHg+2FuoPAdSsLGr/XKctOg77FWHAd2m/Sz0tlr3sasVpMQjaXHmYOUN0BGlG+K/9ox
	cdJ76bqpBn8mW0oNgVmPqLp579VAmxvEhjngSTzBM+Kz+RHpKbhLe4XalrfpJOd6F8e0TcVYRx2
	iUkxlwgCFh62Zj/94dSj0V54+e/4c91qoskGpgLK5qz+AIvJtujJ4gLCxCiFISstkqRE7ifeNSu
	jVmL1w==
X-Received: by 2002:a05:6512:308f:b0:5a8:94c2:d4cd with SMTP id
 2adb3069b0e04-5a894c2d734mr4503319e87.30.1778278271683; Fri, 08 May 2026
 15:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <5a42b7c32fadf21262b8342f27e685916d0e5812.1775125380.git.mykola_kvach@epam.com>
 <FDA8FF59-989D-42A8-9E75-1300E0B5EBD0@arm.com> <CAGeoDV_OkizsZj0hNXM3W84FpoeVjgSnzoRmAr3YtZj1Ri_3eA@mail.gmail.com>
 <0BBBB87D-4A54-4378-BC30-4CFAB7553286@arm.com>
In-Reply-To: <0BBBB87D-4A54-4378-BC30-4CFAB7553286@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Sat, 9 May 2026 01:11:00 +0300
X-Gm-Features: AVHnY4KELghW99FEnZfoYqB5SCXdtGae_3u-LzCWYOF0UcLWMBnXjDQnDLH9bQY
Message-ID: <CAGeoDV9J67ycr7aANcQDAmEYBA7GZBTOUY0_CVrwLVjNzQcrDQ@mail.gmail.com>
Subject: Re: [PATCH v8 05/13] xen/arm: gic-v3: add ITS suspend/resume support
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1778278272-B474CFF4-85C35F64/0/0
X-purgate-type: clean
X-purgate-size: 3800
X-Rspamd-Queue-Id: C0DCA4FC318
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 2:31=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.com=
> wrote:
>
> Hi Mykola,
>
> >
> > On Fri, Apr 24, 2026 at 1:54=E2=80=AFPM Luca Fancellu <Luca.Fancellu@ar=
m.com> wrote:
> >>
> >> Hi Mykola,
> >>
> >>> On 2 Apr 2026, at 11:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
> >>>
> >>> From: Mykola Kvach <mykola_kvach@epam.com>
> >>>
> >>> Handle system suspend/resume for GICv3 with an ITS present so LPIs ke=
ep
> >>> working after firmware powers the GIC down. Snapshot the CPU interfac=
e,
> >>> distributor and last-CPU redistributor state,
>
> =E2=80=9CSnapshot the CPU interface, distributor and last-CPU redistribut=
or state=E2=80=9D happened in the commit before?

Yes, fair point.

That wording is too broad for this patch. It describes the wider GICv3
suspend/resume flow in which the ITS handling is invoked, rather than the
ITS-specific part added here.

The CPU interface, distributor and redistributor handling are covered by
the related GICv3 suspend/resume patches, while this patch itself adds the
ITS state save/restore.

I will tighten the commit message in the next version so it only describes
the ITS-specific suspend/resume handling done by this patch.

>
> >>> disable the ITS to cache its
> >>> CTLR/CBASER/BASER registers, then restore everything and re-arm the
> >>> collection on resume.
> >>>
> >>> Add list_for_each_entry_continue_reverse() in list.h for the ITS susp=
end
> >>> error path that needs to roll back partially saved state.
> >>>
> >>> Based on Linux commit dba0bc7b76dc ("irqchip/gic-v3-its: Add ability =
to save/restore ITS state")
> >>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >>> ---
> [=E2=80=A6]
> >
> >>
> >>> +    {
> >>> +        unsigned int i;
> >>> +        void __iomem *base =3D its->its_base;
> >>> +
> >>> +        its->suspend_ctx.ctlr =3D readl_relaxed(base + GITS_CTLR);
> >>> +        ret =3D gicv3_disable_its(its);
> >>
> >> This is called from system_suspend(), along the path iommu_suspend and
> >> console_suspend() are called, finally reaching gic_suspend() and this =
one.
> >>
> >> In the IHI 0069H.b, 5.6.2 Disabling an ITS, it says:
> >> =E2=80=9CEnsure that all interrupts that target the ITS that is being =
powered down are
> >> either redirected or disabled=E2=80=9D, is it correct to assume all th=
e ITS targeting source
> >> at this point are disabled because domains should be already suspended=
?
> >
> > Yes, that is the assumption here.
> >
> > Before Xen reaches this path, each domain must already have entered
> > SHUTDOWN_suspend. In other words, the guest OS has already requested
> > SYSTEM_SUSPEND only after completing its own suspend flow, so the
> > ITS-targeting interrupt sources owned by that OS are expected to be
> > quiesced at this point.
> >
> > So this code relies on the owning OS having disabled or otherwise
> > quiesced those sources before issuing SYSTEM_SUSPEND, rather than Xen
> > explicitly doing that in gicv3_its_suspend().
>
> Ok! I would be for a comment stating this assumption, unless the maintain=
ers disagree

Ack.

Best regards,
Mykola

>
> >
> >>
> >>
> >>> +        if ( ret )
> >>> +        {
> >>> +            writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
> >>
> >> here and in the other places we write GITS_CTLR, this reg has Quiescen=
t as RO,
> >> maybe we should mask the write to only the other bits that are writabl=
e?
> >
> > Yes, this was inherited from the Linux ITS suspend/resume code, which r=
estores
> > the saved GITS_CTLR value directly.
> >
> > That said, masking the write to the writable bits is cleaner, and I wil=
l do
> > that in the next version.
>
> ok
>
> Cheers,
> Luca
>

