Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A77B2878
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 00:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610056.949288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlzYW-000192-43; Thu, 28 Sep 2023 22:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610056.949288; Thu, 28 Sep 2023 22:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlzYW-00016Q-18; Thu, 28 Sep 2023 22:32:24 +0000
Received: by outflank-mailman (input) for mailman id 610056;
 Thu, 28 Sep 2023 22:32:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjmF=FM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlzYV-00016K-7z
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 22:32:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e34e47d1-5e4e-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 00:32:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8892161D9E;
 Thu, 28 Sep 2023 22:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C191C433C7;
 Thu, 28 Sep 2023 22:32:18 +0000 (UTC)
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
X-Inumbo-ID: e34e47d1-5e4e-11ee-878b-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695940340;
	bh=dBuXBy3TylXN/QVUSxaztn4EmidT8l7aSHCf1BqAKJc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XelxxT0KdZubwcdvmjDv5Z6XJ0NyiZvsQFt2wMa0en+vD9eyGJ1zwulnJGH95tDAU
	 FaFRLBOAqGkeEarvJuamVAKIvyb2rilkTa2JeOZyeeyk2aMzUNVVDeTu8f4eoeI/hu
	 eQzlf3RcpOGp8Gz93RCP6rVrVBZOlT9KGkRexP6VC9ZacxY2AdoAQZ13lRwSjH47jG
	 bIuQjKOivBGFBLd+4+oJ4n+fjDXVpzfuV1zHXAFVrvQcV1oqaLgcOHHyRaPCEPOW1y
	 ZPIAIJTmtP8dBkIO7PxdNxQq8qHj5ul6eDrTG+Y1yWt+Vn3sg9RBUXNXIcASsfDOEI
	 2y1PCvkPG8WzQ==
Date: Thu, 28 Sep 2023 15:32:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v2 1/3] docs/misra: add documentation skeleton for
 MISRA C:2012 Dir 4.1
In-Reply-To: <3bf90dc627f6cd68dcd535461cbbdf32@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309281527070.1996340@ubuntu-linux-20-04-desktop>
References: <cover.1695801813.git.nicola.vetrini@bugseng.com> <5bb4dea2f48d0ef9a48a06c1b11c0dfcbd991aaf.1695801813.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2309271750130.1996340@ubuntu-linux-20-04-desktop>
 <3bf90dc627f6cd68dcd535461cbbdf32@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Sep 2023, Nicola Vetrini wrote:
> On 28/09/2023 02:55, Stefano Stabellini wrote:
> > On Wed, 27 Sep 2023, Nicola Vetrini wrote:
> > > The aforementioned directive requires the project to supply documentation
> > > on the measures taken towards the minimization of run-time failures.
> 
> > > +
> > > +Documentation for MISRA C:2012 Dir 4.1: mistyped access to function
> > > +___________________________________________________________________
> > > +
> > > +The code never uses function pointers.
> > 
> > You missed my previous comment on this one
> > 
> 
> You're right.
> This is about the usage of a function having a certain signature as having
> another.
> It could happen for instance:
> - with incongruent declarations
> - no prototypes
> - casts on function pointers
> Most of these can be caught by complying with other rules, but I'm not sure if
> they
> fully cover every case, and besides there are still violations on the rules
> tied to this.
> I guess we can say that this is a WIP.

We do want to follow these guidelines and like you wrote they are
covered by other MISRA rules that we have adopted and we are already
scanning for (or planning to) using ECLAIR. I think we should highlight
that, especially we have done a lot of work on incongruent declarations
and missing prototypes.


> > > +
> > > +Documentation for MISRA C:2012 Dir 4.1: invariant violation
> > > +___________________________________________________________
> > > +
> > > +To be written.
> > 
> > Also this one escaped.
> > 
> > Overall, this is much better!
> > 
> 
> I replied on v1, but maybe I missed some further reply:
> It's the violation of a project invariant (e.g., an assert or BUILD_BUG).
> Something along the lines of this could fit in the documentation:
> "The extensive checks in the code ensure that any violation of a
> compile-time invariant will be detected in prior to release builds, and
> failure
> of run-time invariant is also extensively tested."

We can also add the number of invariants is drastically reduced in
release builds.

