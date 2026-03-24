Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH2oMg6nwmkyggQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 16:00:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2189B30AA32
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 16:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260956.1554112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w53Ej-0006NU-Ub; Tue, 24 Mar 2026 15:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260956.1554112; Tue, 24 Mar 2026 15:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w53Ej-0006Lx-R5; Tue, 24 Mar 2026 15:00:05 +0000
Received: by outflank-mailman (input) for mailman id 1260956;
 Tue, 24 Mar 2026 15:00:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w53Ei-00069G-Ph
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 15:00:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w53Ei-00D86E-10
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:00:04 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c2a6f2-bab6-0a2a0a5309dd-0a2a450aa898-16
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 16:00:03 +0100
Received: from [209.85.208.169] (helo=mail-lj1-f169.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c2a6f3-1772-0a2a450a0019-d155d0a9d07a-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 16:00:03 +0100
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-38ad4677830so37746701fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 08:00:03 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1774364403; cv=none;
        d=google.com; s=arc-20240605;
        b=ebVUX4F9WIWRYfrjZmvQzt6P7I+DZ8pF2Y2/b+oQWuby1blWt+5zYjIeB54Tm6Gn3W
         Geh/cSP//rNRlrk4lMhex4EnCZ1FxkLfSQiVPw+AcJ3aarP5c3n3E1oQXPybTRvJV8Mf
         tIL8ti0PkD5/MmeNxQkxmYD3h1e7IFADuLSsnX+3PUppVp+mPd4IAKI1z6GA7GwQfxhq
         vD/jksix8nt2d3TTwAbVwqNG4pdVpxG5wguLBieffsqtoR5JvH2YBIHd6EEE1kq/LW2+
         BYpS0ZXTrELZh0haJzkVReckf1mr/gOqiGmJF4lIMHRSQycSliO6iYFQFSMY6gLARJaB
         pqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YSuTnvHSeVcFUB/+9C4fCV2nR4/iqnZ0NXe5dDdHJdw=;
        fh=ER/BYFrrpCrSSVfzOMF7Ku3o0WALv6zM9JFyjgxE93g=;
        b=JrcCZQKw9tidmLfPJQfE126q97gI3FAOjSgklrUX27o7BEf1VL5d7LbTRL/GomJ4ix
         seB9I2iw8MqSC6sqlw/YOmdD0+EYTQdVzPxIeRAoWSxtEINl05ZHoRF7yxGoPc2RlshO
         0t+S8IGSzSabiCSURMWKsw/LxLsDWY0W0zd7To4Qd+L1p0uXPptKsIoBLbYZDVKsoe6w
         I+ycHYdltRGxdanSR1Vycf6oX9mMHtrM9kU+6kFCvNiKVej9UqgAEDWTK2KoOXTheyKc
         clvfBqnTmkesvp2hURgXzdS4rrrgC1+drbj0pU2k+jYV0MV8YoXwjJTyNuxtLMFuy66Z
         +ObQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774364403; x=1774969203; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSuTnvHSeVcFUB/+9C4fCV2nR4/iqnZ0NXe5dDdHJdw=;
        b=Eop+594yb4qqC47mMYi7nSfztC1vbcYAz30wOkIL+EGGRQBYu7FyRx2+UWFeWnNKUp
         ErYC6bH54HFqnIWkE4wOkSZr+VIzMjosaAfGhYDa3itg2HTDbRr3xAPeTIai0kxGTWn2
         agDfm8lLclzXNAV+4jIAYauRiVi8myzxBbmWOQQ08kCGiWakYFOJ2Vw/uC7gBpvBXtrT
         ftjhUlmfirI8pVJfm5V41hOTVUC668XHnTfKKDpY07qyITpYMm/cMjESwbLSl76u0DnK
         upj1g4Qu05ynP0+MP1uBFs5Ba2X9ZIlllat7saLLlvWy7FaWD3BQhWhWFVNgd46b6tfb
         rBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364403; x=1774969203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YSuTnvHSeVcFUB/+9C4fCV2nR4/iqnZ0NXe5dDdHJdw=;
        b=K+BGIocThsP4AN5ucelD2DgOCf6xllYxqVc/fOttxjGfwYCXa9Jx/eUy+SwcY+76sQ
         dgbAK+GUSvztOqo7lahTxbZLgt9JpLlKu6b88AWTpO63b7+ECyd6vuDNCuQj7935WHuh
         57nl1U3UElSku+TlJB43L3JMmxyLikooUBNEx27BPbSVbwtOaBnHKI+KBDCSU47vG7hG
         L90jz9FODr4tfvXBqgrOARfl3gBxs21oc1r5793/fdY2uN8Qtof3g1em+zk/cR9diX+6
         5xTT3BdGj+IF12epbvl1zYXELPB+x5sz6/7ap6zPrHo4k97emR0ObPqcbbY5CLIsLstK
         ijXg==
X-Forwarded-Encrypted: i=1; AJvYcCWsNumPK39DLATnxT5fqM4EFXx7Mq3NhxDWp142xzbEo1J+Sc1ukQmvITtAJ2NHzaaE5AHS0t5ZANM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDd3VxB5GGbi4P5hbwxHCT/Q+lU0qkonSoeC+cabmZegfRbO4m
	EOepwe1xqJ/kYeaRkreNXYL0ViAJQM9qOe3PUctOohoqx+zGwJlH6Bko+ej6JVHMIQjSsWc9tia
	XVJLUS6AJw7GxeJQDlLPklsaleElGggM=
X-Gm-Gg: ATEYQzxYn2XXAh1D9r0ERwlkbO1VoRMdGsQLzCFwAKYLHZsye+Ldugk9kVzR0Qz5+L3
	7zrkCgQg1aPR5rmTE9csARHM1cLdbKmiMZlV13CoseA+46oBPxhizV9Q0kDxLTIJ4PDAsbmU6wQ
	Dy7Sbm0q+PvwgkyGscxN9EMETT7UTig9o3FmGSOCiA+m98CoQja+jDiBZ7THS1BSc3+WIKkKzOv
	AVkAX7Lqj3rzGpIIXHQTar7WFvI8icH3N3pj2aYOwbPzJqzXTYwyCFOkARpbIexGDU7qGAqOiWU
	ELrO6w==
X-Received: by 2002:a05:651c:25c1:20b0:38a:6acb:eab3 with SMTP id
 38308e7fff4ca-38bf96f3a52mr38546621fa.35.1774364402501; Tue, 24 Mar 2026
 08:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774353053.git.mykola_kvach@epam.com> <581179709977ce4cebb22597411048dc93b11167.1774353053.git.mykola_kvach@epam.com>
 <3882d56e-def9-4ff5-9014-f72e80c7a1c8@suse.com>
In-Reply-To: <3882d56e-def9-4ff5-9014-f72e80c7a1c8@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 24 Mar 2026 16:59:49 +0200
X-Gm-Features: AaiRm53OuS123wlfJDdFo4uwZri6vrHnnPHVdPLvwE7AuMJA9dgli6w0KkUc6ps
Message-ID: <CAGeoDV8=ezYesxz7AgdPP4K_vcJZhCTTsQ3UTRC95NiYDgPgZQ@mail.gmail.com>
Subject: Re: [PATCH v17 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1774364403-53699900-A2C8B20A/0/0
X-purgate-type: clean
X-purgate-size: 1154
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2189B30AA32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 2:53=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 24.03.2026 13:26, Mykola Kvach wrote:
> > --- /dev/null
> > +++ b/xen/include/xen/suspend.h
> > @@ -0,0 +1,25 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef XEN_SUSPEND_H
> > +#define XEN_SUSPEND_H
> > +
> > +#if __has_include(<asm/suspend.h>)
> > +#include <asm/suspend.h>
> > +#else
> > +static inline void arch_domain_resume(struct domain *d)
> > +{
> > +    (void)d;
>
> What use is this? None of our stubs does anything like that without a cle=
ar
> need.

The (void)d was only meant to make it explicit that the parameter is
intentionally unused in this no-op stub.

I find this useful as a reminder both for possible compiler
unused-parameter checks and from a MISRA-style point of view, although it
has no functional effect. Given how late this is in the series, I would
prefer to avoid another reroll for this detail alone.

Happy to send v18 if you think this is a blocker, but I'm also fine if you
want to strip that line on commit to save us both some time.


Best regards,
Mykola

>
> Jan

