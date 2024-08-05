Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9410A947864
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 11:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771901.1182352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sau73-0007Ha-C4; Mon, 05 Aug 2024 09:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771901.1182352; Mon, 05 Aug 2024 09:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sau73-0007EL-83; Mon, 05 Aug 2024 09:34:45 +0000
Received: by outflank-mailman (input) for mailman id 771901;
 Mon, 05 Aug 2024 09:34:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4fqT=PE=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sau71-0006k4-GS
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 09:34:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f074c501-530d-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 11:34:40 +0200 (CEST)
Received: from truciolo.bugseng.com.homenet.telecomitalia.it
 (host-87-20-207-105.retail.telecomitalia.it [87.20.207.105])
 by support.bugseng.com (Postfix) with ESMTPSA id DD2AA4EE073D;
 Mon,  5 Aug 2024 11:34:39 +0200 (CEST)
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
X-Inumbo-ID: f074c501-530d-11ef-8776-851b0ebba9a2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/2] automation/eclair: sort monitored guidelines with -V
Date: Mon,  5 Aug 2024 11:34:32 +0200
Message-Id: <cc69ad735dd53b10237981ded44229f8e6894076.1722842330.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722842330.git.federico.serafini@bugseng.com>
References: <cover.1722842330.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To improve readability, sort guidelines with -V.

No functional change.
---
 .../eclair_analysis/ECLAIR/monitored.ecl      | 92 +++++++++----------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
index 8a7e3f3cea..7b085a329a 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -2,58 +2,17 @@
 -enable=MC3R1.D1.1
 -enable=MC3R1.D2.1
 -enable=MC3R1.D4.1
+-enable=MC3R1.D4.3
+-enable=MC3R1.D4.7
 -enable=MC3R1.D4.10
 -enable=MC3R1.D4.11
 -enable=MC3R1.D4.12
 -enable=MC3R1.D4.14
--enable=MC3R1.D4.3
--enable=MC3R1.D4.7
--enable=MC3R1.R10.1
--enable=MC3R1.R10.2
 -enable=MC3R1.R1.1
--enable=MC3R1.R11.1
--enable=MC3R1.R11.7
--enable=MC3R1.R11.8
--enable=MC3R1.R11.9
--enable=MC3R1.R12.5
 -enable=MC3R1.R1.3
--enable=MC3R1.R13.6
--enable=MC3R1.R13.1
 -enable=MC3R1.R1.4
--enable=MC3R1.R14.1
--enable=MC3R1.R14.4
--enable=MC3R1.R16.2
--enable=MC3R1.R16.3
--enable=MC3R1.R16.4
--enable=MC3R1.R16.6
--enable=MC3R1.R16.7
--enable=MC3R1.R17.1
--enable=MC3R1.R17.3
--enable=MC3R1.R17.4
--enable=MC3R1.R17.5
--enable=MC3R1.R17.6
--enable=MC3R1.R18.6
--enable=MC3R1.R19.1
--enable=MC3R1.R20.12
--enable=MC3R1.R20.13
--enable=MC3R1.R20.14
--enable=MC3R1.R20.4
--enable=MC3R1.R20.7
--enable=MC3R1.R20.9
 -enable=MC3R1.R2.1
--enable=MC3R1.R21.10
--enable=MC3R1.R21.13
--enable=MC3R1.R21.17
--enable=MC3R1.R21.18
--enable=MC3R1.R21.19
--enable=MC3R1.R21.20
--enable=MC3R1.R21.21
--enable=MC3R1.R21.9
 -enable=MC3R1.R2.2
--enable=MC3R1.R22.2
--enable=MC3R1.R22.4
--enable=MC3R1.R22.5
--enable=MC3R1.R22.6
 -enable=MC3R1.R2.6
 -enable=MC3R1.R3.1
 -enable=MC3R1.R3.2
@@ -72,32 +31,73 @@
 -enable=MC3R1.R7.3
 -enable=MC3R1.R7.4
 -enable=MC3R1.R8.1
--enable=MC3R1.R8.10
--enable=MC3R1.R8.12
--enable=MC3R1.R8.14
 -enable=MC3R1.R8.2
 -enable=MC3R1.R8.3
 -enable=MC3R1.R8.4
 -enable=MC3R1.R8.5
 -enable=MC3R1.R8.6
 -enable=MC3R1.R8.8
+-enable=MC3R1.R8.10
+-enable=MC3R1.R8.12
+-enable=MC3R1.R8.14
 -enable=MC3R1.R9.2
 -enable=MC3R1.R9.3
 -enable=MC3R1.R9.4
 -enable=MC3R1.R9.5
+-enable=MC3R1.R10.1
+-enable=MC3R1.R10.2
+-enable=MC3R1.R11.1
+-enable=MC3R1.R11.7
+-enable=MC3R1.R11.8
+-enable=MC3R1.R11.9
+-enable=MC3R1.R12.5
+-enable=MC3R1.R13.1
+-enable=MC3R1.R13.6
+-enable=MC3R1.R14.1
+-enable=MC3R1.R14.4
+-enable=MC3R1.R16.2
+-enable=MC3R1.R16.3
+-enable=MC3R1.R16.4
+-enable=MC3R1.R16.6
+-enable=MC3R1.R16.7
+-enable=MC3R1.R17.1
+-enable=MC3R1.R17.3
+-enable=MC3R1.R17.4
+-enable=MC3R1.R17.5
+-enable=MC3R1.R17.6
+-enable=MC3R1.R18.6
 -enable=MC3R1.R18.8
+-enable=MC3R1.R19.1
 -enable=MC3R1.R20.2
 -enable=MC3R1.R20.3
+-enable=MC3R1.R20.4
 -enable=MC3R1.R20.6
+-enable=MC3R1.R20.7
+-enable=MC3R1.R20.9
 -enable=MC3R1.R20.11
+-enable=MC3R1.R20.12
+-enable=MC3R1.R20.13
+-enable=MC3R1.R20.14
 -enable=MC3R1.R21.3
 -enable=MC3R1.R21.4
 -enable=MC3R1.R21.5
 -enable=MC3R1.R21.7
 -enable=MC3R1.R21.8
+-enable=MC3R1.R21.9
+-enable=MC3R1.R21.10
 -enable=MC3R1.R21.12
+-enable=MC3R1.R21.13
+-enable=MC3R1.R21.17
+-enable=MC3R1.R21.18
+-enable=MC3R1.R21.19
+-enable=MC3R1.R21.20
+-enable=MC3R1.R21.21
 -enable=MC3R1.R22.1
+-enable=MC3R1.R22.2
 -enable=MC3R1.R22.3
+-enable=MC3R1.R22.4
+-enable=MC3R1.R22.5
+-enable=MC3R1.R22.6
 -enable=MC3R1.R22.7
 -enable=MC3R1.R22.8
 -enable=MC3R1.R22.9
-- 
2.34.1


