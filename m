Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF488B9047
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 21:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715413.1117020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2G2U-00071x-VG; Wed, 01 May 2024 19:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715413.1117020; Wed, 01 May 2024 19:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2G2U-0006yu-S6; Wed, 01 May 2024 19:54:50 +0000
Received: by outflank-mailman (input) for mailman id 715413;
 Wed, 01 May 2024 19:54:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2G2U-0006yo-1K
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 19:54:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a94f0c50-07f4-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 21:54:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DAD7A619F7;
 Wed,  1 May 2024 19:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51C5C4AF14;
 Wed,  1 May 2024 19:54:42 +0000 (UTC)
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
X-Inumbo-ID: a94f0c50-07f4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714593285;
	bh=xoJXXr1iAPU4YJ7eR2Ibl3K9W6AbUYpI6MGa15AYcFE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bB3YWcpXFxRfZkRvYHVlL//VX89GzHNfQ9dqt8Dsoi3Fi5/r4IWbCXBW5bPRpBjAU
	 t/21AYc8KyyiXj4/yJevpKq4JmFSEVn/d4I/644GxV8a8vq6SzYDl8tGK2pMO9/z1y
	 fvT14Wm9ZphFdbskch0YFEKe5NlwCEfADDkpuvCQZq4P5T+DNhOc16iTyNyis2aOo+
	 DQOHuv06M1XtDcJMVDfjd/i3FHixFQRXAC1hylYWBUvpAZjy4xo6ZRPdMrEwzkETwB
	 OM0IGoGNHC+XAU8tzcAfEPPkeaLY05Ly3DC5sLapkVY1A0qtDqNnoy2j6fOuay3gqK
	 qTRvx4yTLqBFA==
Date: Wed, 1 May 2024 12:54:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH 03/10] automation/eclair_analysis: deviate macro
 count_args_ for MISRA Rule 20.7
In-Reply-To: <5b675fcdf688723bc6d4ea260d10004e@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405011254290.497719@ubuntu-linux-20-04-desktop>
References: <cover.1713885065.git.nicola.vetrini@bugseng.com> <7de407c218f0911e28b7c3f609a55636165166a8.1713885065.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2404241727520.3940@ubuntu-linux-20-04-desktop>
 <5b675fcdf688723bc6d4ea260d10004e@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Apr 2024, Nicola Vetrini wrote:
> On 2024-04-25 02:28, Stefano Stabellini wrote:
> > On Tue, 23 Apr 2024, Nicola Vetrini wrote:
> > > The count_args_ macro violates Rule 20.7, but it can't be made
> > > compliant with Rule 20.7 without breaking its functionality. Since
> > > it's very unlikely for this macro to be misused, it is deviated.
> > 
> > That is OK but can't we use the SAF- framework to do it, given that it
> > is just one macro?
> > 
> > If not, this is also OK.
> > 
> > 
> 
> It would be more fragile, for no substantial gain

OK

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

