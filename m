Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FC0839C55
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 23:36:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670616.1043522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSPMc-0006Kn-GC; Tue, 23 Jan 2024 22:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670616.1043522; Tue, 23 Jan 2024 22:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSPMc-0006JE-Cx; Tue, 23 Jan 2024 22:35:26 +0000
Received: by outflank-mailman (input) for mailman id 670616;
 Tue, 23 Jan 2024 22:35:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yj1f=JB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rSPMb-0006J0-Lj
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 22:35:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1a4be37-ba3f-11ee-98f5-6d05b1d4d9a1;
 Tue, 23 Jan 2024 23:35:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 77D1561F7E;
 Tue, 23 Jan 2024 22:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A862C433F1;
 Tue, 23 Jan 2024 22:35:20 +0000 (UTC)
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
X-Inumbo-ID: b1a4be37-ba3f-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706049321;
	bh=KSrO2rZ+3ODRCauXR6xbnnuySM+RGFulujTdvDNhoVA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NVtMuyBPWUw2oVO9uvbxNX9vtW8Y0invMKxbaER5u3LCSNrQX1Zzz5ufVB0YoXo2g
	 Cm82Q0NEuBc1UYAm1CT32IrJW8/TZyNvUFYJrmhZCLkExm4uhWhhavNqIyTzQySq4X
	 Y25AZyYvgOjPnfkXiAjlLH+idcZ92bYUH/TV0t24s/mY8rI91suqsJQQvTxEkFO7eF
	 FBFG+VI3YedBm8taxjLjomKSTE0O0xr4Y2oZmnvwIZi93ZMjnM3R6KY8bmpIymkKTt
	 WzT7P9GhzytZcuypnsj7IMHRJRKtRBltEmccaK+KFj9UR+OeITdaqy72RJP3N5K+Eo
	 v/ix/ounpDrFw==
Date: Tue, 23 Jan 2024 14:35:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Kelly Choi <kelly.choi@cloud.com>, committers@xenproject.org, 
    advisory-board@lists.xenproject.org, xen-devel@lists.xenproject.org
Subject: Re: Community Process Group - Proposal
In-Reply-To: <ecddb385-fc87-412b-a956-0a08237cc120@suse.com>
Message-ID: <alpine.DEB.2.22.394.2401231435140.2287888@ubuntu-linux-20-04-desktop>
References: <CAO-mL=yvVWjnOHSFSqcrknoXOqk-N3JY76qObQnzftrkmsq6xw@mail.gmail.com> <5309e7d3-7b3c-4522-99dc-bbd7734aeb34@suse.com> <alpine.DEB.2.22.394.2401221434440.2287888@ubuntu-linux-20-04-desktop> <ecddb385-fc87-412b-a956-0a08237cc120@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Jan 2024, Jan Beulich wrote:
> On 22.01.2024 23:47, Stefano Stabellini wrote:
> > On Mon, 22 Jan 2024, Jan Beulich wrote:
> >> What definitely needs clarifying is what "review" is: Are R-b tags
> >> counted, or is it the number of replies sent commenting on patches?
> > 
> > Yes, I think this needs to be clarified. I would say Reviewed-by tags.
> 
> Which may end up unfair. It's not uncommon for one person to do a lot
> of review on a patch, and for someone else to then ack the final
> version that goes in. In the end this is then no different from basing
> the decision on simple numbers, without regard to actual (potentially
> heavily differing) effort behind each individual instance.

I had thought about the case you describe too. This is why it is stated
as "maintainers with >= 20 reviews in the last 2 releases". So it
requires for the person to also be a maintainer. The bar to become a
maintainer is already pretty high. Random individuals that subscribe to
xen-devel and start replying Reviewed-by to every patch would be
excluded.

On the other hand, it would not account for reviews done by
non-maintainers. However, non-maintainers are likely to be contributors
so they would probably fall within the other category.

