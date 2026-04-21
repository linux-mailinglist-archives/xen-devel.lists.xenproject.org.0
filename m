Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNq1IYD352kVDgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 00:17:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1F0440156
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 00:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289511.1569447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJPL-0000iB-Qw; Tue, 21 Apr 2026 22:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289511.1569447; Tue, 21 Apr 2026 22:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJPL-0000g0-OQ; Tue, 21 Apr 2026 22:17:27 +0000
Received: by outflank-mailman (input) for mailman id 1289511;
 Tue, 21 Apr 2026 22:17:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wFJPK-0000IM-Ml
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 22:17:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFJPH-00FslP-TK
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 00:17:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f6ec-5cb7-0a2a0a5109dd-0a2a450285d8-48
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:17:23 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f772-af86-0a2a45020019-aceafc1fa924-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:17:23 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C9D7C4027F;
 Tue, 21 Apr 2026 22:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B88C2BCB0;
 Tue, 21 Apr 2026 22:17:21 +0000 (UTC)
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
	s=k20201202; t=1776809841;
	bh=xn3A0NuiXervtpsnojkWIHY+IxM7mxFsV2qRaCcwuBw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KtkGvelEDf1hG0x8PyI9REg7xzzQaxMRvWbeJOoOnx1VK9XlOV/dnFn9qBOFQSmRX
	 9JqSmfS+j1Tu48/gjLu+/w1V0p0eEfX0H4KYeJ/RfGnktJ7aCGn/8Kfe6fTif0YHmF
	 ry2VzX72a4Bo7ZmGOZKA8dhKg481w6hqJDtc6Lnr7pFwWsiRau27MzI9eTNPyTZKKU
	 XREwupqJbtttt/HVlvxSP8TGrrFKd3ruUgd+hBE5tMEXJHtLQwzdi5AiDJAOVMWcuR
	 sHuxp1PTJgo8GdYDOHO4Yel17ObEmwI/zQMuGDtDnDP+w87Qtpsr3IeWXGczP8a4q1
	 fCYMiFIscQ/Jg==
Date: Tue, 21 Apr 2026 15:17:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Gyujeong Jin <wlsrbwjd7232@gmail.com>
Subject: Re: [PATCH 1/6] xen/dt-overlay: fix double-free of rangesets on
 attach failure
In-Reply-To: <A0CD5D33-67D7-4A69-A5C3-C7C37F72830C@arm.com>
Message-ID: <alpine.DEB.2.22.394.2604211517140.2712345@ubuntu-linux-20-04-desktop>
References: <20260415113700.107915-1-michal.orzel@amd.com> <20260415113700.107915-2-michal.orzel@amd.com> <A0CD5D33-67D7-4A69-A5C3-C7C37F72830C@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-720697/1776809843-82B68161-A53F0E86/0/0
X-purgate-type: clean
X-purgate-size: 1002
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,lists.xenproject.org,kernel.org,xen.org,arm.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:wlsrbwjd7232@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3B1F0440156
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 15 Apr 2026, Luca Fancellu wrote:
> Hi Michal,
> 
> > On 15 Apr 2026, at 12:36, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > handle_attach_overlay_nodes() destroys the IRQ and IOMEM rangesets on
> > failure but leaves the pointers dangling in the tracker entry. A
> > subsequent handle_remove_overlay_nodes() for the same overlay will call
> > rangeset_consume_ranges() on freed memory followed by a second
> > rangeset_destroy(), resulting in use-after-free and double-free.
> > 
> > NULL the pointers after rangeset_destroy() so that remove_nodes() and
> > handle_remove_overlay_nodes() skip the stale entries.
> > 
> > Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
> > Reported-by: Gyujeong Jin <wlsrbwjd7232@gmail.com>
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> 
> Looks ok to me
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

