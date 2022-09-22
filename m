Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807735E6F84
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 00:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410502.653542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obUWJ-0003WA-Sz; Thu, 22 Sep 2022 22:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410502.653542; Thu, 22 Sep 2022 22:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obUWJ-0003Tn-PN; Thu, 22 Sep 2022 22:18:11 +0000
Received: by outflank-mailman (input) for mailman id 410502;
 Thu, 22 Sep 2022 22:18:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OXb=ZZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1obUWI-0003TW-8a
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 22:18:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 705bc9f8-3ac4-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 00:18:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA7AEB80DBA;
 Thu, 22 Sep 2022 22:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2734CC433C1;
 Thu, 22 Sep 2022 22:18:07 +0000 (UTC)
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
X-Inumbo-ID: 705bc9f8-3ac4-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663885087;
	bh=JIZPGRbIdrHvpam4Jr+pvhp6AxW+mkuh3Gw2sShRzxI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G6RO83Hy7uArWz7tfbQ/gkkYdXYe8MtKvsRnn9zuX2Z+lArcybTtbgdWpQbsuB4Eb
	 aAzFe7XYYEkIj8W8Ipmitzwr2n3jzXMf0y8VUS4oVW3xYs07YMs2Oaqpu2ajZoY+uV
	 scAdSZ8Y8/umEcVqJZNP2PGN9merR285HOtcoQpa5T/pf5dynUxlsBeZZuO/gnSwKg
	 pJJPR6R4LVSoGOe3TN336liPToRFN8YWIzBJlWjQCleBjB4JCknVqncOEvrCYqSjng
	 NH8wFECJ/1ixoOv6p1H+8qi+w6j7+o1LR9JjQMA6WeQoCB1vyzItqJUVz7mmIqk84p
	 hn3RZPZb8TTvg==
Date: Thu, 22 Sep 2022 15:18:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 7/9] automation: Rename qemu-smoke-arm64.sh to
 qemu-smoke-dom0less-arm64.sh
In-Reply-To: <20220922134058.1410-8-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209221517410.65421@ubuntu-linux-20-04-desktop>
References: <20220922134058.1410-1-michal.orzel@amd.com> <20220922134058.1410-8-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Sep 2022, Michal Orzel wrote:
> Testing arm64 is done using the qemu-alpine-arm64.sh and
> qemu-smoke-arm64.sh scripts. These scripts are executed with exactly
> the same artifacts (container, rootfs, kernel, qemu) and the only
> difference is that the former is used to perform dom0 based testing
> and the latter - dom0less based testing.
> 
> Because the current naming is quite umbiguous, rename qemu-smoke-arm64.sh
> script to qemu-smoke-dom0less-arm64.sh to reflect its usage.
> 
> qemu-alpine-arm64.sh will be renamed in the follow-up patch.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/test.yaml                | 24 +++++++++----------
>  ...-arm64.sh => qemu-smoke-dom0less-arm64.sh} |  0
>  2 files changed, 12 insertions(+), 12 deletions(-)
>  rename automation/scripts/{qemu-smoke-arm64.sh => qemu-smoke-dom0less-arm64.sh} (100%)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 1b51030c6175..f620622671f8 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -81,12 +81,12 @@ qemu-alpine-x86_64-gcc:
>    tags:
>      - x86_64
>  
> -qemu-smoke-arm64-gcc:
> +qemu-smoke-dom0less-arm64-gcc:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:unstable-arm64v8
>    script:
> -    - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
>    needs:
>      - alpine-3.12-gcc-arm64
>      - alpine-3.12-arm64-rootfs-export
> @@ -100,12 +100,12 @@ qemu-smoke-arm64-gcc:
>    tags:
>      - arm64
>  
> -qemu-smoke-arm64-gcc-debug:
> +qemu-smoke-dom0less-arm64-gcc-debug:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:unstable-arm64v8
>    script:
> -    - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
>    needs:
>      - alpine-3.12-gcc-debug-arm64
>      - alpine-3.12-arm64-rootfs-export
> @@ -119,12 +119,12 @@ qemu-smoke-arm64-gcc-debug:
>    tags:
>      - arm64
>  
> -qemu-smoke-arm64-gcc-staticmem:
> +qemu-smoke-dom0less-arm64-gcc-staticmem:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:unstable-arm64v8
>    script:
> -    - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
>    needs:
>      - alpine-3.12-gcc-arm64-staticmem
>      - alpine-3.12-arm64-rootfs-export
> @@ -138,12 +138,12 @@ qemu-smoke-arm64-gcc-staticmem:
>    tags:
>      - arm64
>  
> -qemu-smoke-arm64-gcc-debug-staticmem:
> +qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:unstable-arm64v8
>    script:
> -    - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
>    needs:
>      - alpine-3.12-gcc-debug-arm64-staticmem
>      - alpine-3.12-arm64-rootfs-export
> @@ -157,12 +157,12 @@ qemu-smoke-arm64-gcc-debug-staticmem:
>    tags:
>      - arm64
>  
> -qemu-smoke-arm64-gcc-boot-cpupools:
> +qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:unstable-arm64v8
>    script:
> -    - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
>    needs:
>      - alpine-3.12-gcc-arm64-boot-cpupools
>      - alpine-3.12-arm64-rootfs-export
> @@ -176,12 +176,12 @@ qemu-smoke-arm64-gcc-boot-cpupools:
>    tags:
>      - arm64
>  
> -qemu-smoke-arm64-gcc-debug-boot-cpupools:
> +qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:unstable-arm64v8
>    script:
> -    - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
>    needs:
>      - alpine-3.12-gcc-debug-arm64-boot-cpupools
>      - alpine-3.12-arm64-rootfs-export
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> similarity index 100%
> rename from automation/scripts/qemu-smoke-arm64.sh
> rename to automation/scripts/qemu-smoke-dom0less-arm64.sh
> -- 
> 2.25.1
> 

