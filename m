Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324E974B896
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 23:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560616.876666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHsj7-0004Bj-5c; Fri, 07 Jul 2023 21:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560616.876666; Fri, 07 Jul 2023 21:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHsj7-00048u-2v; Fri, 07 Jul 2023 21:10:53 +0000
Received: by outflank-mailman (input) for mailman id 560616;
 Fri, 07 Jul 2023 21:10:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RURV=CZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHsj5-00048o-St
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 21:10:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bef8250b-1d0a-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 23:10:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44BDE61A3C;
 Fri,  7 Jul 2023 21:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716FEC433C8;
 Fri,  7 Jul 2023 21:10:46 +0000 (UTC)
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
X-Inumbo-ID: bef8250b-1d0a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688764247;
	bh=esMBw5EmTwtKXn2xuMq+vmasP3tTn/e8UFfxp4juhRs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Sl8r30lt2kkFePYvnaXzXFjA9NMLVtQ+G7cTS/OIljXZIpGy+HOAn0oZeT3UXpDuV
	 thaN/RTHBBxMl0/++s2G5O1sHzz4LPePYRcO+HL9a4OejjlrRRPvmwKpXKrgevOfPd
	 HjAkIVURnZ4XUogqfUHNVknlVySXTQOAmWjhQ02t+ImwWvxtFIfI836uVfdIywTiX9
	 FlZd1Vm3a8X1eqAdouTocD6KAE85K8qwxDjz3IgWP17sCMtrNOoiLDlIOivWf6czxo
	 gpq1hKdQDvr6LO9FVMj/uRSRFtKA41Vp1jEBTuB1QqPyJ1SAa7pqf0mpEHQhiass2j
	 TYO/LoOlU6xRg==
Date: Fri, 7 Jul 2023 14:10:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, george.dunlap@citrix.com, 
    bertrand.marquis@arm.com, Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add Rule 7.4 and 9.4
In-Reply-To: <9f2fc7fc-cab6-e14e-6fd3-a2e75d4becfa@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307071406480.761183@ubuntu-linux-20-04-desktop>
References: <20230706224619.1092613-1-sstabellini@kernel.org> <9f2fc7fc-cab6-e14e-6fd3-a2e75d4becfa@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Jul 2023, Jan Beulich wrote:
> On 07.07.2023 00:46, Stefano Stabellini wrote:
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -203,6 +203,13 @@ maintainers if you want to suggest a change.
> >       - The lowercase character l shall not be used in a literal suffix
> >       -
> >  
> > +   * - `Rule 7.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_04.c>`_
> > +     - Required
> > +     - A string literal shall not be assigned to an object unless the
> > +       objects type is pointer to const-qualified char
> > +     - Assigning a string literal to any object with type
> > +       "pointer to const-qualified void" is allowed
> 
> I guess this is relevant also in a few other cases: Considering the
> significant difference between title and actual text of the rule, and
> further assuming people looking here won't always pull out the full
> doc (they may not even have a copy of it), I think it is important to
> also mention in a remark that despite the title all "character types"
> are permitted, as long as string element type and character type match.
> Since the compiler won't allow mismatches when the lhs type isn't void,
> mandating no use of casts to "satisfy" the rule may be a way to express
> our intentions.

What about:

   * - `Rule 7.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_04.c>`_
     - Required
     - A string literal shall not be assigned to an object unless the
       objects type is pointer to const-qualified char
     - All "character types" are permitted, as long as the string
       element type and the character type match. (There should be no
       casts.) Assigning a string literal to any object with type
       "pointer to const-qualified void" is allowed.

