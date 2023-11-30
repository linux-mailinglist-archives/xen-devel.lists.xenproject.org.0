Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369867FE77F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 04:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644374.1005256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8XKe-0006X9-Pk; Thu, 30 Nov 2023 03:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644374.1005256; Thu, 30 Nov 2023 03:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8XKe-0006V1-Ms; Thu, 30 Nov 2023 03:03:16 +0000
Received: by outflank-mailman (input) for mailman id 644374;
 Thu, 30 Nov 2023 03:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8XKd-0006Uv-OV
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 03:03:15 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 004ead77-8f2d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 04:03:13 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id EF0ACB84147;
 Thu, 30 Nov 2023 03:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB35C433C7;
 Thu, 30 Nov 2023 03:03:11 +0000 (UTC)
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
X-Inumbo-ID: 004ead77-8f2d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701313392;
	bh=Iuj8fLDUX6MMjuIMA2EykiFY/qyQGQuEeGbwIZKYkWo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rysggynueIfq+8DFONVQ3neDm5LfNsWC/fLjkh4jF0OdYPB6kgIxHcQPIcYAGLYAX
	 ObqWL0q71cnevZNOvDAXghhtyC58epLs9ko5/8Qsl1+NyAqSh+h7PmxUe7GJfUVZ9L
	 ehMHcEzlrFwMUrc0reD5MV+C7+Sm6ArvHJzTM1jNVWb1u1O4QsIw5/VBYimBjMtSpw
	 C8YxWdpuNX4TsH0i6r5EIweRH0QLjwu8m8WB/XefQmNrlCYBQkWJL1juOid/6VXHSK
	 LdQO9uxEYbNXNCe1s4hYohAokupTxvFIDEoM0B5ptEbc5Le4GDJFvYXwddHQUvJpWX
	 37mjvhzXdyEoQ==
Date: Wed, 29 Nov 2023 19:03:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 5/5] automation: add x86-64 livepatching test
In-Reply-To: <20231128100352.35430-6-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311291901250.3533093@ubuntu-linux-20-04-desktop>
References: <20231128100352.35430-1-roger.pau@citrix.com> <20231128100352.35430-6-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-815831715-1701313391=:3533093"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-815831715-1701313391=:3533093
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 28 Nov 2023, Roger Pau Monne wrote:
> Introduce a new gitlab tests for livepatching, using livepatch-build-tools,
> which better reflects how downstreams build live patches rather than the
> in-tree tests.
> 
> The tests applies the dummy in-tree patch example, checks that the patch is
> applied correctly and then reverts and unloads it.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  automation/gitlab-ci/build.yaml               |  8 +++
>  automation/gitlab-ci/test.yaml                |  8 +++
>  automation/scripts/build                      | 21 ++++++
>  .../scripts/qemu-alpine-x86_64-livepatch.sh   | 68 +++++++++++++++++++
>  4 files changed, 105 insertions(+)
>  create mode 100755 automation/scripts/qemu-alpine-x86_64-livepatch.sh
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 32af30ccedc9..22026df51b87 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -358,6 +358,14 @@ alpine-3.18-gcc-debug:
>    variables:
>      CONTAINER: alpine:3.18
>  
> +alpine-3.18-gcc-livepatch:
> +  extends: .gcc-x86-64-build
> +  variables:
> +    CONTAINER: alpine:3.18
> +    LIVEPATCH: y
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_LIVEPATCH=y
> +
>  debian-stretch-gcc-debug:
>    extends: .gcc-x86-64-build-debug
>    variables:
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 6aabdb9d156f..58a90be5ed0e 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -459,3 +459,11 @@ qemu-smoke-ppc64le-powernv9-gcc:
>    needs:
>      - qemu-system-ppc64-8.1.0-ppc64-export
>      - debian-bullseye-gcc-ppc64le-debug
> +
> +qemu-alpine-x86_64-gcc-livepatch:
> +  extends: .qemu-x86-64
> +  script:
> +    - ./automation/scripts/qemu-alpine-x86_64-livepatch.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-livepatch
> diff --git a/automation/scripts/build b/automation/scripts/build
> index b3c71fb6fb60..0a0a6dceb08c 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -103,3 +103,24 @@ else
>      cp -r dist binaries/
>      if [[ -f xen/xen ]] ; then cp xen/xen binaries/xen; fi
>  fi
> +
> +if [[ "$LIVEPATCH" == "y" ]]; then
> +    # Build a test livepatch using livepatch-build-tools.
> +
> +    if [[ "$XEN_TARGET_ARCH" != "x86_64" ]]; then
> +        exit 1
> +    fi
> +
> +    # git diff --no-index returns 0 if no differences, otherwise 1.
> +    git diff --no-index --output=test.patch xen/arch/x86/test-smc-lp.c \
> +                                            xen/arch/x86/test-smc-lp-alt.c && exit 1
> +
> +    BUILDID=$(readelf -Wn xen/xen-syms | sed -n -e 's/^.*Build ID: //p')
> +
> +    git clone https://xenbits.xen.org/git-http/livepatch-build-tools.git
> +    cd livepatch-build-tools
> +    make
> +    ./livepatch-build -s ../ -p ../test.patch -o out -c ../xen/.config \
> +        --depends $BUILDID --xen-depends $BUILDID
> +    cp out/test.livepatch ../binaries/test.livepatch
> +fi

