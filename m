Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3511E632630
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 15:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446651.702342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox7va-0004qO-2S; Mon, 21 Nov 2022 14:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446651.702342; Mon, 21 Nov 2022 14:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox7vZ-0004io-Uf; Mon, 21 Nov 2022 14:37:41 +0000
Received: by outflank-mailman (input) for mailman id 446651;
 Mon, 21 Nov 2022 14:37:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5PF=3V=citrix.com=prvs=31798088b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ox7vY-0004fK-B0
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 14:37:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b2a6ea2-69aa-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 15:37:38 +0100 (CET)
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
X-Inumbo-ID: 0b2a6ea2-69aa-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669041458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=BEhUtYQiNhE+S6ZLJyiIO/s+cSj9YjkEWslisUg9O84=;
  b=H5dic1/lST5EKLy8RxHC+1zJDAtWXuKe1scUfR4qlObhCkAl+YOB7g1T
   6F8YO3vRKD3BbznzBkVBs6hTzvvRRqssnEoMnJLrZTUIP90QRkIpKXl/p
   71PWdLKWydphr2qHg2blCOan7KyAcJLRnHQLAV+N6vYL3EX858Y78uq9S
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85274744
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oaQB36NGvw4EYGLvrR3Jl8FynXyQoLVcMsEvi/4bfWQNrUp00mMPn
 GtMXG+Ob/uPN2TxfI12PI3j805U6JTUx4dqTAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5AVmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0u9ZIkYT/
 KZBEmwmN0upi73p4b+JFeY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9KoHQGpkKwhrwS
 mTu/0CoOg5KJtem6mSCw3jytMSX2j7fcddHfFG/3qEz2wDCroAJMzU2WF2hsL+Gg0ixc9tFL
 gof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHuZO2bi+UrO6u8RjrYgIZcjAjaB1bQl5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdjj9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Kz6zfWNE5vbKIN8dJythV0yT/Fb28GRknTKqpW+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp0nfm+RI6+Cq6MMrKih6SdkyferUlTibO4hTixwCDAb4liU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HPjGItXO+eT2WUN5vp9fbgDRP7hlsP3ZyOgXm
 v4GX/a3J9xkeLWWSkHqHUQ7dDjm8VBT6UjKlvFq
IronPort-HdrOrdr: A9a23:Vkj/tKtZPkAEFi9VuPyHl7Pl7skDdtV00zEX/kB9WHVpmszxra
 +TdZUgpHnJYVkqOU3I9ersBEDEewK/yXcX2/h3AV7BZmnbUQKTRekIh7cKgQeQfhEWntQtsZ
 uIGJIRNDSfNzRHZL7BkWqFL+o=
X-IronPort-AV: E=Sophos;i="5.96,181,1665460800"; 
   d="scan'208";a="85274744"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH 1/2] tools/libxl: Fixes to libxl__domain_set_paging_mempool_size()
Date: Mon, 21 Nov 2022 14:37:30 +0000
Message-ID: <20221121143731.27545-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221121143731.27545-1-andrew.cooper3@citrix.com>
References: <20221121143731.27545-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

The error message accidentally printed the bytes value as if it were kB.

Furthermore, both b_info.shadow_memkb and shadow_mem are uint64_t, meaning
there is a risk of overflow if the user specified a stupidly large value in
the vm.cfg file.  Check and reject such a condition.

Fixes: 7c3bbd940dd8 ("xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m mempool hypercalls")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Henry Wang <Henry.Wang@arm.com>

v2:
 * Retain PRIu64
 * Check for overflow

For 4.17.  This is a low risk change, removes one overflow case, and makes an
error message accurate.
---
 tools/libs/light/libxl_dom.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index fa5c79e4f650..b454f988fbc5 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -1458,10 +1458,18 @@ int libxl__domain_set_paging_mempool_size(
     shadow_mem = d_config->b_info.shadow_memkb;
     shadow_mem <<= 10;
 
+    if ((shadow_mem >> 10) != d_config->b_info.shadow_memkb) {
+        LOGED(ERROR, domid,
+              "shadow_memkb value %"PRIu64"kB too large",
+              d_config->b_info.shadow_memkb);
+        return ERROR_FAIL;
+    }
+
     int r = xc_set_paging_mempool_size(CTX->xch, domid, shadow_mem);
     if (r) {
         LOGED(ERROR, domid,
-              "Failed to set paging mempool size to %"PRIu64"kB", shadow_mem);
+              "Failed to set paging mempool size to %"PRIu64"kB",
+              d_config->b_info.shadow_memkb);
         return ERROR_FAIL;
     }
 
-- 
2.11.0


