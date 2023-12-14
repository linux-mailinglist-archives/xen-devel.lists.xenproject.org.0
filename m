Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BA7813A7F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 20:11:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654730.1021996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDr6I-0003yr-9h; Thu, 14 Dec 2023 19:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654730.1021996; Thu, 14 Dec 2023 19:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDr6I-0003wq-5h; Thu, 14 Dec 2023 19:10:26 +0000
Received: by outflank-mailman (input) for mailman id 654730;
 Thu, 14 Dec 2023 19:10:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDr6G-0003wk-B8
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 19:10:24 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ceca05e-9ab4-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 20:10:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7B9B5CE25AA;
 Thu, 14 Dec 2023 19:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DA6C433C7;
 Thu, 14 Dec 2023 19:10:17 +0000 (UTC)
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
X-Inumbo-ID: 6ceca05e-9ab4-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702581018;
	bh=e3tR118Er5z+48pjGBLo7m1zIVAIVDZtxIyvy0CYPlo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y+RBlqfLfjjbvdC15B9FGi1Q1KB8TJnxBoelmEohxzMhRY6dIm3xcbF2w4r+SxFRn
	 DxTMJpPB8BkkKGLb0S9jY6exsqfRF7rNChmdxPpzo4dvuwQuSargfhZuoyn8Uv0OZL
	 H0qbF5ba8xGeXW0lO41UkrJu6ZFsxyMSeAvF/+DMAM7xB3mTkXwb315BcINOga5AOQ
	 ksvKPGXqpq3ZIBu5PU+xKVOIgzG9NuUwSC+Weuj8JfCScH1lRaRsNGgjNTkECP5O7t
	 wSMD5eWs6ErEW8ww+S/rSnJnTmE2x8ZCNCvy4LXaZkW/Ddbm5IkdfaRwRsn2LQxkfE
	 +RebCydlYUwpA==
Date: Thu, 14 Dec 2023 11:10:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 4/4] automation: add x86-64 livepatching test
In-Reply-To: <20231214101719.18770-5-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2312141110100.3175268@ubuntu-linux-20-04-desktop>
References: <20231214101719.18770-1-roger.pau@citrix.com> <20231214101719.18770-5-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1806696802-1702581018=:3175268"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1806696802-1702581018=:3175268
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 13 Dec 2023, Roger Pau Monne wrote:
> Introduce a new gitlab tests for livepatching, using livepatch-build-tools,
> which better reflects how downstreams build live patches rather than the
> in-tree tests.
> 
> The tests applies the dummy in-tree patch example, checks that the patch is
> applied correctly and then reverts and unloads it.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes since v2:
>  - Split livepatch build into a separate script.
> ---
>  automation/gitlab-ci/build.yaml               |  9 +++
>  automation/gitlab-ci/test.yaml                |  8 +++
>  automation/scripts/build-livepatch            | 27 ++++++++
>  .../scripts/qemu-alpine-x86_64-livepatch.sh   | 68 +++++++++++++++++++
>  4 files changed, 112 insertions(+)
>  create mode 100755 automation/scripts/build-livepatch
>  create mode 100755 automation/scripts/qemu-alpine-x86_64-livepatch.sh
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 32af30ccedc9..d770bffb845e 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -358,6 +358,15 @@ alpine-3.18-gcc-debug:
>    variables:
>      CONTAINER: alpine:3.18
>  
> +alpine-3.18-gcc-livepatch:
> +  extends: .gcc-x86-64-build
> +  script:
> +    - ./automation/scripts/build-livepatch 2>&1 | tee build.log
> +  variables:
> +    CONTAINER: alpine:3.18
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
> diff --git a/automation/scripts/build-livepatch b/automation/scripts/build-livepatch
> new file mode 100755
> index 000000000000..ac86b17ae5e4
> --- /dev/null
> +++ b/automation/scripts/build-livepatch
> @@ -0,0 +1,27 @@
> +#!/bin/bash -ex
> +
> +# Do a regular build first
> +./automation/scripts/build
> +
> +# Build a test livepatch using livepatch-build-tools.
> +
> +if [[ "$XEN_TARGET_ARCH" != "x86_64" ]]; then
> +    exit 1
> +fi
> +
> +BASE=xen/arch/x86/test/smoc-lp.c
> +ALT=xen/arch/x86/test/smoc-lp-alt.c
> +
> +[[ -f $BASE && -f $ALT ]]
> +
> +# git diff --no-index returns 0 if no differences, otherwise 1.
> +git diff --no-index --output=test.patch $BASE $ALT && exit 1
> +
> +BUILDID=$(readelf -Wn xen/xen-syms | sed -n -e 's/^.*Build ID: //p')
> +
> +git clone https://xenbits.xen.org/git-http/livepatch-build-tools.git
> +cd livepatch-build-tools
> +make
> +./livepatch-build -s ../ -p ../test.patch -o out -c ../xen/.config \
> +    --depends $BUILDID --xen-depends $BUILDID
> +cp out/test.livepatch ../binaries/test.livepatch
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
--8323329-1806696802-1702581018=:3175268--

