Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC9F5EA6C5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 15:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411785.654845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocnl5-0001Ar-Nf; Mon, 26 Sep 2022 13:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411785.654845; Mon, 26 Sep 2022 13:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocnl5-00018D-KM; Mon, 26 Sep 2022 13:02:51 +0000
Received: by outflank-mailman (input) for mailman id 411785;
 Mon, 26 Sep 2022 13:02:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t0pF=Z5=citrix.com=prvs=2617546cc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ocnl4-000181-0L
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 13:02:50 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82313282-3d9b-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 15:02:47 +0200 (CEST)
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
X-Inumbo-ID: 82313282-3d9b-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664197367;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=Do6s0Sm6WFnRlQuns40ddUOSbUFlwDXEjhDaub+jsZ8=;
  b=I1U0AsxYe9T0Rk2uVfGDkIvJa+vDmYdOiURizeJ8+s8Hfoh3y164Kp1E
   Exxxc7ykS2CtRmmanEWMDw4tgginAiNWeuugehJ/tQYsN8H9b1EvhvhEL
   XEBiOZpUp1kMqSMenSIH0QTMTaBLrD468zuAj9E9kl3aEFst5SZbyk4Tj
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81335397
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qAZKdq8b+6M2lYPF9BgBDrUDnH6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GYWCz3VMvuOYGakf40gO9u/oUMC7JXVy9FjG1Bp+C08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EI14qyr0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGAks2AKgV4eVMJHBF8
 7sfdyIALTekiLfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoShtDIFoITrk5m/+lnCLXeDxEslOF46Ew5gA/ySQhieO2bYGEJbRmQ+1Vm0yxi
 nz7oFjXAzMCN+XFzhin2VGF07qncSTTB9tJSezQGuRRqEaI2mUZBRkSVF26ifq0kEizX5RYM
 UN80gojq7IjsnOiSNbVVge95nWDu3Y0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neClsnlAjFHu7SPRXWQsLyTqFuP1TM9dDFYI3VeFE1cvoel8NpbYg/zoshLHqS1s/j4AjLL5
 iGBqm852Kcezuks2PDulbzYuA6Eqp/MRw8zwwzYWGO58w90DLKYi5yUBUvztqgZctvAJrWVl
 D1dwpXFsrhSZX2YvHbVKNjhCo1F8Bps3Nf0pVd0V6cs+D22k5JIVdABuWouTKuF3yttRNMIX
 KMxkVkLjHOwFCHwBUOSX25WI5pC8EQYPY65Ps04l/IXCnSLSCeJ/Tt1eWmb1H33nU4nnMkXY
 MnFLZ/3VSdCWP8+kFJaotvxNpd6rh3SOEuJHcyrp/hZ+eP2iIGppUctbwLVM7FRAFKsqwTJ6
 ddPX/a3J+FkeLSnOkHqHXs7dw9iwY4TWc+r8KS6t4erfmJbJY3WI6KLkOJ8KtI1wMy4VI7gp
 xmAZ6OR83Kn7VWvFOlAQioLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:jB3gHK16D1QveuFyagvEJwqjBKQkLtp133Aq2lEZdPRUGvb3qy
 nOpoV96faaslYssR0b9exoW5PwJU80l6QFgrX5VI3KNGKN1VdARLsSiLcKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.93,346,1654574400"; 
   d="scan'208";a="81335397"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Henry Wang
	<Henry.Wang@arm.com>
Subject: [PATCH for-4.17] CI: Force CONFIG_XEN_IBT in the buster-gcc-ibt test
Date: Mon, 26 Sep 2022 14:02:13 +0100
Message-ID: <20220926130213.28274-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

buster-gcc-ibt is a dedicated test to run a not-yet-upstreamed compiler patch
which is relevant to CONFIG_XEN_IBT in 4.17 and later.

Force it on, rather than having 50% of the jobs not testing what they're
supposed to be testing.

Fixes: 5d59421815d5 ("x86: Use control flow typechecking where possible")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Henry Wang <Henry.Wang@arm.com>

For 4.17: This is bugfix to CI only, to avoid it producing a false negative.
Currently, the test intermittently fails to spot the error it was intended to
identify.  It is very low risk as far as the 4.17 release goes.

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/3084774561#L373 for
proof that CONFIG_XEN_IBT=y is being fed into allrandom.config
---
 automation/gitlab-ci/build.yaml | 2 ++
 automation/scripts/build        | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 720ce6e07ba0..65e06c858ef3 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -299,6 +299,8 @@ debian-buster-gcc-ibt:
   variables:
     CONTAINER: debian:buster-gcc-ibt
     RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG: |
+      CONFIG_XEN_IBT=y
 
 debian-unstable-clang:
   extends: .clang-x86-64-build
diff --git a/automation/scripts/build b/automation/scripts/build
index 2f15ab3198e6..2d9dd86df904 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -12,6 +12,11 @@ cc-ver()
 
 # random config or default config
 if [[ "${RANDCONFIG}" == "y" ]]; then
+
+    # Append job-specific fixed configuration
+    [[ -n "${EXTRA_FIXED_RANDCONFIG}" ]] &&
+        echo "${EXTRA_FIXED_RANDCONFIG}" >> xen/tools/kconfig/allrandom.config
+
     make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
     hypervisor_only="y"
 else
-- 
2.11.0


