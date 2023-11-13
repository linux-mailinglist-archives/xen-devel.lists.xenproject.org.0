Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A8A7EA60C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 23:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632044.985965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fLP-0006Sc-Eh; Mon, 13 Nov 2023 22:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632044.985965; Mon, 13 Nov 2023 22:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fLP-0006QH-Be; Mon, 13 Nov 2023 22:23:47 +0000
Received: by outflank-mailman (input) for mailman id 632044;
 Mon, 13 Nov 2023 22:23:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lmv8=G2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r2fLO-0006EV-KM
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 22:23:46 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e26fee6-8273-11ee-98db-6d05b1d4d9a1;
 Mon, 13 Nov 2023 23:23:45 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2A458CE0918;
 Mon, 13 Nov 2023 22:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E6EC433C8;
 Mon, 13 Nov 2023 22:23:39 +0000 (UTC)
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
X-Inumbo-ID: 4e26fee6-8273-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699914220;
	bh=QeOVJBn2axuEjno4ACSpIkn+lD/20YFjDJ4rgNThGF4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rb07h6hlY4/4jNkLPoDeYiXQ6hNybi+vcwFQM2CPs93uCthCN4ykHrMWmIYNNDFZA
	 h9FgKPRo6PIhpamhU9zRoPvytq/jMrq44x79F0BSHuwbQ5IvkW84xNoLJIq7rwLSg9
	 JnsO+RCtkgrS6NbGT5aumnRfD9dPs+hx9MScbhnCRL6pujPMJXkWSv6qyJblgC0Bfd
	 JP2q22cJBJ6SdJgZWkzVm9it1Rj75Qt0aa2BNuCgk+yUdR6U0iN0PTmSE/tDwbnp0Y
	 wKwYwM/RJGLtu/d3Rhag8pQbgVzEiGujhXvJc9jq065WCF+eqSHiJJsOf/UDiyYxIj
	 EAl3/0KiFhPXg==
Date: Mon, 13 Nov 2023 14:23:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org, 
    committers@xenproject.org
Subject: Re: Informal voting proposal
In-Reply-To: <96df2df9-b295-6334-d45c-183d116fff88@suse.com>
Message-ID: <alpine.DEB.2.22.394.2311131349470.160649@ubuntu-linux-20-04-desktop>
References: <CAO-mL=zCpobcXHnAGeLL1tOP5dyqyThVri3a=76t_xYDMa+mrA@mail.gmail.com> <96df2df9-b295-6334-d45c-183d116fff88@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Nov 2023, Jan Beulich wrote:
> On 06.11.2023 17:40, Kelly Choi wrote:
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
> > 
> > *Informal voting method:*
> > 
> >    1. Each project should ideally have more than 2 maintainers to
> >    facilitate impartial discussions. Projects lacking this configuration will
> >    be addressed at a later stage.
> 
> Terminology question: What is "project" here? Considering how ./MAINTAINERS
> is structured, is it perhaps more "component"?

Yes, I think "component" is the right word


> >    2. Anyone in the community is welcome to voice their opinions, ideas,
> >    and concerns about any patch or contribution.
> >    3. If members cannot agree, the majority informal vote of the
> >    maintainers will be the decision that stands. For instance, if, after
> >    careful consideration of all suggestions and concerns, 2 out of 3
> >    maintainers endorse a solution within the x86 subsystem, it shall be the
> >    decision we move forward with.
> 
> In a later reply you make explicit what can only be guessed here: There
> you suggest that out of a range of possible options, up front two are
> picked to then choose between. However, when there is a range options
> available, and when those can be viewed as points on a scale (rather
> than, to take Stefano's earlier example of SAF-* naming, cases where
> it's hard to view choices as being on a linear scale), picking two
> "points" up front may already pose a problem. (See also another reply
> mentioning how to ensure that the various possible options were even
> taken into consideration.)
> 
> Not only in such situations, but in general, to me a prereq to even
> coming to the point of needing an informal vote is the willingness of
> everyone involved to find a compromise. When there's a range of views,
> and when "knowing" what's going to be best for the project would require
> a crystal ball, experience suggests to me that chances for an optimal
> choice are better when picking a "point" not at the far ends of the scale.
> (Such a result then would also much better reflect your named goal of
> seeing diversity as a strength.)
> 
> With such willingness I think even informal votes could be avoided most
> of the time, at which point it becomes questionable whether for the few
> remaining cases informal and formal votes really need specifying
> separately.

The key difference in point of views is that you see as very common to
have options on a linear scale, where finding a middle ground makes
sense, and you see as an exception cases like SAF-* naming that are not
on a scale. In my view cases like SAF-* naming are the common case,
while it would be an exception to have options on a linear scale. If
it turns out there are indeed many cases where multiple options are on a
linear scale, we might be able to come up with another idea on how to
get a quick informal consensus for those issues.


> >    4. Naturally, there may be exceptional circumstances, as such, a formal
> >    vote may be warranted but should happen only a few times a year for serious
> >    cases only.
> >    5. Informal votes can be as easy as 2 out of 3 maintainers providing
> >    their Acked-by/Reviewed-by tag. Alternatively, Maintainers can call an
> >    informal vote by simply emailing the thread with "informal vote proposed,
> >    option 1 and option 2."
> 
> I find this difficult. Both A-b and R-b assert that the person offering
> the tag endorses the presented solution to the indicated degree. It does
> not say anything on possible alternative solutions. As a result taking
> such tags as votes is (once again, and once again in my personal view)
> reasonable only when there's a black-and-white decision to be taken.

From a practical perspective, A-b and R-b are a quick and easy way to
gauge informal consensus on an issue. Also, exploring alternative
solutions take time. Time for the reviewer, time for the contributor,
time for everyone else involved in the email thread. A-b and R-b have a
very important role: they say "this is good enough". When you have a
majority of people saying "this is good enough", I think we would be
better off spending our timing fixing other deficiencies, reviewing
other patches, rather than trying to further optimize that particular
patch.


> >    6. *All maintainers should reply with their vote within 5 working days.*
> > 
> >    7. Please note that with any new process, there will always be room for
> >    improvement and we will reiterate where needed.
> > 
> > Ultimately our goal here is to prevent the project coming to a standstill
> > while deliberating decisions that we all cannot agree on. This may mean
> > compromising in the short term but I am sure the long-term benefits will
> > stand for themselves.
> > 
> > *If you have any strong objections to the informal voting, please let me
> > know by 30th November 2023. *
> 
> Just FTAOD none of the above is meant to be a "strong objection". Despite
> being unconvinced of the proposal (including the need for one, not the
> least also considering what has triggered this sudden effort, when there
> are - imo - worse problems of "standstill"), I'll try to be a good citizen
> and play by what's going to be put in place.

Thank you. Let's give it a try and see how it goes. As for every change,
we are trying to make improvements. If they don't work, or better ideas
come along, we can change again.


