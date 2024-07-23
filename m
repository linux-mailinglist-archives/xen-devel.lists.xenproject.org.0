Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E6C93A97C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 00:52:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763638.1173923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWOLx-0007xI-L5; Tue, 23 Jul 2024 22:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763638.1173923; Tue, 23 Jul 2024 22:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWOLx-0007v4-IT; Tue, 23 Jul 2024 22:51:29 +0000
Received: by outflank-mailman (input) for mailman id 763638;
 Tue, 23 Jul 2024 22:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFMf=OX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sWOLw-0007uy-Kk
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 22:51:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16f07b9e-4946-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 00:51:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B5ACD60DC1;
 Tue, 23 Jul 2024 22:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD02C4AF09;
 Tue, 23 Jul 2024 22:51:23 +0000 (UTC)
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
X-Inumbo-ID: 16f07b9e-4946-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721775084;
	bh=79lelki9y6INjvFUC1gK88W+Ae7ArPN7+Eh8+zUIrQQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LajGhIHufYdHqr5eH+DktHkYqre3PioDUxQpiqUSKaQBcsHDrWXYH6HKsd5aZ2T/m
	 2DL8lelpd6DLQofU5Zo+oaJwrJ/89wzGNEZcrMcN9JlxHSQJpS8eqYgCGgIuu6rgmz
	 BrhQbaRTRZw972MPlD9BZ2VcoBFFrU9G36yaSBY3yL3dP6fy3aBQsntyciYP7m/E6j
	 xH7oJXUanfQZg16StjZJe5TPbaTrLuH0LaZIgsZ3RkWqWnXCmlO0hsdmTOftxNXs/u
	 q/dbXIcjoN8M0QdAhWJ4/d8INfX/d/XpAKglFPSs+ze/L32qsCoPrRa3nVq5ehJ621
	 TpDNKCpLdb/4g==
Date: Tue, 23 Jul 2024 15:51:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CI: workaround broken selinux+docker interaction in
 yocto
In-Reply-To: <20240720001508.1673856-1-marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2407231548230.4857@ubuntu-linux-20-04-desktop>
References: <20240720001508.1673856-1-marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-77462335-1721775084=:4857"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-77462335-1721775084=:4857
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 20 Jul 2024, Marek Marczykowski-Górecki wrote:

> `cp --preserve=xattr` doesn't work in docker when SELinux is enabled. It
> tries to set the "security.selinux" xattr, but SELinux (or overlay fs?)
> denies it.
> Workaround it by skipping selinux.selinux xattr copying.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Tested here:
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/7386198058
> 
> But since yocto container fails to build, it isn't exactly easy to apply
> this patch...
> "kirkstone" branch of meta-virtualization seems to target Xen 4.15 and
> 4.16, so it isn't exactly surprising it fails to build with 4.19.
> 
> I tried also bumping yocto version to scarthgap (which supposedly should
> have updated pygrub patch), but that fails to build for me too, with a
> different error:
> 
>     ERROR: Layer 'filesystems-layer' depends on layer 'networking-layer', but this layer is not enabled in your configuration
>     ERROR: Parse failure with the specified layer added, exiting.
>     ...
>     ERROR: Nothing PROVIDES 'xen-image-minimal'. Close matches:
>       core-image-minimal
>       core-image-minimal-dev
>     Parsing of 2472 .bb files complete (0 cached, 2472 parsed). 4309 targets, 101 skipped, 0 masked, 0 errors.

This patch should upgrade succesfully to scarthgap, can you give it a
try? I could rebuild succefully the container, including a successful
Yocto build, but I did not push the container to the Hub yet. I only
tried x86, I haven't tried ARM yet.

---
automation: upgrade Yocto to scarthgap

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
index 93ce81ce82..06efcce6ca 100755
--- a/automation/build/yocto/build-yocto.sh
+++ b/automation/build/yocto/build-yocto.sh
@@ -38,8 +38,9 @@ build_result=0
 # layers to include in the project
 build_layerlist="poky/meta poky/meta-poky poky/meta-yocto-bsp \
                  meta-openembedded/meta-oe meta-openembedded/meta-python \
+                 meta-openembedded/meta-networking \
                  meta-openembedded/meta-filesystems \
-                 meta-openembedded/meta-networking meta-virtualization"
+                 meta-virtualization"
 
 # yocto image to build
 build_image="xen-image-minimal"
diff --git a/automation/build/yocto/yocto.inc b/automation/build/yocto/yocto.inc
index 2f3b1a5b2a..209df7dde9 100644
--- a/automation/build/yocto/yocto.inc
+++ b/automation/build/yocto/yocto.inc
@@ -6,10 +6,10 @@
 # YOCTOVERSION-TARGET for x86_64 hosts
 # YOCTOVERSION-TARGET-arm64v8 for arm64 hosts
 # For example you can build an arm64 container with the following command:
-# make yocto/kirkstone-qemuarm64-arm64v8
+# make yocto/scarthgap-qemuarm64-arm64v8
 
 # Yocto versions we are currently using.
-YOCTO_VERSION = kirkstone
+YOCTO_VERSION = scarthgap
 
 # Yocto BSPs we want to build for.
 YOCTO_TARGETS = qemuarm64 qemuarm qemux86-64
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 7ce88d38e7..32045cef0c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -212,7 +212,7 @@
   script:
     - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD} ${YOCTO_OUTPUT}
   variables:
-    YOCTO_VERSION: kirkstone
+    YOCTO_VERSION: scarthgap
     CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}${YOCTO_HOST}
   artifacts:
     paths:
--8323329-77462335-1721775084=:4857--

