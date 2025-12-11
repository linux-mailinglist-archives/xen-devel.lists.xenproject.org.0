Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B247CB6DB7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:05:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184499.1506927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTl2j-00055U-KB; Thu, 11 Dec 2025 18:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184499.1506927; Thu, 11 Dec 2025 18:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTl2j-00052F-H8; Thu, 11 Dec 2025 18:05:33 +0000
Received: by outflank-mailman (input) for mailman id 1184499;
 Thu, 11 Dec 2025 18:05:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3Jk=6R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vTl2i-0004Yg-JB
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:05:32 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa4b63f3-d6bb-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 19:05:30 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BBF5A43A4D;
 Thu, 11 Dec 2025 18:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BC0C4CEF7;
 Thu, 11 Dec 2025 18:05:27 +0000 (UTC)
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
X-Inumbo-ID: fa4b63f3-d6bb-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765476328;
	bh=m+m5ZNqlIfNpAbyoWh1Xb1n97kLwDoBXWIvl+GxIZ60=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XSrgyOapr7C4xF0mG+Xar2WZ7m8LSHZuAxEp4nIlcBRDVgvs203KUTS6PcheXdZcG
	 rMMjnxCmReyhlOTtp02Vf7S844QZcYe1tQL6tuxCd5KsbiwpfPYjBpSxAWCDde/8nW
	 qtqujEsJU5je2B5C8i9+RhaImFtxMPcXhPL71jMApbDrYuYdrbgfo7Ldpy7NaRh6s+
	 SY1hl0PfXyPLR1/VdyT/2WKncVODMjfvVSgXcMn46SdVl6sJ07ZkkyE3skPDX5hsnF
	 UrXcq36fDlIeJSHwd82BQWnDaPt4cCv4b+u2nflIQL0N6o+7ba+MmXiO+bubqctRTO
	 I8r9YVZjvMMxg==
Date: Thu, 11 Dec 2025 10:05:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] CI/eclair: Rename the eclair-* jobs to *-all and *-amd
In-Reply-To: <03bbb773-cc02-408f-a01d-bb7f2447e57b@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2512111005140.17367@ubuntu-linux-20-04-desktop>
References: <20251211161339.2296433-1-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2512110959140.17367@ubuntu-linux-20-04-desktop> <03bbb773-cc02-408f-a01d-bb7f2447e57b@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1279770711-1765476328=:17367"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1279770711-1765476328=:17367
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 11 Dec 2025, Andrew Cooper wrote:
> On 11/12/2025 5:59 pm, Stefano Stabellini wrote:
> > On Thu, 11 Dec 2025, Andrew Cooper wrote:
> >> The *-safety jobs are AMD's configuration specifically, and other
> >> configurations will likely be different.
> >>
> >> Give the un-suffixed job an *-all suffix to make it clearer what they're
> >> doing.
> >>
> >> No functional change.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > This is straightforward:
> >
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >
> > I like this and I think we should also rename eclair-x86_64:on-schedule
> > and eclair-ARM64:on-schedule for extra clarity. For instance:
> >
> > eclair-x86_64-allrules:on-schedule
> > eclair-ARM64-allrules:on-schedule
> >
> > It could be in this patch but also in a different patch.
> 
> Oh, that's easy enough to do.  I'll fold in.
> 
> Given allrules for that, do we want to make this allcode for clarity?

I am happy with that, good idea
--8323329-1279770711-1765476328=:17367--

