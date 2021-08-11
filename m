Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F353E9475
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 17:21:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166136.303401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDq2w-0002ZV-1o; Wed, 11 Aug 2021 15:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166136.303401; Wed, 11 Aug 2021 15:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDq2v-0002Wk-UN; Wed, 11 Aug 2021 15:21:33 +0000
Received: by outflank-mailman (input) for mailman id 166136;
 Wed, 11 Aug 2021 15:21:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrQt=NC=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mDq2u-0002Wa-Kw
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 15:21:32 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cdc785d6-fab7-11eb-a09b-12813bfff9fa;
 Wed, 11 Aug 2021 15:21:31 +0000 (UTC)
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
X-Inumbo-ID: cdc785d6-fab7-11eb-a09b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628695291;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=eCKeutI27x2rCC5owfVia7tk2HpSAR1VD75w6n4F5QQ=;
  b=N7AKZRj1px9HlSm5I7ZnLZkJXWBn/j5KIFLY14I2B6gwN6ITpH0trIbD
   pwUaFKfVVSzTeeKzycR9T6sFT2/ITP+I7oIonR+gOviwxgH39klUq2zIf
   8ywtnHUQ6VTiugrtWqSNe9hQTQdphYPHy+/nLKz1N6KxEFGmSLDpO88Mj
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: mllvw5Ah7dOv3sTIV03vzLNpVF3aaNgMPs+rIXGBHqCTNrcNS99mZtlQE+B8YQtb0ulpgvcOFC
 lpjvqsALTCgEzuSXX1vk1fYapQE8HEkOAgI25q42lis9yi1MDR3ouG66Vj4rqjWowLAK8lUmJi
 hYRpCoDz4DTaeCEW+4hawM2wFdZdsLET9FHUhvz1aqK3Iu7rZPxNhCFIxgTYDdwPPvZsdRTNb+
 fwC2AeAoWRFnUXb8U+K6/+/u/rM3VtC2ddUFmfqJ48p6mHgZfcGKpzZnlxJ/8zrP/yPXMIXuSk
 uWn8K6XJ2i9F7kJtElmcdHYc
X-SBRS: 5.1
X-MesageID: 50223934
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6YfCRqD0MoWQgmjlHem655DYdb4zR+YMi2TC1yhKJyC9E/bo8P
 xG88566faZslossRIb6LS90cu7MBDhHPdOiOF7V9qftWHdyQ6VxepZjLcKrQeOJ8SHzJ8+6Z
 td
X-IronPort-AV: E=Sophos;i="5.84,313,1620705600"; 
   d="scan'208";a="50223934"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] xen/bitmap: Don't open code DIV_ROUND_UP()
Date: Wed, 11 Aug 2021 16:20:55 +0100
Message-ID: <20210811152055.22962-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Also, change bitmap_long_to_byte() and bitmap_byte_to_long() to take
'unsigned int' instead of 'int' number of bits, to match the type of
their callers.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
---
 xen/common/bitmap.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index bbc3554ae1..b78cb6029f 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -10,6 +10,7 @@
 #include <xen/bitmap.h>
 #include <xen/bitops.h>
 #include <xen/cpumask.h>
+#include <xen/lib.h>
 #include <xen/guest_access.h>
 #include <asm/byteorder.h>
 
@@ -338,7 +339,7 @@ EXPORT_SYMBOL(bitmap_allocate_region);
 
 #ifdef __BIG_ENDIAN
 
-static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits)
+static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, unsigned int nbits)
 {
 	unsigned long l;
 	int i, j, b;
@@ -354,7 +355,7 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits)
 	clamp_last_byte(bp, nbits);
 }
 
-static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, int nbits)
+static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, unsigned int nbits)
 {
 	unsigned long l;
 	int i, j, b;
@@ -371,18 +372,18 @@ static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, int nbits)
 
 #elif defined(__LITTLE_ENDIAN)
 
-static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits)
+static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, unsigned int nbits)
 {
-	memcpy(bp, lp, (nbits+7)/8);
+	memcpy(bp, lp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
 	clamp_last_byte(bp, nbits);
 }
 
-static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, int nbits)
+static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, unsigned int nbits)
 {
 	/* We may need to pad the final longword with zeroes. */
 	if (nbits & (BITS_PER_LONG-1))
 		lp[BITS_TO_LONGS(nbits)-1] = 0;
-	memcpy(lp, bp, (nbits+7)/8);
+	memcpy(lp, bp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
 }
 
 #endif
@@ -393,13 +394,14 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
     unsigned int guest_bytes, copy_bytes, i;
     uint8_t zero = 0;
     int err = 0;
-    uint8_t *bytemap = xmalloc_array(uint8_t, (nbits + 7) / 8);
+    unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
+    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
 
     if ( !bytemap )
         return -ENOMEM;
 
-    guest_bytes = (xenctl_bitmap->nr_bits + 7) / 8;
-    copy_bytes  = min(guest_bytes, (nbits + 7) / 8);
+    guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
+    copy_bytes  = min(guest_bytes, xen_bytes);
 
     bitmap_long_to_byte(bytemap, bitmap, nbits);
 
@@ -422,13 +424,14 @@ int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
 {
     unsigned int guest_bytes, copy_bytes;
     int err = 0;
-    uint8_t *bytemap = xzalloc_array(uint8_t, (nbits + 7) / 8);
+    unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
+    uint8_t *bytemap = xzalloc_array(uint8_t, xen_bytes);
 
     if ( !bytemap )
         return -ENOMEM;
 
-    guest_bytes = (xenctl_bitmap->nr_bits + 7) / 8;
-    copy_bytes  = min(guest_bytes, (nbits + 7) / 8);
+    guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
+    copy_bytes  = min(guest_bytes, xen_bytes);
 
     if ( copy_bytes )
     {
-- 
2.11.0


