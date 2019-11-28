Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF8310C14C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 02:14:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia8Lw-0001zd-KJ; Thu, 28 Nov 2019 01:12:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ia8Lv-0001zY-6x
 for xen-devel@lists.xen.org; Thu, 28 Nov 2019 01:12:15 +0000
X-Inumbo-ID: 1c8c0d08-117c-11ea-83b8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c8c0d08-117c-11ea-83b8-bc764e2007e4;
 Thu, 28 Nov 2019 01:12:14 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 562B92158A;
 Thu, 28 Nov 2019 01:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574903533;
 bh=CS1Jtjudbt4xB07iIrjaCs7YhEgXAIYfJTyvVsjI8Aw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=JMdGczTt2KZnqJlQC/tYZ1PyNk5Q8PbdeFdDhd+mPlxgEJdkUU5HInSZGadPxYWZ+
 Pl/nt9PqUjiQ2jiktFqI2wHNTrDL/RkNQN35iMeofyM4XIq5hxS6SI0NQobd6mBrir
 GXCsBD8dcIMnSX/WdyLRB4M67WsJh9dgqq9FzVEQ=
Date: Wed, 27 Nov 2019 17:12:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>, julien@xen.org
In-Reply-To: <e846a55b-3379-a22d-93db-862bc5279b64@suse.com>
Message-ID: <alpine.DEB.2.21.1911270753580.27669@sstabellini-ThinkPad-T480s>
References: <20191122080226.6817-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
 <942a60db-fd30-a63e-25b1-e6b739b17c4e@xen.org>
 <alpine.DEB.2.21.1911261306370.8205@sstabellini-ThinkPad-T480s>
 <e98515e2-8e2e-569a-557e-523e9f134bef@xen.org>
 <13d490f1-cd9e-e2aa-d118-2c96cf03eb9b@suse.com>
 <AM0PR04MB4481C1F43E0827D5652148F488440@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <e846a55b-3379-a22d-93db-862bc5279b64@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-20810286-1574870153=:27669"
Content-ID: <alpine.DEB.2.21.1911270756330.27669@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER
 range
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Alice Guo <alice.guo@nxp.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>, committers@xenproject.org,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-20810286-1574870153=:27669
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1911270756331.27669@sstabellini-ThinkPad-T480s>

On Wed, 27 Nov 2019, Jürgen Groß wrote:
> On 27.11.19 10:31, Peng Fan wrote:
> > > Subject: Re: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER
> > > range
> > > 
> > > On 27.11.19 01:01, Julien Grall wrote:
> > > > Hi,
> > > > 
> > > > On 26/11/2019 23:17, Stefano Stabellini wrote:
> > > > > On Tue, 26 Nov 2019, Julien Grall wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > On 26/11/2019 20:43, Stefano Stabellini wrote:
> > > > > > > + Juergen
> > > > > > > 
> > > > > > > I missed that you weren't in CC to the original patch, sorry.
> > > > > > > I think this patch should go in, as otherwise Linux 5.4 could run
> > > > > > > into problems. It is also a pretty straightforward 4 lines patch.
> > > > > > 
> > > > > > 5.5 (or 5.6) is not going to run on Xen for other reasons (still in
> > > > > > the vGIC)... So I would not view this as critical.
> > > > > 
> > > > > 5.5 is not out yet, in fact, the dev window has just opened. Isn't
> > > > > your statement a bit premature?
> > > > 
> > > > The GICv4.1 work [1] is going to prevent Linux booting on all current
> > > > versions of Xen. While I can't confirm this is going to be merged in
> > > > 5.5, I can tell you this will break.
> > > > 
> > > > > 
> > > > > In any case, even if potential future Linux releases could have other
> > > > > additional issues, I don't think it should change our current view on
> > > > > this specific issue which affects 5.4, just released.
> > > > 
> > > > The patch is definitely not as straightforward as you may think.
> > > > Please refer to the discussion we had on the first version. I voiced
> > > > concern about this approach and gave point what could go wrong with
> > > happen.
> > > > 
> > > > This patch may be better than the current state (i.e crashing), but
> > > > this wasn't tested enough to confirm this is the correct things to do
> > > > and no other bug will appear (I don't believe reading I*ACTIVER was
> > > > ever tested before).
> > > > 
> > > > It is an annoying bug, but this is only affecting 5.4 which has just
> > > > been released. It feels to me this is a fairly risky choice to merge
> > > > it qutie late in the release without a good graps of the problem (see
> > > > above).
> > > > 
> > > > So I would definitly, prefer if this patch is getting through backport
> > > > once we get more testing.
> > > > 
> > > > We can still document the bug in the release note and point people to
> > > > the patch.
> > > > 
> > > > Anyway, this is Juergen choice here. But at least now he has the full
> > > > picture...
> > > > 
> > > > Cheers,
> > > > 
> > > > [1]
> > > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.
> > > > 
> > > net%2FArticles%2F800494%2F&amp;data=02%7C01%7Cpeng.fan%40nxp.co
> > > m%7Cdca
> > > > 
> > > dfb39240749ee675e08d772fcd3ba%7C686ea1d3bc2b4c6fa92cd99c5c30163
> > > 5%7C0%7
> > > > 
> > > C0%7C637104302519996592&amp;sdata=7Jv2IhI8HZgBTSuYzkEplFyhX1lzmv
> > > d73xb5
> > > > 2d6ERVQ%3D&amp;reserved=0
> > > > 
> > > 
> > > Thanks, Julien, for sharing your opinion.
> > > 
> > > With that statement I'd like to defer this patch to 4.14.
> > 
> > But without this patch, 5.4 kernel will crash. So you prefer
> > we develop the solution as Julien suggested for 4.13?
> 
> I certainly won't take a patch for 4.13 when a maintainer of the
> related code has reservations against it.
> 
> I think the best thing to do is to develop a proper patch the
> maintainers are happy with and don't try to force it into 4.13 now.
> Such a patch can still be backported to 4.13 later.

I chatted with Juergen and he explained to me something I didn't know
before. The release manager can only *block* a patch from being
committed, he/she cannot actually decide if the patch should be
committed or not for a given release. He/she cannot overrule a
maintainer either.

In this case, Juergen cannot make the decision on whether the patch
should go in 4.13 or not.

Although I couldn't reproduce the problem on Xilinx boards, I have to
take the community angle on this, and I would like to make sure our
releases work properly on any hardware, including NXP. Thus, I'll make
the case one more time, hoping that Julien might change his mind :-)

We know that the bug fix won't introduce any regressions because, as
Julien wrote, this code path was never used before. Also because of
that, waiting for the backport and more OSSTest runs won't make much of
a difference because OSSTest won't exercise this code path.

It is true that the original code handling GICD_ISACTIVER was never spec
compliant, and it should be fixed properly. However, that is not what
this patch addresses. That code, in addition from not being spec
compliant by design, it also happens to have a typo. Fixing the typo at
this stage of the release is appropriate at least to get a consistent
behavior in the handling of GICD_ISACTIVER*, and also for Linux 5.4 as
guest. Not to give a false impression to users, the warning ensures that
the underlying Xen behavior is flagged appropriately.

In short, I think the patch should go in now and there are no downsides
to it. That's it, I rest my case. Julien, I hope you'll reconsider.
--8323329-20810286-1574870153=:27669
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-20810286-1574870153=:27669--

