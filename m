Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8777F3B4F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 02:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638358.994856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5c37-0000NM-2h; Wed, 22 Nov 2023 01:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638358.994856; Wed, 22 Nov 2023 01:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5c36-0000Kl-Vy; Wed, 22 Nov 2023 01:29:04 +0000
Received: by outflank-mailman (input) for mailman id 638358;
 Wed, 22 Nov 2023 01:29:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5c35-0000Kf-Ih
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 01:29:03 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8335b102-88d6-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 02:29:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AF0CECE1E06;
 Wed, 22 Nov 2023 01:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB48C433C7;
 Wed, 22 Nov 2023 01:28:54 +0000 (UTC)
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
X-Inumbo-ID: 8335b102-88d6-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700616535;
	bh=5SSQDIRXfY5abYgW4pOVXXGfv25hfcrN/rwWKMcqPGs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=spaJ2uAkebbdemlqtHDLf92Zt099WpzJbynq89Fu4gCHE28OPIuvMs6BAW5Gs+cSB
	 Fq54vrH3/iHHWg8sGhd/3agF7EvbZwZuTMEgUVxQXU0QJT2JzHpmE1NIzRg7vW/EMT
	 XFjFDwMnQdVuWXvP8M3rkOanVqH5jn0CRzHZ/kVa9pR25KCHT676RrGLsjP0X5kf72
	 xT5JtV2g9ePyUBO9/1Q+hm5IGnKziuF7GovXeBSaUQztSlT1aAfx/7GO/vszw2epMN
	 WWT5tOZnEzO2ZRlbn0xS7QherMlNS4WdxwsMU+TpuJI/qmm26jDIwAKusWgASEPljW
	 QAg4oqMWpKQlQ==
