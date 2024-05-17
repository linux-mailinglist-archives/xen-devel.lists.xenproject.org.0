Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 862F78C8DE4
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 23:53:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724482.1129759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s85Vv-0003jd-7U; Fri, 17 May 2024 21:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724482.1129759; Fri, 17 May 2024 21:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s85Vv-0003ha-4b; Fri, 17 May 2024 21:53:19 +0000
Received: by outflank-mailman (input) for mailman id 724482;
 Fri, 17 May 2024 21:53:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijk8=MU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s85Vt-0003hO-Hq
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 21:53:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbfaef92-1497-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 23:53:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C61A6CE1B82;
 Fri, 17 May 2024 21:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8556C2BD10;
 Fri, 17 May 2024 21:53:10 +0000 (UTC)
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
X-Inumbo-ID: dbfaef92-1497-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715982792;
	bh=BlHaVUWJ8kAYphWXt7I3+BGdUW3wkmdbXEAlEub1lYo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kah0ZXepH2CeO0cSNAAA6Di4MgKbAjgp1QBqsewrMYCJxVqgvz+XJDw2vABd2xjMU
	 F2ug00a/GKEt8n0Ymzvs5wfQ2ZaQLe4BUJuXcbaR24P0EOPRFfmNRgJwwFvJp+eYRp
	 EWs/cT00gtuvpj5nrya70+98DEKJqoGVFkyiD5IejPlN5PDrAudtU1UmHvLnwNUMkH
	 XJHF+ipl8WVBMwSCj193xeN2T+dk/S9JXbUISRrxujGYr9n5mZdQVxYTz1wJOLw9ZC
	 qX6veD1Q+l1WCWzSdMbYRwgVrsVd0j56Poz9vGe43PWpnftosiah8yRa9vDvnpTqd+
	 LHKHa55vARQPQ==
Date: Fri, 17 May 2024 14:53:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 08/12] automation: update kernel for x86 tests
In-Reply-To: <2e6dc425056db1267768fd1bd0a20c444b1f1610.1715867907.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2405171452570.1052252@ubuntu-linux-20-04-desktop>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com> <2e6dc425056db1267768fd1bd0a20c444b1f1610.1715867907.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1717371359-1715982790=:1052252"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1717371359-1715982790=:1052252
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 May 2024, Marek Marczykowski-Górecki wrote:
> Update 6.1.x kernel to the latest version in this branch. This is
> especially needed to include MSI-X related fixes for stubdomain
> ("xen-pciback: Consider INTx disabled when MSI/MSI-X is enabled").
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/build.yaml                     |  4 +-
>  automation/gitlab-ci/test.yaml                      |  2 +-
>  automation/tests-artifacts/kernel/6.1.19.dockerfile | 40 +--------------
>  automation/tests-artifacts/kernel/6.1.90.dockerfile | 40 ++++++++++++++-
>  4 files changed, 43 insertions(+), 43 deletions(-)
>  delete mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile
>  create mode 100644 automation/tests-artifacts/kernel/6.1.90.dockerfile
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 783a0687ba34..9b9e5464f179 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -331,9 +331,9 @@ alpine-3.19-rootfs-export:
>    tags:
>      - x86_64
>  
> -kernel-6.1.19-export:
> +kernel-6.1.90-export:
>    extends: .test-jobs-artifact-common
> -  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
> +  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.90
>    script:
>      - mkdir binaries && cp /bzImage binaries/bzImage
>    artifacts:
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 80d10eb7f476..e3910f4c1a9f 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -12,7 +12,7 @@
>  
>  .x86-64-test-needs: &x86-64-test-needs
>    - alpine-3.19-rootfs-export
> -  - kernel-6.1.19-export
> +  - kernel-6.1.90-export
>  
>  .qemu-arm64:
>    extends: .test-jobs-common
> diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
> deleted file mode 100644
> index 3a4096780d20..000000000000
> --- a/automation/tests-artifacts/kernel/6.1.19.dockerfile
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -FROM --platform=linux/amd64 debian:bookworm
> -LABEL maintainer.name="The Xen Project" \
> -      maintainer.email="xen-devel@lists.xenproject.org"
> -
> -ENV DEBIAN_FRONTEND=noninteractive
> -ENV LINUX_VERSION=6.1.19
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
> -        libelf-dev \
> -        && \
> -    apt-get autoremove -y && \
> -    apt-get clean && \
> -    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> -
> -# Build the kernel
> -RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSION".tar.xz && \
> -    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> -    cd linux-"$LINUX_VERSION" && \
> -    make defconfig && \
> -    make xen.config && \
> -    scripts/config --enable BRIDGE && \
> -    scripts/config --enable IGC && \
> -    cp .config .config.orig && \
> -    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
> -    make -j$(nproc) bzImage && \
> -    cp arch/x86/boot/bzImage / && \
> -    cd /build && \
> -    rm -rf linux-"$LINUX_VERSION"*
> diff --git a/automation/tests-artifacts/kernel/6.1.90.dockerfile b/automation/tests-artifacts/kernel/6.1.90.dockerfile
> new file mode 100644
> index 000000000000..46cadf02ca78
> --- /dev/null
> +++ b/automation/tests-artifacts/kernel/6.1.90.dockerfile
> @@ -0,0 +1,40 @@
> +FROM --platform=linux/amd64 debian:bookworm
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV LINUX_VERSION=6.1.90
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
> +        libelf-dev \
> +        && \
> +    apt-get autoremove -y && \
> +    apt-get clean && \
> +    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> +
> +# Build the kernel
> +RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSION".tar.xz && \
> +    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> +    cd linux-"$LINUX_VERSION" && \
> +    make defconfig && \
> +    make xen.config && \
> +    scripts/config --enable BRIDGE && \
> +    scripts/config --enable IGC && \
> +    cp .config .config.orig && \
> +    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
> +    make -j$(nproc) bzImage && \
> +    cp arch/x86/boot/bzImage / && \
> +    cd /build && \
> +    rm -rf linux-"$LINUX_VERSION"*
> -- 
> git-series 0.9.1
> 
--8323329-1717371359-1715982790=:1052252--

