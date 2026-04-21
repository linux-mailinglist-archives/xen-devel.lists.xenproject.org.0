Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDfBOYz352kVDgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 00:17:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960B544015E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 00:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289513.1569457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJPX-0000yt-3s; Tue, 21 Apr 2026 22:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289513.1569457; Tue, 21 Apr 2026 22:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJPW-0000xb-Uv; Tue, 21 Apr 2026 22:17:38 +0000
Received: by outflank-mailman (input) for mailman id 1289513;
 Tue, 21 Apr 2026 22:17:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wFJPV-0000x3-LV
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 22:17:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFJPV-004wxQ-2Z
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 00:17:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f77a-e002-0a2a0a5209dd-0a2a4505a99a-4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:17:37 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f77f-aaa8-0a2a45050019-aceafc1fbc22-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:17:36 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5415840ABC;
 Tue, 21 Apr 2026 22:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D01C2BCB0;
 Tue, 21 Apr 2026 22:17:34 +0000 (UTC)
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
	s=k20201202; t=1776809855;
	bh=vXU7Zt2l4M8G60BE1c8ZN9B628h/QdmUsGy42HqenXo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FNdtPAUoIer4gcLCjIByRdrBvDT6mt2BUhuh9N7PzxY3Bm6MNQblen6BwAv0C+wga
	 EWIpZR5P/KaWuWN2ETOoR7dM7HeumTUPg/2ywgYZHflZMNlTUF1q5XEdWBfarAdR/U
	 d1JZi3n17cyy/3YatGNfLk/CEVrhf0aUIw4nvgpZvNS0RYEr/jP61YgLMFMmJrD+Oo
	 MfFimqrNMYjjhTSxNxyF6yDH2L7ACDxpWIv7d3EgOSwyvY24rbpJcbU8MDGshz2vc4
	 M7jVq+yarMY0t2+R2dILVK0ZzIEn6ZUK1zYrWUtqqgcv1IA4ZuRGX4yIlQSLTFGDaj
	 5daxqncPX/U+g==
Date: Tue, 21 Apr 2026 15:17:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/6] xen/dt-overlay: fix rangeset leak and dead code in
 domctl path
In-Reply-To: <33C5577E-F6AE-4FC2-BE53-879BA4EB6198@arm.com>
Message-ID: <alpine.DEB.2.22.394.2604211517270.2712345@ubuntu-linux-20-04-desktop>
References: <20260415113700.107915-1-michal.orzel@amd.com> <20260415113700.107915-3-michal.orzel@amd.com> <33C5577E-F6AE-4FC2-BE53-879BA4EB6198@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c201ff/1776809857-E8BAC443-83659651/0/0
X-purgate-type: clean
X-purgate-size: 939
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,suse.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
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
X-Rspamd-Queue-Id: 960B544015E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 15 Apr 2026, Luca Fancellu wrote:
> Hi Michal,
> 
> > On 15 Apr 2026, at 12:36, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > handle_attach_overlay_nodes() unconditionally creates new rangesets
> > without checking whether they already exist from a prior attach. A
> > repeated attach for the same overlay leaks the original pair. Reject the
> > operation with -EEXIST if rangesets are already present.
> > 
> > Also, dt_overlay_domctl() early-returns -EOPNOTSUPP for any operation
> > other than ATTACH, making the if/else at the bottom unreachable. Remove
> > the dead branch.
> > 
> > Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
> > Reported-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

