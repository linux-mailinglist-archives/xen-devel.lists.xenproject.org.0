Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA72F94FB5B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 03:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775858.1186065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgev-0006pS-WB; Tue, 13 Aug 2024 01:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775858.1186065; Tue, 13 Aug 2024 01:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgev-0006ot-Qw; Tue, 13 Aug 2024 01:49:13 +0000
Received: by outflank-mailman (input) for mailman id 775858;
 Tue, 13 Aug 2024 01:49:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jgOn=PM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sdgev-0004dr-8y
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 01:49:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c35e2f7-5916-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 03:49:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A7D3602BF;
 Tue, 13 Aug 2024 01:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9FCC4AF0D;
 Tue, 13 Aug 2024 01:49:08 +0000 (UTC)
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
X-Inumbo-ID: 3c35e2f7-5916-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513749;
	bh=ZRmOJq5hRHTEKtPFJV0GBl+YFUXJeHYluIT7QrSEQrU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J8MkLBDuS20gYPoBTbHMj61jyWLS0NE+biTu+uJ+rEZV6hwc7WL4pDEHc2xEDU5Uh
	 DMfMZXw1HCt3nz/XqGLf2g66IVqXfdcOiw+kbj+UeWigIPLUHFHLDsXBqLbixlYRwo
	 ht/Ai/QKUiw3mtFhQmBsxKubYufBrtP5kNoXdSLBn82u1h4/CPJwTKqTLiDQv/N3DK
	 maEEw2sjJ/jqUsFM05obzXV0pPVc4NIV1xCuQuByRiV/ZYuyXPtY3cvCIUGLu5i199
	 mPOMUz5HzC2UJ56KkvftsqLXxDtj2WxAo6g9bp0vFrmD+ud1ynutR+gsWJfe0yNC7a
	 Cxn+qJFw7WCog==
Date: Mon, 12 Aug 2024 18:49:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v1 10/10] docs/system/i386: xenpvh: Add a basic
 description
In-Reply-To: <20240812130606.90410-11-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408121848590.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-11-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  MAINTAINERS                 |  1 +
>  docs/system/i386/xenpvh.rst | 49 +++++++++++++++++++++++++++++++++++++
>  docs/system/target-i386.rst |  1 +
>  3 files changed, 51 insertions(+)
>  create mode 100644 docs/system/i386/xenpvh.rst
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a24c2e14d9..da4c9d4d46 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -560,6 +560,7 @@ F: include/sysemu/xen.h
>  F: include/sysemu/xen-mapcache.h
>  F: stubs/xen-hw-stub.c
>  F: docs/system/arm/xenpvh.rst
> +F: docs/system/i386/xenpvh.rst
>  
>  Guest CPU Cores (NVMM)
>  ----------------------
> diff --git a/docs/system/i386/xenpvh.rst b/docs/system/i386/xenpvh.rst
> new file mode 100644
> index 0000000000..354250f073
> --- /dev/null
> +++ b/docs/system/i386/xenpvh.rst
> @@ -0,0 +1,49 @@
> +Xen PVH machine (``xenpvh``)
> +=========================================
> +
> +Xen supports a spectrum of types of guests that vary in how they depend
> +on HW virtualization features, emulation models and paravirtualization.
> +PVH is a mode that uses HW virtualization features (like HVM) but tries
> +to avoid emulation models and instead use passthrough or
> +paravirtualized devices.
> +
> +QEMU can be used to provide PV virtio devices on an emulated PCIe controller.
> +That is the purpose of this minimal machine.
> +
> +Supported devices
> +-----------------
> +
> +The x86 Xen PVH QEMU machine provide the following devices:
> +
> +- RAM
> +- GPEX host bridge
> +- virtio-pci devices
> +
> +The idea is to only connect virtio-pci devices but in theory any compatible
> +PCI device model will work depending on Xen and guest support.
> +
> +Running
> +-------
> +
> +The Xen tools will typically construct a command-line and launch QEMU
> +for you when needed. But here's an example of what it can look like in
> +case you need to construct one manually:
> +
> +.. code-block:: console
> +
> +    qemu-system-i386 -xen-domid 3 -no-shutdown        \
> +      -chardev socket,id=libxl-cmd,path=/var/run/xen/qmp-libxl-3,server=on,wait=off \
> +      -mon chardev=libxl-cmd,mode=control             \
> +      -chardev socket,id=libxenstat-cmd,path=/var/run/xen/qmp-libxenstat-3,server=on,wait=off \
> +      -mon chardev=libxenstat-cmd,mode=control        \
> +      -nodefaults                                     \
> +      -no-user-config                                 \
> +      -xen-attach -name g0                            \
> +      -vnc none                                       \
> +      -display none                                   \
> +      -device virtio-net-pci,id=nic0,netdev=net0,mac=00:16:3e:5c:81:78 \
> +      -netdev type=tap,id=net0,ifname=vif3.0-emu,br=xenbr0,script=no,downscript=no \
> +      -smp 4,maxcpus=4                                \
> +      -nographic                                      \
> +      -machine xenpvh,ram-low-base=0,ram-low-size=2147483648,ram-high-base=4294967296,ram-high-size=2147483648,pci-ecam-base=824633720832,pci-ecam-size=268435456,pci-mmio-base=4026531840,pci-mmio-size=33554432,pci-mmio-high-base=824902156288,pci-mmio-high-size=68719476736 \
> +      -m 4096
> diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
> index 1b8a1f248a..23e84e3ba7 100644
> --- a/docs/system/target-i386.rst
> +++ b/docs/system/target-i386.rst
> @@ -26,6 +26,7 @@ Architectural features
>     i386/cpu
>     i386/hyperv
>     i386/xen
> +   i386/xenpvh
>     i386/kvm-pv
>     i386/sgx
>     i386/amd-memory-encryption
> -- 
> 2.43.0
> 

