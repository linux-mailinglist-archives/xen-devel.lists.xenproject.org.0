Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 419FE787B79
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 00:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590384.922659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZIna-000696-Dr; Thu, 24 Aug 2023 22:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590384.922659; Thu, 24 Aug 2023 22:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZIna-00066c-BG; Thu, 24 Aug 2023 22:27:30 +0000
Received: by outflank-mailman (input) for mailman id 590384;
 Thu, 24 Aug 2023 22:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFvq=EJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qZInZ-00066U-A2
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 22:27:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6700a26a-42cd-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 00:27:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B7B2635DA;
 Thu, 24 Aug 2023 22:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9F2C433C7;
 Thu, 24 Aug 2023 22:27:23 +0000 (UTC)
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
X-Inumbo-ID: 6700a26a-42cd-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692916045;
	bh=ND8oR2rs1HKus0qtWo6HWRZfqnP4wwIQSfk7nfcmnMc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NFr1AiOwofbg/6LMxgixhwVBUNELsaYap+xQ/GnzqfqPAn4Ke60GOdvAppM67q8fP
	 zYuov+FqZ9A9omJhwInY/uZQFoP9C0+9mwI1pTo37hGNAqWms5d/IQM5DpZnMr8xLQ
	 j9xDboGIRDN+Cy2i7Es6cXbnS8jRGKpqyozHorXG1S8KR7G8wgsDhJ1n9OeF95xsWf
	 1yslag02rxo/K8IR86pZoBoy2Vn/VvpritxZopiFNf1ixogJusdwYTVA4lgTR/blyn
	 pDrE56kqZVOHowbfxw7dHRpSt3YylehifVYdG6pHrXR1FKBEEWcSe8p5jCnjI9J1ka
	 eRSrT67fi6L3A==
Date: Thu, 24 Aug 2023 15:27:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, george.dunlap@citrix.com, 
    bertrand.marquis@arm.com, nicola.vetrini@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v2] docs/misra: add rule 2.1 exceptions
In-Reply-To: <0cd5f18b-2da4-4f36-b6eb-c151965a0f64@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308241513130.6458@ubuntu-linux-20-04-desktop>
References: <20230823223942.2981782-1-sstabellini@kernel.org> <0076d7e6-f099-473b-b81b-9ce8d5e18b7a@xen.org> <0cd5f18b-2da4-4f36-b6eb-c151965a0f64@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-897737943-1692915663=:6458"
Content-ID: <alpine.DEB.2.22.394.2308241527120.6458@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-897737943-1692915663=:6458
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2308241527121.6458@ubuntu-linux-20-04-desktop>

On Thu, 24 Aug 2023, Julien Grall wrote:
> On 24/08/2023 12:46, Julien Grall wrote:
> > On 23/08/2023 23:39, Stefano Stabellini wrote:
> > > ---
> > >   docs/misra/rules.rst | 13 ++++++++++++-
> > >   1 file changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > > index 8f0e4d3f25..4f33ed4ba6 100644
> > > --- a/docs/misra/rules.rst
> > > +++ b/docs/misra/rules.rst
> > > @@ -106,7 +106,18 @@ maintainers if you want to suggest a change.
> > >      * - `Rule 2.1
> > > <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
> > >        - Required
> > >        - A project shall not contain unreachable code
> > > -     -
> > > +     - The following are allowed:
> > > +         - Invariantly constant conditions, e.g.
> > > if(IS_ENABLED(CONFIG_HVM)) { S; }
> > > +         - Switch with a controlling value statically determined not to
> > > +           match one or more case statements
> > > +         - Functions that are intended to be referenced only from
> > > +           assembly code (e.g. 'do_trap_fiq')
> > > +         - Deliberate unreachability caused by certain macros/functions,
> > > +           e.g. BUG, assert_failed, panic, etc. See safe.json.
> > 
> > ... someone reading this and then reading safe.json will wonder why none are
> > present.
> > 
> > The list would then only contain the one(s) currently added in safe.json.
> > But there should be no expectation that the examples will grow everytime one
> > is added in safe.json.
> 
> I forgot to mention that the rest of the exceptions look good to me. So if you
> prefer, if you could remove this exception and commit the rest.

Let me see what I can do
--8323329-897737943-1692915663=:6458--

