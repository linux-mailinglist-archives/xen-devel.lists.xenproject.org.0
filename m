Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAA38225B2
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 00:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660876.1030542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKoUJ-0007PV-BQ; Tue, 02 Jan 2024 23:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660876.1030542; Tue, 02 Jan 2024 23:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKoUJ-0007N0-8J; Tue, 02 Jan 2024 23:47:59 +0000
Received: by outflank-mailman (input) for mailman id 660876;
 Tue, 02 Jan 2024 23:47:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mnqv=IM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rKoUH-0007Mu-Bg
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 23:47:57 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5817430f-a9c9-11ee-98ef-6d05b1d4d9a1;
 Wed, 03 Jan 2024 00:47:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 00D5ACE11E7;
 Tue,  2 Jan 2024 23:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F7FC433C8;
 Tue,  2 Jan 2024 23:47:45 +0000 (UTC)
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
X-Inumbo-ID: 5817430f-a9c9-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704239267;
	bh=tmqDTWj2+RT5cFcRkWtyllUV3Y62nDZA8cHigj/xZWU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qdwIv682H9p+qomQTdDftwB7MZPJNkfRu6ONHjZNfF1r5J1yKkkw3PFxZlo0avyvo
	 Ikmup41d2HJIdR3PD2YYCdr2DDlgYI+ddQhjZIISthwZL2fqgeYuwDpR+x5tGgZ+EF
	 BivSvgDKg0XhRI8toVCdGlvxcF7AqKg3GQfbdAJuP6q8Nib4iyocvcSURunXPsqglH
	 ajbp2Z4ZLOBaToGbOXYjUXK1OGBXsAJOoG3qbBdaYdVPIybd9R4mhwoXPNKWE/ID+t
	 XO0sPcWqtWon/XX69jmMI/EmFGSHQTn3MdbJg9fcOukcktP3shnlqCttLhGH56nRuY
	 R9hR46+TEXLoA==
Date: Tue, 2 Jan 2024 15:47:44 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <Luca.Fancellu@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <Michal.Orzel@amd.com>, Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    George Dunlap <george.dunlap@cloud.com>
Subject: Re: Clang-format configuration discussion - pt 2
In-Reply-To: <52f25f40-ab42-4845-9912-81ce92cc4de6@xen.org>
Message-ID: <alpine.DEB.2.22.394.2401021544050.1322202@ubuntu-linux-20-04-desktop>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com> <2E778E49-C2F5-421F-9598-CED15E7D4284@arm.com> <827e24a2-0ecd-48c4-becb-12129c4208dc@suse.com> <CA+zSX=b77av9rHwWHsRD8MAnprfXQiotUPPPKFDOU9cTOA2OzA@mail.gmail.com> <4ce995a3-78a1-49e5-881d-d6af10514673@xen.org>
 <b71c4e81-7026-40b2-ad76-ea4de5bbf6b3@suse.com> <52f25f40-ab42-4845-9912-81ce92cc4de6@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Julien Grall wrote:
> > > > Most modern languages, including golang (and I think rust) have
> > > > built-in style correctors (`go fmt` is go's official one).  If you
> > > > haven't worked with an automatic style checker / fixer, you don't know
> > > > how much time, hassle, and emotional energy you're saving.  I don't
> > > > think I know anyone who, after using one, wants to go back to not
> > > > using one any more.
> > > > 
> > > > In general, I'm in favor of making changes to our style such that we
> > > > can make clang's style checker official.  The only reason I would vote
> > > > against it is if one of the style requirements was really intolerable;
> > > > but I find that pretty unlikely.
> > > 
> > > +1

+1


> > > > And as I've said before, the main reservation I have going forward
> > > > with this discussion is that I can't see clearly what it is that I'm
> > > > agreeing to.
> > > 
> > > +1

+1


> > > I found the way we dealt with MISRA rules quite helpful. We had a weekly
> > > meeting to discuss some of the rules and then the outcome was posted on
> > > the ML. Maybe we should do the same here? Any other suggestion how to
> > > move?
> > 
> > I have mixed feelings with meetings like the Misra ones. That's probably
> > unavoidable because of it being a goal to move fast. I'm not sure the
> > same applies here. 
> 
> I think in this situation is less about moving fast but more about making a
> closure of the 3 years+ discussion about the coding style.

Exactly. The meeting is useful to find alignment in a more fruitful way.

We don't have many MISRA rules left to discuss anyway. We could discuss
the codestyle changes after MISRA or in parallel.


> We had several persons (including maintainers) expressing there frustration
> about the coding style [1]. And this is not really going better...
> 
> We have a couple of solutions:
>   1. Properly codify our coding style
>   2. Pick an existing one close enough to Xen
> 
> The first one would require the less change in Xen but given nobody really
> agree on changes to CODING_STYLE, I feer it is going to take a very long time
> to retrofit. From the discussion here, it also seems like we will not be able
> to get the automatic checker doing what we want.
> 
> For the second one, this may have an impact on Xen. But it would help to use
> an automatic checker. I also don't expect many contributors been able to sink
> a lot of time trying to come to a conclusion with the coding style. So I would
> chose the least path of resistance which is 2. I believe this is what Luca is
> attempting.

I also think we need an automatic checker and 2. seems like the best way
forward.

