Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B14507ED5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 04:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308580.524392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh09A-0000F7-DL; Wed, 20 Apr 2022 02:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308580.524392; Wed, 20 Apr 2022 02:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh09A-0000D3-9F; Wed, 20 Apr 2022 02:32:48 +0000
Received: by outflank-mailman (input) for mailman id 308580;
 Wed, 20 Apr 2022 02:32:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=80Cj=U6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nh098-0000Cr-AV
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 02:32:46 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28b0d0ee-c052-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 04:32:45 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23K2WZ6v092952
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 19 Apr 2022 22:32:41 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23K2WZlW092951;
 Tue, 19 Apr 2022 19:32:35 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 28b0d0ee-c052-11ec-8fbf-03012f2f19d4
Message-Id: <c5351daa5561e143efa4613104246a248438af0b.1650420617.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1650420617.git.ehem+xen@m5p.com>
References: <cover.1650420617.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Sat, 9 Jan 2021 09:54:16 -0800
Subject: [PATCH 02/10] docs: xlexample.*: Use consistent vCPU count
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

Make all examples use the same number of vCPUs.  Hopefully this avoids
confusing attempts at benchmarking during installation.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/examples/xlexample.hvm      | 2 +-
 tools/examples/xlexample.pvhlinux | 2 +-
 tools/examples/xlexample.pvlinux  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/examples/xlexample.hvm b/tools/examples/xlexample.hvm
index c2db4f237a..ed821fea87 100644
--- a/tools/examples/xlexample.hvm
+++ b/tools/examples/xlexample.hvm
@@ -30,7 +30,7 @@ memory = 128
 #maxmem = 512
 
 # Number of VCPUS
-vcpus = 2
+vcpus = 3
 
 # Network devices
 # A list of 'vifspec' entries as described in
diff --git a/tools/examples/xlexample.pvhlinux b/tools/examples/xlexample.pvhlinux
index 18305b80af..49961e4687 100644
--- a/tools/examples/xlexample.pvhlinux
+++ b/tools/examples/xlexample.pvhlinux
@@ -29,7 +29,7 @@ extra = "root=/dev/xvda1"
 memory = 512
 
 # Number of VCPUS
-vcpus = 4
+vcpus = 3
 
 # Network devices
 # A list of 'vifspec' entries as described in
diff --git a/tools/examples/xlexample.pvlinux b/tools/examples/xlexample.pvlinux
index bb5996b29f..0c7a535f39 100644
--- a/tools/examples/xlexample.pvlinux
+++ b/tools/examples/xlexample.pvlinux
@@ -31,7 +31,7 @@ memory = 128
 #maxmem = 512
 
 # Number of VCPUS
-vcpus = 2
+vcpus = 3
 
 # Network devices
 # A list of 'vifspec' entries as described in
-- 
2.30.2


