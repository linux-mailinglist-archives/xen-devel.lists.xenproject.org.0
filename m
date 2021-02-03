Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569F930E162
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 18:48:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81014.148894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7MGO-0001vo-9f; Wed, 03 Feb 2021 17:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81014.148894; Wed, 03 Feb 2021 17:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7MGO-0001vP-6H; Wed, 03 Feb 2021 17:48:24 +0000
Received: by outflank-mailman (input) for mailman id 81014;
 Wed, 03 Feb 2021 17:48:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3m8k=HF=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l7MGN-0001vJ-7S
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:48:23 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c29c372e-45da-405d-82a1-ec7707f27b3d;
 Wed, 03 Feb 2021 17:48:20 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 113HmJS3022557;
 Wed, 3 Feb 2021 18:48:19 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id B8330281D; Wed,  3 Feb 2021 18:48:18 +0100 (CET)
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
X-Inumbo-ID: c29c372e-45da-405d-82a1-ec7707f27b3d
Date: Wed, 3 Feb 2021 18:48:11 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
        Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xenstored: close socket connections on error
Message-ID: <20210203174811.GB192@antioche.eu.org>
References: <20210203165421.1550-1-bouyer@netbsd.org>
 <20210203165421.1550-2-bouyer@netbsd.org>
 <24602.56402.42441.687037@mariner.uk.xensource.com>
 <24602.57267.471477.281218@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24602.57267.471477.281218@mariner.uk.xensource.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Wed, 03 Feb 2021 18:48:19 +0100 (MET)

On Wed, Feb 03, 2021 at 05:38:59PM +0000, Ian Jackson wrote:
> > [...]
> > broken on Linux too ?
> 
> Andy pointed me to the recent thread "xenstored file descriptor leak"
> which answers all these questions.  I think it would have been nice if
> some tools maintainer(s) had been CC'd on that :-).

I did use add_maintainers.pl against it (or at last it was my intent)

> 
> Juergen, I guess I will get a formal R-b from you ?
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> 
> Manuel, in response to this:
> 
> > When I started, I looked at the wiki for instructions about
> > patches, but didn't find any ...
> 
> Earlier I offered you help with git, in private email.  I agree that
> git is confusing and sometimes impenetrable.  But it seems that what
> you are doing now is worse!  Please take me up on my offer of help.

I didn't forget. It's just that I don't even know what to ask to start
with.  It seems that StGit will help a lot though.

> 
> Our wiki doesn't give instructions on how to use git to maintain a
> patch series.  Those instructions would not be Xen-specific.  Perhaps
> we could have a pointer or two, but everyone has their own pet methods
> and tooling so the result would perhaps be more confusing than
> helpful.

a howto is alwaus helpfull. Even if it's not the one and only way
to do, at last it gives a start point.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

