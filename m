Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DA9807ED7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 03:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649528.1014117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB4LW-0005jR-U3; Thu, 07 Dec 2023 02:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649528.1014117; Thu, 07 Dec 2023 02:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB4LW-0005hX-RC; Thu, 07 Dec 2023 02:42:38 +0000
Received: by outflank-mailman (input) for mailman id 649528;
 Thu, 07 Dec 2023 02:42:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QcaE=HS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rB4LV-0005hR-TJ
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 02:42:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 436890e0-94aa-11ee-98e6-6d05b1d4d9a1;
 Thu, 07 Dec 2023 03:42:36 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7CA8161F3F;
 Thu,  7 Dec 2023 02:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D92C433C8;
 Thu,  7 Dec 2023 02:42:26 +0000 (UTC)
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
X-Inumbo-ID: 436890e0-94aa-11ee-98e6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701916948;
	bh=A+nvrEQiQ+HYDC6Xoo4NEI8mdYJ4yNKSnW4nFTS/yTE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=St4o6yr9jbDb6r1mD6P/UP9VFVOTbfAPuNyjXrhr3mDB/znCXZFS6a6OIwBXApjOR
	 MWT1ivTi/DQRZhZK9UPCkiVTzqRvcB16MChrQ60MjLUeA4j2cXeuqEsiDh58EkpXOA
	 Mwal47bRO1pK1u+LQMnNaBkum+Zob/2DtA4RFKqg+briUr7kTKIyiTUorZ15aG2Bht
	 HCsz3AVTJ1Zm1xfeXVSThj/d/YDfOFmMyBCMWujHEyg4Bpu86NeB0whSFLeGpxFA3Z
	 DIzMKgrsIdw65oSWKk6WLHfRbNCS+I+ZnHEDTcO/HtEkAxALMqVJS1g7lMBbMhIrSg
	 Y+OWY9dbc5jfw==
Date: Wed, 6 Dec 2023 18:42:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, julien@xen.org, bertrannd.marquis@arm.com, 
    roger.pau@citrix.com, roberto.bagnara@bugseng.com, 
    federico.serafini@bugseng.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra/rules.rst: add more rules
In-Reply-To: <ccdbe84d-24ca-41f0-bc1f-fb9499c73880@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312061819090.1265976@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2312051859440.110490@ubuntu-linux-20-04-desktop> <ccdbe84d-24ca-41f0-bc1f-fb9499c73880@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Dec 2023, Jan Beulich wrote:
> On 06.12.2023 04:02, Stefano Stabellini wrote:
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -462,11 +462,23 @@ maintainers if you want to suggest a change.
> >  
> >         while(0) and while(1) and alike are allowed.
> >  
> > +   * - `Rule 16.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_03.c>`_
> > +     - Required
> > +     - An unconditional break statement shall terminate every
> > +       switch-clause
> > +     - In addition to break, also other flow control statements such as
> > +       continue, return, goto are allowed.
> > +
> >     * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
> >       - Required
> >       - A switch-expression shall not have essentially Boolean type
> >       -
> >  
> > +   * - `Rule 17.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_01.c>`_
> > +     - Required
> > +     - The features of <stdarg.h> shall not be used
> > +     -
> 
> Did we really accept this without any constraint (warranting mentioning
> here)?

We agreed that in certain situations stdarg.h is OK to use and in those
cases we would add a deviation. Would you like me to add something to
that effect here? I could do that but it would sound a bit vague.  Also
if we want to specify a project-wide deviation it would be better
documented in docs/misra/deviations.rst. I would leave Rule 17.1 without
a note.


> > @@ -478,12 +490,24 @@ maintainers if you want to suggest a change.
> >         have an explicit return statement with an expression
> >       -
> >  
> > +   * - `Rule 17.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_05.c>`_
> > +     - Advisory
> > +     - The function argument corresponding to a parameter declared to
> > +       have an array type shall have an appropriate number of elements
> > +     -
> > +
> >     * - `Rule 17.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_06.c>`_
> >       - Mandatory
> >       - The declaration of an array parameter shall not contain the
> >         static keyword between the [ ]
> >       -
> >  
> > +   * - `Rule 17.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_07.c>`_
> > +     - Required
> > +     - The value returned by a function having non-void return type
> > +       shall be used
> > +     -
> 
> Same question here.

Here I was also thinking it might be good to add a comment. Maybe we could
add:

     - Please beware that this rule has many violations in the Xen
       codebase today, and its adoption is aspirational. However, when
       submitting new patches please try to decrease the number of
       violations when possible.

I would also mention a GCC warning to use for this but I couldn't find
the right one. It looks like all the -Wunused warnings do something
different.


> If the other additions were separate, I probably would have ack-ed them
> right away.

If we can't find the right wording to use quickly I can separate them
out

