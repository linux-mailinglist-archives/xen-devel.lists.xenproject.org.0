Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521538098A4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 02:36:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650305.1015715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBPmu-00006i-Vq; Fri, 08 Dec 2023 01:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650305.1015715; Fri, 08 Dec 2023 01:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBPmu-0008V8-Sa; Fri, 08 Dec 2023 01:36:20 +0000
Received: by outflank-mailman (input) for mailman id 650305;
 Fri, 08 Dec 2023 01:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBPmt-0008UW-79
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 01:36:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e050b7c-956a-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 02:36:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 48D1B6220C;
 Fri,  8 Dec 2023 01:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97A1C433C8;
 Fri,  8 Dec 2023 01:36:14 +0000 (UTC)
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
X-Inumbo-ID: 2e050b7c-956a-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701999375;
	bh=e0xIo2j4fm+1lX+DZSf5sNHhsdfr+5D7pgf/1zuJqHg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SQUsLiYCsvLaD5oZVgk3EGl0wnR9DQO1cB4D+8FmZK2TZhPJ4nuuCl2H3xqka3OGk
	 vVc1BPXDzSBPjQdcq2Fmit3/0Jw4wGM74KXJsucki+4vqXNb1cx4OXM1/xEyRleEwi
	 LO09gddvlnC+xl4TM2hALFoZ+XxCOgfuAnzC1z2dK1Y7UHygw5O5q+d+U7Vn2vsxPw
	 YJlkixkkoFkTSZNJsYjEilYpVVGZxzJgddzAGj0ik2h6hLKA+at0AhY/VSHyCW7vsn
	 jdZACONKsEiAdbyG5V/a41vwB8QEHw6nPhHo3/NCNWD19xkdygBPjFdKLAWfI9M5dD
	 1WAp+SbNAPGqg==
Date: Thu, 7 Dec 2023 17:36:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>
Subject: Re: [PATCH 2/5] automation: Add the Dockerfile to build TF-A and
 U-Boot for FVP
In-Reply-To: <20231207135318.1912846-3-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2312071728250.1265976@ubuntu-linux-20-04-desktop>
References: <20231207135318.1912846-1-Henry.Wang@arm.com> <20231207135318.1912846-3-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Henry Wang wrote:
> Unlike the emulators that currently being used in the CI pipelines,
> the FVP must start at EL3. Therefore we need the firmware, i.e. the
> TrustedFirmware-A (TF-A), for corresponding functionality.
> 
> There is a dedicated board (vexpress_fvp) in U-Boot (serve as the
> BL33 of the TF-A) for the FVP platform, so the U-Boot should also be
> compiled for the FVP platform instead of reusing the U-Boot for the
> existing emulators used in the CI pipelines.
> 
> To avoid compiling TF-A and U-Boot everytime in the job, adding a
> Dockerfile to the test artifacts to build TF-A v2.9.0 and U-Boot
> v2023.10 for FVP. The binaries for the TF-A and U-Boot, as well as
> the device tree for the FVP platform, will be saved (and exported by
> the CI job introduced by following commits). Note that, a patch for
> the TF-A will be applied before building to enable the virtio-net
> and the virtio-rng device on the FVP. The virtio-net device will
> provide the networking service for FVP, and the virtio-rng device
> will improve the speed of the FVP.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  .../2023.10-2.9.0-arm64v8.dockerfile          | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 automation/tests-artifacts/armfvp-uboot-tfa/2023.10-2.9.0-arm64v8.dockerfile
> 
> diff --git a/automation/tests-artifacts/armfvp-uboot-tfa/2023.10-2.9.0-arm64v8.dockerfile b/automation/tests-artifacts/armfvp-uboot-tfa/2023.10-2.9.0-arm64v8.dockerfile
> new file mode 100644
> index 0000000000..6566b60545
> --- /dev/null
> +++ b/automation/tests-artifacts/armfvp-uboot-tfa/2023.10-2.9.0-arm64v8.dockerfile
> @@ -0,0 +1,48 @@
> +FROM --platform=linux/arm64/v8 debian:bookworm
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV UBOOT_VERSION="2023.10"
> +ENV TFA_VERSION="v2.9.0"
> +ENV USER root
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# build depends
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        build-essential \
> +        libssl-dev \
> +        bc \
> +        curl \
> +        flex \
> +        bison \
> +        git \
> +        device-tree-compiler && \
> +    apt-get autoremove -y && \
> +    apt-get clean && \
> +    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> +
> +# Build U-Boot and TF-A
> +RUN curl -fsSLO https://ftp.denx.de/pub/u-boot/u-boot-"$UBOOT_VERSION".tar.bz2 && \
> +    tar xvf u-boot-"$UBOOT_VERSION".tar.bz2 && \
> +    cd u-boot-"$UBOOT_VERSION" && \
> +    make -j$(nproc) V=1 vexpress_fvp_defconfig && \
> +    make -j$(nproc) V=1 all && \
> +    cd .. && \
> +    git clone --branch "$TFA_VERSION" --depth 1 https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git && \
> +    cd trusted-firmware-a && \
> +    curl -fsSLO https://git.yoctoproject.org/meta-arm/plain/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/fvp-base/0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch \
> +         --output 0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch && \
> +    git config --global user.email "you@example.com" && \
> +    git config --global user.name "Your Name" && \
> +    git am 0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch && \
> +    make -j$(nproc) DEBUG=1 PLAT=fvp ARCH=aarch64 FVP_DT_PREFIX=fvp-base-gicv3-psci-1t all && \
> +    make -j$(nproc) DEBUG=1 PLAT=fvp ARCH=aarch64 FVP_DT_PREFIX=fvp-base-gicv3-psci-1t fip BL33=../u-boot-"$UBOOT_VERSION"/u-boot.bin && \
> +    cp build/fvp/debug/bl1.bin / && \
> +    cp build/fvp/debug/fip.bin / && \
> +    cp build/fvp/debug/fdts/fvp-base-gicv3-psci-1t.dtb / && \
> +    cd /build && \
> +    rm -rf u-boot-"$UBOOT_VERSION" trusted-firmware-a
> -- 
> 2.25.1
> 

