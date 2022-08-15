Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68187593D04
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 22:39:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387802.624198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNgrl-0007ZV-Ds; Mon, 15 Aug 2022 20:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387802.624198; Mon, 15 Aug 2022 20:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNgrl-0007Xh-Ax; Mon, 15 Aug 2022 20:39:17 +0000
Received: by outflank-mailman (input) for mailman id 387802;
 Mon, 15 Aug 2022 20:39:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Klp=YT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oNgrj-0007XI-OB
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 20:39:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 522c1c06-1cda-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 22:39:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D906061227;
 Mon, 15 Aug 2022 20:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691DCC433D6;
 Mon, 15 Aug 2022 20:39:10 +0000 (UTC)
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
X-Inumbo-ID: 522c1c06-1cda-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660595951;
	bh=/kwtncNnmX1Er6+8KlT3lxf0KyTwJcPfa160P8KuPIw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M4aHly93/NnhaThYNvmPOVw/RDE350ysPFXSwOHSP95nBAfNMANG2OwcuAsVlQ0mJ
	 Rw8xc/JzbIv7J5H4VY2vKpa7P6LEA5TTcgemyasmGU024lLYpXm4B7ZD01f76yrZPH
	 B86hGSVCD/rLxXdKzeE2rLsOMvPjutjpVdAqV8cTEtrB8dvcOHcVa0Btxh7MU7jeIn
	 uKtdt0Ni3AHs2IZPvk1zL8Ywu6vIf0MUeOWFIalnQMWAVlLWO6qsMIaoplK4c1a6qm
	 pAM1TOqOgcdkCwU7kt/C49kbGM8mpvtKkaJpifUaxQcrXmYkOMbfOuYSnWP85BU1Z8
	 AiJnjnc2FWBHw==
Date: Mon, 15 Aug 2022 13:39:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, bertrand.marquis@arm.com, 
    george.dunlap@citrix.com, andrew.cooper3@citrix.com, 
    Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] add SPDX to arch/arm/*.c
In-Reply-To: <a604ce43-2b3f-7ac3-36a1-913a66f036d2@xen.org>
Message-ID: <alpine.DEB.2.22.394.2208151333130.3790@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2208121758520.3790@ubuntu-linux-20-04-desktop> <a604ce43-2b3f-7ac3-36a1-913a66f036d2@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 13 Aug 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 13/08/2022 01:59, Stefano Stabellini wrote:
> > Add SPDX license information to all the *.c files under arch/arm.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > 
> > We need to start from somewhere and I thought arch/arm/*.c would be a
> > good place to start.
> 
> Thanks for doing it. This will make easier to understand the license in each
> file. There are a couple of places below where the SDPX tag is incorrect. How
> did you figure out the which license to use?

I used the information in COPYING at the top of the repository. I
realize that I should also have checked the comment header at the top
of each source file, especially in regards to GPLv2 vs, GPLv2 or later.
I'll do that in the next version.


> Also, I think we should consider to add a section about SPDX in our coding
> style so new files are using it. So we don't end up with a mix in arch/arm/*.

Excellent point. I realized there are a couple of style details to sort
out so I sent out a separate email about that.


> > diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> > index f03cd943c6..8115f89408 100644
> > --- a/xen/arch/arm/alternative.c
> > +++ b/xen/arch/arm/alternative.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> Technically, this is a comment. So this should be /* ... */ to follow Xen
> coding style. Also...
> 
> >   /*
> >    * alternative runtime patching
> >    * inspired by the x86 version
> 
> ... this comment contains information about the license. As you add the SPDX,
> the "long" version should be removed. This would also make easier to verify
> the SPDX you add match existing license.

I agree. Also I made a comment about this in the other larger thread to
make sure we are all on the same page about it.


> > diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> > index ec81a45de9..7c986ecb18 100644
> > --- a/xen/arch/arm/bootfdt.c
> > +++ b/xen/arch/arm/bootfdt.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> >   /*
> >    * Early Device Tree
> >    *
> > diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> > index ae649d16ef..887b5426c7 100644
> > --- a/xen/arch/arm/cpuerrata.c
> > +++ b/xen/arch/arm/cpuerrata.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> This file had no explicit license. I had a look at the 'git log' and AFAICT
> this was either new code and came from Linux. So this looks fine to add GPLv2
> here.

Thanks


> >   #include <xen/cpu.h>
> >   #include <xen/cpumask.h>
> >   #include <xen/init.h>
> > diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> > index 62d5e1770a..a6253cb57f 100644
> > --- a/xen/arch/arm/cpufeature.c
> > +++ b/xen/arch/arm/cpufeature.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> >   /*
> >    * Contains CPU feature definitions
> >    *
> > diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> > index f5f6562600..f586c3d781 100644
> > --- a/xen/arch/arm/decode.c
> > +++ b/xen/arch/arm/decode.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> This tag doesn't match the license below. It is currently GPLv2+. I don't
> think you can change it without consulting the author. But if it is, then it
> should be mentioned in the commit message.

[...]

> I remember we discussed in the past that some files were GPLv2+. But I can't
> remember what was the outcome (I can't find the thread). IIRC GPLv2+ is a lot
> more restrictive than GPLv2 and could prevent some companies to contribute.

[...]

> Same here about GPLv2+. Please go through the rest of the files to confirm the
> license.

The change was not intentional: this exercise should not result in any
licensing changes. Next time I'll make sure to check all the
copyright/license headers at the top of the files to make sure they
match the SPDX tag.

Thanks for spotting this.

Cheers,

Stefano

