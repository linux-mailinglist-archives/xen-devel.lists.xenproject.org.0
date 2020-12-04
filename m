Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F972CEC57
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 11:40:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44337.79465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8W4-0003Fp-Bh; Fri, 04 Dec 2020 10:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44337.79465; Fri, 04 Dec 2020 10:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8W4-0003FQ-8O; Fri, 04 Dec 2020 10:40:44 +0000
Received: by outflank-mailman (input) for mailman id 44337;
 Fri, 04 Dec 2020 10:40:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl8W3-0003FL-5v
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 10:40:43 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23fc0eca-0223-4238-8d6f-5cb27cc9dfdc;
 Fri, 04 Dec 2020 10:40:42 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r3so4839421wrt.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 02:40:42 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id v4sm3049528wru.12.2020.12.04.02.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:40:40 -0800 (PST)
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
X-Inumbo-ID: 23fc0eca-0223-4238-8d6f-5cb27cc9dfdc
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TbXT0pcbwLfXrTNUjS4Zuw4lQG6GEg6Z33TgYA1WqXo=;
        b=E83tjs2i0mqK2Et0oik6pLfMtxR1Ocn2N2UZwwBaIA6sjXdxEtf41hTy2bxnEENK+S
         Abz6jIX7Yoyr4OMo47mTo/GdfrjLC0G2Gi2Abx6bhn9AGZbRC1/uIWT+ZkcuTht4gY5T
         vQ8HW6mDvAGUY/XL0iuQ4g4XBsf5E3lzD/D7mLZFY88Qyw0t4N2GOjuRt65nryge4E/o
         HRoFAe/oRsR9h55vRP316I6X5R9AlaoIrnJAjEag0eIENwwexPcgyX1A2vib32jegH2Y
         B4tD7IaoSZ33sHJDdSzn5ONEiaBhvjWGEMTNgJrF9i1OsyzuHDCBBeGl2MgW3R09aZ/x
         gESg==
X-Gm-Message-State: AOAM531nXce57ZVNDAu+bewWPPqY+ZdyjxFVA7HBgfM63dVqMWOCGgns
	vM5HGSDIqYX6ILnwTH73YiEWcL5hWws=
X-Google-Smtp-Source: ABdhPJwHCfEiNZ3/VZH9LBA2jIUVIV9LS2Y763e1a/zcnc5OV+rZ/j5eLdXL0gHSsMEDwqhrRBsDaQ==
X-Received: by 2002:a5d:4b81:: with SMTP id b1mr4172984wrt.372.1607078441487;
        Fri, 04 Dec 2020 02:40:41 -0800 (PST)
Date: Fri, 4 Dec 2020 10:40:39 +0000
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, cardoe@cardoe.com, wl@xen.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3 01/12] automation: add a QEMU aarch64 smoke test
Message-ID: <20201204104039.44diltm2gg4twpxn@liuwe-devbox-debian-v2>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
 <20201125042745.31986-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125042745.31986-1-sstabellini@kernel.org>
User-Agent: NeoMutt/20180716

On Tue, Nov 24, 2020 at 08:27:34PM -0800, Stefano Stabellini wrote:
> Use QEMU to start Xen (just the hypervisor) up until it stops because
> there is no dom0 kernel to boot.
> 
> It is based on the existing build job unstable-arm64v8.
> 
> Also use make -j$(nproc) to build Xen.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> Changes in v2:
> - fix x86_32 build
> ---
>  automation/gitlab-ci/test.yaml         | 22 ++++++++++++++++++
>  automation/scripts/build               |  6 ++---
>  automation/scripts/qemu-smoke-arm64.sh | 32 ++++++++++++++++++++++++++
>  3 files changed, 57 insertions(+), 3 deletions(-)
>  create mode 100755 automation/scripts/qemu-smoke-arm64.sh
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 793feafe8b..35346e3f6e 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -22,6 +22,28 @@ build-each-commit-gcc:
>      - /^coverity-tested\/.*/
>      - /^stable-.*/
>  
> +qemu-smoke-arm64-gcc:
> +  stage: test
> +  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> +  dependencies:
> +    - debian-unstable-gcc-arm64
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +  except:
> +    - master
> +    - smoke
> +    - /^coverity-tested\/.*/
> +    - /^stable-.*/
> +
>  qemu-smoke-x86-64-gcc:
>    stage: test
>    image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 0cd0f3971d..7038e5eb50 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -10,9 +10,9 @@ cc-ver()
>  
>  # random config or default config
>  if [[ "${RANDCONFIG}" == "y" ]]; then
> -    make -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
> +    make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
>  else
> -    make -C xen defconfig
> +    make -j$(nproc) -C xen defconfig
>  fi
>  
>  # build up our configure options
> @@ -45,7 +45,7 @@ make -j$(nproc) dist
>  # Extract artifacts to avoid getting rewritten by customised builds
>  cp xen/.config xen-config
>  mkdir binaries
> -if [[ "${XEN_TARGET_ARCH}" == "x86_64" ]]; then
> +if [[ "${XEN_TARGET_ARCH}" != "x86_32" ]]; then
>      cp xen/xen binaries/xen
>  fi
>  
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> new file mode 100755
> index 0000000000..a7efbf8b6f
> --- /dev/null
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -0,0 +1,32 @@
> +#!/bin/bash
> +
> +set -ex
> +
> +# Install QEMU
> +export DEBIAN_FRONTENT=noninteractive
> +apt-get -qy update
> +apt-get -qy install --no-install-recommends qemu-system-aarch64 \
> +                                            u-boot-qemu
> +
> +# XXX Silly workaround to get the following QEMU command to work
> +cp /usr/share/qemu/pvh.bin /usr/share/qemu/efi-virtio.rom

Can you explain a bit more why this workaround works at all?

Not a blocking comment, but this will help other people who try to
modify this script.

Wei.

