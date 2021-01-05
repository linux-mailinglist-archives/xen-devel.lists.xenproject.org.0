Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB8F2EADDA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 16:03:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62029.109543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwnrS-0004tC-Mf; Tue, 05 Jan 2021 15:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62029.109543; Tue, 05 Jan 2021 15:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwnrS-0004sq-Ij; Tue, 05 Jan 2021 15:03:02 +0000
Received: by outflank-mailman (input) for mailman id 62029;
 Tue, 05 Jan 2021 15:03:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YjHi=GI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kwnrQ-0004sl-VV
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 15:03:01 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.162])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d333e1ca-83a9-47ef-b1ce-b9758a197d96;
 Tue, 05 Jan 2021 15:02:58 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id h0968ex05F2n1W3
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 5 Jan 2021 16:02:49 +0100 (CET)
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
X-Inumbo-ID: d333e1ca-83a9-47ef-b1ce-b9758a197d96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1609858977;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
	bh=R5uc+dnxfwlGfSTbEpuaS28Fi4u/sQjshYr1/3gULHw=;
	b=BXxSEQ9zmdyVx/FP6di96zc98gss8TxbQgIPpEHMb3wOvLFF4DIKVh1McBb3xBs6G3
	3NMalWeYaPSUFXO495Pb1TQgGNeHqnZ3W8Sa2Pim6RSKSPjuhca7UnbOvI+VKOocUgE+
	Xkblxg4yFpVKbjTDMSkP5w+Q3hmDunt1kB2k17apO1iOcLsn4SqEXROyFo5mq4GOUS23
	166iol6z1wnirHIqsErOAw+bhRBidQfXp+xEzfsHnKkXCgY6/6g39BWosRe+AB+3TEZC
	uocCb+Iy+4vsAfZ+PzUuob20gCILQzdNz0UntcKphdVTitl+oXqBpDOIpz2cUFSHviYC
	mQpQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS321Mjw=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] tools: remove get_platform_info from xg_save_restore.h
Date: Tue,  5 Jan 2021 16:02:47 +0100
Message-Id: <20210105150247.2340-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Last user was removed with commit 4ddf474e2b7c045fadeaf765ac6157de745e84d6
Previously it was also used in migration code, which was removed with commit
b15bc4345e772df92e5ffdbc4c1e9ae2a6206617

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_domain.c       |  2 +-
 tools/libs/guest/xg_save_restore.h | 60 ------------------------------
 2 files changed, 1 insertion(+), 61 deletions(-)

diff --git a/tools/libs/guest/xg_domain.c b/tools/libs/guest/xg_domain.c
index 58713cd35d..5019c84e0e 100644
--- a/tools/libs/guest/xg_domain.c
+++ b/tools/libs/guest/xg_domain.c
@@ -67,7 +67,7 @@ int xc_map_domain_meminfo(xc_interface *xch, uint32_t domid,
     }
     _di.guest_width = minfo->guest_width;
 
-    /* Get page table levels (see get_platform_info() in xg_save_restore.h */
+    /* Get page table levels */
     if ( xc_version(xch, XENVER_capabilities, &xen_caps) )
     {
         PERROR("Could not get Xen capabilities (for page table levels)");
diff --git a/tools/libs/guest/xg_save_restore.h b/tools/libs/guest/xg_save_restore.h
index 88120eb54b..e4fe747c4e 100644
--- a/tools/libs/guest/xg_save_restore.h
+++ b/tools/libs/guest/xg_save_restore.h
@@ -29,66 +29,6 @@
 /* When pinning page tables at the end of restore, we also use batching. */
 #define MAX_PIN_BATCH  1024
 
-/*
-** Determine various platform information required for save/restore, in
-** particular:
-**
-**    - the maximum MFN on this machine, used to compute the size of
-**      the M2P table;
-**
-**    - the starting virtual address of the the hypervisor; we use this
-**      to determine which parts of guest address space(s) do and don't
-**      require canonicalization during save/restore; and
-**
-**    - the number of page-table levels for save/ restore. This should
-**      be a property of the domain, but for the moment we just read it
-**      from the hypervisor.
-**
-**    - The width of a guest word (unsigned long), in bytes.
-**
-** Returns 1 on success, 0 on failure.
-*/
-static inline int get_platform_info(xc_interface *xch, uint32_t dom,
-                                    /* OUT */ unsigned long *max_mfn,
-                                    /* OUT */ unsigned long *hvirt_start,
-                                    /* OUT */ unsigned int *pt_levels,
-                                    /* OUT */ unsigned int *guest_width)
-{
-    xen_capabilities_info_t xen_caps = "";
-    xen_platform_parameters_t xen_params;
-
-    if (xc_version(xch, XENVER_platform_parameters, &xen_params) != 0)
-        return 0;
-
-    if (xc_version(xch, XENVER_capabilities, &xen_caps) != 0)
-        return 0;
-
-    if (xc_maximum_ram_page(xch, max_mfn))
-        return 0;
-
-    *hvirt_start = xen_params.virt_start;
-
-    if ( xc_domain_get_guest_width(xch, dom, guest_width) != 0)
-        return 0; 
-
-    /* 64-bit tools will see the 64-bit hvirt_start, but 32-bit guests 
-     * will be using the compat one. */
-    if ( *guest_width < sizeof (unsigned long) )
-        /* XXX need to fix up a way of extracting this value from Xen if
-         * XXX it becomes variable for domU */
-        *hvirt_start = 0xf5800000;
-
-    if (strstr(xen_caps, "xen-3.0-x86_64"))
-        /* Depends on whether it's a compat 32-on-64 guest */
-        *pt_levels = ( (*guest_width == 8) ? 4 : 3 );
-    else if (strstr(xen_caps, "xen-3.0-x86_32p"))
-        *pt_levels = 3;
-    else
-        return 0;
-
-    return 1;
-}
-
 
 /*
 ** Save/restore deal with the mfn_to_pfn (M2P) and pfn_to_mfn (P2M) tables.

