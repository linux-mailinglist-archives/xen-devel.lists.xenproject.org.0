Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844463BCE38
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 13:23:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151119.279327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jB3-0005Jl-Pz; Tue, 06 Jul 2021 11:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151119.279327; Tue, 06 Jul 2021 11:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jB3-0005Gu-Mb; Tue, 06 Jul 2021 11:23:45 +0000
Received: by outflank-mailman (input) for mailman id 151119;
 Tue, 06 Jul 2021 11:23:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rBn=L6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0jB1-00050S-ST
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 11:23:43 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e879cf2-de4c-11eb-848b-12813bfff9fa;
 Tue, 06 Jul 2021 11:23:42 +0000 (UTC)
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
X-Inumbo-ID: 9e879cf2-de4c-11eb-848b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625570622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=mG6RSUJd/P4kPROIxzI66p2WXgDfEpS2fP5XlHKOE1U=;
  b=BizdhoPSfN2h+IGrDCvyCiV6TLdXC63kSkwLUlggWM169g6BBl3zJZdg
   RXvYJgxKEXti4cenSsHVEdwUCT0Y4hYII0er7oO88yIwxq0wn1Hm80fUf
   nXj7+y8xXvV7/rL7bsqCzDIULJvuZI09inuEESmRL9rt096g13HWY+1xf
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cJG1nD6OlySdVDO7OU4ZcDYtinLX1HmYx2Sdn+YbdnWe6ytqItuFdPSiiC1oXplhmHHUsfIT+J
 nEQXt27PAMAXSnIyXAPeif3PyZ17bLnm4G+33DbO7HJD7Q7A0z2qEpcOXKH4e6Wj7ejmGIVje0
 FIi3tIrTdS02SeDmwAfPaYbSKXoXHL0OvMBcRue3GIXjRCPWise7o0RgyPEFRHpRyrWyx9xk9S
 211G5EjGjgm4CotTN3GM+Z0g0ckgFyNr32Ei69yX6Oj1QmVKUpQVusBDavHp2tYxw/KGiFoeQt
 KbY=
X-SBRS: 5.1
X-MesageID: 47339752
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:lf5To6jEoRhZK+xUoMKfhC8VmXBQXt4ji2hC6mlwRA09TySZ//
 rOoB17726NtN9/YgBCpTntAsa9qDbnhPpICOoqTM6ftWvdyQmVxehZhOOIqVCNJ8S9zJ876U
 4JSdkZNDSaNzhHZKjBjjVQa+xQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.83,328,1616472000"; 
   d="scan'208";a="47339752"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Jan Beulich <JBeulich@suse.com>, Olaf Hering <olaf@aepfle.de>
Subject: [PATCH 1/2] tools/migration: Fix iovec handling in send_checkpoint_dirty_pfn_list()
Date: Tue, 6 Jul 2021 12:23:31 +0100
Message-ID: <20210706112332.31753-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210706112332.31753-1-andrew.cooper3@citrix.com>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

We shouldn't be using two struct iovec's to write half of 'rec' each, and
there is no need to malloc() for two struct iovec's at all.

Simplify down to just two - one covering the whole of 'rec', and one covering
the pfns array.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_restore.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index aa4113d7f679..07c9e291610b 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -425,11 +425,13 @@ static int send_checkpoint_dirty_pfn_list(struct xc_sr_context *ctx)
     int rc = -1;
     unsigned int count, written;
     uint64_t i, *pfns = NULL;
-    struct iovec *iov = NULL;
     xc_shadow_op_stats_t stats = { 0, ctx->restore.p2m_size };
     struct xc_sr_record rec = {
         .type = REC_TYPE_CHECKPOINT_DIRTY_PFN_LIST,
     };
+    struct iovec iov[2] = {
+        { &rec, sizeof(rec) },
+    };
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->restore.dirty_bitmap_hbuf);
 
@@ -471,26 +473,12 @@ static int send_checkpoint_dirty_pfn_list(struct xc_sr_context *ctx)
         pfns[written++] = i;
     }
 
-    /* iovec[] for writev(). */
-    iov = malloc(3 * sizeof(*iov));
-    if ( !iov )
-    {
-        ERROR("Unable to allocate memory for sending dirty bitmap");
-        goto err;
-    }
-
     rec.length = count * sizeof(*pfns);
 
-    iov[0].iov_base = &rec.type;
-    iov[0].iov_len = sizeof(rec.type);
-
-    iov[1].iov_base = &rec.length;
-    iov[1].iov_len = sizeof(rec.length);
-
-    iov[2].iov_base = pfns;
-    iov[2].iov_len = count * sizeof(*pfns);
+    iov[1].iov_base = pfns;
+    iov[1].iov_len = rec.length;
 
-    if ( writev_exact(ctx->restore.send_back_fd, iov, 3) )
+    if ( writev_exact(ctx->restore.send_back_fd, iov, ARRAY_SIZE(iov)) )
     {
         PERROR("Failed to write dirty bitmap to stream");
         goto err;
@@ -499,7 +487,6 @@ static int send_checkpoint_dirty_pfn_list(struct xc_sr_context *ctx)
     rc = 0;
  err:
     free(pfns);
-    free(iov);
     return rc;
 }
 
-- 
2.11.0


