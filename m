Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00044377A3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 15:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215074.374036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mduCj-0002F9-CP; Fri, 22 Oct 2021 13:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215074.374036; Fri, 22 Oct 2021 13:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mduCj-0002DD-8q; Fri, 22 Oct 2021 13:03:25 +0000
Received: by outflank-mailman (input) for mailman id 215074;
 Fri, 22 Oct 2021 13:03:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VW94=PK=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mduCh-0002D5-NR
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 13:03:23 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f09a1fa-3338-11ec-83bb-12813bfff9fa;
 Fri, 22 Oct 2021 13:03:22 +0000 (UTC)
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
X-Inumbo-ID: 6f09a1fa-3338-11ec-83bb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634907801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5LzHuJwEVZ+m+pg82cbcA7Xwz9U17b7FbC2bivN423Q=;
  b=LPc3TVaMpHMoEYK/X5uhh6Jrw6jqh7Ob8E1PHGDhK0FlRsLw/n9fvlOr
   XboOhLBmxl6oUNrfoGbIkKEs2XwfnbkZvOhOv0KsmHLnZ1rSJRLC7qfrg
   kNgrzv3SeJfDoszFXrUz1BUbgSQN+i2Rd00TrOMibI3KoCjxXKGLgCqn3
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Pvq6OVMItqwLNyTDaSTXVj2Ozhv6EQTBgd9EIPlld/79sjVrpe+OqxWPtZjyDXWL9Yog86sWL8
 OLx6eUbGCzedRCzjvrdg9G8CFvnH0sCVvjemhINAXppDHnujObw1/i62m7mcTWVzlaCd+7pLWw
 cjFhyI+Zy780IcUrEV1CDQjxMMtr+SY42Gz0NmHX/K+aaF4lMzcTC3MvDnEc5LFpOEGpqzSjPj
 H4G7gipnnhDx5WzT9xBFBtetIOMb9msQ3b1jcnLSOp98auy/jyY0JzAqvYIPLG6MqsP26cs6pu
 qeKlu4lSe9r58WuUUWn7TU7s
X-SBRS: 5.1
X-MesageID: 56218610
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cFCs065bb33ob6W06nFlTgxRtKrAchMFZxGqfqrLsTDasY5as4F+v
 mRJXjuOO6mDazekeNggao3i8hkP6MLXzINnGQNtqSpnHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdh2NQw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 +h3t5KrRAUTP4LAwO8YCh5WFxhgIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gTQ6yHN
 5RAMVKDajzcfzl1N10aMasds7inmSPffgdGrF288P9fD2/7k1UqjemF3MDuUteDX8lSk26Tr
 3jK+Gm/CRYfXPSAzRKV/3TqgfXA9QvgRI8cHbu/sOV2iVeewmgSDhw+RVq/oP+pzEW5Xrp3M
 FcI8yAjqawz8k2DTdTnWRC85nmesXY0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neIgNHBFTFpqKeSS3+W6vGTtzzaBMQOBTZcP2leF1JDuoS95tFo5v7Scjp9OLWItN/7Ajzy+
 TGloHA1guwUg8oyybruqDgrnAmQjpTOSwc04CDeUWSk8h51aeaZWmC41bTIxa0fdNjBHzFtq
 FBBwpLEtLlfUvlhgQTUGL1VdIxF8cppJ9E1bbRHJJIm6yi2s0CqeYRd8VmSz284b55aJ1cFj
 KLV0D69BaO/3lP2MsebgKrrUqzGKJQM8/y/Cpg4ifIVOvBMmPevpn0GWKJp9zmFfLIQua8+I
 4yHVs2nEGwXD69qpBLvGbxBgeNymXBmnj6CLXwe8/hB+eDCDJJyYexdWGZik8hjtP/UyOkr2
 4Y32zS2J+V3D7SlP3i/HX87JlEWN3krba0aWOQMHtNv1jFOQTl7Y9eImOtJU9U8w8x9y7eZl
 lngCxQw4Aeu2hX6xfCiNykLhEXHBs0k8xrW/EUEYD6V5pTUSd/+tflFL8JqJeVPGS4K5accc
 sTpsv6oWpxnIgkrMRxHBXUkhIA9JhmtmyyUOC+pPGo2c5J6HlSb8d74ZAr/siIJC3Pv58c5p
 rSh0CLdQIYCGFs+XJqHNqr3wgPjp2UZlcJzQ1DMfotZdnLz/dU4MCf2lPI2fZ0BcE2R2juA2
 g+KKh4Evu2R8ZQt+dzEiPnc/YekGudzBGRAGGzf4erkPCXW5DP7k4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9nvonhvb5XyAhgDU7nVVXzB+MyOGSC0OlOqrZJmu1TtzypV
 x/d4dJdI7iIZp/oSQZDOAo/Y+2f/vgIgT2Ov+8tKUD36SIrrrqKVUJeY0uFhCBHdeYnNYokx
 aEqudIM6hz5gR0va47UgidR/mWKD3oBT6R46c1KXN610lImmgNYfJjRKi7q+5XeOdxDP34jL
 iKQmKef1a9XwVDPciZrGHXAtQaHaU/iZPyeIIc+Gmm0
IronPort-HdrOrdr: A9a23:6wCOj61emC3zw85DTrgP2gqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="56218610"
Date: Fri, 22 Oct 2021 14:03:17 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>,
	<cardoe@cardoe.com>, <wl@xen.org>, <andrew.cooper3@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 3/3] automation: add a QEMU based x86_64 Dom0/DomU test
Message-ID: <YXK2lTWZHiTXIBtJ@perard>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
 <20211021230839.10794-3-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211021230839.10794-3-sstabellini@kernel.org>

On Thu, Oct 21, 2021 at 04:08:39PM -0700, Stefano Stabellini wrote:
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> new file mode 100644
> index 0000000000..41b05210d6
> --- /dev/null
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -0,0 +1,92 @@
> +#!/bin/bash
> +
> +set -ex
> +
> +apt-get -qy update
> +apt-get -qy install --no-install-recommends qemu-system-x86 \
> +                                            cpio \
> +                                            curl \
> +                                            busybox-static

Please, don't install packages during the CI job. If you need new
packages, update the container.

That said, "curl" doesn't seems to be needed.

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

This isn't confusing at all, depending on the tool used to make an
archive, the resulting initrd has a different purpose :-).
    initrd.tar.gz -> dom0
    initrd.cpio.gz -> domU

> +cd ..

Maybe add a comment here saying that we are now preparing dom0 root
filesystem? (as there is one for domu)

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
> +cp ../bzImage ./root
> +echo "name=\"test\"
> +memory=512
> +vcpus=1
> +kernel=\"/root/bzImage\"
> +ramdisk=\"/root/initrd.cpio.gz\"
> +extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
> +" > root/test.cfg
> +echo "#!/bin/bash
> +

Maybe add `set -x` ?

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
> +cat >> binaries/pxelinux.0 <<- EOF

So, I've look at <<- meaning as I never used that before and it seems to
remove all leading tab chr from the input, yet they are no tab in the
input. So maybe use just <<EOF instead, without the dash -.

> +#!ipxe
> +
> +kernel xen console=com1
> +module bzImage console=hvc0
> +module xen-rootfs.cpio.gz
> +boot
> +EOF

Thanks,

-- 
Anthony PERARD

