Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD497D0B0B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 11:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619719.965280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtlNI-0000l6-KG; Fri, 20 Oct 2023 09:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619719.965280; Fri, 20 Oct 2023 09:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtlNI-0000iN-GW; Fri, 20 Oct 2023 09:00:56 +0000
Received: by outflank-mailman (input) for mailman id 619719;
 Fri, 20 Oct 2023 09:00:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mrC=GC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qtlNH-0008Vd-Mw
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 09:00:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2c98b9f8-6f27-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 11:00:54 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 394AF2F4;
 Fri, 20 Oct 2023 02:01:34 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 62B673F5A1;
 Fri, 20 Oct 2023 02:00:49 -0700 (PDT)
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
X-Inumbo-ID: 2c98b9f8-6f27-11ee-9b0e-b553b5be7939
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
Subject: [PATCH v2 3/3] CHANGELOG.md: Start new "unstable" section
Date: Fri, 20 Oct 2023 17:00:23 +0800
Message-Id: <20231020090023.1298745-4-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020090023.1298745-1-Henry.Wang@arm.com>
References: <20231020090023.1298745-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2:
- Add Stefano's Acked-by tag.
---
 CHANGELOG.md | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5857c51ac2..613365ca42 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,6 +4,14 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
+## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+
+### Changed
+
+### Added
+
+### Removed
+
 ## [4.18.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-10-30
 
 ### Changed
-- 
2.25.1


