Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA20786348
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 00:20:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589622.921612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYwCi-0002B3-GJ; Wed, 23 Aug 2023 22:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589622.921612; Wed, 23 Aug 2023 22:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYwCi-000291-Dd; Wed, 23 Aug 2023 22:19:56 +0000
Received: by outflank-mailman (input) for mailman id 589622;
 Wed, 23 Aug 2023 22:19:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q6w=EI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYwCg-00027Z-QW
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 22:19:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cf936c7-4203-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 00:19:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 722EA63FA0;
 Wed, 23 Aug 2023 22:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DE0C433C7;
 Wed, 23 Aug 2023 22:19:47 +0000 (UTC)
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
X-Inumbo-ID: 2cf936c7-4203-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692829188;
	bh=+SDmP6+LmLgdegbWEvwhVCvg7R9VgbWUfr2HWxu9cWc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aiPMueCJUjQMaHdbI437fjC2Af5Vw8H2pD4GrxVJLeeTt70eAio5fiCmLAnpj9uVR
	 N9vXreOam7q2wTCeaK5/fSmFPDAkdBwngYW8pQXW7fbDfRvjTNyc7icYDLMgvTeRpt
	 705BLketvgchYChvEYx1qjqCgGO99YF+52LMjkpeqtxLZP0V+FRx1BRwMH3BqTOmgr
	 KkanXlmfZ5NrAq8BMKQEHpLlaV2v/AfYMTGIRvYMAC/aEn18xpSMxvi74OvkcoVvjd
	 IuXrmWHh9f//jKDH7SaHMfj1KRsW6sS1ZznY4yvIUWVXLP+QNBr7SpW4vZkeMiSwgb
	 hDHuUalb6U6vA==
Date: Wed, 23 Aug 2023 15:19:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, george.dunlap@citrix.com, 
    bertrand.marquis@arm.com, nicola.vetrini@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] docs/misra: add rule 2.1 exceptions
In-Reply-To: <19addc0d-973f-4c3a-8db5-0531e065fdde@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308231513110.6458@ubuntu-linux-20-04-desktop>
References: <20230823002458.2738365-1-sstabellini@kernel.org> <19addc0d-973f-4c3a-8db5-0531e065fdde@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Aug 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 23/08/2023 01:24, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > During the discussions that led to the acceptable of Rule 2.1, we
> > decided on a few exceptions that were not properly recorded in
> > rules.rst. Add them now.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> >   docs/misra/rules.rst | 13 ++++++++++++-
> >   1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > index b6d87e076b..8f38227994 100644
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -107,7 +107,18 @@ maintainers if you want to suggest a change.
> >      * - `Rule 2.1
> > <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
> >        - Required
> >        - A project shall not contain unreachable code
> > -     -
> > +     - The following are allowed:
> > +         - Invariantly constant conditions, e.g. if(IS_ENABLED(CONFIG_HVM))
> > { S; }
> > +         - Switch with a controlling value statically determined not to
> > +           match one or more case statements
> > +         - Functions that are intended to be never referenced from C
> > +           code (e.g. 'do_trap_fiq')
> > +         - Unreachability caused by the certain macros/functions is
> > +           deliberate, e.g. BUG, assert_failed, panic, etc.
> 
> I find the wording quite ambiguous. How will an assessor be able to know this
> is deliberate? I think it would be better if this is based on a keyword in the
> code such as a function that has the attribute noreturn and/or there is an
> unreachable() statement.

You are right that it is not precise enough. I am thinking of changing
this to (also following Jan's suggestion):

Deliberate unreachability caused by certain macros/functions, e.g. BUG,
assert_failed, panic, etc. See safe.json.

In particular the important part is "See safe.json". Right now there is
nothing in safe.json about it, but it is should be the right place to
maintain the list of deviations and tags. Then we can add the tag at the
declaration site of BUG, panic, etc. Nicola is also checking if this
approach works with ECLAIR.

