Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5C6871279
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 02:50:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688558.1072840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhJwA-0007wG-2A; Tue, 05 Mar 2024 01:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688558.1072840; Tue, 05 Mar 2024 01:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhJw9-0007ts-UF; Tue, 05 Mar 2024 01:49:45 +0000
Received: by outflank-mailman (input) for mailman id 688558;
 Tue, 05 Mar 2024 01:49:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49dx=KL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rhJw8-0007tm-JE
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 01:49:44 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1e67385-da92-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 02:49:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BD247CE0221;
 Tue,  5 Mar 2024 01:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A088CC433C7;
 Tue,  5 Mar 2024 01:49:37 +0000 (UTC)
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
X-Inumbo-ID: a1e67385-da92-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709603379;
	bh=tghHVhCBl0yGVtdevgFGm/Tc2ZH2+DFLIe9oQckKlsc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WhoBa7LOeExYXabVeu0VqIELUzV75DBahYk7q2bFWDMmdtKUplDKai6SLH0XD54QR
	 F/QbYnalLxxMI0zZkNs9WSvREWOGsOYY/Hq6wcu3ZGACeeYyyK44WCvrtrpwCIUo4K
	 /ovXmRoD0y12fKbTMlfpKuv1DF1wJ8/fCHkHeC/nra+Gi+oRUZvXJ2Rs3ybKsnM4ej
	 3g2T1sXTnexOIrW56e24zn3ERd/lWVNUIfnmCAj+FuUpoi2dvRuivBjaXB1yJy9v5U
	 G0AoDm6YLZ81a4QdsyfXR9efnRL20f0a5iGab12S/HjQ7FxCQseis5mg81PtsDyj9R
	 8kznca4+gE42Q==
Date: Mon, 4 Mar 2024 17:49:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org, 
    bertrand.marquis@arm.com, roger.pau@citrix.com, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    roberto.bagnara@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/3] docs/misra/rules.rst: add rule 5.5
In-Reply-To: <8e5d4c48-558d-40e2-851a-3eb6bfa5dbfe@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403041748150.853156@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop> <20240213223334.3693410-2-stefano.stabellini@amd.com> <50719397-b053-43e1-9cf7-cc9eae9098ed@suse.com> <40b7465f-4966-43c7-8db3-e28a6cc48445@bugseng.com>
 <2da73259-a86e-4a13-9fd4-4217372f4b76@suse.com> <3632611e-61ff-455a-9cc1-990a1f663d83@bugseng.com> <alpine.DEB.2.22.394.2402291528230.853156@ubuntu-linux-20-04-desktop> <e3c894d5-4d7b-426c-bf1a-536b4f1f83ce@suse.com> <da1446d6-b248-4c68-8302-2179dbe09987@bugseng.com>
 <7747cb81-8fdb-4a5f-bfd1-c6c9bdb6039a@suse.com> <a2a90115-762a-497c-8de3-95b6d14ab9e2@bugseng.com> <8e5d4c48-558d-40e2-851a-3eb6bfa5dbfe@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Mar 2024, Jan Beulich wrote:
