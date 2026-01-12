Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F30D16C55
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 07:11:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201012.1516789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfXbz-0004u6-W0; Tue, 13 Jan 2026 06:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201012.1516789; Tue, 13 Jan 2026 06:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfXbz-0004rO-Mw; Tue, 13 Jan 2026 06:10:39 +0000
Received: by outflank-mailman (input) for mailman id 1201012;
 Mon, 12 Jan 2026 22:44:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O4l3=7R=deutnet.info=agriveaux@srs-se1.protection.inumbo.net>)
 id 1vfQeQ-0002eS-LS
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 22:44:42 +0000
Received: from srv1.deutnet.info (srv1.deutnet.info [2a01:4f8:c2c:6846::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4579850c-f008-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 23:44:37 +0100 (CET)
Received: from agriveaux by srv1.deutnet.info with local (Exim 4.98.2)
 (envelope-from <agriveaux@deutnet.info>) id 1vfQeJ-00000003wpx-1VY7;
 Mon, 12 Jan 2026 23:44:35 +0100
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
X-Inumbo-ID: 4579850c-f008-11f0-9ccf-f158ae23cfc8
Date: Mon, 12 Jan 2026 23:44:35 +0100
From: Alexandre GRIVEAUX <agriveaux@deutnet.info>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, agriveaux@deutnet.info
Subject: [PATCH XEN] tools: Update files examples PV&PVH with pygrub.
Message-ID: <aWV5U1hgOYqDBIk2@deutnet.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Update files exemples PV&PVH for non direct kernel boot with pygrub.

Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
---
 tools/examples/xlexample.pvhlinux | 3 +++
 tools/examples/xlexample.pvlinux  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tools/examples/xlexample.pvhlinux b/tools/examples/xlexample.pvhlinux
index 18305b80af..2bdd43c2c5 100644
--- a/tools/examples/xlexample.pvhlinux
+++ b/tools/examples/xlexample.pvhlinux
@@ -25,6 +25,9 @@ kernel = "/boot/vmlinuz"
 # Kernel command line options
 extra = "root=/dev/xvda1"
 
+# Enable to use a grub2 emulation inside guest instead of direct kernel boot.
+#bootloader="pygrub"
+
 # Initial memory allocation (MB)
 memory = 512
 
diff --git a/tools/examples/xlexample.pvlinux b/tools/examples/xlexample.pvlinux
index bb5996b29f..1a6b91fb47 100644
--- a/tools/examples/xlexample.pvlinux
+++ b/tools/examples/xlexample.pvlinux
@@ -22,6 +22,9 @@ kernel = "/boot/vmlinuz"
 # Kernel command line options
 extra = "root=/dev/xvda1"
 
+# Enable to use a grub2 emulation inside guest instead of direct kernel boot.
+#bootloader="pygrub"
+
 # Initial memory allocation (MB)
 memory = 128
 
-- 
2.47.3


