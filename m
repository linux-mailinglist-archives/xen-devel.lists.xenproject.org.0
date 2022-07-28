Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0B58489D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 01:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377221.610318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHCmt-0001QY-6Y; Thu, 28 Jul 2022 23:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377221.610318; Thu, 28 Jul 2022 23:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHCmt-0001OQ-3o; Thu, 28 Jul 2022 23:19:27 +0000
Received: by outflank-mailman (input) for mailman id 377221;
 Thu, 28 Jul 2022 23:19:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M61b=YB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oHCmr-0001OK-Mt
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 23:19:25 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6ff24c4-0ecb-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 01:19:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F3812CE25F3;
 Thu, 28 Jul 2022 23:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66C2C433C1;
 Thu, 28 Jul 2022 23:19:16 +0000 (UTC)
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
X-Inumbo-ID: b6ff24c4-0ecb-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659050357;
	bh=vOD2RLdtqPiq1yrJyzNY87OvIyyGZM/AfYEPKERJfNc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TzAByCQPyyOJTgX7Nqten9UyP3OU7x0hGy8kg00PY1i6J7i40RL9zlcxfXvT6dU3r
	 OMJmuRemaiRI5nkcOysPavP4MYUvY/IvZg8tR0Po03/Xbo5i7nEAH+tqnWa4kRNtIj
	 dU8fxmp2luKu74ivvIEScxDPA0ykHo8tADWHgoUlLBJFKhkPmzIEvwZS7wGvDr3UHY
	 qYUV4G7yU5ycWW2G9tTUW+LwGxzP0BaoKRABx/y5xdRAqB0TWSK9FuA9gn8czEjyQ4
	 cw5oymO6XrMcNXiJDyamPNI9SE32Rsy11doC6Ro1VeNhObxKUPq1GLJG23xAdw7cwS
	 Pe1EaILBwx/5w==
Date: Thu, 28 Jul 2022 16:19:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Penny Zheng <penny.zheng@arm.com>
Subject: Re: [PATCH v3 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
In-Reply-To: <20220728075856.1175504-3-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207281618320.4648@ubuntu-linux-20-04-desktop>
References: <20220728075856.1175504-1-burzalodowa@gmail.com> <20220728075856.1175504-3-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Jul 2022, Xenia Ragiadakou wrote:
> Enable CONFIG_STATIC_MEMORY in the existing arm64 build.
> 
> Create a new test job, called qemu-smoke-arm64-gcc-staticmem.
> 
> Adjust qemu-smoke-arm64.sh script to accomodate the static memory test as a
> new test variant. The test variant is determined based on the first argument
> passed to the script. For testing static memory, the argument is 'static-mem'.
> 
> The test configures DOM1 with a static memory region and adds a check in the
> init script.
> The check consists in comparing the contents of the /proc/device-tree
> memory entry with the static memory range with which DOM1 was configured.
> If the memory layout is correct, a message gets printed by DOM1.
> 
> At the end of the qemu run, the script searches for the specific message
> in the logs and fails if not found.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Reviewed-by: Penny Zheng <penny.zheng@arm.com>
> ---
> 
> Changes in v2:
> - enable CONFIG_STATIC_MEMORY for all arm64 builds
> - use the existing qemu-smoke-arm64.sh with an argument passed for
>   distinguishing between tests, instead of creating a new script
> - test does not rely on kernel logs but prints a message itself on success
> - remove the part that enables custom configs for arm64 builds
> - add comments
> - adapt commit message
> 
> Changes in v3:
> - refactor the changes to improve readability, no functionality change intended
> - add Penny's R-b tag
> 
>  automation/gitlab-ci/test.yaml         | 18 ++++++++++++++++++
>  automation/scripts/build               | 10 +++++++++-
>  automation/scripts/qemu-smoke-arm64.sh | 25 ++++++++++++++++++++++++-
>  3 files changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 26bdbcc3ea..6f9f64a8da 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -80,6 +80,24 @@ qemu-smoke-arm64-gcc:
>    tags:
>      - arm64
>  
> +qemu-smoke-arm64-gcc-staticmem:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
> +  needs:
> +    - debian-unstable-gcc-arm64
> +    - kernel-5.9.9-arm64-export
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
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 21b3bc57c8..2b9f2d2b54 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -15,7 +15,15 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
>      make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
>      hypervisor_only="y"
>  else
> -    make -j$(nproc) -C xen defconfig
> +    if [[ "${XEN_TARGET_ARCH}" = "arm64" ]]; then
> +        echo "
> +CONFIG_EXPERT=y
> +CONFIG_UNSUPPORTED=y
> +CONFIG_STATIC_MEMORY=y" > xen/.config
> +        make -j$(nproc) -C xen olddefconfig
> +    else
> +        make -j$(nproc) -C xen defconfig
> +    fi
>  fi
>  
>  # Save the config file before building because build failure causes the script
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index 53086a5ac7..69d9eae7a9 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -2,6 +2,23 @@
>  
>  set -ex
>  
> +test_variant=$1
> +
> +passed="BusyBox"
> +check=""
> +
> +if [[ "${test_variant}" == "static-mem" ]]; then
> +    # Memory range that is statically allocated to DOM1
> +    domu_base="50000000"
> +    domu_size="10000000"
> +    passed="${test_variant} test passed"
> +    check="current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
> +expected=$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})
> +if [[ \"\${expected}\" == \"\${current}\" ]]; then
> +	echo \"${passed}\"
> +fi"
> +fi

I would make a minor code style improvement here:

+if [[ "${test_variant}" == "static-mem" ]]; then
+    # Memory range that is statically allocated to DOM1
+    domu_base="50000000"
+    domu_size="10000000"
+    passed="${test_variant} test passed"
+    check="
+current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
+expected=$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})
+if [[ \"\${expected}\" == \"\${current}\" ]]; then
+	echo \"${passed}\"
+fi
+"
+fi

I can do that on commit. Everything looks good.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

