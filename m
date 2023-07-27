Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E707656D3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571168.894374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2Y3-0006jK-K5; Thu, 27 Jul 2023 15:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571168.894374; Thu, 27 Jul 2023 15:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2Y3-0006gn-Gp; Thu, 27 Jul 2023 15:05:03 +0000
Received: by outflank-mailman (input) for mailman id 571168;
 Thu, 27 Jul 2023 15:05:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dT6+=DN=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qP2Y2-0006gh-4m
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:05:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f52a73a6-2c8e-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 17:05:00 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.207.213])
 by support.bugseng.com (Postfix) with ESMTPSA id 528884EE073F;
 Thu, 27 Jul 2023 17:04:59 +0200 (CEST)
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
X-Inumbo-ID: f52a73a6-2c8e-11ee-b248-6b7b168915f2
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
Subject: [XEN PATCH] xen: change names and type qualifiers in copy_domain_page() declaration
Date: Thu, 27 Jul 2023 17:04:51 +0200
Message-Id: <49ce75f6f79f6de3a447f9bfb44e288e689dd8f3.1690470179.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change names and type qualifiers of parameters in copy_domain_page()
declaration to keep consistency with the corresponding definition.
This addresses violations of MISRA C:2012 Rule 8.3: "All declarations
of an object or function shall use the same names and type qualifiers".

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/domain_page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/domain_page.h b/xen/include/xen/domain_page.h
index 149b217b96..c4007eac09 100644
--- a/xen/include/xen/domain_page.h
+++ b/xen/include/xen/domain_page.h
@@ -15,7 +15,7 @@
  * Clear a given page frame, or copy between two of them.
  */
 void clear_domain_page(mfn_t mfn);
-void copy_domain_page(mfn_t dst, const mfn_t src);
+void copy_domain_page(mfn_t dest, mfn_t source);
 
 #ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
 
-- 
2.34.1


