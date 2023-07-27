Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89367657C9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:36:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571204.894515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP322-0000Xe-4L; Thu, 27 Jul 2023 15:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571204.894515; Thu, 27 Jul 2023 15:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP322-0000UF-07; Thu, 27 Jul 2023 15:36:02 +0000
Received: by outflank-mailman (input) for mailman id 571204;
 Thu, 27 Jul 2023 15:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dT6+=DN=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qP31z-0000S2-Or
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:35:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 489092e6-2c93-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 17:35:58 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.207.213])
 by support.bugseng.com (Postfix) with ESMTPSA id A05274EE073F;
 Thu, 27 Jul 2023 17:35:57 +0200 (CEST)
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
X-Inumbo-ID: 489092e6-2c93-11ee-b248-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [XEN PATCH] xen: change parameter name in monitor_domctl() declaration
Date: Thu, 27 Jul 2023 17:35:50 +0200
Message-Id: <6a25e9d729e85ba5712fd00f9c0514a459bb7631.1690471420.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change parameter name in monitor_domctl() declaration for
consistency with the corresponding definition.
This addresses a violation of MISRA C:2012 Rule 8.3: "All declarations
of an object or function shall use the same names and type qualifiers".

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/monitor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/monitor.h b/xen/include/xen/monitor.h
index 6b17a93071..713d54f7c1 100644
--- a/xen/include/xen/monitor.h
+++ b/xen/include/xen/monitor.h
@@ -27,7 +27,7 @@
 struct domain;
 struct xen_domctl_monitor_op;
 
-int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *op);
+int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop);
 void monitor_guest_request(void);
 
 int monitor_traps(struct vcpu *v, bool sync, vm_event_request_t *req);
-- 
2.34.1


