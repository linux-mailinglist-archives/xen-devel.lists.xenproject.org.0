Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F28F7B2EB1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610430.949839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9Jv-00008g-TS; Fri, 29 Sep 2023 08:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610430.949839; Fri, 29 Sep 2023 08:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9Jv-0008TO-OK; Fri, 29 Sep 2023 08:57:59 +0000
Received: by outflank-mailman (input) for mailman id 610430;
 Fri, 29 Sep 2023 08:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2FIE=FN=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qm9Ju-0007un-9Z
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:57:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 489beda4-5ea6-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 10:57:57 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-11-204-216.retail.telecomitalia.it [87.11.204.216])
 by support.bugseng.com (Postfix) with ESMTPSA id 9C2B14EE0C88;
 Fri, 29 Sep 2023 10:57:56 +0200 (CEST)
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
X-Inumbo-ID: 489beda4-5ea6-11ee-878b-cb3800f73035
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH 4/4] x86/psr: address a violation of MISRA C:2012 Rule 8.3
Date: Fri, 29 Sep 2023 10:56:17 +0200
Message-Id: <c7673a1cd70e1f4901b8f6a6a0ffe3019c9307ac.1695972930.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695972930.git.federico.serafini@bugseng.com>
References: <cover.1695972930.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function declaration and definition consistent.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/psr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/psr.h b/xen/arch/x86/include/asm/psr.h
index c2257da7fc..8ecb7a0eea 100644
--- a/xen/arch/x86/include/asm/psr.h
+++ b/xen/arch/x86/include/asm/psr.h
@@ -81,7 +81,7 @@ int psr_get_info(unsigned int socket, enum psr_type type,
 int psr_get_val(struct domain *d, unsigned int socket,
                 uint32_t *val, enum psr_type type);
 int psr_set_val(struct domain *d, unsigned int socket,
-                uint64_t val, enum psr_type type);
+                uint64_t new_val, enum psr_type type);
 
 void psr_domain_init(struct domain *d);
 void psr_domain_free(struct domain *d);
-- 
2.34.1


