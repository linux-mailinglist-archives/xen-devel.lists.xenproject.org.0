Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D807D2E09
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:21:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621125.967242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qur84-0000bb-1x; Mon, 23 Oct 2023 09:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621125.967242; Mon, 23 Oct 2023 09:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qur83-0000Y4-Ud; Mon, 23 Oct 2023 09:21:43 +0000
Received: by outflank-mailman (input) for mailman id 621125;
 Mon, 23 Oct 2023 09:21:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JdWI=GF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qur82-0000HT-NW
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:21:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 931f595a-7185-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 11:21:41 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58C332F4;
 Mon, 23 Oct 2023 02:22:21 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7897B3F64C;
 Mon, 23 Oct 2023 02:21:36 -0700 (PDT)
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
X-Inumbo-ID: 931f595a-7185-11ee-9b0e-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 1/4] CHANGELOG.md: Mention the MISRA-C improvement in 4.18 dev cycle
Date: Mon, 23 Oct 2023 17:21:20 +0800
Message-Id: <20231023092123.1756426-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023092123.1756426-1-Henry.Wang@arm.com>
References: <20231023092123.1756426-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3:
- No change.
v2:
- Rewording to be more specific, correct the number of rules.
- Add Stefano's Acked-by tag.
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f2694afbe..394a92400a 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -35,6 +35,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    physical rather than linear/virtual addresses.
  - On x86, support for enforcing system-wide operation in Data Operand
    Independent Timing Mode.
+ - The project has now officially adopted 6 directives and 65 rules of MISRA-C.
 
 ### Removed
  - On x86, the "pku" command line option has been removed.  It has never
-- 
2.25.1


