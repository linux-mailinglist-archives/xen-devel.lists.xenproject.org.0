Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F52779C7E
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 04:07:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582758.912697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUe1u-0002v1-LM; Sat, 12 Aug 2023 02:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582758.912697; Sat, 12 Aug 2023 02:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUe1u-0002sR-Gt; Sat, 12 Aug 2023 02:07:02 +0000
Received: by outflank-mailman (input) for mailman id 582758;
 Sat, 12 Aug 2023 02:07:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WvX7=D5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUe1s-0002HO-Kl
 for xen-devel@lists.xenproject.org; Sat, 12 Aug 2023 02:07:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea740d58-38b4-11ee-8613-37d641c3527e;
 Sat, 12 Aug 2023 04:06:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C25E64EB2;
 Sat, 12 Aug 2023 02:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0D4C433CA;
 Sat, 12 Aug 2023 02:06:55 +0000 (UTC)
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
X-Inumbo-ID: ea740d58-38b4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691806016;
	bh=CCQJr8YPRsIBmLk4v5yHXJHCKxH1mNXEgoMdUng+hAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i/213FIHImTBHOW8advmnFsCuX7O1gUszjqBIQSUgjdCrIZCN43Hvgx20baoaM4Ry
	 NIEFxAiYZvY7FHJsYj/vOD/T002TxZqhUSVGkITpAP19p4zdhvQj0OXbruDglxNv+u
	 tAaPf9XXyE1+RqMlmGilH/y4SsPy/J24okagaA+QiwXvarh4vYvbP8iI+Q5KkzCbIh
	 fIcHtw796fpiN3aVePYM9beocTCikNU1WtaV9txJBlJ5yoipHBXXRl8y2WY2YspLty
	 SYy1Tp1YkxrJh2mfM42dW4HbQjcPEgVSjojV0UW2fuuozUh0hwomAgTqJEflud2YD0
	 V4R6aXDslIRRw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH 3/3] automation: update jobs to use Debian Bookworm instead of unstable
Date: Fri, 11 Aug 2023 19:06:51 -0700
Message-Id: <20230812020651.11608-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2308111842430.6458@ubuntu-linux-20-04-desktopa>
References: <alpine.DEB.2.22.394.2308111842430.6458@ubuntu-linux-20-04-desktopa>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/gitlab-ci/build.yaml | 84 ++++++++++++++++-----------------
 automation/gitlab-ci/test.yaml  | 24 +++++-----
 2 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 173613567c..1a4a5e490d 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -360,53 +360,53 @@ debian-stretch-gcc-debug:
   variables:
     CONTAINER: debian:stretch
 
-debian-unstable-clang-debug:
+debian-bookworm-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: debian:unstable
+    CONTAINER: debian:bookworm
 
 # Arm32 cross-build
 
-debian-unstable-gcc-arm32:
+debian-bookworm-gcc-arm32:
   extends: .gcc-arm32-cross-build
   variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
+    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
 
-debian-unstable-gcc-arm32-debug:
+debian-bookworm-gcc-arm32-debug:
   extends: .gcc-arm32-cross-build-debug
   variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
+    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
 
-debian-unstable-gcc-arm32-randconfig:
+debian-bookworm-gcc-arm32-randconfig:
   extends: .gcc-arm32-cross-build
   variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
+    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
     RANDCONFIG: y
 
-debian-unstable-gcc-arm32-debug-randconfig:
+debian-bookworm-gcc-arm32-debug-randconfig:
   extends: .gcc-arm32-cross-build-debug
   variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
+    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
     RANDCONFIG: y
 
-debian-unstable-gcc-arm32-staticmem:
+debian-bookworm-gcc-arm32-staticmem:
   extends: .gcc-arm32-cross-build
   variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
+    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
     EXTRA_XEN_CONFIG: |
       CONFIG_EXPERT=y
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
 
-debian-unstable-gcc-arm32-debug-staticmem:
+debian-bookworm-gcc-arm32-debug-staticmem:
   extends: .gcc-arm32-cross-build-debug
   variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
+    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
     EXTRA_XEN_CONFIG: |
       CONFIG_EXPERT=y
@@ -415,26 +415,26 @@ debian-unstable-gcc-arm32-debug-staticmem:
 
 # Arm builds
 
-debian-unstable-gcc-arm64:
+debian-bookworm-gcc-arm64:
   extends: .gcc-arm64-build
   variables:
-    CONTAINER: debian:unstable-arm64v8
+    CONTAINER: debian:bookworm-arm64v8
 
-debian-unstable-gcc-debug-arm64:
+debian-bookworm-gcc-debug-arm64:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: debian:unstable-arm64v8
+    CONTAINER: debian:bookworm-arm64v8
 
-debian-unstable-gcc-arm64-randconfig:
+debian-bookworm-gcc-arm64-randconfig:
   extends: .gcc-arm64-build
   variables:
-    CONTAINER: debian:unstable-arm64v8
+    CONTAINER: debian:bookworm-arm64v8
     RANDCONFIG: y
 
-debian-unstable-gcc-debug-arm64-randconfig:
+debian-bookworm-gcc-debug-arm64-randconfig:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: debian:unstable-arm64v8
+    CONTAINER: debian:bookworm-arm64v8
     RANDCONFIG: y
 
 alpine-3.18-gcc-arm64:
@@ -597,26 +597,26 @@ yocto-qemux86-64:
 
 # Cppcheck analysis jobs
 
-debian-unstable-gcc-cppcheck:
+debian-bookworm-gcc-cppcheck:
   extends: .gcc-x86-64-cross-build
   variables:
