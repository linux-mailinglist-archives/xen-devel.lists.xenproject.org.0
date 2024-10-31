Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E2A9B92B3
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 14:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829149.1244236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6s8Y-0001Hi-Mv; Fri, 01 Nov 2024 13:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829149.1244236; Fri, 01 Nov 2024 13:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6s8Y-0001Fa-Iu; Fri, 01 Nov 2024 13:56:26 +0000
Received: by outflank-mailman (input) for mailman id 829149;
 Fri, 01 Nov 2024 13:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CTM=R4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t6s8W-0001BN-Gc
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 13:56:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1216cfa5-9859-11ef-a0c5-8be0dac302b0;
 Fri, 01 Nov 2024 14:56:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D3D905CA6D2;
 Thu, 31 Oct 2024 23:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDBEC4CEC3;
 Thu, 31 Oct 2024 23:05:39 +0000 (UTC)
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
X-Inumbo-ID: 1216cfa5-9859-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjEyMTZjZmE1LTk4NTktMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDY5MzgwLjU2NTc3MSwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730415940;
	bh=vgAj05OxU6kcA7YqY28vjC41zebEtUrk44ZKK1avSuE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ti6ZVyrQ3QyalwxSPKzZiESkcB6Lp++vkcEW/y636sWX63snyeJR/YEF8RHWFomN3
	 6EXJAcCtfjlm+cIandKd/+aC5g/mvuaZNELKFZaPBLDZBF/IgTTc75auca52pOJQ3Y
	 0XXdZJH6R4EHGhvESOa8+KBpCVS7oYjTjS+28Doa3B4O2UiGcFDqB1YqaNHfCUCnfU
	 DN+gleMbi49EwdCR11xln++/URHqhYEewcnCe4DgE+ZJ4e1XLRsPyVz7lGgcR79L1y
	 ZjA4Xc+m9xKzqJWg97Vvg5TX16oX5K4IQgmYQ3t3Ts0rtQHjLxtM0VQQo8t5X0vRjF
	 FKSPBhsFTSGRg==
Date: Thu, 31 Oct 2024 16:05:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    Victor Lira <victorm.lira@amd.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] CI: Drop alpine-3.18-rootfs-export and use
 test-artefacts
In-Reply-To: <86a60aec-f259-41be-92a0-ce66ce24f4ae@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2410311559460.2525410@ubuntu-linux-20-04-desktop>
References: <20241031190043.3011299-1-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2410311546170.2525410@ubuntu-linux-20-04-desktop> <86a60aec-f259-41be-92a0-ce66ce24f4ae@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Oct 2024, Andrew Cooper wrote:
> On 31/10/2024 10:46 pm, Stefano Stabellini wrote:
> > On Thu, 31 Oct 2024, Andrew Cooper wrote:
> >> The Argo work already moved this artefact into the new form.  Reuse that, and
> >> drop one test job.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > This is good but should we also remove
> > automation/tests-artifacts/alpine/3.18.dockerfile since we are at it?
> 
> Well, that's another thing that needs careful consideration.
> 
> That dockerfile needs updating in tandem with the build container (or
> lib$FOO.so's don't work when running the test), and it's hard enough to
> keep track of things when they're all in one repo.

Uhm, you have a good point. Two things come to mind. First, for this
patch:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


Second, I think maybe it would be better for test-artifacts to use the
build containers from xen.git/automation/build ? So that at least all
build containers come from the same place?

For instance, we would have to add any missing dependencies to
automation/build/alpine/3.18.dockerfile, from the list currently in
images/alpine/x86_64-build.dockerfile. Only a couple of things are
missing. Then remove images/alpine/x86_64-build.dockerfile, and use
registry.gitlab.com/xen-project/xen/alpine:3.18 in the test-artifacts
build jobs?


