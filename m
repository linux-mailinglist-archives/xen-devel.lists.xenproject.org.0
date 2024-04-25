Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EFB8B27CE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 20:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712212.1112708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s03OI-000487-1p; Thu, 25 Apr 2024 18:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712212.1112708; Thu, 25 Apr 2024 18:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s03OH-00045a-VN; Thu, 25 Apr 2024 18:00:13 +0000
Received: by outflank-mailman (input) for mailman id 712212;
 Thu, 25 Apr 2024 18:00:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N29f=L6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s03OG-00045U-Al
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 18:00:12 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a611a8d6-032d-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 20:00:10 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E1773CE1864;
 Thu, 25 Apr 2024 18:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253ADC113CC;
 Thu, 25 Apr 2024 17:59:59 +0000 (UTC)
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
X-Inumbo-ID: a611a8d6-032d-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714068000;
	bh=JNtJIUhSlAna6Ur7ZTAU4VxIW3zkBz/zw94n+Bin7/M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MzovhnScpztmQ3Va6fuZzabHkPsGkrE37QcBc4x6512T6YMOwlUgEKOJxj+OCm7qK
	 bZIv8Doz0912tiVunAXnfqmCLAfHRsxEsAFAmEVDRvuYNeA4XeTSfpyREpZQTvLc6+
	 vqeBD4mcbDyfH6lW2rUjzNrltSSWTqksMOoTjTRw8dm5RQk3FJ01WwQCuj3ywdyTYu
	 Z5L7bFZSOpRTTxCJ2ysTbr3jnPI3GMMni49eF/eHESyqaRXwz9jA+e+gChQcuMlap5
	 hskAqpBNwqsmcqsoOcZKcZ/8PeFbLLtbBtpMnE2lhHTJrFSwokYO0KQlGynfyXStmG
	 hPSsz8Zpq9kjg==
