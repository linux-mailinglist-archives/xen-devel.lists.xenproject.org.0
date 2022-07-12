Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A750B571D06
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 16:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365771.596102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBH5b-0003MG-3m; Tue, 12 Jul 2022 14:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365771.596102; Tue, 12 Jul 2022 14:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBH5b-0003Jd-0x; Tue, 12 Jul 2022 14:42:15 +0000
Received: by outflank-mailman (input) for mailman id 365771;
 Tue, 12 Jul 2022 14:42:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9B0=XR=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1oBH5Z-0003JX-50
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 14:42:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d0158e91-01f0-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 16:42:11 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C8321596;
 Tue, 12 Jul 2022 07:42:11 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0BFB3F73D;
 Tue, 12 Jul 2022 07:42:09 -0700 (PDT)
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
X-Inumbo-ID: d0158e91-01f0-11ed-bd2d-47488cf2e6aa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] automation: Remove build-* from gitignore
Date: Tue, 12 Jul 2022 15:41:55 +0100
Message-Id: <199cc377eb38606bfa4b33942f0ed688080cf535.1657636714.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

...because there are some scripts in automation corresponding to the
entry (build-test.sh and build-each-commit.sh)

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .gitignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 4729911c51..f731975713 100644
--- a/.gitignore
+++ b/.gitignore
@@ -44,7 +44,6 @@ config.cache
 config/Toplevel.mk
 config/Paths.mk
 
-build-*
 dist/*
 docs/tmp.*
 docs/html/
-- 
2.25.1


