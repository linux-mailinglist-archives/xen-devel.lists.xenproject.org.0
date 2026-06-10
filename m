Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oU0qGE+JKWq1YwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 17:57:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81D066B163
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 17:57:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fJnygjQT;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1334533.1597537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXLIK-0007BD-6J; Wed, 10 Jun 2026 15:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334533.1597537; Wed, 10 Jun 2026 15:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXLIK-00078R-3L; Wed, 10 Jun 2026 15:56:44 +0000
Received: by outflank-mailman (input) for mailman id 1334533;
 Wed, 10 Jun 2026 15:56:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wXLII-00078J-JL
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 15:56:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXLIH-00CQ7M-P2
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 17:56:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a298939-bab6-0a2a0a5309dd-0a2a4509bcd2-4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 17:56:41 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a298938-2497-0a2a45090019-ac6904fec6d8-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 17:56:41 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D362760172;
 Wed, 10 Jun 2026 15:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255081F00893;
 Wed, 10 Jun 2026 15:56:39 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781106999;
	bh=OVYQFfLKJF4iLeCO+8a3Ef3RTz9KqGXiHZuRczNGxoI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=fJnygjQTi+R1+420KQ85+gT3RmXsZZaz4WjIV6ynVzFnnbZ6fratXkbDZtnJ5Ngjj
	 OFH7C5kNaTbl49hPSXrN4ufO91HyKY/PWYMzALL1rte5ha1+BhXGH8CLeUyKoj7uZX
	 RrldQPpOAugUc7k2w/49TaZ3EtfMyL5lHnTnHEaY43SIpFT1S0O0C/tr1tvwY9VUUo
	 Xc1TOsCB1T8o51QdCanXk80hljIh+tSMYR5RKtEY3OaXXF8XLHLO6c306Xxz5V5G1e
	 uCzEQL6ZqGQ2UFamfEAHwDPhpx6uMwfOgTuwCMPjq/TEGXGzqDuFMgWMFaT7N1DNKd
	 RPYOOpl3f9Rrg==
Date: Wed, 10 Jun 2026 08:56:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>
Subject: Re: [PATCH] MAINTAINERS: remove RTDS specific entry
In-Reply-To: <20260610072308.597383-1-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2606100856250.368315@ubuntu-linux-20-04-desktop>
References: <20260610072308.597383-1-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-bad1c0/1781107001-89D85A53-1214120C/0/0
X-purgate-type: clean
X-purgate-size: 1222
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dfaggioli@suse.com,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,ubuntu-linux-20-04-desktop:mid,upenn.edu:email];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E81D066B163

On Wed, 10 Jun 2026, Juergen Gross wrote:
> Remove the RTDS scheduler specific entry in MAINTAINERS.
> 
> The effective changes will be:
> 
> - Meng will no longer be a maintainer. His last Ack on a RTDS patch
>   was given in 2019, since then I can't remember having seen any
>   reaction on a RTDS patch.
> 
> - I'll be made a maintainer of this scheduler. Dario has indicated
>   that he doesn't have lots of cycles for doing reviews, so he would
>   be grateful for not being effectively the only maintainer of the
>   RTDS scheduler.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  MAINTAINERS | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccb01b8e39..195d6cb0e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -515,12 +515,6 @@ S:	Supported
>  F:	config/riscv64.mk
>  F:	xen/arch/riscv/
>  
> -RTDS SCHEDULER
> -M:	Dario Faggioli <dfaggioli@suse.com>
> -M:	Meng Xu <mengxu@cis.upenn.edu>
> -S:	Supported
> -F:	xen/common/sched/rt.c
> -
>  SCHEDULING
>  M:	Dario Faggioli <dfaggioli@suse.com>
>  M:	Juergen Gross <jgross@suse.com>
> -- 
> 2.54.0
> 

