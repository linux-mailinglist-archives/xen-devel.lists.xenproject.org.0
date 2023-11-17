Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C667EEA9A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 02:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634800.990336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3nRF-0006wp-Da; Fri, 17 Nov 2023 01:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634800.990336; Fri, 17 Nov 2023 01:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3nRF-0006ug-9c; Fri, 17 Nov 2023 01:14:29 +0000
Received: by outflank-mailman (input) for mailman id 634800;
 Fri, 17 Nov 2023 01:14:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5d38=G6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r3nRD-0006ua-L9
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 01:14:27 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a669c5cd-84e6-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 02:14:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 30ECAB81D91;
 Fri, 17 Nov 2023 01:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BDEC433C8;
 Fri, 17 Nov 2023 01:14:24 +0000 (UTC)
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
X-Inumbo-ID: a669c5cd-84e6-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700183665;
	bh=S/Wock/t2u/4Z5ILrOZxSatsff7734SSgrbjCzQJr5k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OxwN5qZXrAXMKX0WzOV0WHGy+u8Z0u66QScJotZX3EGZfHYq4bh/9xP8VajIlDVO4
	 EH7OyDwWzX6mPgcnqVfPCi1So6TqioZe41xjT8n/4Do2J7rjvirtqWrMNCiH6/npGT
	 9HNScaCLG0+nbqqkNh8SA8uEVM41jQ/G3ZuN+pQTWs3eOOhLEA1qukQWu0LnDihxSm
	 89fTA0mEV01lNsT71NaDlm3y85iCu3eUaJbBPlvBbDodiIEiTRzwg1m+j9S4Ap8qMK
	 H7hlqIW4cClEBhidoYheCZcYab6/TdW3lDWlV6OOpNak48PlCmWunk6N9z/lnVXw9A
	 +MW536qXqHU3Q==
Date: Thu, 16 Nov 2023 17:14:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 6/6] automation: switch to multi-platform images when
 possible
In-Reply-To: <20231116121310.72210-7-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311161711560.773207@ubuntu-linux-20-04-desktop>
References: <20231116121310.72210-1-roger.pau@citrix.com> <20231116121310.72210-7-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1226307592-1700183613=:773207"
Content-ID: <alpine.DEB.2.22.394.2311161713520.773207@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1226307592-1700183613=:773207
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311161713521.773207@ubuntu-linux-20-04-desktop>

On Thu, 16 Nov 2023, Roger Pau Monne wrote:
> Instead of using specific architecture image, switch to using multi-arch ones
> and specify the desired architecture using the --platform option.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I haven't touched the Yocto dockerfile because I'm not sure how it's used.

We are missing:

automation/build/debian/buster-gcc-ibt.dockerfile
automation/build/debian/bookworm-cppcheck.dockerfile
automation/tests-artifacts/*

Aside from that, it is fine.

How did you test the updated containers? Have you already pushed them to
the registry?


> ---
>  automation/build/alpine/3.18-arm64v8.dockerfile               | 2 +-
>  automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile | 2 +-
>  automation/build/debian/bookworm-arm64v8.dockerfile           | 2 +-
>  automation/build/debian/bookworm-cppcheck.dockerfile          | 2 +-
>  automation/build/debian/bookworm-i386.dockerfile              | 2 +-
>  automation/build/debian/stretch-i386.dockerfile               | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
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
> index d64fb7b18c66..d368d69472cb 100644
> --- a/automation/build/debian/bookworm-cppcheck.dockerfile
> +++ b/automation/build/debian/bookworm-cppcheck.dockerfile
> @@ -1,4 +1,4 @@
> -FROM arm64v8/debian:bookworm AS builder
> +FROM --platform=linux/arm64/v8 debian:bookworm AS builder
>  
>  ENV DEBIAN_FRONTEND=noninteractive
>  ENV CPPCHECK_VERSION=2.7
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
> -- 
> 2.42.0
> 
--8323329-1226307592-1700183613=:773207--

