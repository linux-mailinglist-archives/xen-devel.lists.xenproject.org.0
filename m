Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25271943982
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 01:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769190.1180081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZJ5V-0001JH-4S; Wed, 31 Jul 2024 23:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769190.1180081; Wed, 31 Jul 2024 23:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZJ5V-0001HO-1r; Wed, 31 Jul 2024 23:50:33 +0000
Received: by outflank-mailman (input) for mailman id 769190;
 Wed, 31 Jul 2024 23:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sZJ5T-0001HI-9o
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 23:50:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa3f56c7-4f97-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 01:50:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 44D896258C;
 Wed, 31 Jul 2024 23:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A69C116B1;
 Wed, 31 Jul 2024 23:50:26 +0000 (UTC)
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
X-Inumbo-ID: aa3f56c7-4f97-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722469828;
	bh=3OWwBdL1Ybs3HeunaI06xAEPucJ9zvpO+S7OZuXuDBk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ro17kujiE8CS464t/m9sFziv5KH5aDIzBfSi8uajkKoJzCk9qh7c6XpOzxm2sUzNQ
	 ENYQx2FbDcQVYfT0BFWo6zWDjUTvbpwtOaw9pv9yPFk64N96CAyps02hBVOgavkQjL
	 3TVuIpungq3RWaafN4V4jD+E0PA0c0HLnnib090Wq/DiCIF8WMlzhTnu3HNPud6R/X
	 0bo+whQ8lg2XXki9wVECG80tWCf+ohGoDsfhkWd+jNIiM95KEtIupumqU8gyomGum2
	 tFwnKTYFod6Br+29IN460eZo4bZsfU2x5OEw1lLq/KBTKgFFQ5xrc67VrDRy8SnJLa
	 1tXWbS5vGPnDw==
Date: Wed, 31 Jul 2024 16:50:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add R13.2 and R18.2 to rules.rst
In-Reply-To: <6575beb5-645a-470a-89a1-8485adeace60@suse.com>
Message-ID: <alpine.DEB.2.22.394.2407311647170.4857@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2407301626460.4857@ubuntu-linux-20-04-desktop> <6575beb5-645a-470a-89a1-8485adeace60@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Jul 2024, Jan Beulich wrote:
> On 31.07.2024 01:30, Stefano Stabellini wrote:
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -462,6 +462,15 @@ maintainers if you want to suggest a change.
> >       - Initializer lists shall not contain persistent side effects
> >       -
> >  
> > +   * - `Rule 13.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_02.c>`_
> > +     - Required
> > +     - The value of an expression and its persistent side-effects shall
> > +       be the same under all permitted evaluation orders
> > +     - Be aware that the static analysis tool Eclair might report
> > +       several findings for Rule 13.2 of type "caution". These are
> > +       instances where Eclair is unable to verify that the code is valid
> > +       in regard to Rule 13.2. Caution reports are not violations.
> 
> Which doesn't make clear what our take is towards new code people may
> submit.

Good point, see my comment below


> > @@ -583,6 +592,15 @@ maintainers if you want to suggest a change.
> >         submitting new patches please try to decrease the number of
> >         violations when possible.
> >  
> > +   * - `Rule 18.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_02.c>`_
> > +     - Required
> > +     - Subtraction between pointers shall only be applied to pointers
> > +       that address elements of the same array
> > +     - Be aware that the static analysis tool Eclair might report
> > +       several findings for Rule 18.2 of type "caution". These are
> > +       instances where Eclair is unable to verify that the code is valid
> > +       in regard to Rule 18.2. Caution reports are not violations.
> 
> And while the same wording is used here, I think it is pretty clear for
> this that we'd reject changes where bad subtractions are used. IOW even
> more so important to clarify the (possibly different) positions on what
> is going to be added into the code base.

In both of these cases, we would reject code that doesn't follow R13.2
and R18.2. I'll change it to the following:


Be aware that the static analysis tool Eclair might report several
findings for Rule 18.2 of type "caution". These are instances where
Eclair is unable to verify that the code is valid in regard to Rule
18.2. Caution reports are not violations. Regardless, new code is
expected to follow this rule.

