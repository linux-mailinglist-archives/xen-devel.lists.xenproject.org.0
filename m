Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BDA9FEAC4
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2024 22:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863553.1274967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSMt4-0007zt-Jc; Mon, 30 Dec 2024 21:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863553.1274967; Mon, 30 Dec 2024 21:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSMt4-0007ug-EQ; Mon, 30 Dec 2024 21:01:18 +0000
Received: by outflank-mailman (input) for mailman id 863553;
 Mon, 30 Dec 2024 21:01:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjPe=TX=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1tSMt2-0006nk-PL
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2024 21:01:16 +0000
Received: from mx1.somlen.de (typhoon.somlen.de [89.238.64.140])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 346fb3dc-c6f1-11ef-99a4-01e77a169b0f;
 Mon, 30 Dec 2024 22:01:14 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id D7CBA506D3D;
 Mon, 30 Dec 2024 22:01:13 +0100 (CET)
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
X-Inumbo-ID: 346fb3dc-c6f1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1735592474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h75DPoDEbFCJlydhUR/eRPZoEnhMbc8Ymd/flb1Kxes=;
	b=JMxcop1AVBmsy9zmgqrVah4uaCwV3KHJ4FM9H8+XHersdmP+Uwsz5J8VWhYyiXaEhaGDJR
	9HUAO+jyGZWnub5Wd1V/5knWeAdV42v9GGelvXGkKCygdNXkmZVLlDEnyZOXUPR7p6s9RW
	tOcr6pZqaFSWVLIZH2477hssqBrhZc2DW3KsHV1FnJGLxw9+88hGSAou8mGsVeju2nM1oY
	h3o3rD3QHD4QGPFjWc4f09dCJzh/p89xCrGWmgF21auh8TwBzx2jgQLJBfpVWAIaCi8Btz
	usx5Dx730NTneiahj0C3WGh58yHsBQzf0oUI7K8dwM5PZ1a87llMKuY52VNMkA==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 5/5] tools: fix typo: subsytem -> subsystem
Date: Mon, 30 Dec 2024 22:00:33 +0100
Message-Id: <ff9a8e506fcd69f54edc6396840bf21a69bdb5a6.1735585600.git.maxi@daemonizer.de>
In-Reply-To: <cover.1735585600.git.maxi@daemonizer.de>
References: <cover.1735585600.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was found by the lintian tool (Debian package checker) during
packaging xen for Debian.

Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
---
 tools/include/xenctrl.h   | 2 +-
 tools/misc/xen-memshare.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 5bb41c9c53..4955981231 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2212,7 +2212,7 @@ int xc_memshr_domain_resume(xc_interface *xch,
  * May fail with:
  *  EINVAL if the gfn is not populated or not sharable (mmio, etc)
  *  ENOMEM if internal data structures cannot be allocated
- *  E2BIG if the page is being referenced by other subsytems (e.g. qemu)
+ *  E2BIG if the page is being referenced by other subsystems (e.g. qemu)
  *  ENOENT or EEXIST if there are internal hypervisor errors.
  */
 int xc_memshr_nominate_gfn(xc_interface *xch,
diff --git a/tools/misc/xen-memshare.c b/tools/misc/xen-memshare.c
index 8e5e22b9e9..ab30979ebc 100644
--- a/tools/misc/xen-memshare.c
+++ b/tools/misc/xen-memshare.c
@@ -30,7 +30,7 @@ static int usage(const char* prog)
     printf("  add-to-physmap <domid> <gfn> <source> <source-gfn> <source-handle>\n");
     printf("                          - Populate a page in a domain with a shared page.\n");
     printf("  debug-gfn <domid> <gfn> - Debug a particular domain and gfn.\n");
-    printf("  audit                   - Audit the sharing subsytem in Xen.\n");
+    printf("  audit                   - Audit the sharing subsystem in Xen.\n");
     return 1;
 }
 
-- 
2.39.5


