Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B323D784DBE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 02:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588813.920423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYbbL-0004f7-60; Wed, 23 Aug 2023 00:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588813.920423; Wed, 23 Aug 2023 00:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYbbL-0004ci-3R; Wed, 23 Aug 2023 00:19:59 +0000
Received: by outflank-mailman (input) for mailman id 588813;
 Wed, 23 Aug 2023 00:19:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q6w=EI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYbbK-0004ca-BE
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 00:19:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9b333bf-414a-11ee-8782-cb3800f73035;
 Wed, 23 Aug 2023 02:19:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 823586153F;
 Wed, 23 Aug 2023 00:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DDBC433C8;
 Wed, 23 Aug 2023 00:19:53 +0000 (UTC)
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
X-Inumbo-ID: c9b333bf-414a-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692749994;
	bh=a3GUZjo0LqA5h9rsjua3j8UNvNddK4w+CzPyMg8A8hY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vBNBTx4sF2L/58DjZ+C/Lq+OGbTDBiZAXwU6bk0Ss6AtL87nEaoWzOQnD+/1jNIyA
	 3mZbVMBFTezbWWgRt7/B4JUlW6G7Hl+ilDcxDTyR/xBT1HwHaucuajXzsM5U2gyoi8
	 x7ZP9aK95HomStbiJreJ4UnvGDDtu0ZJjLfT5m0BH48wD3DmT/TYQcGw2LPDzo3ONI
	 RW1L/GCgo5vMsIAf35CT/ZJmbc/OryNZ1VTWXPfnf+m5FdAzryAVX1IMzvCGRdfEp4
	 oen+N+8YMw70wmcoapIpSdpP2XvX07xYH07H0KSc28kFIivzlbIGYd56wcUmJTYn7V
	 dp1jxGouAM6dw==
Date: Tue, 22 Aug 2023 17:19:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] docs/misra: add exceptions to rules
In-Reply-To: <cb10f21e-afe4-6593-f10a-fefd1731bf90@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308221715290.6458@ubuntu-linux-20-04-desktop>
References: <20230819012410.1754839-1-sstabellini@kernel.org> <5400f672-5ae6-4559-920f-5244bcd83c57@suse.com> <alpine.DEB.2.22.394.2308211803170.6458@ubuntu-linux-20-04-desktop> <89c57dd1494de14168dc0c7f4aed959e@bugseng.com>
 <cb10f21e-afe4-6593-f10a-fefd1731bf90@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Aug 2023, Jan Beulich wrote:
> (re-adding xen-devel@)
> 
> On 22.08.2023 17:09, Nicola Vetrini wrote:
> > 
> >>>> +         - Switch with a controlling value incompatible with labeled
> >>>> +           statements
> >>>
> >>> What does this mean?
> >>
> >> I am not certain about this one actually. It could be when we have:
> >>
> >> switch (var) {
> >>   case 1:
> >>       something();
> >>       break;
> >>   case 2:
> >>       something();
> >>       break;
> >> }
> >>
> >> and var could be 3 in theory?
> >>
> >> Nicola, please confirm.
> >>
> >>
> > 
> > This one is about case labels that are statically determined not to be 
> > reachable (and hence
> > saying that the code under that label is unreachable is not inaccurate) 
> > because the
> > controlling expression of the switch statement can never have such 
> > value. An example below:
> > 
> > $ cat p.c
> > int f(void) {
> >    char c;
> >    switch (c) {
> >      case 260:
> >        return 260;
> >      case 4:
> >        return 4;
> >    }
> > }
> > 
> > $ eclair_env -enable=MC3.R2.1,B.REPORT.TXT -- gcc -c p.c
> > violation for rule MC3.R2.1: (required) A project shall not contain 
> > unreachable code. (untagged)
> > p.c:3.3-3.8: Loc #1 [culprit: `switch' statement has a controlling value 
> > incompatible with labeled statement]
> >    switch (c) {
> >    <~~~~>
> > p.c:5.14-5.16: Loc #2 [evidence: integer literal is unreachable]
> >        return 260;
> >               <~>
> > 
> > This is also true for things like
> > 
> > switch(sizeof(int)) {
> >    case 2:
> >      ...
> >    case 4:
> >      ...
> > }
> 
> Ah yes, we certainly have quite a few of those. Not sure how to best
> describe such for the doc, but what was suggested (still visible at
> the top) doesn't get this across, I'm afraid,

What about: "switch with a controlling value statically determined not
to match one or more case statements"

I'll send it as part of a separate new patch to update rules.rst for 2.1

