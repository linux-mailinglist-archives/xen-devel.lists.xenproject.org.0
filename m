Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1022A54E1
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 22:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18714.43715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ka3eA-0004Ox-9S; Tue, 03 Nov 2020 21:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18714.43715; Tue, 03 Nov 2020 21:15:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ka3eA-0004Oa-6U; Tue, 03 Nov 2020 21:15:18 +0000
Received: by outflank-mailman (input) for mailman id 18714;
 Tue, 03 Nov 2020 21:15:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFvq=EJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ka3e9-0004OV-GP
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 21:15:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58a7ec15-27f4-4506-b0f8-562db1e86a25;
 Tue, 03 Nov 2020 21:15:16 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A405205ED;
 Tue,  3 Nov 2020 21:15:15 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zFvq=EJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1ka3e9-0004OV-GP
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 21:15:17 +0000
X-Inumbo-ID: 58a7ec15-27f4-4506-b0f8-562db1e86a25
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 58a7ec15-27f4-4506-b0f8-562db1e86a25;
	Tue, 03 Nov 2020 21:15:16 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0A405205ED;
	Tue,  3 Nov 2020 21:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604438115;
	bh=AGr0vX1zbmHHU+V7TxZSTvg1FCY0YXQmEyXlBjDXxKk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ND/oASvlXSWl4Zq9BmkcuWjQQgyX3hx9wd32ljNcJryTtBAn9E4JeFGeSOYMapHVw
	 nGD1GEH5tv2iMv3p2KXvuSwjjfwdq3aojeOcI4moe0t5lXe+LV4lg6fBnZhM9E3koF
	 t05yMTJrs60izMpL1FSDsoFpGgvMY0sb3CJu3fIg=
Date: Tue, 3 Nov 2020 13:15:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rich Persaud <persaur@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org, 
    julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org, 
    Daniel DeGraaf <dgdegra@tycho.nsa.gov>, 
    Daniel Smith <dpsmith@apertussolutions.com>, 
    Roman Shaposhnik <roman@zededa.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH] xen: EXPERT clean-up
In-Reply-To: <E359BD65-2917-4087-A6E1-0AD5521CF823@gmail.com>
Message-ID: <alpine.DEB.2.21.2011031307430.5812@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011031123420.5812@sstabellini-ThinkPad-T480s> <E359BD65-2917-4087-A6E1-0AD5521CF823@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1293458912-1604438115=:5812"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1293458912-1604438115=:5812
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 3 Nov 2020, Rich Persaud wrote:
> On Nov 3, 2020, at 14:37, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > ﻿On Tue, 3 Nov 2020, Jan Beulich wrote:
> >>> On 02.11.2020 22:41, Stefano Stabellini wrote:
> >>> On Mon, 2 Nov 2020, Jan Beulich wrote:
> >>>> On 31.10.2020 01:24, Stefano Stabellini wrote:
> >>>>> @@ -79,8 +79,8 @@ config SBSA_VUART_CONSOLE
> >>>>>      SBSA Generic UART implements a subset of ARM PL011 UART.
> >>>>> 
> >>>>> config ARM_SSBD
> >>>>> -    bool "Speculative Store Bypass Disable" if EXPERT
> >>>>> -    depends on HAS_ALTERNATIVE
> >>>>> +    bool "Speculative Store Bypass Disable"
> >>>>> +    depends on HAS_ALTERNATIVE && EXPERT
> >>>>>    default y
> >>>> 
> >>>> At the example of this, I'm afraid when the default isn't "n"
> >>>> (or there's no default directive at all, as ought to be
> >>>> equivalent to and preferred over "default n"), such a
> >>>> transformation is not functionally identical: Before your
> >>>> change, with !EXPERT this option defaults to y. After your
> >>>> change this option is unavailable (which resolves to it being
> >>>> off for all consuming purposes).
> >>>> 
> >>>> IOW there are reasons to have "if ..." attached to the prompts
> >>>> (for this construct indeed only making the prompt conditional,
> >>>> not the entire option), but there are also cases where the
> >>>> cleanup you do is indeed desirable / helpful.
> >>> 
> >>> Yeah, thanks for catching it, it is obviously a problem.
> >>> 
> >>> My intention was just to "tag" somehow the options to EXPERT so that it
> >>> would show on the menu. Maybe a better, simpler, way to do it is
> >>> to add the word "EXPERT" to the one line prompt:
> >>> 
> >>> config ARM_SSBD
> >>> -    bool "Speculative Store Bypass Disable" if EXPERT
> >>> +    bool "Speculative Store Bypass Disable (EXPERT)" if EXPERT
> >>>    depends on HAS_ALTERNATIVE
> >>>    default y
> >>>    help
> >>> 
> >>> 
> >>> What do you think?
> >> 
> >> While on the surface this may look like an improvement, I don't
> >> see how it would actually help: If you read the Kconfig file
> >> itself, the dependency is seen anyway. And on the menu I don't
> >> see the point of telling someone who has enabled EXPERT that a
> >> certain option is (or is not) an expert one. If they think
> >> they're experts, so should they be treated. (It was, after all,
> >> a deliberate decision to make enabling expert mode easier, and
> >> hence easier to use for what one might consider not-really-
> >> experts. I realize saying so may be considered tendentious; I
> >> mean it in a purely technical sense, and I'd like to apologize
> >> in advance to anyone not sharing this as a possible perspective
> >> to take.)
> >> 
> >> Plus, of course, the addition of such (EXPERT) markers to
> >> future options' prompts is liable to get forgotten now and then,
> >> so sooner or later we'd likely end up with an inconsistent
> >> mixture anyway.
> > 
> > I tend to agree with you on everything you wrote. The fundamental issue
> > is that we are (mis)using EXPERT to tag features that are experimental,
> > as defined by SUPPORT.md.
> > 
> > It is important to be able to distinguish clearly at the kconfig level
> > options that are (security) supported from options that are
> > unsupported/experimental. Today the only way to do it is with EXPERT
> > which is not great because:
> > 
> > - it doesn't convey the idea that it is for unsupported/experimental
> >  features
> > - if you want to enable one unsupported feature, it is not clear what
> >  you have to do
> > 
> > So maybe we should replace EXPERT with UNSUPPORTED (or EXPERIMENTAL) in
> > the Kconfig menu?
> > 
> > It would make it clearer that by enabling UNSUPPORTED you are going to
> > get a configuration that is not security supported.
> 
> If going down this path, there should be one, authoritative, in-tree definition of feature-level support from which Kconfig (build-time policy enforcement) and SUPPORT.md (documentation) can be derived.  Later, even run-time enforcement can be similarly classified.  FuSA may also wish for documented policy to align with enforcement.

The goal is trying to align Kconfig and SUPPORT.md by clarifying the
EXPERT option, which today is a poor implementation of "experimental".

There could be further improvements down the line, for instance we could
taint Xen when UNSUPPORTED is selected and even have separate kconfig
options for UNSUPPORTED, EXPERIMENTAL, and TECHPREVIEW. FuSa is likely
going to need its own SAFETY option too. Like you suggested, we could
even have a single source of feature-level support information for both
Kconfig and SUPPORT.md.

However, I didn't want to increase the scope of this one patch. For now,
it would be a good start if we replaced EXPERT with something that covers
anything not security supported, for which UNSUPPORTED looks like a good
name.
--8323329-1293458912-1604438115=:5812--

