Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006326161C8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 12:29:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435811.689645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqBw6-0003L5-9F; Wed, 02 Nov 2022 11:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435811.689645; Wed, 02 Nov 2022 11:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqBw6-0003Iw-5k; Wed, 02 Nov 2022 11:29:34 +0000
Received: by outflank-mailman (input) for mailman id 435811;
 Wed, 02 Nov 2022 11:29:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cji=3C=citrix.com=prvs=298722737=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqBw4-00021c-LX
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 11:29:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d915115-5aa1-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 12:29:31 +0100 (CET)
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
X-Inumbo-ID: 9d915115-5aa1-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667388571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2iKsKAFpwVBDCeJ/fX/gBxBJJ7BZRdN62cOsn36HHnw=;
  b=V4KFPLgdYG0ybIjKl0MD3IQK82Jjk9STaCRte8OG1XWMrBwRgAo02oCO
   tXh4POskyAhMlbjLy0g+83JUlfQP03fbekzr+HfC8ZF1ZcAVsESH4b3Vf
   o0J/vrhwRWel8/fcV/rQqHT2UAn/7gFSHWiNEutb+nrCkmi+vC4oGB1TV
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83996305
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:s4qQOK2AQLakYsWWePbD5R5xkn2cJEfYwER7XKvMYLTBsI5bpzZTy
 mRODW3QbvqPY2f1LY13bYm+pkNS7cLVndFiGVRqpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wVmP6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfL21o3
 vkbGio0ay+dle7o4LeGEfdXmZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TaHpQEwB3A+
 woq+UzaAghDBMKW4wDf822lierGmz39AKsrQejQGvlC3wTImz175ActfVmmpfi0jGauVtQZL
 FYbkgI1trQ7/kGvStj7XjW7rWSCsxpaXMBfe8Ul7Cmdx6yS5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hRO/PzIEa1ALYyAsRBEApdLkpekbjBjCU9JiG66dlcDuFHf7x
 DXikcQlr+xN14hRjfz9pA2ZxWL3znTUcuIrzivbeEmg7TFjXYuaeZ6kt3je0K1eF5nMGzFto
 0M4s8SZ6ekPC7SEmyqMXPgBEdmV2hqVDNHPqQUxRsd8rlxB71bmJNkNu28meC+FJ+5eIVfUj
 FnvVRS9DXO5FF+jdudJbo24EKzGJoCwRI2+Bpg4gjejC6WdlTNrHgk0OyZ8PEi3yiDAdJ3T3
 r/CKK6R4Y4yU/gP8dZPb751PUUX7i4/33jPYpvw0g6q17GTDFbMF+laawHRMbhovfrYyOkwz
 zq4H5LUoyizrcWkOnWHmWLtBQ1iwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ895m5Ytzgp
 yjlMnK0PXKl2hUr3y3WNS04AF4uNL4jxU8G0dsEZAj2iyN7Mdfxss/ytfIfJNEayQCq9tYsJ
 9FtRilKKq0npujvk9jFUaTAkQ==
IronPort-HdrOrdr: A9a23:9RKjeaiEwa2Sfx9CX3dWuqmBXHBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.95,232,1661832000"; 
   d="scan'208";a="83996305"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: [XEN PATCH for-4.17 4/4] Rework COPYING installed in /usr/include/xen/, due to several licences
Date: Wed, 2 Nov 2022 11:28:54 +0000
Message-ID: <20221102112854.49020-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221102112854.49020-1-anthony.perard@citrix.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The notice in the COPYING file in "xen/include/public/COPYING" doesn't
really apply to the files that ultimately are been install at
"/usr/include/xen". The issue are headers in the "sys/" subdirectory
that comes from other projects such as Linux or FreeBSD.

The main issue is that there are two headers that have a different
licence than the MIT licence:

- xen-sys/Linux/gntalloc.h (installed as "sys/gntalloc.h") is public
  domain.
- xen-sys/FreeBSD/gntdev.h (installed as "sys/gntdev.h") is BSD-2.

To clarify this, we'll install a COPYING file with a different notice.

Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    CC: Andrew Cooper <andrew.cooper3@citrix.com>
    CC: George Dunlap <george.dunlap@citrix.com>
    CC: Jan Beulich <jbeulich@suse.com>
    CC: Julien Grall <julien@xen.org>
    CC: Stefano Stabellini <sstabellini@kernel.org>
    CC: Wei Liu <wl@xen.org>

 tools/include/Makefile    |  1 -
 tools/include/xen/COPYING | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 tools/include/xen/COPYING

diff --git a/tools/include/Makefile b/tools/include/Makefile
index 81c3d09039..f838171e8c 100644
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -24,7 +24,6 @@ xen-foreign:
 xen-dir:
 	mkdir -p xen/libelf acpi
 	find xen/ acpi/ -type l -exec rm '{}' +
-	ln -s $(XEN_ROOT)/xen/include/public/COPYING xen/
 	ln -s $(XEN_ROOT)/xen/include/public/*.h xen/
 	ln -s $(XEN_ROOT)/xen/include/public/*/ xen/
 	ln -s ../xen-sys/$(XEN_OS) xen/sys
diff --git a/tools/include/xen/COPYING b/tools/include/xen/COPYING
new file mode 100644
index 0000000000..e54eb79832
--- /dev/null
+++ b/tools/include/xen/COPYING
@@ -0,0 +1,26 @@
+XEN NOTICE
+==========
+
+This licence applies to all files within this subdirectory ("/usr/include/xen")
+with the exception of "sys/" which may include an header under public domain or
+BSD-2 licence.
+
+=====================================================================
+
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to
+deal in the Software without restriction, including without limitation the
+rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+sell copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+DEALINGS IN THE SOFTWARE.
-- 
Anthony PERARD