> On 04.03.2024 16:39, Federico Serafini wrote:
> > On 04/03/24 15:17, Jan Beulich wrote:
> >> On 04.03.2024 14:31, Federico Serafini wrote:
> >>> On 01/03/24 09:06, Jan Beulich wrote:
> >>>> On 01.03.2024 00:28, Stefano Stabellini wrote:
> >>>>> On Wed, 14 Feb 2024, Federico Serafini wrote:
> >>>>>> On 14/02/24 14:15, Jan Beulich wrote:
> >>>>>>> On 14.02.2024 12:27, Federico Serafini wrote:
> >>>>>>>> On 14/02/24 09:28, Jan Beulich wrote:
> >>>>>>>>> On 13.02.2024 23:33, Stefano Stabellini wrote:
> >>>>>>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >>>>>>>>>> ---
> >>>>>>>>>>      docs/misra/rules.rst | 6 ++++++
> >>>>>>>>>>      1 file changed, 6 insertions(+)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> >>>>>>>>>> index c185366966..931158b354 100644
> >>>>>>>>>> --- a/docs/misra/rules.rst
> >>>>>>>>>> +++ b/docs/misra/rules.rst
> >>>>>>>>>> @@ -181,6 +181,12 @@ maintainers if you want to suggest a change.
> >>>>>>>>>>             headers (xen/include/public/) are allowed to retain longer
> >>>>>>>>>>             identifiers for backward compatibility.
> >>>>>>>>>>      +   * - `Rule 5.5
> >>>>>>>>>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
> >>>>>>>>>> +     - Required
> >>>>>>>>>> +     - Identifiers shall be distinct from macro names
> >>>>>>>>>> +     - Clashes between function-like macros and non-callable entities
> >>>>>>>>>> +       are allowed. The pattern #define x x is also allowed.
> >>>>>>>>>
> >>>>>>>>> Just for me to know what exactly is covered (hence also a question
> >>>>>>>>> to Roberto as to [to be] implemented Eclair behavior): Even when
> >>>>>>>>> the above would be sufficient (and imo better) people frequently
> >>>>>>>>> write
> >>>>>>>>>
> >>>>>>>>> #define a(x, y) b(x, y)
> >>>>>>>>>
> >>>>>>>>> which, transformed to the specific case here, would then be
> >>>>>>>>>
> >>>>>>>>> #define a(x, y) a(x, y)
> >>>>>>>>>
> >>>>>>>>> I'd assume such ought to also be covered, but that's not clear
> >>>>>>>>> from the spelling above.
> >>>>>>>>
> >>>>>>>> I list what happens in some different situations,
> >>>>>>>> then we can find the right words for the documentation and/or
> >>>>>>>> refine the configuration:
> >>>>>>>>
> >>>>>>>> If you
> >>>>>>>> #define x x
> >>>>>>>> and then use `x' as identifier,
> >>>>>>>> the resulting violation is deviated (allowed pattern).
> >>>>>>>>
> >>>>>>>> If you
> >>>>>>>> #define a(x, y) a(x, y)
> >>>>>>>> and then use `a' as identifier for a non-callable entity,
> >>>>>>>> the resulting violation is deviated (no clash with non-callable
> >>>>>>>> entities).
> >>>>>>>> If you use identifier `a' for a callable entity, the resulting violation
> >>>>>>>> is reported: the allowed pattern covers only macros expanding to their
> >>>>>>>> own name, in this case the macro name is considered to be
> >>>>>>>> `a' only, not a(x, y).
> >>>>>>>>
> >>>>>>>> If you
> >>>>>>>> #define a(x, y) b(x, y)
> >>>>>>>> and then use `a' as identifier for a non-callable entity,
> >>>>>>>> the resulting violation is deviated (no clash with non-callable
> >>>>>>>> entities).
> >>>>>>>
> >>>>>>> I'm afraid I don't see what violation there is in this case, to
> >>>>>>> deviate. As a result I'm also not sure I correctly understand the
> >>>>>>> rest of your reply.
> >>>>>>
> >>>>>> #define a(x, y) b(x, y)
> >>>>>>
> >>>>>> int a; // Violation of Rule 5.5.
> >>>>>>
> >>>>>> The macro name `a' that exist before the preprocessing phase,
> >>>>>> still exists after the preprocessing phase as identifier for the integer
> >>>>>> variable and this is a violation.
> >>>>>>
> >>>>>>>> If you use `a' as identifier for a callable entity,
> >>>>>>>> this is not a violation because after the preprocessing phase,
> >>>>>>>> identifier `a' no longer exists.
> >>>>>> I correct myself:
> >>>>>> if you use `a' as identifier for a *function*,
> >>>>>> it is not a violation because after the preprocessing phase
> >>>>>> the identifier `a' no longer exists, for example:
> >>>>>>
> >>>>>> #define a(x, y) b(x, y)
> >>>>>>
> >>>>>> void a(int x, int y); // Ok.
> >>>>>
> >>>>> Federico, do you have a better wording suggestion for this rule?
> >>>>>
> >>>>> Jan, any further requests here? What would you like to see as next step?
> >>>>
> >>>> A more concise wording proposal would probably help.
> >>>
> >>> What do you think about:
> >>>
> >>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> >>> index 1e134ccebc..a975b9a85f 100644
> >>> --- a/docs/misra/rules.rst
> >>> +++ b/docs/misra/rules.rst
> >>> @@ -181,6 +181,13 @@ maintainers if you want to suggest a change.
> >>>           headers (xen/include/public/) are allowed to retain longer
> >>>           identifiers for backward compatibility.
> >>>
> >>> +   * - `Rule 5.5
> >>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
> >>> +     - Required
> >>> +     - Identifiers shall be distinct from macro names
> >>> +     - Macros expanding to their own name are allowed (e.g., #define x x).
> >>> +       Clashes between names of function-like macros and identifiers of
> >>> +       non-callable entities are allowed.
> >>
> >> Imo that still leaves open e.g. the
> >>
> >> #define a(x, y) a(x, y)
> >>
> >> case: Permitted ("own name") or not permitted ("a" pretty clearly is expected
> >> to be a callable entity here, besides being a function-like macro)?
> > 
> > I would not consider your example as a macro that expands to its own
> > name, the macro name is considered to be `a' only.
> 
> That's what I was assuming, and hence my asking back. I think the
> above ought to be permitted just like "#define x x", and hence the
> suggested text would need expanding, to ...
> 
> > Rather, you example can be used to trigger the "callable-noncallable"
> > part of the deviation, for example:
> > 
> > #define a(x, y) a(x, y)
> > 
> > void a(int x, int y); /* Not permitted (callable entity 'a'). */
> 
> ... prevent this ("not permitted") from happening. I'm pretty sure
> you've already found instances of this pattern in our code base.

Sorry Jan, purely asking as a clarification because I couldn't
understand what you wrote.

You are asking for a clarification in the wording so that the following
is explicitly allowed, right?

#define a(x, y) a(x, y)
void a(int x, int y);

