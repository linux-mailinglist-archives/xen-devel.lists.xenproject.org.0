Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CB86A9C68
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 17:53:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506131.779162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY8f7-0008TY-Cn; Fri, 03 Mar 2023 16:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506131.779162; Fri, 03 Mar 2023 16:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY8f7-0008QT-9n; Fri, 03 Mar 2023 16:53:41 +0000
Received: by outflank-mailman (input) for mailman id 506131;
 Fri, 03 Mar 2023 16:53:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csqk=63=citrix.com=prvs=4196fa7ca=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pY8f5-0008QJ-Cq
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 16:53:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef787ea6-b9e3-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 17:53:36 +0100 (CET)
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
X-Inumbo-ID: ef787ea6-b9e3-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677862416;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EJ7aC+BF1AzWXCEZ0JpqSlmiFXvoJnQrBO7MqzqOVGw=;
  b=anvEej1CBw9x4qodWbvEM3kPVD6OcPx49CbqK7cWTkD3DH/aGUNksqdu
   xfxbAgWv306i+lQtQunry7ukY52M1d7ytQDBBZuQre/XRSwmT8Fw4420M
   /bBnLD5Qmqgin17RY9QVUEvDIWHf/qqBblhzC/rJmUI3IXkfHei6SZqgv
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101792754
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:BifYhKBc+rGlfxVW/zLjw5YqxClBgxIJ4kV8jS/XYbTApDx23jIAm
 jEfX2COP6nZZmfyKYt0PYznp00AuZXcyNdkQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhA5QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/8NeE19T/
 vYheA8WcCmpgeC6/ai+Y7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4TTGpQPwRvEz
 o7A102gXVIKFPHY8xuI+U32pMnBuHnAaZ1HQdVU8dY12QbOlwT/EiY+XlKhrf60okW3Qd5YJ
 gof/S9GhbMp6EWhQ935Xhu5iH2JpBgRX5xXCeJSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRSXKa9ECzHsO3O9HXrZHZTdDVZDcMZcecby9zGiZMNkxnFd4ZcC7CMpNv3FQzqx
 hnf+UDSmI4vpcIM0qy6+3XOjDStuoXFQ2YJ2+nHYo62xlgnPdD4PuRE/XCetK8dd9jBEjFtq
 VBew6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sxm8zb67omhezO
 ic/XD+9A7cCVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOgD+ywBJ0wf5jZ
 czznSOQ4ZEyU/kP8dZLb71Fje9DKt4Wngs/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iFy9z
 jqrDOPTk083eLSnMkHqHXs7cQhiwY4TWcqn9KS6t4erfmJbJY3WI6WKke15J9c9wMy4VI7gp
 xmAZ6OR83Kn7VWvFOlAQioLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:sMJKz6sqEyvUtAMcKXfcW2Qh7skCo4Mji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJkh8erwQJVoJkmshaKdgLNhTotKOTOGhILGFvAZ0WKP+UyHJ8S6zJ8j6U
 4iSdkkNDSSNykKsS+Z2njELz96+qjezEnAv463pB0BLXAIGsUQiDuVEjzrd3GeBjM2e6bRf6
 DsnfavyQDQAEj+Oa+Adww4ttz41qn2fd/dEFI7Li9izDPLoSKj6bb8HRTd9hACUwlXybNnym
 TBmxyR3NTpjxnuoCWstVP73tBzop/M29FDDMuDhow+MTP3kDulY4xnRvmroC01iPvH0idurP
 D85zMbe+hj4XLYeW+45TH33RP77Too43j+jXeFnHrYp9DjTj5SMbsCuWtgSGqc16MchqA97E
 sL5RPZi3NvN2KPoM0p3amKa/lo/nDE6UbK39RjyEC3arFuIYO5nbZvi3+9L61wah4SkLpXbN
 VGPYX57PZScVSVK1XYpHQH+q33Yp0SJGbNfqFQgL3Z79EApgEK86Jf/r1Rop4ZzuNld3Bb3Z
 WDDphV
X-IronPort-AV: E=Sophos;i="5.98,231,1673931600"; 
   d="scan'208";a="101792754"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH] automation: Use --no-install-recommends and -slim base for debian/unstable
Date: Fri, 3 Mar 2023 16:52:58 +0000
Message-ID: <20230303165258.12577-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use "--no-install-recommends" to avoid installing many packages that
aren't needed, many are *-doc packages. Also start using the -slim
base image as they remove a few unused files/directories, like docs/.

Explicitly install "ca-certificates" as it is only recommended for
"wget".
Explicitly install "ocaml-findlib" as it is only recommended for
"libfindlib-ocaml-dev".

Using "--no-install-recommends" saves about 600MB on the uncompress
image. 2.89GB vs 2.3GB (value from `docker image list`).

Switching to -slim save about 130MB.

Overwall, we go from 2.89GB to 2.17GB.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    Change to use "-slim" was proposed by Andy. I went futher and added
    --no-install-recommends.
    
    I've tried to find other missing packages by looking at differences
    in  "tools/config.log", "stubdom/config.log", "config/", and
    "xen/.config".
    
    A test is in progress to check that no jobs are broken, but result
    probably not before next week.
        https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/795600920
    
    I've only tested gcc debug=n on x86_64 locally.

 automation/build/debian/unstable-i386.dockerfile | 6 ++++--
 automation/build/debian/unstable.dockerfile      | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/automation/build/debian/unstable-i386.dockerfile b/automation/build/debian/unstable-i386.dockerfile
index 1c4928b09e..cc116d32e9 100644
--- a/automation/build/debian/unstable-i386.dockerfile
+++ b/automation/build/debian/unstable-i386.dockerfile
@@ -1,4 +1,4 @@
-FROM i386/debian:unstable
+FROM i386/debian:unstable-slim
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
@@ -12,7 +12,8 @@ ENTRYPOINT ["linux32"]
 
 # build depends
 RUN apt-get update && \
-    apt-get --quiet --yes install \
+    apt-get --quiet --no-install-recommends --yes install \
+        ca-certificates \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
@@ -35,6 +36,7 @@ RUN apt-get update && \
         libc6-dev \
         libnl-3-dev \
         ocaml-nox \
+        ocaml-findlib \
         libfindlib-ocaml-dev \
         markdown \
         transfig \
diff --git a/automation/build/debian/unstable.dockerfile b/automation/build/debian/unstable.dockerfile
index 6ef2878200..06ac909a85 100644
--- a/automation/build/debian/unstable.dockerfile
+++ b/automation/build/debian/unstable.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:unstable
+FROM debian:unstable-slim
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
@@ -10,7 +10,8 @@ WORKDIR /build
 
 # build depends
 RUN apt-get update && \
-    apt-get --quiet --yes install \
+    apt-get --quiet --no-install-recommends --yes install \
+        ca-certificates \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
@@ -34,6 +35,7 @@ RUN apt-get update && \
         libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
+        ocaml-findlib \
         libfindlib-ocaml-dev \
         markdown \
         transfig \
-- 
Anthony PERARD


