Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778D7A90F1E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 01:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956759.1350043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Bmu-0000Er-F4; Wed, 16 Apr 2025 23:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956759.1350043; Wed, 16 Apr 2025 23:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Bmu-0000Cm-C0; Wed, 16 Apr 2025 23:03:24 +0000
Received: by outflank-mailman (input) for mailman id 956759;
 Wed, 16 Apr 2025 23:03:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVf=XC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5Bms-0000Cg-Se
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 23:03:22 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd7e2cd6-1b16-11f0-9eaf-5ba50f476ded;
 Thu, 17 Apr 2025 01:03:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8CBEA4A371;
 Wed, 16 Apr 2025 23:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EE2C4CEE2;
 Wed, 16 Apr 2025 23:03:18 +0000 (UTC)
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
X-Inumbo-ID: fd7e2cd6-1b16-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744844599;
	bh=sHcVmZMzDb1QRF4spWG2Y4SYz35CPMy3X6mpp0ByB0I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i+6rMlED/9/8ZxKfe5vrvZ+aBGtPgJvBnQA+p17MCJGUrLaGE5O6dUAufFsCc5Q20
	 /mJZb4WwPAgR7cJZ+lf+QSr1qNTTsLOyzb4DK7/2jhPUW/0iiWYZdIL8x1f61hVtrO
	 XDeBanRRKpsx2xynmUkOZOeE/i5MLcEfzeh18FdWITW3be4LFvsbd7SoxYyIB6BExG
	 qRsVsFiV38as0T3TOvxNZPpChdxZgyzH5BdrEwstUUc1qcxK0wOVAITEiqcIb9iqyd
	 1eKL7X77iuASLZq+J2R1RVtup2rDFjrUmWj4xstmPQqn51vfpeyGw2PlPVKS5CKL2q
	 c78n+GtO9x5OQ==
Date: Wed, 16 Apr 2025 16:03:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] CI: Add Arm64/Arm32 MPU build jobs
In-Reply-To: <20250416082130.236530-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504161602250.8008@ubuntu-linux-20-04-desktop>
References: <20250416082130.236530-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Apr 2025, Michal Orzel wrote:
> Just like for RISCV and PPC, the earlier we enable the CI build the
> better.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>  - add Arm32 job given recently committed series
> 
> Pipeline:
> https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/1771015642
> ---
>  automation/gitlab-ci/build.yaml | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index ac5367874526..ab5211f77e5e 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -379,6 +379,16 @@ debian-bookworm-gcc-arm32-debug-earlyprintk:
>        CONFIG_EARLY_UART_CHOICE_PL011=y
>        CONFIG_EARLY_UART_BASE_ADDRESS=0x9000000
>  
> +debian-bookworm-gcc-arm32-debug-mpu:
> +  extends: .gcc-arm32-cross-build-debug
> +  variables:
> +    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
> +    HYPERVISOR_ONLY: y
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_XEN_START_ADDRESS=0x0
> +      CONFIG_MPU=y
> +      CONFIG_UNSUPPORTED=y
> +
>  # Arm builds
>  
>  debian-bookworm-gcc-arm64:
> @@ -443,6 +453,16 @@ alpine-3.18-gcc-debug-arm64-earlyprintk:
>        CONFIG_EARLY_UART_CHOICE_PL011=y
>        CONFIG_EARLY_UART_BASE_ADDRESS=0x9000000
>  
> +alpine-3.18-gcc-debug-arm64-mpu:
> +  extends: .gcc-arm64-build-debug
> +  variables:
> +    CONTAINER: alpine:3.18-arm64v8
> +    HYPERVISOR_ONLY: y
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_XEN_START_ADDRESS=0x0
> +      CONFIG_MPU=y
> +      CONFIG_UNSUPPORTED=y
> +
>  # Yocto test jobs
>  yocto-qemuarm64:
>    extends: .yocto-test-arm64
> -- 
> 2.25.1
> 
> 

