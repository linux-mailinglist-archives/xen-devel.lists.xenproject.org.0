Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B3A24EC97
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:46:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9maR-0008LZ-MF; Sun, 23 Aug 2020 09:46:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mQZ-0004sy-HF
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:36:39 +0000
X-Inumbo-ID: f4de2cb4-7230-4c2b-99f5-5c6ce396cef6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4de2cb4-7230-4c2b-99f5-5c6ce396cef6;
 Sun, 23 Aug 2020 09:35:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD53CB7CF;
 Sun, 23 Aug 2020 09:35:57 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 33/38] tools/libxl: add missing items to clean target
Date: Sun, 23 Aug 2020 11:35:14 +0200
Message-Id: <20200823093519.18386-34-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
References: <20200823093519.18386-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Some generated files are not removed by "make clean". Add them.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libxl/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index 1541d25f72..1476c7897f 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -363,8 +363,10 @@ clean:
 	$(RM) -f _*.h *.o *.so* *.a $(CLIENTS) $(DEPS_RM)
 	$(RM) -f _*.c *.pyc _paths.*.tmp _*.api-for-check
 	$(RM) -f testidl.c.new testidl.c *.api-ok
+	$(RM) -f $(TEST_PROGS)
 	$(RM) -f xenlight.pc
 	$(RM) -f xlutil.pc
+	$(RM) -rf __pycache__
 	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) clean
 
 distclean: clean
-- 
2.26.2


