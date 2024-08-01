Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E39D945278
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 20:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769917.1180786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZa5k-00040b-0e; Thu, 01 Aug 2024 17:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769917.1180786; Thu, 01 Aug 2024 17:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZa5j-0003yp-Tx; Thu, 01 Aug 2024 17:59:55 +0000
Received: by outflank-mailman (input) for mailman id 769917;
 Thu, 01 Aug 2024 17:59:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SIAI=PA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sZa5j-0003yj-6H
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 17:59:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9788a9b-502f-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 19:59:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D05D6293D;
 Thu,  1 Aug 2024 17:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB7BC32786;
 Thu,  1 Aug 2024 17:59:49 +0000 (UTC)
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
X-Inumbo-ID: d9788a9b-502f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722535190;
	bh=AaV8E08fJOUeaK01SwQIJR9LSOTp2AxvAyxxtcAjlmU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hNX7p5V6DGQLE6lU8fSjgWi3B9x8OGYMaYudshTwSaQTQdXIEOTanjfTVIdVOVDZI
	 tdF/gbH9NpYXyj6JSNhblNRo5RlFd9WzJEIi6+oJWZpvyVpsHTW30QmTqSAQmsHDOf
	 tndQvlvhAwM+MSt7AySWra3HMA+JdwsOWAXXANC4uO8NV3nRdbVVqWN0/w3veMXg4x
	 4RN4mOE/ic1JNj0ZDY9xSLlcjX1n9tSgIlZZ8zhjB4aagENq51gQUUU90jxb71RysZ
	 3kDqSCFOg+Euu16rtg0FX9jbB1O1u2psc2+FTCOw3KATXBFuIaSyVQ82L7Mdc+U0dI
	 1kDFjL9IBCSBA==
Date: Thu, 1 Aug 2024 10:59:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add R13.2 and R18.2 to rules.rst
In-Reply-To: <dd463c03-71ca-4333-ac3f-629241b0f9bc@suse.com>
Message-ID: <alpine.DEB.2.22.394.2408011044320.4857@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2407301626460.4857@ubuntu-linux-20-04-desktop> <6575beb5-645a-470a-89a1-8485adeace60@suse.com> <alpine.DEB.2.22.394.2407311647170.4857@ubuntu-linux-20-04-desktop> <dd463c03-71ca-4333-ac3f-629241b0f9bc@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Aug 2024, Jan Beulich wrote:
> On 01.08.2024 01:50, Stefano Stabellini wrote:
> > On Wed, 31 Jul 2024, Jan Beulich wrote:
> >> On 31.07.2024 01:30, Stefano Stabellini wrote:
> >>> --- a/docs/misra/rules.rst
> >>> +++ b/docs/misra/rules.rst
> >>> @@ -462,6 +462,15 @@ maintainers if you want to suggest a change.
> >>>       - Initializer lists shall not contain persistent side effects
> >>>       -
> >>>  
> >>> +   * - `Rule 13.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_02.c>`_
> >>> +     - Required
> >>> +     - The value of an expression and its persistent side-effects shall
> >>> +       be the same under all permitted evaluation orders
> >>> +     - Be aware that the static analysis tool Eclair might report
> >>> +       several findings for Rule 13.2 of type "caution". These are
> >>> +       instances where Eclair is unable to verify that the code is valid
> >>> +       in regard to Rule 13.2. Caution reports are not violations.
> >>
> >> Which doesn't make clear what our take is towards new code people may
> >> submit.
> > 
> > Good point, see my comment below
> > 
> > 
> >>> @@ -583,6 +592,15 @@ maintainers if you want to suggest a change.
> >>>         submitting new patches please try to decrease the number of
> >>>         violations when possible.
> >>>  
> >>> +   * - `Rule 18.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_02.c>`_
> >>> +     - Required
> >>> +     - Subtraction between pointers shall only be applied to pointers
> >>> +       that address elements of the same array
> >>> +     - Be aware that the static analysis tool Eclair might report
> >>> +       several findings for Rule 18.2 of type "caution". These are
> >>> +       instances where Eclair is unable to verify that the code is valid
> >>> +       in regard to Rule 18.2. Caution reports are not violations.
> >>
> >> And while the same wording is used here, I think it is pretty clear for
> >> this that we'd reject changes where bad subtractions are used. IOW even
> >> more so important to clarify the (possibly different) positions on what
> >> is going to be added into the code base.
> > 
> > In both of these cases, we would reject code that doesn't follow R13.2
> > and R18.2.
> 
> But we shouldn't (unconditionally) do so for for 13.2, should we?
> 
> > I'll change it to the following:
> > 
> > 
> > Be aware that the static analysis tool Eclair might report several
> > findings for Rule 18.2 of type "caution". These are instances where
> > Eclair is unable to verify that the code is valid in regard to Rule
> > 18.2. Caution reports are not violations. Regardless, new code is
> > expected to follow this rule.
> 
> I'm fine with this for 18.2, but not so much for 13.2.

Let me clarify something about R13.2. I expect we are aligned on this.

Rule 13.2 only expects that "the value of an expression and its persistent
side-effects shall be the same under all permitted evaluation orders"
and nothing more.

It is an outstanding limitation of static analyzers such as ECLAIR
that they cannot be certain that "the value of an expression and its
persistent side-effects shall be the same under all permitted evaluation
orders". So one way to make ECLAIR happy is to change this code:

1)
func1(param1, func2(a), func3(b);

into this code:

2)
param2 = func2(a);
param3 = func3(b);
func1(param1, param2, param3);

Rule 13.2 is not asking us to change 1) into 2). 1) is acceptable. It is
just that ECLAIR cannot help us ensure that 1) is compliant with Rule
13.2. It is totally fine to accept new code written in the form 1), of
course only if "the value of an expression and its persistent
side-effects shall be the same under all permitted evaluation orders".
It would likely increase the number of ECLAIR cautions, but it is not
necessarily a problem, and the ECLAIR Gitlab job will not fail.

If one of the reviewers discovers that 1) doesn't comply with Rule 13.2
due to manual review, then they should ask the contributor to change the
code. That is a good idea because we wouldn't want the value of an
expression to be dependant on the evaluation order which GCC cannot
guarantee.

