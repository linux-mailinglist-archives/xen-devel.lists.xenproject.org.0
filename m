Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A919AF5BC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 01:12:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825576.1239843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t46zX-0006IX-VI; Thu, 24 Oct 2024 23:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825576.1239843; Thu, 24 Oct 2024 23:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t46zX-0006H3-SI; Thu, 24 Oct 2024 23:11:43 +0000
Received: by outflank-mailman (input) for mailman id 825576;
 Thu, 24 Oct 2024 23:11:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9Wq=RU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t46zX-0006Gm-0R
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 23:11:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53533190-925d-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 01:11:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1420E5C4D95;
 Thu, 24 Oct 2024 23:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74EB6C4CEC7;
 Thu, 24 Oct 2024 23:11:37 +0000 (UTC)
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
X-Inumbo-ID: 53533190-925d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729811498;
	bh=B4N5fOAjcnNfHi8pCEsYXHDBtP66zuk4hiJVUUz5q1Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OGUmJ2Xl+v3767F443G1C+jTvE4b5n8Oc4lcvKd2a5DkAKwHVe0lvZO6qYjojvTz8
	 vsjl6OW2U7L0D9CsRtDgrmX8l+r/FVBGQfcmvuOyhMDSTcSEjdWUlOdICBbe/x0HHw
	 PKT9/pLRY4vgwSnr87+VxchbeyedMCs6f2PXytXsdCbOng5IeHUShSqSSewJPDZpTz
	 d9oimS5J7HmBfdQrPLxSVAaZsP/BBHozHjzD6apbI1jhkVXPDlxKbSY/RrjMYV2Vy4
	 Go6rjvDBHPc6M0zHIG5pjuvEj+VVrbKXqdwE8pp13dY6jg0FdTR2RLKjHBeJXgvROj
	 Sf7CtMFOBoWag==
Date: Thu, 24 Oct 2024 16:11:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Javi Merino <javi.merino@cloud.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v1 5/6] CI: Refresh the Debian 12 cppcheck
 container
In-Reply-To: <a34d46bde06bab872c19119a7466ac8942a0c137.1729760501.git.javi.merino@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2410241610590.3833@ubuntu-linux-20-04-desktop>
References: <cover.1729760501.git.javi.merino@cloud.com> <a34d46bde06bab872c19119a7466ac8942a0c137.1729760501.git.javi.merino@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


> heredocs for readability and use apt-get --no-install-recommends to
> keep the size down.
> 
> Changed the libpcre3-dev dependency to libpcre3, as the -dev package
> is only needed for building, not for running.
> 
> With the cleanups, the size of the container is reduced from 882MB to
> 782MB.
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>

Assuming everything works as expected:
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> I tried updating cppcheck to the latest upstream version (2.15.0) but
> it reports misra errors like:
> 
>     xen/common/sched/cpupool.c(0,0):internalError:error:Bailing out from analysis: Checking file failed: Failed to execute addon 'misra' - exitcode is 1
>     [...]
>     xen/arch/arm/decode.c(220,10):misra-config:error:Because of missing configuration, misra checking is incomplete. There can be false negatives! Variable 'type' is unknown
> 
> The output log xen-cppcheck.txt from job #8164274901 which uses
> cppcheck 2.15.0 can be found at:
> https://gitlab.com/xen-project/people/javimerino/xen/-/jobs/8164274901/artifacts/browse
> 
> Therefore, I'm keeping cppcheck at 2.7, which aligns with what
> docs/misra/cppcheck.txt says is the last tested version.

Yes, better to do the upgrade separately


