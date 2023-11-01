Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE5B7DE8DC
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 00:29:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626668.977120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyKeI-0002Ud-ID; Wed, 01 Nov 2023 23:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626668.977120; Wed, 01 Nov 2023 23:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyKeI-0002S6-FB; Wed, 01 Nov 2023 23:29:22 +0000
Received: by outflank-mailman (input) for mailman id 626668;
 Wed, 01 Nov 2023 23:29:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+92=GO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qyKeH-0002S0-6J
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 23:29:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a7f504d-790e-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 00:29:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 05DCB61233;
 Wed,  1 Nov 2023 23:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13098C433CB;
 Wed,  1 Nov 2023 23:29:16 +0000 (UTC)
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
X-Inumbo-ID: 7a7f504d-790e-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698881357;
	bh=jLP55AhZNUPirGPSeE/kbsSZXw7glcsOCUFgNe7H0Dc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s4nuXyzz0mHd1h6FNyy7lzJfc/MClrUAy6JjElFpb+xYeGO5x6Bo9PPrWvKX3xz4q
	 kLlaE4Cw2a5LTz3+/N35ov1nYC/+ElT6tlFKdm9efPNif+iyF8qzTxqvouiq19/abu
	 TWmw8mb0AYp4nqzpfFo/TUOXBB4B9IvuakVShjYovtjnNQ70YXwpQ4jGInM7tMUARD
	 NSx+wHoQPC1BcVfcPZUzr7CyZO4bdVLPmYk6801oNX3ey9dNCKK0I9Wcij9OvIV3Q2
	 B1xfCYXqchX8fLUwHPKwwOtTgo/P2suASlOnLi7mx/nUDA+MDBKvJXchhq2hAVcYHi
	 F/1kMPlvvYI6w==
Date: Wed, 1 Nov 2023 16:29:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mario Marietto <marietto2008@gmail.com>
cc: viryaos-discuss@lists.sourceforge.net, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org
Subject: Re: Imagebuilder can't compute correctly the memory addresses of
 our images
In-Reply-To: <CA+1FSig5MXNme=+3Z-nK3BGtxAuRLSk8U0w9RkfHj3nn8AAXAg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2311011614100.2125691@ubuntu-linux-20-04-desktop>
References: <CA+1FSig5MXNme=+3Z-nK3BGtxAuRLSk8U0w9RkfHj3nn8AAXAg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-654589276-1698880451=:2125691"
Content-ID: <alpine.DEB.2.22.394.2311011614130.2125691@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-654589276-1698880451=:2125691
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311011614131.2125691@ubuntu-linux-20-04-desktop>

Hi Mario,

Replies inline below


On Wed, 1 Nov 2023, Mario Marietto wrote:
> Hello to everyone.
> 
> We are a team of linux enthusiasts who are trying to boot Xen on a Samsung XE303C12 Chromebook aka "snow" , following the suggestions in
> the slide show presentation here:
> 
> https://www.slideshare.net/xen_com_mgr/xpds16-porting-xen-on-arm-to-a-new-soc-julien-grall-arm
> 
> This device uses an exynos5250 SOC dual core 1.7 GHz with 2 MB RAM, it is
> a Samsung armv7 chip with virtualization extensions.
> 
> In particular, we have it working fairly well both on the bare metal with
> a recent 6.1.59 Linux LTS kernel and also with a recent 5.4.257 LTS
> kernel with KVM, the older LTS kernel version is used to test KVM because
> support for KVM on arm v7 was removed from Linux around kernel version
> 5.7. So we know we have the hypervisor mode enabled because we were able
> to use it with KVM.
> 
> For Xen, we are using the latest Debian build of Xen 4.17 for the Debian
> armhf architecture:
> 
> (XEN) Xen version 4.17.2-pre (Debian 4.17.1+2-gb773c48e36-1)
> (pkg-xen-devel@xxxxxxxxxxxxxxxxxxxxxxx) (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0) debug=n Thu May 18 19:26:30 UTC 2023
> 
> The Linux kernel is a custom build that adds the Xen config kernel
> options (CONFIG_XEN_DOM0, etc) on top of a kernel that works well on the
> same Chromebook model on the bare metal.
> 
> Our method of booting is to have u-boot boot the Xen hypervisor and load
> the device tree after adding the dom0 to the otherwise unaltered device
> tree from the Linux kernel using u-boot fdt commands to add a /chosen
> node, as described on the Xen wiki and in the pages linked from there. We
> have also tried adding and loading an initrd.img using the device tree
> /chosen node but that made no difference in our tests.
> 
> The workflow is the following :
> 
> a) let's create the file xen-config-6.1.59 :
> 
> MEMORY_START="0x0"
> MEMORY_END="0x80000000"
> LOAD_CMD="ext2load mmc 1:3"
> BOOT_CMD="bootm"
> DEVICE_TREE="exynos5250-snow-6.1.59-stb-xen-cbe+.dtb"
> XEN="xen-4.17-armhf"
> XEN_CMD="console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=2 bootscrub=0 vwfi=native sched=null"
> DOM0_KERNEL="zImage-6.1.59-xen-mixer-off"
> DOM0_CMD="console=tty earlycon=xen earlyprintk=xen root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
> UBOOT_SOURCE="xen.source"
> UBOOT_SCRIPT="xen.scr"
> 
> b) let's create gen-script.sh :
> 
> bash ./uboot-script-gen -c xen-config-6.1.59 -d .
> 
> c) let's run the script gen-script.sh :
> 
> # ./gen-script
> 
> Image Name:    
> Created:      Wed Nov  1 14:34:23 2023
> Image Type:   ARM Linux Kernel Image (uncompressed)
> Data Size:    884744 Bytes = 864.01 KiB = 0.84 MiB
> Load Address: 01800000
> Entry Point:  01800000
> Generated uboot script xen.scr, to be loaded at address 0xC00000:
> ext2load mmc 1:3 0xC00000 xen.scr; source 0xC00000
 
