Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A8C5EB4C7
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 00:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412113.655307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocww9-0006Xw-Ug; Mon, 26 Sep 2022 22:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412113.655307; Mon, 26 Sep 2022 22:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocww9-0006Vb-R3; Mon, 26 Sep 2022 22:50:53 +0000
Received: by outflank-mailman (input) for mailman id 412113;
 Mon, 26 Sep 2022 22:50:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/HAa=Z5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ocww8-0005b7-BC
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 22:50:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aacf0bc9-3ded-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 00:50:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABE2E60E06;
 Mon, 26 Sep 2022 22:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F76C433D6;
 Mon, 26 Sep 2022 22:50:48 +0000 (UTC)
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
X-Inumbo-ID: aacf0bc9-3ded-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664232649;
	bh=K8ChHpUFnjXjB5frJd8/GeVJ+zkM+67jca2mQVqIhkY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fQpBYujyRLzDo8VgpBLr48wtKWJNf865vjvVabCzgn/+uPB6PdFCtbFeAfu96i1rK
	 QY8vntx6i9Vdj52+oyLdWzC2yvBj2RidF2wk7yYIQ45W7DfafqxLe8keiwEB2abLND
	 TkciDxTNAGbEA6WVF3nZZDC4aRbYVnXwGdkmemD+lwg4TTKadb4jeH/xD+4w29KMYx
	 jNjmTZd+2JB63j3EAChYrPYAcBHnkJZsTiNmORkQMAjDvI/+nZYfgoYB2392zG6jDN
	 r9H+XaSqkQHgxAGkE6RYy1IJ73zU3aEZzqT0JmOzqbV8t1KxbE8vMzWNFxczl2KKP3
	 da/m/SMQo/t2g==
Date: Mon, 26 Sep 2022 15:50:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 04/10] automation: Add debug versions of Arm tests
In-Reply-To: <20220926110423.26030-5-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209261550370.922084@ubuntu-linux-20-04-desktop>
References: <20220926110423.26030-1-michal.orzel@amd.com> <20220926110423.26030-5-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Sep 2022, Michal Orzel wrote:
> At the moment, all the tests are executed on non-debug Xen builds.
> To improve the coverage (e.g. we might catch some asserts), add new
> test jobs using debug Xen builds.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
> Changes in v2:
> - carve out the RAM size change to a separate patch [v2 03/10]
> ---
>  automation/gitlab-ci/build.yaml | 16 ++++++
>  automation/gitlab-ci/test.yaml  | 93 +++++++++++++++++++++++++++++++++
>  2 files changed, 109 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index d931441b910a..6ce92531f61f 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -587,6 +587,15 @@ alpine-3.12-gcc-arm64-staticmem:
>        CONFIG_UNSUPPORTED=y
>        CONFIG_STATIC_MEMORY=y
>  
> +alpine-3.12-gcc-debug-arm64-staticmem:
> +  extends: .gcc-arm64-build-debug
> +  variables:
> +    CONTAINER: alpine:3.12-arm64v8
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_EXPERT=y
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_STATIC_MEMORY=y
> +
>  alpine-3.12-gcc-arm64-boot-cpupools:
>    extends: .gcc-arm64-build
>    variables:
> @@ -594,6 +603,13 @@ alpine-3.12-gcc-arm64-boot-cpupools:
>      EXTRA_XEN_CONFIG: |
>        CONFIG_BOOT_TIME_CPUPOOLS=y
>  
> +alpine-3.12-gcc-debug-arm64-boot-cpupools:
> +  extends: .gcc-arm64-build-debug
> +  variables:
> +    CONTAINER: alpine:3.12-arm64v8
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_BOOT_TIME_CPUPOOLS=y
> +
>  ## Test artifacts common
>  
>  .test-jobs-artifact-common:
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 4f96e6e322de..1b51030c6175 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -44,6 +44,25 @@ qemu-alpine-arm64-gcc:
>    tags:
>      - arm64
>  
> +qemu-alpine-arm64-gcc-debug:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-alpine-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> +  needs:
> +    - alpine-3.12-gcc-debug-arm64
> +    - alpine-3.12-arm64-rootfs-export
> +    - kernel-5.19-arm64-export
> +    - qemu-system-aarch64-6.0.0-arm64-export
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +
>  qemu-alpine-x86_64-gcc:
>    extends: .test-jobs-common
>    variables:
> @@ -81,6 +100,25 @@ qemu-smoke-arm64-gcc:
>    tags:
>      - arm64
>  
> +qemu-smoke-arm64-gcc-debug:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> +  needs:
> +    - alpine-3.12-gcc-debug-arm64
> +    - alpine-3.12-arm64-rootfs-export
> +    - kernel-5.19-arm64-export
> +    - qemu-system-aarch64-6.0.0-arm64-export
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +
>  qemu-smoke-arm64-gcc-staticmem:
>    extends: .test-jobs-common
>    variables:
> @@ -100,6 +138,25 @@ qemu-smoke-arm64-gcc-staticmem:
>    tags:
>      - arm64
>  
> +qemu-smoke-arm64-gcc-debug-staticmem:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
> +  needs:
> +    - alpine-3.12-gcc-debug-arm64-staticmem
> +    - alpine-3.12-arm64-rootfs-export
> +    - kernel-5.19-arm64-export
> +    - qemu-system-aarch64-6.0.0-arm64-export
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +
>  qemu-smoke-arm64-gcc-boot-cpupools:
>    extends: .test-jobs-common
>    variables:
> @@ -119,6 +176,25 @@ qemu-smoke-arm64-gcc-boot-cpupools:
>    tags:
>      - arm64
>  
> +qemu-smoke-arm64-gcc-debug-boot-cpupools:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
> +  needs:
> +    - alpine-3.12-gcc-debug-arm64-boot-cpupools
> +    - alpine-3.12-arm64-rootfs-export
> +    - kernel-5.19-arm64-export
> +    - qemu-system-aarch64-6.0.0-arm64-export
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +
>  qemu-smoke-arm32-gcc:
>    extends: .test-jobs-common
>    variables:
> @@ -136,6 +212,23 @@ qemu-smoke-arm32-gcc:
>    tags:
>      - arm64
>  
> +qemu-smoke-arm32-gcc-debug:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
> +  needs:
> +    - debian-unstable-gcc-arm32-debug
> +    - qemu-system-aarch64-6.0.0-arm32-export
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +
>  qemu-smoke-x86-64-gcc:
>    extends: .test-jobs-common
>    variables:
> -- 
> 2.25.1
> 