I realize this is a matter of taste but if possible I would move this to
qemu-alpine-x86_64-livepatch.sh not to make the build script too
complex.

Otherwise, plase create automation/scripts/livepatch and move this code
there. You can call automation/scripts/livepatch from
automation/scripts/build.

Other than that, this is great! I'll let other review the livepatch
specific changes in this series



> diff --git a/automation/scripts/qemu-alpine-x86_64-livepatch.sh b/automation/scripts/qemu-alpine-x86_64-livepatch.sh
> new file mode 100755
> index 000000000000..da478cac4376
> --- /dev/null
> +++ b/automation/scripts/qemu-alpine-x86_64-livepatch.sh
> @@ -0,0 +1,68 @@
> +#!/bin/bash
> +
> +set -ex
> +
> +cd binaries
> +# initrd.tar.gz is Dom0 rootfs
> +mkdir -p rootfs
> +cd rootfs
> +tar xvzf ../initrd.tar.gz
> +mkdir proc
> +mkdir run
> +mkdir srv
> +mkdir sys
> +rm var/run
> +cp -ar ../dist/install/* .
> +cp ../test.livepatch ./root/
> +cat << "EOF" >> etc/local.d/xen-lp.start
> +#!/bin/bash
> +
> +set -ex
> +
> +trap poweroff EXIT
> +
> +export LD_LIBRARY_PATH=/usr/local/lib
> +
> +xen-livepatch test && exit 1 || true
> +
> +xen-livepatch load /root/test.livepatch
> +
> +# Cannot fail now
> +xen-livepatch test
> +
> +xen-livepatch revert test
> +xen-livepatch unload test
> +
> +xen-livepatch test && exit 1 || true
> +
> +echo "SUCCESS"
> +EOF
> +chmod +x etc/local.d/xen-lp.start
> +echo "rc_verbose=yes" >> etc/rc.conf
> +# rebuild Dom0 rootfs
> +find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
> +cd ../..
> +
> +cat >> binaries/pxelinux.0 << EOF
> +#!ipxe
> +
> +kernel xen console=com1 console_timestamps=boot
> +module bzImage console=hvc0
> +module xen-rootfs.cpio.gz
> +boot
> +EOF
> +
> +# Run the test
> +rm -f smoke.serial
> +timeout -k 1 360 \
> +qemu-system-x86_64 \
> +    -cpu qemu64,+svm \
> +    -m 2G -smp 2 \
> +    -monitor none -serial stdio \
> +    -nographic \
> +    -device virtio-net-pci,netdev=n0 \
> +    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& \
> +        tee smoke.serial | sed 's/\r//'
> +
> +grep -q "SUCCESS" smoke.serial
> +exit 0
> -- 
> 2.43.0
> 
--8323329-815831715-1701313391=:3533093--

