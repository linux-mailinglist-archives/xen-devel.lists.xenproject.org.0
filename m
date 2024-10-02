Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE1698E60E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 00:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809065.1221209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw7kQ-0005Pz-1W; Wed, 02 Oct 2024 22:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809065.1221209; Wed, 02 Oct 2024 22:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw7kP-0005Nj-Ux; Wed, 02 Oct 2024 22:23:05 +0000
Received: by outflank-mailman (input) for mailman id 809065;
 Wed, 02 Oct 2024 22:23:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6XJ=Q6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sw7kO-0005Nd-Im
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 22:23:04 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3517aa1-810c-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 00:23:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A2347A44034;
 Wed,  2 Oct 2024 22:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8584C4CEC2;
 Wed,  2 Oct 2024 22:23:00 +0000 (UTC)
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
X-Inumbo-ID: e3517aa1-810c-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727907781;
	bh=lorMB7POSQq4LcExUZWDTI7L351e/ImXqLLu+hOq3iI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ig7HyrpQW7O88B0f8YAKSFmrvX9XEilDYMuyizFDo/XX0Gg+ZN1M0GIEXZ7VcGZ3p
	 YxeSsZNrpUHVuzodZVOXWKo55T1o+bJoArGz31KAp/xFe1b8yso9MhYsBNxOByibXQ
	 BoAL0v5vRN+SSuanXKMX2AvAkvaKabIkEDrtmIVuj81aWeZ/31uCFbGubPTRC5pLQi
	 NekaCHjhwyoqTC7AcUp4+mvlNaSE8NtpBNvhvgz8CnpTG2fzElcWtdVngb3XJWPs5S
	 5iAf2wCC6DhjB9OrvU6Af/bfD25NpkcSM4CARoupVLj3nnfbrtrhxomU+bkMAHdEh/
	 7gaUnqOB0XSYA==
Date: Wed, 2 Oct 2024 15:22:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a smoke test for xen.efi on X86
In-Reply-To: <alpine.DEB.2.22.394.2410021516180.1138574@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2410021517500.1138574@ubuntu-linux-20-04-desktop>
References: <20241002124245.716302-1-marmarek@invisiblethingslab.com> <20241002124245.716302-2-marmarek@invisiblethingslab.com> <alpine.DEB.2.22.394.2410021516180.1138574@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-834352706-1727907781=:1138574"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-834352706-1727907781=:1138574
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

I forgot to reply to one important part below


