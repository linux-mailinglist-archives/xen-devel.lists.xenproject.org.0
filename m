Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2E380AEF4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 22:47:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650806.1016603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBigo-0004If-J9; Fri, 08 Dec 2023 21:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650806.1016603; Fri, 08 Dec 2023 21:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBigo-0004Fm-GY; Fri, 08 Dec 2023 21:47:18 +0000
Received: by outflank-mailman (input) for mailman id 650806;
 Fri, 08 Dec 2023 21:47:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBign-0004Fg-8z
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 21:47:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51ea76df-9613-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 22:47:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 778F6625CB;
 Fri,  8 Dec 2023 21:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5FAC433C7;
 Fri,  8 Dec 2023 21:46:59 +0000 (UTC)
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
X-Inumbo-ID: 51ea76df-9613-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702072021;
	bh=g/IR9WuasjttywpzarkTOCrzCoM6CdIuypL/HnnPBPM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NRXiZ46/Oojvl5LZABoIOmQHd06/J9W7s2P9zey/t2nWKxq7v8hAV8Fb2StMDndkr
	 agK+db+kY9VR8G77htkuODkRHAKm6i7ztczU+xT5tUM7IQx9lG37mTXyDLzZjOEoT4
	 2PnTIlOiqPIYzKwpzethd+Oci+qeSoCHNEZHA8UJFH3oVXpWAJscsFvSWk70xk4EDx
	 x/1Kc6AXuBJiOU7qVwZrjzjGLtYI+W8nyJQrPa9I/O6E4mPp7c6h78BcZXUYhCKId+
	 lChq17jxjS4e9R8HVWajGQNboIABqR+z2tlCtDZlif74LDTdi8QGsbQ/5XmobljGht
	 1l0O7Osf5TIVA==
Date: Fri, 8 Dec 2023 13:46:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>
Subject: Re: [PATCH v2 4/5] automation: Add the script for the FVP smoke
 test
