Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFH3CGEE12mPKggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 03:44:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B670E3C54E3
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 03:44:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276634.1561995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAeQ9-0000cO-A1; Thu, 09 Apr 2026 01:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276634.1561995; Thu, 09 Apr 2026 01:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAeQ9-0000ae-6c; Thu, 09 Apr 2026 01:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1276634;
 Thu, 09 Apr 2026 01:43:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wAeQ8-0000aY-2z
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 01:43:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAeQ6-007il5-9Z
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 03:42:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69d703bc-e002-0a2a0a5209dd-0a2a4505a344-38
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 03:42:58 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <sstabellini@kernel.org>)
 id 69d70421-3760-0a2a45050019-ac6904feddd6-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 03:42:58 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8D41F600AD;
 Thu,  9 Apr 2026 01:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805F3C19421;
 Thu,  9 Apr 2026 01:42:55 +0000 (UTC)
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
	s=k20201202; t=1775698976;
	bh=IDbGrUYW1qx3z77VZ3kqZ5LKwaE7kx9+w/skuTHAltM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XybisJgRQ3EAAJXHnGoEZDOt4Fk6mszHaP69xkbaVBwYl1b/wU6Hu8qlEhgV6PQRj
	 E4j9fcEXSE/yjjpniPaD3AzRK/DDAVzpODFsyVba15BXImQyvrAp8PSHXffLdOlDVJ
	 dJ1IRR0RwDySXrx64m74/nBRQu+ffvlPFhEncYwuYTndF2/ot6iu9sxZsaWJtRXFRT
	 UUcfrJ+GmZiOmWfgCwCcPGxPTjazub1hHOjXs1mgpraq6D4qaduJ/8Loyyqhv7O7C5
	 3jWItOzyjRtif4nvTGB6i9zg/rowMPQTxb7nBO46BE7esdxFBsJCCfmpdbSoJOrT14
	 gi6PaQ/ZB0tqg==
Date: Wed, 8 Apr 2026 18:42:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: GuoHan Zhao <zhaoguohan@kylinos.cn>
cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/manage: unwind partial shutdown watcher setup on
 error
In-Reply-To: <20260407022443.12971-1-zhaoguohan@kylinos.cn>
Message-ID: <alpine.DEB.2.22.394.2604081842470.2873990@ubuntu-linux-20-04-desktop>
References: <20260407022443.12971-1-zhaoguohan@kylinos.cn>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c201ff/1775698978-3173A96F-FF6118A3/0/0
X-purgate-type: clean
X-purgate-size: 892
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhaoguohan@kylinos.cn,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B670E3C54E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 7 Apr 2026, zhaoguohan@kylinos.cn wrote:
> From: GuoHan Zhao <zhaoguohan@kylinos.cn>
> 
> setup_shutdown_watcher() registers shutdown_watch first, then the sysrq
> watch, and finally publishes the supported feature-* nodes in xenstore.
> If sysrq watch registration fails, or xenbus_printf() fails after one or
> more feature nodes were created, the function returns immediately without
> undoing the earlier setup.
> 
> This leaves the system in a partially initialized state, with registered
> watches and/or stale xenstore entries despite the function reporting
> failure.
> 
> Unwind the partial setup before returning an error by unregistering any
> watches that were already registered and removing feature nodes that were
> already published.
> 
> Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

