Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AB83805C4
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 11:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127268.239158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhThC-0002zE-AW; Fri, 14 May 2021 09:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127268.239158; Fri, 14 May 2021 09:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhThC-0002xN-6n; Fri, 14 May 2021 09:01:22 +0000
Received: by outflank-mailman (input) for mailman id 127268;
 Fri, 14 May 2021 09:01:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDpF=KJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lhThA-0002xG-3k
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 09:01:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e0ebfca-82ed-48a5-8b78-e9a354de4e95;
 Fri, 14 May 2021 09:01:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A6D6ACAD;
 Fri, 14 May 2021 09:01:18 +0000 (UTC)
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
X-Inumbo-ID: 0e0ebfca-82ed-48a5-8b78-e9a354de4e95
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620982878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2GgQF7bJgYZPUZXWhATSQC6d8JF/XChiJEgYX2JYtPc=;
	b=PWvYctyvW9CjDi0iFLx6fSJsMPFb5TM+m9U4JUW4cSjdCFkqOjk0aF7xOqoMDtegeiP/KP
	8Z9UEyhRpmAS3Fv1ALAOywlbLrg3JZqQD7AONr4FLga6XzCegeEfElh/zczSp4hWKtzAv9
	s1je5/OUhQFgcPPgUJnizKxikleWID8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/xenstore: cleanup Makefile and gitignore
Date: Fri, 14 May 2021 11:01:16 +0200
Message-Id: <20210514090116.21002-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Makefile of xenstore and related to that the global .gitignore
file contain some leftovers from ancient times. Remove those.

While at it sort the tools/xenstore/* entries in .gitignore.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore              | 7 +++----
 tools/xenstore/Makefile | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/.gitignore b/.gitignore
index 1c2fa1530b..4aad2ddd65 100644
--- a/.gitignore
+++ b/.gitignore
@@ -288,15 +288,15 @@ tools/xenpaging/xenpaging
 tools/xenpmd/xenpmd
 tools/xenstore/xenstore
 tools/xenstore/xenstore-chmod
+tools/xenstore/xenstore-control
 tools/xenstore/xenstore-exists
 tools/xenstore/xenstore-list
+tools/xenstore/xenstore-ls
 tools/xenstore/xenstore-read
 tools/xenstore/xenstore-rm
+tools/xenstore/xenstore-watch
 tools/xenstore/xenstore-write
-tools/xenstore/xenstore-control
-tools/xenstore/xenstore-ls
 tools/xenstore/xenstored
-tools/xenstore/xenstored_test
 tools/xenstore/xs_tdb_dump
 tools/xentop/xentop
 tools/xentrace/xentrace_setsize
@@ -428,7 +428,6 @@ tools/firmware/etherboot/ipxe.tar.gz
 tools/firmware/etherboot/ipxe/
 tools/python/xen/lowlevel/xl/_pyxl_types.c
 tools/python/xen/lowlevel/xl/_pyxl_types.h
-tools/xenstore/xenstore-watch
 tools/xl/_paths.h
 tools/xl/xl
 
diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
index 01c9ccc70f..292b478fa1 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -90,7 +90,7 @@ xs_tdb_dump: xs_tdb_dump.o utils.o tdb.o talloc.o
 .PHONY: clean
 clean:
 	rm -f *.a *.o xenstored_probes.h
-	rm -f xenstored xs_random xs_stress xs_crashme
+	rm -f xenstored
 	rm -f xs_tdb_dump xenstore-control init-xenstore-domain
 	rm -f xenstore $(CLIENTS)
 	$(RM) $(DEPS_RM)
-- 
2.26.2


