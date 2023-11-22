Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5F27F3B4E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 02:29:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638359.994866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5c3F-0000eD-B1; Wed, 22 Nov 2023 01:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638359.994866; Wed, 22 Nov 2023 01:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5c3F-0000cM-7V; Wed, 22 Nov 2023 01:29:13 +0000
Received: by outflank-mailman (input) for mailman id 638359;
 Wed, 22 Nov 2023 01:29:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5c3D-0000br-RJ
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 01:29:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8860259d-88d6-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 02:29:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F292A61BF5;
 Wed, 22 Nov 2023 01:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A43FC4339A;
 Wed, 22 Nov 2023 01:29:06 +0000 (UTC)
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
X-Inumbo-ID: 8860259d-88d6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700616547;
	bh=nred4UrM0Q5eIGc6o0ITGx2xNxbGbsPGw2PO1rovoHo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HfhZj4YQR1DcK1DXuavhQWP1EbMHEJGmUKeaPpyFTJ1eEhXCDqoJMgNXs7gXzzGiu
	 I+EVtVstXCG2frzt+x8q984Jqz+8VTM9nZRd55NTYQzEeF6gJK8f2oIACd4InxlMZI
	 XHGCIt4fZaJdV/aecWxx6xtyqccC22PIX9sre+1s7A2bLicHMDt0YxcAtD9a5igsYP
	 sGxNWsJg+v/pwCfYfZTuF17+v7QtmHTYdfrlX4WFvfAzxShJIOYE1pYv/6F0XMJEIv
	 h8S8gin1b1fzmhToCvdZRhHuDhr5ueCLJTYwhsdtEEm2I0CleuvF+xog9ZORdEXe+o
	 7HQxa/vt0UBug==
Date: Tue, 21 Nov 2023 17:29:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 7/7] automation: switch to multi-platform images when
 possible
In-Reply-To: <20231121160358.8080-8-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311211728580.2053963@ubuntu-linux-20-04-desktop>
References: <20231121160358.8080-1-roger.pau@citrix.com> <20231121160358.8080-8-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-637223006-1700616547=:2053963"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-637223006-1700616547=:2053963
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 21 Nov 2023, Roger Pau Monne wrote:
> Instead of using specific architecture image, switch to using multi-arch ones
> and specify the desired architecture using the --platform option.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> I haven't touched the Yocto dockerfile because I'm not sure how it's used.
> ---
>  automation/build/alpine/3.18-arm64v8.dockerfile               | 2 +-
>  automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile | 2 +-
>  automation/build/debian/bookworm-arm64v8.dockerfile           | 2 +-
>  automation/build/debian/bookworm-cppcheck.dockerfile          | 4 ++--
>  automation/build/debian/bookworm-i386.dockerfile              | 2 +-
>  automation/build/debian/stretch-i386.dockerfile               | 2 +-
>  automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile     | 2 +-
>  automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile     | 2 +-
>  .../qemu-system-aarch64/6.0.0-arm64v8.dockerfile              | 2 +-
>  9 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/automation/build/alpine/3.18-arm64v8.dockerfile b/automation/build/alpine/3.18-arm64v8.dockerfile
> index 470f5d72a921..91e90220240f 100644
> --- a/automation/build/alpine/3.18-arm64v8.dockerfile
> +++ b/automation/build/alpine/3.18-arm64v8.dockerfile
> @@ -1,4 +1,4 @@
> -FROM arm64v8/alpine:3.18
> +FROM --platform=linux/arm64/v8 alpine:3.18
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile b/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
> index b3295c435ed5..a05ffeac04f9 100644
> --- a/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
> +++ b/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
> @@ -1,4 +1,4 @@
> -FROM arm64v8/debian:bookworm
> +FROM --platform=linux/arm64/v8 debian:bookworm
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/debian/bookworm-arm64v8.dockerfile b/automation/build/debian/bookworm-arm64v8.dockerfile
> index 640b1e0eadf2..2c432aacb765 100644
> --- a/automation/build/debian/bookworm-arm64v8.dockerfile
> +++ b/automation/build/debian/bookworm-arm64v8.dockerfile
> @@ -1,4 +1,4 @@
> -FROM arm64v8/debian:bookworm
> +FROM --platform=linux/arm64/v8 debian:bookworm
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/debian/bookworm-cppcheck.dockerfile b/automation/build/debian/bookworm-cppcheck.dockerfile
> index d64fb7b18c66..633268376d56 100644
> --- a/automation/build/debian/bookworm-cppcheck.dockerfile
> +++ b/automation/build/debian/bookworm-cppcheck.dockerfile
> @@ -1,4 +1,4 @@
> -FROM arm64v8/debian:bookworm AS builder
> +FROM --platform=linux/arm64/v8 debian:bookworm AS builder
>  
>  ENV DEBIAN_FRONTEND=noninteractive
>  ENV CPPCHECK_VERSION=2.7
> @@ -24,7 +24,7 @@ RUN curl -fsSLO https://github.com/danmar/cppcheck/archive/"$CPPCHECK_VERSION".t
>          FILESDIR=/usr/share/cppcheck \
>          HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
>  
> -FROM arm64v8/debian:bookworm
> +FROM --platform=linux/arm64/v8 debian:bookworm
>  COPY --from=builder /usr/bin/cppcheck /usr/bin/cppcheck
>  COPY --from=builder /usr/share/cppcheck /usr/share/cppcheck
>  
> diff --git a/automation/build/debian/bookworm-i386.dockerfile b/automation/build/debian/bookworm-i386.dockerfile
> index 559bf670f0f1..89a650338566 100644
> --- a/automation/build/debian/bookworm-i386.dockerfile
> +++ b/automation/build/debian/bookworm-i386.dockerfile
> @@ -1,4 +1,4 @@
> -FROM i386/debian:bookworm
> +FROM --platform=linux/i386 debian:bookworm
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/build/debian/stretch-i386.dockerfile b/automation/build/debian/stretch-i386.dockerfile
> index 9739651e25dd..da93fed8ea68 100644
> --- a/automation/build/debian/stretch-i386.dockerfile
> +++ b/automation/build/debian/stretch-i386.dockerfile
> @@ -1,4 +1,4 @@
> -FROM i386/debian:stretch
> +FROM --platform=linux/i386 debian:stretch
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
> index cbd96d9bc6b0..94f69621f40e 100644
> --- a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
> +++ b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
> @@ -1,4 +1,4 @@
> -FROM arm64v8/alpine:3.18
> +FROM --platform=linux/arm64/v8 alpine:3.18
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile b/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
> index a53a97d7277e..b0875ca0ddd1 100644
> --- a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
> +++ b/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
> @@ -1,4 +1,4 @@
> -FROM arm64v8/debian:bookworm
> +FROM --platform=linux/arm64/v8 debian:bookworm
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> diff --git a/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile b/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
> index e277e13b60b9..fb7b7b506e94 100644
> --- a/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
> +++ b/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
> @@ -1,4 +1,4 @@
> -FROM arm64v8/debian:bookworm
> +FROM --platform=linux/arm64/v8 debian:bookworm
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> -- 
> 2.42.0
> 
--8323329-637223006-1700616547=:2053963--

