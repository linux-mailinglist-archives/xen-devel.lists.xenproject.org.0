Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F192F763C4E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 18:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570599.892553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOhGv-0006Fv-HS; Wed, 26 Jul 2023 16:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570599.892553; Wed, 26 Jul 2023 16:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOhGv-0006D7-E3; Wed, 26 Jul 2023 16:21:57 +0000
Received: by outflank-mailman (input) for mailman id 570599;
 Wed, 26 Jul 2023 16:21:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0A2=DM=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qOhGt-0005Wu-K5
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 16:21:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8896b9c5-2bd0-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 18:21:54 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.163.26.92])
 by support.bugseng.com (Postfix) with ESMTPSA id 472CE4EE073D;
 Wed, 26 Jul 2023 18:21:53 +0200 (CEST)
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
X-Inumbo-ID: 8896b9c5-2bd0-11ee-8613-37d641c3527e
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
Subject: [XEN PATCH v4 4/4] maintainers: Add ECLAIR reviewer
Date: Wed, 26 Jul 2023 18:20:50 +0200
Message-Id: <4a58005750f39f517cd49fb37da5e17b8efe076e.1690387393.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690387393.git.simone.ballarin@bugseng.com>
References: <cover.1690387393.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--

Changes in v4:
- add 'Acked-by'
- remove undesired blanks

Changes in v3:
- split maintainer add in a separate patch;
- substitute blanks with tabs;
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
index 180e57dac4..d8a02a6c19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -305,6 +305,12 @@ F:	xen/include/xen/libfdt/
 F:	xen/include/xen/device_tree.h
 F:	xen/drivers/passthrough/device_tree.c
 
+ECLAIR
+R:	Simone Ballarin <simone.ballarin@bugseng.com>
+S:	Supported
+F:	automation/eclair_analysis/
+F:	automation/scripts/eclair
+
 EFI
 M:	Jan Beulich <jbeulich@suse.com>
 S:	Supported
-- 
2.34.1


