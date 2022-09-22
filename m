Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602965E6F88
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 00:18:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410506.653553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obUWh-00040w-4l; Thu, 22 Sep 2022 22:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410506.653553; Thu, 22 Sep 2022 22:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obUWh-0003xz-1v; Thu, 22 Sep 2022 22:18:35 +0000
Received: by outflank-mailman (input) for mailman id 410506;
 Thu, 22 Sep 2022 22:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OXb=ZZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1obUWf-0003nz-51
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 22:18:33 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dec8fe5-3ac4-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 00:18:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87B7BB80DBA;
 Thu, 22 Sep 2022 22:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7C1C433D7;
 Thu, 22 Sep 2022 22:18:29 +0000 (UTC)
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
X-Inumbo-ID: 7dec8fe5-3ac4-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663885110;
	bh=WIK4Gh6i42n8O29OOR6jw11N6uvROORiLVlXlF2mn6c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nlpuPJvs3PcvYYwVFRAnOc5EpEr4j3MPciChtqzexaajM3c8VfzpkXhuXTO/bx9X3
	 hG31KzXjRJs0WQuu2RlBSoqB+ZLeFgSDGF+BJ1AV/UququzID1PBRGHr3tEJxG8UTH
	 Pyua+cp6JrMsIosRJZGozAMQr3wjZDU4hHe+pLuh86BJX7wtd/wVeh6oZpCOVPq/ip
	 9mNgnHuWJ9GQyCeAV5w1i/t8Z5VraTmkXSfRaWBVo6vdgqJFOYu3FtkPgsPJuvNRv8
	 KGrJQXFN0PUlVx9fZITVhqzB7Ke1sZlpiY7RPUy2pYk/B2dxy+HdXKyQFRUR9jND7D
	 3slDpi3xcifIA==
Date: Thu, 22 Sep 2022 15:18:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 8/9] automation: Rename qemu-alpine-arm64.sh to
 qemu-smoke-dom0-arm64.sh
In-Reply-To: <20220922134058.1410-9-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209221518110.65421@ubuntu-linux-20-04-desktop>
References: <20220922134058.1410-1-michal.orzel@amd.com> <20220922134058.1410-9-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Sep 2022, Michal Orzel wrote:
> qemu-alpine-arm64.sh script is used to perform dom0 based testing.
> Rename this script to qemu-smoke-dom0-arm64.sh to reflect its usage.
> Also rename the corresponding test jobs.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/test.yaml                            | 8 ++++----
>  .../{qemu-alpine-arm64.sh => qemu-smoke-dom0-arm64.sh}    | 0
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename automation/scripts/{qemu-alpine-arm64.sh => qemu-smoke-dom0-arm64.sh} (100%)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index f620622671f8..3b147c88ab08 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -25,12 +25,12 @@ build-each-commit-gcc:
>    tags:
>      - x86_64
>  
> -qemu-alpine-arm64-gcc:
> +qemu-smoke-dom0-arm64-gcc:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:unstable-arm64v8
>    script:
> -    - ./automation/scripts/qemu-alpine-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> +    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
>    needs:
>      - alpine-3.12-gcc-arm64
>      - alpine-3.12-arm64-rootfs-export
> @@ -44,12 +44,12 @@ qemu-alpine-arm64-gcc:
>    tags:
>      - arm64
>  
> -qemu-alpine-arm64-gcc-debug:
> +qemu-smoke-dom0-arm64-gcc-debug:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:unstable-arm64v8
>    script:
> -    - ./automation/scripts/qemu-alpine-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> +    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
>    needs:
>      - alpine-3.12-gcc-debug-arm64
>      - alpine-3.12-arm64-rootfs-export
> diff --git a/automation/scripts/qemu-alpine-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
> similarity index 100%
> rename from automation/scripts/qemu-alpine-arm64.sh
> rename to automation/scripts/qemu-smoke-dom0-arm64.sh
> -- 
> 2.25.1
> 

