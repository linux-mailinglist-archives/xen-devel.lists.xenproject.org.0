Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2446F512545
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 00:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315514.534070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqA5-0006cR-2V; Wed, 27 Apr 2022 22:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315514.534070; Wed, 27 Apr 2022 22:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqA4-0006ab-TG; Wed, 27 Apr 2022 22:29:28 +0000
Received: by outflank-mailman (input) for mailman id 315514;
 Wed, 27 Apr 2022 22:29:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83Ve=VF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1njqA4-0006aV-9D
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 22:29:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e354513-c679-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 00:29:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D57F961DDD;
 Wed, 27 Apr 2022 22:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47E5C385A9;
 Wed, 27 Apr 2022 22:29:23 +0000 (UTC)
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
X-Inumbo-ID: 7e354513-c679-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651098564;
	bh=kMi03hBeSV9xIMr6XmWomGlnlMewDhEalAJ2QeRe+3g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uZ1gnPAGJFxQ1sjeLUgykuG4PvUNGqmOJdBj4to/kubpIkC7NZ4u8BaulUPKy0TuO
	 hrEA2YOPoFQfy71FvjVf6WwZT6PZ4aqoh2XmAJi6LnETFEmiHjEcEVG3+gZKwfkaUZ
	 A8kfqzRsgnlXZ5wA3oL0Q3AZd2Jh97nP1ac0QFjfR+WZJLY7VtetcLILSUlOgrwCtJ
	 TKrltObplk7CNL6NInMszXvkqKnJ8YrldJ1pXb+vMvyI+mgOrxBJqjcdvsJl9dfWu2
	 sUhssw4O3oDLBHhtGE7UBuSGIUFcu+zUE9rA5xD2kATYWtWGBVgqv5a5w8gYe3RF9i
	 LPX2DeV6d/FFw==
Date: Wed, 27 Apr 2022 15:29:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 8/8] drivers/exynos4210: Remove unused-but-set variable
In-Reply-To: <ce7b7364-553f-29b7-2cab-644930f4e143@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204271528330.915916@ubuntu-linux-20-04-desktop>
References: <20220427094941.291554-1-michal.orzel@arm.com> <20220427094941.291554-9-michal.orzel@arm.com> <ce7b7364-553f-29b7-2cab-644930f4e143@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Apr 2022, Julien Grall wrote:
> On 27/04/2022 10:49, Michal Orzel wrote:
> > Function exynos4210_uart_init_preirq defines and sets a variable
> > divisor but does not make use of it. Remove the definition and comment
> > out the assignment as this function already has some TODOs.
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> > ---
> > Commenting out a code is a bad practise as well as using TODOs.
> 
> I disagree, having TODOs in the code is useful to track issues that are not
> critical or necessary to update the support state.
> 
> > However the only alternative would be to get rid of divisor variable
> > and TODO comments. I'm open for solutions.
> 
> I am not overly happy with commented code, but I prefer it over removing the
> TODOs comment as you wouldn't address them and the issues are not fixed.
> 
> So for this patch:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

I share the same opinion. I committed all patches except for patch #3
that requires further discussions/changes.

