Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8C7255DBF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:22:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBgCv-00006R-9j; Fri, 28 Aug 2020 15:22:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pjxq=CG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBfzp-0004eG-6a
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:08:53 +0000
X-Inumbo-ID: 3efa5363-c461-4cf1-9cf9-c82ad26b7970
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3efa5363-c461-4cf1-9cf9-c82ad26b7970;
 Fri, 28 Aug 2020 15:07:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6EDDAAF7C;
 Fri, 28 Aug 2020 15:08:27 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 25/31] tools/libxl: add missing items to clean target
Date: Fri, 28 Aug 2020 17:07:41 +0200
Message-Id: <20200828150747.25305-26-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828150747.25305-1-jgross@suse.com>
References: <20200828150747.25305-1-jgross@suse.com>
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
Acked-by: Wei Liu <wl@xen.org>
---
 tools/libxl/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index d3dd9efadf..3cc868d9e9 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -385,8 +385,10 @@ clean:
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


