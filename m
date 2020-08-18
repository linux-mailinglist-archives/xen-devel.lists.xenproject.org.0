Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95A5248EB7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 21:31:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k87Jm-0007s6-E0; Tue, 18 Aug 2020 19:30:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZTd=B4=cert.pl=hubert.jasudowicz@srs-us1.protection.inumbo.net>)
 id 1k87Jk-0007s1-MY
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 19:30:44 +0000
X-Inumbo-ID: 16b56491-30c0-4733-9b2d-e541098524f9
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16b56491-30c0-4733-9b2d-e541098524f9;
 Tue, 18 Aug 2020 19:30:43 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E84EFA34A8;
 Tue, 18 Aug 2020 21:30:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id DFADDA34A6;
 Tue, 18 Aug 2020 21:30:40 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id w9I1RZ4ktR-8; Tue, 18 Aug 2020 21:30:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 171F1A3313;
 Tue, 18 Aug 2020 21:30:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MuUgz5s_BX8u; Tue, 18 Aug 2020 21:30:39 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E84CBA3300;
 Tue, 18 Aug 2020 21:30:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id D8476224CE;
 Tue, 18 Aug 2020 21:30:09 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id biQtMIqGmJkj; Tue, 18 Aug 2020 21:30:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 79708224DE;
 Tue, 18 Aug 2020 21:30:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OwA9z9mkcgKx; Tue, 18 Aug 2020 21:30:02 +0200 (CEST)
Received: from arnold.localdomain (unknown [195.187.238.48])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 0D669224CE;
 Tue, 18 Aug 2020 21:30:01 +0200 (CEST)
From: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/firmware: Fix typo in uninstall target
Date: Tue, 18 Aug 2020 21:29:48 +0200
Message-Id: <4a2e7aa6edba3d4130a80a7cd7e230f03c91ce6b.1597778748.git.hubert.jasudowicz@cert.pl>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When ipxe.bin is missing, make uninstall will fail due to
wrong switch (-r) passed to rm command. Replace it with -f.

Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
---
 tools/firmware/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/firmware/Makefile b/tools/firmware/Makefile
index 809a5fd025..1f27117794 100644
--- a/tools/firmware/Makefile
+++ b/tools/firmware/Makefile
@@ -72,7 +72,7 @@ ifeq ($(CONFIG_OVMF),y)
 	rm -f $(INST_DIR)/ovmf.bin
 endif
 ifeq ($(CONFIG_IPXE),y)
-	rm -r $(INST_DIR)/ipxe.bin
+	rm -f $(INST_DIR)/ipxe.bin
 endif
 ifeq ($(CONFIG_PV_SHIM),y)
 	rm -f $(INST_DIR)/xen-shim
--=20
2.28.0


