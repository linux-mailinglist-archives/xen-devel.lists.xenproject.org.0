Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE47A9515
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 16:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606476.944402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjKQA-00061T-CL; Thu, 21 Sep 2023 14:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606476.944402; Thu, 21 Sep 2023 14:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjKQA-0005z3-8i; Thu, 21 Sep 2023 14:12:46 +0000
Received: by outflank-mailman (input) for mailman id 606476;
 Thu, 21 Sep 2023 14:12:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWz/=FF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qjKQ8-0005yx-LV
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 14:12:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed47dc1a-5888-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 16:12:41 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-82-50-59-70.retail.telecomitalia.it [82.50.59.70])
 by support.bugseng.com (Postfix) with ESMTPSA id AE6004EE073F;
 Thu, 21 Sep 2023 16:12:40 +0200 (CEST)
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
X-Inumbo-ID: ed47dc1a-5888-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/numa: address a violation of MISRA C:2012 Rule 8.3
Date: Thu, 21 Sep 2023 16:12:26 +0200
Message-Id: <2b1c7a05a2ddd3c9f83e1a147ebf295e55ddcbe9.1695305387.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make object declarations consistent. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/numa.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 29b8c2df89..287e81ff66 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -60,7 +60,7 @@ static inline void clear_node_cpumask(unsigned int cpu)
 /* Simple perfect hash to map pdx to node numbers */
 extern unsigned int memnode_shift;
 extern unsigned long memnodemapsize;
-extern uint8_t *memnodemap;
+extern nodeid_t *memnodemap;
 
 struct node_data {
     unsigned long node_start_pfn;
-- 
2.34.1