-    CONTAINER: debian:unstable-cppcheck
+    CONTAINER: debian:bookworm-cppcheck
     CROSS_COMPILE: /usr/bin/x86_64-linux-gnu-
     CPPCHECK: y
     HYPERVISOR_ONLY: y
 
-debian-unstable-gcc-arm32-cppcheck:
+debian-bookworm-gcc-arm32-cppcheck:
   extends: .gcc-arm32-cross-build
   variables:
-    CONTAINER: debian:unstable-cppcheck
+    CONTAINER: debian:bookworm-cppcheck
     CROSS_COMPILE: /usr/bin/arm-linux-gnueabihf-
     CPPCHECK: y
     HYPERVISOR_ONLY: y
 
-debian-unstable-gcc-arm64-cppcheck:
+debian-bookworm-gcc-arm64-cppcheck:
   extends: .gcc-arm64-build
   variables:
-    CONTAINER: debian:unstable-cppcheck
+    CONTAINER: debian:bookworm-cppcheck
     CPPCHECK: y
     HYPERVISOR_ONLY: y
 
@@ -685,42 +685,42 @@ debian-buster-gcc-ibt:
     EXTRA_FIXED_RANDCONFIG: |
       CONFIG_XEN_IBT=y
 
-debian-unstable-clang:
+debian-bookworm-clang:
   extends: .clang-x86-64-build
   variables:
-    CONTAINER: debian:unstable
+    CONTAINER: debian:bookworm
 
-debian-unstable-gcc:
+debian-bookworm-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: debian:unstable
+    CONTAINER: debian:bookworm
 
-debian-unstable-gcc-debug:
+debian-bookworm-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: debian:unstable
+    CONTAINER: debian:bookworm
 
-debian-unstable-gcc-randconfig:
+debian-bookworm-gcc-randconfig:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: debian:unstable
+    CONTAINER: debian:bookworm
     RANDCONFIG: y
 
-debian-unstable-gcc-debug-randconfig:
+debian-bookworm-gcc-debug-randconfig:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: debian:unstable
+    CONTAINER: debian:bookworm
     RANDCONFIG: y
 
-debian-unstable-32-clang-debug:
+debian-bookworm-32-clang-debug:
   extends: .clang-x86-32-build-debug
   variables:
-    CONTAINER: debian:unstable-i386
+    CONTAINER: debian:bookworm-i386
 
-debian-unstable-32-gcc-debug:
+debian-bookworm-32-gcc-debug:
   extends: .gcc-x86-32-build-debug
   variables:
-    CONTAINER: debian:unstable-i386
+    CONTAINER: debian:bookworm-i386
 
 fedora-gcc:
   extends: .gcc-x86-64-build
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 8ccce1fe26..810631bc46 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -22,7 +22,7 @@
 .qemu-arm64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:unstable-arm64v8
+    CONTAINER: debian:bookworm-arm64v8
     LOGFILE: qemu-smoke-arm64.log
   artifacts:
     paths:
@@ -35,7 +35,7 @@
 .qemu-arm32:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:unstable-arm64v8
+    CONTAINER: debian:bookworm-arm64v8
     LOGFILE: qemu-smoke-arm32.log
   artifacts:
     paths:
@@ -357,7 +357,7 @@ qemu-smoke-dom0less-arm32-gcc:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-unstable-gcc-arm32
+    - debian-bookworm-gcc-arm32
 
 qemu-smoke-dom0less-arm32-gcc-debug:
   extends: .qemu-arm32
@@ -365,7 +365,7 @@ qemu-smoke-dom0less-arm32-gcc-debug:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-unstable-gcc-arm32-debug
+    - debian-bookworm-gcc-arm32-debug
 
 qemu-smoke-dom0less-arm32-gcc-staticmem:
   extends: .qemu-arm32
@@ -373,7 +373,7 @@ qemu-smoke-dom0less-arm32-gcc-staticmem:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-unstable-gcc-arm32-staticmem
+    - debian-bookworm-gcc-arm32-staticmem
 
 qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
   extends: .qemu-arm32
@@ -381,7 +381,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-unstable-gcc-arm32-debug-staticmem
+    - debian-bookworm-gcc-arm32-debug-staticmem
 
 qemu-smoke-dom0less-arm32-gcc-gzip:
   extends: .qemu-arm32
@@ -389,7 +389,7 @@ qemu-smoke-dom0less-arm32-gcc-gzip:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-unstable-gcc-arm32
+    - debian-bookworm-gcc-arm32
 
 qemu-smoke-dom0less-arm32-gcc-debug-gzip:
   extends: .qemu-arm32
@@ -397,7 +397,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-gzip:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-unstable-gcc-arm32-debug
+    - debian-bookworm-gcc-arm32-debug
 
 qemu-smoke-dom0less-arm32-gcc-without-dom0:
   extends: .qemu-arm32
@@ -405,7 +405,7 @@ qemu-smoke-dom0less-arm32-gcc-without-dom0:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-unstable-gcc-arm32
+    - debian-bookworm-gcc-arm32
 
 qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
   extends: .qemu-arm32
@@ -413,7 +413,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-unstable-gcc-arm32-debug
+    - debian-bookworm-gcc-arm32-debug
 
 qemu-alpine-x86_64-gcc:
   extends: .qemu-x86-64
@@ -435,7 +435,7 @@ qemu-smoke-x86-64-clang:
   script:
     - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-unstable-clang-debug
+    - debian-bookworm-clang-debug
 
 qemu-smoke-x86-64-gcc-pvh:
   extends: .qemu-x86-64
@@ -449,7 +449,7 @@ qemu-smoke-x86-64-clang-pvh:
   script:
     - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-unstable-clang-debug
+    - debian-bookworm-clang-debug
 
 qemu-smoke-riscv64-gcc:
   extends: .qemu-riscv64
-- 
2.25.1


