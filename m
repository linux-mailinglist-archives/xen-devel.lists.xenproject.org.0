Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB02699FD5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 23:45:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496796.767686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSmzp-0001Ft-7V; Thu, 16 Feb 2023 22:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496796.767686; Thu, 16 Feb 2023 22:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSmzp-0001Dq-44; Thu, 16 Feb 2023 22:44:57 +0000
Received: by outflank-mailman (input) for mailman id 496796;
 Thu, 16 Feb 2023 22:44:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSmzn-0001Dk-K2
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 22:44:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8665bb97-ae4b-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 23:44:54 +0100 (CET)
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
X-Inumbo-ID: 8665bb97-ae4b-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676587494;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5wFYiOBU0GpxB4acq8/DH18FL7nCMj0GPbvlxjoYnYs=;
  b=L1eWrIR5LlqOhbHZNsmrE32d/K2UrnjGv+8F2ctEg4oV5NuL0TylnFq6
   boe+dxEf8DtVhBui+cYSzMd6F9+gwIKfXpT90PoT+615WzFeItCatpp+1
   CgnRuXXqwPbHaFA3+jSAq9K0JkgjAmzMxrEOoiWMzlQ+LnFwx8xVQ1pFs
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96773486
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:q1ugcqsxWb8Wb/ptzXLu+ZaVQufnVEBeMUV32f8akzHdYApBsoF/q
 tZmKWnUPq6PYGSmc40jao7noRwFvZ+HztdjTlBkpHhmFiJE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWHySFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwOj8xN06yof6M/a/kdapCpZh5IeTSM9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw9
 zyZoD+lUk9y2Nq3ywierTWDmfLzoxi4WcVMFZmS+d1RnwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEsXwQ5uofShp0Jsw+QcZVNM/Lvg/DMFmSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BTz8sF4gDGKxT8nxsAWAs64cRGqMZgPZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyyyGsiTKuKGpxeEdMMX
 KM0kVoIjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwOhDNgDqxyBh3yvFX1
 XKnnSGEVytyNEia5GDuG7d1PUEDmEjSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPrsnekhy
 P4Gb5Hi40wGAIXDjtz/rdZ7waYicSJqWvgbaqV/Koa+H+aRMDh7UqWBmOp8K90NcmY8vr6gw
 0xRk3RwkDLX7UAr4y3QApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:V/qj+6O5Ki9hNcBcTgOjsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+sjzsCWftN9/Yh4dcLy7VpVoBEmsl6KdgrNhWotKPjOW21dARbsKheffKn/bakjDH4Zmvp
 uIGJIObOEYY2IasS77ijPIb+rJwrO8gd+VbTG19QYSceloAZsQnjuQEmygYzRLrJEtP+tFKH
 KbjPA33wZJKRwsH7+G7mBuZZm4m+H2
X-IronPort-AV: E=Sophos;i="5.97,304,1669093200"; 
   d="scan'208";a="96773486"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen: Remove the use of K&R functions
Date: Thu, 16 Feb 2023 22:44:38 +0000
Message-ID: <20230216224438.705395-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Clang-15 (as seen in the FreeBSD 14 tests) complains:

  arch/x86/time.c:1364:20: error: a function declaration without a
  prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
  s_time_t get_s_time()
                     ^
                      void

The error message is a bit confusing but appears to new as part of
-Wdeprecated-non-prototype which is part of supporting C2x which formally
removes K&R syntax.

Either way, fix the offending functions.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

These are all the examples found in a default build of Xen.  I'm still finding
toolstack violations.
---
 xen/arch/x86/time.c             | 2 +-
 xen/drivers/passthrough/iommu.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 782b11c8a97b..4e44a43cc5e8 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1361,7 +1361,7 @@ s_time_t get_s_time_fixed(u64 at_tsc)
     return t->stamp.local_stime + scale_delta(delta, &t->tsc_scale);
 }
 
-s_time_t get_s_time()
+s_time_t get_s_time(void)
 {
     return get_s_time_fixed(0);
 }
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 921b71e81904..0e187f6ae33c 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -606,7 +606,7 @@ int __init iommu_setup(void)
     return rc;
 }
 
-int iommu_suspend()
+int iommu_suspend(void)
 {
     if ( iommu_enabled )
         return iommu_call(iommu_get_ops(), suspend);
@@ -614,7 +614,7 @@ int iommu_suspend()
     return 0;
 }
 
-void iommu_resume()
+void iommu_resume(void)
 {
     if ( iommu_enabled )
         iommu_vcall(iommu_get_ops(), resume);
-- 
2.30.2


