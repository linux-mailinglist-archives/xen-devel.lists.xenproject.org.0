Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP9aBuH3kmml0gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:56:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBABD14290E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:56:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233984.1537358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrwGg-0005xi-SO; Mon, 16 Feb 2026 10:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233984.1537358; Mon, 16 Feb 2026 10:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrwGg-0005vL-Pa; Mon, 16 Feb 2026 10:55:54 +0000
Received: by outflank-mailman (input) for mailman id 1233984;
 Mon, 16 Feb 2026 10:55:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vrwGe-0005vF-TO
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 10:55:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vrwGe-00BrO1-1O;
 Mon, 16 Feb 2026 10:55:52 +0000
Received: from [2a01:cb15:80df:da00:80b5:18da:fdf4:baa] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vrwGd-00AJUL-2I;
 Mon, 16 Feb 2026 10:55:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=DpW+BdtDviV6r2jTzycnwjk3yTD8C2hukAHwAEgLF0k=; b=oFEyHu+q6ZYOKTD+z/6RFwpM8Q
	62J6oTLzwTJRCaBN3RqLlhrwtYubtDpSqGEb9Or4ips0k6mBo2cb7JrKOcnBJl+/j/ficCNoV4ymO
	D0JV2VhLDVwMZTRa0cc+SbD90ol58obp/7QWIV1w32HfJQXIbPouh1z6Usq6jnG/rLc8=;
Date: Mon, 16 Feb 2026 11:55:50 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] CI: Remove `brctl` from Arch Linux container
Message-ID: <aZL3tt1p4JJbPAk2@l14>
References: <20260213101921.61888-1-anthony@xenproject.org>
 <ee38a161-80fc-49b3-9e73-af26ffd35fb7@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee38a161-80fc-49b3-9e73-af26ffd35fb7@citrix.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[xenproject.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[xenproject.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,xenproject.org:dkim,citrix.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[anthony@xenproject.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[xenproject.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony@xenproject.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BBABD14290E
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 11:58:06AM +0000, Andrew Cooper wrote:
> On 13/02/2026 10:19 am, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@vates.tech>
> >
> > Package "bridge-utils" have been removed from the official repos, it
> > contained `brctl`. That utility is used by network hotplug scripts,
> > but they already check if it is available and switch to use "iproute2"
> > (`ip`) when not.
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Right now, README lists bridge-utils as a hard prereq, and this is not
> true any longer.
> 
> iproute is also listed as a hard prereq.  Should we merge these two
> lines with a logical or?

Well, iproute2 is an actual hard requirement, `ip` is used in many
places without alternative.

On the other end, `brctl` is optional, but will be used if exist. I
don't know which version of iproute2 is needed in order to not need
brctl anymore.

Cheers,

-- 
Anthony PERARD

