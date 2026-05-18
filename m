Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFoINjogC2reDgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 16:20:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7A456E9CA
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 16:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311935.1582058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOypb-0005zn-Nd; Mon, 18 May 2026 14:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311935.1582058; Mon, 18 May 2026 14:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOypb-0005wy-L1; Mon, 18 May 2026 14:20:31 +0000
Received: by outflank-mailman (input) for mailman id 1311935;
 Mon, 18 May 2026 14:20:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOypa-0005wr-6g
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 14:20:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOypZ-00AHTM-IY
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 16:20:29 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0b2020-2eae-0a2a0a5409dd-0a2a45018554-48
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:20:29 +0200
Received: from [209.85.167.49] (helo=mail-lf1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0b202d-c1f2-0a2a45010019-d155a731d1ff-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:20:29 +0200
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5a995ab70d1so3531660e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 07:20:29 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779114029; cv=none;
        d=google.com; s=arc-20240605;
        b=D3P6rffHJDQsJonFrSlLHAFMLbHZIBMLQwUHWEwpK33Ws2SS+RaYbTmGbxmEZgheu1
         5hmNRJawdM2fTuddg2MnBosm8Z1hKx1B6Y+8ivBZipZD+AHNefV8xHdCohzc+74XWdQ9
         uPLJTaUDDs/TIDD9XwtVq7xjnfwrfseJ33twAKXR3ThF0T/QPVk+FO8MNS5Fd9Mov5TD
         COcmemdh6QDPM0N/+hIms069Dx1a1gnnJYFjuOLcLT+uqVFeM9Q0o643qVgQkoi+6xpl
         JwraJL8+QVG80oX3kATmNEWiYNzcv9eJLJwi95JonY8cKa8p3EABu0dE0IUbn6Xnk3Ym
         0RQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ybmu1DRrDpjzD8pi8VpWCbTSM8p08YPXbd7PmrylEM4=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=HkEGnq6PDi1qD+YE6+saKQGwrQswfVbUIjBuCY5SRfXxAywm0bmTZNELpwekp/ew8U
         yW/4xMMTvKLfLVoYog0VaFfV+MbYGjsvhUX5swgRM9VJoFFlLuI+0k5KKhMQPnb1FBAX
         62jgpi0UsviHP9Z2Rkuoqytd1rX0Jth6+/PQseq0vJzD80ZeOuOgPG9nINC8VrcLyUlA
         47Rlsj0uQl1dzZzzV4Z7eyjs4g4da5E+7WL3GM7YqooVQkRYFCVMlkufDcIKYVBYYXVF
         DUck6n8zzfmIRFPniWrutP9yE9NugpJHvR1Sz7fgWr1NVq5TQbsZo3Qz4nCYe4oE3nf+
         AofQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114029; x=1779718829; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ybmu1DRrDpjzD8pi8VpWCbTSM8p08YPXbd7PmrylEM4=;
        b=qQU2tFOvIRCfS2X0KQByHH4AolcLzJk2AJmGzkNdwiLuDOJ88n228Z6/ScEsmUvEjW
         L2aRkJM/VpTewgsUr2smfMGDP3kaokB+yFl+rR6LehlZTjTKKveCWSv/Joxh7eHzKPuZ
         mz3wWBEujH3WQZb9D+2yzgsbPKvJ2xVouX+WIVnOZTJ5xupHLu/0lew1SjCmn2Xw9Uig
         nx41iOYJtMBFoE+TZnwJDbO+Uhh6AJVPNO2FMCxohHzgkfBHWz6Ez6O/s+s06NPiTThN
         rix2ld1PR3C8XYDgTm+PbXR4QARgv4sdkVG7OiUHwwNLI8Rii82xljSfJzU6gYzKstGE
         dekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114029; x=1779718829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ybmu1DRrDpjzD8pi8VpWCbTSM8p08YPXbd7PmrylEM4=;
        b=ehREkYyalVLu7D1OyKhuBQ2VSTBht/TGrIKRc6FHWtrDoMXTcvjKT6QIVi0D5B3Ma/
         vlV0WQ+sYnH5U2s115VR4sOMZyBs81PYu87ek73apO7299vlMQzEdcI6fmcnKVFizYyU
         WA09YgDYKgg03OO99tTYKfB4HRwD92YC3YWLeaYgVxdgJwBY60YmIoqN2BYhlZ8HTVTJ
         5TtaQjd6smpZuuUsVf3ZZJo064QUT4Y0oRUquGX7nAkWKEIarD2podBHaFlCCGBDXWQU
         o7wJi9D5qjtLqNgqTs7ILwO3dBpx7yF3mvw/b6hejx2b1Jgp6aW8KQCQ24cmhoK0jP52
         aJfQ==
X-Gm-Message-State: AOJu0YxYl3MdRUFmWz4xxmM/CTiaQoY++SIMd7lJg6RUfkUUIRcNyHlo
	oVOmIEoC0QDXhNvIL0AeyUePHaY0SwDOYF9P719GB92v2zK4+5rmRUMPr3nu5uhveoHU7hU8n4R
	8/KpJFtzULT2fTE/iviev7NEjv7rohWQ=
X-Gm-Gg: Acq92OGUPqvv6I99xcDccnusGlKWmOGqbYhzA4rC+4fRnelKFEWm49/fV+39qHp/od8
	SyYugxEBdoIxXhK439EHnY87yuEfJR5baS3Nyuy4ksI9rYwH4+xLA7lgodu/8UPIc3I8YWjLaQy
	ys9XnM3bAV0feihujH8u07HLWBqcoxe/jbS+ohDINas5RVZlGmPwADqkHxCn31i4MNsf5OI0fwQ
	ejRa4DhUqQL+ljkzCcXtRc8HSLPyPLWZDygDwrEKIg01dSoxoGUKclU25yuVFSg7n4X9TTt03SG
	Nugt1x4qbvY8l3E=
X-Received: by 2002:a05:6512:b9c:b0:5a8:5276:962a with SMTP id
 2adb3069b0e04-5aa0e61914amr4709275e87.9.1779114028340; Mon, 18 May 2026
 07:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778605274.git.mykola_kvach@epam.com> <2268857aa7eef95444169564c17f7e9a6f59b1c5.1778605274.git.mykola_kvach@epam.com>
 <14563498-D318-4419-A07C-DDFDCC8FECA8@arm.com>
In-Reply-To: <14563498-D318-4419-A07C-DDFDCC8FECA8@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 May 2026 17:20:17 +0300
X-Gm-Features: AVHnY4IuA9qa_b9i4olnJCPZMr3FuAXdTR50P_x3gBTWoMdk0y5xjTW885MrMiQ
Message-ID: <CAGeoDV8o4Kdiwh=kB_nif16GOAYcscHENMom6kENoGwyFDz-BA@mail.gmail.com>
Subject: Re: [PATCH v9 13/13] xen/arm: Add host system suspend backend
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1779114029-B5D41FF4-B78E6DFC/0/0
X-purgate-type: clean
X-purgate-size: 765
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
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,arm.com:email,mail.gmail.com:mid];
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
X-Rspamd-Queue-Id: 4E7A456E9CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

Thank you for the feedback.

On Fri, May 15, 2026 at 11:45=E2=80=AFAM Luca Fancellu <Luca.Fancellu@arm.c=
om> wrote:
>
> Hi Mykola,
>
> > diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/m=
m.h
> > index 2eb8465aa9..de119cad3a 100644
> > --- a/xen/arch/arm/include/asm/mm.h
> > +++ b/xen/arch/arm/include/asm/mm.h
> > @@ -360,6 +360,8 @@ static inline void page_set_xenheap_gfn(struct page=
_info *p, gfn_t gfn)
> >     } while ( (y =3D cmpxchg(&p->u.inuse.type_info, x, nx)) !=3D x );
> > }
> >
> > +void set_init_ttbr(lpae_t *root);
>
> Since this is MMU only, shall we move it to asm/mmu/mm.h?

Ack. set_init_ttbr() is MMU-specific, so I will move the declaration
to asm/mmu/mm.h.

Best regards,
Mykola

