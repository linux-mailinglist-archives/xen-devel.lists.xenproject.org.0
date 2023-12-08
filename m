Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8DF8096F1
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 01:09:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650260.1015575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOQG-0000Q2-Ng; Fri, 08 Dec 2023 00:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650260.1015575; Fri, 08 Dec 2023 00:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBOQG-0000Nv-Kx; Fri, 08 Dec 2023 00:08:52 +0000
Received: by outflank-mailman (input) for mailman id 650260;
 Fri, 08 Dec 2023 00:08:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBOQF-0000Np-AY
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 00:08:51 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f62729c7-955d-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 01:08:49 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6B74EB81A45;
 Fri,  8 Dec 2023 00:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F57BC433C8;
 Fri,  8 Dec 2023 00:08:46 +0000 (UTC)
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
X-Inumbo-ID: f62729c7-955d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701994127;
	bh=1Lstv9euzF3GpKNQybHeDvRA5dF5HDoef8qhzVKi1eY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TApoxv7RkAqrzKOLQQmSlzP4imKjRojEIGyHFrQOW8iLUhzZphgAGEK6eMZPMV3+4
	 x1D6cTq0WQeMuEKQQvPD25cAJa+afxBae9IvCYfGzUJT2i25hioqewBTo8CzJsIaDn
	 jXsJmLMUwlLROsmM6DfLxbkHiIfx291dhsx/8SYKE+7TtIChm8U14N0A/34sHNUNaI
	 ry1zAywHZSdc7r/jYomRCHlolZoepvCJmoGe/BM8uATyBIZrYPewVmEcLeqDERm4Go
	 pk2q3npspo4WcC5TJvbU8G3YBKCMpB73Ts7oFhe+yEMHiFQtGsko+B0/1RJ9iyX8wx
	 jqup3rwEBkdaw==
Date: Thu, 7 Dec 2023 16:08:44 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, julien@xen.org, bertrannd.marquis@arm.com, 
    roger.pau@citrix.com, roberto.bagnara@bugseng.com, 
    federico.serafini@bugseng.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra/rules.rst: add more rules
In-Reply-To: <12c7da9c-245e-48b7-98f9-2bf0f29b7621@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312071606000.1265976@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2312051859440.110490@ubuntu-linux-20-04-desktop> <ccdbe84d-24ca-41f0-bc1f-fb9499c73880@suse.com> <alpine.DEB.2.22.394.2312061819090.1265976@ubuntu-linux-20-04-desktop> <12c7da9c-245e-48b7-98f9-2bf0f29b7621@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Jan Beulich wrote:
> On 07.12.2023 03:42, Stefano Stabellini wrote:
> > On Wed, 6 Dec 2023, Jan Beulich wrote:
> >> On 06.12.2023 04:02, Stefano Stabellini wrote:
> >>> --- a/docs/misra/rules.rst
> >>> +++ b/docs/misra/rules.rst
> >>> @@ -462,11 +462,23 @@ maintainers if you want to suggest a change.
> >>>  
> >>>         while(0) and while(1) and alike are allowed.
> >>>  
> >>> +   * - `Rule 16.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_03.c>`_
> >>> +     - Required
> >>> +     - An unconditional break statement shall terminate every
> >>> +       switch-clause
> >>> +     - In addition to break, also other flow control statements such as
> >>> +       continue, return, goto are allowed.
> >>> +
> >>>     * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
> >>>       - Required
> >>>       - A switch-expression shall not have essentially Boolean type
> >>>       -
> >>>  
> >>> +   * - `Rule 17.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_01.c>`_
> >>> +     - Required
> >>> +     - The features of <stdarg.h> shall not be used
> >>> +     -
> >>
> >> Did we really accept this without any constraint (warranting mentioning
> >> here)?
> > 
> > We agreed that in certain situations stdarg.h is OK to use and in those
> > cases we would add a deviation. Would you like me to add something to
> > that effect here? I could do that but it would sound a bit vague.  Also
> > if we want to specify a project-wide deviation it would be better
> > documented in docs/misra/deviations.rst. I would leave Rule 17.1 without
> > a note.
> 
> I can see your point, and I don't have a good suggestion on possible text.
> Still I wouldn't feel well ack-ing this in its present shape.

What about:

     - It is understood that in some limited circumstances <stdarg.h> is
       appropriate to use, such as the implementation of printk. Those
       cases will be dealt with using deviations as usual, see
       docs/misra/deviations.rst and
       docs/misra/documenting-violations.rst.



> >>> @@ -478,12 +490,24 @@ maintainers if you want to suggest a change.
> >>>         have an explicit return statement with an expression
> >>>       -
> >>>  
> >>> +   * - `Rule 17.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_05.c>`_
> >>> +     - Advisory
> >>> +     - The function argument corresponding to a parameter declared to
> >>> +       have an array type shall have an appropriate number of elements
> >>> +     -
> >>> +
> >>>     * - `Rule 17.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_06.c>`_
> >>>       - Mandatory
> >>>       - The declaration of an array parameter shall not contain the
> >>>         static keyword between the [ ]
> >>>       -
> >>>  
> >>> +   * - `Rule 17.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_07.c>`_
> >>> +     - Required
> >>> +     - The value returned by a function having non-void return type
> >>> +       shall be used
> >>> +     -
> >>
> >> Same question here.
> > 
> > Here I was also thinking it might be good to add a comment. Maybe we could
> > add:
> > 
> >      - Please beware that this rule has many violations in the Xen
> >        codebase today, and its adoption is aspirational. However, when
> >        submitting new patches please try to decrease the number of
> >        violations when possible.
> 
> Yea, I think this would be good to add.

I sent out a patch with this addition, and removing Rule 17.1 as that
one is a bit more complicated.

