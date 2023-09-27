Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61477B0FAD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 01:53:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609192.948130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qleLa-00045a-4s; Wed, 27 Sep 2023 23:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609192.948130; Wed, 27 Sep 2023 23:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qleLa-00043E-27; Wed, 27 Sep 2023 23:53:38 +0000
Received: by outflank-mailman (input) for mailman id 609192;
 Wed, 27 Sep 2023 23:53:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hjpc=FL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qleLY-0003cO-67
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 23:53:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10f4975c-5d91-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 01:53:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AD75B619E8;
 Wed, 27 Sep 2023 23:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080F7C433C7;
 Wed, 27 Sep 2023 23:53:30 +0000 (UTC)
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
X-Inumbo-ID: 10f4975c-5d91-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695858812;
	bh=iKQSm+yuzdevAwQLBdmpZzt613vfc4wD8oRwVjtAE+Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AOBARUHZ+mFAAFSFZZCqRpFsYXs5K2Jwsjb/bKXqj162khQ25hbIHA2ZltFYcXeQO
	 LJQv0ly4dM91L9S5wgMEeiXSyf6YL01PC8YLVYfCEmdQkzihd+rgpWVov8uph8/KEK
	 4+5Hy/U0LLcDFbibe9wRdNBJ1DvCrqX6dqrEBdJyReJgrXddHODXZcVPv06fLSUNDt
	 TroNp9vgPJSpliY8bhfLYrKd4K+QwVDznEz44v18MLMwGYRBC9YYYPXJbDbh44Xwtj
	 EtSzTxfJTBWaZbhe+AC1uUOM8EHbLnpElnheIeWd0IJrk1UgD4a0IA5CboANC5V0RE
	 Ltyfr6MbUOckA==
Date: Wed, 27 Sep 2023 16:53:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry.Wang@arm.com
cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org, 
    george.dunlap@citrix.com, bertrand.marquis@arm.com, 
    roberto.bagnara@bugseng.com, nicola.vetrini@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] docs/misra: add 14.3
In-Reply-To: <alpine.DEB.2.22.394.2309271649120.1403502@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2309271653110.1403502@ubuntu-linux-20-04-desktop>
References: <20230908202723.1641469-1-sstabellini@kernel.org> <alpine.DEB.2.22.394.2309271649120.1403502@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Actually adding Henry

On Wed, 27 Sep 2023, Stefano Stabellini wrote:
> Hi Henry,
> 
> This patch is now acked. Should it go in 4.18?
> 
> In terms of risk of breaking, it is zero as nothing builds or runs based
> on this document.
> 
> At the same time, the benefit is also low because the main value of this
> document is for future coding changes that would be too late now for
> 4.18. So the benefits of committing it now are ease of keeping track of
> the change and positive PR when we make the 4.18 release and we talk
> about the total number of MISRA C rules we adopted.
> 
> 
> 
> On Fri, 8 Sep 2023, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > Add 14.3, with project-wide deviations.
> > 
> > Also take the opportunity to clarify that parameters of function pointer
> > types are expected to have names (Rule 8.2).
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > Changes in v3:
> > - add ,
> > - add switch(sizeof(...)) and switch(offsetof(...))
> > ---
> >  docs/misra/rules.rst | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > index 34916e266a..ac76e20a9c 100644
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -234,7 +234,8 @@ maintainers if you want to suggest a change.
> >     * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_02.c>`_
> >       - Required
> >       - Function types shall be in prototype form with named parameters
> > -     -
> > +     - Clarification: both function and function pointers types shall
> > +       have named parameters.
> >  
> >     * - `Rule 8.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_03.c>`_
> >       - Required
> > @@ -385,6 +386,18 @@ maintainers if you want to suggest a change.
> >       - A loop counter shall not have essentially floating type
> >       -
> >  
> > +   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
> > +     - Required
> > +     - Controlling expressions shall not be invariant
> > +     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
> > +       checks, and other constructs that are detected as errors by MISRA
> > +       C scanners, managing the configuration of a MISRA C scanner for
> > +       this rule would be unmanageable. Thus, this rule is adopted with
> > +       a project-wide deviation on if, ?:, switch(sizeof(...)), and
> > +       switch(offsetof(...)) statements.
> > +
> > +       while(0) and while(1) and alike are allowed.
> > +
> >     * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
> >       - Required
> >       - A switch-expression shall not have essentially Boolean type
> > -- 
> > 2.25.1
> > 
> 

