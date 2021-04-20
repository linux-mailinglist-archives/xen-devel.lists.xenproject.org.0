Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFCD3650FA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 05:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113264.215802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYhAT-0003bC-3w; Tue, 20 Apr 2021 03:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113264.215802; Tue, 20 Apr 2021 03:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYhAT-0003an-0N; Tue, 20 Apr 2021 03:35:17 +0000
Received: by outflank-mailman (input) for mailman id 113264;
 Tue, 20 Apr 2021 03:35:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qt+d=JR=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1lYhAQ-0003ag-T1
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 03:35:15 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 194c755f-38c6-460f-b3ed-eebf57910933;
 Tue, 20 Apr 2021 03:35:13 +0000 (UTC)
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
X-Inumbo-ID: 194c755f-38c6-460f-b3ed-eebf57910933
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618889713;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=4OCw2BlETeIJ5/zMETI/C9VjE7n4iGuT4GJGVZlI2tU=;
  b=EcBWB95qQ7w2BmyLoB6v9nsIFL0m2a9LVkimZr27TgUjluhTxg8AWfeI
   vbw+3z5UPLsL3U/k8DvqDmGScTShStb+hYQ/5oUyOvbmYCm1xTsodgy/E
   cNAf0t+2lZDT/X7rmSZQZe1dx5zWHZpoM1+ksQr+pWZJz6tw+r7eqwV0N
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: feFMM1VAyrKGKMq/I/3hGcUuM6DYGTxTonCWKap2CE2QC5mu7bltxyxCPER9cU60UT1pGEmhBU
 mdIeDTseJKrnUTUdtwd7XtwI7x9wjSOm00T5g/VUSIrH6H/su3BK3pcos1ftp/b5RIvKPT00oB
 R3MZ8Up4grBpW39oKUCZdI8nBf3KnOTPhaIGSZprMlXOnEHuoJQnd5POAjVjN+LkxnLaPAQsO/
 SlauEB2IG5V5brf1ghYDp1ivo0XYuQhzyHxB8RVXvtmQlV21POJbwmxSD23t3DCjAoWfHhkGIS
 8jw=
X-SBRS: 5.1
X-MesageID: 42068993
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/M1IuqmuRAaPF6ULGJ/OBpfkkrzpDfPfimdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMaVI3DYCDNvmy0IIZ+qbbz2jGIIVyZysdx94
 dFN5J/Btr5EERgga/BijWQPt48zLC8n5yAqvzZyx5WIz1CS6Yl1AthDxbeL0sefnglObMcNL
 6xovVKvCChf3N/VLXdOlAgU/LYr9PG0LLKCCR2ZCIP0wWFgTO25LOSKXHxsis2aD9Bzawv9m
 LIiWXCl8Cemsq21wPG0Cvr54lW8eGL9vJ4GMeOhsIJQw+c7jqAWYIJYdy/lQFwms6DwhIAkN
 7AoxAvVv4DlE/5TyWOjjbGnyXl2DYqwXf+xVGfmmuLm72GeBsKT/BvqKgcXhzF61cxnNwU6t
 M740up86B5IDmFvCPh68PGXxtn/3DE0UYKoKoooFF0Fa49AYUh1LA3zQduP7orWB/e0sQBFt
 JjCcnNjcwmDG+yXjTikUREhOC3Um9bJGb/fmEy/va7/hJxh35Dw04R1KUk7ws93aN4cZVC6u
 jeW54Y741mf4sTZaJ5Mu8LXdG6PGzLWQ7NK2KfOz3cZds6B04=
X-IronPort-AV: E=Sophos;i="5.82,235,1613451600"; 
   d="scan'208";a="42068993"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <anthony.perard@citrix.com>, <paul@xen.org>,
	<mst@redhat.com>, <marcel.apfelbaum@gmail.com>, <pbonzini@redhat.com>,
	<richard.henderson@linaro.org>, <ehabkost@redhat.com>, Igor Druzhinin
	<igor.druzhinin@citrix.com>
Subject: [PATCH] xen-mapcache: avoid a race on memory map while using MAP_FIXED
Date: Tue, 20 Apr 2021 04:35:02 +0100
Message-ID: <1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

When we're replacing the existing mapping there is possibility of a race
on memory map with other threads doing mmap operations - the address being
unmapped/re-mapped could be occupied by another thread in between.

Linux mmap man page recommends keeping the existing mappings in place to
reserve the place and instead utilize the fact that the next mmap operation
with MAP_FIXED flag passed will implicitly destroy the existing mappings
behind the chosen address. This behavior is guaranteed by POSIX / BSD and
therefore is portable.

Note that it wouldn't make the replacement atomic for parallel accesses to
the replaced region - those might still fail with SIGBUS due to
xenforeignmemory_map not being atomic. So we're still not expecting those.

Tested-by: Anthony PERARD <anthony.perard@citrix.com>
Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 hw/i386/xen/xen-mapcache.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index 5b120ed..e82b7dc 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -171,7 +171,20 @@ static void xen_remap_bucket(MapCacheEntry *entry,
         if (!(entry->flags & XEN_MAPCACHE_ENTRY_DUMMY)) {
             ram_block_notify_remove(entry->vaddr_base, entry->size);
         }
-        if (munmap(entry->vaddr_base, entry->size) != 0) {
+
+        /*
+         * If an entry is being replaced by another mapping and we're using
+         * MAP_FIXED flag for it - there is possibility of a race for vaddr
+         * address with another thread doing an mmap call itself
+         * (see man 2 mmap). To avoid that we skip explicit unmapping here
+         * and allow the kernel to destroy the previous mappings by replacing
+         * them in mmap call later.
+         *
+         * Non-identical replacements are not allowed therefore.
+         */
+        assert(!vaddr || (entry->vaddr_base == vaddr && entry->size == size));
+
+        if (!vaddr && munmap(entry->vaddr_base, entry->size) != 0) {
             perror("unmap fails");
             exit(-1);
         }
-- 
2.7.4


