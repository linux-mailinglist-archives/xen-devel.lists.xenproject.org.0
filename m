Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB4C7990FA
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 22:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598185.932764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qei4b-0004Rg-6a; Fri, 08 Sep 2023 20:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598185.932764; Fri, 08 Sep 2023 20:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qei4b-0004PX-3v; Fri, 08 Sep 2023 20:27:25 +0000
Received: by outflank-mailman (input) for mailman id 598185;
 Fri, 08 Sep 2023 20:27:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmm/=EY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qei4Z-0004PR-OX
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 20:27:23 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d8266dc-4e86-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 22:27:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B61DDB821F8;
 Fri,  8 Sep 2023 20:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF043C433C8;
 Fri,  8 Sep 2023 20:27:18 +0000 (UTC)
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
X-Inumbo-ID: 1d8266dc-4e86-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694204840;
	bh=9VwVCFOcBylmtUIRsKhm0+9fbtOzAiHNuqC0ln/9YBU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=erDTZ0tRRoH0m34JXdirC7oxEaWB6w5p892ZAUY6evUEfRgN0fhvnhYl+mnW2HyLN
	 6fNVE77MIwbBsDD8xkodcMa0jm8aL6vItF1uonBdTGfFphQJxkHpkvOGwWUC7jJ2lR
	 eyTw98kR5BDPuptPAtBx1NDSPNmkPUckkjS1BOy1mJ1EPNw6v+xGb8GxKQLugcjgQS
	 vRzr9bs8A25dYOKL2AozOZ1IwGOFis2M4krKoCD+mvPl0PX5J+m5hTYnx+U5bxZq9l
	 b/HbKL+H40uNs7tXY36dVWi8SpY23KVRNyxPk8j7V25B4P9dlyfqd2oUTCT3HaN7Am
	 Ab6AeZylWojHA==
Date: Fri, 8 Sep 2023 13:27:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, george.dunlap@citrix.com, 
    bertrand.marquis@arm.com, roberto.bagnara@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/misra: add 14.3
In-Reply-To: <fd3a487fc4a24a16262bd510c6cd835d@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309081321310.6458@ubuntu-linux-20-04-desktop>
References: <20230907012203.1238090-1-sstabellini@kernel.org> <36b888b2-e7e3-bf70-f599-d22ca34e2dfe@suse.com> <alpine.DEB.2.22.394.2309071441400.6458@ubuntu-linux-20-04-desktop> <fd3a487fc4a24a16262bd510c6cd835d@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Sep 2023, Nicola Vetrini wrote:
> On 07/09/2023 23:45, Stefano Stabellini wrote:
> > On Thu, 7 Sep 2023, Jan Beulich wrote:
> > > On 07.09.2023 03:22, Stefano Stabellini wrote:
> > > > @@ -385,6 +386,17 @@ maintainers if you want to suggest a change.
> > > >       - A loop counter shall not have essentially floating type
> > > >       -
> > > >
> > > > +   * - `Rule 14.3
> > > <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
> > > > +     - Required
> > > > +     - Controlling expressions shall not be invariant
> > > > +     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
> > > > +       checks, and other constructs that are detected as errors by
> > > MISRA
> > > > +       C scanners, managing the configuration of a MISRA C scanner for
> > > > +       this rule would be unmanageable. Thus, this rule is adopted with
> > > > +       a project-wide deviation on if ?: and switch statements.
> > > 
> > > Do we want to go as far as permitting this uniformly for all switch()? In
> > > my earlier reply I had included sizeof() for a reason.
> > 
> > I agree with you that it would be better to restrict it to only some
> > switch uses, rather than all of them.
> > 
> > But if we are going to restrict the deviation to switch(sizeof()), which
> > I think is a good idea and I am in favor, wouldn't it be better to
> > handle these cases as individual deviations? E.g. docs/misra/safe.json?
> > I am assuming there are only few cases like that and adding it here
> > makes the rule more complicated.
> > 
> > I am happy either way but I wanted to provide that as an option.
> > 
> > 
> 
> It's also worth considering the magnitude of required SAF comments when making
> this choice.
> In this case, from a cursory glance at the present violations, it seems that
> there are maybe a
> handful of switches inside macros, so they shouldn't be problematic to deal
> with.

That's what I thought as well and why I suggested to only deal with them
in safe.json. However, it doesn't cost us anything to be extra clear, so
I'll send an updated patch with extra clarity.

