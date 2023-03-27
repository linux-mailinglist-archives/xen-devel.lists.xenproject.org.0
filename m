Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAC26CAF05
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 21:42:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515454.798346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgsiu-000313-Bd; Mon, 27 Mar 2023 19:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515454.798346; Mon, 27 Mar 2023 19:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgsiu-0002yQ-8r; Mon, 27 Mar 2023 19:41:44 +0000
Received: by outflank-mailman (input) for mailman id 515454;
 Mon, 27 Mar 2023 19:41:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kO+W=7T=citrix.com=prvs=443697bea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pgsis-0002j7-De
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 19:41:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62f618e2-ccd7-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 21:41:39 +0200 (CEST)
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
X-Inumbo-ID: 62f618e2-ccd7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679946098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zXrYZq0YbjQfrHz+D24bJPE28LLfa/PMxOmz2kUZMhI=;
  b=ctJbWgX1qxk3abg3PZsD1sPghlIXUnMqBAigEjSdWNbBttBzjZj3iIxr
   PXhf5RLym/mtS3qTCXAD8sipb2h7WBDFFYXMh4h754XTiqS3Sh+/8wDno
   7ygldHb2najrY/Nt9Al3QhwvUROdVu8JKXk7j6uzpMcs2XzPhrd2apW8Z
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103115614
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:pgESI6A8heWN5RVW/1Pjw5YqxClBgxIJ4kV8jS/XYbTApD0ngTRRz
 WoeDz2Eb/yJZzD3LtlwPoy+oxtQucLWy4RmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhC4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwq/R2HF9L/
 +EhFnMgdD3c2824/+u/Y7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4TRHJwIwB/Ez
 o7A1073OUpZbMeU8iqI4339grbt3im8dJ1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6cLqScCj
 wHT2YmzXHo27ePTECjGnluJkd+sEXkHLHI8YCUZdDVGzsPO/90cgC2WSv82RcZZkebJ9SHML
 yGi9XZh1utN0JRQj81X7nic3Wvy+8Ghohodo1yOAzn7tl4RiJuNPdTA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43Nzgbb1HRcNJG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/AmMt7oW591l/a4fTgAahwyRoAWCnSWXFHvwc2TTRTIgzCFfLYEyMnTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+x3SMVj7HMihpzz+iOr2WZJgYetdWLd4RrxjvfzsTcS82
 4o3CvZmPD0GCbSlOHWOod9KRb3IRFBiba3LRwVsXrbrCmJb9KsJUJc9HZtJl1RZoplo
IronPort-HdrOrdr: A9a23:GqQEYaMZId+AvMBcTgajsMiBIKoaSvp037Eqv3oBLyC9E/b5qy
 nKpp8mPHDP6Qr5NEtQ/OxoW5PwOE80l6QFmbX5VI3KNGaJhILBFvAY0WKI+UyFJ8SRzJ876Y
 5QN4VFJZnXK3MSt6rHCQ+DeeoI8Z283Jrtr8H44FdCcTpDVoFHyENCJjvzKDwUeCB2QZU4EZ
 aH5tlKvVObFEg/ZNigG38AU/PiirTw5fDbXSI=
X-IronPort-AV: E=Sophos;i="5.98,295,1673931600"; 
   d="scan'208";a="103115614"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sergey Dyasli
	<sergey.dyasli@citrix.com>
Subject: [PATCH 4/5] x86/ucode: Cache results in microcode_scan_module()
Date: Mon, 27 Mar 2023 20:41:25 +0100
Message-ID: <20230327194126.3573997-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When microcode_scan_module() is used, it's used twice.

The caching of the bootstrap_map() pointer in ucode_blob.data is buggy for
multiple reasons and is going to be removed.

Right now, the boot flow depends on the second pass over
bootstrap_map()/find_cpio_data() altering ucode_blob.data to use the directmap
alias of the CPIO module, where previously it caches the early boostrap
mapping.

If the scan is successful, it will be successful the second time too, but
there's no point repeating the work.  Cache the module index, offset and size
to short circuit things the second time around.

While rearranging this, reduce the scope of the internals of the loop,
changing the type of _blob_start to void and droping the dead stores into cd.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Sergey Dyasli <sergey.dyasli@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c | 34 ++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 4d2a896fe78d..7d32bc13db6f 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -152,14 +152,30 @@ void __init microcode_scan_module(
     unsigned long *module_map,
     const multiboot_info_t *mbi)
 {
+    static __initdata struct { /* Cached details of a previous successful scan. */
+        unsigned long offset;  /* Offset from the start of the CPIO archive. */
+        unsigned long size;    /* Size of the CPIO file. */
+        unsigned int mod_idx;  /* Which multiboot module the CPIO archive is. */
+    } scan;
+
     module_t *mod = (module_t *)__va(mbi->mods_addr);
-    uint64_t *_blob_start;
-    unsigned long _blob_size;
-    struct cpio_data cd;
     const char *p = NULL;
     int i;
 
     ucode_blob.size = 0;
+
+    if ( scan.mod_idx ) /* Previous scan was successful. */
+    {
+        void *map = bootstrap_map(&mod[scan.mod_idx]);
+
+        if ( !map )
+            return;
+
+        ucode_blob.size = scan.size;
+        ucode_blob.data = map + scan.offset;
+        return;
+    }
+
     if ( !ucode_scan )
         return;
 
@@ -175,6 +191,10 @@ void __init microcode_scan_module(
      */
     for ( i = 1 /* Ignore dom0 kernel */; i < mbi->mods_count; i++ )
     {
+        void *_blob_start;
+        unsigned long _blob_size;
+        struct cpio_data cd;
+
         if ( !test_bit(i, module_map) )
             continue;
 
@@ -186,15 +206,19 @@ void __init microcode_scan_module(
                    i, _blob_size);
             continue;
         }
-        cd.data = NULL;
-        cd.size = 0;
+
         cd = find_cpio_data(p, _blob_start, _blob_size);
         if ( cd.data )
         {
+            scan.mod_idx = i;
+            scan.offset  = cd.data - _blob_start;
+            scan.size    = cd.size;
+
             ucode_blob.size = cd.size;
             ucode_blob.data = cd.data;
             break;
         }
+
         bootstrap_map(NULL);
     }
 }
-- 
2.30.2


