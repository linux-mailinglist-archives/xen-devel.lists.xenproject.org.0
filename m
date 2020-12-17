Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAE32DDBB9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 00:03:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56214.98266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq2IT-000178-Fa; Thu, 17 Dec 2020 23:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56214.98266; Thu, 17 Dec 2020 23:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq2IT-00016m-CQ; Thu, 17 Dec 2020 23:02:57 +0000
Received: by outflank-mailman (input) for mailman id 56214;
 Thu, 17 Dec 2020 23:02:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHja=FV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kq2IR-00016h-Vv
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 23:02:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aadaaac4-5c45-4e9e-b86f-2cae4a78d93c;
 Thu, 17 Dec 2020 23:02:55 +0000 (UTC)
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
X-Inumbo-ID: aadaaac4-5c45-4e9e-b86f-2cae4a78d93c
Date: Thu, 17 Dec 2020 15:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608246174;
	bh=MhszyCe1+FYfdc91t8oZfrS6Fvqvd3u3aMqB4kZ3N+w=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=G3I62Na6SRYto3lBUVqN4dE9T45P/s+yaZlhjUBRJEzIFf3XreZWyEdN3z+FuCDX2
	 ChSYnjg6aMBZCBTcDBBRmUKzgnzFJDxcy4RMXcwyy8Gq1YPYTlamNEg48IdU1UDN0h
	 +8lAX7HYGsOZZ/CJWbTCOWHwzSrcbXrUnfgSCg0WMUy3A5Uu0eVvsFI0MJC9ncyoMu
	 RoN7CriOFToRVy+FIxHsriUJ3Cw470qj81yJ0ndcLef35MHhd8Ag0L5By6DGlYOeXQ
	 osDOxcBEhKuOQiaJROrvLx+3ttPEA7yfjNNNeTXP9dafY/YGr1mxypYC7lH3Is8Xe1
	 eF/YhGbA1swJw==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: famzheng@amazon.com, sstabellini@kernel.org, cardoe@cardoe.com, wl@xen.org, 
    Bertrand.Marquis@arm.com, julien@xen.org
Subject: Re: [PATCH v4 0/8] xen/arm: Emulate ID registers
In-Reply-To: <160823586491.13274.572144728643942444@600e7e483b3a>
Message-ID: <alpine.DEB.2.21.2012171502300.4040@sstabellini-ThinkPad-T480s>
References: <160823586491.13274.572144728643942444@600e7e483b3a>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Actually it passed. It was just a transient internet issue.


On Thu, 17 Dec 2020, no-reply@patchew.org wrote:
> Hi,
> 
> Patchew automatically ran gitlab-ci pipeline with this patch (series) applied, but the job failed. Maybe there's a bug in the patches?
> 
> You can find the link to the pipeline near the end of the report below:
> 
> Type: series
> Message-id: cover.1608214355.git.bertrand.marquis@arm.com
> Subject: [PATCH v4 0/8] xen/arm: Emulate ID registers
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> sleep 10
> patchew gitlab-pipeline-check -p xen-project/patchew/xen
> === TEST SCRIPT END ===
> 
> warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> From https://gitlab.com/xen-project/patchew/xen
>    8e0fe4fe5f..904148ecb4  master     -> master
> warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> From https://gitlab.com/xen-project/patchew/xen
>  * [new tag]               patchew/cover.1608214355.git.bertrand.marquis@arm.com -> patchew/cover.1608214355.git.bertrand.marquis@arm.com
> Switched to a new branch 'test'
> 4fc8dff44c xen/arm: Activate TID3 in HCR_EL2
> d72e6d1faa xen/arm: Add CP10 exception support to handle MVFR
> 9ef18928a0 xen/arm: Add handler for cp15 ID registers
> 09f61edd55 xen/arm: Add handler for ID registers on arm64
> 0a14368a8f xen/arm: create a cpuinfo structure for guest
> 01fd2fca83 xen/arm: Add arm64 ID registers definitions
> e87a25c913 xen/arm: Add ID registers and complete cpuinfo
> 66f3ee6d1a xen/arm: Use READ_SYSREG instead of 32/64 versions
> 
> === OUTPUT BEGIN ===
> [2020-12-17 16:52:57] Looking up pipeline...
> [2020-12-17 16:52:58] Found pipeline 231473331:
> 
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/231473331
> 
> [2020-12-17 16:52:58] Waiting for pipeline to finish...
> [2020-12-17 17:08:03] Still waiting...
> [2020-12-17 17:23:09] Still waiting...
> [2020-12-17 17:38:13] Still waiting...
> [2020-12-17 17:53:18] Still waiting...
> [2020-12-17 18:08:22] Still waiting...
> [2020-12-17 18:23:27] Still waiting...
> [2020-12-17 18:38:32] Still waiting...
> [2020-12-17 18:53:36] Still waiting...
> [2020-12-17 19:08:42] Still waiting...
> [2020-12-17 19:23:48] Still waiting...
> [2020-12-17 19:38:53] Still waiting...
> [2020-12-17 19:53:58] Still waiting...
> [2020-12-17 20:09:03] Still waiting...
> [2020-12-17 20:11:03] Pipeline failed
> [2020-12-17 20:11:04] Job 'qemu-smoke-x86-64-clang-pvh' in stage 'test' is skipped
> [2020-12-17 20:11:04] Job 'qemu-smoke-x86-64-gcc-pvh' in stage 'test' is skipped
> [2020-12-17 20:11:04] Job 'qemu-smoke-x86-64-clang' in stage 'test' is skipped
> [2020-12-17 20:11:04] Job 'qemu-smoke-x86-64-gcc' in stage 'test' is skipped
> [2020-12-17 20:11:04] Job 'build-each-commit-gcc' in stage 'test' is skipped
> [2020-12-17 20:11:04] Job 'debian-unstable-gcc-debug-arm64' in stage 'build' is failed
> [2020-12-17 20:11:04] Job 'debian-unstable-gcc-arm64' in stage 'build' is failed
> === OUTPUT END ===
> 
> Test command exited with code: 1

