Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08C7853D87
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 22:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680149.1058050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra0bo-0000W9-Ox; Tue, 13 Feb 2024 21:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680149.1058050; Tue, 13 Feb 2024 21:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra0bo-0000Ud-MQ; Tue, 13 Feb 2024 21:46:32 +0000
Received: by outflank-mailman (input) for mailman id 680149;
 Tue, 13 Feb 2024 21:46:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mM3Z=JW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ra0bn-0000UX-6d
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 21:46:31 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5688b718-cab9-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 22:46:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 66644CE1F39;
 Tue, 13 Feb 2024 21:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACBEC433C7;
 Tue, 13 Feb 2024 21:46:20 +0000 (UTC)
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
X-Inumbo-ID: 5688b718-cab9-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707860781;
	bh=vz6VjlFd/DQuexXekHi8OgvwCROKnOnDwpEmjiujEE0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oyZPWs4CXxvrr9ci/9ubQzd+kJ4ekY6ty6C4tg5xs2fJ+OAmVcYdRgObFjEFLiD5O
	 S0d+yYw0iRdMu4caFbhnTQWRutzWENAXr14xkYEtLo7CQ2XMjhlcGbeXwdID6ruO0p
	 y7OzI7sImuGiraxflnpDuhHC8mrc372IlK9hM4osE9/Bm1eHmqt/E0s3AzSxc8Yfy3
	 VLYGdLDIH5SyTcG5htfTvZtyujo2aXC37hR4y+mf84PBK2JtzKhVoFcpNVwJQj47F7
	 lBlRwn/gcjd7slgJSaC9z8I/2UYyXUg0kG36jqFPTKvl7NauzK4sknUVwhC5PA1+14
	 b5EFWtBBO4uaQ==
Date: Tue, 13 Feb 2024 13:46:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, julien@xen.org, bertrand.marquis@arm.com, 
    roger.pau@citrix.com, roberto.bagnara@bugseng.com, 
    federico.serafini@bugseng.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] docs/misra/rules.rst: catch up with accepted rules
In-Reply-To: <d7295c43-c415-4113-8d9c-e6e3d688763e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402131330160.1925432@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2402091653110.1925432@ubuntu-linux-20-04-desktop> <9504e77d-6f52-489c-a91a-f4d1a6ce9a33@suse.com> <alpine.DEB.2.22.394.2402121512050.1925432@ubuntu-linux-20-04-desktop> <d7295c43-c415-4113-8d9c-e6e3d688763e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Feb 2024, Jan Beulich wrote:
> On 13.02.2024 00:18, Stefano Stabellini wrote:
> > On Mon, 12 Feb 2024, Jan Beulich wrote:
> >> On 10.02.2024 02:00, Stefano Stabellini wrote:
> >>> Update docs/misra/rules.rst to reflect the MISRA C rules accepted in the
> >>> last couple of months.
> >>>
> >>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >>> ---
> >>>
> >>> In the notes section I added some info about the deviations, but in any
> >>> case the appropriate info will also be added to deviations.rst,
> >>> safe.json, etc.
> >>>
> >>> I also added Rule 14.4, which is older, but when I first tried to add it
> >>> to rules.rst, Jan had a question I couldn't reply clearly:
> >>> https://marc.info/?l=xen-devel&m=169828285627163
> >>>
> >>> I think now with this series, the impact of Rule 14.4 is clearer:
> >>> https://marc.info/?l=xen-devel&m=170194257326186
> >>
> >> This series is about enums only afaics. Yet the rule is much wider, and iirc
> >> we had agreed that for integer and pointer types the normal language
> >> conversion to boolean meaning is fine as well. Not only do you not mention
> >> this case in the entry,
> > 
> > I can add a note about it.
> > 
> > 
> >> but it also continue to mean that effectively we
> >> limit the rule to a very narrow case. Which continue to leave open the
> >> question of whether the rule is worthwhile to accept in the first place.
> > 
> > When someone does a safety certification, there is a difference between
> > deviating a rule as a whole or accepting the rule and only deviating
> > certain aspects of it (simply ignoring the rule is typically not an
> > option in safety certification context.) So here I think it would help
> > downstreams interested in safety if we added the rule, with specific
> > deviations.
> 
> Yet then in other cases you refer to Bertrand's general statement of it
> not being helpful when too little of a rule is left by deviating.

I think it is a case-by-case judgement call. Also, keep in mind that
Bertrand's goal was to encourage us to accept more rules in their
entirety without any deviations, not reject more rules. Especially as
rejecting rules it is typically not possible for people doing safety, so
the alternative is to write a wider deviation -- deviate even more, not
less.


> > Do you have any comments on the other parts of this patch? If not, I
> > would be happy to resent the rest unmodified, and update only 14.4 in
> > its own separate patch where we can discuss further.
> 
> Well. We're in territory now where I'm not really happy anymore with the
> full scope of what is being added to the "accepted" list. Leaving 14.4
> aside, what you have in the patch all looks like what was agreed upon,
> but then I'm not taking notes during meetings, and hence I can't help
> the impression that e.g. for 5.5 there was more than just the one
> "permitted" pattern. Therefore, while I deliberately didn't comment
> there (for not having a concrete case in mind), I'm afraid I also don't
> feel anymore like acking such multi-rule patches. If you strictly went
> one by one, it is certainly possible that I might ack this and that.

That's understandable especially as this time I was slower to send out
the patch to update docs/misra/rules.rst (apologies for that.)

Specifically for 5.5, I have the following notes from Roberto:
"""
We tag as deliberate all violations involving clashes
between function-like macros and non-callable entities.
We also tag as deliberate the violations matching the pattern #define x x.
In the future, once string.h will be restricted to the <string.h> functionality
of the C standard, string.h will be deviated further.
Further deviations are yet to be agreed upon (e.g., on ARM64 the deviation
of TYPE_SAFE resolves most of the violation; on x86_64 the deviation
of TYPE_SAFE resolves half of the violations but the others depend
on only about a dozen of macros).
"""

I added to the notes section only the part that I thought would make
sense to keep there. For the rest, I think it would be best to leave it
to future updates of documenting-violations.rst and/or safe.json as
appropriate.

I'll split out 14.4 and 5.5, and keep the rest in one patch.


> As attempted to voice several times during the meetings, I pretty
> strongly disagree with many of the "developer confusion" aspects, when
> they take away options the language quite obviously and naturally
> provides. We're talking about hypervisor code here, not some random
> tool that was thrown together in a haste. At the risk of sounding
> arrogant, people being easily confused by what I'd call normal code
> should simply not touch code like this. Whereas the spirit of many of
> these rules looks to rather go in the direction that basically anyone
> knowing a little bit of C should be qualified enough to maintain code
> made subject to all of these rules.

At some point there will be new people working on Xen (among others,
AMD has been hiring). New people need to start from somewhere. So the
less confusing the code the better it is because it is also less error
prone. There is code reviews and tests, but if the code was less prone
to misinterpretations, then there would be fewer chances of errors in
the first place.

