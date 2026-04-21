Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDnjLZz352kVDgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 00:18:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9BB44017C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 00:18:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289521.1569466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJPi-0001RL-Dd; Tue, 21 Apr 2026 22:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289521.1569466; Tue, 21 Apr 2026 22:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJPi-0001Pd-Ae; Tue, 21 Apr 2026 22:17:50 +0000
Received: by outflank-mailman (input) for mailman id 1289521;
 Tue, 21 Apr 2026 22:17:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wFJPh-0001PC-PE
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 22:17:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFJPh-000y8Y-5r
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 00:17:49 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f767-e002-0a2a0a5209dd-0a2a450abba8-16
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:17:49 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f78b-56b3-0a2a450a0019-aceafc1fa868-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:17:48 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6C3BE4171F;
 Tue, 21 Apr 2026 22:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3DFC2BCB0;
 Tue, 21 Apr 2026 22:17:47 +0000 (UTC)
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
	s=k20201202; t=1776809867;
	bh=LPo7tVyH/24wj01Stx7zcbN5lhedJIwpaXTZlSeA/dM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nnyuU6QspuxnUbGajZmzv9QgzBbvfcz4RSflKs2crXmSSFgCZu8Vep4o6mj7taCm9
	 VCdv92qVvINYDxC0dC2QKBQPCbpy43OcBAA0T9Uv7HBTESKoTSPg39vb0/C/iCDSZ5
	 2PjtFUctBMofjhm28m0Uz1OheuzKlQPhvjIa6eFjw9JE5eEriWoTNSazPjSCVpgw1P
	 KRWB1jRKyfahdt2mOxumLydHyEc+eBXYRRGO1qcdNAhlhfZUNY1o8u3WVdExKdSotB
	 7HJ/zHkRzBdgILXyEdIBURhM6EiUxLggf2nkxz6noc6ULiBab/gQ9e/qA+jXOKZ/8A
	 dW5+dnU0We6IA==
Date: Tue, 21 Apr 2026 15:17:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 3/6] xen/dt-overlay: check overlay size before memcmp in
 tracker lookup
In-Reply-To: <BFE6762A-7A1B-484C-B69B-43D9FB13B47E@arm.com>
Message-ID: <alpine.DEB.2.22.394.2604211517400.2712345@ubuntu-linux-20-04-desktop>
References: <20260415113700.107915-1-michal.orzel@amd.com> <20260415113700.107915-4-michal.orzel@amd.com> <BFE6762A-7A1B-484C-B69B-43D9FB13B47E@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-4011c0/1776809869-44F618B7-82C6F0C9/0/0
X-purgate-type: clean
X-purgate-size: 964
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8B9BB44017C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 15 Apr 2026, Luca Fancellu wrote:
> Hi Michal,
> 
> > On 15 Apr 2026, at 12:36, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > find_track_entry_from_tracker() compares overlay_fdt_size bytes of the
> > stored overlay against the input without verifying that the stored
> > overlay is at least that large. If the input is larger, memcmp reads
> > past the stored allocation. If smaller, a prefix match could falsely
> > succeed.
> > 
> > Compare fdt_totalsize() of the stored overlay against overlay_fdt_size
> > first. Both values are validated by check_overlay_fdt() at their
> > respective entry points, so no additional field in overlay_track is
> > needed.
> > 
> > Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

