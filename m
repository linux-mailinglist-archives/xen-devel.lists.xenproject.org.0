Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7C42DA64A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 03:36:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52819.92178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp0Bs-00070o-Dj; Tue, 15 Dec 2020 02:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52819.92178; Tue, 15 Dec 2020 02:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp0Bs-00070P-AC; Tue, 15 Dec 2020 02:35:52 +0000
Received: by outflank-mailman (input) for mailman id 52819;
 Tue, 15 Dec 2020 02:35:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9m1Y=FT=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kp0Br-0006za-C7
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 02:35:51 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bb1ed0f-9380-42f9-a352-4a127f62628b;
 Tue, 15 Dec 2020 02:35:47 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0BF2ZXLZ027095
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 14 Dec 2020 21:35:39 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0BF2ZW8L027094;
 Mon, 14 Dec 2020 18:35:32 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 9bb1ed0f-9380-42f9-a352-4a127f62628b
Date: Mon, 14 Dec 2020 18:35:32 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] examples: Add PVH example to config example list
Message-ID: <X9gg9Ph2na22YKdj@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

Somewhat helpful to actually install the example configurations.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/examples/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/examples/Makefile b/tools/examples/Makefile
index f86ed3a271..fd8fba757d 100644
--- a/tools/examples/Makefile
+++ b/tools/examples/Makefile
@@ -7,6 +7,7 @@ XEN_READMES += README.incompatibilities
 
 XEN_CONFIGS += xlexample.hvm
 XEN_CONFIGS += xlexample.pvlinux
+XEN_CONFIGS += xlexample.pvhlinux
 XEN_CONFIGS += xl.conf
 XEN_CONFIGS += cpupool
 
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



