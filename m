Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D5D9CD529
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 02:51:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836875.1252782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBlTJ-0006Jr-6W; Fri, 15 Nov 2024 01:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836875.1252782; Fri, 15 Nov 2024 01:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBlTJ-0006GL-22; Fri, 15 Nov 2024 01:50:05 +0000
Received: by outflank-mailman (input) for mailman id 836875;
 Fri, 15 Nov 2024 01:50:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pz6t=SK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tBlTH-0005to-6e
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 01:50:03 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb651846-a2f3-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 02:49:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AA338A41D7C;
 Fri, 15 Nov 2024 01:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10706C4CECD;
 Fri, 15 Nov 2024 01:49:55 +0000 (UTC)
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
X-Inumbo-ID: eb651846-a2f3-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6ImViNjUxODQ2LWEyZjMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjM1Mzk5LjAwNzIyMSwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731635397;
	bh=W+uSnvfdxgMv+XEtpGOv4muS1loNZJX6vqlTV7w4l9s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rQ/1YalwW8d2w6blHdHg4p/+qLOyJw1JOZC6690e4+cENi1T80XnJtM+qA4EMzomp
	 sZyRQYyK+0u1Zl58fQ2ROm1QkgOxkzsoIJbNTS+kF8sfAGWyYUYO7UwyVpbt3eoI6Y
	 JsWRxG1KCxpLh92+Es/MpxOmVXWyTlyzYt64Pc7/fybGv119pzJMBCmOdzFn694trC
	 VSZAVg24+9n7qKUAL5Iywm84MgGAM3dWabNoEjU+loDOrzdC+t03FEvyWAyPRh0/dT
	 anB07/n24fK6ltPqTaXM/3Wa1yzsSe0Rc33GB33lDPUtD9K53FlwQMSfDLPRBKChZ8
	 Y3kkiC3Vs25Tw==
Date: Thu, 14 Nov 2024 17:49:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen/multicall: Change nr_calls to uniformly be
 unsigned long
In-Reply-To: <318c3af2-6233-4778-9fe9-2f9397025039@suse.com>
Message-ID: <alpine.DEB.2.22.394.2411141749410.1160299@ubuntu-linux-20-04-desktop>
References: <20240621205800.329230-1-andrew.cooper3@citrix.com> <20240621205800.329230-3-andrew.cooper3@citrix.com> <660fc551-c6bc-456f-8e9e-80b3e592fece@suse.com> <alpine.DEB.2.22.394.2411121912400.222505@ubuntu-linux-20-04-desktop>
 <35b585a0-7d19-4b02-8ad6-90c7df3ae6ac@suse.com> <alpine.DEB.2.22.394.2411131825400.222505@ubuntu-linux-20-04-desktop> <318c3af2-6233-4778-9fe9-2f9397025039@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Nov 2024, Jan Beulich wrote:
> On 14.11.2024 03:34, Stefano Stabellini wrote:
> > On Wed, 13 Nov 2024, Jan Beulich wrote:
> >> On 13.11.2024 04:15, Stefano Stabellini wrote:
> >>> It is challenging to create a solution that satisfies everyone for this
> >>> patch. However, we should add R8.3 to the clean list as soon as possible
> >>> to enable rule blocking in GitLab-CI. Failing to do so risks introducing
> >>> regressions, as recently occurred, undoing the significant efforts made
> >>> by Bugseng and the community over the past year.
> >>>
> >>> Unless there is a specific counterproposal, let us proceed with
> >>> committing this patch.
> >>
> >> Well, I find this odd. We leave things sit in limbo for months and then
> >> want to go ahead with a controversial solution? Rather than actually
> >> (and finally) sorting out the underlying disagreement (of which there
> >> are actually two sufficiently separate parts)? Plus ...
> > 
> > The reason is that several MISRA regressions were recently introduced.
> > These regressions could have been easily detected by GitLab CI if we had
> > marked the rules as clean. I believe we should expedite accepting the
> > fixes and marking the rules as clean. We can always adjust the fixes or
> > deviations later to better suit our preferences. In my opinion, we
> > should prioritize marking the rules as clean.
> > 
> > 
> >>> On Mon, 24 Jun 2024, Jan Beulich wrote:
> >>>> On 21.06.2024 22:58, Andrew Cooper wrote:
> >>>>> Right now, the non-compat declaration and definition of do_multicall()
> >>>>> differing types for the nr_calls parameter.
> >>>>>
> >>>>> This is a MISRA rule 8.3 violation, but it's also time-bomb waiting for the
> >>>>> first 128bit architecture (RISC-V looks as if it might get there first).
> >>>>>
> >>>>> Worse, the type chosen here has a side effect of truncating the guest
> >>>>> parameter, because Xen still doesn't have a clean hypercall ABI definition.
> >>>>>
> >>>>> Switch uniformly to using unsigned long.
> >>>>
> >>>> And re-raising all the same question again: Why not uniformly unsigned int?
> >>>> Or uint32_t?
> >>
> >> ... this question of mine effectively represents a concrete alternative
> >> proposal (or even two, if you like).
> >>
> >> The two parts where there appears to be disagreement are:
> >> 1) When to (not) use fixed width types, as presently outlined in
> >>    ./CODING_STYLE.
> >> 2) How to type C function parameters called solely from assembly code (of
> >>    which the hypercall handlers are a subset).
> >>
> >> And maybe
> >> 2b) How to best express such function parameters when they're (sometimes)
> >>     shared between native and compat handlers.
> >>
> >> Of course 2) is affected by, as Andrew validly says, there not being a
> >> formally clean ABI definition.
> >>
> >> My fear is that if this gets committed as is, it'll be used as a handle to
> >> force in further similarly questionable / controversial changes to other
> >> hypercall handlers. Which is why I think the controversy needs sorting out
> >> first (which admittedly is hard when the ABI is fuzzy).
> > 
> > While I appreciate your concern, as you know, aligning on the topics
> > above takes time. I do not believe it is in the interest of the
> > community, both contributors and reviewers, to delay marking this rule
> > as clean. Honestly, I do not mind how it gets marked as clean, as long
> > as we do it soon.
> > 
> > Additionally, please keep in mind that the Xen Project tends to have a
> > long memory. As a result, there is usually little risk of the so-called
> > "slippery slope" problem.
> > 
> > If you prefer a deviation I am OK with that too. I just want 8.3 as
> > clean :-) 
> 
> No, please no deviations when we can avoid them. Since it feels like it's
> always (going to be?) me to give in when there is such disagreement, why
> don't I do so here as well: Go ahead.

Thanks Jan, I really appreciate this

