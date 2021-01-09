Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1AC507EF7
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 04:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308633.524447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0F0-0003Ky-2H; Wed, 20 Apr 2022 02:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308633.524447; Wed, 20 Apr 2022 02:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0Ez-0003Ig-VM; Wed, 20 Apr 2022 02:38:49 +0000
Received: by outflank-mailman (input) for mailman id 308633;
 Wed, 20 Apr 2022 02:38:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=80Cj=U6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nh0Ez-0003HJ-3g
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 02:38:49 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0102f791-c053-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 04:38:48 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23K2ccVS093023
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 19 Apr 2022 22:38:44 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23K2ccUp093022;
 Tue, 19 Apr 2022 19:38:38 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 0102f791-c053-11ec-a405-831a346695d4
Message-Id: <b8e7efa18e28f5fe7cdea478304bc4a1c64e8e01.1650420617.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1650420617.git.ehem+xen@m5p.com>
References: <cover.1650420617.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Sat, 9 Jan 2021 12:16:24 -0800
Subject: [PATCH 09/10] docs: xlexample.pvlinux: Add "type" setting
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

Some environments will prefer to explicitly include this setting
despite being the default.  This also increases consistency with other
examples.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/examples/xlexample.pvlinux | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/examples/xlexample.pvlinux b/tools/examples/xlexample.pvlinux
index be6931549a..19dac50fcd 100644
--- a/tools/examples/xlexample.pvlinux
+++ b/tools/examples/xlexample.pvlinux
@@ -5,6 +5,9 @@
 # This is a fairly minimal example of what is required for a
 # Paravirtualised Linux guest. For a more complete guide see xl.cfg(5)
 
+# This configures a PV guest instead of HVM or PVH
+#type = "pv"	# "pv" is default
+
 # Guest name
 name = "example.pvlinux"
 
-- 
2.30.2


