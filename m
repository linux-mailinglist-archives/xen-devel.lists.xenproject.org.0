Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF209604BF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 10:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783695.1192959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sirow-0001S7-6q; Tue, 27 Aug 2024 08:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783695.1192959; Tue, 27 Aug 2024 08:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sirow-0001PY-3c; Tue, 27 Aug 2024 08:44:58 +0000
Received: by outflank-mailman (input) for mailman id 783695;
 Tue, 27 Aug 2024 08:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qC/7=P2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sirot-0001PR-Rq
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 08:44:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0c7a8a7-6450-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 10:44:53 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-46-33-59.retail.telecomitalia.it [79.46.33.59])
 by support.bugseng.com (Postfix) with ESMTPSA id 16F094EE077B;
 Tue, 27 Aug 2024 10:44:52 +0200 (CEST)
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
X-Inumbo-ID: a0c7a8a7-6450-11ef-99a0-01e77a169b0f
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] automation/eclair: monitor rules 13.2 and 18.2
Date: Tue, 27 Aug 2024 10:44:46 +0200
Message-Id: <a285b271a7b89e81932115cbd23e8d9f8ca6d865.1724748117.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MISRA C:2012 Rules 13.2 and 18.2 to the monitored set.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/monitored.ecl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
index 7b085a329a..4d9ef1bd83 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -52,6 +52,7 @@
 -enable=MC3R1.R11.9
 -enable=MC3R1.R12.5
 -enable=MC3R1.R13.1
+-enable=MC3R1.R13.2
 -enable=MC3R1.R13.6
 -enable=MC3R1.R14.1
 -enable=MC3R1.R14.4
@@ -65,6 +66,7 @@
 -enable=MC3R1.R17.4
 -enable=MC3R1.R17.5
 -enable=MC3R1.R17.6
+-enable=MC3R1.R18.2
 -enable=MC3R1.R18.6
 -enable=MC3R1.R18.8
 -enable=MC3R1.R19.1
-- 
2.34.1


