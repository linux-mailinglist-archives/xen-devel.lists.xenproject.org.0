Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB1B98E602
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 00:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809057.1221189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw7eB-0003EW-6f; Wed, 02 Oct 2024 22:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809057.1221189; Wed, 02 Oct 2024 22:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw7eB-0003Br-3m; Wed, 02 Oct 2024 22:16:39 +0000
Received: by outflank-mailman (input) for mailman id 809057;
 Wed, 02 Oct 2024 22:16:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6XJ=Q6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sw7eA-0003Bk-2h
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 22:16:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faa77c48-810b-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 00:16:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3A93A5C0F73;
 Wed,  2 Oct 2024 22:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FB9C4CEC2;
 Wed,  2 Oct 2024 22:16:30 +0000 (UTC)
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
X-Inumbo-ID: faa77c48-810b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727907391;
	bh=1oDAxY34+y+Hw4tZ44s5sG8yvhoKexghuodeJjA+qUc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tGpdb+ow8fILnnqovgRKF4ioIP6ch7HLMHm8pC5DxKjUryYF1qXa9c5u0j49xnwkX
	 NzsODOFzncnl3R62HSqi9a4WG0K3y2qFZjHDgvcwUMuQK/FHpWj6xUthOT1fBRsCor
	 grVu9ipVnhiPP6lOnt5+D51WFNwVszOR8Kan3Dg5NYiKQzKekP7EP3n+N8/MzLzQR4
	 VT64wmmXp5PglDwPXA/kCRa1igvnF/h8AK+aaAxciJN7x9Yys3FKugZcNFrSW6GoW0
	 DtREtm9x74LOnhH/lLBdT5stilrJ+UvhHkn//CjDHUMeWe/T/yCoNaqdzRn5bWiG80
	 eUwvLb4BDRIHA==
Date: Wed, 2 Oct 2024 15:16:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] automation: add a smoke test for xen.efi on X86
In-Reply-To: <20241002124245.716302-2-marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2410021516180.1138574@ubuntu-linux-20-04-desktop>
References: <20241002124245.716302-1-marmarek@invisiblethingslab.com> <20241002124245.716302-2-marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-274103806-1727906580=:1138574"
Content-ID: <alpine.DEB.2.22.394.2410021505330.1138574@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-274103806-1727906580=:1138574
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2410021505331.1138574@ubuntu-linux-20-04-desktop>

