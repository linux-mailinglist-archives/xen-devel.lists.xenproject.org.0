Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE35837682
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 23:48:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670216.1042801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rS35G-000423-3l; Mon, 22 Jan 2024 22:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670216.1042801; Mon, 22 Jan 2024 22:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rS35G-000404-16; Mon, 22 Jan 2024 22:48:02 +0000
Received: by outflank-mailman (input) for mailman id 670216;
 Mon, 22 Jan 2024 22:48:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=94D3=JA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rS35E-0003z6-9C
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 22:48:00 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4792ded0-b978-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 23:47:56 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7084ECE2B6D;
 Mon, 22 Jan 2024 22:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016FEC43390;
 Mon, 22 Jan 2024 22:47:49 +0000 (UTC)
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
X-Inumbo-ID: 4792ded0-b978-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705963670;
	bh=VmK+3y7dwKhhngQRRtVEzYsN0JFlJcij5RpzL4YRllw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X5id4WE/iE7OPLSx6NnW+juOLwma81m1jAgvFbv4bNzDdjcE77UeHmlbJq9PWsgAt
	 PZ/TpeW4Rh84DyUilvr4n4CxRuAkvWVE+v1jrcs2FRQoJp0NvNrgxL3QqoE+KFK+FC
	 95QLWPf3Emq98o6iZsBLuca87ctag8bEZFRVwXDPN3BSnHBHUArB6Hwi3U1OXWr1Lw
	 ZEWdtjsI2vwnC/AxDVUiNm2KRB04xy+gVAboNFWuWJXtFX3AsBoiOVVmvgtqWJTInz
	 pB62vmSWWVFw8lfb6plvWmHNozWV2RrsW/HmUbv/Gl3vcckSFcgsVqPnQYtJWfQ40S
	 wvzZeVf+5UVXg==
Date: Mon, 22 Jan 2024 14:47:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Kelly Choi <kelly.choi@cloud.com>, committers@xenproject.org, 
    advisory-board@lists.xenproject.org, xen-devel@lists.xenproject.org
Subject: Re: Community Process Group - Proposal
In-Reply-To: <5309e7d3-7b3c-4522-99dc-bbd7734aeb34@suse.com>
Message-ID: <alpine.DEB.2.22.394.2401221434440.2287888@ubuntu-linux-20-04-desktop>
References: <CAO-mL=yvVWjnOHSFSqcrknoXOqk-N3JY76qObQnzftrkmsq6xw@mail.gmail.com> <5309e7d3-7b3c-4522-99dc-bbd7734aeb34@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I am only addressing a couple of Jan's points below.


On Mon, 22 Jan 2024, Jan Beulich wrote:
> > A CPG will be your second point of call, where you can escalate matters
> > quickly for a democratic solution.
> 
> Between informal voting and this "second point of call", where does
> formal voting go?

Formal voting is still available as "third point of call" after informal
voting and CPG.


> > *How are members selected?*
> > The CPG will be composed of 5 randomly selected members in total.
> > An odd number has been purposely selected to avoid an impasse during
> > decisions.
> > 
> > The criteria:
> > Individual members must be active contributors and are willing to help the
> > community succeed. As such they must be a part of the following groups:
> > 
> >    - Committers
> >    - Active Maintainers: maintainers with >= 20 reviews in the last 2
> >    releases
> >    - Active Contributors: contributors with >= 10 commits in the last 2
> >    releases
> 
> I'm afraid I can't leave this uncommented, as matching a common pattern
> I'm generally unhappy with. Whatever the numbers you select in such
> criteria, they'll open up an easy road for faking. At the same time it
> of course is difficult to come up with any non-numeric or not-only-
> numeric criteria. For example, I'd be heavily inclined to ask that
> "non-trivial" be added to both of the numbers. Yet then there arises a
> judgement issue: What's non-trivial can be entirely different
> depending on who you ask.

I share your observations and thoughts on the matter. I understand and
share your thinking about adding "non-trivial" but then it is becomes a
judgment call, as you wrote. I think it would be best if the criteria
doesn't require human judgment.


> What definitely needs clarifying is what "review" is: Are R-b tags
> counted, or is it the number of replies sent commenting on patches?

Yes, I think this needs to be clarified. I would say Reviewed-by tags.

