Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EB2900CBE
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 22:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736622.1142753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFfxr-0001xl-9E; Fri, 07 Jun 2024 20:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736622.1142753; Fri, 07 Jun 2024 20:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFfxr-0001p4-5c; Fri, 07 Jun 2024 20:13:31 +0000
Received: by outflank-mailman (input) for mailman id 736622;
 Fri, 07 Jun 2024 20:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppZm=NJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sFfxp-0001UQ-Cq
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 20:13:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67727495-250a-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 22:13:28 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 6A9F24EE0745;
 Fri,  7 Jun 2024 22:13:27 +0200 (CEST)
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
X-Inumbo-ID: 67727495-250a-11ef-90a2-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [XEN PATCH for-4.19 v2 3/3] automation/eclair_analysis: add more clean MISRA guidelines
Date: Fri,  7 Jun 2024 22:13:18 +0200
Message-Id: <42645b41cf9d2d8b5ef72f0b171989711edb00a1.1717790683.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717790683.git.nicola.vetrini@bugseng.com>
References: <cover.1717790683.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rules 20.9, 20.12 and 14.4 are now clean on ARM and x86, so they are added
to the list of clean guidelines.

Some guidelines listed in the additional clean section for ARM are also
clean on x86, so they can be removed from there.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index a354ff322e03..b829655ca0bc 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -60,6 +60,7 @@ MC3R1.R11.7||
 MC3R1.R11.9||
 MC3R1.R12.5||
 MC3R1.R14.1||
+MC3R1.R14.4||
 MC3R1.R16.7||
 MC3R1.R17.1||
 MC3R1.R17.3||
@@ -73,6 +74,7 @@ MC3R1.R20.4||
 MC3R1.R20.6||
 MC3R1.R20.9||
 MC3R1.R20.11||
+MC3R1.R20.12||
 MC3R1.R20.13||
 MC3R1.R20.14||
 MC3R1.R21.3||
@@ -105,7 +107,7 @@ if(string_equal(target,"x86_64"),
 )

 if(string_equal(target,"arm64"),
-    service_selector({"additional_clean_guidelines","MC3R1.R14.4||MC3R1.R16.6||MC3R1.R20.12||MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R8.6||MC3R1.R9.3"})
+    service_selector({"additional_clean_guidelines","MC3R1.R16.6||MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.3"})
 )

 -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
--
2.34.1

