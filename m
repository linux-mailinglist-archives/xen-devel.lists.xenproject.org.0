Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ED4207BB2
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 20:41:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joAJm-0003Po-48; Wed, 24 Jun 2020 18:40:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Aj6N=AF=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1joAJk-0003Pg-Ei
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 18:40:16 +0000
X-Inumbo-ID: 255ab696-b64a-11ea-bb8b-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 255ab696-b64a-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 18:40:15 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id z2so2531938qts.5
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 11:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VoEjUlJkS7K4ydt2Ps92mPD1TlivKF5y/ZjyuI5GKLU=;
 b=NstNfqfwjXF7T67cFXATN4XVyVAZrt7GkME+th9bzJVEM0bsZ0fvVuY3EYWInBiNe0
 7hGHKVPeyDgEdiX3D3g8wVHePDlfSFXmZFR2T/wD0RX03fU5Tm46YIdYBazlLihst7Rs
 Otvsbx/ukDqSjHVaD4gR6PKym1cMI3Iof71CXbdYC0RRzOeBnNrPdsvOv9oTjqZxv0GH
 6Y1vOuNg1QYKVRc9MucnyGAVPm1htFbPfxbMkWyToJHIBmXA66hA5uO4obrmLtEfbjPs
 ziaQ10+WjgMOhOw7jPBVKh3qezgBssCAZZJPR5Pk8VsU8UxoYyKEw7zZLMVNCX0WskFe
 HLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VoEjUlJkS7K4ydt2Ps92mPD1TlivKF5y/ZjyuI5GKLU=;
 b=aQT/BuXJdrlOOhKP37ctkrClBP33pcwXebIgEiEyRuyACQ635PG3Z7y+mGCBh/TLxX
 zFJ39FOUibjffzTMvLWNc/0WM6SLbxRt+o1wI5owqgchh+U98/7f77eQZWm7/DAXmbsy
 YOFLDcd7brD1PTkHmnPmww5oU6ftsB/VLca0raoCNXWMEvDjdkv/g4qhaCJCUaiVeHzc
 sN6yz/1uwhjLjD8WLZp4aARzURuiuiIZ3tJEX0t+LW4CV7g1+EXsAvePp1hDAY+E2ubh
 M+Aonl2vyv+g29Ox8XAasYV8urAV7YQE+llfuwpwo3guABgRppQ+JwIv7P5ftH+TOGdj
 Rftg==
X-Gm-Message-State: AOAM532VPiy8C2lxn2xbD6o7dPB3z/Ql8DyAdAmtivyMJfbarZ8+vxsu
 352IwhUoJWLhX6Yv6QvxRP48Tkd7uZ1g3EJoaHVDew==
X-Google-Smtp-Source: ABdhPJzH77jNmTePzO35cS43Um/S9NGkiCLFpDnxXb6EoXT0HL2PIpESw5+WyFZ6k3XILG8DW1Mt2ySJ988kYksUHmc=
X-Received: by 2002:aed:3883:: with SMTP id k3mr13168924qte.365.1593024015547; 
 Wed, 24 Jun 2020 11:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <24307.31637.214096.240023@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2006241033210.8121@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006241033210.8121@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 24 Jun 2020 11:40:04 -0700
Message-ID: <CAMmSBy8X8KTx6=yzb4uxu0ULbh7x36qm4bkAqLDWoJvxoQtYGw@mail.gmail.com>
Subject: Re: Proposal: rename xen.git#master (to #trunk, perhaps)
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@citrix.com>, committers@xenproject.org,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 24, 2020 at 10:39 AM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Wed, 24 Jun 2020, Ian Jackson wrote:
> > I think it would be a good idea to rename this branch name.  This name
> > has unfortunate associations[1], even if it can be argued[2] that the
> > etymology is not as bad as in some uses of the word.
> >
> > This is relativity straightforward on a technical level and will
> > involve a minimum of inconvenience.  Since only osstest ever pushes to
> > xen.git#master, we could easily make a new branch name and also keep
> > #master for compatibility as long as we like.
> >
> > The effects[1] would be:
> >
> > Users who did "git clone https://xenbits.xen.org/git-http/xen.git""
> > would find themselves on a branch called "trunk" which tracked
> > "origin/trunk", by default.  (Some users with old versions of git
> > using old protocols would still end up on "master".)
> >
> > Everyone who currently tracks "master" would be able to switch to
> > tracking "trunk" at their leisure.
> >
> > Presumably at some future point (a year or two from now, say) we would
> > abolish the name "master".
> >
> > Comments ?  In particular, comments on:
> >
> > 1. What the new branch name should be called.  Suggestions I have seen
> > include "trunk" and "main".  I suggest "trunk" because this was used
> > by SVN, CVS, RCS, CSSC (and therefore probably SCCS) for this same
> > purpose.
>
> Github seems to be about to make a similar change. I wonder if we should
> wait just a couple of weeks to see what name they are going to choose.
>
> https://www.theregister.com/2020/06/15/github_replaces_master_with_main/
>
>
> Of course I don't particulalry care one way or the other, but it would
> be good if we end up using the same name as everybody else. It is not
> that we have to choose the name Github is going to choose, but their
> user base is massive -- whatever they are going to pick is very likely
> going to stick.

<peanut gallery>
+1 to Stefano's way of thinking here -- that's exactly what we're
doing in some of the other LF projects I'm involved in. Of course all
the master/slave terminology has to be addresses at the project level
-- but I haven't come across much of that in my Xen hacking
</peanut gallery>

Thanks,
Roman.

