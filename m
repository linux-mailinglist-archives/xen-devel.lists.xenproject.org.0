Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D00F796E81
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 03:21:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597036.931196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe3hy-00071n-0M; Thu, 07 Sep 2023 01:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597036.931196; Thu, 07 Sep 2023 01:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe3hx-0006zW-Tv; Thu, 07 Sep 2023 01:21:21 +0000
Received: by outflank-mailman (input) for mailman id 597036;
 Thu, 07 Sep 2023 01:21:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shnx=EX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qe3hw-0006y7-LF
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 01:21:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d94163e2-4d1c-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 03:21:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00C22B81B8C;
 Thu,  7 Sep 2023 01:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32763C433C8;
 Thu,  7 Sep 2023 01:21:16 +0000 (UTC)
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
X-Inumbo-ID: d94163e2-4d1c-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694049677;
	bh=nDmVEirevMI+p85XMYje0NKFHIS4I+PP3nbrImmfpew=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oGcVhGrc/jb0Gqisbu7kVpn2tpbpbtIhe4q9yRA+cMACpNzXHeVHZDBPf1wo0y/B0
	 fpND5Jd6F0Zykrmj+iyXtv0lddhfU9/Rjrq1A0loimR7MvXIZjhWVrfVhXbVJLnth3
	 xb+Y980q1q24HBfnk4qZIWTrlSRltEljl/90yoyxjS8O4fKLg99g0EtueJLDBLn4Ia
	 CYCe906cFP5U9HO+CJQafN/kQz/xkX0MPQhFeBIWkg1Rtg+WNtf2DeYrkP5KFgh7EA
	 xaci91QLG6R0yqhCoIG80Cxj3iZi9ISruZNTGOP3hAnXAMjuT4O9ubdr78XEckOy5V
	 cKeM0HkSWTdWw==
Date: Wed, 6 Sep 2023 18:21:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, george.dunlap@citrix.com, 
    bertrand.marquis@arm.com, roberto.bagnara@bugseng.com, 
    nicola.vetrini@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/misra: add 14.3
In-Reply-To: <58f72b39-701f-6f7a-eba7-fa685d35b8cd@suse.com>
Message-ID: <alpine.DEB.2.22.394.2309061819150.6458@ubuntu-linux-20-04-desktop>
References: <20230831015316.531167-1-sstabellini@kernel.org> <58f72b39-701f-6f7a-eba7-fa685d35b8cd@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Aug 2023, Jan Beulich wrote:
> On 31.08.2023 03:53, Stefano Stabellini wrote:
> > @@ -332,6 +333,17 @@ maintainers if you want to suggest a change.
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
> > +       a project-wide deviation on if and ?: statements.
> 
> As before - switch(sizeof(...)) and alike also wants deviating, imo.

I added the switch, but without the words "and alike" because it is not
clear in this context what it would allow.


> > +       while(0) and while(1) are allowed.
> 
> ... and alike ... (to also cover e.g. while(true)).

Here the words "and alike" are clearer so I added them

