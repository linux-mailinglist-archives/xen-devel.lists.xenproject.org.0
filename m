Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536B87EA747
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 01:11:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632083.986045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2h0o-00014g-QQ; Tue, 14 Nov 2023 00:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632083.986045; Tue, 14 Nov 2023 00:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2h0o-000131-NQ; Tue, 14 Nov 2023 00:10:38 +0000
Received: by outflank-mailman (input) for mailman id 632083;
 Tue, 14 Nov 2023 00:10:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE9C=G3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r2h0m-00012v-Kk
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 00:10:36 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a56ad6a-8282-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 01:10:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7793ECE1711;
 Tue, 14 Nov 2023 00:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCACC433C8;
 Tue, 14 Nov 2023 00:10:25 +0000 (UTC)
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
X-Inumbo-ID: 3a56ad6a-8282-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699920627;
	bh=dQBgkZOZTclZrw2XZxxp0W2l+vbr8vo+YOUhJzuf7S4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZuAUgyBhNepzb50t9eKq/oASo/eVXqzEi3+VrWyNVJS26aqYv9ojE1e4kTnL6ywDs
	 dtrEo5+nZKiY+b1nT/qltE/AtTZHynN/Ce5io7Rzo1JXU4I2ZijLZmGPfGFQUNQjPV
	 Aqh8/GGGfh2VpsFU09YNO3eili/8Ssh4q+uza6falhS9jKQjeAAkoiZJMVf5StKXE1
	 nYQK/oJmEotpuZTB7meBwXzND4bGl2neM++arHBM5JKT/w7ulU/7YoGSBUHrgLy9cy
	 1Q1jbcYDzGKd400eHTOGQDSGIEs43C4t5lp7iQskbcG22aJIYeqXkkak0IUr5jLe+y
	 xx0Unk277YTaA==
Date: Mon, 13 Nov 2023 16:10:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: set architecture in docker files
In-Reply-To: <20231113155701.52052-1-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311131608200.160649@ubuntu-linux-20-04-desktop>
References: <20231113155701.52052-1-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1410453681-1699920627=:160649"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1410453681-1699920627=:160649
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 13 Nov 2023, Roger Pau Monne wrote:
> Pass the desired architecture of the image in the FROM instruction if the
> image is possibly multi-platform.
> 
> This allows using the x86 Dockerfiles on OS X on arm64 hardware.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Although I am not opposed to this change, so far we have been using:
arm64v8/alpine:3.18

for x86 it is not specified but it would be:
amd64/alpine:3.18

Two options:
1) we add amd64/ everywhere and leave the arm containers alone
2) we change all containers, including the arm containers, to use the
--platform option

I don't think is a good idea to have 2 different ways to specify the
architecture for x86 and arm containers



> ---
> I haven't touched the Yocto dockerfile because I'm not sure how it's used.
> ---
>  automation/build/alpine/3.18.dockerfile               | 2 +-
>  automation/build/archlinux/current-riscv64.dockerfile | 2 +-
>  automation/build/archlinux/current.dockerfile         | 2 +-
>  automation/build/centos/7.dockerfile                  | 2 +-
>  automation/build/debian/bookworm.dockerfile           | 2 +-
>  automation/build/debian/bullseye-ppc64le.dockerfile   | 2 +-
>  automation/build/debian/buster-gcc-ibt.dockerfile     | 2 +-
>  automation/build/debian/jessie.dockerfile             | 2 +-
>  automation/build/debian/stretch.dockerfile            | 2 +-
>  automation/build/fedora/29.dockerfile                 | 2 +-
>  automation/build/suse/opensuse-leap.dockerfile        | 2 +-
>  automation/build/suse/opensuse-tumbleweed.dockerfile  | 2 +-
>  automation/build/ubuntu/bionic.dockerfile             | 2 +-
>  automation/build/ubuntu/focal.dockerfile              | 2 +-
>  automation/build/ubuntu/trusty.dockerfile             | 2 +-
>  automation/build/ubuntu/xenial-xilinx.dockerfile      | 2 +-
>  automation/build/ubuntu/xenial.dockerfile             | 2 +-
>  17 files changed, 17 insertions(+), 17 deletions(-)
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
> index ae008c8d46e5..ac87778b3972 100644
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
> index 96ab4fe8a2f1..4328c109b72b 100644
> --- a/automation/build/debian/buster-gcc-ibt.dockerfile
> +++ b/automation/build/debian/buster-gcc-ibt.dockerfile
> @@ -1,4 +1,4 @@
> -FROM debian:buster-slim AS builder
> +FROM --platform=linux/amd64 debian:buster-slim AS builder
>  
>  ENV DEBIAN_FRONTEND=noninteractive
>  ENV USER root
> diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
> index 63b2c1e5b771..db0962953c9a 100644
> --- a/automation/build/debian/jessie.dockerfile
> +++ b/automation/build/debian/jessie.dockerfile
> @@ -1,4 +1,4 @@
> -FROM debian/eol:jessie
> +FROM --platform=linux/amd64 debian/eol:jessie
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
> index 1af6c691f8f4..9f6c146f032c 100644
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
> -- 
> 2.42.0
> 
--8323329-1410453681-1699920627=:160649--

