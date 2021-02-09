Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 888AA315840
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 22:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83431.155279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9aBl-0001Ul-Qm; Tue, 09 Feb 2021 21:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83431.155279; Tue, 09 Feb 2021 21:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9aBl-0001UM-Ms; Tue, 09 Feb 2021 21:04:49 +0000
Received: by outflank-mailman (input) for mailman id 83431;
 Tue, 09 Feb 2021 21:04:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4M0B=HL=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1l9aBj-0001UA-Ow
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 21:04:47 +0000
Received: from mail-ej1-x62d.google.com (unknown [2a00:1450:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35d90b3d-1fae-4688-bb7b-3122d7526469;
 Tue, 09 Feb 2021 21:04:46 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id w1so34101477ejf.11
 for <xen-devel@lists.xenproject.org>; Tue, 09 Feb 2021 13:04:46 -0800 (PST)
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
X-Inumbo-ID: 35d90b3d-1fae-4688-bb7b-3122d7526469
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iYNtP4w4sH9U75AdPRx/WV9Gg94sZqH3kRt5XGDTuNI=;
        b=vd98t3h5FnK5Wv3l+6Sj/RewcgHsuqbkhvNc3HsYBf+qQXpyKxF2i1uMERflaWea4X
         5Qb93JgDqVUWstYE7TXMIICi7OKk8puJsBrdyzAqgTczpnMTcQp7KROYlBkLlqUfRUha
         PWI2tf91Jxy8UJ5DI33MvCbiLA9HnvzgONdtoK2bB/dx1tNBtcobQPC9De4zIF/LJzkR
         NZzrhOlGltpByiC3VSVfISZMUMcH8SHSH7HixtuVUIwVm5O5crPvXj6zXt6vINC6FFGm
         QXWcM2yh1ULvDr6Y4peRnaCMPHQ8QmQY4Wmhs0yNBqxog8Vh36HsRs3WaqzErssOroKY
         EVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iYNtP4w4sH9U75AdPRx/WV9Gg94sZqH3kRt5XGDTuNI=;
        b=SplIVXdcZr/PDsauhZ7lYgm+YQwha8bgKfzgQJmMw0zLMshLMprMjh4Nvnxd7evfU4
         AeQ4wft7gz7tPaprZmOVYpacwmCiBTwQM8givkj8Nr+wMFP5NG+8qoxi3GhyDNgCt0Ca
         39WesE4NJQIRZuqbVpi+mwnLPkLx7U+0Od5mXQpm37x+AOpxc2vhPW8353uBlsW4vutH
         XFJkNTxdB1nrfFJsFpTAe4Dq5mC5iiVTLbPjIqpRan+tFdOSdk3NJYX1Udlyf/PfxWca
         OEuWQopZB0o+xvpvlfEJzk+43FsOkkDHxnxkK7sosm0EeC6uqEpqec5kbsw1z9mxUUUF
         Db3w==
X-Gm-Message-State: AOAM532aW6lL1PavcNNNj66BdHF0hI6vv2/XSWDbUq1WwhMiqV41w7+t
	WzR4Bmhg7ZyWN4VTylofeMabYsdh446zRvCV0/8=
X-Google-Smtp-Source: ABdhPJzlxxDQxgFa01yTwTNXaPWDBUOenQ8Nk7LcWb2LU+tOMbxwO02y0ppWNkaEgDfsgOLNngfgFGo/6FKOin1mYQs=
X-Received: by 2002:a17:906:3a10:: with SMTP id z16mr9300715eje.483.1612904685924;
 Tue, 09 Feb 2021 13:04:45 -0800 (PST)
MIME-Version: 1.0
References: <20210208184932.23468-1-sstabellini@kernel.org>
 <173ed75a-94cf-26a5-9271-a687bf201578@xen.org> <alpine.DEB.2.21.2102081214010.8948@sstabellini-ThinkPad-T480s>
 <4df687cb-d3bc-ccb8-4e7c-a6429c37574e@suse.com> <24610.38467.808678.941320@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2102090914280.8948@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2102090914280.8948@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 9 Feb 2021 21:04:34 +0000
Message-ID: <CAJ=z9a0fDYccxTDkpvmG77D-havkySuYOUK4MSYvpZw4EL9oGg@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, lucmiccio@gmail.com, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>, 
	George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Feb 2021 at 17:31, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> On Tue, 9 Feb 2021, Ian Jackson wrote:
> > Jan Beulich writes ("Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping"):
> > > On 08.02.2021 21:24, Stefano Stabellini wrote:
> > ...
> > > > For these cases, I would just follow a simple rule of thumb:
> > > > - is the submitter willing to provide the backport?
> > > > - is the backport low-risk?
> > > > - is the underlying bug important?
> > > >
> > > > If the answer to all is "yes" then I'd go with it.
> > >
> > > Personally I disagree, for the very simple reason of the question
> > > going to become "Where do we draw the line?" The only non-security
> > > backports that I consider acceptable are low-risk changes to allow
> > > building with newer tool chains. I know other backports have
> > > occurred in the past, and I did voice my disagreement with this
> > > having happened.
> >
> > I think I take a more relaxed view than Jan, but still a much more
> > firm line than Stefano.  My opinion is that we should make exceptions
> > for only bugs of exceptional severity.
> >
> > I don't think I have seen an argument that this bug is exceptionally
> > severe.
> >
> > For me the fact that you can only experience this bug if you upgrade
> > the hardware or significantly change the configuration, means that
> > this isn't so serious a bug.
>
> Yeah, I think that's really the core of this issue. If somebody is
> already using 4.12 happily, there is really no reason for them to take
> the fix. If somebody is about to use 4.12, then it is a severe issue.

If somebody is about to use 4.12, then it is most likely going to
encounter a serious blocker as there is no support for generic SMMU
bindings. I would be surprised if there are a lot of DT still using
the old bindings, at which point such users would want to switch to
4.15 + your patches to add support.

>
> The view of the group is that nobody should be switching to 4.12 now
> because there are newer releases out there. I don't know if that is
> true.

This is mostly based on the definition of supported vs security
supported. When a tree is only security supported, then there is no
promise the code will run on any systems.

>
> I didn't realize we had a policy or even a recommendation of always
> choosing the latest among the many releases available with
> security-support. I went through the website and SUPPORT.md but couldn't
> find it spelled out anywhere. See:

May I ask, what sort of users would want to start a
development/product based on a soon to be abandoned version?

For any new development, I have always advised to switch to the latest
Xen (or at least stable) because it will contain the latest fixes,
features, and better support because the code is still in mind...

>
> https://xenproject.org/downloads/
> https://xenproject.org/downloads/xen-project-archives/xen-project-4-12-series/
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=SUPPORT.md;h=52f25fa85af41fa3b38288ab7e172408b77dc779;hb=97b7b5567fba6918a656ad349051b5343b5dea2e
>
> At most we have:
>
>     Supported-Until: 2020-10-02
>     Security-Support-Until: 2022-04-02
>
> Anecdotally, if I go to https://www.kernel.org/ to download a kernel
> tarball, I expect all tarballs to have all the major functionalities. I
> wouldn't imagine that I cannot get one entire Linux subsystem (e.g.
> ethernet or SATA) to work if I don't pick the latest.

I think this is an unrealistic expectation... You can't pick any
version of stable Linux and expect it to work on your shiny HW. There
might be missing drivers, workaround (including in core subsystems)...

>
> Maybe it would make sense to clarify which releases are discouraged from
> being used on https://xenproject.org/downloads/ at least?

Feel free to suggest a wording that can be discussed here.

Cheers,

