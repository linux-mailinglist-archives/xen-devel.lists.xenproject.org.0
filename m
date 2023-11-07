Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8160C7E347B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 05:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628555.980148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0DYB-0006uo-Bc; Tue, 07 Nov 2023 04:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628555.980148; Tue, 07 Nov 2023 04:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0DYB-0006sn-8j; Tue, 07 Nov 2023 04:18:51 +0000
Received: by outflank-mailman (input) for mailman id 628555;
 Tue, 07 Nov 2023 04:18:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FGpL=GU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r0DYA-0006dK-16
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 04:18:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf0ff402-7d24-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 05:18:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E414A61055;
 Tue,  7 Nov 2023 04:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5F0C433C8;
 Tue,  7 Nov 2023 04:18:45 +0000 (UTC)
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
X-Inumbo-ID: bf0ff402-7d24-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699330726;
	bh=sJX8RNfonAKRBUfb3IouxMgt3wqfCOt+uN3yCttZxCQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g848FBEk6CEa78NKj1PVBG99fmFBVubHzb36pzxEOc+w34oWyw21MKKD/SdH1cbhv
	 IcI21W1R66zhoeDMLUJbdbrYHlWqwFEdnsjXoY4lyd5DI9HGlXr8G5VVgt/sYgweoZ
	 EMmW3Y8XSffAub9tQWVCW+jn7F2FJC8m+Zz4mwriaGVwBL7PKLVsQJtAD9v35Y/l++
	 ASR2QmZlec3/Sh3EBJ8P41pJNTKNeTO3J05zJXJxD3r9Tl8lgZUAwITSMt7MPtmQFj
	 advEi9+5WWrjhFxWSM5Kn7dRyhrMuFENk4WNB7onZHGT/5tlg6bAESwAZZeZ/iDWGn
	 6w19F3lzv+70w==
Date: Mon, 6 Nov 2023 20:18:44 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org, 
    committers@xenproject.org
Subject: Re: Informal voting proposal
In-Reply-To: <39e6d4b3-5468-4b91-a030-f36bcce3583d@xen.org>
Message-ID: <alpine.DEB.2.22.394.2311061254560.3478774@ubuntu-linux-20-04-desktop>
References: <CAO-mL=zCpobcXHnAGeLL1tOP5dyqyThVri3a=76t_xYDMa+mrA@mail.gmail.com> <39e6d4b3-5468-4b91-a030-f36bcce3583d@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Nov 2023, Julien Grall wrote:
> Hi Kelly,
> 
> On 06/11/2023 16:40, Kelly Choi wrote:
> > Hi all,
> > 
> > As an open-source community, there will always be differences of opinion in
> > approaches and the way we think. It is imperative, however, that we view
> > this diversity as a source of strength rather than a hindrance.
> > 
> > Recent deliberations within our project have led to certain matters being
> > put on hold due to an inability to reach a consensus. While formal voting
> > procedures serve their purpose, they can be time-consuming and may not
> > always lead to meaningful progress.
> > 
> > Having received agreement from a few maintainers already, I would like to
> > propose the following:
> 
> Thanks for the sending the proposal. While I like the idea of informal vote to
> move faster, I would like to ask some clarifications.
>
> > *Informal voting method:*
> > 
> >     1. Each project should ideally have more than 2 maintainers to
> >     facilitate impartial discussions. Projects lacking this configuration
> > will
> >     be addressed at a later stage.
> >     2. Anyone in the community is welcome to voice their opinions, ideas,
> >     and concerns about any patch or contribution.
> >     3. If members cannot agree, the majority informal vote of the
> >     maintainers will be the decision that stands. For instance, if, after
> >     careful consideration of all suggestions and concerns, 2 out of 3
> >     maintainers endorse a solution within the x86 subsystem, it shall be the
> >     decision we move forward with.
> 
> How do you know that all the options have been carefully considered?

I don't think there is a hard rule on this. We follow the discussion on
the list the same way as we do today.

While I like the informal vote proposal and effectively we have already
been following it in many areas of the project, I don't think we should
change the current processes from that point of view.


> >     4. Naturally, there may be exceptional circumstances, as such, a formal
> >     vote may be warranted but should happen only a few times a year for
> > serious
> >     cases only.
> Similarly here, you are suggesting that a formal vote can be called. But it is
> not super clear what would be the condition it could be used and how it can be
> called.

The formal vote is basically the same we already have today. It would
follow the existing voting rules and guidelines already part of the
governance.


> For instance, per the informal rule, if 2 out of 3 maintainers accept. Then it
> would be sensible for the patch to be merged as soon as the 5 days windows is
> closed. Yet the 3rd maintainer technically object it. So could that maintainer
> request a formal vote? If so, how long do they have?

It is difficult to write down a process that works in all cases, and if
we did it would probably end up being slower rather than faster.

In my view if someone doesn't agree with his other co-maintainers and he
is outvoted (e.g. 2/3 of the maintainers prefer a different option), the
individual is entitled to raise a request for a vote with the
committers, which is the same as we already have today.

Ideally a formal vote would be rare, maybe once or twice a year, so I
hope we won't need to optimize the formal vote.


> >     5. Informal votes can be as easy as 2 out of 3 maintainers providing
> >     their Acked-by/Reviewed-by tag. Alternatively, Maintainers can call an
> >     informal vote by simply emailing the thread with "informal vote
> > proposed,
> >     option 1 and option 2."
> >     6. *All maintainers should reply with their vote within 5 working days.*
> 
> While I understand we want to move fast, this means that a maintainer that is
> away for PTO would not have the opportunity to answer.

PTO is a bit of a special case because we typically know when one of the
maintainers is on PTO. If it is a short PTO and if the vacationing
maintainer could have a strong opinion on the subject then it would make
sense to wait. If it is a long leave of absence (several weeks or
months) then I don't think we can wait.

So I think the 5 working days is OK as a rule of thumb, but of course it
shouldn't be used to work around objections of a maintainer by waiting
for him to go on holiday :-)

