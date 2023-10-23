Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101AD7D2E0C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621130.967271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qur8H-0001jJ-W5; Mon, 23 Oct 2023 09:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621130.967271; Mon, 23 Oct 2023 09:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qur8H-0001g9-R9; Mon, 23 Oct 2023 09:21:57 +0000
Received: by outflank-mailman (input) for mailman id 621130;
 Mon, 23 Oct 2023 09:21:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JdWI=GF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qur8G-0000os-Jq
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:21:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 9b88360a-7185-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 11:21:55 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D4662F4;
 Mon, 23 Oct 2023 02:22:36 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7DD123F64C;
 Mon, 23 Oct 2023 02:21:51 -0700 (PDT)
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
X-Inumbo-ID: 9b88360a-7185-11ee-98d5-6d05b1d4d9a1
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
Subject: [PATCH v3 4/4] CHANGELOG.md: Start new "unstable" section
Date: Mon, 23 Oct 2023 17:21:23 +0800
Message-Id: <20231023092123.1756426-5-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023092123.1756426-1-Henry.Wang@arm.com>
References: <20231023092123.1756426-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3:
- Also uses "xenproject.org".
v2:
- Add Stefano's Acked-by tag.
---
 CHANGELOG.md | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 3ca7969699..721c067309 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,6 +4,14 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
+## [unstable UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+
+### Changed
+
+### Added
+
+### Removed
+
 ## [4.18.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-XX-XX
 
 ### Changed
-- 
2.25.1


