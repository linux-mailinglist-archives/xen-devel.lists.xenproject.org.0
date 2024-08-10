Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EEB94DB2E
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2024 09:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775071.1185440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scg7b-00029T-OG; Sat, 10 Aug 2024 07:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775071.1185440; Sat, 10 Aug 2024 07:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scg7b-00027m-L0; Sat, 10 Aug 2024 07:02:39 +0000
Received: by outflank-mailman (input) for mailman id 775071;
 Sat, 10 Aug 2024 07:02:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FXrv=PJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1scg7a-00027g-JY
 for xen-devel@lists.xenproject.org; Sat, 10 Aug 2024 07:02:38 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 852bd851-56e6-11ef-8776-851b0ebba9a2;
 Sat, 10 Aug 2024 09:02:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0038CE0B22;
 Sat, 10 Aug 2024 07:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F211C32781;
 Sat, 10 Aug 2024 07:02:32 +0000 (UTC)
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
X-Inumbo-ID: 852bd851-56e6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723273353;
	bh=eoW1in6mmNiosgaxO6oqmstnzl53KTbpDDo9/YwWLJM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qQXpQtGnMW2841viUiZ1QZfkng7b3+XTSv0Ml5QVN+86AUecPLK+GWNkb2x24QKXG
	 SzbYCI6RRBazsLMdeKbJgYu9di2v3qzokDDGMRhR8twgVuZBaJBxVsguL8nQAjKwj7
	 LU1mTp7t0sdb2lH8ubknMGwMy2m+uSLF7Y83qHeYi47br3S9wpHiXZyQXImg7uCQO4
	 JP+9z55MTOoDCpB3nTxUfZ4Pb+ajLEfazn36GMraz8KDHVtaZeuDhYLhwxxwhs6JWC
	 7lyFc3noHO86yHOE2+bPQRsiFPI6LLyacwXIF/Lw9vhPB9GWBbPUi6wLDJABeGpKwY
	 Mheds/S8J36ZA==
Date: Sat, 10 Aug 2024 00:02:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <stefano.stabellini@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, cardoe@cardoe.com, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 0/3] automation: improve pipeline
In-Reply-To: <alpine.DEB.2.22.394.2408091700560.298534@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2408100002210.298534@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2408091700560.298534@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I forgot to add proof that it works:

https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1408058335



On Fri, 9 Aug 2024, Stefano Stabellini wrote:
> Hi all,
> 
> Given the recent change in ARM64 runners, moving a way from a fast
> baremetal ARM64 server to multiple slower ARM64 VMs and server, this
> patch series makes the Gitlab pipeline more resilient to random
> infrastructure failures by:
> 
> - temporarily disabling the Yocto jobs
> - increasing the max timeout of QEMU jobs
> - introducing "expect" so that QEMU jobs can stop as soon as the right
>   string is received instead of waiting until the timeout
> 
> I am making all changes consistent across architectures, even thought
> they are only required for arm64 right now.
> 
> Cheers,
> 
> Stefano
> 
> 
> Stefano Stabellini (3):
>       automation: disable Yocto jobs
>       automation: add "expect" to containers used to run QEMU tests
>       automation: use expect to run QEMU
> 
>  automation/build/debian/12-ppc64le.dockerfile      |  1 +
>  automation/build/debian/12-riscv64.dockerfile      |  1 +
>  .../build/debian/bookworm-arm64v8.dockerfile       |  1 +
>  automation/build/debian/bookworm.dockerfile        |  1 +
>  automation/gitlab-ci/build.yaml                    |  3 ++
>  automation/scripts/qemu-alpine-x86_64.sh           | 15 ++++----
>  automation/scripts/qemu-key.ex                     | 42 ++++++++++++++++++++++
>  automation/scripts/qemu-smoke-dom0-arm32.sh        | 15 ++++----
>  automation/scripts/qemu-smoke-dom0-arm64.sh        | 15 ++++----
>  automation/scripts/qemu-smoke-dom0less-arm32.sh    | 14 ++++----
>  automation/scripts/qemu-smoke-dom0less-arm64.sh    | 14 ++++----
>  automation/scripts/qemu-smoke-ppc64le.sh           | 12 +++----
>  automation/scripts/qemu-smoke-riscv64.sh           | 12 +++----
>  automation/scripts/qemu-smoke-x86-64.sh            | 14 ++++----
>  automation/scripts/qemu-xtf-dom0less-arm64.sh      | 14 ++++----
>  15 files changed, 104 insertions(+), 70 deletions(-)
>  create mode 100755 automation/scripts/qemu-key.ex
> 