On Wed, 2 Oct 2024, Stefano Stabellini wrote:
> On Wed, 2 Oct 2024, Marek Marczykowski-Górecki wrote:
> > Check if xen.efi is bootable with an XTF dom0.
> > 
> > The TEST_TIMEOUT is set in the script to override project-global value.
> > Setting it in the gitlab yaml file doesn't work, as it's too low
> > priority
> > (https://docs.gitlab.com/ee/ci/variables/#cicd-variable-precedence).
> > 
> > The multiboot2+EFI path is tested on hardware tests already.
> > 
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > ---
> > This requires rebuilding debian:bookworm container.
> > 
> > The TEST_TIMEOUT issue mentioned above applies to xilix-* jobs too. It's
> > not clear to me why the default TEST_TIMEOUT is set at the group level
> > instead of in the yaml file, so I'm not adjusting the other places.
> 
> Let me premise that now that we use "expect" all successful tests will
> terminate as soon as the success condition is met, without waiting for
> the test timeout to expire.
> 
> There is a CI/CD variable called TEST_TIMEOUT set at the
> gitlab.com/xen-project level. (There is also a check in console.exp in
> case TEST_TIMEOUT is not set so that we don't run into problems in case
> the CI/CD variable is removed accidentally.) The global TEST_TIMEOUT is
> meant to be a high value to account for slow QEMU tests running
> potentially on our slowest cloud runners.
> 
> However, for hardware-based tests such as the xilinx-* jobs, we know
> that the timeout is supposed to be less than that. The test is running
> on real hardware which is considerably faster than QEMU running on our
> slowest runners. Basically, the timeout depends on the runner more than
> the test. So we override the TEST_TIMEOUT variable for the xilinx-* jobs
> providing a lower timeout value.
> 
> The global TEST_TIMEOUT is set to 1500.
> The xilinx-* timeout is set to 120 for ARM and 1000 for x86.
> 
> You are welcome to override the TEST_TIMEOUT value for the
> hardware-based QubesOS tests. At the same time, given that on success
> the timeout is not really used, it is also OK to leave it like this.
 
 
> > ---
> >  automation/build/debian/bookworm.dockerfile |  1 +
> >  automation/gitlab-ci/test.yaml              |  7 ++++
> >  automation/scripts/qemu-smoke-x86-64-efi.sh | 44 +++++++++++++++++++++
> >  3 files changed, 52 insertions(+)
> >  create mode 100755 automation/scripts/qemu-smoke-x86-64-efi.sh
> > 
> > diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
> > index 3dd70cb6b2e3..061114ba522d 100644
> > --- a/automation/build/debian/bookworm.dockerfile
> > +++ b/automation/build/debian/bookworm.dockerfile
> > @@ -46,6 +46,7 @@ RUN apt-get update && \
> >          # for test phase, qemu-smoke-* jobs
> >          qemu-system-x86 \
> >          expect \
> > +        ovmf \
> >          # for test phase, qemu-alpine-* jobs
> >          cpio \
> >          busybox-static \
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > index 8675016b6a37..74fd3f3109ae 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -463,6 +463,13 @@ qemu-smoke-x86-64-clang-pvh:
> >    needs:
> >      - debian-bookworm-clang-debug
> >  
> > +qemu-smoke-x86-64-gcc-efi:
> > +  extends: .qemu-x86-64
> > +  script:
> > +    - ./automation/scripts/qemu-smoke-x86-64-efi.sh pv 2>&1 | tee ${LOGFILE}
> > +  needs:
> > +    - debian-bookworm-gcc-debug
> 
> Given that the script you wrote (thank you!) can also handle pvh, can we
> directly add a pvh job to test.yaml too?
> 
> 
> >  qemu-smoke-riscv64-gcc:
> >    extends: .qemu-riscv64
> >    script:
> > diff --git a/automation/scripts/qemu-smoke-x86-64-efi.sh b/automation/scripts/qemu-smoke-x86-64-efi.sh
> > new file mode 100755
> > index 000000000000..e053cfa995ba
> > --- /dev/null
> > +++ b/automation/scripts/qemu-smoke-x86-64-efi.sh
> > @@ -0,0 +1,44 @@
> > +#!/bin/bash
> > +
> > +set -ex -o pipefail
> > +
> > +# variant should be either pv or pvh
> > +variant=$1
> > +
> > +# Clone and build XTF
> > +git clone https://xenbits.xen.org/git-http/xtf.git
> > +cd xtf && make -j$(nproc) && cd -
> > +
> > +case $variant in
> > +    pvh) k=test-hvm64-example    extra="dom0-iommu=none dom0=pvh" ;;
> > +    *)   k=test-pv64-example     extra= ;;
> > +esac
> > +
> > +mkdir -p boot-esp/EFI/BOOT
> > +cp binaries/xen.efi boot-esp/EFI/BOOT/BOOTX64.EFI
> > +cp xtf/tests/example/$k boot-esp/EFI/BOOT/kernel
> > +
> > +cat > boot-esp/EFI/BOOT/BOOTX64.cfg <<EOF
> > +[global]
> > +default=test
> > +
> > +[test]
> > +options=loglvl=all console=com1 noreboot console_timestamps=boot $extra
> > +kernel=kernel
> > +EOF
> > +
> > +cp /usr/share/OVMF/OVMF_CODE.fd OVMF_CODE.fd
> > +cp /usr/share/OVMF/OVMF_VARS.fd OVMF_VARS.fd
> > +
> > +rm -f smoke.serial
> > +export TEST_CMD="qemu-system-x86_64 -nographic -M q35,kernel-irqchip=split \
> > +        -drive if=pflash,format=raw,readonly=on,file=OVMF_CODE.fd \
> > +        -drive if=pflash,format=raw,file=OVMF_VARS.fd \
> > +        -drive file=fat:rw:boot-esp,media=disk,index=0,format=raw \
> > +        -m 512 -monitor none -serial stdio"
> > +
> > +export TEST_LOG="smoke.serial"
> > +export PASSED="Test result: SUCCESS"
> > +export TEST_TIMEOUT=120

Although this works, I would prefer keeping the TEST_TIMEOUT overrides
in test.yaml for consistency. However, it might be better not to
override it (or to override to a higher timeout value), as successful
tests will terminate immediately anyway. We need to be cautious about
setting TEST_TIMEOUT values too low, as using a slow runner (like a
small, busy cloud instance) can lead to false positive failures. This
issue occurred frequently with ARM tests when we temporarily moved from
a fast ARM server to slower ARM cloud instances a couple of months ago.

On the other hand, adjusting TEST_TIMEOUT for non-QEMU hardware-based
tests is acceptable since those tests rely on real hardware
availability, which is unlikely to become suddenly slower.
--8323329-834352706-1727907781=:1138574--

