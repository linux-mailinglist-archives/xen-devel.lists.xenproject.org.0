Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB5567A73F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 00:54:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483780.750149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKT6M-0004iz-Q6; Tue, 24 Jan 2023 23:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483780.750149; Tue, 24 Jan 2023 23:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKT6M-0004gC-Mh; Tue, 24 Jan 2023 23:53:18 +0000
Received: by outflank-mailman (input) for mailman id 483780;
 Tue, 24 Jan 2023 23:53:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wk+X=5V=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pKT6K-0004g6-QX
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 23:53:17 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44509881-9c42-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 00:53:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4797DB8091C;
 Tue, 24 Jan 2023 23:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F64C433D2;
 Tue, 24 Jan 2023 23:53:12 +0000 (UTC)
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
X-Inumbo-ID: 44509881-9c42-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674604393;
	bh=F4qaZF8nm21TTmi8T/OgAKB21y/MRxlXkjSnWqnyWzI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bdGmK3Hb7zC1OA9TYSpU/Np0inm6D9EQ1RtY3Kq93R469HRDy9os0vev4XCIOMbQF
	 PDlZMCOWSDNp/QlPoA4mxuiV4/dWsiGHY+Z4rm9tsa0dicC+cFcFMIzlAfkhMErHmS
	 j0PFiay/h/cwNXnWXUiQ5uhjOE8/9CVmSRTL9CI3rCmejBrbmRU+Z4uWA8wf6S5/mD
	 CuBnkZn/Mpk3KSmh8EavQ8ZHG0fDvBouXQKeRQ6pceKXwHrBCkBJmMqx5bF00JGbgq
	 EiPRUaZXCywaUxEMNMYCBZ7JvhHI+ZKZ1mcAKC+4UJz3w+56ygX7RqDwthvqO/z22h
	 /X8oXtEVqnu2A==
Date: Tue, 24 Jan 2023 15:53:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Gianluca Guida <gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation: rename RISCV_64 container and jobs
In-Reply-To: <cea2d287fd65033d8631bf9905ad00652bf11035.1673367923.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2301241552240.1978264@ubuntu-linux-20-04-desktop>
References: <cea2d287fd65033d8631bf9905ad00652bf11035.1673367923.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Jan 2023, Oleksii Kurochko wrote:
> All RISCV_64-related stuff was renamed to be consistent with
> ARM (arm32 is cross build as RISCV_64).
> 
> The patch is based on the following patch series:
> [PATCH *] Basic early_printk and smoke test implementation
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed and committed.

Now the container name is archlinux:current-riscv64, make sure to update
it appropriate in the patch "automation: add RISC-V smoke test" when/if
you send a new version


> ---
>  ...v64.dockerfile => current-riscv64.dockerfile} |  0
>  automation/gitlab-ci/build.yaml                  | 16 ++++++++--------
>  automation/gitlab-ci/test.yaml                   |  4 ++--
>  automation/scripts/containerize                  |  2 +-
>  4 files changed, 11 insertions(+), 11 deletions(-)
>  rename automation/build/archlinux/{riscv64.dockerfile => current-riscv64.dockerfile} (100%)
> 
> diff --git a/automation/build/archlinux/riscv64.dockerfile b/automation/build/archlinux/current-riscv64.dockerfile
> similarity index 100%
> rename from automation/build/archlinux/riscv64.dockerfile
> rename to automation/build/archlinux/current-riscv64.dockerfile
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 6784974619..7ccd153375 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -647,31 +647,31 @@ alpine-3.12-gcc-debug-arm64-boot-cpupools:
>        CONFIG_BOOT_TIME_CPUPOOLS=y
>  
>  # RISC-V 64 cross-build
> -riscv64-cross-gcc:
> +archlinux-current-gcc-riscv64:
>    extends: .gcc-riscv64-cross-build
>    variables:
> -    CONTAINER: archlinux:riscv64
> +    CONTAINER: archlinux:current-riscv64
>      KBUILD_DEFCONFIG: tiny64_defconfig
>      HYPERVISOR_ONLY: y
>  
> -riscv64-cross-gcc-debug:
> +archlinux-current-gcc-riscv64-debug:
>    extends: .gcc-riscv64-cross-build-debug
>    variables:
> -    CONTAINER: archlinux:riscv64
> +    CONTAINER: archlinux:current-riscv64
>      KBUILD_DEFCONFIG: tiny64_defconfig
>      HYPERVISOR_ONLY: y
>  
> -riscv64-cross-gcc-randconfig:
> +archlinux-current-gcc-riscv64-randconfig:
>    extends: .gcc-riscv64-cross-build
>    variables:
> -    CONTAINER: archlinux:riscv64
> +    CONTAINER: archlinux:current-riscv64
>      KBUILD_DEFCONFIG: tiny64_defconfig
>      RANDCONFIG: y
>  
> -riscv64-cross-gcc-debug-randconfig:
> +archlinux-current-gcc-riscv64-debug-randconfig:
>    extends: .gcc-riscv64-cross-build-debug
>    variables:
> -    CONTAINER: archlinux:riscv64
> +    CONTAINER: archlinux:current-riscv64
>      KBUILD_DEFCONFIG: tiny64_defconfig
>      RANDCONFIG: y
>  
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 64f47a0ab9..4ca3e54862 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -57,7 +57,7 @@
>  .qemu-riscv64:
>    extends: .test-jobs-common
>    variables:
> -    CONTAINER: archlinux:riscv64
> +    CONTAINER: archlinux:current-riscv64
>      LOGFILE: qemu-smoke-riscv64.log
>    artifacts:
>      paths:
> @@ -252,7 +252,7 @@ qemu-smoke-riscv64-gcc:
>    script:
>      - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
>    needs:
> -    - riscv64-cross-gcc
> +    - archlinux-current-gcc-riscv64
>  
>  # Yocto test jobs
>  yocto-qemuarm64:
> diff --git a/automation/scripts/containerize b/automation/scripts/containerize
> index 0f4645c4cc..9e508918bf 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -27,7 +27,7 @@ case "_${CONTAINER}" in
>      _alpine) CONTAINER="${BASE}/alpine:3.12" ;;
>      _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.12-arm64v8" ;;
>      _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
> -    _riscv64) CONTAINER="${BASE}/archlinux:riscv64" ;;
> +    _riscv64) CONTAINER="${BASE}/archlinux:current-riscv64" ;;
>      _centos7) CONTAINER="${BASE}/centos:7" ;;
>      _centos72) CONTAINER="${BASE}/centos:7.2" ;;
>      _fedora) CONTAINER="${BASE}/fedora:29";;
> -- 
> 2.38.1
> 

