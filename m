Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6968C0F28
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 14:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719222.1121830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s52VV-0004tI-Sf; Thu, 09 May 2024 12:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719222.1121830; Thu, 09 May 2024 12:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s52VV-0004rd-Pq; Thu, 09 May 2024 12:04:17 +0000
Received: by outflank-mailman (input) for mailman id 719222;
 Thu, 09 May 2024 12:04:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y+Ct=MM=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s52VV-0004rW-1t
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 12:04:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4122a765-0dfc-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 14:04:14 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id C863E4EE0737;
 Thu,  9 May 2024 14:04:11 +0200 (CEST)
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
X-Inumbo-ID: 4122a765-0dfc-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH] automation/eclair_analysis: tag MISRA C Rule 8.2 as clean.
Date: Thu,  9 May 2024 14:04:07 +0200
Message-Id: <8d29601a2aa1a371daadc024752b7a24f200fab4.1715256189.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tag the rule as clean, as there are no more violations in the codebase
since e8e8afee990a ("svm: Fix MISRA 8.2 violation").

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index bdf94ed99676..a014500a4118 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -19,7 +19,7 @@
 
 -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
 
--service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
+-service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
 }
 
 -setq=target,getenv("XEN_TARGET_ARCH")
-- 
2.34.1


