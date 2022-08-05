Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF3F58B171
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 23:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381583.616290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK5Fh-0005Xg-S4; Fri, 05 Aug 2022 21:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381583.616290; Fri, 05 Aug 2022 21:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK5Fh-0005Uo-O2; Fri, 05 Aug 2022 21:53:05 +0000
Received: by outflank-mailman (input) for mailman id 381583;
 Fri, 05 Aug 2022 21:53:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eWLc=YJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oK5Fg-0005UP-CI
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 21:53:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9f68d4f-1508-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 23:53:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CB4761B4B;
 Fri,  5 Aug 2022 21:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549A4C433D6;
 Fri,  5 Aug 2022 21:53:00 +0000 (UTC)
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
X-Inumbo-ID: f9f68d4f-1508-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659736380;
	bh=YBVb2UuiyL9fYAf2ZD22IiReTkcKo2pe/pMehkWFEYk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=U7g6vpbP7jn1InxCg6+WvtqZsXaZ6UzHHgQM13cbVJQTPqGdBh9rRHQ4+yRJenAsz
	 RN4Vdm+lq/4W9ErYKyFxljAfkwFRBwKVgoaWZjston/H1kqx64iTbTjtE02SmapeBA
	 xNFMSPiEdSwQLodxXD61lnkzEgfXvMOvetj+N7iPMuQlpAnLro5CAL33XidCAjdC9H
	 uP6/NtPQkvnonC1VvZ/Iti6gjwFnqMP+Fha5yiXp1U+KOAoHWmfNeuYeK96G2gnIXq
	 SezsonWbS2PbkhB71q7hEWrfzIl3tyyRkMFVl4zipSUztFWi5erH+6gGDBn/KC3Epf
	 /8UHDGwNAwbzQ==
Date: Fri, 5 Aug 2022 14:52:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] automation: qemu-smoke-arm64: Use kernel 5.19
In-Reply-To: <20220805211741.1869068-2-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208051452480.3147284@ubuntu-linux-20-04-desktop>
References: <20220805211741.1869068-1-burzalodowa@gmail.com> <20220805211741.1869068-2-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 6 Aug 2022, Xenia Ragiadakou wrote:
> Use kernel 5.19 to unblock testing dom0less enhanced.
> This kernel version has the necessary patches for deferring xenbus probe
> until xenstore is fully initialized.
> Also, build kernel with bridging and xen netback support enabled because
> it will be used for testing network connectivity between Dom0 and Dom1
> over a pv network interface.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/build.yaml               | 11 ++++++
>  automation/gitlab-ci/test.yaml                |  4 +-
>  .../kernel/5.19-arm64v8.dockerfile            | 37 +++++++++++++++++++
>  3 files changed, 50 insertions(+), 2 deletions(-)
>  create mode 100644 automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 23b306e7d0..d2f75a090c 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -597,6 +597,17 @@ kernel-5.9.9-arm64-export:
>    tags:
>      - arm64
>  
> +kernel-5.19-arm64-export:
> +  extends: .test-jobs-artifact-common
> +  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.19-arm64v8
> +  script:
> +    - mkdir binaries && cp /Image binaries/Image
> +  artifacts:
> +    paths:
> +      - binaries/Image
> +  tags:
> +    - arm64
> +
>  qemu-system-aarch64-6.0.0-arm64-export:
>    extends: .test-jobs-artifact-common
>    image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 6f9f64a8da..aa633fb655 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -70,7 +70,7 @@ qemu-smoke-arm64-gcc:
>      - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
>    needs:
>      - debian-unstable-gcc-arm64
> -    - kernel-5.9.9-arm64-export
> +    - kernel-5.19-arm64-export
>      - qemu-system-aarch64-6.0.0-arm64-export
>    artifacts:
>      paths:
> @@ -88,7 +88,7 @@ qemu-smoke-arm64-gcc-staticmem:
>      - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
>    needs:
>      - debian-unstable-gcc-arm64
> -    - kernel-5.9.9-arm64-export
> +    - kernel-5.19-arm64-export
>      - qemu-system-aarch64-6.0.0-arm64-export
>    artifacts:
>      paths:
> diff --git a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile b/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
> new file mode 100644
> index 0000000000..e445c1f03a
> --- /dev/null
> +++ b/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
> @@ -0,0 +1,37 @@
> +FROM arm64v8/debian:unstable
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV LINUX_VERSION=5.19
> +ENV USER root
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# build depends
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        build-essential \
> +        libssl-dev \
> +        bc \
> +        curl \
> +        flex \
> +        bison \
> +        && \
> +    \
> +    # Build the kernel
> +    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
> +    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> +    cd linux-"$LINUX_VERSION" && \
> +    make defconfig && \
> +    sed -i 's/CONFIG_IPV6=m/CONFIG_IPV6=y/g' .config && \
> +    sed -i 's/CONFIG_BRIDGE=m/CONFIG_BRIDGE=y/g' .config && \
> +    sed -i 's/# CONFIG_XEN_NETDEV_BACKEND is not set/CONFIG_XEN_NETDEV_BACKEND=y/g' .config && \
> +    make -j$(nproc) Image.gz && \
> +    cp arch/arm64/boot/Image / && \
> +    cd /build && \
> +    rm -rf linux-"$LINUX_VERSION"* && \
> +    apt-get autoremove -y && \
> +    apt-get clean && \
> +    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> -- 
> 2.34.1
> 

