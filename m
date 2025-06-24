Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED1DAE5917
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 03:20:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022888.1398757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTsKD-00046o-C5; Tue, 24 Jun 2025 01:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022888.1398757; Tue, 24 Jun 2025 01:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTsKD-00045O-83; Tue, 24 Jun 2025 01:19:49 +0000
Received: by outflank-mailman (input) for mailman id 1022888;
 Tue, 24 Jun 2025 01:19:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuY8=ZH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uTsKB-0003pS-IS
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 01:19:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 500d667e-5099-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 03:19:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6A8D25C5950;
 Tue, 24 Jun 2025 01:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B38C4CEEA;
 Tue, 24 Jun 2025 01:19:43 +0000 (UTC)
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
X-Inumbo-ID: 500d667e-5099-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750727984;
	bh=Hq68I0LS81yX+Fc1eZmZhZhvuYiv6kH1IOhUOIDZEMY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V8wpRvDglveMfO2QoRRvIIw6GOdLT7mmWlPam8E1UmMgMiTNSE3++zgPNwsXzhuRh
	 cHh5Pp42zAElY3TvKabPU7J8B4QH1avIfukDTYSmv+SEzn1l1RfGXW502ZFwp6CApp
	 eq5MIhEjcIwsX3qFcn07LfFf2nRtbjP0UrunwnvRJAV2TI8/mUE5w8ZVwoIOwyV0O0
	 DP2QluFcABzhTW8K5cZ+zAd6lTs7yKVCTK/BPmsTtdSl2zWvIA84y5yidjzRYV1GDn
	 qz2mnRwoq4hY+nXWAkjVAehtAF4qHCwf0Za+9fBqvgleQJQ8ToKGPgQ8JSV+Dre/U/
	 TADL15VEQyuYQ==
Date: Mon, 23 Jun 2025 18:19:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, michal.orzel@amd.com, 
    julien@xen.org, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    federico.serafini@bugseng.com
Subject: Re: [PATCH v5] automation/eclair: update configuration of D4.10
In-Reply-To: <a81739f7-4f86-4af4-97b1-0da1dd59f835@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506231649560.862517@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2506201918100.2978375@ubuntu-linux-20-04-desktop> <bb73b812ea04857c29bdf64c570eaafa@bugseng.com> <alpine.DEB.2.22.394.2506221355580.8066@ubuntu-linux-20-04-desktop> <a81739f7-4f86-4af4-97b1-0da1dd59f835@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Jun 2025, Jan Beulich wrote:
> On 22.06.2025 22:58, Stefano Stabellini wrote:
> > On Sun, 22 Jun 2025, Nicola Vetrini wrote:
> >> On 2025-06-21 04:19, Stefano Stabellini wrote:
> >>> --- a/xen/arch/x86/include/asm/cpufeatures.h
> >>> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> >>> @@ -1,6 +1,6 @@
> >>> -/*
> >>> - * Explicitly intended for multiple inclusion.
> >>> - */
> >>> +/* This file is intended to be included multiple times. */
> >>> +/* #ifndef X86_CPUFEATURES_H */
> >>> +/* #define X86_CPUFEATURES_H */
> >>>
> >>
> >> Are these two lines really needed? I may be mistaken, but I think the
> >> violation's first location would be the #include below with a comment a couple
> >> of lines above captured by the config at the top [1]. @Federico thoughts?
> > 
> > Without these 2 lines, ECLAIR complains about the following:
> > 
> > #include <xen/lib/x86/cpuid-autogen.h>
> >        ^
> >  MC3A2.D4.10non-compliant start of header file
> 
> And that's where hence a SAF-8 comment cold be placed, I would think.

You are right, I tried it and it works

