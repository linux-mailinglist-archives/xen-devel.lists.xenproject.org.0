Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0DA733A0E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 21:39:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550376.859417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAFHC-00082G-2f; Fri, 16 Jun 2023 19:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550376.859417; Fri, 16 Jun 2023 19:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAFHB-000801-Vn; Fri, 16 Jun 2023 19:38:29 +0000
Received: by outflank-mailman (input) for mailman id 550376;
 Fri, 16 Jun 2023 19:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlCr=CE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qAFHA-0007nJ-PR
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 19:38:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ceb35c6-0c7d-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 21:38:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 253E561D0A;
 Fri, 16 Jun 2023 19:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89C6C433C8;
 Fri, 16 Jun 2023 19:38:24 +0000 (UTC)
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
X-Inumbo-ID: 5ceb35c6-0c7d-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686944305;
	bh=WXB/ArnwpjvVIhXCr6VXVgcO588Ecvuq5T24cMabAF8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aU9tWRREG6KkPw4n1n8G8haM9PzE5rrRS5y8a8lgohz4bz1ee41Itt1Viy5wxOO+B
	 cVHAOZl++uuRG2yuEUxOZLHv9CWqeecx+nKVZTN94Ia+41U6Q4ZEtfE7I07getc2YM
	 BeprDlXXoeozjHuEe+G1fJ6MSCYZm6NPyoHHy4UKFyq4jZW7bXhl1RAcq1XV2vRVY6
	 CzyExZRWDq+J81kJKW2jj2lrwGA4yCvXN6x2l8PKRbcJbYw0SebmXyYOug0hld4BLP
	 rIh5E1tH708JXfm3sD7iA9JpejCfBGURVgkUxcvXuwpxlRmXKEldYpsivBY1WwlO1m
	 4tRHqdujIYaog==
Date: Fri, 16 Jun 2023 12:38:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Shawn Anastasio <sanastasio@raptorengineering.com>
cc: xen-devel@lists.xenproject.org, tpearson@raptorengineering.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 3/4] automation: Add ppc64le cross-build jobs
In-Reply-To: <1a09823b03b5054c97efcf7008f9626d8ee83f49.1686936278.git.sanastasio@raptorengineering.com>
Message-ID: <alpine.DEB.2.22.394.2306161237500.897208@ubuntu-linux-20-04-desktop>
References: <cover.1686936278.git.sanastasio@raptorengineering.com> <1a09823b03b5054c97efcf7008f9626d8ee83f49.1686936278.git.sanastasio@raptorengineering.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Jun 2023, Shawn Anastasio wrote:
> Add build jobs to cross-compile Xen for ppc64le.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/build.yaml | 60 +++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 420ffa5acb..bd8c7332db 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -183,6 +183,33 @@
>    variables:
>      <<: *gcc
>  
> +.ppc64le-cross-build-tmpl:
> +  <<: *build
> +  variables:
> +    XEN_TARGET_ARCH: ppc64
> +  tags:
> +    - x86_64
> +
> +.ppc64le-cross-build:
> +  extends: .ppc64le-cross-build-tmpl
> +  variables:
> +    debug: n
> +
> +.ppc64le-cross-build-debug:
> +  extends: .ppc64le-cross-build-tmpl
> +  variables:
> +    debug: y
> +
> +.gcc-ppc64le-cross-build:
> +  extends: .ppc64le-cross-build
> +  variables:
> +    <<: *gcc
> +
> +.gcc-ppc64le-cross-build-debug:
> +  extends: .ppc64le-cross-build-debug
> +  variables:
> +    <<: *gcc
> +
>  .yocto-test:
>    stage: build
>    image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> @@ -516,6 +543,39 @@ archlinux-current-gcc-riscv64-debug-randconfig:
>      EXTRA_FIXED_RANDCONFIG:
>        CONFIG_COVERAGE=n
>  
> +# Power cross-build
> +debian-bullseye-gcc-ppc64le:
> +  extends: .gcc-ppc64le-cross-build
> +  variables:
> +    CONTAINER: debian:bullseye-ppc64le
> +    KBUILD_DEFCONFIG: openpower_defconfig
> +    HYPERVISOR_ONLY: y
> +
> +debian-bullseye-gcc-ppc64le-debug:
> +  extends: .gcc-ppc64le-cross-build-debug
> +  variables:
> +    CONTAINER: debian:bullseye-ppc64le
> +    KBUILD_DEFCONFIG: openpower_defconfig
> +    HYPERVISOR_ONLY: y
> +
> +debian-bullseye-gcc-ppc64le-randconfig:
> +  extends: .gcc-ppc64le-cross-build
> +  variables:
> +    CONTAINER: debian:bullseye-ppc64le
> +    KBUILD_DEFCONFIG: openpower_defconfig
> +    RANDCONFIG: y
> +    EXTRA_FIXED_RANDCONFIG:
> +      CONFIG_COVERAGE=n
> +
> +debian-bullseye-gcc-ppc64le-debug-randconfig:
> +  extends: .gcc-ppc64le-cross-build-debug
> +  variables:
> +    CONTAINER: debian:bullseye-ppc64le
> +    KBUILD_DEFCONFIG: openpower_defconfig
> +    RANDCONFIG: y
> +    EXTRA_FIXED_RANDCONFIG:
> +      CONFIG_COVERAGE=n
> +
>  # Yocto test jobs
>  yocto-qemuarm64:
>    extends: .yocto-test-arm64
> -- 
> 2.30.2
> 

