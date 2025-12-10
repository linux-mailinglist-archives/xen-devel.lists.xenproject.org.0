Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF164CB1765
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 01:03:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182303.1505197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT7eo-0008LL-1f; Wed, 10 Dec 2025 00:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182303.1505197; Wed, 10 Dec 2025 00:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT7en-0008Is-UP; Wed, 10 Dec 2025 00:02:13 +0000
Received: by outflank-mailman (input) for mailman id 1182303;
 Wed, 10 Dec 2025 00:02:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT7em-0008Im-7S
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 00:02:12 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78069180-d55b-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 01:02:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6C4D2406E2;
 Wed, 10 Dec 2025 00:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990A8C4CEF5;
 Wed, 10 Dec 2025 00:02:06 +0000 (UTC)
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
X-Inumbo-ID: 78069180-d55b-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765324927;
	bh=gSJLaBv1ZO5EY9YFpOHejSPij6xDEt3hGO3qbO1YqVI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YioZCuBlBPdZpKEZb3HUkdWzhkW43jnIG1Q8BEWTSGTOA88XAx/yt5H52GWeekMeM
	 UBiOudk5MS0aV4J6Y9KLn142n3z8enxyxn9FTlkPw+gnsBmxkSJ9FrK6lNx813ul4s
	 5q/0Q36arYevlhBnCVmEbG2BYwPquOpsWb8oBLr8Q5DtveN7fZvbEqqsI3ldmXXIiI
	 GH6LPeWdm6oaTbPAfuGQBjV5iuRT/o/uSBg86n3KIbx7WjpiFbOcDvHde+tZpXA54F
	 wssinn928XI4A2uprQKzU85O3NTLtGCdGERhkCowfyl7mFDmEize5PpvmsODVFtC13
	 G5UV4p/Bm7P9w==
Date: Tue, 9 Dec 2025 16:02:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 4/6] CI: Add driver domains tests
In-Reply-To: <cf2a2544fe27fedca5129b61912c064f4be08236.1764989098.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2512091534060.19429@ubuntu-linux-20-04-desktop>
References: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com> <cf2a2544fe27fedca5129b61912c064f4be08236.1764989098.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-57651224-1765323860=:19429"
Content-ID: <alpine.DEB.2.22.394.2512091551340.19429@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-57651224-1765323860=:19429
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2512091551341.19429@ubuntu-linux-20-04-desktop>

On Sat, 6 Dec 2025, Marek Marczykowski-Górecki wrote:
> Setup a simple two domU system. One with network backend, running
> xendriverdomain service, and one with frontend, trying to ping the
> backend.
> 
> Contrary to other similar tests, use disk image instead of initrd, to
> allow bigger rootfs without adding more RAM (for both dom0 and domU).
> But keep using pxelinux as a bootloader as it's easier to setup than
> installing grub on the disk. Theoretically, it could be started via direct
> kernel boot in QEMU, but pxelinux is slightly closer to real-world
> deployment.
> 
> Use fakeroot to preserve file owners/permissions. This is especially
> important for suid binaries like /bin/mount - without fakeroot, they
> will end up as suid into non-root user.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Changes in v3:
> - add fakeroot
> - run ldconfig at the disk image creation time, to avoid running it at
>   dom0/domU boot time (which is much slower)
> Changes in v2:
> - use heredoc
> - limit ping loop iterations
> - use full "backend" / "frontend" in disk image names
> - print domU consoles directly to /dev/console, to avoid systemd-added
>   messages prefix
> - terminate test on failure, don't wait for timeout
> ---
>  automation/build/debian/13-x86_64.dockerfile    |   2 +-
>  automation/gitlab-ci/test.yaml                  |   8 +-
>  automation/scripts/qemu-driverdomains-x86_64.sh | 138 +++++++++++++++++-
>  3 files changed, 148 insertions(+)
>  create mode 100755 automation/scripts/qemu-driverdomains-x86_64.sh
> 
> diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
> index 2c6c9d4a5098..6382bafbd5bd 100644
> --- a/automation/build/debian/13-x86_64.dockerfile
> +++ b/automation/build/debian/13-x86_64.dockerfile
> @@ -55,7 +55,9 @@ RUN <<EOF
>  
>          # for test phase, qemu-* jobs
>          busybox-static
> +        e2fsprogs
>          expect
> +        fakeroot
>          ovmf
>          qemu-system-x86
>  
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 7b36f1e126ca..abc5339a74ab 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -656,6 +656,14 @@ qemu-alpine-x86_64-gcc:
>      - *x86-64-test-needs
>      - alpine-3.22-gcc
>  
> +qemu-alpine-driverdomains-x86_64-gcc:
> +  extends: .qemu-x86-64
> +  script:
> +    - ./automation/scripts/qemu-driverdomains-x86_64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.22-gcc
> +
>  qemu-smoke-x86-64-gcc:
>    extends: .qemu-smoke-x86-64
>    script:
> diff --git a/automation/scripts/qemu-driverdomains-x86_64.sh b/automation/scripts/qemu-driverdomains-x86_64.sh
> new file mode 100755
> index 000000000000..c0241da54168
> --- /dev/null
> +++ b/automation/scripts/qemu-driverdomains-x86_64.sh
> @@ -0,0 +1,138 @@
> +#!/bin/bash
> +
> +set -ex -o pipefail
> +
> +dom0_rootfs_extra_comp=()
> +dom0_rootfs_extra_uncomp=()
> +
> +cd binaries
> +
> +# DomU rootfs
> +
> +mkdir -p rootfs
> +cd rootfs
> +mkdir -p etc/local.d
> +passed="ping test passed"
> +failed="TEST FAILED"
> +cat > etc/local.d/xen.start << EOF
> +#!/bin/bash
> +
> +set -x
> +
> +if grep -q test=backend /proc/cmdline; then
> +    brctl addbr xenbr0
> +    ip link set xenbr0 up
> +    ip addr add 192.168.0.1/24 dev xenbr0
> +    bash /etc/init.d/xendriverdomain start
> +    # log backend-related logs to the console
> +    tail -F /var/log/xen/xldevd.log /var/log/xen/xen-hotplug.log >>/dev/console 2>/dev/null &
> +else
> +    ip link set eth0 up
> +    ip addr add 192.168.0.2/24 dev eth0
> +    timeout=6 # 6*10s
> +    until ping -c 10 192.168.0.1; do
> +        sleep 1
> +        if [ \$timeout -le 0 ]; then
> +            echo "${failed}"
> +            exit 1
> +        fi
> +        ((timeout--))
> +    done
> +    echo "${passed}"
> +fi
> +EOF
> +chmod +x etc/local.d/xen.start
> +fakeroot sh -c "
> +    zcat ../rootfs.cpio.gz | cpio -imd
> +    zcat ../xen-tools.cpio.gz | cpio -imd
> +    ldconfig -r .
> +    touch etc/.updated
> +    mkfs.ext4 -d . ../domU-rootfs.img 1024M

