Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9756C79C189
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 03:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599865.935457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfrzq-0004m9-TZ; Tue, 12 Sep 2023 01:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599865.935457; Tue, 12 Sep 2023 01:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfrzq-0004ip-Qu; Tue, 12 Sep 2023 01:15:18 +0000
Received: by outflank-mailman (input) for mailman id 599865;
 Tue, 12 Sep 2023 01:15:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+51=E4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qfrzq-0004ij-82
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 01:15:18 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d30fe0d2-5109-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 03:15:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F18BECE19B7;
 Tue, 12 Sep 2023 01:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 236F8C3279B;
 Tue, 12 Sep 2023 01:15:06 +0000 (UTC)
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
X-Inumbo-ID: d30fe0d2-5109-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694481307;
	bh=kc79cE19D2SgPw/0+3mzwupSU4EsEpOLwtqGmPwaQXI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R4HRNu/n74kg+NrNVX6SxwrT9kaN1liG7/PW9eAspstIqyL2ONTGFwSyszXhqDJTd
	 0x0DPu8p/d17sZ6f+SyaLfMsRn/19LkLC3t+pVvDsBny7Q6iIeJB5LNwcbpZmx5QJC
	 9xunTWqEDN1c8dgawhQYyuLVxkLD20M4omY33JABiPLxaXqWnoeEFk7os3iFs4a/Z0
	 6t743+PR4AfJFtLMcx58Dwb540w7yR420nuSjVKkV8edp3KE9r1isI4K5lTHuLEYZB
	 8xBPPWFv8BV8RC2DMMFYIvjgz8W/HnZKS1nX4M8uydtWybauZML4dmaLFbDoIqn+KE
	 Znd3oJZQ/T6Lw==
Date: Mon, 11 Sep 2023 18:15:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Javi Merino <javi.merino@cloud.com>
cc: xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@cloud.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Bertrand.Marquis@arm.com
Subject: Re: [XEN PATCH v2 1/5] automation: add python3's setuptools to
 containers
In-Reply-To: <4f14ea4aeb44c234d9930578614a35234769fa41.1694450145.git.javi.merino@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2309111805530.1847660@ubuntu-linux-20-04-desktop>
References: <cover.1694450145.git.javi.merino@cloud.com> <4f14ea4aeb44c234d9930578614a35234769fa41.1694450145.git.javi.merino@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Sep 2023, Javi Merino wrote:
> In preparation of dropping python distutils and moving to setuptools,
> add the python3 setuptools module to the containers that need it.
> 
> The centos7 container was building using python2.  Change it to build
> python scripts using python3.
> 
> Debian Stretch is no longer debian oldstable, so move to the archive
> repositories.
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> ---
>  automation/build/alpine/3.18.dockerfile        |  1 +
>  automation/build/archlinux/current.dockerfile  |  1 +
>  automation/build/centos/7.dockerfile           |  3 ++-
>  automation/build/debian/bookworm.dockerfile    |  1 +
>  automation/build/debian/stretch.dockerfile     | 11 ++++++++++-
>  automation/build/suse/opensuse-leap.dockerfile |  1 +
>  automation/build/ubuntu/bionic.dockerfile      |  1 +
>  automation/build/ubuntu/focal.dockerfile       |  1 +
>  automation/build/ubuntu/trusty.dockerfile      |  1 +
>  automation/build/ubuntu/xenial.dockerfile      |  1 +

We are missing:
automation/build/alpine/3.18-arm64v8.dockerfile
automation/build/suse/opensuse-tumbleweed.dockerfile
automation/build/suse/opensuse-leap.dockerfile
automation/build/debian/jessie-i386.dockerfile
automation/build/debian/bookworm-i386.dockerfile
automation/build/debian/stretch-i386.dockerfile
automation/build/debian/jessie.dockerfile
automation/build/debian/bookworm-arm64v8.dockerfile
automation/build/fedora/29.dockerfile

+Bertrand because I am not sure if we need any changes to the Yocto
containers




