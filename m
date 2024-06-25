Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F589915AE4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:15:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746982.1154224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLtp7-0008GA-4V; Tue, 25 Jun 2024 00:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746982.1154224; Tue, 25 Jun 2024 00:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLtp7-0008Df-0J; Tue, 25 Jun 2024 00:14:13 +0000
Received: by outflank-mailman (input) for mailman id 746982;
 Tue, 25 Jun 2024 00:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLtp4-0008DX-Mm
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:14:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d69432ca-3287-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 02:14:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BB85960D41;
 Tue, 25 Jun 2024 00:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5A6C2BBFC;
 Tue, 25 Jun 2024 00:14:04 +0000 (UTC)
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
X-Inumbo-ID: d69432ca-3287-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719274446;
	bh=x1S8/W+lSKFYXLCDtqOh1NiNE2MIjJ7t0qeYWc+LDMY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gd6wiDJmgq0myljXjR2cmiyDWaQfjNrEWuN/2/jsKlpCneXgFgUh3W7sj6kO2/G8J
	 DQolZFKYmjsKbAV873SSWoYTOrr1gzrgucbVlAUCVpGSnu4+XLAba/Y0qS8jvifEez
	 pLoElSteccKj6NgdGvuPExSJ113UqaVVzWcPgmJk7hFVJGrU4gvkyLLXrfU8d/f2mM
	 yq8Uj+0A4Z9M2m6dqXu3wnjAKdV48UpAP8rRLP6A/sFU+gP/9KH0mYvmKtDI4XUxPY
	 wEaEfmk2X1bYsAjyvb/C1fswvNopd6CkFC64aBL7Z+z7Le43IY+sCURbuwAQTemLcI
	 IpEKUPWHSIcbg==
Date: Mon, 24 Jun 2024 17:14:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v2] xen: add explicit comment to identify notifier
 patterns
In-Reply-To: <917533b5-b79c-4e97-917d-9684993bf423@xen.org>
Message-ID: <alpine.DEB.2.22.394.2406241651400.3870429@ubuntu-linux-20-04-desktop>
References: <d814434bf73e341f5d35836fa7063a728f7b7de4.1718788908.git.federico.serafini@bugseng.com> <f7d46c15-ff85-4a6f-afd7-df18649726c8@xen.org> <2072bf59-f125-4789-be77-40ed3641aec4@bugseng.com> <alpine.DEB.2.22.394.2406201811200.2572888@ubuntu-linux-20-04-desktop>
 <bce5eae2-973d-4d69-bee1-09f9f09dd011@bugseng.com> <alpine.DEB.2.22.394.2406211529130.2572888@ubuntu-linux-20-04-desktop> <917533b5-b79c-4e97-917d-9684993bf423@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Jun 2024, Julien Grall wrote:
> On 21/06/2024 23:34, Stefano Stabellini wrote:
> > > > > Yes, I also think this could be an opportunity to check the pattern
> > > > > but no one has yet been identified to do this.
> > > > 
> > > > I don't think I understand Julien's question and/or your answer.
> > > > 
> > > > Is the question whether someone has done an analysis to make sure this
> > > > patch covers all notifier patters in the xen codebase?
> > > 
> > > I think Jan and Julien's concerns are about the fact that my patch
> > > takes for granted that all the switch statements are doing the right
> > > thing: someone should investigate the notifier patterns to confirm that
> > > their are handling the different cases correctly.
> > 
> > That's really difficult to do, even for the maintainers of the code in
> > question.
> Sure it will require some work, but as any violation. However, I thought the
> whole point of MISRA is to improve the safety and our code base in general?
> 
> AFAIU, we already have some doubt that some notifiers are correct. So to me it
> seems wrong to add a comment because while this silence MISRA, this doesn't
> solve it in the true spirit.
> 
> > 
> > And by not taking this patch we are exposing ourselves to more safety
> > risks because we cannot make R16.4 blocking.
> > 
> > 
> > > > If so, I expect that you have done an analysis simply by basing this
> > > > patch on the 16.4 violations reported by ECLAIR?
> > > 
> > > The previous version of the patch was based only on the reports of
> > > ECLAIR but Jan said "you left out some patterns, why?".
> > > 
> > > So, this version of the patch adds the comment for all the notifier
> > > patterns I found using git grep "struct notifier_block \*"
> > > (a superset of the ones reported by ECLAIR because some of them are in
> > > files excluded from the analysis or deviated).
> > 
> > I think this patch is a step in the right direction. It doesn't prevent
> > anyone in the community from making expert evaluations on whether the
> > pattern is implemented correctly.
> 
> I am not sure I am reading this correctly. To me you are saying that for your
> MISRA, adding the default case is fine even if we believe some notifiers are
> incorrect. Did I understand right?
> 
> If so it does seems odd because this is really not solving the violation. You
> are just putting a smoke screen in front in the hope that there are no big
> issue in the code...
> 
> > 
> > Honestly, I don't see another way to make progress on this, except for
> > maybe deviating project-wide "struct notifier_block". But that's
> > conceptually the same thing as this patch.
> 
> I still don't quite understand why you are so eager to hide violation just
> that you can progress faster on other bits.
> 
> I personally cannot put my name on a patch where the goal is to add a comment
> that no-one verified that it was actually true. (i.e. all the cases we care
> are handled). In particular in the Arm code, because IIRC we already
> identified issues in the past in the notifier.
> 
> I think it wouild be worth discussing the approach again in the next MISRA
> meeting.

Yes, good idea, we can discuss tomorrow. I'll write down my thinking
about 16.4 here in the meantime to address your question and hopefully
we can align on the approach to take tomorrow.

As you might remember I supported 16.4 and I was keen on having it in
rules.rst because I believe that this rules makes the code better.

16.4 is about ensuring that every switch that is supposed to handle all
possible parameters, actually handle all possible parameters. It is also
about having a default label so that we can handle unexpected parameters
especially in case of integers parameters. (In case of enums we can
check at compile time that we handle all possible parameters even
without a default label.)

In Xen, some switches are expected to handle all possible parameters,
but some of them are not. Specifically the "notifier pattern" switches
are by design not expected to handle all possible parameters. Of course
it can be that some of them have to, but the design of the "notifier
pattern" is that you can handle only the subset you care about, and you
don't need to care about all of the possible parameters.

ECLAIR or gcc cannot help us there. Most of these instances don't want
to handle all parameters. We have to remove the violations from the
scan, either by deviation or by adding a default label. Otherwise the
notifier pattern stops us from making more progress.

There are lots of other switches that are not part of the notifier
pattern and are required to handle all possible parameters. I would like
to make sure we enable the checks for these other switches where ECLAIR
and gcc can actually help immediately.

I do realize that some of the notifier pattern switches might want to
handle all parameters but Bugseng or anyone else looking for simple
improvements are not in the position to tell which ones they are. We
need to wait for a maintainer or expert in the specific code to spot
them. It is not a good idea to cause a delay in handling all the
remaining 16.4 more interesting switches (which is also easy) to better
handle the notifier pattern (which is hard).

The notifier pattern can be looked at separately later by the relevant
maintainer / interested community members by sending case-by-case
improvements. They cannot be mechanically resolved. My understanding is
that with this patch series committed we would be close to zero
violations for 16.4.


