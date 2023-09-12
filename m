Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B509079C12A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 02:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599826.935402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfrRw-0006ju-2Y; Tue, 12 Sep 2023 00:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599826.935402; Tue, 12 Sep 2023 00:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfrRv-0006iE-VO; Tue, 12 Sep 2023 00:40:15 +0000
Received: by outflank-mailman (input) for mailman id 599826;
 Tue, 12 Sep 2023 00:40:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+51=E4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qfrRt-0006hg-OZ
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 00:40:13 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec6f0378-5104-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 02:40:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4F7D0CE16F5;
 Tue, 12 Sep 2023 00:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309D6C116A3;
 Tue, 12 Sep 2023 00:40:01 +0000 (UTC)
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
X-Inumbo-ID: ec6f0378-5104-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694479202;
	bh=Dxmm2rLn/WJ21SRhnu/nMYLAH7UCGT8LC9nHanY707A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CrfSXoK7S4g0ty0OkouoWgz/0GuULQvMK/PuO6qJ7pE2pi2v+Rd+DSUwN8SCYEUzJ
	 GNvKhiz/nYO0mlBs8layGWkdGbUaHkDlgkOa3uXxaNB4PnHzWhIj/eh/QZvN69yC9C
	 XB64i/I4ltifFItYVPEuqRxJukS2lzhg6vEbc40rgIcjQsZlhUI41xszl/F8Sh/NHi
	 nFxpSGjoor1+guqCzefPN2aD8WzHf2cPZovWbAQ7uWy8m0RXycKAkfNBC71mCc6YCA
	 zyxkD7z6UP6BXqE7XHfCwt09xlwj4x9ABAXECAb2zB9Rv7PjIgrqNVZYC5rvfqwRzA
	 iav2pvOl5j5Zw==
Date: Mon, 11 Sep 2023 17:39:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, george.dunlap@citrix.com, 
    bertrand.marquis@arm.com, roberto.bagnara@bugseng.com, 
    nicola.vetrini@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] docs/misra: add rule 2.1 exceptions
In-Reply-To: <ef37384f-c3e6-1425-f27a-1bd70f34dd6d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2309111739510.1847660@ubuntu-linux-20-04-desktop>
References: <20230908230318.1719290-1-sstabellini@kernel.org> <ef37384f-c3e6-1425-f27a-1bd70f34dd6d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Sep 2023, Jan Beulich wrote:
> On 09.09.2023 01:03, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > During the discussions that led to the acceptance of Rule 2.1, we
> > decided on a few exceptions that were not properly recorded in
> > rules.rst. Add them now.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Nicola, does this work with ECLAIR?
> > 
> > I am referring to the locations of the SAF-2-safe tag on top of
> > call_psci_system_off, BUG, etc.
> > 
> > Changes in v3:
> > - added SAF-2-safe to safe.json
> > - added a few SAF-2-safe examples
> > ---
> >  docs/misra/rules.rst    | 13 ++++++++++++-
> >  docs/misra/safe.json    |  8 ++++++++
> >  xen/arch/arm/psci.c     |  1 +
> >  xen/arch/x86/shutdown.c |  1 +
> >  xen/include/xen/bug.h   |  2 ++
> >  5 files changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > index 34916e266a..82de4c645d 100644
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -107,7 +107,18 @@ maintainers if you want to suggest a change.
> >     * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
> >       - Required
> >       - A project shall not contain unreachable code
> > -     -
> > +     - The following are allowed:
> > +         - Invariantly constant conditions, e.g. if(IS_ENABLED(CONFIG_HVM)) { S; }
> > +         - Switch with a controlling value statically determined not to
> > +           match one or more case statements
> 
> I (continue to) consider this as too lax. I don't think we want to permit
> something like
> 
> void test(uint8_t val)
> {
>     switch ( val )
>     {
>     case 0x100:
>         ...
> 
> Imo like in the earlier bullet point I think this wants limiting to
> compile-time constant values, at least initially.

Yes good point

