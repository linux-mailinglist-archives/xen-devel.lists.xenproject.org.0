Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E508761C60
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 16:58:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569771.890868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJUO-0005kL-Jm; Tue, 25 Jul 2023 14:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569771.890868; Tue, 25 Jul 2023 14:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJUO-0005hC-G3; Tue, 25 Jul 2023 14:58:16 +0000
Received: by outflank-mailman (input) for mailman id 569771;
 Tue, 25 Jul 2023 14:58:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p13o=DL=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qOJUN-0004O3-I7
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 14:58:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae9a1701-2afb-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 16:58:15 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.161.75.91])
 by support.bugseng.com (Postfix) with ESMTPSA id 0656B4EE073E;
 Tue, 25 Jul 2023 16:58:13 +0200 (CEST)
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
X-Inumbo-ID: ae9a1701-2afb-11ee-b23f-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 4/4] maintainers: Add ECLAIR reviewer
Date: Tue, 25 Jul 2023 16:55:57 +0200
Message-Id: <dfe59e554a25a180b9bece8fd6a0f9a142654004.1690294965.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690294965.git.simone.ballarin@bugseng.com>
References: <cover.1690294965.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

--
Changes in v3:
- split maintainer add in a separate patch;
- substitute blanks with tabs;
- fix file paths;
- change role from maintainer to reviewer.

Changes in v2:
- add ECLAIR configuration files (before they were fetched from a separate
  repository);
- now the pipeline fails if there are new violations of guidelines tagged
  with clean:added.
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 180e57dac4..66ff0ed710 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -305,6 +305,12 @@ F:	xen/include/xen/libfdt/
 F:	xen/include/xen/device_tree.h
 F:	xen/drivers/passthrough/device_tree.c
 
+ECLAIR
+R:	Simone Ballarin <simone.ballarin@bugseng.com>
+S:	Supported
+F: 	automation/eclair_analysis/
+F: 	automation/scripts/eclair
+
 EFI
 M:	Jan Beulich <jbeulich@suse.com>
 S:	Supported
-- 
2.34.1


