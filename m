Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5D287F611
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 04:34:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695198.1084770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmQF2-0005Xf-2m; Tue, 19 Mar 2024 03:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695198.1084770; Tue, 19 Mar 2024 03:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmQF1-0005W7-Vr; Tue, 19 Mar 2024 03:34:19 +0000
Received: by outflank-mailman (input) for mailman id 695198;
 Tue, 19 Mar 2024 03:34:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0xd=KZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rmQF0-0005Vz-N9
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 03:34:18 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f6a3970-e5a1-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 04:34:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7A69ECE0121;
 Tue, 19 Mar 2024 03:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1220C433C7;
 Tue, 19 Mar 2024 03:34:11 +0000 (UTC)
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
X-Inumbo-ID: 8f6a3970-e5a1-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710819253;
	bh=yYNG7cSPbnmEtmB+CRtd2MkjfHvFqvox03ay3lIvpRE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dsfmPD9KVhpUxgxxk5Uae1JTJy+vAtXBblzk3M57vqudh9A9Lfm/da1afSwEMHhlH
	 D9WBNwSTUdNNi6PEGJXozXutle+GGBqay7wyC9VQjlGxGa4zkHo3KLAzF7ehouR10F
	 YgZES0nniSotFMwDRQxtEcvAwVQJGfA0xWHRC37TjJ1yKHl2j9l1SzCylqQYImKtOq
	 X5U4I9HMML6T7QJKLt4Wc5xSFNbUGJq9QX/XqHLwxDLzdsYYoRGtqjnY7bkZhB0+u5
	 b6YzKq6rDzLw6nab2g4KKMDe1TVVVjEGAGavsHiqKE2+byUTjrPneC31t3fFIzeIRg
	 WtI3NDahXcKpA==
Date: Mon, 18 Mar 2024 21:34:10 -0600 (MDT)
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
In-Reply-To: <0513e505-5444-4a9f-9a77-ec9f359ddf27@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403181732010.853156@ubuntu-linux-20-04-desktop>
References: <cover.1710145041.git.simone.ballarin@bugseng.com> <1fdfec12fd2207c294f50d01d8ec32f890b915d7.1710145041.git.simone.ballarin@bugseng.com> <adeb5103-81b4-4f04-9ff6-a0526c8065db@suse.com> <6472eb42-157a-4d6e-b5bb-daa74fbbd97b@bugseng.com>
 <a9f85f2b-3eae-4544-88dd-6984011f0ef9@suse.com> <3e4bb597-3624-418e-93d0-b95042fd27a7@bugseng.com> <alpine.DEB.2.22.394.2403141559270.853156@ubuntu-linux-20-04-desktop> <077c0373-6eec-4403-b31e-574c8e8ae067@suse.com> <alpine.DEB.2.22.394.2403151738160.853156@ubuntu-linux-20-04-desktop>
 <0513e505-5444-4a9f-9a77-ec9f359ddf27@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Mar 2024, Jan Beulich wrote:
> On 16.03.2024 01:43, Stefano Stabellini wrote:
> > On Fri, 15 Mar 2024, Jan Beulich wrote:
> >> On 14.03.2024 23:59, Stefano Stabellini wrote:
> >>> On Mon, 11 Mar 2024, Simone Ballarin wrote:
> >>>> On 11/03/24 14:56, Jan Beulich wrote:
> >>>>> On 11.03.2024 13:00, Simone Ballarin wrote:
> >>>>>> On 11/03/24 11:08, Jan Beulich wrote:
> >>>>>>> On 11.03.2024 09:59, Simone Ballarin wrote:
> >>>>>>>> --- a/xen/arch/arm/include/asm/hypercall.h
> >>>>>>>> +++ b/xen/arch/arm/include/asm/hypercall.h
> >>>>>>>> @@ -1,3 +1,4 @@
> >>>>>>>> +/* SAF-5-safe direct inclusion guard before */
> >>>>>>>>    #ifndef __XEN_HYPERCALL_H__
> >>>>>>>>    #error "asm/hypercall.h should not be included directly - include
> >>>>>>>> xen/hypercall.h instead"
> >>>>>>>>    #endif
> >>>>>>>> --- a/xen/arch/x86/include/asm/hypercall.h
> >>>>>>>> +++ b/xen/arch/x86/include/asm/hypercall.h
> >>>>>>>> @@ -2,6 +2,7 @@
> >>>>>>>>     * asm-x86/hypercall.h
> >>>>>>>>     */
> >>>>>>>>    +/* SAF-5-safe direct inclusion guard before */
> >>>>>>>>    #ifndef __XEN_HYPERCALL_H__
> >>>>>>>>    #error "asm/hypercall.h should not be included directly - include
> >>>>>>>> xen/hypercall.h instead"
> >>>>>>>>    #endif
> >>>>>>>
> >>>>>>> Iirc it was said that this way checking for correct guards is suppressed
> >>>>>>> altogether in Eclair, which is not what we want. Can you clarify this,
> >>>>>>> please?
> >>>>>>>
> >>>>>>
> >>>>>> My first change was moving this check inside the guard.
> >>>>>> You commented my patch saying that this would be an error because someone
> >>>>>> can
> >>>>>> include it directly if it has already been included indirectly.
> >>>>>> I replied telling that this was the case also before the change.
> >>>>>> You agreed with me, and we decided that the correct thing would be fixing
> >>>>>> the
> >>>>>> check and not apply my temporary change to address the finding.
> >>>>>>
> >>>>>> Considering that the code should be amended, a SAF deviation seems to me
> >>>>>> the most appropriate way for suppressing these findings.
> >>>>>
> >>>>> Since I don't feel your reply addresses my question, asking differently:
> >>>>> With
> >>>>> your change in place, will failure to have proper guards (later) in these
> >>>>> headers still be reported by Eclair?
> >>>>
> >>>> No, if you put something between the check and the guard,
> >>>> no violation will be reported.
> >>>
> >>> From this email exchange I cannot under if Jan is OK with this patch or
> >>> not.
> >>
> >> Whether I'm okay(ish) with the patch here depends on our position towards
> >> the lost checking in Eclair mentioned above. To me it still looks relevant
> >> that checking for a guard occurs, even if that isn't first in a file for
> >> some specific reason.
> > 
> > More checking is better than less checking, but if we cannot find a
> > simple and actionable way forward on this violation, deviating it is
> > still a big improvement because it allows us to enable the ECLAIR Dir
> > 4.10 checks in xen.git overall (which again goes back to more checking
> > is better than less checking). 
> 
> You have a point here. I think though that at the very least the lost
> checking opportunity wants calling out quite explicitly.

All right, then maybe this patch can go in with a clarification in the
commit message?

Something like:

Note that with SAF-5-safe in place, failures to have proper guards later
in the header files will not be reported


> > Do you have a simple alternative suggestion? If not, this is still an
> > improvement.
> 
> I don't know the inner workings of Eclair. Without that I'm afraid I'm not
> in a position to make alternative suggestions.
 

