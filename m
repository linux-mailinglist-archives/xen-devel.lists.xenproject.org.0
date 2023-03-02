Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5C76A7854
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 01:23:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504276.776870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXWjc-00083b-Rf; Thu, 02 Mar 2023 00:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504276.776870; Thu, 02 Mar 2023 00:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXWjc-00080Y-P1; Thu, 02 Mar 2023 00:23:48 +0000
Received: by outflank-mailman (input) for mailman id 504276;
 Thu, 02 Mar 2023 00:23:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4tCB=62=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pXWjb-00080S-6p
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 00:23:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e34add7-b890-11ed-96a8-2f268f93b82a;
 Thu, 02 Mar 2023 01:23:45 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84AE9614E5;
 Thu,  2 Mar 2023 00:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0951AC433EF;
 Thu,  2 Mar 2023 00:23:42 +0000 (UTC)
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
X-Inumbo-ID: 7e34add7-b890-11ed-96a8-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677716623;
	bh=hoaV2YYfeZZYxZl8ERPMFjQBbViDaAu1zWsF/WY+DFg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uzrV7F/VvQlYzR+2YkJhOXpyzvJGwrlXkv1L4DXiN0GZjZP24m3s15TR5nYaDcOoM
	 +h0uS/0jfalTrbK/h8s8rIrHPUMuEwmk6B7vhKiWv4TzsJdCEeJtJxLSNZT6lljw9R
	 RTDkJhgfVuUphQIwQeLHK09LaVHO4rJAFJxkn3Wi8wuLIDnWJNyfC/XsVCOI8Bg+A0
	 j252125QDDaxGfqR3WKNhbBtZRi/IL1YqM4T5nV3d086l+JaNlO2yYewPecBgbyBd9
	 ZO3/gcnbmAP/JGCBDXhHsllhUzLEhaLHQLlYilSEgQ7jd3OWSxIcCJbAPJmzIdUqZl
	 rwmT9ZtouKKDg==
Date: Wed, 1 Mar 2023 16:23:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] automation: Add missing and drop obsoleted aliases from
 containerize
In-Reply-To: <20230301090644.4452-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2303011622060.3680@ubuntu-linux-20-04-desktop>
References: <20230301090644.4452-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Mar 2023, Michal Orzel wrote:
> Add missing aliases for:
>  - debian:unstable-cppcheck
>  - debian:unstable-arm64v8-arm32-gcc
>  - ubuntu:bionic
> 
> Remove aliases for no longer used containers:
>  - centos:7.2
>  - debian:unstable-arm32-gcc
> 
> Modify docs to refer to CentOS 7 instead of 7.2 not to create confusion.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Open questions related to the CI cleanup (@Andrew, @Anthony):
>  - Why do we keep suse:sles11sp4 dockerfile?

please remove, it EOLed in 2016


>  - Why do we keep jessie dockefiles?

please remove, it EOLed in 2020


> ---
>  automation/build/README.md      | 4 ++--
>  automation/scripts/containerize | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/automation/build/README.md b/automation/build/README.md
> index 4cc1acb6b41c..2d07cafe0eaa 100644
> --- a/automation/build/README.md
> +++ b/automation/build/README.md
> @@ -44,10 +44,10 @@ understands.
>    DOCKER_CMD=podman ./automation/scripts/containerize make
>    ```
>  
> -- CONTAINER: This overrides the container to use. For CentOS 7.2, use:
> +- CONTAINER: This overrides the container to use. For CentOS 7, use:
>  
>    ```
> -  CONTAINER=centos72 ./automation/scripts/containerize make
> +  CONTAINER=centos7 ./automation/scripts/containerize make
>    ```
>  
>  - CONTAINER_PATH: This overrides the path that will be available under the
> diff --git a/automation/scripts/containerize b/automation/scripts/containerize
> index 9b1a302d0565..5476ff0ea10d 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -29,7 +29,6 @@ case "_${CONTAINER}" in
>      _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
>      _riscv64) CONTAINER="${BASE}/archlinux:current-riscv64" ;;
>      _centos7) CONTAINER="${BASE}/centos:7" ;;
> -    _centos72) CONTAINER="${BASE}/centos:7.2" ;;
>      _fedora) CONTAINER="${BASE}/fedora:29";;
>      _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
>      _jessie) CONTAINER="${BASE}/debian:jessie" ;;
> @@ -39,8 +38,10 @@ case "_${CONTAINER}" in
>      _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
>      _unstable|_) CONTAINER="${BASE}/debian:unstable" ;;
>      _unstable-i386) CONTAINER="${BASE}/debian:unstable-i386" ;;
> -    _unstable-arm32-gcc) CONTAINER="${BASE}/debian:unstable-arm32-gcc" ;;
> +    _unstable-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:unstable-arm64v8-arm32-gcc" ;;
>      _unstable-arm64v8) CONTAINER="${BASE}/debian:unstable-arm64v8" ;;
> +    _unstable-cppcheck) CONTAINER="${BASE}/debian:unstable-cppcheck" ;;
> +    _bionic) CONTAINER="${BASE}/ubuntu:bionic" ;;
>      _trusty) CONTAINER="${BASE}/ubuntu:trusty" ;;
>      _xenial) CONTAINER="${BASE}/ubuntu:xenial" ;;
>      _opensuse-leap|_leap) CONTAINER="${BASE}/suse:opensuse-leap" ;;
> -- 
> 2.25.1
> 

