Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BC2776BDE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 00:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581400.910083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTrKY-0004hu-Du; Wed, 09 Aug 2023 22:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581400.910083; Wed, 09 Aug 2023 22:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTrKY-0004g2-Ar; Wed, 09 Aug 2023 22:07:02 +0000
Received: by outflank-mailman (input) for mailman id 581400;
 Wed, 09 Aug 2023 22:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTrKX-0004eZ-D1
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 22:07:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e078489-3701-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 00:06:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE258632F6;
 Wed,  9 Aug 2023 22:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F12C433C8;
 Wed,  9 Aug 2023 22:06:53 +0000 (UTC)
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
X-Inumbo-ID: 0e078489-3701-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691618815;
	bh=qN6DogoprZBKjEiveQbJCgpWVxtxZuRS60IAgAoeTUw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j9UVmreC0gSBeyHRtAnmk1XzYstPfldY1jjXSlsG/JL2d2AOlDxpi1OngIstqNoJu
	 PolojbBsI/l2TUSll7sMlMJKVFvbojqtWyRU+FvAwlNErflMEDy3P5bE/cxcNnbeiG
	 5wGtGVVL3XpZedeXgWROmPIy/FNsO1smMdaT/SMK2m62OPmvCx7cEGehN0jH4B5o/y
	 lDTYUBo9K58Ktqkn+MM5mrzDeJPA6qfbLOOIEyF1LhN4STP5TJ+v2qH+JUE3m3zJ99
	 PE+OGcLrrI4ZOGGSTMEf7phHPkLnULPJlZV69M8OTP2CquRkgFX2HIT02/0M76DFe/
	 LN1lQUlxr7bMA==
Date: Wed, 9 Aug 2023 15:06:52 -0700 (PDT)
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
In-Reply-To: <0d7cabca-e0d5-4ab6-a16d-11da35e45149@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308091500130.2127516@ubuntu-linux-20-04-desktop>
References: <5972799c-99a6-73f5-eff2-b24469f7428d@bugseng.com> <01fbd921-8092-aedd-33ec-ef170d8ec6fc@suse.com> <alpine.DEB.2.22.394.2308081457530.2127516@ubuntu-linux-20-04-desktop> <456d6bb5-8fa2-d47a-5d1a-b3bda20e0a5b@suse.com>
 <alpine.DEB.2.22.394.2308091320540.2127516@ubuntu-linux-20-04-desktop> <0d7cabca-e0d5-4ab6-a16d-11da35e45149@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Aug 2023, Julien Grall wrote:
> Hi,
> 
> On 09/08/2023 21:35, Stefano Stabellini wrote:
> > P.S.
> > Julien, Bertrand, do you think we should unsupport (in SUPPORT.md, today
> > it is not clarified) 32-bit guests on a 64-bit ARM hypervisor?
> 
> I read your explanation above and I don't really understand why you would want
> to de-support it. This works pretty well and I am not aware of any issue right
> now to run 32-bit guest on 64-bit HW.

I am happy either way. The reason why I brought it up is that we don't
have a specific test for this in gitlab-ci and Jan raised concerns that
greater-than 32-bit values as possible as ret from hypercalls on a
64-bit build of Xen.

