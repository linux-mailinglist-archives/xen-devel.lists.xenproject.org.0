Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0E36A8829
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 18:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505295.777981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7j-00088a-61; Thu, 02 Mar 2023 17:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505295.777981; Thu, 02 Mar 2023 17:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7j-00087A-1e; Thu, 02 Mar 2023 17:53:47 +0000
Received: by outflank-mailman (input) for mailman id 505295;
 Thu, 02 Mar 2023 17:53:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPDg=62=citrix.com=prvs=418368d91=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pXn7h-00086w-U2
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 17:53:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b28ad90-b923-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 18:53:44 +0100 (CET)
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
X-Inumbo-ID: 2b28ad90-b923-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677779623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OVGnKG3JiMHkA56VmC4hYY6bkN1hel348yFwdhLu2p8=;
  b=CrFzlC+E5QRpy9lNI5ScRNr8Wbmt+Wm+tSXRwPzecJNraHfKVxmy854U
   fvk8W9uakhEJPzrNFTeIdXjtYd6rNIr2tNHIJWlBbST+ejfD9g9u3Gt84
   QWVNJrHbmRF+M15SdJ2yM2heFzb77wantYwpvJ4msrNC6qJnTISSxGoI7
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98045171
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:todoSqzo/3xsOkYdLdZ6t+csxirEfRIJ4+MujC+fZmUNrF6WrkUCy
 mcaDGvXOveMZ2X0KYgkaIy/9E9T65PVztE2HQU5qSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPaoT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KV4N9
 qQGGixKVTaOrP+axZSbZPc3ott2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZQFxhrF/
 z2fl4j/KkAFCO2h7me4yFWpu7/ehyXxYKMiC5Tto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYXUsBcFOAS4wiXxq3ZpQ2eAwAsVSVdYdYrsMs3Qz0C1
 VKTmd7tQzt1v9WopWm1r+nO62noYG5McDFEPHVfJecY3zX9iL5wjUrRfMokK4i4pcDZHBfQ7
 S7RiDdr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5eJFcFg
 2eJ42u9AaO/21P7BZKbm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzzxdywPxvY
 c7CLZfE4ZMm5UNPlmfeegvg+eVzmnBWKZ37HvgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 483Cid+8D0GCLeWSnCOoeYuwaUicSBT6Wbe95YGKYZu42NORAkcNhMm6eh6J9c+xvwLz7agE
 7PUchYw9WcTTEbvcW2iAk2Popu2NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:mIajtqG8qOevVBnMpLqE/8eALOsnbusQ8zAXPiFKOH9om6mj/K
 qTdZsgpH3JYUkqKRQdcLy7VZVoIkm9yXcW2+cs1N6ZNWHbUQ2TQL2KhrGC/9SPIULDH+dmpM
 NdT5Q=
X-IronPort-AV: E=Sophos;i="5.98,228,1673931600"; 
   d="scan'208";a="98045171"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 2/7] automation: Introduce test-containers stage
Date: Thu, 2 Mar 2023 17:53:27 +0000
Message-ID: <20230302175332.56052-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230302175332.56052-1-anthony.perard@citrix.com>
References: <20230302175332.56052-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Jobs in the "test-containers" stage will be used to check that the
newly built container is working fine, and that it could be used in
production.

Need to rename jobs name compared to "build.yaml", adding "test-"
prefix to all build jobs.

Need also to rename templates as many of them are used with "extends"
which look for "jobs" and template across all the yaml files. Mostly
change "build" to "testbuild".

Introduce a job template per container, as we've got three
"variables", CONTAINER, BUILD_CONTAINER, and a job dependency.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    It is probably possible to share many of the templates with
    "build.yaml", by changing some of the templates and the way link between
    them.

 .gitlab-ci.yml                            |   2 +
 automation/gitlab-ci/test-containers.yaml | 239 ++++++++++++++++++++++
 2 files changed, 241 insertions(+)
 create mode 100644 automation/gitlab-ci/test-containers.yaml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c5d499b321..ed5383ab50 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -2,8 +2,10 @@ stages:
   - build
   - test
   - containers
+  - test-containers
 
 include:
   - 'automation/gitlab-ci/build.yaml'
   - 'automation/gitlab-ci/test.yaml'
   - 'automation/gitlab-ci/containers.yaml'
