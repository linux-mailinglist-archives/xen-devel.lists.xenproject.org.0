Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7CE87D79B
	for <lists+xen-devel@lfdr.de>; Sat, 16 Mar 2024 01:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694118.1083016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlI9f-0003n5-Pd; Sat, 16 Mar 2024 00:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694118.1083016; Sat, 16 Mar 2024 00:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlI9f-0003lD-Mp; Sat, 16 Mar 2024 00:44:07 +0000
Received: by outflank-mailman (input) for mailman id 694118;
 Sat, 16 Mar 2024 00:44:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e312=KW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rlI9e-0003l7-FF
 for xen-devel@lists.xenproject.org; Sat, 16 Mar 2024 00:44:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 487cab6e-e32e-11ee-a1ee-f123f15fe8a2;
 Sat, 16 Mar 2024 01:44:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 48D2B616F9;
 Sat, 16 Mar 2024 00:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF22C433F1;
 Sat, 16 Mar 2024 00:43:59 +0000 (UTC)
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
X-Inumbo-ID: 487cab6e-e32e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710549840;
	bh=QE5XGarWmoRSKRE8AAfh+YEqBZRH8OunkXGkNAfGg78=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nARYcesV8NaOJ2Fjh/Lj84aDxeGFQGG++Mb/HoDMQK2Ypp5HuebvStA1UmqeGD+rB
	 zbWiI4bupGfK90PSXsctVbLufwMebf978Z9ZAIugkdAIqBwOZk619MKyLcW/ExX6Cj
	 Dwy1TSz/44OypTJa5Oq99s35JyLpou1a/wqw6S1k5qye+Zu+dsqxVe0fWTdjjGRF7D
	 Gy4L0EgrX7Wq5ifhgk9mb3YUScMzg0UGnRsHKFqkvzCGqbeFMrmhFjsr4d9EZHlw9M
	 J4ivBUXRepqB/LYYO1eBiqpnWGpJqs/ucj6wwlyGsu+Okw2Hwsiyt4rK4G5vrvQzC4
	 e2tJ13AOus7BQ==
Date: Fri, 15 Mar 2024 17:43:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org, 
    Simone Ballarin <simone.ballarin@bugseng.com>
Subject: Re: [XEN PATCH v3 03/16] misra: add deviations for direct inclusion
 guards
In-Reply-To: <077c0373-6eec-4403-b31e-574c8e8ae067@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403151738160.853156@ubuntu-linux-20-04-desktop>
References: <cover.1710145041.git.simone.ballarin@bugseng.com> <1fdfec12fd2207c294f50d01d8ec32f890b915d7.1710145041.git.simone.ballarin@bugseng.com> <adeb5103-81b4-4f04-9ff6-a0526c8065db@suse.com> <6472eb42-157a-4d6e-b5bb-daa74fbbd97b@bugseng.com>
 <a9f85f2b-3eae-4544-88dd-6984011f0ef9@suse.com> <3e4bb597-3624-418e-93d0-b95042fd27a7@bugseng.com> <alpine.DEB.2.22.394.2403141559270.853156@ubuntu-linux-20-04-desktop> <077c0373-6eec-4403-b31e-574c8e8ae067@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Mar 2024, Jan Beulich wrote:
> On 14.03.2024 23:59, Stefano Stabellini wrote:
> > On Mon, 11 Mar 2024, Simone Ballarin wrote:
> >> On 11/03/24 14:56, Jan Beulich wrote:
> >>> On 11.03.2024 13:00, Simone Ballarin wrote:
> >>>> On 11/03/24 11:08, Jan Beulich wrote:
> >>>>> On 11.03.2024 09:59, Simone Ballarin wrote:
> >>>>>> --- a/xen/arch/arm/include/asm/hypercall.h
> >>>>>> +++ b/xen/arch/arm/include/asm/hypercall.h
> >>>>>> @@ -1,3 +1,4 @@
> >>>>>> +/* SAF-5-safe direct inclusion guard before */
> >>>>>>    #ifndef __XEN_HYPERCALL_H__
> >>>>>>    #error "asm/hypercall.h should not be included directly - include
> >>>>>> xen/hypercall.h instead"
> >>>>>>    #endif
> >>>>>> --- a/xen/arch/x86/include/asm/hypercall.h
> >>>>>> +++ b/xen/arch/x86/include/asm/hypercall.h
> >>>>>> @@ -2,6 +2,7 @@
> >>>>>>     * asm-x86/hypercall.h
> >>>>>>     */
> >>>>>>    +/* SAF-5-safe direct inclusion guard before */
> >>>>>>    #ifndef __XEN_HYPERCALL_H__
> >>>>>>    #error "asm/hypercall.h should not be included directly - include
> >>>>>> xen/hypercall.h instead"
> >>>>>>    #endif
> >>>>>
> >>>>> Iirc it was said that this way checking for correct guards is suppressed
> >>>>> altogether in Eclair, which is not what we want. Can you clarify this,
> >>>>> please?
> >>>>>
> >>>>
> >>>> My first change was moving this check inside the guard.
> >>>> You commented my patch saying that this would be an error because someone
> >>>> can
> >>>> include it directly if it has already been included indirectly.
> >>>> I replied telling that this was the case also before the change.
> >>>> You agreed with me, and we decided that the correct thing would be fixing
> >>>> the
> >>>> check and not apply my temporary change to address the finding.
> >>>>
> >>>> Considering that the code should be amended, a SAF deviation seems to me
> >>>> the most appropriate way for suppressing these findings.
> >>>
> >>> Since I don't feel your reply addresses my question, asking differently:
> >>> With
> >>> your change in place, will failure to have proper guards (later) in these
> >>> headers still be reported by Eclair?
> >>
> >> No, if you put something between the check and the guard,
> >> no violation will be reported.
> > 
> > From this email exchange I cannot under if Jan is OK with this patch or
> > not.
> 
> Whether I'm okay(ish) with the patch here depends on our position towards
> the lost checking in Eclair mentioned above. To me it still looks relevant
> that checking for a guard occurs, even if that isn't first in a file for
> some specific reason.

More checking is better than less checking, but if we cannot find a
simple and actionable way forward on this violation, deviating it is
still a big improvement because it allows us to enable the ECLAIR Dir
4.10 checks in xen.git overall (which again goes back to more checking
is better than less checking). 

Do you have a simple alternative suggestion? If not, this is still an
improvement.

