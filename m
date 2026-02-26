Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EeQJy2Zn2mucwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 01:51:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4834919F9F4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 01:51:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241155.1542329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvPbE-00016O-FZ; Thu, 26 Feb 2026 00:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241155.1542329; Thu, 26 Feb 2026 00:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvPbE-00014V-Cq; Thu, 26 Feb 2026 00:51:28 +0000
Received: by outflank-mailman (input) for mailman id 1241155;
 Thu, 26 Feb 2026 00:51:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=deGQ=A6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vvPbC-00014N-Hb
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 00:51:26 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ece1548-12ad-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 01:51:12 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1426B4088D;
 Thu, 26 Feb 2026 00:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D47C116D0;
 Thu, 26 Feb 2026 00:51:09 +0000 (UTC)
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
X-Inumbo-ID: 3ece1548-12ad-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772067070;
	bh=YpoO7+WqUpj23I2uK3HJRQ6WPlvGWMO4/6QPq+Txpgs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=or23EY0klUPaK8yqmz4ektdXHAkW+15w+MwKFTMN3H1uszg3DMMkQjRxqyoukq5iF
	 LEhkE+5b1kWRBDfrPI5a3vTRv+7oHE1XhMOu3Q+lrq+qI45QGN06UvBR9mDO7c7rnh
	 XN5zRMETZsSMKuKiskhKCwvDmzHsPcO8hyzdRdCMPcNDnUX0MK7MFuid3V3guby9Tl
	 cf839BmmnHExMNJ8eca9kdA5/MISlU2om6+FdX/YPBSwXuLUWgeQMF6+JcGZle1lr8
	 53Pm8038IH+2mnjAYVbV4kbU62Qbsbq9q7GrdF3yZeJEpgXBAa5tVeyN4Mk6zCxDRz
	 76ihnzaL7SylA==
Date: Wed, 25 Feb 2026 16:51:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: dmukhin@ford.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech, 
    julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, 
    sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 0/5] tools/tests: test harness fragment
In-Reply-To: <5b0be132-07f1-4d7b-92ac-2b1d9c4db408@suse.com>
Message-ID: <alpine.DEB.2.22.394.2602251648220.1536420@ubuntu-linux-20-04-desktop>
References: <20260213024952.3270112-1-dmukhin@ford.com> <5b0be132-07f1-4d7b-92ac-2b1d9c4db408@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4834919F9F4
X-Rspamd-Action: no action

On Tue, 17 Feb 2026, Jan Beulich wrote:
> On 13.02.2026 03:49, dmukhin@ford.com wrote:
> > This series introduces the use of a new common unit test fragment across
> > several existing unit tests.
> > 
> > Patch 1 contains assorted fixups for the domid Makefile.
> > Patch 2 adds a new fragment for auto-generating test harness dependencies.
> > Patch 3 adds some prerequisite changes for vPCI test (patch 4).
> > Patch 4 switches the vPCI unit test to the new common fragment.
> > Patch 5 switches the PDX unit test to the new common fragment.
> > 
> > [1] Link to v2: https://lore.kernel.org/xen-devel/20260111041145.553673-1-dmukhin@ford.com/
> > [2] CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2323352235
> > 
> > Denis Mukhin (5):
> >   tests: fixup domid make fragment
> >   tests: use unit test fragment in domid test
> >   xen/include: customize headers for host builds
> >   tests: use unit test fragment in vPCI test
> >   tests: use unit test fragment in PDX test
> 
> I remain unconvinced of this attempt to generalize things. Yes, it eliminates
> some redundancy, but at the same time some of the new constructs are harder
> to read / follow. Perhaps it would help if smaller pieces were abstracted out
> first / incrementally.

I don't think breaking it down further would help, it is already in
pretty small pieces. At least, I cannot think of a way that breaking it
down would make a difference. Do you have something specific in mind?

Also, I appreciate you being unconvinced about this series, but now it
leaves me in a bit of limbo. I am fine with this series going in --
should I continue reviewing it regardless?


