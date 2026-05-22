Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BEp9CLH+D2pvSQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:58:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E3E5AFBC0
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316365.1585754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJq7-00017a-R7; Fri, 22 May 2026 06:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316365.1585754; Fri, 22 May 2026 06:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJq7-000158-Nl; Fri, 22 May 2026 06:58:35 +0000
Received: by outflank-mailman (input) for mailman id 1316365;
 Fri, 22 May 2026 06:58:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQJq6-000152-8t
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 06:58:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQJq5-00DTop-Hi
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 08:58:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ffe82-2eae-0a2a0a5409dd-0a2a4504e5c4-48
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:58:33 +0200
Received: from [209.85.208.172] (helo=mail-lj1-f172.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ffe99-1dec-0a2a45040019-d155d0acc102-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:58:33 +0200
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-393a44854d2so62780771fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:58:33 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779433113; cv=none;
        d=google.com; s=arc-20240605;
        b=F2zYkLjn0qE/rmm+lvUrPboECtx1vp4+L6rXLHsED/664RRswvodnB+i0AJwJ3YZKM
         kR0195hdtSkWg/aOpeT3h5WhGnPlo6J8Jd1GVOZ983shjQlpTAWfU7yWjEwyhOKTlMYq
         umKMfWVdM/uLu8qwbQXGetW1pBy0+lGVdLxxLHZ5x3llExm8wLFUU9eAtZ2gAbUZucLI
         XA0760YJYoRW37VJv2Otjl/IPkGUMEf19QMcSFD1G9x7awIT5aeVIYyQeLtPQHqRP7Pk
         qSaKhIG9B5NJrDN4P+ZOeFhrSB2vRW55eXG+LQJhGpzNkluap4k/JMBOC+/SgGrHXIEI
         PhoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aphvrh3o4r9AM14USpcWUYSwrDUfewqP4MvO0SNGqVg=;
        fh=074dSOZR2TjZuH9KX7pMcX1QOxphcb/LlKcediamujk=;
        b=WQivLxi3pMax5hl2dYDrXVskvr69Y3fqKBfbGeOo9g2XKFjHmmO2pOj30T0rySZ0rS
         CyTBVnUF+DWRebPs5jDCPdrmNSa1Sczq4q+asgpsCq8+llDODcKfcHY+comP2eqKbafn
         pt1jrtV6EOpevyOzBkj+02ai+CHRl31SDQADqHAiChk5kJt2/kWiQWth5zjRhSX0+68d
         Qpfkz8vZHJCsStGVCwrTVB7nZSttntxKoIAwVEijKcnBo4lJRwhKbmpwRnoprqIKWXIb
         mKBbMPL/9hCOwtVD6katGSOS7iKdm+R+YlFyU3oqTpkY8lhrEH5CMNI9fjHae5IFjPjz
         FiOg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779433113; x=1780037913; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aphvrh3o4r9AM14USpcWUYSwrDUfewqP4MvO0SNGqVg=;
        b=fjg/VoZZFE1G6DVwUr5MITyhqHSkmYZwBe3pE6qVGYxkzwcfdnYj/a1qkGtA2LTojG
         6L6XUO0Qunh9+ZNArmwBsZsnvy1C3WB1q8UwtktOhyPTdpJEBFiU+Q0CApiZ5umVgXqa
         neZEDYseyrq0DeHUVSSdXGmI8KZgQ/EfBuKaDEfKD0W+0qWlBsfissMx6o3QsECBoRKF
         +jOT8dx5gdUKX5SSqCvRFStuj+twnLTn9+Prh8wzOUzrln0myY5TCWEd+7Dhcp6HzZPX
         MoFHM8zg6WzsycA3IkWcmedOZNW/vsk0cCCx0323C6g9XZ5weOWt5XseK5ToSarN48Sp
         JmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779433113; x=1780037913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aphvrh3o4r9AM14USpcWUYSwrDUfewqP4MvO0SNGqVg=;
        b=b7E4HnXdJ1FdGZKv6c59UErPNMJuU6V8f35Dhqo66/gEopzL51bH1dTdKCsH2LfXX8
         c3SGAXe+uemO/9ndkeQx7ysbc6GbwqNspehrvItfAK9rJVYgoqyQytFBRcpdOTtD7my1
         A0jLnOJpbaZv+RSMwm68q3/N1t9WSWgfDazoLfaxsIHN2uVw0YHdageJ+ZqW/FCS8khV
         PYXfveNHo7++5imVD1epPjsynALOi1oYsisUQc1nsTmwSe9k8WNIkTrxn7h7AT3dKt1s
         ItZsi0P4WM3rwFz3hdz+UNONGJ/mvpTHLlT+aQcL42Hw3tzzAY6ese0WthbQ4k3xlgrH
         OdyA==
X-Gm-Message-State: AOJu0YwGVPHFhDiDLeftkj9f0ojr6atXwX5+4TyhnwtxCWU8qzuwd9In
	m6N+V7WS5PJ3N69+AiACPUQ0Rk1OGyFoZz3SbqmCtPHK1Iq27Iqu9kIoB611OqKoIEF6JzfXKel
	YfDxxmF4R5rNdfsy2fc3zts509I3Eg8U=
X-Gm-Gg: Acq92OGKsSGfAEt4aPinVghPeu5eweS1pZS0WUA36ZHqFb37bbmbDB9IVMNizGjVbFL
	5cURoWLphgf6Ezua3MpRhgQ2CqemzJvkOlUAgc74bRaxlspaNATSU8idxuvvVJWmuEPIiWFj70S
	HZOBiKCYbHGbXDxew0SOR6fLickkJHFWfKTawx2/Rv7F8bfgHUG1O/uOItOhTbBVs8ACjNcb0bR
	gQTn/q/MuppPtoTtkZRleCJTkpOF/5KeV9b8bLup9O6GrjtW3a2gzd6wo9zykmRbRuMcnok6YuB
	+AWZrYe1XKdyBG0=
X-Received: by 2002:a05:651c:2114:b0:38e:2de3:f8ad with SMTP id
 38308e7fff4ca-395d8c35d98mr7900811fa.4.1779433112500; Thu, 21 May 2026
 23:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260521232529.694570-1-dmukhin@ford.com> <20260521232529.694570-3-dmukhin@ford.com>
In-Reply-To: <20260521232529.694570-3-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 22 May 2026 09:58:20 +0300
X-Gm-Features: AVHnY4IBTKvFdp_4SnPV-YX3rBBqyw7U2BYkQTWTSj_TO9u7Z84ppeXwrLXu60g
Message-ID: <CAGeoDV8w9HG=b4homaCp9wWi0Oz8HZUi6UktoRTgTRyDhS+uBg@mail.gmail.com>
Subject: Re: [PATCH 2/2] argo: correct logline in ring_unmap()
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	christopher.w.clark@gmail.com, dpsmith@apertussolutions.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1779433113-28B733FF-280E3954/0/0
X-purgate-type: clean
X-purgate-size: 1029
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 84E3E5AFBC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Denis,

On Fri, May 22, 2026 at 2:26=E2=80=AFAM <dmukhin@ford.com> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Drop XENLOG_ERR from the logline since argo_dprintk() already injects
> the proper log level indicator.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/common/argo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index 4f894470698e..c66632486800 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -474,7 +474,7 @@ ring_unmap(const struct domain *d, struct argo_ring_i=
nfo *ring_info)
>              continue;
>
>          ASSERT(!mfn_eq(ring_info->mfns[i], INVALID_MFN));
> -        argo_dprintk(XENLOG_ERR "argo: unmapping page %"PRI_mfn" from %p=
\n",
> +        argo_dprintk("argo: unmapping page %"PRI_mfn" from %p\n",

Same here: argo_dprintk() already adds the "argo: " prefix internally,
so the explicit "argo: " should probably be dropped as well.

Best regards,
Mykola

