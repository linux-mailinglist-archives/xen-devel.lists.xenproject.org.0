Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86B2507ED2
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 04:32:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308571.524381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh08N-00086x-36; Wed, 20 Apr 2022 02:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308571.524381; Wed, 20 Apr 2022 02:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh08N-00084O-06; Wed, 20 Apr 2022 02:31:59 +0000
Received: by outflank-mailman (input) for mailman id 308571;
 Wed, 20 Apr 2022 02:31:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=80Cj=U6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nh08L-00084B-7s
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 02:31:57 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a666418-c052-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 04:31:55 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23K2VhCK092942
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 19 Apr 2022 22:31:49 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23K2VhSj092941;
 Tue, 19 Apr 2022 19:31:43 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 0a666418-c052-11ec-a405-831a346695d4
Message-Id: <c1373ba89550461f9dc3e450fc643dee187d63ba.1650420617.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1650420617.git.ehem+xen@m5p.com>
References: <cover.1650420617.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Sat, 9 Jan 2021 09:52:06 -0800
Subject: [PATCH 01/10] docs: xlexample.hvm: Mention this isn't useful for
 other guests
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

I dislike the implication this default is valuable for all guests, need
some mention of trade-off.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/examples/xlexample.hvm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/examples/xlexample.hvm b/tools/examples/xlexample.hvm
index df9fe07653..c2db4f237a 100644
--- a/tools/examples/xlexample.hvm
+++ b/tools/examples/xlexample.hvm
@@ -18,7 +18,7 @@ name = "example.hvm"
 
 # Enable Microsoft Hyper-V compatibile paravirtualisation /
 # enlightenment interfaces. Turning this on can improve Windows guest
-# performance and is therefore recommended
+# performance and is therefore recommended for Windows guests
 #viridian = 1
 
 # Initial memory allocation (MB)
-- 
2.30.2


