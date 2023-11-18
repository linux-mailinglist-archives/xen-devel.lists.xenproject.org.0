Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD787EFD1D
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 03:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635476.991387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4AwN-0002H5-CT; Sat, 18 Nov 2023 02:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635476.991387; Sat, 18 Nov 2023 02:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4AwN-0002Dg-9X; Sat, 18 Nov 2023 02:20:11 +0000
Received: by outflank-mailman (input) for mailman id 635476;
 Sat, 18 Nov 2023 02:20:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+gg=G7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r4AwM-00016w-2b
 for xen-devel@lists.xenproject.org; Sat, 18 Nov 2023 02:20:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe2b36bc-85b8-11ee-98dc-6d05b1d4d9a1;
 Sat, 18 Nov 2023 03:20:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 79B3161DF4;
 Sat, 18 Nov 2023 02:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DCEC433C8;
 Sat, 18 Nov 2023 02:20:04 +0000 (UTC)
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
X-Inumbo-ID: fe2b36bc-85b8-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700274006;
	bh=j5Ws/t6Ta9eJejgOz4SewkwKk+0kbJcLvoqmWcbva18=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Lkh50obpp0E8QA22GpImRqqcAFmM2IJxPXPa8GYpsqYfl8qmtc5ZEaYFVdZ4bI4E+
	 Y/WtiOlaYpuRS+xifcR4EEwWF6I7wA9iJ7u0uu2jRHHo3GhXN8ZenOxV391Xf2/UGo
	 EYiRSVH4LBFYme11VFKqsbYicZ0RAAIPknWiCgIc3+ac9voBGEPD9yW16ZPZk4HQLK
	 FFW/bg4P6NG2yq4LEjNOVMzfGw+8eqmDLA50CUB+74mM0kO6bqTleqKTiUmnW3Vgx0
	 m6hzhUCb2n8F2cvUU9DGB8toyy5wi0SdcqQowRbkdgE1q8nvx4bvmb2HZky1grzut4
	 /bR+WqNkkmT1A==
Date: Fri, 17 Nov 2023 18:20:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen/include: add macro
 ISOLATE_LOW_BIT
In-Reply-To: <8a1313b3ab5ba6dd556cf37409e3b703@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311171804590.773207@ubuntu-linux-20-04-desktop>
References: <cover.1698410970.git.nicola.vetrini@bugseng.com> <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com> <f88edc35-6b1b-0136-aa1f-6429652c4016@suse.com> <alpine.DEB.2.22.394.2310301536390.1625118@ubuntu-linux-20-04-desktop>
 <7c26fb70-6a8c-58a3-6a1d-300dd57b5827@suse.com> <817fab34432c854ce585aba80db77f7c@bugseng.com> <8b4e0da82930375b2a95387a9031c73f@bugseng.com> <1178b79c-d6a3-a46c-5556-3fb5964dc051@suse.com> <392566d1-109b-413c-b904-0e4cb4007263@suse.com>
 <6b6f051130b724ee6a813235e049354c@bugseng.com> <7cbf6f0f-d5b1-44e2-9a0e-a9d7d353eb6b@suse.com> <alpine.DEB.2.22.394.2311161635200.773207@ubuntu-linux-20-04-desktop> <b5277391-71bb-42b6-82e4-635dd1361ad3@suse.com>
 <8a1313b3ab5ba6dd556cf37409e3b703@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Nov 2023, Nicola Vetrini wrote:
> Hi Jan,
> 
> > > > > > While I've committed this patch (hoping that I got the necessary
> > > > > > context
> > > > > > adjustment right for the
> > > > > > automation/eclair_analysis/ECLAIR/deviations.ecl
> > > > > > change), I'd like to come back to this before going further with
> > > > > > users
> > > > > > of
> > > > > > the new macro: I still think we ought to try to get to the single
> > > > > > evaluation wherever possible. The macro would then be used only in
> > > > > > cases
> > > > > > where the alternative construct (perhaps an isolate_lsb() macro,
> > > > > > living
> > > > > > perhaps in xen/bitops.h) cannot be used. ISOLATE_LSB() would then
> > > > > > want
> > > > > > to
> > > > > > gain a comment directing people to the "better" sibling. Thoughts?
> > > > > 
> > > > > Having the users in place would help me estimate the remaining work
> > > > > that
> > > > > needs to be done on this rule and see if my local counts match up with
> > > > > the counts in staging.
> > > > 
> > > > By "having the users in place", you mean you want other patches in this
> > > > and the dependent series to be committed as-is (except for the name
> > > > change)? That's what I'd like to avoid, as it would mean touching all
> > > > those use sites again where the proposed isolate_lsb() could be used
> > > > instead. I'd rather see all use sites be put into their final shape
> > > > right away.
> > > 
> > > This request is coming a bit late and also after all the patches have
> > > been reviewed already. I for one am not looking forward to review them
> > > again.
> > > 
> > > That said, if you could be more specified maybe it could become
> > > actionable:
> > > 
> > > - do you have a pseudo code implementation of the "better" macro you
> > >   would like to propose?
> > 
> > May I remind you that I made this request (including a draft implementation)
> > before already, and Nicola then merely found that the evaluate-once form
> > simply cannot be used everywhere? Anybody could have thought of the option
> > of "splitting" the macro. After all I hope that there is no disagreement on
> > macro arguments better being evaluated just once, whenever possible.
> > 
> > > - do you have an list of call sites you would like to be changed to use
> > >   the "better" macro?
> > 
> > No, I don't have a list. But the pattern is pretty clear: The "better" form
> > ought to be used wherever it actually can be used.
> > 
> > > Also, you might remember past discussions about time spent making
> > > changes yourself vs. others doing the same. This is one of those cases
> > > that it would be faster for you to make the change and send a patch than
> > > explaining someone else how to do it, then review the result (and
> > > review it again as it probably won't be exactly as you asked the first
> > > time.)
> > > 
> > > If you don't want the call sites to be changes twice, may I suggest you
> > > provide a patch on top of Nicola's series, I review and ack your patch,
> > > and Nicola or I rebase & resend the series so that the call sites are
> > > only changes once as you would like? I think that's going to be way
> > > faster.
> > 
> > I'll see if I can find time to do so. I don't normally work on top of
> > other people's uncommitted patches, though ... So I may also choose to go
> > a slightly different route. (You realize though that all still pending
> > patches using the new macro need touching again anyway, don't you?)
> > 
> > Jan
> 
> Then perhaps it's best if I give it a try at doing the single evaluation
> macro, so that I can make a series modifying the call sites only once on top
> of that and send everything in one go. Before doing that, though, I'll make a
> thread where various aspects that are not so clear yet can be discussed, so
> that we can devise a robust solution (also to dig this out of this deep
> thread).

In the meantime I committed patches from #5 onward as they don't depend
on ISOLATE_LSB

