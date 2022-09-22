Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18275E6F89
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 00:19:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410510.653563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obUX3-0004Wq-DU; Thu, 22 Sep 2022 22:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410510.653563; Thu, 22 Sep 2022 22:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obUX3-0004Un-A8; Thu, 22 Sep 2022 22:18:57 +0000
Received: by outflank-mailman (input) for mailman id 410510;
 Thu, 22 Sep 2022 22:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OXb=ZZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1obUX1-0003nz-Tv
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 22:18:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b3ef223-3ac4-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 00:18:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ECF8C61B79;
 Thu, 22 Sep 2022 22:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4137C433D6;
 Thu, 22 Sep 2022 22:18:52 +0000 (UTC)
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
X-Inumbo-ID: 8b3ef223-3ac4-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663885133;
	bh=Kh6d14hn8XlW3sbe80RX6+n0J+Cdwx4dXkmKqLwdXhc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZgPtx5/QJPt0VhZUBHhosoXawYWiEUzESzz3IDkEaESBPDR7Zd+oNAC0URAcS/aeV
	 ktQOoWYPu9kbMBxD5U/EwfWm9PDkAj5ujRhqSldVgDFabxuG5NsHMS9nP7wWaUdObw
	 Yy3KCyXE/C5YXPeC1vnq4s/c41iu/WUwLDz2yxS/uE8zCH5M7DXA/F9e0iwnWxU2HL
	 lEY1vtPHy2ABgHmqUhUqT7q1s5ze1PUg4EGWh3aca034OZLa5mybFIWsGiZ5k3tdWX
	 HeDxqI24njFdJbs1mnWZ/BS/ME8Honyq59uOlx0bLrDDwhTK/30imw1YuO4gIXilsm
	 zdPKvEo/sO/tg==
Date: Thu, 22 Sep 2022 15:18:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 9/9] automation: Rename qemu-smoke-arm32.sh to
 qemu-smoke-dom0-arm32.sh
In-Reply-To: <20220922134058.1410-10-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209221518340.65421@ubuntu-linux-20-04-desktop>
References: <20220922134058.1410-1-michal.orzel@amd.com> <20220922134058.1410-10-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Sep 2022, Michal Orzel wrote:
> After qemu arm64 test scripts had been renamed to reflect their
> usage, do the same for the qemu arm32 test script. Currently it only
> boots dom0, so we can assume that this script will be used to perform
> dom0 based testing. In the future we will be able to create corresponding
> script qemu-smoke-dom0less-arm32.sh to perform dom0less based testing.
> This is the last step to get rid of ambiguity with regards to naming
> of Arm test scripts.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/test.yaml                            | 8 ++++----
>  .../{qemu-smoke-arm32.sh => qemu-smoke-dom0-arm32.sh}     | 0
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename automation/scripts/{qemu-smoke-arm32.sh => qemu-smoke-dom0-arm32.sh} (100%)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 3b147c88ab08..92e0a1f7c510 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -195,12 +195,12 @@ qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
>    tags:
>      - arm64
>  
> -qemu-smoke-arm32-gcc:
> +qemu-smoke-dom0-arm32-gcc:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:unstable-arm64v8
>    script:
> -    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
> +    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
>    needs:
>      - debian-unstable-gcc-arm32
>      - qemu-system-aarch64-6.0.0-arm32-export
> @@ -212,12 +212,12 @@ qemu-smoke-arm32-gcc:
>    tags:
>      - arm64
>  
> -qemu-smoke-arm32-gcc-debug:
> +qemu-smoke-dom0-arm32-gcc-debug:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:unstable-arm64v8
>    script:
> -    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
> +    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
>    needs:
>      - debian-unstable-gcc-arm32-debug
>      - qemu-system-aarch64-6.0.0-arm32-export
> diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
> similarity index 100%
> rename from automation/scripts/qemu-smoke-arm32.sh
> rename to automation/scripts/qemu-smoke-dom0-arm32.sh
> -- 
> 2.25.1
> 