In-Reply-To: <20231208054637.1973424-5-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2312081338490.1703076@ubuntu-linux-20-04-desktop>
References: <20231208054637.1973424-1-Henry.Wang@arm.com> <20231208054637.1973424-5-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Dec 2023, Henry Wang wrote:
> This commit adds the shell script for the FVP smoke test. Similarly
> as the QEMU jobs, the shell script will firstly prepare the DomU
> BusyBox image, use the ImageBuilder to arrange the binaries in memory
> and generate the U-Boot script, then start the test. To provide the
> TFTP service for the FVP, the shell script will also start the TFTP
> service, and copy the binaries needed by test to the TFTP directory
> used by the TFTP server.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v2:
> - Set pipefail before running the expect script, so that the error
>   won't be hid by pipe and the tee to the logfile.
> ---
>  .../scripts/fvp-base-smoke-dom0-arm64.sh      | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100755 automation/scripts/fvp-base-smoke-dom0-arm64.sh
> 
> diff --git a/automation/scripts/fvp-base-smoke-dom0-arm64.sh b/automation/scripts/fvp-base-smoke-dom0-arm64.sh
> new file mode 100755
> index 0000000000..99097dad51
> --- /dev/null
> +++ b/automation/scripts/fvp-base-smoke-dom0-arm64.sh
> @@ -0,0 +1,120 @@
> +#!/bin/bash
> +
> +set -ex
> +
> +# DomU Busybox
> +cd binaries
> +mkdir -p initrd
> +mkdir -p initrd/bin
> +mkdir -p initrd/sbin
> +mkdir -p initrd/etc
> +mkdir -p initrd/dev
> +mkdir -p initrd/proc
> +mkdir -p initrd/sys
> +mkdir -p initrd/lib
> +mkdir -p initrd/var
> +mkdir -p initrd/mnt
> +cp /bin/busybox initrd/bin/busybox
> +initrd/bin/busybox --install initrd/bin
> +echo "#!/bin/sh
> +
> +mount -t proc proc /proc
> +mount -t sysfs sysfs /sys
> +mount -t devtmpfs devtmpfs /dev
> +/bin/sh" > initrd/init
> +chmod +x initrd/init
> +cd initrd
> +find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
> +cd ..
> +
> +mkdir -p rootfs
> +cd rootfs
> +tar xvzf ../initrd.tar.gz
> +mkdir proc
> +mkdir run
> +mkdir srv
> +mkdir sys
> +rm var/run
> +cp -ar ../dist/install/* .
> +mv ../initrd.cpio.gz ./root
> +cp ../Image ./root
> +echo "name=\"test\"
> +memory=512
> +vcpus=1
> +kernel=\"/root/Image\"
> +ramdisk=\"/root/initrd.cpio.gz\"
> +extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
> +" > root/test.cfg
> +echo "#!/bin/bash
> +
> +export LD_LIBRARY_PATH=/usr/local/lib
> +bash /etc/init.d/xencommons start
> +
> +xl list
> +
> +xl create -c /root/test.cfg
> +
> +" > etc/local.d/xen.start
> +chmod +x etc/local.d/xen.start
> +echo "rc_verbose=yes" >> etc/rc.conf
> +find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
> +cd ../..
> +
> +# Start a TFTP server to provide TFTP service to FVP
> +service tftpd-hpa start
> +
> +# ImageBuilder
> +echo 'MEMORY_START="0x80000000"
> +MEMORY_END="0xFF000000"
> +
> +DEVICE_TREE="fvp-base-gicv3-psci-1t.dtb"
> +XEN="xen"
> +DOM0_KERNEL="Image"
> +DOM0_RAMDISK="xen-rootfs.cpio.gz"
> +XEN_CMD="console=dtuart dom0_mem=1024M console_timestamps=boot"
> +
> +NUM_DOMUS=0
> +
> +LOAD_CMD="tftpb"
> +UBOOT_SOURCE="boot.source"
> +UBOOT_SCRIPT="boot.scr"' > binaries/config
> +rm -rf imagebuilder
> +git clone https://gitlab.com/ViryaOS/imagebuilder
> +bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
> +
> +# Copy files to the TFTP directory to use
> +cp ./binaries/boot.scr /srv/tftp/
> +cp ./binaries/Image /srv/tftp/
> +cp ./binaries/xen-rootfs.cpio.gz /srv/tftp/
> +cp ./binaries/xen /srv/tftp/
> +cp ./binaries/fvp-base-gicv3-psci-1t.dtb /srv/tftp/
> +
> +# Start FVP
> +TERM0_CFG="-C bp.terminal_0.mode=telnet -C bp.terminal_0.start_telnet=0"
> +TERM1_CFG="-C bp.terminal_1.mode=telnet -C bp.terminal_1.start_telnet=0"
> +TERM2_CFG="-C bp.terminal_2.mode=telnet -C bp.terminal_2.start_telnet=0"
> +TERM3_CFG="-C bp.terminal_3.mode=telnet -C bp.terminal_3.start_telnet=0"
> +
> +VIRTIO_USER_NETWORK_CFG="-C bp.virtio_net.enabled=1 \
> +-C bp.virtio_net.hostbridge.userNetworking=1 \
> +-C bp.virtio_net.hostbridge.userNetPorts=8022=22 \
> +-C bp.virtio_net.transport=legacy"
> +
> +# Set the pipefail so that the error code from the expect script won't
> +# be hid by pipe and the tee command.
> +set -o pipefail
> +./automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp \
> +    "/FVP/FVP_Base_RevC-2xAEMvA/Base_RevC_AEMvA_pkg/models/Linux64_armv8l_GCC-9.3/FVP_Base_RevC-2xAEMvA \
> +    -C bp.vis.disable_visualisation=1 \
> +    -C bp.ve_sysregs.exit_on_shutdown=1 \
> +    -C bp.secure_memory=0 \
> +    -C cache_state_modelled=0 \
> +    -C cluster0.has_arm_v8-4=1 \
> +    -C cluster1.has_arm_v8-4=1 \
> +    ${TERM0_CFG} ${TERM1_CFG} ${TERM2_CFG} ${TERM3_CFG} \
> +    ${VIRTIO_USER_NETWORK_CFG} \
> +    -C bp.secureflashloader.fname=$(pwd)/binaries/bl1.bin \
> +    -C bp.flashloader0.fname=$(pwd)/binaries/fip.bin" |& \
> +        tee smoke.serial

Now the expectation is that on failure (such as timeout failure)
fvp-base-smoke-dom0-arm64.exp will exit non-zero and therefore this
script will also exit non-zero. pipefail is necessary otherwise tee will
mask the error. I like it.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +exit 0
> -- 
> 2.25.1
> 

