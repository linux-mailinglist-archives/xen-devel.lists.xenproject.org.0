Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A614E195E
	for <lists+xen-devel@lfdr.de>; Sun, 20 Mar 2022 02:46:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292488.496785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVkeL-0005rI-JG; Sun, 20 Mar 2022 01:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292488.496785; Sun, 20 Mar 2022 01:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVkeL-0005or-Ft; Sun, 20 Mar 2022 01:46:29 +0000
Received: by outflank-mailman (input) for mailman id 292488;
 Sun, 20 Mar 2022 01:46:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u5H8=T7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nVkeK-0005ol-Qb
 for xen-devel@lists.xenproject.org; Sun, 20 Mar 2022 01:46:28 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8eca5b91-a7ef-11ec-8fbc-03012f2f19d4;
 Sun, 20 Mar 2022 02:46:27 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1FD9DB80D36;
 Sun, 20 Mar 2022 01:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4BBC340EC;
 Sun, 20 Mar 2022 01:46:25 +0000 (UTC)
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
X-Inumbo-ID: 8eca5b91-a7ef-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647740785;
	bh=RcWxTxoiMoKk7lqX23Y5u4Cjtf4MnY25Y+HWEvWEHpA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W5mVLkx08+3JWW8z6OwKWnLh3ZgR5+SXBhajKrWJunLSqMirymdDpawmT3MVp+qIY
	 +Lwxmv6UTLd7GOS5TaKit6JN6+IgRuzDz+jZCkdq6rKD4nmLgvsUVIhIVuGIUCsOMc
	 ejcUQYQjKBtdvOjchHEScjgXQO8B21+ytUCpllSE3sESGlQNtetaSybtOVJdkZt/tb
	 Ni1yVa/Wb64FsxvBJykbtjG08GwECUzTQsNjpMGkjTPlXV/bqO4mfa2pujxAFX73tL
	 Gmujx9uJIQz5O0OiM+5cIPp824VZJaN/u0FkIWp9xdwDlZsJ7uI0y1A+ok/WnP3QUi
	 bgDX+KPQ5qYMg==
Date: Sat, 19 Mar 2022 18:46:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: xen-devel@lists.xenproject.org, cardoe@cardoe.com, wl@xen.org, 
    andrew.cooper3@citrix.com, anthony.perard@citrix.com, 
    bertrand.marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
In-Reply-To: <20220319003221.3012314-2-sstabellini@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2203191842280.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203181729490.2910984@ubuntu-linux-20-04-desktop> <20220319003221.3012314-2-sstabellini@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Mar 2022, Stefano Stabellini wrote:
> Add a minimal ARM32 smoke test based on qemu-system-arm, as provided by
> the test-artifacts qemu container. The minimal test simply boots Xen
> (built from previous build stages) and Dom0. The test is fetching the
> Dom0 kernel and initrd from Debian Jessie: they work just fine and this
> way we don't have to maintain a build for them too.


Thanks to the Xen fix recently submitted
(https://marc.info/?l=xen-devel&m=164774063802402) I'll be able to
update this script to use Debian Bullseye. I am thinking of merging the
below directly with this patch.


---

automation: upgrade Debian to Bullseye for testing Xen aarch32

Also change initrd. As the new netboot initrd from Debian Bullseye is
huge (22MB), use a tiny initrd from Alpine Linux instead (only 2.5MB).

Also note that the huge Debian Bullseye initrd would cause QEMU to
crash due to the -device loader parameter.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
index 162922ace5..d554de7939 100755
--- a/automation/scripts/qemu-smoke-arm32.sh
+++ b/automation/scripts/qemu-smoke-arm32.sh
@@ -5,11 +5,20 @@ set -ex
 export DEBIAN_FRONTENT=noninteractive
 apt-get -qy update
 apt-get -qy install --no-install-recommends device-tree-compiler \
-                                            curl
+                                            curl \
+                                            cpio
 
 cd binaries
-curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/vmlinuz
-curl --fail --silent --show-error --location --output initrd.gz http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/initrd.gz
+# Use the kernel from Debian
+curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
+# Use a tiny initrd based on busybox from Alpine Linux
+curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
+
+mkdir rootfs
+cd rootfs
+tar xvzf ../initrd.tar.gz
+find . | cpio -H newc -o | gzip > ../initrd.gz
+cd ..
 
 kernel=`stat -L --printf="%s" vmlinuz`
 initrd=`stat -L --printf="%s" initrd.gz`
@@ -68,5 +77,5 @@ timeout -k 1 240 \
    -device loader,file=./initrd.gz,addr=0x3200000 |& tee smoke.serial
 
 set -e
-(grep -q "^BusyBox" smoke.serial) || exit 1
+(grep -q "^/ #" smoke.serial) || exit 1
 exit 0