Date: Tue, 21 Nov 2023 17:28:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 6/7] automation: set architecture in docker files
In-Reply-To: <20231121160358.8080-7-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311211728460.2053963@ubuntu-linux-20-04-desktop>
References: <20231121160358.8080-1-roger.pau@citrix.com> <20231121160358.8080-7-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1719195801-1700616534=:2053963"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1719195801-1700616534=:2053963
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 21 Nov 2023, Roger Pau Monne wrote:
> Pass the desired architecture of the image in the FROM instruction if the
> image is possibly multi-platform.
> 
> This allows using the x86 Dockerfiles on OS X on arm64 hardware.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> I haven't touched the Yocto dockerfile because I'm not sure how it's used.
> ---
>  automation/build/alpine/3.18.dockerfile                       | 2 +-
>  automation/build/archlinux/current-riscv64.dockerfile         | 2 +-
>  automation/build/archlinux/current.dockerfile                 | 2 +-
>  automation/build/centos/7.dockerfile                          | 2 +-
>  automation/build/debian/bookworm.dockerfile                   | 2 +-
>  automation/build/debian/bullseye-ppc64le.dockerfile           | 2 +-
>  automation/build/debian/buster-gcc-ibt.dockerfile             | 4 ++--
>  automation/build/debian/jessie.dockerfile                     | 2 +-
>  automation/build/debian/stretch.dockerfile                    | 2 +-
>  automation/build/fedora/29.dockerfile                         | 2 +-
>  automation/build/suse/opensuse-leap.dockerfile                | 2 +-
>  automation/build/suse/opensuse-tumbleweed.dockerfile          | 2 +-
>  automation/build/ubuntu/bionic.dockerfile                     | 2 +-
>  automation/build/ubuntu/focal.dockerfile                      | 2 +-
>  automation/build/ubuntu/trusty.dockerfile                     | 2 +-
>  automation/build/ubuntu/xenial-xilinx.dockerfile              | 2 +-
>  automation/build/ubuntu/xenial.dockerfile                     | 2 +-
>  automation/tests-artifacts/alpine/3.18.dockerfile             | 2 +-
>  automation/tests-artifacts/kernel/6.1.19.dockerfile           | 2 +-
>  .../tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile  | 2 +-
>  20 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/automation/build/alpine/3.18.dockerfile b/automation/build/alpine/3.18.dockerfile
> index 5d2a69a06010..4ae9cb5e9e30 100644
> --- a/automation/build/alpine/3.18.dockerfile
> +++ b/automation/build/alpine/3.18.dockerfile
> @@ -1,4 +1,4 @@
> -FROM alpine:3.18
> +FROM --platform=linux/amd64 alpine:3.18
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/archlinux/current-riscv64.dockerfile b/automation/build/archlinux/current-riscv64.dockerfile
> index abf8e7bf0b88..af75b5c720ce 100644
> --- a/automation/build/archlinux/current-riscv64.dockerfile
> +++ b/automation/build/archlinux/current-riscv64.dockerfile
> @@ -1,4 +1,4 @@
> -FROM archlinux
> +FROM --platform=linux/amd64 archlinux
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
> index 47e79637a4a6..d974a1434fd5 100644
> --- a/automation/build/archlinux/current.dockerfile
> +++ b/automation/build/archlinux/current.dockerfile
> @@ -1,4 +1,4 @@
> -FROM archlinux:base-devel
> +FROM --platform=linux/amd64 archlinux:base-devel
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
> index 69dcefb2f011..ab450f0b3a0e 100644
> --- a/automation/build/centos/7.dockerfile
> +++ b/automation/build/centos/7.dockerfile
> @@ -1,4 +1,4 @@
> -FROM centos:7
> +FROM --platform=linux/amd64 centos:7
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
> index 7aea081c13a9..459f8e30bdc6 100644
> --- a/automation/build/debian/bookworm.dockerfile
> +++ b/automation/build/debian/bookworm.dockerfile
> @@ -1,4 +1,4 @@
> -FROM debian:bookworm
> +FROM --platform=linux/amd64 debian:bookworm
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automation/build/debian/bullseye-ppc64le.dockerfile
> index 4de8458445ae..6fdfb6bc2b40 100644
> --- a/automation/build/debian/bullseye-ppc64le.dockerfile
> +++ b/automation/build/debian/bullseye-ppc64le.dockerfile
> @@ -1,4 +1,4 @@
> -FROM debian:bullseye-slim
> +FROM --platform=linux/amd64 debian:bullseye-slim
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/debian/buster-gcc-ibt.dockerfile b/automation/build/debian/buster-gcc-ibt.dockerfile
> index 96ab4fe8a2f1..6a3e50ef6b3f 100644
> --- a/automation/build/debian/buster-gcc-ibt.dockerfile
> +++ b/automation/build/debian/buster-gcc-ibt.dockerfile
> @@ -1,4 +1,4 @@
> -FROM debian:buster-slim AS builder
> +FROM --platform=linux/amd64 debian:buster-slim AS builder
>  
>  ENV DEBIAN_FRONTEND=noninteractive
>  ENV USER root
> @@ -41,7 +41,7 @@ RUN ./configure \
>  RUN make -j`nproc` && make -j`nproc` install
>  
>  
> -FROM debian:buster-slim
> +FROM --platform=linux/amd64 debian:buster-slim
>  COPY --from=builder /opt/gcc-11-ibt /opt/gcc-11-ibt
>  
>  LABEL maintainer.name="The Xen Project" \
> diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
> index 5c71c3e3ea75..32fc952fbc2d 100644
> --- a/automation/build/debian/jessie.dockerfile
> +++ b/automation/build/debian/jessie.dockerfile
> @@ -1,4 +1,4 @@
> -FROM debian/eol:jessie
> +FROM --platform=linux/amd64 debian/eol:jessie
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
> index 2f1a99f45017..e2706a8f3589 100644
> --- a/automation/build/debian/stretch.dockerfile
> +++ b/automation/build/debian/stretch.dockerfile
> @@ -1,4 +1,4 @@
> -FROM debian:stretch
> +FROM --platform=linux/amd64 debian:stretch
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
> index e55b06a4517e..42a87ce6c84b 100644
> --- a/automation/build/fedora/29.dockerfile
> +++ b/automation/build/fedora/29.dockerfile
> @@ -1,4 +1,4 @@
> -FROM fedora:29
> +FROM --platform=linux/amd64 fedora:29
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
> index 7010b71acaa0..e1ec38a41445 100644
> --- a/automation/build/suse/opensuse-leap.dockerfile
> +++ b/automation/build/suse/opensuse-leap.dockerfile
> @@ -1,4 +1,4 @@
> -FROM opensuse/leap
> +FROM --platform=linux/amd64 opensuse/leap
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
> index 959e1f6939f0..38f6fda2ff1b 100644
> --- a/automation/build/suse/opensuse-tumbleweed.dockerfile
> +++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
> @@ -1,4 +1,4 @@
> -FROM opensuse/tumbleweed
> +FROM --platform=linux/amd64 opensuse/tumbleweed
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
> index e15f54431efb..77d7f933860c 100644
> --- a/automation/build/ubuntu/bionic.dockerfile
> +++ b/automation/build/ubuntu/bionic.dockerfile
> @@ -1,4 +1,4 @@
> -FROM ubuntu:18.04
> +FROM --platform=linux/amd64 ubuntu:18.04
>  LABEL maintainer.name="The Xen Project " \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
> index e3d11194ee2f..30a9b8e84ffe 100644
> --- a/automation/build/ubuntu/focal.dockerfile
> +++ b/automation/build/ubuntu/focal.dockerfile
> @@ -1,4 +1,4 @@
> -FROM ubuntu:20.04
> +FROM --platform=linux/amd64 ubuntu:20.04
>  LABEL maintainer.name="The Xen Project " \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
> index 22e294c20cac..0d33578c4e1d 100644
> --- a/automation/build/ubuntu/trusty.dockerfile
> +++ b/automation/build/ubuntu/trusty.dockerfile
> @@ -1,4 +1,4 @@
> -FROM ubuntu:14.04
> +FROM --platform=linux/amd64 ubuntu:14.04
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/ubuntu/xenial-xilinx.dockerfile b/automation/build/ubuntu/xenial-xilinx.dockerfile
> index 5f7087135213..49f27b322995 100644
> --- a/automation/build/ubuntu/xenial-xilinx.dockerfile
> +++ b/automation/build/ubuntu/xenial-xilinx.dockerfile
> @@ -1,4 +1,4 @@
> -FROM ubuntu:16.04
> +FROM --platform=linux/amd64 ubuntu:16.04
>  LABEL maintainer.name="The Xen Project " \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
> index 2d2ba3e31f63..e8035434f804 100644
> --- a/automation/build/ubuntu/xenial.dockerfile
> +++ b/automation/build/ubuntu/xenial.dockerfile
> @@ -1,4 +1,4 @@
> -FROM ubuntu:16.04
> +FROM --platform=linux/amd64 ubuntu:16.04
>  LABEL maintainer.name="The Xen Project " \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/tests-artifacts/alpine/3.18.dockerfile b/automation/tests-artifacts/alpine/3.18.dockerfile
> index 5f521572b8fb..f1b4a8b7a191 100644
> --- a/automation/tests-artifacts/alpine/3.18.dockerfile
> +++ b/automation/tests-artifacts/alpine/3.18.dockerfile
> @@ -1,4 +1,4 @@
> -FROM alpine:3.18
> +FROM --platform=linux/amd64 alpine:3.18
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
> index d5b787c1cbb5..3a4096780d20 100644
> --- a/automation/tests-artifacts/kernel/6.1.19.dockerfile
> +++ b/automation/tests-artifacts/kernel/6.1.19.dockerfile
> @@ -1,4 +1,4 @@
> -FROM debian:bookworm
> +FROM --platform=linux/amd64 debian:bookworm
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile b/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile
> index 7376ca46ff8e..65857147bf4f 100644
> --- a/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile
> +++ b/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile
> @@ -1,4 +1,4 @@
> -FROM debian:bullseye-slim
> +FROM --platform=linux/amd64 debian:bullseye-slim
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> -- 
> 2.42.0
> 
--8323329-1719195801-1700616534=:2053963--

