Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FC1507EE0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 04:34:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308601.524415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0Ap-0001UB-2B; Wed, 20 Apr 2022 02:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308601.524415; Wed, 20 Apr 2022 02:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0Ao-0001SJ-VH; Wed, 20 Apr 2022 02:34:30 +0000
Received: by outflank-mailman (input) for mailman id 308601;
 Wed, 20 Apr 2022 02:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=80Cj=U6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nh0An-0000qV-QK
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 02:34:29 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 667d4823-c052-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 04:34:29 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23K2YJKV092979
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 19 Apr 2022 22:34:24 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23K2YJQm092978;
 Tue, 19 Apr 2022 19:34:19 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 667d4823-c052-11ec-8fbf-03012f2f19d4
Message-Id: <c1308b575fa73710488527e7817668ff68b922f7.1650420617.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1650420617.git.ehem+xen@m5p.com>
References: <cover.1650420617.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Sat, 9 Jan 2021 10:01:07 -0800
Subject: [PATCH 04/10] docs: xlexample.pvhlinux: Add commented maxmem setting
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

Avoid confusion caused by differing example configuration files.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/examples/xlexample.pvhlinux | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/examples/xlexample.pvhlinux b/tools/examples/xlexample.pvhlinux
index 1e9bcb9de5..e1bf845093 100644
--- a/tools/examples/xlexample.pvhlinux
+++ b/tools/examples/xlexample.pvhlinux
@@ -28,6 +28,11 @@ extra = "root=/dev/xvda1"
 # Initial memory allocation (MB)
 memory = 384
 
+# Maximum memory (MB)
+# If this is greater than `memory' then the slack will start ballooned
+# (this assumes guest kernel support for ballooning)
+#maxmem = 512
+
 # Number of VCPUS
 vcpus = 3
 
-- 
2.30.2


