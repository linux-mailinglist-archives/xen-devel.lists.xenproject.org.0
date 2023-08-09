Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758D7754CF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 10:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580763.909190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTeFw-00045j-FB; Wed, 09 Aug 2023 08:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580763.909190; Wed, 09 Aug 2023 08:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTeFw-00042n-BI; Wed, 09 Aug 2023 08:09:24 +0000
Received: by outflank-mailman (input) for mailman id 580763;
 Wed, 09 Aug 2023 08:09:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ohew=D2=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qTeFv-0003RD-QH
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 08:09:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cb5bcc8-368c-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 10:09:23 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id C02244EE0740;
 Wed,  9 Aug 2023 10:09:22 +0200 (CEST)
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
X-Inumbo-ID: 0cb5bcc8-368c-11ee-b280-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 3/3] automation/eclair: update analyzed builds
Date: Wed,  9 Aug 2023 10:08:01 +0200
Message-Id: <a615d13b57eb126df9f8d7acc656bc054e376caf.1691568344.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691568344.git.simone.ballarin@bugseng.com>
References: <cover.1691568344.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xen build for ARM64 now has new configuration options which
require to be defined: this patch defines them.

In both configuration files some no longer true comments have been removed.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 automation/eclair_analysis/xen_arm_config | 14 ++++----------
 automation/eclair_analysis/xen_x86_config |  9 ---------
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/automation/eclair_analysis/xen_arm_config b/automation/eclair_analysis/xen_arm_config
index 26f5fcca41..ef140ceb73 100644
--- a/automation/eclair_analysis/xen_arm_config
+++ b/automation/eclair_analysis/xen_arm_config
@@ -1,12 +1,3 @@
-# File provided in
-# Re: Xen MISRA C: Source files in scope and out of scope
-# from:	Stefano Stabellini <stefano.stabellini@amd.com>
-# date:	6 giu 2023, 02:53
-
-#
-# Automatically generated file; DO NOT EDIT.
-# Xen/arm 4.18-unstable Configuration
-#
 CONFIG_CC_IS_GCC=y
 CONFIG_GCC_VERSION=90400
 CONFIG_CLANG_VERSION=0
@@ -34,7 +25,9 @@ CONFIG_HVM=y
 CONFIG_SBSA_VUART_CONSOLE=y
 CONFIG_ARM_SSBD=y
 CONFIG_HARDEN_BRANCH_PREDICTOR=y
-# CONFIG_TEE is not set
+CONFIG_TEE=n
+CONFIG_OPTEE=n
+CONFIG_FFA=n
 # CONFIG_STATIC_SHM is not set
 # end of Architecture Features
 
@@ -47,6 +40,7 @@ CONFIG_ARM64_ERRATUM_819472=y
 CONFIG_ARM64_ERRATUM_843419=y
 CONFIG_ARM64_ERRATUM_832075=y
 CONFIG_ARM64_ERRATUM_834220=y
+CONFIG_ARM64_ERRATUM_1508412=y
 CONFIG_ARM_ERRATUM_858921=y
 CONFIG_ARM64_WORKAROUND_REPEAT_TLBI=y
 CONFIG_ARM64_ERRATUM_1286807=y
diff --git a/automation/eclair_analysis/xen_x86_config b/automation/eclair_analysis/xen_x86_config
index d497814e01..abc44d43e1 100644
--- a/automation/eclair_analysis/xen_x86_config
+++ b/automation/eclair_analysis/xen_x86_config
@@ -1,12 +1,3 @@
-# File provided in
-# Re: Xen MISRA C: Source files in scope and out of scope
-# from:	Stefano Stabellini <stefano.stabellini@amd.com> 
-# date:	6 giu 2023, 02:53
-
-#
-# Automatically generated file; DO NOT EDIT.
-# Xen/x86 4.18-unstable Configuration
-#
 CONFIG_CC_IS_GCC=y
 CONFIG_GCC_VERSION=90400
 CONFIG_CLANG_VERSION=0
-- 
2.34.1


