Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E857A8A8BDB
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 21:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707695.1105827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxAgY-0006DL-Au; Wed, 17 Apr 2024 19:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707695.1105827; Wed, 17 Apr 2024 19:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxAgY-0006Bd-7b; Wed, 17 Apr 2024 19:11:10 +0000
Received: by outflank-mailman (input) for mailman id 707695;
 Wed, 17 Apr 2024 19:11:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jr4=LW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rxAgW-0006BX-Dp
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 19:11:08 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b8847fd-fcee-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 21:11:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8E772CE1474;
 Wed, 17 Apr 2024 19:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD390C072AA;
 Wed, 17 Apr 2024 19:10:57 +0000 (UTC)
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
X-Inumbo-ID: 3b8847fd-fcee-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713381058;
	bh=bL3xracdleSXEIdkyeoC9ly2RoFq+ax6FNF5N8M1MiQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tz6J8/838DV62Mo3my0gWoHI+E0aHPkvIFNeTiWBcdaG1d8UAn1EBT6oGp7wVGvMU
	 YqxV5oKXlDwpZaMfw1aNXmcHND8BiEPxPqAOPU0yhvq1bhVCJp1uhXLu5zF7p1w5W+
	 BGo3Q3Ww4z8ZVDshdobfWmx2xUbJcZTfBqjkfRQz9F3NWvpKTTwciYgDkwafzfF89q
	 FCtyTH8ATO6625YvieVNb1De8whSMICB9Wp5kM6XVVMGPZ/TR+IM7qSu+NemVJ1oln
	 z3InjwKO8z+YmFleUBQyYCNX3nzDpJ4XENsXP0ueQ1Gr0DzeSVOeQ6Z4YSiAzFg6j7
	 ilVWMqBkOwz9w==
Date: Wed, 17 Apr 2024 12:10:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: docs/misra: add R21.6 R21.14 R21.15 R21.16
In-Reply-To: <b76bc307-6cf6-443f-80de-d27852ede25f@xen.org>
Message-ID: <alpine.DEB.2.22.394.2404171208410.2257106@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2404161227340.2257106@ubuntu-linux-20-04-desktop> <b76bc307-6cf6-443f-80de-d27852ede25f@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 Apr 2024, Julien Grall wrote:
> Hi Stefano,
> 
> On 16/04/2024 20:27, Stefano Stabellini wrote:
> > Also add two specific project-wide deviations for R21.6 and R21.15.
> 
> In general, I am fine with add the two rules. However...
> 
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> > index 32b02905d1..9123c8edb5 100644
> > --- a/docs/misra/deviations.rst
> > +++ b/docs/misra/deviations.rst
> > @@ -387,6 +387,22 @@ Deviations related to MISRA C:2012 Rules:
> >          of the Rule due to uses of this macro.
> >        - Tagged as `deliberate` for ECLAIR.
> >   +   * - R21.6
> > +     - The use of snprintf() and vsnprintf() is justifiable as, despite
> > +       the fact that such functions have the same names of the
> > +       corresponding standard library functions, each configuration of
> > +       Xen has a unique implementation for them; the code implementing
> > +       such functions is subject to the analysis, so that any undefined
> > +       or unspecified behavior associated to them falls under the
> > +       responsibility of other MISRA guidelines
> > +     - Tagged as `safe` for ECLAIR.
> 
> ... this implies that ECLAIR should be modified. But this is not happening in
> this patch. Looking at history, we tend to keep deviations.rst in sync with
> ECLAIR, so I think it should be updated here too.

That is true but I am not very familiar with Eclair config language so
it is better if that is done by the Bugseng team. I can merge their
patch into this one or vice versa or they could be committed separately
(keep in mind that the rule is not enabled in the ECLAIR scan so from a
Gitlab-CI point of view we don't require the change to the ECLAIR config
although it makes sense). I am happy either way. 