Date: Thu, 25 Apr 2024 10:59:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] CI: Drop glibc-i386 from the build containers
In-Reply-To: <20240425174737.414327-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404251059490.3940@ubuntu-linux-20-04-desktop>
References: <20240425174737.414327-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-213578181-1714068000=:3940"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-213578181-1714068000=:3940
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 24 Apr 2024, Andrew Cooper wrote:
> Xen 4.14 no longer runs in Gitlab CI.  Drop the dependency to shrink the build
> containers a little.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  automation/build/archlinux/current.dockerfile        | 2 --
>  automation/build/centos/7.dockerfile                 | 2 --
>  automation/build/debian/bookworm.dockerfile          | 2 --
>  automation/build/debian/jessie.dockerfile            | 2 --
>  automation/build/debian/stretch.dockerfile           | 2 --
>  automation/build/fedora/29.dockerfile                | 2 --
>  automation/build/suse/opensuse-leap.dockerfile       | 2 --
>  automation/build/suse/opensuse-tumbleweed.dockerfile | 2 --
>  automation/build/ubuntu/bionic.dockerfile            | 2 --
>  automation/build/ubuntu/focal.dockerfile             | 2 --
>  automation/build/ubuntu/trusty.dockerfile            | 2 --
>  automation/build/ubuntu/xenial.dockerfile            | 2 --
>  12 files changed, 24 deletions(-)
> 
> diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
> index d974a1434fd5..3e37ab5c40c1 100644
> --- a/automation/build/archlinux/current.dockerfile
> +++ b/automation/build/archlinux/current.dockerfile
> @@ -19,8 +19,6 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
>          iasl \
>          inetutils \
>          iproute \
> -        # lib32-glibc for Xen < 4.15
> -        lib32-glibc \
>          libaio \
>          libcacard \
>          libgl \
> diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
> index ab450f0b3a0e..1cdc16fc05f9 100644
> --- a/automation/build/centos/7.dockerfile
> +++ b/automation/build/centos/7.dockerfile
> @@ -32,8 +32,6 @@ RUN yum -y update \
>          yajl-devel \
>          pixman-devel \
>          glibc-devel \
> -        # glibc-devel.i686 for Xen < 4.15
> -        glibc-devel.i686 \
>          make \
>          binutils \
>          git \
> diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
> index 459f8e30bdc6..d893218fc4bd 100644
> --- a/automation/build/debian/bookworm.dockerfile
> +++ b/automation/build/debian/bookworm.dockerfile
> @@ -31,8 +31,6 @@ RUN apt-get update && \
>          bin86 \
>          bcc \
>          liblzma-dev \
> -        # libc6-dev-i386 for Xen < 4.15
> -        libc6-dev-i386 \
>          libnl-3-dev \
>          ocaml-nox \
>          libfindlib-ocaml-dev \
> diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
> index 32fc952fbc2d..308675cac150 100644
> --- a/automation/build/debian/jessie.dockerfile
> +++ b/automation/build/debian/jessie.dockerfile
> @@ -37,8 +37,6 @@ RUN apt-get update && \
>          bin86 \
>          bcc \
>          liblzma-dev \
> -        # libc6-dev-i386 for Xen < 4.15
> -        libc6-dev-i386 \
>          libnl-3-dev \
>          ocaml-nox \
>          libfindlib-ocaml-dev \
> diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
> index e2706a8f3589..59794ed4677b 100644
> --- a/automation/build/debian/stretch.dockerfile
> +++ b/automation/build/debian/stretch.dockerfile
> @@ -38,8 +38,6 @@ RUN apt-get update && \
>          bin86 \
>          bcc \
>          liblzma-dev \
> -        # libc6-dev-i386 for Xen < 4.15
> -        libc6-dev-i386 \
>          libnl-3-dev \
>          ocaml-nox \
>          libfindlib-ocaml-dev \
> diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
> index 42a87ce6c84b..f473ae13e7c1 100644
> --- a/automation/build/fedora/29.dockerfile
> +++ b/automation/build/fedora/29.dockerfile
> @@ -21,8 +21,6 @@ RUN dnf -y install \
>          yajl-devel \
>          pixman-devel \
>          glibc-devel \
> -        # glibc-devel.i686 for Xen < 4.15
> -        glibc-devel.i686 \
>          make \
>          binutils \
>          git \
> diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
> index e1ec38a41445..48d0d50d005d 100644
> --- a/automation/build/suse/opensuse-leap.dockerfile
> +++ b/automation/build/suse/opensuse-leap.dockerfile
> @@ -28,8 +28,6 @@ RUN zypper install -y --no-recommends \
>          ghostscript \
>          glib2-devel \
>          glibc-devel \
> -        # glibc-devel-32bit for Xen < 4.15
> -        glibc-devel-32bit \
>          gzip \
>          hostname \
>          libaio-devel \
> diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
> index f00e03eda7b1..53542ba1f4d9 100644
> --- a/automation/build/suse/opensuse-tumbleweed.dockerfile
> +++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
> @@ -26,8 +26,6 @@ RUN zypper install -y --no-recommends \
>          ghostscript \
>          glib2-devel \
>          glibc-devel \
> -        # glibc-devel-32bit for Xen < 4.15
> -        glibc-devel-32bit \
>          gzip \
>          hostname \
>          libaio-devel \
> diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
> index 77d7f933860c..910d3c4b5315 100644
> --- a/automation/build/ubuntu/bionic.dockerfile
> +++ b/automation/build/ubuntu/bionic.dockerfile
> @@ -31,8 +31,6 @@ RUN apt-get update && \
>          bin86 \
>          bcc \
>          liblzma-dev \
> -        # libc6-dev-i386 for Xen < 4.15
> -        libc6-dev-i386 \
>          libnl-3-dev \
>          ocaml-nox \
>          libfindlib-ocaml-dev \
> diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
> index 30a9b8e84ffe..7c6a4d07566b 100644
> --- a/automation/build/ubuntu/focal.dockerfile
> +++ b/automation/build/ubuntu/focal.dockerfile
> @@ -31,8 +31,6 @@ RUN apt-get update && \
>          bin86 \
>          bcc \
>          liblzma-dev \
> -        # libc6-dev-i386 for Xen < 4.15
> -        libc6-dev-i386 \
>          libnl-3-dev \
>          ocaml-nox \
>          libfindlib-ocaml-dev \
> diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
> index 0d33578c4e1d..8bd8c085a781 100644
> --- a/automation/build/ubuntu/trusty.dockerfile
> +++ b/automation/build/ubuntu/trusty.dockerfile
> @@ -31,8 +31,6 @@ RUN apt-get update && \
>          bin86 \
>          bcc \
>          liblzma-dev \
> -        # libc6-dev-i386 for Xen < 4.15
> -        libc6-dev-i386 \
>          libnl-3-dev \
>          ocaml-nox \
>          libfindlib-ocaml-dev \
> diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
> index e8035434f804..f6296d32925c 100644
> --- a/automation/build/ubuntu/xenial.dockerfile
> +++ b/automation/build/ubuntu/xenial.dockerfile
> @@ -31,8 +31,6 @@ RUN apt-get update && \
>          bin86 \
>          bcc \
>          liblzma-dev \
> -        # libc6-dev-i386 for Xen < 4.15
> -        libc6-dev-i386 \
>          libnl-3-dev \
>          ocaml-nox \
>          libfindlib-ocaml-dev \
> 
> base-commit: 23cd1207e7f6ee3e51fb42e11dba8d7cdb28e1e5
> -- 
> 2.30.2
> 
--8323329-213578181-1714068000=:3940--