>  10 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/build/alpine/3.18.dockerfile b/automation/build/alpine/3.18.dockerfile
> index ca5756955e..5d2a69a060 100644
> --- a/automation/build/alpine/3.18.dockerfile
> +++ b/automation/build/alpine/3.18.dockerfile
> @@ -34,6 +34,7 @@ RUN apk --no-cache add \
>    ocaml-findlib \
>    patch  \
>    python3-dev \
> +  py3-setuptools \
>    texinfo \
>    util-linux-dev \
>    xz-dev \
> diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
> index 13fb472d9e..47e79637a4 100644
> --- a/automation/build/archlinux/current.dockerfile
> +++ b/automation/build/archlinux/current.dockerfile
> @@ -34,6 +34,7 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
>          pixman \
>          pkgconfig \
>          python \
> +        python-setuptools \
>          sdl \
>          sdl2 \
>          spice \
> diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
> index 69dcefb2f0..f14f70014a 100644
> --- a/automation/build/centos/7.dockerfile
> +++ b/automation/build/centos/7.dockerfile
> @@ -22,7 +22,8 @@ RUN yum -y update \
>          ncurses-devel \
>          zlib-devel \
>          openssl-devel \
> -        python-devel \
> +        python3-devel \
> +        python3-setuptools \
>          libuuid-devel \
>          pkgconfig \
>          flex \
> diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
> index f8415425e6..ae008c8d46 100644
> --- a/automation/build/debian/bookworm.dockerfile
> +++ b/automation/build/debian/bookworm.dockerfile
> @@ -16,6 +16,7 @@ RUN apt-get update && \
>          libncurses5-dev \
>          libssl-dev \
>          python3-dev \
> +        python3-setuptools \
>          xorg-dev \
>          uuid-dev \
>          libyajl-dev \
> diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
> index 1af6c691f8..9f4b91a9e3 100644
> --- a/automation/build/debian/stretch.dockerfile
> +++ b/automation/build/debian/stretch.dockerfile
> @@ -1,4 +1,4 @@
> -FROM debian:stretch
> +FROM debian/eol:stretch
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> @@ -8,6 +8,14 @@ ENV USER root
>  RUN mkdir /build
>  WORKDIR /build
>  
> +# Debian stretch is now archived.  Fetch packages from
> +# archive.debian.org and skip the stretch-updates repository, as it is
> +# not longer valid.
> +RUN sed -i \
> +    -e 's/deb.debian.org/archive.debian.org/' \
> +    -e '/stretch-updates/d' \
> +    /etc/apt/sources.list

For the records I would prefer to get rid of Stretch altogether, but I
don't want to scope-creep this patch series, so this is OK for now.




>  # build depends
>  RUN apt-get update && \
>      apt-get --quiet --yes install \
> @@ -17,6 +25,7 @@ RUN apt-get update && \
>          libssl-dev \
>          python-dev \
>          python3-dev \
> +        python3-setuptools \
>          xorg-dev \
>          uuid-dev \
>          libyajl-dev \
> diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
> index 98ee42970d..7010b71aca 100644
> --- a/automation/build/suse/opensuse-leap.dockerfile
> +++ b/automation/build/suse/opensuse-leap.dockerfile
> @@ -60,6 +60,7 @@ RUN zypper install -y --no-recommends \
>          'pkgconfig(sdl)' \
>          'pkgconfig(sdl2)' \
>          python3-devel \
> +        python3-setuptools \
>          systemd-devel \
>          tar \
>          transfig \
> diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
> index e15f54431e..9cceb11ef9 100644
> --- a/automation/build/ubuntu/bionic.dockerfile
> +++ b/automation/build/ubuntu/bionic.dockerfile
> @@ -17,6 +17,7 @@ RUN apt-get update && \
>          libssl-dev \
>          python-dev \
>          python3-dev \
> +        python3-setuptools \
>          xorg-dev \
>          uuid-dev \
>          libyajl-dev \
> diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
> index 9c851c0620..e3d11194ee 100644
> --- a/automation/build/ubuntu/focal.dockerfile
> +++ b/automation/build/ubuntu/focal.dockerfile
> @@ -16,6 +16,7 @@ RUN apt-get update && \
>          libncurses5-dev \
>          libssl-dev \
>          python3-dev \
> +        python3-setuptools \
>          xorg-dev \
>          uuid-dev \
>          libyajl-dev \
> diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
> index 22e294c20c..7e819c8e4e 100644
> --- a/automation/build/ubuntu/trusty.dockerfile
> +++ b/automation/build/ubuntu/trusty.dockerfile
> @@ -17,6 +17,7 @@ RUN apt-get update && \
>          libssl-dev \
>          python-dev \
>          python3-dev \
> +        python3-setuptools \
>          xorg-dev \
>          uuid-dev \
>          libyajl-dev \
> diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
> index 2d2ba3e31f..19464eead8 100644
> --- a/automation/build/ubuntu/xenial.dockerfile
> +++ b/automation/build/ubuntu/xenial.dockerfile
> @@ -17,6 +17,7 @@ RUN apt-get update && \
>          libssl-dev \
>          python-dev \
>          python3-dev \
> +        python3-setuptools \
>          xorg-dev \
>          uuid-dev \
>          libyajl-dev \
> -- 
> 2.41.0
> 

