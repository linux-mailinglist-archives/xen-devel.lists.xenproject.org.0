Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3179B3392BA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 17:08:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97221.184578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkKQ-0004DC-LZ; Fri, 12 Mar 2021 16:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97221.184578; Fri, 12 Mar 2021 16:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkKQ-0004Cn-I4; Fri, 12 Mar 2021 16:07:54 +0000
Received: by outflank-mailman (input) for mailman id 97221;
 Fri, 12 Mar 2021 16:07:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SY7Z=IK=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lKkKQ-0004Ci-0w
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 16:07:54 +0000
Received: from mail-wm1-f50.google.com (unknown [209.85.128.50])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef272010-d3ea-4c63-93bb-2af6429bf253;
 Fri, 12 Mar 2021 16:07:53 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so16131708wml.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Mar 2021 08:07:52 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id p10sm8878572wrw.33.2021.03.12.08.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 08:07:51 -0800 (PST)
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
X-Inumbo-ID: ef272010-d3ea-4c63-93bb-2af6429bf253
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MdjxVRrc/l98n2mp6JR4TkBMyjSKA6nlXDWOt3C5Q8s=;
        b=GOAx4FIWZh22L42dow1qXdNmOtP3j51My+2pjABcwdOhUeYHZ7cGdv8Q5QixPoGunA
         C/vghQyQL2Qt7ikR41F38z8+EV3Odi62O6k9h0FlQCZqOsmmrZ4OEHQzUMlBZm4VKv9d
         hKhGDxJ1cyuOUnWaCZGZIwfuUtv+W6SELk4z1L8jIpovp9/1m+n+MfoGFBFIHK98VAtg
         7JDngtxGXErrRoQGz2Ru/7RYDOBHVUdpaCVIUi35Yra3SWtMUJT6YfTKh8SnE1Bg8ijI
         kPaP0yUI5vNnvnuJZUdbM+7mtHY733oL3rmZ4vPHg4AMuwkH+eynOyy2tp7tRB6iWgx5
         Uqig==
X-Gm-Message-State: AOAM531UHuazRRki0Hrv3CpCuNr7sRhz6HEHGGgu5Jpke+WV3c79o1Fy
	IGvf/HuWa0csv06kj9xIiY4=
X-Google-Smtp-Source: ABdhPJyohJMj1WYxSKUaxIdSpjYuwHBpeu+D8eSB3iDBJnFzzMJKmT0Lzx2BvXnCzCQILIXEmpH1/A==
X-Received: by 2002:a1c:dd89:: with SMTP id u131mr13504620wmg.54.1615565272215;
        Fri, 12 Mar 2021 08:07:52 -0800 (PST)
Date: Fri, 12 Mar 2021 16:07:50 +0000
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: cardoe@cardoe.com, andrew.cooper3@citrix.com, wl@xen.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH] automation: add arm32 cross-build tests for Xen
Message-ID: <20210312160750.svw4ls76z6yli3yb@liuwe-devbox-debian-v2>
References: <20210213013813.30114-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210213013813.30114-1-sstabellini@kernel.org>

On Fri, Feb 12, 2021 at 05:38:13PM -0800, Stefano Stabellini wrote:
> Add a debian build container with cross-gcc for arm32 installed.
> Add build jobs to cross-compile Xen-only for arm32.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Wei Liu <wl@xen.org>

Cc Ian.

The risk is small: Gitlab CI doesn't gate pushes to Xen, but it is
rather beneficial to have arm32 builds for Xen.

> ---
>  .../debian/unstable-arm32-gcc.dockerfile      | 24 +++++++++
>  automation/gitlab-ci/build.yaml               | 50 +++++++++++++++++++
>  automation/scripts/build                      |  9 ++++
>  3 files changed, 83 insertions(+)
>  create mode 100644 automation/build/debian/unstable-arm32-gcc.dockerfile
> 
> diff --git a/automation/build/debian/unstable-arm32-gcc.dockerfile b/automation/build/debian/unstable-arm32-gcc.dockerfile
> new file mode 100644
> index 0000000000..b41a57f197
> --- /dev/null
> +++ b/automation/build/debian/unstable-arm32-gcc.dockerfile
> @@ -0,0 +1,24 @@
> +FROM debian:unstable
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV USER root
> +ENV CROSS_COMPILE /usr/bin/arm-linux-gnueabihf-
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# build depends
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        build-essential \
> +        flex \
> +        bison \
> +        git \
> +        gcc-arm-linux-gnueabihf \
> +        && \
> +        apt-get autoremove -y && \
> +        apt-get clean && \
> +        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> +
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index d00b8a5123..22114662f2 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -117,6 +117,33 @@
>    variables:
>      <<: *clang
>  
> +.arm32-cross-build-tmpl:
> +  <<: *build
> +  variables:
> +    XEN_TARGET_ARCH: arm32
> +  tags:
> +    - x86_64
> +
> +.arm32-cross-build:
> +  extends: .arm32-cross-build-tmpl
> +  variables:
> +    debug: n
> +
> +.arm32-cross-build-debug:
> +  extends: .arm32-cross-build-tmpl
> +  variables:
> +    debug: y
> +
> +.gcc-arm32-cross-build:
> +  extends: .arm32-cross-build
> +  variables:
> +    <<: *gcc
> +
> +.gcc-arm32-cross-build-debug:
> +  extends: .arm32-cross-build-debug
> +  variables:
> +    <<: *gcc
> +
>  .arm64-build-tmpl:
>    <<: *build
>    variables:
> @@ -454,6 +481,29 @@ alpine-3.12-clang-debug:
>      CONTAINER: alpine:3.12
>    allow_failure: true
>  
> +# Arm32 cross-build
> +
> +debian-unstable-gcc-arm32:
> +  extends: .gcc-arm32-cross-build
> +  variables:
> +    CONTAINER: debian:unstable-arm32-gcc
> +
> +debian-unstable-gcc-arm32-debug:
> +  extends: .gcc-arm32-cross-build-debug
> +  variables:
> +    CONTAINER: debian:unstable-arm32-gcc
> +
> +debian-unstable-gcc-arm32-randconfig:
> +  extends: .gcc-arm32-cross-build
> +  variables:
> +    CONTAINER: debian:unstable-arm32-gcc
> +    RANDCONFIG: y
> +
> +debian-unstable-gcc-arm32-debug-randconfig:
> +  extends: .gcc-arm32-cross-build-debug
> +  variables:
> +    CONTAINER: debian:unstable-arm32-gcc
> +    RANDCONFIG: y
>  
>  # Arm builds
>  
> diff --git a/automation/scripts/build b/automation/scripts/build
> index d8990c3bf4..e7d68f7a9d 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -15,6 +15,15 @@ else
>      make -j$(nproc) -C xen defconfig
>  fi
>  
> +# arm32 only cross-compiles the hypervisor
> +if [[ "${XEN_TARGET_ARCH}" = "arm32" ]]; then
> +    make -j$(nproc) xen
> +    cp xen/.config xen-config
> +    mkdir binaries
> +    cp xen/xen binaries/xen
> +    exit 0
> +fi
> +
>  # build up our configure options
>  cfgargs=()
>  cfgargs+=("--enable-docs")
> -- 
> 2.17.1
> 

