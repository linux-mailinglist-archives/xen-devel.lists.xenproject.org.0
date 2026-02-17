Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHtyJumJlGm+FQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 16:31:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FDF14D963
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 16:31:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235165.1538215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsN36-0000F5-Kx; Tue, 17 Feb 2026 15:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235165.1538215; Tue, 17 Feb 2026 15:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsN36-0000C5-I4; Tue, 17 Feb 2026 15:31:40 +0000
Received: by outflank-mailman (input) for mailman id 1235165;
 Tue, 17 Feb 2026 15:31:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idFW=AV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vsN35-0000Bz-2W
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 15:31:39 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf13e409-0c15-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 16:31:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D7CAB440D2;
 Tue, 17 Feb 2026 15:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8316CC4CEF7;
 Tue, 17 Feb 2026 15:31:34 +0000 (UTC)
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
X-Inumbo-ID: bf13e409-0c15-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771342295;
	bh=puQ35sN/YP9u5FxyFRkjewp/UfRrxV3//5EaxXedHyg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=smLe5CfoaNmYtMa6Y9oXNUytHPZBHk+R9q4sXcVExwHoQBFyyp+a8CUiYwQEEHEyB
	 t2RVHuf4r6bCw4yWm8YKkY+4qxlXV4mPaPEGQSLxrRHt17ESVYi+ULmfIajYedIhnK
	 9lTLbMi2InG33oHj3s7ntktZVPKV5gSoIXSID/sWRkq4MdkTWndFDP6FprkoQEAfuK
	 ca1Xz0fB1npBWAXE8Cpn2CouqTPdEr3gdw7+reV1VGIHuvtcAK6NjFitMoOhZ0cTgX
	 C4rabPJR4A6lh4Xo4zWQgn2PgcCyvJlxvQA2ZabY15zW03EovDPl4tX/2Jla6ZBpjO
	 BQVJRWFsz+ing==
Date: Tue, 17 Feb 2026 07:31:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v5] xen/domain: introduce DOMID_ANY
In-Reply-To: <20260205235126.3764953-1-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2602170731160.359097@ubuntu-linux-20-04-desktop>
References: <20260205235126.3764953-1-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:email];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 44FDF14D963
X-Rspamd-Action: no action

On Thu, 5 Feb 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add a new symbol DOMID_ANY to improve the readability of the code.
> 
> Update all relevant domid_alloc() call sites and harden the domid_alloc()
> input value check.
> 
> Also, fix problem with passing invalid domain IDs in
> XEN_DOMCTL_createdomain: turns out libxl__domain_make() (toolstack)
> uses 0xffff as domain ID.
> 
> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