+  - 'automation/gitlab-ci/test-containers.yaml'
diff --git a/automation/gitlab-ci/test-containers.yaml b/automation/gitlab-ci/test-containers.yaml
new file mode 100644
index 0000000000..5dbf3902ff
--- /dev/null
+++ b/automation/gitlab-ci/test-containers.yaml
@@ -0,0 +1,239 @@
+.testbuild-tmpl: &testbuild
+  stage: test-containers
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}-test
+  script:
+    - ./automation/scripts/build 2>&1 | tee build.log
+  artifacts:
+    paths:
+      - binaries/
+      - xen-config
+      - '*.log'
+      - '*/*.log'
+    when: always
+  rules: !reference [.container-build-tmpl, rules]
+
+.gcc-tmpl:
+  variables: &gcc
+    CC: gcc
+    CXX: g++
+
+.clang-tmpl:
+  variables: &clang
+    CC: clang
+    CXX: clang++
+    clang: y
+
+.clang-8-tmpl:
+  variables: &clang-8
+    CC: clang-8
+    CXX: clang++-8
+    LD: ld.lld-8
+    clang: y
+
+.x86-64-testbuild-tmpl:
+  <<: *testbuild
+  variables:
+    XEN_TARGET_ARCH: x86_64
+  tags:
+    - x86_64
+
+.x86-64-testbuild:
+  extends: .x86-64-testbuild-tmpl
+  variables:
+    debug: n
+
+.x86-64-testbuild-debug:
+  extends: .x86-64-testbuild-tmpl
+  variables:
+    debug: y
+
+.x86-32-testbuild-tmpl:
+  <<: *testbuild
+  variables:
+    XEN_TARGET_ARCH: x86_32
+  tags:
+    - x86_32
+
+.x86-32-testbuild:
+  extends: .x86-32-testbuild-tmpl
+  variables:
+    debug: n
+
+.x86-32-testbuild-debug:
+  extends: .x86-32-testbuild-tmpl
+  variables:
+    debug: y
+
+.gcc-x86-64-testbuild:
+  extends: .x86-64-testbuild
+  variables:
+    <<: *gcc
+
+.gcc-x86-64-testbuild-debug:
+  extends: .x86-64-testbuild-debug
+  variables:
+    <<: *gcc
+
+.gcc-x86-32-testbuild:
+  extends: .x86-32-testbuild
+  variables:
+    <<: *gcc
+
+.gcc-x86-32-testbuild-debug:
+  extends: .x86-32-testbuild-debug
+  variables:
+    <<: *gcc
+
+.clang-x86-64-testbuild:
+  extends: .x86-64-testbuild
+  variables:
+    <<: *clang
+
+.clang-x86-64-testbuild-debug:
+  extends: .x86-64-testbuild-debug
+  variables:
+    <<: *clang
+
+.clang-8-x86-64-testbuild:
+  extends: .x86-64-testbuild
+  variables:
+    <<: *clang-8
+
+.clang-8-x86-64-testbuild-debug:
+  extends: .x86-64-testbuild-debug
+  variables:
+    <<: *clang-8
+
+.clang-x86-32-testbuild:
+  extends: .x86-32-testbuild
+  variables:
+    <<: *clang
+
+.clang-x86-32-testbuild-debug:
+  extends: .x86-32-testbuild-debug
+  variables:
+    <<: *clang
+
+.arm32-cross-testbuild-tmpl:
+  <<: *testbuild
+  variables:
+    XEN_TARGET_ARCH: arm32
+  tags:
+    - x86_64
+
+.arm32-cross-testbuild:
+  extends: .arm32-cross-testbuild-tmpl
+  variables:
+    debug: n
+
+.arm32-cross-testbuild-debug:
+  extends: .arm32-cross-testbuild-tmpl
+  variables:
+    debug: y
+
+.gcc-arm32-cross-testbuild:
+  extends: .arm32-cross-testbuild
+  variables:
+    <<: *gcc
+
+.gcc-arm32-cross-testbuild-debug:
+  extends: .arm32-cross-testbuild-debug
+  variables:
+    <<: *gcc
+
+.arm64-testbuild-tmpl:
+  <<: *testbuild
+  variables:
+    XEN_TARGET_ARCH: arm64
+  tags:
+    - arm64
+
+.arm64-testbuild:
+  extends: .arm64-testbuild-tmpl
+  variables:
+    debug: n
+
+.arm64-testbuild-debug:
+  extends: .arm64-testbuild-tmpl
+  variables:
+    debug: y
+
+.gcc-arm64-testbuild:
+  extends: .arm64-testbuild
+  variables:
+    <<: *gcc
+
+.gcc-arm64-testbuild-debug:
+  extends: .arm64-testbuild-debug
+  variables:
+    <<: *gcc
+
+.riscv64-cross-testbuild-tmpl:
+  <<: *testbuild
+  variables:
+    XEN_TARGET_ARCH: riscv64
+  tags:
+    - x86_64
+
+.riscv64-cross-testbuild:
+  extends: .riscv64-cross-testbuild-tmpl
+  variables:
+    debug: n
+
+.riscv64-cross-testbuild-debug:
+  extends: .riscv64-cross-testbuild-tmpl
+  variables:
+    debug: y
+
+.gcc-riscv64-cross-testbuild:
+  extends: .riscv64-cross-testbuild
+  variables:
+    <<: *gcc
+
+.gcc-riscv64-cross-testbuild-debug:
+  extends: .riscv64-cross-testbuild-debug
+  variables:
+    <<: *gcc
+
+# Jobs below this line
+
+.container-debian-unstable-testtmpl:
+  variables:
+    CONTAINER: debian:unstable
+    BUILD_CONTAINER: debian/unstable
+  needs:
+    - debian-unstable-container
+
+test-debian-unstable-clang:
+  extends:
+    - .clang-x86-64-testbuild
+    - .container-debian-unstable-testtmpl
+
+test-debian-unstable-clang-debug:
+  extends:
+    - .clang-x86-64-testbuild-debug
+    - .container-debian-unstable-testtmpl
+
+test-debian-unstable-gcc:
+  extends:
+    - .gcc-x86-64-testbuild
+    - .container-debian-unstable-testtmpl
+
+test-debian-unstable-gcc-debug:
+  extends:
+    - .gcc-x86-64-testbuild-debug
+    - .container-debian-unstable-testtmpl
+
+test-debian-unstable-gcc-randconfig:
+  extends:
+    - .gcc-x86-64-testbuild
+    - .container-debian-unstable-testtmpl
+  variables:
+    RANDCONFIG: y
+
+test-debian-unstable-gcc-debug-randconfig:
+  extends:
+    - .gcc-x86-64-testbuild-debug
+    - .container-debian-unstable-testtmpl
+  variables:
+    RANDCONFIG: y
-- 
Anthony PERARD


