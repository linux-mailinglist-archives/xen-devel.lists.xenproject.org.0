Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086159129F8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 17:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745353.1152485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKgFw-00058y-9H; Fri, 21 Jun 2024 15:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745353.1152485; Fri, 21 Jun 2024 15:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKgFw-00056S-6h; Fri, 21 Jun 2024 15:32:52 +0000
Received: by outflank-mailman (input) for mailman id 745353;
 Fri, 21 Jun 2024 15:32:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NIW=NX=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKgFu-00056M-Sj
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 15:32:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 839ee2c3-2fe3-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 17:32:48 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.208.228.129])
 by support.bugseng.com (Postfix) with ESMTPSA id B12B24EE0738;
 Fri, 21 Jun 2024 17:32:47 +0200 (CEST)
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
X-Inumbo-ID: 839ee2c3-2fe3-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] automation/eclair: add more guidelines to the monitored set
Date: Fri, 21 Jun 2024 17:32:41 +0200
Message-Id: <f03398504405689413521de1675a33e50cdbc30b.1718983858.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add more accepted guidelines to the monitored set to check them at each
commit.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/monitored.ecl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
index 4daecb0c83..9ffaebbdc3 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -18,10 +18,13 @@
 -enable=MC3R1.R12.5
 -enable=MC3R1.R1.3
 -enable=MC3R1.R13.6
+-enable=MC3R1.R13.1
 -enable=MC3R1.R1.4
 -enable=MC3R1.R14.1
 -enable=MC3R1.R14.4
 -enable=MC3R1.R16.2
+-enable=MC3R1.R16.3
+-enable=MC3R1.R16.4
 -enable=MC3R1.R16.6
 -enable=MC3R1.R16.7
 -enable=MC3R1.R17.1
@@ -34,6 +37,7 @@
 -enable=MC3R1.R20.13
 -enable=MC3R1.R20.14
 -enable=MC3R1.R20.4
+-enable=MC3R1.R20.7
 -enable=MC3R1.R20.9
 -enable=MC3R1.R2.1
 -enable=MC3R1.R21.10
@@ -58,6 +62,7 @@
 -enable=MC3R1.R5.2
 -enable=MC3R1.R5.3
 -enable=MC3R1.R5.4
+-enable=MC3R1.R5.5
 -enable=MC3R1.R5.6
 -enable=MC3R1.R6.1
 -enable=MC3R1.R6.2
-- 
2.34.1


