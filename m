Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC3159EE2E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 23:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392117.630273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQbOm-0002pO-KP; Tue, 23 Aug 2022 21:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392117.630273; Tue, 23 Aug 2022 21:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQbOm-0002mg-HA; Tue, 23 Aug 2022 21:25:24 +0000
Received: by outflank-mailman (input) for mailman id 392117;
 Tue, 23 Aug 2022 21:25:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M9ll=Y3=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1oQbOl-0002ma-CG
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 21:25:23 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [2001:470:1f07:15ff::f7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 176b0746-232a-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 23:25:21 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 27NLOXib058355
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 23 Aug 2022 17:24:39 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 27NLOXGr058354;
 Tue, 23 Aug 2022 14:24:33 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 176b0746-232a-11ed-bd2e-47488cf2e6aa
Date: Tue, 23 Aug 2022 14:24:33 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, george.dunlap@citrix.com,
        Bertrand.Marquis@arm.com,
        Stefano Stabellini <stefano.stabellini@amd.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "wl@xen.org" <wl@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>
Subject: Re: Removing "or later" from Xen license, Was: [PATCH v2 3/3] add
 SPDX to arch/arm/*.c
Message-ID: <YwVFkaN/OoOzSsCO@mattapan.m5p.com>
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
 <20220818220320.2538705-3-stefano.stabellini@amd.com>
 <61b01c8b-1f98-e559-f971-f081a25e0b93@xen.org>
 <alpine.DEB.2.22.394.2208191528050.3790@ubuntu-linux-20-04-desktop>
 <f235f6f8-d585-4e24-7fc8-3f2df9240c9d@xen.org>
 <AD1F6CD4-5679-4B2E-AA80-0DACD0F09709@arm.com>
 <d3c6c012-01fd-e4e6-9796-a8c19162c741@xen.org>
 <alpine.DEB.2.22.394.2208231140140.15247@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2208231140140.15247@ubuntu-linux-20-04-desktop>
X-Spam-Status: No, score=-0.0 required=10.0 tests=KHOP_HELO_FCRDNS,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Tue, Aug 23, 2022 at 11:53:50AM -0700, Stefano Stabellini wrote:
> I changed the subject to reflect the discussion and moved George to
> "to:" to get his attention.
> 
> Also, if we are going to make any chances as described below, I think
> they should be a separate series from the SPDX series.

Also gets a second look from others who may have an opinion on the topic.

I second what is after the comma.  Adding SPDX tags and changing files
from GPLv2+ to GPLv2-only are distinct tasks and should be kept separate.


> On Tue, 23 Aug 2022, Julien Grall wrote:
> > > > I am putting some thoughts below (they can be split in a separate thread
> > > > if you prefer).
> > > > 
> > > > This is not the first time this topic is brought up and probably not the
> > > > last as long as we have file using GPLv2+.
> > > > 
> > > > IIRC from past discussion there are two broads concern with GPLv2+:
> > > >   - We are leaving the choice of which license applies to the person
> > > > copying the code. So if a new version is released that is less favorable
> > > > to the initial contributor, then we have no leverage.
> > > >   - Some companies are rather cautious to contribute code that my be
> > > > licensed under GPLv3 (would be allowed with GPLv2+).
> > > > 
> > > > The later is particularly a problem because not many people realize that a
> > > > fair part of Xen on Arm is GPLv2+. I never really understood why we chose
> > > > that (this was before my time) but this got spread as the existing
> > > > copyright was added to a new file. Admittely, the contributor should be
> > > > more cautious. But I would not say this is trivial to spot the difference.
> > > > 
> > > > I would like to consider to re-license all the GPLv2+ files to GPLv2.
> > > > AFAIU, this would mean we would need to ask the permission for every
> > > > comapany that contributed to the file. Do you know if this was done before
> > > > in Xen Project?
> > > 
> > > If I am understanding right, GPLv2+ means that someone could relicense the
> > > files to GPLv3 if he wants which is more restrictive.
> > > Why do you want to move those back to GPLv2 ?
> > The main difference between GPLv2 and GPLv3 is the patent section. This has
> > caused some concerns in the past when a stakeholder want to contribute to Xen
> > Project.
> >
> > While looking through at previous discussion, I found the original discussion
> > [1] which contains a lot more details.
> 
> 
> I agree with Julien. Also, I don't think that having GPLv2-or-later on a
> few source files is of benefit to anyone (if Xen was GPLv2-or-later as a
> whole it would be a different discussion).

I disagree here.  Having GPLv2+ on a few files hints at the contributor
community's views, though one must exercise care.

Notably if 50% of contributors prefer GPLv2+ less than 10% of files are
likely to be marked GPLv2+.  The reason being GPLv3 didn't exist until
2006 and a single GPLv2-only contributor would cause shared files to be
stuck as GPLv2-only.

So there could be a majority who prefer GPLv2+, just too many existing
files are GPLv2-only.


> Moving from GPLv2-or-later to GPLv2-only is not a relicense. The "or
> later" statement is not part of the license itself. It would be limiting
> the choice of license to a subset of what is currently allowed: i.e.
> from [GPLv2,GPLv3] to [GPLv2]. I don't think we need approval from the
> original authors from that.
> 
> The original authors already stated: "my code can be either under GPLv2
> or GPLv3". Now we are only offering it under GPLv2. Users can still get
> the older version from a past Xen release under GPLv3 if they want to.
> 
> So I think we can drop "or later" any time as long as the maintainers
> agree.
> 
> George, do you agree with the above?

I'm not an expert, but this matches my understanding as a (near-trivial)
contributor.


I'm not a significant contrbutor, but let it be hereby known my portions
are available under GPLv2+.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



