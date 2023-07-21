Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7713375D773
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 00:25:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567720.887138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMyYd-0007wt-RY; Fri, 21 Jul 2023 22:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567720.887138; Fri, 21 Jul 2023 22:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMyYd-0007tg-Ol; Fri, 21 Jul 2023 22:25:07 +0000
Received: by outflank-mailman (input) for mailman id 567720;
 Fri, 21 Jul 2023 22:25:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzSz=DH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMyYc-0007ta-Fv
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 22:25:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fa9a200-2815-11ee-8611-37d641c3527e;
 Sat, 22 Jul 2023 00:25:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1105E61DA6;
 Fri, 21 Jul 2023 22:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39B5C433C8;
 Fri, 21 Jul 2023 22:25:01 +0000 (UTC)
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
X-Inumbo-ID: 6fa9a200-2815-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689978302;
	bh=RHE0mxNohEwFwow60CRuulZInR7LMvCwiWSlLoYZBLY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=urPjiMJhXOBMRMOlqNDl80YBUOcSGQ3KE8JNiY6feaGSyn0BwLx33nD92qxRhYuna
	 GSh1TPdPT0NRJAeKwJe/jwLlzZMGfG7o8eNCgDSBoY99sJu3mrd0RWnGGlW3VFfV6a
	 qWAsTunoHf0cC8vHhpckvpUJYKQTPYdU5SdRQ44MtWkPOtP0pRal0rITuKMgpPMrAt
	 oP42zlQz3g1EXFuhN7QQVkJnG2+Mrn9+CMn9xq9gyBBJez1qYkrh+Rq4KM3hIMPodt
	 XZE4bd53KwCo4yIpMiYU/4MI31EmIP8IwBlXa7RcQ618UR/UXNRbsrz9YsKgEJ39dp
	 Ufw4VuDbHjzEQ==
Date: Fri, 21 Jul 2023 15:25:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation: add ECLAIR pipeline
In-Reply-To: <CAFHJcJs816ZreXXMK4ZOgxeiqowUJyXLUaBOaR9RE9FxTp+bGg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307211523540.3118466@ubuntu-linux-20-04-desktop>
References: <eb5fa852f306790160b967787592553d2fdf3de6.1689887842.git.simone.ballarin@bugseng.com> <alpine.DEB.2.22.394.2307201507070.3118466@ubuntu-linux-20-04-desktop> <CAFHJcJs816ZreXXMK4ZOgxeiqowUJyXLUaBOaR9RE9FxTp+bGg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-282688782-1689978302=:3118466"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-282688782-1689978302=:3118466
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 21 Jul 2023, Simone Ballarin wrote:
> Il giorno ven 21 lug 2023 alle ore 00:29 Stefano Stabellini <sstabellini@kernel.org> ha scritto:
> 
>       Patchew automatically picked it up from xen-devel and started a pipeline
>       here:
> 
>       https://gitlab.com/xen-project/patchew/xen/-/pipelines/939440592
> 
>       However the eclair-x86_64 job failed with:
> 
>       ERROR: Uploading artifacts as "archive" to coordinator... 413 Payload
>       Too Large
> 
> 
> In the next patch, I will avoid uploading the ECLAIR database in GitLab artifacts.
> Of course, the databases can still be accessed via the links in the pipeline logs.
>  
> 
>       Also the eclair-ARM64 job failed but it is not clear to me why.
> 
> 
> The reason is that the WTOKEN variable is missing. This masked variable should be set
> and visible to *all* repositories (xen-project/xen, xen-project/people/.*).

OK this is interesting. I added WTOKEN to https://gitlab.com/xen-project
so I assumed it would propagate to all the subprojects like
https://gitlab.com/xen-project/xen,
https://gitlab.com/xen-project/people/sstabellini, etc. but it looks
like it might have to be added manually at every instance.
--8323329-282688782-1689978302=:3118466--