On Wed, 2 Oct 2024, Marek Marczykowski-Górecki wrote:
> Check if xen.efi is bootable with an XTF dom0.
> 
> The TEST_TIMEOUT is set in the script to override project-global value.
> Setting it in the gitlab yaml file doesn't work, as it's too low
> priority
> (https://docs.gitlab.com/ee/ci/variables/#cicd-variable-precedence).
> 
> The multiboot2+EFI path is tested on hardware tests already.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> This requires rebuilding debian:bookworm container.
> 
> The TEST_TIMEOUT issue mentioned above applies to xilix-* jobs too. It's
> not clear to me why the default TEST_TIMEOUT is set at the group level
> instead of in the yaml file, so I'm not adjusting the other places.

Let me premise that now that we use "expect" all successful tests will
terminate as soon as the success condition is met, without waiting for
the test timeout to expire.

There is a CI/CD variable called TEST_TIMEOUT set at the
gitlab.com/xen-project level. (There is also a check in console.exp in
case TEST_TIMEOUT is not set so that we don't run into problems in case
the CI/CD variable is removed accidentally.) The global TEST_TIMEOUT is
meant to be a high value to account for slow QEMU tests running
potentially on our slowest cloud runners.

However, for hardware-based tests such as the xilinx-* jobs, we know
that the timeout is supposed to be less than that. The test is running
on real hardware which is considerably faster than QEMU running on our
slowest runners. Basically, the timeout depends on the runner more than
the test. So we override the TEST_TIMEOUT variable for the xilinx-* jobs
providing a lower timeout value.

The global TEST_TIMEOUT is set to 1500.
The xilinx-* timeout is set to 120 for ARM and 1000 for x86.

You are welcome to override the TEST_TIMEOUT value for the
hardware-based QubesOS tests. At the same time, given that on success
the timeout is not really used, it is also OK to leave it like this.


> ---
>  automation/build/debian/bookworm.dockerfile |  1 +
>  automation/gitlab-ci/test.yaml              |  7 ++++
>  automation/scripts/qemu-smoke-x86-64-efi.sh | 44 +++++++++++++++++++++
>  3 files changed, 52 insertions(+)
>  create mode 100755 automation/scripts/qemu-smoke-x86-64-efi.sh
> 
> diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
> index 3dd70cb6b2e3..061114ba522d 100644
> --- a/automation/build/debian/bookworm.dockerfile
> +++ b/automation/build/debian/bookworm.dockerfile
> @@ -46,6 +46,7 @@ RUN apt-get update && \
>          # for test phase, qemu-smoke-* jobs
>          qemu-system-x86 \
>          expect \
> +        ovmf \
>          # for test phase, qemu-alpine-* jobs
>          cpio \
>          busybox-static \
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 8675016b6a37..74fd3f3109ae 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -463,6 +463,13 @@ qemu-smoke-x86-64-clang-pvh:
>    needs:
>      - debian-bookworm-clang-debug
>  
> +qemu-smoke-x86-64-gcc-efi:
> +  extends: .qemu-x86-64
> +  script:
> +    - ./automation/scripts/qemu-smoke-x86-64-efi.sh pv 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - debian-bookworm-gcc-debug

Given that the script you wrote (thank you!) can also handle pvh, can we
directly add a pvh job to test.yaml too?


>  qemu-smoke-riscv64-gcc:
>    extends: .qemu-riscv64
>    script:
> diff --git a/automation/scripts/qemu-smoke-x86-64-efi.sh b/automation/scripts/qemu-smoke-x86-64-efi.sh
> new file mode 100755
> index 000000000000..e053cfa995ba
> --- /dev/null
> +++ b/automation/scripts/qemu-smoke-x86-64-efi.sh
> @@ -0,0 +1,44 @@
> +#!/bin/bash
> +
> +set -ex -o pipefail
> +
> +# variant should be either pv or pvh
> +variant=$1
> +
> +# Clone and build XTF
> +git clone https://xenbits.xen.org/git-http/xtf.git
> +cd xtf && make -j$(nproc) && cd -
> +
> +case $variant in
> +    pvh) k=test-hvm64-example    extra="dom0-iommu=none dom0=pvh" ;;
> +    *)   k=test-pv64-example     extra= ;;
> +esac
> +
> +mkdir -p boot-esp/EFI/BOOT
> +cp binaries/xen.efi boot-esp/EFI/BOOT/BOOTX64.EFI
> +cp xtf/tests/example/$k boot-esp/EFI/BOOT/kernel
> +
> +cat > boot-esp/EFI/BOOT/BOOTX64.cfg <<EOF
> +[global]
> +default=test
> +
> +[test]
> +options=loglvl=all console=com1 noreboot console_timestamps=boot $extra
> +kernel=kernel
> +EOF
> +
> +cp /usr/share/OVMF/OVMF_CODE.fd OVMF_CODE.fd
> +cp /usr/share/OVMF/OVMF_VARS.fd OVMF_VARS.fd
> +
> +rm -f smoke.serial
> +export TEST_CMD="qemu-system-x86_64 -nographic -M q35,kernel-irqchip=split \
> +        -drive if=pflash,format=raw,readonly=on,file=OVMF_CODE.fd \
> +        -drive if=pflash,format=raw,file=OVMF_VARS.fd \
> +        -drive file=fat:rw:boot-esp,media=disk,index=0,format=raw \
> +        -m 512 -monitor none -serial stdio"
> +
> +export TEST_LOG="smoke.serial"
> +export PASSED="Test result: SUCCESS"
> +export TEST_TIMEOUT=120
> +
> +./automation/scripts/console.exp | sed 's/\r\+$//'
> -- 
> 2.46.0
> 
--8323329-274103806-1727906580=:1138574--

