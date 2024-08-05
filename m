Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF17F947863
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 11:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771899.1182333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sau71-0006lA-Rx; Mon, 05 Aug 2024 09:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771899.1182333; Mon, 05 Aug 2024 09:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sau71-0006kH-Nb; Mon, 05 Aug 2024 09:34:43 +0000
Received: by outflank-mailman (input) for mailman id 771899;
 Mon, 05 Aug 2024 09:34:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4fqT=PE=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sau70-0006jy-0N
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 09:34:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f072fd40-530d-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 11:34:40 +0200 (CEST)
Received: from truciolo.bugseng.com.homenet.telecomitalia.it
 (host-87-20-207-105.retail.telecomitalia.it [87.20.207.105])
 by support.bugseng.com (Postfix) with ESMTPSA id 36D214EE0758;
 Mon,  5 Aug 2024 11:34:40 +0200 (CEST)
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
X-Inumbo-ID: f072fd40-530d-11ef-bc03-fd08da9f4363
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 2/2] automation/eclair: tag more guidelines as clean
Date: Mon,  5 Aug 2024 11:34:33 +0200
Message-Id: <d552057fece18290c86e082434e3a04c783b4d46.1722842330.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722842330.git.federico.serafini@bugseng.com>
References: <cover.1722842330.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tag more of the accepted guidelines as clean to avoid regressions.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index e7b32773e6..4d0ac94848 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -56,11 +56,14 @@ MC3R1.R9.3||
 MC3R1.R9.4||
 MC3R1.R9.5||
 MC3R1.R10.2||
+MC3R1.R11.6||
 MC3R1.R11.7||
 MC3R1.R11.9||
 MC3R1.R12.5||
 MC3R1.R14.1||
+MC3R1.R14.3||
 MC3R1.R14.4||
+MC3R1.R16.2||
 MC3R1.R16.7||
 MC3R1.R17.1||
 MC3R1.R17.3||
@@ -85,6 +88,7 @@ MC3R1.R21.7||
 MC3R1.R21.8||
 MC3R1.R21.9||
 MC3R1.R21.10||
+MC3R1.R21.11||
 MC3R1.R21.12||
 MC3R1.R21.13||
 MC3R1.R21.19||
-- 
2.34.1


