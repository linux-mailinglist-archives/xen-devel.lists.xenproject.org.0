Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48A2815186
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 22:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655372.1023157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEFKi-0004xv-J6; Fri, 15 Dec 2023 21:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655372.1023157; Fri, 15 Dec 2023 21:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEFKi-0004w7-GA; Fri, 15 Dec 2023 21:02:56 +0000
Received: by outflank-mailman (input) for mailman id 655372;
 Fri, 15 Dec 2023 21:02:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Stqq=H2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rEFKg-0002dN-LF
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 21:02:54 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f894ce3-9b8d-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 22:02:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8FE2CCE2D95;
 Fri, 15 Dec 2023 21:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F39C433C8;
 Fri, 15 Dec 2023 21:02:49 +0000 (UTC)
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
X-Inumbo-ID: 4f894ce3-9b8d-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702674170;
	bh=/JGqxQU/28Q4Bq843zBis3vY9fYQ4hwln7idLiWAy9k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l1lakN1HqL8W2ro/fXHMG8l32bX2DCwvFDl+KLOTIl3Q9gYrlTsXx2WVem1QE8quB
	 EPOZQYvJR7lme2VFTQdbaajvCH8PW6/DwWgw1thL/hPedHJJDrj4hjWL8LPmMC2zT0
	 ZtlnDR9mc6p0h117OXp4geKHR/aFy5kJT2RqQl6as1dujcf35w/Ai3YWKqbyau6/SZ
	 DBCN+UfYtuoguC8QmBwQtt0NbUTgQ0TUmyeUHYE1uIumpX4aZCyFNfvuSQsAsPuD9S
	 smoVfJRvXHccvYxiCtHTFrXKNFtO38f6kFKENdfiZdfqa+dAe+U4tHdFXFOZYfHfSN
	 aM57rtTwuPpKQ==
Date: Fri, 15 Dec 2023 13:02:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    jbeulich@suse.com, george.dunlap@citrix.com, bertrand.marquis@arm.com, 
    roger.pau@citrix.com, roberto.bagnara@bugseng.com, 
    federico.serafini@bugseng.com
Subject: Re: [PATCH v2] docs/misra/rules.rst: add Rule 17.1
In-Reply-To: <d7b880b2-10ec-4c3d-bf12-1c29995857d6@xen.org>
Message-ID: <alpine.DEB.2.22.394.2312151251450.3175268@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2312081738100.1703076@ubuntu-linux-20-04-desktop> <d7b880b2-10ec-4c3d-bf12-1c29995857d6@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Dec 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 09/12/2023 01:39, Stefano Stabellini wrote:
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > Changes in v2:
> > - separated 17.1 in its own patch
> > - add a comment
> > 
> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > index 8a659d8d47..f29b4c3d9a 100644
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -189,6 +189,12 @@ existing codebase are work-in-progress.
> >        - A switch-expression shall not have essentially Boolean type
> >        -
> >   +   * - `Rule 17.1
> > <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_01.c>`_
> > +     - Required
> > +     - The features of <stdarg.h> shall not be used
> > +     - It is understood that in some limited circumstances <stdarg.h> is
> > +       appropriate to use, such as the implementation of printk.
> 
> The last bullet point is unclear to me. You don't define what "appropriate"
> means here. So who is going to decide? Also, how is this going to be deviated?
> 
> Possibly the solution here is to remove the last bullet point and have a
> paragraph in deviations.rst explaining why we are using va_args.

Actually, I agree with you. I added the last bullet to address Jan's
concern:
https://marc.info/?l=xen-devel&m=170191695511513
https://marc.info/?l=xen-devel&m=170193528120968

This was my original reply:

"We agreed that in certain situations stdarg.h is OK to use and in those
cases we would add a deviation. Would you like me to add something to
that effect here? I could do that but it would sound a bit vague.  Also
if we want to specify a project-wide deviation it would be better
documented in docs/misra/deviations.rst. I would leave Rule 17.1 without
a note."

My preference is still to remove the last bullet (because too generic)
and add any specific information to deviations.rst as usual.

Julien, would you be OK with this patch if I remove the last bullet and
leave it blank?

