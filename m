Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD69286668
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3611.10384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQDkJ-00048m-4m; Wed, 07 Oct 2020 18:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3611.10384; Wed, 07 Oct 2020 18:00:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQDkI-000482-Vf; Wed, 07 Oct 2020 18:00:58 +0000
Received: by outflank-mailman (input) for mailman id 3611;
 Wed, 07 Oct 2020 18:00:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQDkH-0003r9-RC
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:00:57 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 249f8180-3406-4e17-ad6d-668881da1b44;
 Wed, 07 Oct 2020 18:00:34 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjt-0007CF-5n; Wed, 07 Oct 2020 19:00:33 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQDkH-0003r9-RC
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:00:57 +0000
X-Inumbo-ID: 249f8180-3406-4e17-ad6d-668881da1b44
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 249f8180-3406-4e17-ad6d-668881da1b44;
	Wed, 07 Oct 2020 18:00:34 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjt-0007CF-5n; Wed, 07 Oct 2020 19:00:33 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 05/82] sg-run-job: Improve some internal API docs
Date: Wed,  7 Oct 2020 18:59:07 +0100
Message-Id: <20201007180024.7932-6-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-run-job | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sg-run-job b/sg-run-job
index 3db05b34..702ed558 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -206,12 +206,12 @@ proc recipe-flag {flagname {def 0}} {
 #                    general steps from running)
 #               The job status is set to IFFAIL.
 #
-#   per-host-ts IFFAIL TESTID SCRIPT-ARGS...
+#   per-host-ts IFFAIL TESTID SCRIPT-ARGS-LIST MORE-ARGS...
 #
 #       Runs the script (as a separate step) for each test host ident.
-#       The host ident is appended to SCRIPT-ARGS.  (SCRIPT-ARGS
-#       should contain an even number of + items for proper testid
-#       generation.)
+#       The host ident is appended to SCRIPT-ARGS-LIST.
+#       (SCRIPT-ARGS-LIST should contain an even number of + items for
+#       proper testid generation.)
 #
 #       The scripts are run in parallel for all host idents.
 #
-- 
2.20.1


