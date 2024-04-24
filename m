Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EEE8B090F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 14:17:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711373.1111280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzbYq-0000AQ-Ou; Wed, 24 Apr 2024 12:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711373.1111280; Wed, 24 Apr 2024 12:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzbYq-00006V-HY; Wed, 24 Apr 2024 12:17:16 +0000
Received: by outflank-mailman (input) for mailman id 711373;
 Wed, 24 Apr 2024 12:12:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcL4=L5=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1rzbTl-0007vC-89
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 12:12:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da06f5eb-0233-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 14:11:59 +0200 (CEST)
Received: from LAPTOP-EFA9O91E.localdomain
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 51EB44EE073F;
 Wed, 24 Apr 2024 14:11:59 +0200 (CEST)
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
X-Inumbo-ID: da06f5eb-0233-11ef-909a-e314d9c70b13
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 2/2] x86/msr: add suffix 'U' to MSR_AMD_CSTATE_CFG macro.
Date: Wed, 24 Apr 2024 14:11:33 +0200
Message-Id: <ec689584e80421d7ffa5b1c0f576ed60b84aeda3.1713956723.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713956723.git.alessandro.zucchelli@bugseng.com>
References: <cover.1713956723.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This addresses violations of MISRA C:2012 Rule 7.2 which states as
following: A “u” or “U” suffix shall be applied to all integer constants
that are represented in an unsigned type.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 xen/arch/x86/include/asm/msr-index.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 92dd9fa496..9cdb5b2625 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -236,7 +236,7 @@
 
 #define MSR_VIRT_SPEC_CTRL                  _AC(0xc001011f, U) /* Layout matches MSR_SPEC_CTRL */
 
-#define MSR_AMD_CSTATE_CFG                  0xc0010296
+#define MSR_AMD_CSTATE_CFG                  0xc0010296U
 
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
-- 
2.25.1


