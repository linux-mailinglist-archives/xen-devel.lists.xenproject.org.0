Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247278E46F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 03:39:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593300.926277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbWdq-0004n1-9E; Thu, 31 Aug 2023 01:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593300.926277; Thu, 31 Aug 2023 01:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbWdq-0004jt-3s; Thu, 31 Aug 2023 01:38:38 +0000
Received: by outflank-mailman (input) for mailman id 593300;
 Thu, 31 Aug 2023 01:38:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IFXE=EQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qbWdo-0004jl-UF
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 01:38:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18ea13fd-479f-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 03:38:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 10E99622D4;
 Thu, 31 Aug 2023 01:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05234C433C7;
 Thu, 31 Aug 2023 01:38:30 +0000 (UTC)
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
X-Inumbo-ID: 18ea13fd-479f-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693445912;
	bh=tcoxmcGMzGWFIKp1sPyXputgzNCIZDeXy14NL2l0W6g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QbT2YUtRhFrnX3NV3XM15CusHUymAtlDrW2YxR1GrxWRpxnFpQXgGr8N87gnoPFk3
	 TV4efrAzsqZLoMPewGmEruH91BpQNK2B05rpeJr6VxaUHiaNKK0ZESqEyfhEAkgwPt
	 ZKiYpn7aFLoPDKWKF/EEx6wfe/Zy6A+aXsZy7ibjxhNfiy0VjJDZ6C1uPyPvIorPh/
	 rWuDdu9u+/qPyZDOdbZ0LDJFENyinP0G6RFJ/X64Ormfbknx303f4Iilgob+35c03S
	 lSeLEF2xqmS5UwyYsQ7OJrQP3S4s7rHTT2dMvr33T3ZlI1w60VCEMakwEfG/1NOL1G
	 /rWIzb4oBwuow==
Date: Wed, 30 Aug 2023 18:38:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, george.dunlap@citrix.com, 
    bertrand.marquis@arm.com, nicola.vetrini@bugseng.com, 
    roberto.bagnara@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add 14.3 and 14.4
In-Reply-To: <b15edd2a-9937-ae36-d84e-8dd134cea6b8@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308301831380.6458@ubuntu-linux-20-04-desktop>
References: <20230830005950.305085-1-sstabellini@kernel.org> <b15edd2a-9937-ae36-d84e-8dd134cea6b8@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Aug 2023, Jan Beulich wrote:
> On 30.08.2023 02:59, Stefano Stabellini wrote:
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -234,7 +234,7 @@ maintainers if you want to suggest a change.
> >     * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_02.c>`_
> >       - Required
> >       - Function types shall be in prototype form with named parameters
> > -     -
> > +     - Function pointer types shall have named parameters too.
> 
> This isn't an exception; do we really need to state such? I would have
> expected something to appear here only if we intended to deviate certain
> constructs.

Yes, it is not an exception. However, as there was genuine confusion in
the community about whether the rule should apply or not to function
pointer types I think it would be good to clarify. To avoid any doubts
in the future. My preference is to keep this as clarification.



> > @@ -332,6 +332,24 @@ maintainers if you want to suggest a change.
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
> > +       a project-wide deviation on 'if' statements. The rule only
> > +       applies to while, for, do ... while, ?:, and switch statements.
> 
> The sizeof() aspect mentioned particularly applies to switch() as well.
> Furthermore ?: is really only shorthand for simple if(), so I don't see
> treating it different from if() as helpful.

I'll answer in another email.



> That said, I'd be a little hesitant to give an ack here anyway. If you'd
> split 14.3 and 14.4, I'd be happy to ack 14.4's addition.
> 
> Jan
> 
> > +   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_04.c>`_
> > +     - Required
> > +     - The controlling expression of an if statement and the controlling
> > +       expression of an iteration-statement shall have essentially
> > +       Boolean type
> > +     - Implicit conversions of integers, pointers, and chars to boolean
> > +       are allowed
> > +
> >     * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
> >       - Required
> >       - A switch-expression shall not have essentially Boolean type
> 

