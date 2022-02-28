Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CA24C7023
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 15:55:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280631.478658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhR2-0004Eu-AP; Mon, 28 Feb 2022 14:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280631.478658; Mon, 28 Feb 2022 14:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhR2-0004Cm-68; Mon, 28 Feb 2022 14:55:36 +0000
Received: by outflank-mailman (input) for mailman id 280631;
 Mon, 28 Feb 2022 14:55:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=39Co=TL=citrix.com=prvs=0517876bc=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nOhR0-0003h4-IR
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 14:55:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79add183-98a6-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 15:55:33 +0100 (CET)
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
X-Inumbo-ID: 79add183-98a6-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646060133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IBS59SoJNJD3j28cACuM1zvcsGe3SA8U6CcyY4BYijg=;
  b=Ws0W3fo61IvIZjO4ZFh8Djkt2gXiCXR1uYmRE8v2KnxX0IPqZMLUASiF
   a8FypvxMpt9h3dWL/xxr2ubE2FuWXmMC8UwCMdnwkVqKqWfcY49imFfQr
   q9KAVl1pP+yvYiQwDWOukn9SGYUysjbzv0Nc/TBfDY3Vj4+8tG9PPBJQV
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65029385
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FU+Rx6q5tVsYRohNJKqenKCZIHxeBmIEZRIvgKrLsJaIsI4StFCzt
 garIBnTP6qIMWamKYpwOdvloEsPsZ6AytFqTwZlqno0FSMS95uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvX4
 4Oq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBY7TmtOMlVkFhQxpUDLMW5eHufF+2iJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIxMUyaMkYfZz/7DroltuGMryKhfgRAk2unrIUUwHCO01Buhe2F3N39JYXRGJQ9clyjj
 nnd423zDxUeNdqe4TmI6HShgqnIhyyTcIkbDrG/+9ZhiUefwWFVAxoTPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgEYc8pdFas98g7l90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt47wLxBoiLjNcCKm3IaK/S7sEHUyJFZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZovl2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQevBCxWtamS0bbtT838JrWnFF5mLJ9043d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa8SIW1CamNMoQWMvCdkTNrGgk0OCZ8OEi3zSARfVwXY
 8/HIa5A815AYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PxaopUM+GALWNIgRtfrcyC2Mq
 oo3H5bamn13DbylCgGKoNF7ELz/BSVibXwAg5cMLbDrz8sPMDxJNsI9Npt6I901x/kOz7yQl
 px/M2cBoGfCabT8AV3iQhhehHnHAf6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:6vNLG6nwA6h9q/7CATdUxUeaowrpDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7wr5OUtQ4OxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyXMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="65029385"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH 2/4] automation: add a templates for test jobs
Date: Mon, 28 Feb 2022 14:55:21 +0000
Message-ID: <20220228145523.8954-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228145523.8954-1-anthony.perard@citrix.com>
References: <20220228145523.8954-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Allow to set common configuration from a single place for all tests
jobs.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/gitlab-ci/test.yaml | 73 ++++++++--------------------------
 1 file changed, 17 insertions(+), 56 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 47e8704df3..7cf21b7493 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -1,7 +1,15 @@
-# Test jobs
-build-each-commit-gcc:
+.test-jobs-common:
   stage: test
   image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  except:
+    - master
+    - smoke
+    - /^coverity-tested\/.*/
+    - /^stable-.*/
+
+# Test jobs
+build-each-commit-gcc:
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
     XEN_TARGET_ARCH: x86_64
@@ -16,15 +24,9 @@ build-each-commit-gcc:
   dependencies: []
   tags:
     - x86_64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-alpine-arm64-gcc:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
@@ -41,15 +43,9 @@ qemu-alpine-arm64-gcc:
     when: always
   tags:
     - arm64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-alpine-x86_64-gcc:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
   script:
@@ -65,15 +61,9 @@ qemu-alpine-x86_64-gcc:
     when: always
   tags:
     - x86_64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-smoke-arm64-gcc:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
@@ -89,15 +79,9 @@ qemu-smoke-arm64-gcc:
     when: always
   tags:
     - arm64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-smoke-x86-64-gcc:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
   script:
@@ -111,15 +95,9 @@ qemu-smoke-x86-64-gcc:
     - debian-stretch-gcc-debug
   tags:
     - x86_64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-smoke-x86-64-clang:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
   script:
@@ -133,15 +111,9 @@ qemu-smoke-x86-64-clang:
     - debian-unstable-clang-debug
   tags:
     - x86_64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-smoke-x86-64-gcc-pvh:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
   script:
@@ -155,15 +127,9 @@ qemu-smoke-x86-64-gcc-pvh:
     - debian-stretch-gcc-debug
   tags:
     - x86_64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 qemu-smoke-x86-64-clang-pvh:
-  stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
   script:
@@ -177,8 +143,3 @@ qemu-smoke-x86-64-clang-pvh:
     - debian-unstable-clang-debug
   tags:
     - x86_64
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
-- 
Anthony PERARD


