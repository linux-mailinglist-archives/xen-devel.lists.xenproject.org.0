Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 032116E9178
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524018.814540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppS3s-0002aS-FH; Thu, 20 Apr 2023 11:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524018.814540; Thu, 20 Apr 2023 11:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppS3s-0002Yl-CT; Thu, 20 Apr 2023 11:02:48 +0000
Received: by outflank-mailman (input) for mailman id 524018;
 Thu, 20 Apr 2023 11:02:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilLs=AL=citrix.com=prvs=4670623b3=Mark.Syms@srs-se1.protection.inumbo.net>)
 id 1ppS3r-0002Yf-Gx
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:02:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df0aba39-df6a-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 13:02:43 +0200 (CEST)
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
X-Inumbo-ID: df0aba39-df6a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681988563;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L0UWyMFi6bXAICg+oR9Paaiks0muCSEBbrXn0Xzhacc=;
  b=bReMXjFebhBzln97If2KBKdO48r0p/yLf6i0VA4QYvWiPiYAKFgflc0W
   Y6LPiDfEZDAewe9oXYox5lfLa0Qz4+vliPEwuPOk/ASZPxQSUxQr8b7bW
   boqVBq8E00uGJdA++BfpuSYzL6NdJn8C/9oztAEif13CJdHP+aAlQA7Nv
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104999695
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:VvND4apsIwlr4fIpZIz/BxCjsX9eBmIOZRIvgKrLsJaIsI4StFCzt
 garIBmEbvveYzOgKNgnO4vjpxsC7Zbczt5nTwRk/yA9ESxHo5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weCzSFNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADBRVhqOgtmZ+6CcR7NznME6FZXIPLpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxV9oUiW45Em5nP7xw1tyrn9dtHSf7RmQO0MxhrJ9
 zOYrjmR7hcyDPOjjmOk7UmQiuLowRPrd6cDLpzg6as/6LGU7jNKU0BHPbehmtGgh0ujHt5SN
 UEQ0iwpq6c06QqsVNaVdwajvHeOsxoYWtxRO+438geAzuzT+QnxLnANUzppeNEg8sgsSlQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJTbp+PG6/tt11EiWCI8+Tujs1Iad9SzML
 y6irHQGjbgWtuEwxYK2p0/dhiuV+rvJd1tgjunIZV5J/j+Vdab8OdzxtgmDtKcQRGqKZgLf5
 SZZwqBy+MhLVMjQz3LVHY3hCZnzv5643CvgbUmD9nXL3xCk4DadcI9Z+1mSz285Y59fKVcFj
 KI+0D69BaO/31PwN8ebm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzwBF9y/BlZ
 s3BL5nE4ZMm5UNPlWPeegvg+eVzmnBWKZ37HvgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnTg5B
 +13bpPQoz0GCb2WX8Ui2dJLRbz8BSRhVM+eRg0+XrLrHzeK70l7UaWLneh8KtI690mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:ipFU0qhpEc84WM3vHMLGMvF/M3BQXssji2hC6mlwRA09TyX4rb
 HMoB1/73SftN9/YhwdcK+7Scu9qB/nmaKdgrNwAV7BZmfbUQKTRelfBODZogEIdReQygdV79
 YET5RD
X-Talos-CUID: 9a23:Nt9/rG0KcTpBQuEBArtHl7xfGpwdeHDY91jrMWi1U3lzTaSsFXyQwfYx
X-Talos-MUID: 9a23:tcPH2Ab1elzZReBTjxDQw2hDK/xU76mJVHAdvrAXgejcKnkl
X-IronPort-AV: E=Sophos;i="5.99,212,1677560400"; 
   d="scan'208";a="104999695"
From: <mark.syms@citrix.com>
To: <qemu-devel@nongnu.org>
CC: Mark Syms <mark.syms@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 RESEND] xen: Fix SEGV on domain disconnect
Date: Thu, 20 Apr 2023 12:02:05 +0100
Message-ID: <20230420110205.688689-1-mark.syms@citrix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mark Syms <mark.syms@citrix.com>

Ensure the PV ring is drained on disconnect. Also ensure all pending
AIO is complete, otherwise AIO tries to complete into a mapping of the
ring which has been torn down.

Signed-off-by: Mark Syms <mark.syms@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Anthony Perard <anthony.perard@citrix.com>
CC: Paul Durrant <paul@xen.org>
CC: xen-devel@lists.xenproject.org

v2:
 * Ensure all inflight requests are completed before teardown
 * RESEND to fix formatting
---
 hw/block/dataplane/xen-block.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 734da42ea7..d9da4090bf 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -523,6 +523,10 @@ static bool xen_block_handle_requests(XenBlockDataPlane *dataplane)
 
     dataplane->more_work = 0;
 
+    if (dataplane->sring == 0) {
+        return done_something;
+    }
+
     rc = dataplane->rings.common.req_cons;
     rp = dataplane->rings.common.sring->req_prod;
     xen_rmb(); /* Ensure we see queued requests up to 'rp'. */
@@ -666,14 +670,35 @@ void xen_block_dataplane_destroy(XenBlockDataPlane *dataplane)
 void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
 {
     XenDevice *xendev;
+    XenBlockRequest *request, *next;
 
     if (!dataplane) {
         return;
     }
 
+    /* We're about to drain the ring. We can cancel the scheduling of any
+     * bottom half now */
+    qemu_bh_cancel(dataplane->bh);
+
+    /* Ensure we have drained the ring */
+    aio_context_acquire(dataplane->ctx);
+    do {
+        xen_block_handle_requests(dataplane);
+    } while (dataplane->more_work);
+    aio_context_release(dataplane->ctx);
+
+    /* Now ensure that all inflight requests are complete */
+    while (!QLIST_EMPTY(&dataplane->inflight)) {
+        QLIST_FOREACH_SAFE(request, &dataplane->inflight, list, next) {
+            blk_aio_flush(request->dataplane->blk, xen_block_complete_aio,
+                        request);
+        }
+    }
+
     xendev = dataplane->xendev;
 
     aio_context_acquire(dataplane->ctx);
+
     if (dataplane->event_channel) {
         /* Only reason for failure is a NULL channel */
         xen_device_set_event_channel_context(xendev, dataplane->event_channel,
@@ -684,12 +709,6 @@ void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
     blk_set_aio_context(dataplane->blk, qemu_get_aio_context(), &error_abort);
     aio_context_release(dataplane->ctx);
 
-    /*
-     * Now that the context has been moved onto the main thread, cancel
-     * further processing.
-     */
-    qemu_bh_cancel(dataplane->bh);
-
     if (dataplane->event_channel) {
         Error *local_err = NULL;
 
-- 
2.40.0


