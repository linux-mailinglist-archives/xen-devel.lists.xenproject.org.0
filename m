Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B854776C7B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 00:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581483.910213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTs5W-0000B7-PO; Wed, 09 Aug 2023 22:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581483.910213; Wed, 09 Aug 2023 22:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTs5W-00008D-MO; Wed, 09 Aug 2023 22:55:34 +0000
Received: by outflank-mailman (input) for mailman id 581483;
 Wed, 09 Aug 2023 22:55:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTs5U-000087-IO
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 22:55:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6f93431-3707-11ee-b282-6b7b168915f2;
 Thu, 10 Aug 2023 00:55:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 23C5B6485B;
 Wed,  9 Aug 2023 22:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E910C433C8;
 Wed,  9 Aug 2023 22:55:28 +0000 (UTC)
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
X-Inumbo-ID: d6f93431-3707-11ee-b282-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691621729;
	bh=1lhl3ap1zWM0chou3+Rggl1wTn/zkGmZwk1xENiVgfQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c7GfCrnS4czVxVxZqZ7zJX4dZpQS4KyLofREV4HjnEyK5ke0LcvFCoRCOgJEv9el6
	 IahTWZVituEMACQ8e3aFaankkhyJ8c02K/mSZnxFXz9hXtz4vKd2Fwn+fb/WBbrssT
	 PXVlWtlNZlAxz7yEWj9MLZ7MgHmxDpkX160UvcAMN0YQ4gi60E2nAjtnTa3pkhdyll
	 bw+m6UGoIlXSh9ZeWNAjYuCvV8zySL8UM3bwaAEHgEylOm4ahAXYonYcZmrfrep6W0
	 W2IzEtj5meSnb3W8mGG8EQYvjVQSSl5EHfmGJ4c7hFFzuCoROhrIJeb+ygjPXnCT23
	 qCWJ0AoBVCraQ==
Date: Wed, 9 Aug 2023 15:55:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, jgross@suse.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, Bertrand.Marquis@arm.com
Subject: Re: MISRA violations in hypercall-defs
In-Reply-To: <9456c12e-2960-4d93-86d3-f7fa578199cf@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308091554390.2127516@ubuntu-linux-20-04-desktop>
References: <5972799c-99a6-73f5-eff2-b24469f7428d@bugseng.com> <01fbd921-8092-aedd-33ec-ef170d8ec6fc@suse.com> <alpine.DEB.2.22.394.2308081457530.2127516@ubuntu-linux-20-04-desktop> <456d6bb5-8fa2-d47a-5d1a-b3bda20e0a5b@suse.com>
 <alpine.DEB.2.22.394.2308091320540.2127516@ubuntu-linux-20-04-desktop> <0d7cabca-e0d5-4ab6-a16d-11da35e45149@xen.org> <alpine.DEB.2.22.394.2308091500130.2127516@ubuntu-linux-20-04-desktop> <9456c12e-2960-4d93-86d3-f7fa578199cf@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Aug 2023, Julien Grall wrote:
> On 09/08/2023 23:06, Stefano Stabellini wrote:
> > On Wed, 9 Aug 2023, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 09/08/2023 21:35, Stefano Stabellini wrote:
> > > > P.S.
> > > > Julien, Bertrand, do you think we should unsupport (in SUPPORT.md, today
> > > > it is not clarified) 32-bit guests on a 64-bit ARM hypervisor?
> > > 
> > > I read your explanation above and I don't really understand why you would
> > > want
> > > to de-support it. This works pretty well and I am not aware of any issue
> > > right
> > > now to run 32-bit guest on 64-bit HW.
> > 
> > I am happy either way. The reason why I brought it up is that we don't
> > have a specific test for this in gitlab-ci
> 
> But a gitlab CI test can be added, right? I mean it would seem to be odd to
> use this as a justification because a lot of features (e.g. passthrough,
> suspend/resume...) would end up to be de-support it as gitlab CI is still in
> early stage.

Yes that's fair

> > and Jan raised concerns that
> > greater-than 32-bit values as possible as ret from hypercalls on a
> > 64-bit build of Xen.
> 
> This is a known problem and it was discussed several times on the ML in the
> past years.
> 
> There is a theorical problem because in theory all the hypercalls could return
> a value that can't fit in 32-bit.
> 
> However, AFAIK, only the memory hypercall XENMEM_maximum_gpfn may return a
> 64-bit value on 64-bit Xen.
> 
> It is not a problem for a 32-bit domain issues the hypercall on itself because
> the guest physical maximum address should never be greater than 40-bit (so
> 28-bit page frame number) and therefore could fit in 32-bit.
> 
> The only problem is if you want to use a 32-bit toolstack on 64-bit. But Jan
> sent a patch for SUPPORT.md to clarify this is not meant to always work (see
> [1]).
> 
> Please let me know if you are aware of any other truncations.

No, that's fine. This is exactly what I wanted to know :-)

