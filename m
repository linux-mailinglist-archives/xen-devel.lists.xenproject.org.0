Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940E85E85D1
	for <lists+xen-devel@lfdr.de>; Sat, 24 Sep 2022 00:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410970.654158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obr56-00063U-6Q; Fri, 23 Sep 2022 22:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410970.654158; Fri, 23 Sep 2022 22:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obr56-00061h-2q; Fri, 23 Sep 2022 22:23:36 +0000
Received: by outflank-mailman (input) for mailman id 410970;
 Fri, 23 Sep 2022 22:23:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNmR=Z2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1obr54-00061b-Me
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 22:23:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b91e344-3b8e-11ed-9647-05401a9f4f97;
 Sat, 24 Sep 2022 00:23:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 23A8161597;
 Fri, 23 Sep 2022 22:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCC4C433D6;
 Fri, 23 Sep 2022 22:23:30 +0000 (UTC)
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
X-Inumbo-ID: 5b91e344-3b8e-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663971811;
	bh=E6GXCu7YEWMcFMxVMAB9cXCkBEFihTlj/oscOH+8+/o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RRD0zENM0Fc6AfHrt30s4TXCpfBeLvM8Wj7Jbw3AkJCNK5Kobeh2u5GAkeoFG2gO0
	 qME8de1L3DscwkMv7+gIjQiItAZckYhPCVJwRTZFZS1bU6BTSGEqMZRIXt1SuxI4We
	 iLs4a+ndsOFdSxSbLgMgRL9w6OUWsfBAOfXx1m8ISlqocd0E8A3aR7FUDaTINn0miw
	 lHTO8P2cYbf8bAoGDJwmyW8fK4WLnWgxKCRp+OqYRWe8Dqunne7tCHXOkoqr5yWkyn
	 V3hlkL5K8DpkVvP1oHkDoQqIp6ufoEQMm7H0xu92DXVyHPFdJPk1sE+fKXgFPeypHq
	 k+lNRBY9w/gBw==
Date: Fri, 23 Sep 2022 15:23:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/9] automation: Add Arm containers to containerize
 script
In-Reply-To: <52a75038-7aa0-fb2e-6f4a-1cb749e886a6@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209231522130.922084@ubuntu-linux-20-04-desktop>
References: <20220922134058.1410-1-michal.orzel@amd.com> <20220922134058.1410-5-michal.orzel@amd.com> <Yy27D62mvY3nQENI@perard.uk.xensource.com> <52a75038-7aa0-fb2e-6f4a-1cb749e886a6@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Sep 2022, Michal Orzel wrote:
> Hi Anthony,
> 
> On 23/09/2022 15:56, Anthony PERARD wrote:
> > 
> > 
> > On Thu, Sep 22, 2022 at 03:40:53PM +0200, Michal Orzel wrote:
> >> Script automation/scripts/containerize makes it easy to build Xen within
> >> predefined containers from gitlab container registry. However, it is
> >> currently not possible to use it with Arm containers because they are not
> >> listed in the script. Populate the necessary entries.
> > 
> > FYI, those entry are just helper/shortcut/aliases, you can use any
> > arbitrary container with the script, it just more annoying.
> > 
> > Your patch here allows to write:
> >     CONTAINER=unstable-arm64v8 automation/scripts/containerize
> > but you could write the following instead, for the same result:
> >     CONTAINER=registry.gitlab.com/xen-project/xen/debian:unstable-arm64v8 automation/scripts/containerize
> > 
> > I wonder if the script could select the right container base on the
> > architecture of the host, because "alpine" and "alpine-arm64v8" will not
> > both work on the same machine. It might be nice to just choose "alpine"
> > and the script would select the x86 or arm container automagically. Just
> > an idea, no need to do anything about it.
> I'm not in favor of adding the automatic selection based on the host.
> The reason is that on x86 you can run both x86 and e.g. Arm containers.
> You just need to use register qemu-user-static [1] to perform emulation.
> This is something widely used and I use that to test Arm images/containers on x86 host.
> So you can run both alpine and alpine-arm64v8 on the same machine.

Yeah and modern Docker sets up qemu-user-static automatically without
the user having to do anything. Anthony, you can try it yourself: you
should be able to just:

  docker run -it registry.gitlab.com/xen-project/xen/debian:unstable-arm64v8

on your x86 host if you have a docker new enough

