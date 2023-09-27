Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E03A7AFEC7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 10:41:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608748.947439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlQ6v-0005Xs-Tn; Wed, 27 Sep 2023 08:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608748.947439; Wed, 27 Sep 2023 08:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlQ6v-0005V6-QJ; Wed, 27 Sep 2023 08:41:33 +0000
Received: by outflank-mailman (input) for mailman id 608748;
 Wed, 27 Sep 2023 08:41:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XInx=FL=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qlQ6u-0005SW-Ic
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 08:41:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a76f5d14-5d11-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 10:41:30 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-11-204-216.retail.telecomitalia.it [87.11.204.216])
 by support.bugseng.com (Postfix) with ESMTPSA id A883D4EE0737;
 Wed, 27 Sep 2023 10:41:29 +0200 (CEST)
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
X-Inumbo-ID: a76f5d14-5d11-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH] x86/mem_access: address violations of MISRA C:2012 Rule 8.3
Date: Wed, 27 Sep 2023 10:41:20 +0200
Message-Id: <98bfdda2d3aa12c68a4be86535a6f39e6167a8e5.1695803386.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function declarations and definitions consistent.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/mem_access.h | 2 +-
 xen/arch/x86/mm/mem_access.c          | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/mem_access.h b/xen/arch/x86/include/asm/mem_access.h
index 8957e1181c..1a52a10322 100644
--- a/xen/arch/x86/include/asm/mem_access.h
+++ b/xen/arch/x86/include/asm/mem_access.h
@@ -39,7 +39,7 @@ int p2m_set_suppress_ve(struct domain *d, gfn_t gfn, bool suppress_ve,
 
 struct xen_hvm_altp2m_suppress_ve_multi;
 int p2m_set_suppress_ve_multi(struct domain *d,
-                              struct xen_hvm_altp2m_suppress_ve_multi *suppress_ve);
+                              struct xen_hvm_altp2m_suppress_ve_multi *sve);
 
 int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
                         unsigned int altp2m_idx);
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index c472fa1ee5..3449e0ee85 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -70,7 +70,7 @@ static int _p2m_get_mem_access(struct p2m_domain *p2m, gfn_t gfn,
 }
 
 bool p2m_mem_access_emulate_check(struct vcpu *v,
-                                  const vm_event_response_t *rsp)
+                                  const struct vm_event_st *rsp)
 {
     xenmem_access_t access;
     bool violation = true;
@@ -129,7 +129,7 @@ bool p2m_mem_access_emulate_check(struct vcpu *v,
 
 bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
                           struct npfec npfec,
-                          vm_event_request_t **req_ptr)
+                          struct vm_event_st **req_ptr)
 {
     struct vcpu *v = current;
     gfn_t gfn = gaddr_to_gfn(gpa);
-- 
2.34.1


