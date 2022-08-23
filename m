Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0147A59EB81
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 20:54:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392085.630226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQZ2E-0002Ae-R7; Tue, 23 Aug 2022 18:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392085.630226; Tue, 23 Aug 2022 18:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQZ2E-000287-O6; Tue, 23 Aug 2022 18:53:58 +0000
Received: by outflank-mailman (input) for mailman id 392085;
 Tue, 23 Aug 2022 18:53:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjr1=Y3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oQZ2C-00027x-Ne
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 18:53:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef4574f8-2314-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 20:53:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6BE156171D;
 Tue, 23 Aug 2022 18:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745EBC433D6;
 Tue, 23 Aug 2022 18:53:51 +0000 (UTC)
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
X-Inumbo-ID: ef4574f8-2314-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661280832;
	bh=h0ApSOlsf9T9zKu6ZTiXCxB2rqa+j0wYTLBQPs8yc1E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=L4paQS+QQ7raXDVXoyTKZpCiLDVw9nkYsrSoSlBx6TS/nJabgMqwZ9teIxe8yIjon
	 PLuWD50qSEa0mF6VnhJRjONjE2pysIPZp2+9aeysDpkuoXWrzqww4F3o20JKgHLlnW
	 x34Xw9cKgdp9wE8iU5ykfmcvW1XuOUnF3A3L5Rz/zweOsdqILMDWbslQNJAmtVHXHg
	 g2CPAd2KYVjQLWHkjOlCWOs7JqZx5modp9BiKkYxCiSZxHlXzRyeXgzCjXg2fekJkF
	 Kg7wZjTobE4UynrHg6j0kw32Dn5xqEDDxlVgDJ61X+IkyA9Q85IFoqqLHdGGKHqFA+
	 Eh6BjEOGF/QeA==
Date: Tue, 23 Aug 2022 11:53:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>, george.dunlap@citrix.com, 
    Bertrand.Marquis@arm.com
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "wl@xen.org" <wl@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>
Subject: Removing "or later" from Xen license, Was: [PATCH v2 3/3] add SPDX
 to arch/arm/*.c
In-Reply-To: <d3c6c012-01fd-e4e6-9796-a8c19162c741@xen.org>
Message-ID: <alpine.DEB.2.22.394.2208231140140.15247@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop> <20220818220320.2538705-3-stefano.stabellini@amd.com> <61b01c8b-1f98-e559-f971-f081a25e0b93@xen.org> <alpine.DEB.2.22.394.2208191528050.3790@ubuntu-linux-20-04-desktop>
 <f235f6f8-d585-4e24-7fc8-3f2df9240c9d@xen.org> <AD1F6CD4-5679-4B2E-AA80-0DACD0F09709@arm.com> <d3c6c012-01fd-e4e6-9796-a8c19162c741@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

I changed the subject to reflect the discussion and moved George to
"to:" to get his attention.

Also, if we are going to make any chances as described below, I think
they should be a separate series from the SPDX series.


On Tue, 23 Aug 2022, Julien Grall wrote:
> > > I am putting some thoughts below (they can be split in a separate thread
> > > if you prefer).
> > > 
> > > This is not the first time this topic is brought up and probably not the
> > > last as long as we have file using GPLv2+.
> > > 
> > > IIRC from past discussion there are two broads concern with GPLv2+:
> > >   - We are leaving the choice of which license applies to the person
> > > copying the code. So if a new version is released that is less favorable
> > > to the initial contributor, then we have no leverage.
> > >   - Some companies are rather cautious to contribute code that my be
> > > licensed under GPLv3 (would be allowed with GPLv2+).
> > > 
> > > The later is particularly a problem because not many people realize that a
> > > fair part of Xen on Arm is GPLv2+. I never really understood why we chose
> > > that (this was before my time) but this got spread as the existing
> > > copyright was added to a new file. Admittely, the contributor should be
> > > more cautious. But I would not say this is trivial to spot the difference.
> > > 
> > > I would like to consider to re-license all the GPLv2+ files to GPLv2.
> > > AFAIU, this would mean we would need to ask the permission for every
> > > comapany that contributed to the file. Do you know if this was done before
> > > in Xen Project?
> > 
> > If I am understanding right, GPLv2+ means that someone could relicense the
> > files to GPLv3 if he wants which is more restrictive.
> > Why do you want to move those back to GPLv2 ?
> The main difference between GPLv2 and GPLv3 is the patent section. This has
> caused some concerns in the past when a stakeholder want to contribute to Xen
> Project.
>
> While looking through at previous discussion, I found the original discussion
> [1] which contains a lot more details.


I agree with Julien. Also, I don't think that having GPLv2-or-later on a
few source files is of benefit to anyone (if Xen was GPLv2-or-later as a
whole it would be a different discussion).

Moving from GPLv2-or-later to GPLv2-only is not a relicense. The "or
later" statement is not part of the license itself. It would be limiting
the choice of license to a subset of what is currently allowed: i.e.
from [GPLv2,GPLv3] to [GPLv2]. I don't think we need approval from the
original authors from that.

The original authors already stated: "my code can be either under GPLv2
or GPLv3". Now we are only offering it under GPLv2. Users can still get
the older version from a past Xen release under GPLv3 if they want to.

So I think we can drop "or later" any time as long as the maintainers
agree.

George, do you agree with the above?

