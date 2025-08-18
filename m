Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200C1B2B444
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 00:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086250.1444443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo8of-0006Nf-FZ; Mon, 18 Aug 2025 22:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086250.1444443; Mon, 18 Aug 2025 22:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo8of-0006Li-Cl; Mon, 18 Aug 2025 22:59:01 +0000
Received: by outflank-mailman (input) for mailman id 1086250;
 Mon, 18 Aug 2025 22:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEV0=26=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uo8oe-0006Lc-HN
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 22:59:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea2798c7-7c86-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 00:58:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E32DF5C5FBA;
 Mon, 18 Aug 2025 22:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66948C4CEEB;
 Mon, 18 Aug 2025 22:58:52 +0000 (UTC)
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
X-Inumbo-ID: ea2798c7-7c86-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755557933;
	bh=VKSa4rD1ftS7GKzMNosks2jfXJUiukfOvOE2jil13sE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hD67jX/65FQODlXx5NoQMzPFe5m4RR0BTVckxrsfVOXxHpRj6piZBXk7Ou8WAP1Xf
	 uXLsZem77KAofSugJbmNvWqpFDK55WH5gUn6ogTd4LJGvTvlEag11nsFFdUJYfbigu
	 DSYjOXBHWYWLAQ3hJGzAJbN9RaXolQ1eae7iQ5OxaD6Mq2J1tF8ZI6RmB74nsMeMTv
	 QEm8v0SQ1j9yzxfGwahgmC57rIE0VP7Zkuf/5SVrfHO1FplnHYXqYYc1JDfHdjEU+Q
	 gJUfFwxlTNrmKcgR3VtVkCxK/JNn9l+qwhXFk5wqVieuFDHk218p4hYN9dfOnQc1go
	 nQcdyTn/eIvWQ==
Date: Mon, 18 Aug 2025 15:58:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com, 
    roger.pau@citrix.com
Subject: Re: [PATCH] docs/sending-patches: add GitLab pipeline link
In-Reply-To: <9f5a77c1-ff99-40db-ae49-86e34cc1a391@xen.org>
Message-ID: <alpine.DEB.2.22.394.2508181550100.923618@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2508151310010.923618@ubuntu-linux-20-04-desktop> <9f5a77c1-ff99-40db-ae49-86e34cc1a391@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Aug 2025, Julien Grall wrote:
> Hi Stefano,
> 
> On 15/08/2025 21:12, Stefano Stabellini wrote:
> > When submitting patches to xen-devel, add a link to a successful
> > pipeline run.
> 
> Does this mean we have enough capacity to handle normal CI job + submission?

Yes, it should be OK, especially given that most regular contributors
already run CI jobs before submitting.


> Also, as we try to encourage people to use the gitlab CI. So we would probably
> also encourage them to write new tests because in a lot of cases we will add
> new code. So the pipeline is only going to confirm that we are regressing
> existing tests (which may be irrelevant to the subsystem modified).

Good point


> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > diff --git a/docs/process/sending-patches.pandoc
> > b/docs/process/sending-patches.pandoc
> > index 1991932b68..6e1401ea22 100644
> > --- a/docs/process/sending-patches.pandoc
> > +++ b/docs/process/sending-patches.pandoc
> > @@ -314,3 +314,23 @@ A patch should always be sent **to** the xen-devel
> > mailing list
> >   of all touched code areas should get a copy of the mail via **Cc**. In
> > case
> >   some other recipients are known to be interested in the patch, they can be
> >   added via **Cc**, too.
> > +
> > +## Testing
> > +
> > +Xen Project uses a GitLab-based CI infrastructure. You can request to
> > +have your GitLab account added to the Xen Project organization on GitLab
> > +(https://gitlab.com/xen-project) by reaching out to THE REST maintainers
> > +via xen-devel or Matrix. Once your account is added to the Xen Project
> > +organization on GitLab, also a personal Xen repository will be created
> > +for you under https://gitlab.com/xen-project/people/<your-username>/xen.
> > +You will be able to trigger a GitLab testing pipeline with a single git
> > +push to your personal Xen repository.
> 
> I think it would be worth mentioning that this should be based on a recent
> "master" (I would say less than two days old).

Good idea


> Also, can you clarify why we are asking the user to trigger the pipeline
> rather than having a both that will pick a series and test it?

I'll add an explanation


> > +
> > +When submitting a non-trivial patch or a non-trivial patch series,
> 
> This wording is ambiguous. But even trivial patch could result to regression.
> So I am not sure why we would want to exclude them. Can you clarify?

I'll take it out.


> > +please include a link to the successful GitLab pipeline run on your
> > +personal branch. This information can be added after the `---` line.
> >> +For example:
> > +
> > +    ---
> > +    Test CI pipeline:
> > +
> > https://gitlab.com/xen-project/people/your-username/xen/-/pipelines/1980129839
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