This step is confusing: step b) should directly generate xen.scr. There
is no ./gen-script to run.

 
> d) let's give a look inside the file xen.scr because we need some memory address that it has generated :
> 
> 
> ext2load mmc 1:3 0x1800000 xen-4.17-armhf.ub
> ext2load mmc 1:3 0x1A00000 exynos5250-snow-6.1.59-stb-xen-cbe+.dtb

Here the Dom0 kernel is missing?


> fdt addr 0x1A00000
> fdt resize 1024
> fdt set /chosen \#address-cells <0x2>
> fdt set /chosen \#size-cells <0x2>
> fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=2 bootscrub=0 vwfi=native sched=null"
> fdt mknod /chosen dom0
> fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module" "multiboot,module"
> fdt set /chosen/dom0 reg <0x0 0xE00000 0x0 0x816110 >
> fdt set /chosen xen,dom0-bootargs "console=tty earlycon=xen earlyprintk=xen root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
> setenv fdt_high 0xffffffffffffffff
> bootm 0x1800000 - 0x1A00000
> 
> As you can see it has generated a lot of interesting memory addresses,but unfortunately they are all wrong,except for one,this :
> 
> 0x816110
> 
> This is well calculated.

What do you mean they are wrong? Which ones are wrong?

Imagebuilder will pick addresses 2MB aligned starting from a 2MB offset
from MEMORY_START.

So both 0x1800000 and 0x1A00000 should be good addresses because they
are in the MEMORY_START-MEMORY_END range.

There is one issue though: the dom0 kernel address 0xE00000 is not
present among the loading commands. 


> e) let's write this template,called "bootxen.source" :
> 
> mmc dev 1
> ext2load mmc 1:3 0x42000000 zImage-6.1.59-xen-mixer-off
> ext2load mmc 1:3 0x51000000 xen-4.17-armhf-armmp-0x51004000.ub
> ext2load mmc 1:3 0x5ffec000 exynos5250-snow-6.1.59-stb-xen-cbe+.dtb
> fdt addr 0x5ffec000
> fdt resize 1024
> fdt set /chosen \#address-cells <0x2>
> fdt set /chosen \#size-cells <0x2>
> fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=2 bootscrub=0 vwfi=native sched=null"
> fdt mknod /chosen dom0
> fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module" "multiboot,module"
> fdt set /chosen/dom0 reg <0x0 0x42000000 0x0 0x816110 >
> fdt set /chosen xen,dom0-bootargs "console=tty1 root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused --no-log"
> bootm 0x51000000 - 0x5ffec000
> 
> As you can see,we can use only one value generated by your script : 0x816110
> The other values have been generated manually by us,not by your script,
> because the values that it produces are wrong.

If you explain why they are wrong, we can find a way to fix them. As
mentioned, they are just 2MB aligned address started at an offset from
MEMORY_START. Is it possible that you need to configure MEMORY_START and
MEMORY_END properly for your device?

For instance you should be able to get ImageBuilder to generate
addresses similar to the ones you chose if you use:

MEMORY_START="0x41e00000"
MEMORY_END="0x60000000"



> f) let's create the script to-scr.sh :
> 
> mkimage -A arm -T script -C none -a 0x50000000 -e 0x50000000 -d bootxen.source bootxen.scr
> 
> g) type these commands to boot Xen and Linux 6.1.59 as dom0 :
> 
> SMDK5250 # mmc dev 1
> SMDK5250 # ext2load mmc 1:3 0x50000000 bootxen.scr; source 0x50000000
> 
> We would like that your script was able to generate every value correctly.
> Is this possible ? Why does it,instead,fail in most cases ?

Sure it should be possible.
--8323329-654589276-1698880451=:2125691--

