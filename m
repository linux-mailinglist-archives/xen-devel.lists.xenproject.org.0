Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF963D7DF6
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 20:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161293.296155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8S7r-0001Gx-QI; Tue, 27 Jul 2021 18:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161293.296155; Tue, 27 Jul 2021 18:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8S7r-0001F3-Mv; Tue, 27 Jul 2021 18:48:23 +0000
Received: by outflank-mailman (input) for mailman id 161293;
 Tue, 27 Jul 2021 18:48:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kulw=MT=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1m8S7q-0001Ev-1c
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 18:48:22 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35d2c630-ef0b-11eb-9735-12813bfff9fa;
 Tue, 27 Jul 2021 18:48:20 +0000 (UTC)
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
X-Inumbo-ID: 35d2c630-ef0b-11eb-9735-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627411699;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=0uULcV+VOG2f3fSXF9nenrrHsPs+JOUBv+40fwCjiTE=;
  b=Enq59gTUPuwdM1XdF35O8o1H2QLOaICvfB0fzSWv5eViuqUXD0d51gsJ
   KDaBW/a/veC/eWGNycPpflb1NP+KBVuj510oPy+pHq878UOF7zo1v2cPg
   Z3yW8+9tDv+oKs5tB3SeFIpMSNPfBsKokSZyF+fMhGPgVxEaKfHQ409px
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NHnH4aVTJR8qv93f14zQ1itk46UxNChB8DQjwevEBUyf+9C51KenV/yGjquRnHFNpaFq0OqE1R
 XLzA8CAOjQSynDP9D4WMd/5CHI83/ZYcpL7AsjUW1e7EHlmFKqlIDuEaCa5ve+slcv7RyiPrhV
 wg0Wgw108fs+xx5vv5f5YOfj8XREXaGzHoflr1r1fJTCkzRyAMKt4ZXYWlMS+RIJ7cJgd1us1H
 tnQMSNuLSwNdUwpPmkqtQ2Byi5+uPlafF1H9Pzn0BMKVy/bYymk89ClXjxhYLBVLDGI1HMWxe5
 OGOJAya32U20hqEt22F0ZTPf
X-SBRS: 5.1
X-MesageID: 50887287
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:iEMPOq2BGLfljuLkaLaGTAqjBLokLtp133Aq2lEZdPRUGvb4qy
 nOpoV86faaskdzZJhNo7+90cq7MBThHPxOkOss1N6ZNWGM0gbFEGgL1/qH/9SKIU3DH4Bmu5
 uIC5IObeHNMQ==
X-IronPort-AV: E=Sophos;i="5.84,274,1620705600"; 
   d="scan'208";a="50887287"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] xen/lib: Fix strcmp() and strncmp()
Date: Tue, 27 Jul 2021 19:47:15 +0100
Message-ID: <20210727184715.17699-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

The C standard requires that each character be compared as unsigned
char. Xen's current behaviour compares as signed char, which changes
the answer when chars with a value greater than 0x7f are used.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
---
 xen/lib/strcmp.c  | 8 +++++---
 xen/lib/strncmp.c | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/xen/lib/strcmp.c b/xen/lib/strcmp.c
index 465f1c4191..f85c1e8741 100644
--- a/xen/lib/strcmp.c
+++ b/xen/lib/strcmp.c
@@ -11,14 +11,16 @@
  */
 int (strcmp)(const char *cs, const char *ct)
 {
-	register signed char __res;
+	unsigned char *csu = (unsigned char *)cs;
+	unsigned char *ctu = (unsigned char *)ct;
+	int res;
 
 	while (1) {
-		if ((__res = *cs - *ct++) != 0 || !*cs++)
+		if ((res = *csu - *ctu++) != 0 || !*csu++)
 			break;
 	}
 
-	return __res;
+	return res;
 }
 
 /*
diff --git a/xen/lib/strncmp.c b/xen/lib/strncmp.c
index 9af7fa1c99..1480f58c2e 100644
--- a/xen/lib/strncmp.c
+++ b/xen/lib/strncmp.c
@@ -12,15 +12,17 @@
  */
 int (strncmp)(const char *cs, const char *ct, size_t count)
 {
-	register signed char __res = 0;
+	unsigned char *csu = (unsigned char *)cs;
+	unsigned char *ctu = (unsigned char *)ct;
+	int res = 0;
 
 	while (count) {
-		if ((__res = *cs - *ct++) != 0 || !*cs++)
+		if ((res = *csu - *ctu++) != 0 || !*csu++)
 			break;
 		count--;
 	}
 
-	return __res;
+	return res;
 }
 
 /*
-- 
2.11.0


