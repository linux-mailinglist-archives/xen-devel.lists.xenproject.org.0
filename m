Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPMTDIJ02WnXpwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 11 Apr 2026 00:06:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A3F3DD171
	for <lists+xen-devel@lfdr.de>; Sat, 11 Apr 2026 00:06:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279801.1563997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBJzE-0001Ch-8h; Fri, 10 Apr 2026 22:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279801.1563997; Fri, 10 Apr 2026 22:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBJzE-0001BF-52; Fri, 10 Apr 2026 22:06:00 +0000
Received: by outflank-mailman (input) for mailman id 1279801;
 Fri, 10 Apr 2026 22:05:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wBJzD-0001B9-8P
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 22:05:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBJzC-00GrKY-Ky
 for xen-devel@lists.xenproject.org; Sat, 11 Apr 2026 00:05:58 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69d9741e-bab6-0a2a0a5309dd-0a2a450c916c-26
 for <xen-devel@lists.xenproject.org>; Sat, 11 Apr 2026 00:05:58 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <sstabellini@kernel.org>)
 id 69d97444-f40c-0a2a450c0019-aceafc1fa48c-3
 for <xen-devel@lists.xenproject.org>; Sat, 11 Apr 2026 00:05:58 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 29194407AA;
 Fri, 10 Apr 2026 22:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304ACC19421;
 Fri, 10 Apr 2026 22:05:55 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775858756;
	bh=ey4VoBj5qX4SNQT+2IDihuuGAqI2cAW0TQcfzgtTkDw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NwltKpOvKxCgh7HJj/t9mSf1O+OIhxIvAGdB5FKxFWUW0pv0m52scgNNqSkbZ8Kub
	 nGo5lvScP55H+FdSB7oeorLHz6mGgEwl9WYU/bjtfByL/pBMKNZ4Lrll12d+Sohr5V
	 JS/ynIWLxgOlx91GTUIfQn5uFFv7cu4Ef1OZwC5rUdcm9YQUZ7uoRtaKcGiCJfFOy8
	 uQ7vP/QHkJTW9kbcek3+u5n3uKe5kIXoDRlCdsv0rwm+tAk6xSni6nqUQKujT7RGbL
	 OV6G00CFWSg6G04JrxpYcg/NO0zSe64YxC9I/o21erQWtdgRhbyFgJeyy400BF2A/h
	 338vjvCS4MWeA==
Date: Fri, 10 Apr 2026 15:05:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Orzel, Michal" <Michal.Orzel@amd.com>
Subject: Re: Generation of phandles for guest DTB in dom0less
In-Reply-To: <29f456c6-2f6a-4b7d-a70f-9d2d50663b47@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2604101505420.2873990@ubuntu-linux-20-04-desktop>
References: <29f456c6-2f6a-4b7d-a70f-9d2d50663b47@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-d25034/1775858758-FEB4CA3D-40A19CD7/0/0
X-purgate-type: clean
X-purgate-size: 2576
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Michal.Orzel@amd.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C9A3F3DD171
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 10 Apr 2026, Oleksii Kurochko wrote:
> Hi all,
> 
> While working on dom0less guest FDT construction I noticed that
> fdt_generate_phandle() is "broken" when used to generate phandles for a
> guest's nodes. The root cause is the way dom0less manages phandle_intc
> (phandle_gic in Arm terminology): the dummy GIC node already occupies a
> phandle in pfdt, but fdt_generate_phandle(kinfo->fdt, ...) has no visibility
> into pfdt and therefore may produce a phandle that collides with phandle_intc.
> 
> I see three potential approaches to fix this and would like to get the
> community's feedback before going further.
> 
> **Option 1: guest_fdt_generate_phandle() wrapper**
> 
> Introduce a thin wrapper that skips any phandle already reserved by the
> architecture:
> 
>   int guest_fdt_generate_phandle(const struct kernel_info *kinfo, uint32_t
> *phandle)
>   {
>       int res;
> 
>       res = fdt_generate_phandle(kinfo->fdt, phandle);
> 
>       if ( *phandle == kinfo->phandle_intc )
>           (*phandle)++;
> 
>       return res;
>   }
> 
> The obvious downside is that this is not flexible: every future node added to
> pfdt would require a corresponding fixup here, which is easy to forget and
> hard to maintain.
> 
> **Option 2: Reserve a "first free phandle" field in the arch-specific
> structure**
> 
> Add a field to the arch-specific part of struct kernel_info that stores the
> first phandle number guaranteed not to be used by pfdt. Guest phandle
> allocation would then start from (and increment) this field, completely
> avoiding the pfdt phandle space.
> 
> This is cleaner than Option 1 but requires careful initialisation and
> documentation to make sure the field is always set before it is consumed.
> 
> **Option 3: Store a pfdt pointer in struct kernel_info**
> 
> Add a `pfdt` pointer to struct kernel_info and pass it to
> fdt_generate_phandle() whenever a guest phandle is needed:
> 
>   fdt_generate_phandle(kinfo->pfdt, ...)
> 
> Because fdt_generate_phandle() walks the target FDT to find the highest
> existing phandle and returns the next free one, using pfdt as the source of
> truth guarantees uniqueness across both pfdt and the guest FDT, without any
> manual bookkeeping.
> 
> This feels like the most robust option to me, since it naturally handles any
> future nodes added to pfdt without requiring changes to the phandle allocation
> logic.
> 
> Does anyone see issues with Option 3? Are there other approaches worth
> considering?

Option 3 looks decent

