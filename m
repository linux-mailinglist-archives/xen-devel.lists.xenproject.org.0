Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3239A6BF4D0
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 23:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511298.790284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdI8Z-0005BI-K0; Fri, 17 Mar 2023 22:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511298.790284; Fri, 17 Mar 2023 22:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdI8Z-00059b-Fn; Fri, 17 Mar 2023 22:01:23 +0000
Received: by outflank-mailman (input) for mailman id 511298;
 Fri, 17 Mar 2023 22:01:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGfD=7J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pdI8X-00059V-Gp
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 22:01:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e2b19d2-c50f-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 23:01:19 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDC3560B85;
 Fri, 17 Mar 2023 22:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0993BC433EF;
 Fri, 17 Mar 2023 22:01:15 +0000 (UTC)
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
X-Inumbo-ID: 3e2b19d2-c50f-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679090476;
	bh=C8OL6KQ2Vvfa337+MsWNw9IYsB3GKP/rSoyzFSLfM/s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tfMPqw3prE0xAc552q9YpLjaVhasnPVT48bigjQ7oXEEywLrzPpvQOfqFCbvqQHQi
	 lJ9UxVIgc/WV1bJ7Gs2gZmdsMfDW9DP0QZ2T9KHG/Ja5MbcDvtgAWyBk9KCc9yRv++
	 F5qoYF0RnDnjzqW7IIaMv+QQh43QdE6Ha5DuVJ7HQJgDNQihIXQGJj7t62nXqy8A+h
	 xogbQpfVP8WzFd1YdauieLD7RKDCrh2JoIWYMV2erpOJ5AV+zdMM9wzw1OyAI756LO
	 QgWJdxd8LVTi/v2+1KEg6u7uqjndB51fxdbw3uVXMYEIsjGOgEpuEHhuDAHWRDZWBo
	 fyimkr1Pv04eQ==
Date: Fri, 17 Mar 2023 15:01:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] automation: build 6.1.19 kernel for x86-64 dom0
In-Reply-To: <59ced41c97daac93abe4a2794af289d59808f0ac.1679023966.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2303171436360.3359@ubuntu-linux-20-04-desktop>
References: <cover.5a69c1f96ff446a5872e9dbf6308be9ab278f9df.1679023966.git-series.marmarek@invisiblethingslab.com> <59ced41c97daac93abe4a2794af289d59808f0ac.1679023966.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1776758312-1679089088=:3359"
Content-ID: <alpine.DEB.2.22.394.2303171450160.3359@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1776758312-1679089088=:3359
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2303171450161.3359@ubuntu-linux-20-04-desktop>

On Fri, 17 Mar 2023, Marek Marczykowski-Górecki wrote:
> It will be used in tests added in subsequent patches.
> Enable config options needed for those tests.

Thanks for the patch! Looks great.

Can you also remove the old 5.10.74 Dockerfile
(automation/tests-artifacts/kernel/5.10.74.dockerfile), the
kernel-5.10.74-export job as well and replace kernel-5.10.74-export with
kernel-6.1.19-export as dependency for the qemu-alpine-x86_64-gcc test
job?

I think it makes sense to just keep kernel-6.1.19-export. I tested the
below already and it works fine.

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 2e1a6886df..f28c01fe0e 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -269,7 +269,7 @@ qemu-alpine-x86_64-gcc:
   needs:
     - alpine-3.12-gcc
     - alpine-3.12-rootfs-export
-    - kernel-5.10.74-export
+    - kernel-6.1.19-export



> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  automation/gitlab-ci/build.yaml                     | 11 ++++-
>  automation/tests-artifacts/kernel/6.1.19.dockerfile | 40 ++++++++++++++-
>  2 files changed, 51 insertions(+)
>  create mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 38bb22d8609b..e1799d454c76 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -790,3 +790,14 @@ kernel-5.10.74-export:
>        - binaries/bzImage
>    tags:
>      - x86_64
> +
> +kernel-6.1.19-export:
> +  extends: .test-jobs-artifact-common
> +  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
> +  script:
> +    - mkdir binaries && cp /bzImage binaries/bzImage
> +  artifacts:
> +    paths:
> +      - binaries/bzImage
> +  tags:
> +    - x86_64
> diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
> new file mode 100644
> index 000000000000..c2171555a0a6
> --- /dev/null
> +++ b/automation/tests-artifacts/kernel/6.1.19.dockerfile
> @@ -0,0 +1,40 @@
> +FROM debian:unstable
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV LINUX_VERSION=6.1.19
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
--8323329-1776758312-1679089088=:3359--

