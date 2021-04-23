Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E9B3696B9
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 18:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116492.222395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTh-0008TC-C6; Fri, 23 Apr 2021 16:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116492.222395; Fri, 23 Apr 2021 16:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTh-0008SN-7R; Fri, 23 Apr 2021 16:16:25 +0000
Received: by outflank-mailman (input) for mailman id 116492;
 Fri, 23 Apr 2021 16:16:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6bT=JU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lZyTf-00082q-H4
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 16:16:23 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cccee8e-9fb5-4356-9798-0c34a9140295;
 Fri, 23 Apr 2021 16:16:07 +0000 (UTC)
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
X-Inumbo-ID: 9cccee8e-9fb5-4356-9798-0c34a9140295
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619194567;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ph38A5j1OWE1s08PgJbUwpGtJdMyhhVSIRMRnKmNdPw=;
  b=C/oUHc1zHPGStt/cwPY4k2TIph+2rC7ZY8xk8m1ioBBrfvM1TCjMPmM1
   n0hPAfxTBKnlwXMpzpZft+Wu83ArBXqIwfhWJJmekljhzkRm7AeLWfjMq
   Qre/0K5onhHpI/wr+VLiutpDJDsjv/XBJ3fXy8hA6rMIZCZ9ROX1Nxi+q
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pqqW2xtefipI1Zu4wSr7cp2dOjCFBX9jV3eA1mtnDqlXfQw2/54LqblDcbH0tHQv/6vMsw0xxk
 DzN6gvr/fWQ/Tb4uu2aZ/3ZcOxYdp1//oUF+g0mB/YgFPR2Y/pzO6LcacpUe/o/0bYABsobp0x
 QBbor4EGgdDAw6VneRhT4/I7wZWyG3jiykm44EsXXNN4kiUHUh00pF3f82wybJ8AnNfDS7K51B
 Xm6qsIMPfWoA/N2pJ2PjOf4Gu4wjQ8x1QR5cMP54OtnKKLS5Jr+l2ox6SzqQ64+S5pMgpFydGl
 rVk=
X-SBRS: 5.1
X-MesageID: 42672689
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LmzmdqHze4v+x9dhpLqEbceALOonbusQ8zAX/mpaICY6TuWzkc
 eykPMHkSLugDEKV3063fyGMq+MQXTTnKQFh7U5F7GkQQXgpS+UPJhvhLGSuwHINiXi+odmtZ
 tIXLN5DLTLYWRSrcG/2wWgFsZl/d/vytHMuc7771NACT5ncLth6QARMHf9LmRTSBNdDZQ0UL
 qwj/A3xAaIQngcYsSlCnRtZYGqzLenqLvcbRELHBIh4gWV5AnYjILSKBSEwgwYFwpG3LZKyx
 m9ryXC+q6hv/unoyW860bv6f1t9+fJ+59mDMyIhtN9EESPtjqV
X-IronPort-AV: E=Sophos;i="5.82,246,1613451600"; 
   d="scan'208";a="42672689"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 6/8] libxl: Export libxl__qmp_ev_qemu_compare_version
Date: Fri, 23 Apr 2021 17:15:56 +0100
Message-ID: <20210423161558.224367-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423161558.224367-1-anthony.perard@citrix.com>
References: <20210423161558.224367-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are going to want to check QEMU's version in other places where we
can use libxl__ev_qmp_send.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_internal.h | 8 ++++++++
 tools/libs/light/libxl_qmp.c      | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index c6a4a187f5b0..c114f6d39960 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -492,6 +492,14 @@ _hidden int libxl__ev_qmp_send(libxl__egc *egc, libxl__ev_qmp *ev,
                                const char *cmd, libxl__json_object *args);
 _hidden void libxl__ev_qmp_dispose(libxl__gc *gc, libxl__ev_qmp *ev);
 
+/* return values:
+ *   < 0  if qemu's version <  asked version
+ *   = 0  if qemu's version == asked version
+ *   > 0  if qemu's version >  asked version
+ */
+_hidden int libxl__qmp_ev_qemu_compare_version(libxl__ev_qmp *ev, int major,
+                                               int minor, int micro);
+
 typedef enum {
     /* initial state */
     qmp_state_disconnected = 1,
diff --git a/tools/libs/light/libxl_qmp.c b/tools/libs/light/libxl_qmp.c
index d0967c9f029f..fb146a54cb9c 100644
--- a/tools/libs/light/libxl_qmp.c
+++ b/tools/libs/light/libxl_qmp.c
@@ -289,7 +289,7 @@ static int qmp_handle_response(libxl__gc *gc, libxl__qmp_handler *qmp,
  *   = 0  if qemu's version == asked version
  *   > 0  if qemu's version >  asked version
  */
-static int qmp_ev_qemu_compare_version(libxl__ev_qmp *ev, int major,
+int libxl__qmp_ev_qemu_compare_version(libxl__ev_qmp *ev, int major,
                                        int minor, int micro)
 {
     assert(ev->state == qmp_state_connected);
@@ -1073,7 +1073,7 @@ static void dm_state_save_to_fdset(libxl__egc *egc, libxl__ev_qmp *ev, int fdset
     /* The `live` parameter was added to QEMU 2.11. It signals QEMU that
      * the save operation is for a live migration rather than for taking a
      * snapshot. */
-    if (qmp_ev_qemu_compare_version(ev, 2, 11, 0) >= 0)
+    if (libxl__qmp_ev_qemu_compare_version(ev, 2, 11, 0) >= 0)
         libxl__qmp_param_add_bool(gc, &args, "live", dsps->live);
     QMP_PARAMETERS_SPRINTF(&args, "filename", "/dev/fdset/%d", fdset);
     rc = libxl__ev_qmp_send(egc, ev, "xen-save-devices-state", args);
-- 
Anthony PERARD


