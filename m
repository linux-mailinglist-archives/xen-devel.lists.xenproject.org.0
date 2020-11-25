Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AB42C3818
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 05:28:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37166.69443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPg-0001be-A0; Wed, 25 Nov 2020 04:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37166.69443; Wed, 25 Nov 2020 04:28:16 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPg-0001ar-1Y; Wed, 25 Nov 2020 04:28:16 +0000
Received: by outflank-mailman (input) for mailman id 37166;
 Wed, 25 Nov 2020 04:28:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khmPe-0000sM-0b
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:28:14 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cbb3747-beb1-43fc-882f-745bfb556278;
 Wed, 25 Nov 2020 04:27:51 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89EB621D1A;
 Wed, 25 Nov 2020 04:27:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khmPe-0000sM-0b
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:28:14 +0000
X-Inumbo-ID: 9cbb3747-beb1-43fc-882f-745bfb556278
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9cbb3747-beb1-43fc-882f-745bfb556278;
	Wed, 25 Nov 2020 04:27:51 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 89EB621D1A;
	Wed, 25 Nov 2020 04:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606278470;
	bh=QJUK/kTkebPG1QQfKh+8CPie3i+NnzX9DzdIZukokQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zdoi+xosVFK49d9uPE/T101CrMyOcvfwEy1p1imwULd4fLpROFxSNjG7/5UEsNz5S
	 qtqLk2FrNBsp/WP/nRTV/HWYvEBw/La1Q13Pb9BOHuHmZsekCfiAwCUfacQwG8dnGG
	 njqbBPbrBhb58qgKWR0qeSMAr8QEHeGE+V0wTdko=
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 08/12] automation: add tests artifacts
Date: Tue, 24 Nov 2020 20:27:41 -0800
Message-Id: <20201125042745.31986-8-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>

Some tests (soon to come) will require pre-built binaries to run, such
as the Linux kernel binary. We don't want to rebuild the Linux kernel
for each gitlab-ci run: these builds should not be added to the current
list of build jobs.

Instead, create additional containers that today are built and uploaded
manually, but could be re-built automatically. The containers build the
required binarires during the "docker build" step and store them inside
the container itself.

gitlab-ci will be able to fetch these pre-built binaries during the
regular test runs, saving cycles.

Add two tests artifacts containers:
- one to build the Linux kernel ARM64
- one to create an Alpine Linux ARM64 rootfs for Dom0

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/tests-artifacts/Makefile           | 19 ++++++
 .../alpine/3.12-arm64v8.dockerfile            | 67 +++++++++++++++++++
 .../kernel/5.9.9-arm64v8.dockerfile           | 34 ++++++++++
 3 files changed, 120 insertions(+)
 create mode 100644 automation/tests-artifacts/Makefile
 create mode 100644 automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
 create mode 100644 automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile

diff --git a/automation/tests-artifacts/Makefile b/automation/tests-artifacts/Makefile
new file mode 100644
index 0000000000..8ca71b78ad
--- /dev/null
+++ b/automation/tests-artifacts/Makefile
@@ -0,0 +1,19 @@
+
+# the base of where these containers will appear
+REGISTRY := registry.gitlab.com/xen-project/xen/tests-artifacts
+CONTAINERS = $(subst .dockerfile,,$(wildcard */*.dockerfile))
+
+help:
+	@echo "Containers to build and export tests artifacts."
+	@echo "To build one run 'make ARTIFACT/VERSION'. Available containers:"
+	@$(foreach file,$(sort $(CONTAINERS)),echo ${file};)
+	@echo "To push container builds, set the env var PUSH"
+
+%: %.dockerfile ## Builds containers
+	docker build -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
+	@if [ ! -z $${PUSH+x} ]; then \
+		docker push $(REGISTRY)/$(@D):$(@F); \
+	fi
+
+.PHONY: all
+all: $(CONTAINERS)
diff --git a/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile b/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
new file mode 100644
index 0000000000..9457009452
--- /dev/null
+++ b/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
@@ -0,0 +1,67 @@
+FROM arm64v8/alpine:3.12
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+RUN \
+  # apk
+  apk update && \
+  \
+  # xen runtime deps
+  apk add musl && \
+  apk add openrc && \
+  apk add busybox && \
+  apk add sudo && \
+  apk add dbus && \
+  apk add bash && \
+  apk add python2 && \
+  apk add gettext && \
+  apk add zlib && \
+  apk add ncurses && \
+  apk add texinfo && \
+  apk add yajl && \
+  apk add libaio && \
+  apk add xz-dev && \
+  apk add util-linux && \
+  apk add argp-standalone && \
+  apk add libfdt && \
+  apk add glib && \
+  apk add pixman && \
+  apk add curl && \
+  apk add udev && \
+  \
+  # Xen
+  cd / && \
+  # Minimal ramdisk environment in case of cpio output
+  rc-update add udev && \
+  rc-update add udev-trigger && \
+  rc-update add udev-settle && \
+  rc-update add networking sysinit && \
+  rc-update add loopback sysinit && \
+  rc-update add bootmisc boot && \
+  rc-update add devfs sysinit && \
+  rc-update add dmesg sysinit && \
+  rc-update add hostname boot && \
+  rc-update add hwclock boot && \
+  rc-update add hwdrivers sysinit && \
+  rc-update add killprocs shutdown && \
+  rc-update add modloop sysinit && \
+  rc-update add modules boot && \
+  rc-update add mount-ro shutdown && \
+  rc-update add savecache shutdown && \
+  rc-update add sysctl boot && \
+  rc-update add local default && \
+  cp -a /sbin/init /init && \
+  echo "ttyS0" >> /etc/securetty && \
+  echo "hvc0" >> /etc/securetty && \
+  echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab && \
+  echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab && \
+  passwd -d "root" root && \
+  \
+  # Create rootfs
+  cd / && \
+  tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin usr var
diff --git a/automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile b/automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile
new file mode 100644
index 0000000000..053d65a345
--- /dev/null
+++ b/automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile
@@ -0,0 +1,34 @@
+FROM arm64v8/debian:unstable
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV LINUX_VERSION=5.9.9
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# build depends
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        build-essential \
+        libssl-dev \
+        bc \
+        curl \
+        flex \
+        bison \
+        && \
+    \
+    # Build the kernel
+    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
+    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
+    cd linux-"$LINUX_VERSION" && \
+    make defconfig && \
+    make -j$(nproc) Image.gz && \
+    cp arch/arm64/boot/Image / && \
+    cd /build && \
+    rm -rf linux-"$LINUX_VERSION"* && \
+    apt-get autoremove -y && \
+    apt-get clean && \
+    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-- 
2.17.1


