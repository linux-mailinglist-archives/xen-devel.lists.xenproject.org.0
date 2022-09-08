Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA63E5B2A5F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 01:30:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403701.645880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWQxl-0004JN-2C; Thu, 08 Sep 2022 23:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403701.645880; Thu, 08 Sep 2022 23:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWQxk-0004GT-VY; Thu, 08 Sep 2022 23:29:36 +0000
Received: by outflank-mailman (input) for mailman id 403701;
 Thu, 08 Sep 2022 23:29:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KOk=ZL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oWQxj-0004GN-4L
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 23:29:35 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 177d127d-2fce-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 01:29:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8DD37B8211F;
 Thu,  8 Sep 2022 23:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5B8C433D6;
 Thu,  8 Sep 2022 23:29:29 +0000 (UTC)
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
X-Inumbo-ID: 177d127d-2fce-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662679770;
	bh=witO6HDC7GbgouQbK3fwu6qb5Ywe27S1G4e5v2wInhc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hA520OKqdvQuZaPTSKF0kimbKU3n0wOESKnWbx916gc7kdKmWolmPcABz/L5NiAjt
	 upfpCkKs3nsv3hcIget8lOgzQxIGHtXBpp/ZBfst6s2013o2Ja9/OnG0G2kRwkWy+8
	 Fi8/zT48mRoTOez8HGYpO4Jdk/1uHhxWEjiqtBG6YKp0t6q425ATfJiF9Skqt5qRwQ
	 6laXqvUWjT2OIdqhLLvYa5quS507xOjyIcJWIfq+K1kxEmz5gUQ0aI/oQ3h3SkZEQ0
	 RtRdYgiK7MEBfnku1rY5mgsPjeMdAcHxNBu6xwwHTAd03zwV8G/AIMOglsbbZT8pUj
	 4NiEHGgMkZjTA==
Date: Thu, 8 Sep 2022 16:29:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Ayan Kumar Halder <ayankuma@amd.com>
Subject: Re: [for-4.17 v2 1/3] automation: qemu-alpine-arm64-gcc: Use kernel
 5.19
In-Reply-To: <20220908092230.21421-2-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209081629200.157835@ubuntu-linux-20-04-desktop>
References: <20220908092230.21421-1-michal.orzel@amd.com> <20220908092230.21421-2-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Sep 2022, Michal Orzel wrote:
> After qemu-smoke-arm64 was changed to use kernel 5.19 we end up having
> two kernel configurations. This is something not needed and maintaining
> a single kernel version is always easier. Modify qemu-alpine-arm64-gcc
> to use kernel 5.19 and remove kernel 5.9 from tests-artifacts.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - none
> ---
>  automation/gitlab-ci/build.yaml               | 11 ------
>  automation/gitlab-ci/test.yaml                |  2 +-
>  .../kernel/5.9.9-arm64v8.dockerfile           | 34 -------------------
>  3 files changed, 1 insertion(+), 46 deletions(-)
>  delete mode 100644 automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index d2f75a090c0f..720ce6e07ba0 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -586,17 +586,6 @@ alpine-3.12-arm64-rootfs-export:
>    tags:
>      - arm64
>  
> -kernel-5.9.9-arm64-export:
> -  extends: .test-jobs-artifact-common
> -  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.9.9-arm64v8
> -  script:
> -    - mkdir binaries && cp /Image binaries/Image
> -  artifacts:
> -    paths:
> -      - binaries/Image
> -  tags:
> -    - arm64
> -
>  kernel-5.19-arm64-export:
>    extends: .test-jobs-artifact-common
>    image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.19-arm64v8
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 2eb6c3866e2c..07209820b474 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -34,7 +34,7 @@ qemu-alpine-arm64-gcc:
>    needs:
>      - alpine-3.12-gcc-arm64
>      - alpine-3.12-arm64-rootfs-export
> -    - kernel-5.9.9-arm64-export
> +    - kernel-5.19-arm64-export
>      - qemu-system-aarch64-6.0.0-arm64-export
>    artifacts:
>      paths:
> diff --git a/automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile b/automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile
> deleted file mode 100644
> index 053d65a3454e..000000000000
> --- a/automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -FROM arm64v8/debian:unstable
> -LABEL maintainer.name="The Xen Project" \
> -      maintainer.email="xen-devel@lists.xenproject.org"
> -
> -ENV DEBIAN_FRONTEND=noninteractive
> -ENV LINUX_VERSION=5.9.9
> -ENV USER root
> -
> -RUN mkdir /build
> -WORKDIR /build
> -
> -# build depends
> -RUN apt-get update && \
> -    apt-get --quiet --yes install \
> -        build-essential \
> -        libssl-dev \
> -        bc \
> -        curl \
> -        flex \
> -        bison \
> -        && \
> -    \
> -    # Build the kernel
> -    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
> -    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> -    cd linux-"$LINUX_VERSION" && \
> -    make defconfig && \
> -    make -j$(nproc) Image.gz && \
> -    cp arch/arm64/boot/Image / && \
> -    cd /build && \
> -    rm -rf linux-"$LINUX_VERSION"* && \
> -    apt-get autoremove -y && \
> -    apt-get clean && \
> -    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> -- 
> 2.25.1
> 

