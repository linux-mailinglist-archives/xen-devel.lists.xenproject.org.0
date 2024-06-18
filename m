Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 990F590C132
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 03:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742640.1149481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJNTA-00055v-Pj; Tue, 18 Jun 2024 01:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742640.1149481; Tue, 18 Jun 2024 01:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJNTA-00053x-NB; Tue, 18 Jun 2024 01:17:08 +0000
Received: by outflank-mailman (input) for mailman id 742640;
 Tue, 18 Jun 2024 01:17:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCZ4=NU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sJNT9-00053r-0X
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 01:17:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7821bcfa-2d10-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 03:17:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9303961244;
 Tue, 18 Jun 2024 01:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AA5C2BD10;
 Tue, 18 Jun 2024 01:17:00 +0000 (UTC)
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
X-Inumbo-ID: 7821bcfa-2d10-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718673422;
	bh=eAiEM6R2ju/hh0m68CvMCvF8ojNqOd5VppqdXgBHb+0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QrBuj16T40GeGBvvtDXXUQhilQHlfywNzzCZDNA8jpOHvaJjvpeHlcTGE1jslDE6J
	 o9qCf6c5//S4fp7Xl7ZAqjgmjW0ddOLYazcULge62bBH4p9TzDPcbqO0W9pEtCjR+U
	 7kdZkHSWXCs4jPGqXqJOuVQnPq/3bpctbbD0AfvOQj/tZMdL1TT5h2vwF4eITVL+sZ
	 oUrf7uv6KjFfgS3AvZeBbPgOAhixV/6q/mvkDse2exKJFOuPUvVdI0WjLsGNflXzUJ
	 nLaSPOUJb06mhRGHsZ+pkaIf6ZxC/ir446BHAO3v+mbP8GfzXYfVF0JQIeVOgO9JIU
	 0qKHi5yhfHdtA==
Date: Mon, 17 Jun 2024 18:16:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH for-4.19 v2 3/3] automation/eclair_analysis: add more
 clean MISRA guidelines
In-Reply-To: <e199bad317efee793a995523d6d10eac@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406171816370.2572888@ubuntu-linux-20-04-desktop>
References: <cover.1717790683.git.nicola.vetrini@bugseng.com> <42645b41cf9d2d8b5ef72f0b171989711edb00a1.1717790683.git.nicola.vetrini@bugseng.com> <0cae0e19-8512-40e0-9ef2-6e91069779ec@suse.com> <e199bad317efee793a995523d6d10eac@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Jun 2024, Nicola Vetrini wrote:
> On 2024-06-10 09:43, Jan Beulich wrote:
> > On 07.06.2024 22:13, Nicola Vetrini wrote:
> > > Rules 20.9, 20.12 and 14.4 are now clean on ARM and x86, so they are added
> > > to the list of clean guidelines.
> > 
> > Why is 20.9 being mentioned here when ...
> > 
> > > --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> > > +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> > > @@ -60,6 +60,7 @@ MC3R1.R11.7||
> > >  MC3R1.R11.9||
> > >  MC3R1.R12.5||
> > >  MC3R1.R14.1||
> > > +MC3R1.R14.4||
> > >  MC3R1.R16.7||
> > >  MC3R1.R17.1||
> > >  MC3R1.R17.3||
> > > @@ -73,6 +74,7 @@ MC3R1.R20.4||
> > >  MC3R1.R20.6||
> > >  MC3R1.R20.9||
> > >  MC3R1.R20.11||
> > > +MC3R1.R20.12||
> > >  MC3R1.R20.13||
> > >  MC3R1.R20.14||
> > >  MC3R1.R21.3||
> > 
> > ... nothing changes in its regard?
> > 
> 
> Right, it should be removed from the message.

I fixed the commit message, acked the patch and committed it

