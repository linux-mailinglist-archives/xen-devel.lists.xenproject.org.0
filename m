Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF49A507ED9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 04:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308592.524404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh09y-0000tP-PK; Wed, 20 Apr 2022 02:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308592.524404; Wed, 20 Apr 2022 02:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh09y-0000qd-Lx; Wed, 20 Apr 2022 02:33:38 +0000
Received: by outflank-mailman (input) for mailman id 308592;
 Wed, 20 Apr 2022 02:33:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=80Cj=U6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nh09x-0000qV-Ju
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 02:33:37 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4739dd0e-c052-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 04:33:36 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23K2XRDf092969
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 19 Apr 2022 22:33:32 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23K2XRJp092968;
 Tue, 19 Apr 2022 19:33:27 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 4739dd0e-c052-11ec-8fbf-03012f2f19d4
Message-Id: <bc0af95068ae9f97d07c18aea0dd7f848883dabe.1650420617.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1650420617.git.ehem+xen@m5p.com>
References: <cover.1650420617.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Sat, 9 Jan 2021 09:58:46 -0800
Subject: [PATCH 03/10] docs: xlexample.*: Use consistent initial memory
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

Avoid confusing benchmarking during initial installation by using
consistent amounts of memory for examples.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/examples/xlexample.hvm      | 2 +-
 tools/examples/xlexample.pvhlinux | 2 +-
 tools/examples/xlexample.pvlinux  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/examples/xlexample.hvm b/tools/examples/xlexample.hvm
index ed821fea87..26ae1c2fb4 100644
--- a/tools/examples/xlexample.hvm
+++ b/tools/examples/xlexample.hvm
@@ -22,7 +22,7 @@ name = "example.hvm"
 #viridian = 1
 
 # Initial memory allocation (MB)
-memory = 128
+memory = 384
 
 # Maximum memory (MB)
 # If this is greater than `memory' then the slack will start ballooned
diff --git a/tools/examples/xlexample.pvhlinux b/tools/examples/xlexample.pvhlinux
index 49961e4687..1e9bcb9de5 100644
--- a/tools/examples/xlexample.pvhlinux
+++ b/tools/examples/xlexample.pvhlinux
@@ -26,7 +26,7 @@ kernel = "/boot/vmlinuz"
 extra = "root=/dev/xvda1"
 
 # Initial memory allocation (MB)
-memory = 512
+memory = 384
 
 # Number of VCPUS
 vcpus = 3
diff --git a/tools/examples/xlexample.pvlinux b/tools/examples/xlexample.pvlinux
index 0c7a535f39..be6931549a 100644
--- a/tools/examples/xlexample.pvlinux
+++ b/tools/examples/xlexample.pvlinux
@@ -23,7 +23,7 @@ kernel = "/boot/vmlinuz"
 extra = "root=/dev/xvda1"
 
 # Initial memory allocation (MB)
-memory = 128
+memory = 384
 
 # Maximum memory (MB)
 # If this is greater than `memory' then the slack will start ballooned
-- 
2.30.2