>  .../debian/12-arm64v8-cppcheck.dockerfile     | 80 +++++++++++++++++++
>  .../build/debian/bookworm-cppcheck.dockerfile | 54 -------------
>  automation/gitlab-ci/build.yaml               | 12 +--
>  automation/scripts/containerize               |  2 +-
>  4 files changed, 87 insertions(+), 61 deletions(-)
>  create mode 100644 automation/build/debian/12-arm64v8-cppcheck.dockerfile
>  delete mode 100644 automation/build/debian/bookworm-cppcheck.dockerfile
> 
> diff --git a/automation/build/debian/12-arm64v8-cppcheck.dockerfile b/automation/build/debian/12-arm64v8-cppcheck.dockerfile
> new file mode 100644
> index 000000000000..a839d4c57bda
> --- /dev/null
> +++ b/automation/build/debian/12-arm64v8-cppcheck.dockerfile
> @@ -0,0 +1,80 @@
> +# syntax=docker/dockerfile:1
> +FROM --platform=linux/arm64/v8 debian:bookworm AS builder
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV CPPCHECK_VERSION=2.7
> +
> +# dependencies for cppcheck build
> +RUN <<EOF
> +#!/bin/bash
> +    set -eu
> +
> +    apt-get update
> +    DEPS=(
> +        build-essential
> +        ca-certificates
> +        curl
> +        libpcre3-dev
> +        python-is-python3
> +    )
> +
> +    apt-get -y --no-install-recommends install "${DEPS[@]}"
> +
> +    rm -rf /var/lib/apt/lists*
> +EOF
> +
> +RUN useradd --home /build --create-home user
> +
> +WORKDIR /build
> +USER user
> +
> +# cppcheck release build (see cppcheck readme.md)
> +RUN <<EOF
> +#!/bin/bash
> +    set -eu
> +
> +    curl -fsSL https://github.com/danmar/cppcheck/archive/"$CPPCHECK_VERSION".tar.gz | tar xvz
> +    cd cppcheck-"$CPPCHECK_VERSION"
> +
> +    MAKE_OPTS=(
> +        MATCHCOMPILER=yes
> +        DESTDIR=/build/out
> +        FILESDIR="/usr/share/cppcheck"
> +        HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
> +    )
> +    make install -j$(nproc) "${MAKE_OPTS[@]}"
> +EOF
> +
> +FROM --platform=linux/arm64/v8 debian:bookworm
> +COPY --from=builder /build/out/usr/bin/cppcheck /usr/bin/cppcheck
> +COPY --from=builder /build/out/usr/share/cppcheck /usr/share/cppcheck
> +
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV USER root
> +
> +# dependencies for cppcheck analysis including Xen-only build/cross-build
> +RUN <<EOF
> +#!/bin/bash
> +    set -eu
> +
> +    useradd --create-home user
> +
> +    apt-get update
> +    DEPS=(
> +        bison
> +        build-essential
> +        python-is-python3
> +        libpcre3
> +        flex
> +        gcc-arm-linux-gnueabihf
> +        gcc-x86-64-linux-gnu
> +    )
> +    apt-get --yes --no-install-recommends install "${DEPS[@]}"
> +    rm -rf /var/lib/apt/lists*
> +EOF
> +
> +USER user
> +WORKDIR /build
> diff --git a/automation/build/debian/bookworm-cppcheck.dockerfile b/automation/build/debian/bookworm-cppcheck.dockerfile
> deleted file mode 100644
> index fe4cd4a1aaab..000000000000
> --- a/automation/build/debian/bookworm-cppcheck.dockerfile
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -# syntax=docker/dockerfile:1
> -FROM --platform=linux/arm64/v8 debian:bookworm AS builder
> -
> -ENV DEBIAN_FRONTEND=noninteractive
> -ENV CPPCHECK_VERSION=2.7
> -ENV USER root
> -
> -# dependencies for cppcheck build
> -RUN apt-get update && \
> -    apt-get --quiet --yes install \
> -        curl \
> -        build-essential \
> -        python-is-python3 \
> -        libpcre3-dev
> -
> -RUN mkdir /build
> -WORKDIR /build
> -
> -# cppcheck release build (see cppcheck readme.md)
> -RUN curl -fsSLO https://github.com/danmar/cppcheck/archive/"$CPPCHECK_VERSION".tar.gz && \
> -    tar xvzf "$CPPCHECK_VERSION".tar.gz && \
> -    cd cppcheck-"$CPPCHECK_VERSION" && \
> -    make install -j$(nproc) \
> -        MATCHCOMPILER=yes \
> -        FILESDIR=/usr/share/cppcheck \
> -        HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
> -
> -FROM --platform=linux/arm64/v8 debian:bookworm
> -COPY --from=builder /usr/bin/cppcheck /usr/bin/cppcheck
> -COPY --from=builder /usr/share/cppcheck /usr/share/cppcheck
> -
> -LABEL maintainer.name="The Xen Project" \
> -      maintainer.email="xen-devel@lists.xenproject.org"
> -
> -ENV DEBIAN_FRONTEND=noninteractive
> -ENV USER root
> -
> -RUN mkdir /build
> -WORKDIR /build
> -
> -# dependencies for cppcheck analysis including Xen-only build/cross-build
> -RUN apt-get update && \
> -    apt-get --quiet --yes install \
> -        build-essential \
> -        python-is-python3 \
> -        libpcre3-dev \
> -        flex \
> -        bison \
> -        gcc-arm-linux-gnueabihf \
> -        gcc-x86-64-linux-gnu \
> -        && \
> -        apt-get autoremove -y && \
> -        apt-get clean && \
> -        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 380021d49f12..c57882b8846e 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -488,26 +488,26 @@ yocto-qemux86-64:
>  
>  # Cppcheck analysis jobs
>  
> -debian-bookworm-gcc-cppcheck:
> +debian-12-x86_64-gcc-cppcheck:
>    extends: .gcc-x86-64-cross-build
>    variables:
> -    CONTAINER: debian:bookworm-cppcheck
> +    CONTAINER: debian:12-arm64v8-cppcheck
>      CROSS_COMPILE: /usr/bin/x86_64-linux-gnu-
>      CPPCHECK: y
>      HYPERVISOR_ONLY: y
>  
> -debian-bookworm-gcc-arm32-cppcheck:
> +debian-12-arm32-gcc-cppcheck:
>    extends: .gcc-arm32-cross-build
>    variables:
> -    CONTAINER: debian:bookworm-cppcheck
> +    CONTAINER: debian:12-arm64v8-cppcheck
>      CROSS_COMPILE: /usr/bin/arm-linux-gnueabihf-
>      CPPCHECK: y
>      HYPERVISOR_ONLY: y
>  
> -debian-bookworm-gcc-arm64-cppcheck:
> +debian-12-arm64-gcc-cppcheck:
>    extends: .gcc-arm64-build
>    variables:
> -    CONTAINER: debian:bookworm-cppcheck
> +    CONTAINER: debian:12-arm64v8-cppcheck
>      CPPCHECK: y
>      HYPERVISOR_ONLY: y
>  
> diff --git a/automation/scripts/containerize b/automation/scripts/containerize
> index c9988bfe927d..e5502c81a759 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -38,7 +38,7 @@ case "_${CONTAINER}" in
>      _bookworm-i386|_bookworm-x86_32) CONTAINER="${BASE}/debian:12-x86_32" ;;
>      _bookworm-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:12-arm64v8-arm32-gcc" ;;
>      _bookworm-arm64v8) CONTAINER="${BASE}/debian:12-arm64v8" ;;
> -    _bookworm-cppcheck) CONTAINER="${BASE}/debian:bookworm-cppcheck" ;;
> +    _bookworm-cppcheck) CONTAINER="${BASE}/debian:12-arm64v8-cppcheck" ;;
>      _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-15.6-x86_64" ;;
>      _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/opensuse:tumbleweed-x86_64" ;;
>      _xenial) CONTAINER="${BASE}/ubuntu:16.04-x86_64" ;;
> -- 
> 2.45.2
> 