Do we really need 1GB? I would rather use a smaller size if possible.
I would rather use as little resources as possible on the build server
as we might run a few of these jobs in parallel one day soon.

Moreover this script will be run inside a container which means this
data is probably in RAM.

The underlying rootfs is 25M on both ARM and x86. This should be at most
50M.


> +"
> +cd ..
> +rm -rf rootfs
> +
> +# Dom0 rootfs
> +mkdir -p rootfs
> +cd rootfs
> +fakeroot -s ../fakeroot-save sh -c "
> +    zcat ../rootfs.cpio.gz | cpio -imd
> +    zcat ../xen-tools.cpio.gz | cpio -imd
> +    ldconfig -r .
> +    touch etc/.updated
> +"
> +mkdir -p root etc/local.d
> +cat > root/backend.cfg << EOF
> +name="backend"
> +memory=512
> +vcpus=1
> +kernel="/root/bzImage"
> +extra="console=hvc0 root=/dev/xvda net.ifnames=0 test=backend"
> +disk=[ '/root/domU-rootfs-backend.img,raw,xvda,rw' ]
> +EOF
> +cat > root/frontend.cfg << EOF
> +name="frontend"
> +memory=512
> +vcpus=1
> +kernel="/root/bzImage"
> +extra="console=hvc0 root=/dev/xvda net.ifnames=0 test=frontend"
> +disk=[ '/root/domU-rootfs-frontend.img,raw,xvda,rw' ]
> +vif=[ 'bridge=xenbr0,backend=backend' ]
> +EOF
> +
> +cat > etc/local.d/xen.start << EOF
> +#!/bin/bash
> +
> +set -x
> +
> +bash /etc/init.d/xencommons start
> +
> +xl list
> +
> +tail -F /var/log/xen/console/guest-backend.log 2>/dev/null | sed -e "s/^/(backend) /" >>/dev/console &
> +tail -F /var/log/xen/console/guest-frontend.log 2>/dev/null | sed -e "s/^/(frontend) /" >>/dev/console &
> +xl -vvv create /root/backend.cfg
> +xl -vvv create /root/frontend.cfg
> +EOF
> +chmod +x etc/local.d/xen.start
> +
> +cp ../domU-rootfs.img ./root/domU-rootfs-backend.img
> +cp ../domU-rootfs.img ./root/domU-rootfs-frontend.img
> +cp ../bzImage ./root/
> +mkdir -p etc/default
> +echo 'XENCONSOLED_TRACE=all' >> etc/default/xencommons
> +mkdir -p var/log/xen/console
> +fakeroot -i ../fakeroot-save mkfs.ext4 -d . ../dom0-rootfs.img 2048M

Same here. Also 2GB might not be sufficient to contain 2 copies of
domU-rootfs.img, given that domU-rootfs.img is 1GB.

If we bring down domU-rootfs.img to 50M, then this could be 150M.


> +cd ..
> +rm -rf rootfs
> +
> +cd ..
> +
> +cat >> binaries/pxelinux.0 << EOF
> +#!ipxe
> +
> +kernel xen console=com1 console_timestamps=boot
> +module bzImage console=hvc0 root=/dev/sda net.ifnames=0
> +boot
> +EOF
> +
> +# Run the test
> +rm -f smoke.serial
> +export TEST_CMD="qemu-system-x86_64 \
> +    -cpu qemu64,+svm \
> +    -m 2G -smp 2 \
> +    -monitor none -serial stdio \
> +    -nographic \
> +    -device virtio-net-pci,netdev=n0 \
> +    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 \
> +    -drive file=binaries/dom0-rootfs.img,format=raw"
> +
> +export TEST_LOG="smoke.serial"
> +export BOOT_MSG="Latest ChangeSet: "
> +export LOG_MSG="Domain-0"
> +# exit early on test failure too, check if it was success below
> +export PASSED="$passed|$failed"
> +
> +./automation/scripts/console.exp | sed 's/\r\+$//'
> +
> +grep "$passed" smoke.serial
> -- 
> git-series 0.9.1
> 
--8323329-57651224-1765323860=:19429--

