Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1F0733A0D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 21:39:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550369.859406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAFGY-0007UC-NQ; Fri, 16 Jun 2023 19:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550369.859406; Fri, 16 Jun 2023 19:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAFGY-0007Rv-KT; Fri, 16 Jun 2023 19:37:50 +0000
Received: by outflank-mailman (input) for mailman id 550369;
 Fri, 16 Jun 2023 19:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlCr=CE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qAFGX-0007Rp-H6
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 19:37:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44368dbe-0c7d-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 21:37:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 85F4F60B3C;
 Fri, 16 Jun 2023 19:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E58EC433C8;
 Fri, 16 Jun 2023 19:37:42 +0000 (UTC)
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
X-Inumbo-ID: 44368dbe-0c7d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686944263;
	bh=ihRB8uDucfIijVyIcygOdS4R4YauYeHx+2bhEEsfC78=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bT1NVsdWh2tUBxyGbXIasGWCemwUTrdOP3UcxSLupKhjWf+vXYfRfKGLWHK/AFF97
	 aJzulTfryJ92qnS6gY4MiMakXNRIj9byIsmFqSedatDTKTedd64uRUXIh54p2fTk6U
	 EP/stKRyKsJV/ebn+9cWjoA/qbrzmMizuvz6Ek1H6IuMluE2C9AZ7zqqw4PiHRIh0K
	 E/C+8coda+h7RoPoD2oeWvK2J4FYLECRLyRoMqwn+L5aKsnaMIXX305yFaI7zyOuIt
	 7ulfh+bk283YufTCPRT3S018dTZZQOAt+amfzLxfGnP/OnAQXGv9fp9lkcexJJa01R
	 59nANIyCYysWQ==
Date: Fri, 16 Jun 2023 12:37:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Shawn Anastasio <sanastasio@raptorengineering.com>
cc: xen-devel@lists.xenproject.org, tpearson@raptorengineering.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 1/4] automation: Add container for ppc64le builds
In-Reply-To: <0d59b5eb8de2b00839204c36a2a45eebab994369.1686936278.git.sanastasio@raptorengineering.com>
Message-ID: <alpine.DEB.2.22.394.2306161237360.897208@ubuntu-linux-20-04-desktop>
References: <cover.1686936278.git.sanastasio@raptorengineering.com> <0d59b5eb8de2b00839204c36a2a45eebab994369.1686936278.git.sanastasio@raptorengineering.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Jun 2023, Shawn Anastasio wrote:
> Add a container for cross-compiling xen for ppc64le.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  .../build/debian/bullseye-ppc64le.dockerfile  | 28 +++++++++++++++++++
>  automation/scripts/containerize               |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 automation/build/debian/bullseye-ppc64le.dockerfile
> 
> diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automation/build/debian/bullseye-ppc64le.dockerfile
> new file mode 100644
> index 0000000000..8a87631b52
> --- /dev/null
> +++ b/automation/build/debian/bullseye-ppc64le.dockerfile
> @@ -0,0 +1,28 @@
> +FROM debian:bullseye-slim
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV USER root
> +
> +# Add compiler path
> +ENV CROSS_COMPILE powerpc64le-linux-gnu-
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# build depends
> +RUN apt-get update && \
> +    apt-get --quiet --yes --no-install-recommends install \
> +        bison \
> +        build-essential \
> +        checkpolicy \
> +        flex \
> +        gawk \
> +        gcc-powerpc64le-linux-gnu \
> +        make \
> +        python3-minimal \
> +        && \
> +        apt-get autoremove -y && \
> +        apt-get clean && \
> +        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> diff --git a/automation/scripts/containerize b/automation/scripts/containerize
> index 5476ff0ea1..6d46f63665 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -33,6 +33,7 @@ case "_${CONTAINER}" in
>      _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
>      _jessie) CONTAINER="${BASE}/debian:jessie" ;;
>      _jessie-i386) CONTAINER="${BASE}/debian:jessie-i386" ;;
> +    _bullseye-ppc64le) CONTAINER="${BASE}/debian:bullseye-ppc64le" ;;
>      _stretch|_) CONTAINER="${BASE}/debian:stretch" ;;
>      _stretch-i386) CONTAINER="${BASE}/debian:stretch-i386" ;;
>      _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
> -- 
> 2.30.2
> 

