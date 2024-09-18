Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE6797C0B4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 22:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800423.1210346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sr1BW-0002tj-6P; Wed, 18 Sep 2024 20:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800423.1210346; Wed, 18 Sep 2024 20:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sr1BW-0002rR-3i; Wed, 18 Sep 2024 20:21:58 +0000
Received: by outflank-mailman (input) for mailman id 800423;
 Wed, 18 Sep 2024 20:21:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uy3Y=QQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sr1BU-0002rJ-5T
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 20:21:56 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4c3255b-75fb-11ef-a0b8-8be0dac302b0;
 Wed, 18 Sep 2024 22:21:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 05BFDA4394B;
 Wed, 18 Sep 2024 20:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C240C4CEC2;
 Wed, 18 Sep 2024 20:21:50 +0000 (UTC)
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
X-Inumbo-ID: a4c3255b-75fb-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726690912;
	bh=McPw0nYvMJZDPnSLA2JbR1kcU85kTtAmagt+y7PGgeA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FfThzKmjg3A2Gdbqommu7gY586sah/XJ+p8zEqaUOee/7Ih8+TMx1bDNdud9mbhal
	 IJ23tWUhtCN/xy7nIblaGUMLsqFhBAysuTU7bnAqYb4EPwxYt3bLTPfTFKcK9mwgNk
	 /BX1w3E2XY2ewWQl+EqYpKrulE5qBocD0Yzj/myCnOfVg8WRtAowbaGWM8gi6sQWIU
	 m1siQfTGcDWTa0c/NExV6NaAn1enwrka4BoXlHzE+zfYrbk+0p5uYIp532BQT6crCy
	 SBo9TDoVaBYjGJLJqY+dKaidi9UBGlmuYtjTb0HjjMBIINfzVKyMlF9jO7pVcY5IbP
	 d+dXQBM9AnRuQ==
Date: Wed, 18 Sep 2024 13:21:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] docs/misra: add R17.2 and R18.2
In-Reply-To: <2cba41683073c84563faca7991045a0f@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2409181320350.1417852@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2409161559340.1417852@ubuntu-linux-20-04-desktop> <3DB424D8-8E51-49C0-8B31-5578FF030252@arm.com> <2cba41683073c84563faca7991045a0f@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Sep 2024, Nicola Vetrini wrote:
> On 2024-09-17 08:13, Bertrand Marquis wrote:
> > Hi Stefano,
> > 
> > > On 17 Sep 2024, at 01:02, Stefano Stabellini <sstabellini@kernel.org>
> > > wrote:
> > > 
> > > The Xen community is already informally following both rules. Let's make
> > > it explicit. Both rules have zero violations, only cautions. While we
> > > want to go down to zero cautions in time, adding both rules to rules.rst
> > > enables us to immediately make both rules gating in the ECLAIR job part
> > > of gitlab-ci.
> > > 
> > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > 
> > > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > > index e99cb81089..9acd92cf78 100644
> > > --- a/docs/misra/rules.rst
> > > +++ b/docs/misra/rules.rst
> > > @@ -561,6 +561,12 @@ maintainers if you want to suggest a change.
> > >      - The features of <stdarg.h> shall not be used
> > >      -
> > > 
> > > +   * - `Rule 17.2
> > > <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_02.c>`_
> > > +     - Required
> > > +     - Functions shall not call themselves, either directly or indirectly
> > > +     - Limited forms of recursion are allowed if the recursion is bound
> > > +       (there is an upper limit and the upper limit is enforced)
> > 
> > NIT: . missing at the end.
> > 
> > 
> > Should we add a comment to say that the bounding needs to be explained in a
> > comment or in a deviation ?

I added a note to that effect, I also added the '.'


> > > +
> > >    * - `Rule 17.3
> > > <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_03.c>`_
> > >      - Mandatory
> > >      - A function shall not be declared implicitly
> > > @@ -593,6 +599,12 @@ maintainers if you want to suggest a change.
> > >        submitting new patches please try to decrease the number of
> > >        violations when possible.
> > > 
> > > +   * - `Rule 18.1
> > > <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_01.c>`_
> > > +     - Required
> > > +     - A pointer resulting from arithmetic on a pointer operand shall
> > > +       address an element of the same array as that pointer operand
> > 
> > NIT: . missing at the end.
> > 
> > More than that i do not find the sentence quite clear.
> > How about: Pointer arithmetic on an array should only address elements in
> > the given array.
> > 
> > There might a better way to state that in english.
> > Or is this the "extract" from the misra rule directly ?
> > 
> 
> It is the full rule headline, similar to all other entries in the table.

As this is the rules title, it is best not to change it. Also we haven't
added '.' for the rules titles so far. I'll keep this as it is.

